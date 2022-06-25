const express = require('express');
const router = express.Router();
const Visitor = require("../../../controllers/visitor.controller");

/**
 * 创建关于访客信息
 * @route POST /api/private/visitor/create
 * @group 关于访客管理 - Operations visitor visitor
 * @param {string} visitor_content - 请输入关于访客内容
 * @returns {object} 200 - An array of visitor info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */

router.post("/create", Visitor.create);
 
/**
 * 查询关于访客信息列表
 * @route POST /api/private/visitor/list
 * @group 关于访客管理 - list of visitor
 * @param {object} query - 请按固定查询规范
 * @returns {object} 200 - An array of visitor info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/list", Visitor.findAll);
/**
 * 更新关于访客信息列表
 * @route POST /api/private/visitor/update
 * @group 关于访客管理 - list of visitor
 * @param {string} visitor_content - 请输入关于访客内容
 * @returns {object} 200 - An array of visitor info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/update", Visitor.update);


module.exports = router;
