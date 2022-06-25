const expressJwt = require('express-jwt')
const db = require("../models");
const Users = db.users
const Roles = db.roles
const Menus = db.menus
const rolesMenus = db.rolesMenus
const logger = require("./utils.logger");
const chalk = require("chalk");
/**
 * token验证函数
 *
 * @param  {[type]}   req  请求对象
 * @param  {[type]}   res  响应对象
 * @param  {Function} next 传递事件函数
 */
exports.tokenAuth = expressJwt({
    secret: process.env["SIGN_KEY"],
    algorithms: ['HS256'],
    credentialsRequired: true, //对没有携带token的 接口也抛出错误
})
/**
 * 接口权限验证函数
 *
 * @param  {[type]}   req  请求对象
 * @param  {[type]}   res  响应对象
 * @param  {Function} next 传递事件函数
 */

//角色和菜单是多对多的
//addTags、getTags、setTags 操作中间表的方法 会自动创建
Roles.belongsToMany(Menus, {
    through: {
        model: rolesMenus,
        unique: false,
    }, foreignKey: 'roleId',
});
//addArticle、getArticle、setArticle
Menus.belongsToMany(Roles, {
    through: {
        model: rolesMenus,
        unique: false,
    }, foreignKey: 'menuIds',
});

exports.permissionAuth = (req, res, next) => {
    // console.log('**********',req.user)
    // {
    //     username: 'editor',
    //     password: '123456',
    //     admin: true,
    //     iat: 1653796175,
    //     exp: 1654055375
    // }
    const userInfo = req.user
    const reqPath = `${req.method} ${req.baseUrl}`
    try {
        //查询该用户信息
        Users.findOne({where: {username: userInfo.username}}).then(singUser => {
            let pm = {
                where: {id: singUser.roleId},
                raw: false, //是否开启原生查询   true 结果：tag.tag_name  false 结果：'tag':{"tag_name": "标签",}
                include: [
                    {model: Menus},
                ]
            }
            Roles.findOne(pm).then(singRole => {
                let userMenus = singRole.menus || []
                let preMenus = []
                //整理用户所有权限标识 ["POST /api/..."]
                for (const userMenu of userMenus) {
                    if (userMenu.authority) {
                        preMenus.push(userMenu.authority)
                    }
                }
                //用户请求的该接口是否有权限访问
                if (!preMenus.includes(reqPath)){
                    logger.error(`【未通过】 ${userInfo.username} 请求 ${req.method} ${req.baseUrl + req.path} *** 权限未验证通过`);
                    res.sendResultAto('', 604, '未有该接口权限访问,请重新配置该用户权限')
                }
                // res.status(200).sendResultAto(reqPath, 200, '权限验证通过')
                console.log(chalk.bold.green(`【通过】 ${userInfo.username} 请求 ${req.method} ${req.baseUrl + req.path} *** 权限验证通过`));
                next()
            })
        })
        // next()
    } catch(err){
        //在此处理错误
        logger.error(`${userInfo.username} 请求 ${req.method} ${req.baseUrl + req.path} *** 权限未验证通过`);
        res.status(401).sendResultAto(err, 401, '接口权限验证错误')
    }


}

