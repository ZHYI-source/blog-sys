const db = require("../models");
const logger = require("../utils/utils.logger");
const {aes} = require("../utils/utils.crypto");
const DAO = require("../dao/DAO");
const Users = db.users;
const Roles = db.roles;
const Op = db.Op;

Users.hasOne(Roles, {foreignKey: 'id', sourceKey: 'roleId'});
Roles.belongsTo(Users, {foreignKey: 'id', sourceKey: 'roleId'});

// Create and Save a new user
exports.create = (req, res) => {
    const pm = req.body;
    // 请求验证
    if (!req.body.username) return res.sendResult({data: '', code: 605, message: "名称不能为空！"})

    if (!req.body.password) return res.sendResult({data: '', code: 605, message: "密码不能为空！"})

    if (!req.body.roleId) return res.sendResult({data: '', code: 605, message: "角色不能为空！"})

    // Create a user
    const user = {
        username: req.body.username,
        password: req.body.password,
        nickName: req.body.nickName,
        roleId: req.body.roleId,
        state: req.body.state || true,
    };

    Users.findOne({where: {'username': pm.username}}).then(singleUser => {
        if (singleUser && singleUser.id) return res.sendResultAto(null, 605, '用户名已存在！')
        DAO.create(Users, user, data => {
            logger.debug(`${req.method} ${req.baseUrl + req.path} *** 参数：${JSON.stringify(pm)}; 响应：${JSON.stringify(data)}`);
            res.sendResult(data)
        })
    })


};

// Retrieve all user from the database.
exports.findAll = (req, res) => {
    const pm = req.body;
    pm.raw = false //是否开启原生查询   true 结果：tag.tag_name  false 结果：'tag':{"tag_name": "标签",}
    pm.include = [
        {model: Roles, attributes: [['role_name', 'name'], 'id',]},
    ]

    pm.params.nickName ? pm.params.nickName = {
        [Op.substring]: `%${pm.params.nickName}%`
    } : pm.params.nickName = ''

    pm.params.username ? pm.params.username = {
        [Op.substring]: `%${pm.params.username}%`
    } : pm.params.username = ''


    DAO.list(Users, pm, list => {
        res.sendResult(list)
    })
};

// Find a single Users with an id
exports.findOne = (req, res) => {
    const pm = req.body;
    DAO.findOne(Users, pm, data => {
        res.sendResult(data)
    })
};

// Update a Users by the id in the request
exports.update = (req, res) => {
    const pm = req.body;
    // 请求验证
    if (!pm.id) return res.sendResult({data: '', code: 605, message: "ID不能为空！"})
    DAO.update(Users, pm, {id: pm.id}, data => {
        res.sendResult(data)
    })

};
// Update a Users by the id in the request
exports.reset = (req, res) => {
    const pm = req.body;
    // 请求验证
    if (!pm.id) return res.sendResult({data: '', code: 605, message: "ID不能为空！"})
    if (!pm.password) return res.sendResult({data: '', code: 605, message: "password不能为空！"})
    Users.update({password: pm.password}, {
        where: {
            id: pm.id
        }
    }).then(uD => {
        res.status(200).sendResultAto(uD, 200, '重置密码成功')
    }).catch(err => {
        console.log(err)
        res.status(500).sendResultAto(err, 605, '重置错误')
    })

};
// Delete a Users with the specified id in the request
exports.delete = (req, res) => {
    const pm = req.body;
    // 请求验证
    if (!pm.id) return res.sendResult({data: '', code: 605, message: "ID不能为空！"})
    DAO.delete(Users, {id: pm.id}, data => {
        res.sendResult(data)
    })

};

// Delete all Users from the database.
exports.deleteAll = (req, res) => {
    const pm = req.body;
    DAO.deleteAll(Users, data => {
        res.sendResult(data)
    })
};

// Delete Users from the database.
exports.query = (req, res) => {
    const pm = req.body;
    let sql = 'SELECT * FROM `users`'
    DAO.doQuery(sql, data => {
        res.sendResult(data)
    })
};
