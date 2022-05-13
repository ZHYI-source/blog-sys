const express = require('express');
const router = express.Router();
const indexCon = require("../../../../controllers/home.controller");

/**
 * 查询当天的留言信息通知
 * @route POST /api/private/home/queryNowMsgAndComments
 * @group 主页管理 - list of about
 * @param {object} query - 请按固定查询规范
 * @returns {object} 200 - An array of about info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/queryNowMsgAndComments", indexCon.queryNowMsgAndComments);


module.exports = router;
