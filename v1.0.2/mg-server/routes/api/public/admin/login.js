let express = require('express');
let router = express.Router();
const logger = require("../../../../utils/utils.logger");
const utilTool = require("../../../../utils/utils.tools");
const Login = require("../../../../controllers/login.controller");
/**
 * 登录
 * @route POST /api/public/v1/login
 * @group 登录 - login
 * @param {string} username - 请输入用户名
 * @param {string} password - 请输入密码
 * @returns {object} 200 - token
 * @returns {object} 500 - 登录失败错误
 * @returns {Error}  default - Unexpected error
 */

router.post("/", function (req, res) {
    const pm = req.body;
    // 请求验证+
    if (!pm.username) return res.sendResult({data: '', code: 605, message: "用户名不能为空！"})

    if (!pm.password) return res.sendResult({data: '', code: 605, message: "密码不能为空！"})

    if (!pm.code) return res.sendResult({data: '', code: 605, message: "验证码不能为空！"})

    if (!req.session.code) return res.sendResult({data: '', code: 605, message: "验证码已失效！"})

    if (req.session.code !== pm.code) return res.sendResult({data: '', code: 605, message: "验证码错误！"})

   let clientIp = req.headers['x-forwarded-for'] ||
    req.connection.remoteAddress ||
    req.socket.remoteAddress ||
    req.connection.socket.remoteAddress;

    logger.info(`【IP】${clientIp}【登录】 username:${pm.username}- password:${pm.password}`)

    Login.login(pm, (data, err) => {
        if (err) return res.sendResultAto(null, 401, err)
        //记录访客
        // utilTool.generateVisitorRecord(req)
        res.sendResultAto(data, 200, '登录成功')
    })


});

module.exports = router;
