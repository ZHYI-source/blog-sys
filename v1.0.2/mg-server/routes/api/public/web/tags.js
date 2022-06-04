const express = require('express');
const router = express.Router();
const Tags = require("../../../../controllers/tags.controller");

 
/**
 * 查询标签信息列表
 * @route POST /api/public/web/tags/list
 * @group 标签管理 - list of tags
 * @param {object} query - 请按固定查询规范
 * @returns {object} 200 - An array of tags info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/list", Tags.findAll);
 
 

module.exports = router;
