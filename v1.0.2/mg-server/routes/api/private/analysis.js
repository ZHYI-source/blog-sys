const express = require('express');
const router = express.Router();
const analysis = require("../../../controllers/analysis.controller");
const path = require("path");
const fs = require("fs");
const xlsx = require('node-xlsx').default
/**
 * 创建关于数据分析信息
 * @route POST /api/private/analysis/create
 * @group 关于数据分析管理 - Operations analysis analysis
 * @param {string} analysis_content - 请输入关于数据分析内容
 * @returns {object} 200 - An array of analysis info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */

router.post("/create", analysis.create);

/**
 * 删除关于数据分析信息
 * @route POST /api/private/analysis/delete
 * @group 关于数据分析管理 - delete of analysis
 * @param {number} id - 请输入关于数据分析ID
 * @param {string} authorization - 请输入token
 * @returns {object} 200 - An array of analysis info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/delete", analysis.delete);
/**
 * 删除关于同一父级数据分析信息
 * @route POST /api/private/analysis/deleteAll
 * @group 关于数据分析管理 - delete of analysis
 * @param {number} id - 请输入关于数据分析ID
 * @param {string} authorization - 请输入token
 * @returns {object} 200 - An array of analysis info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/deleteAll", analysis.deleteAll);
/**
 * 查询关于数据分析信息列表
 * @route POST /api/private/analysis/list
 * @group 关于数据分析管理 - list of analysis
 * @param {object} query - 请按固定查询规范
 * @returns {object} 200 - An array of analysis info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/list", analysis.findAll);
/**
 * 更新关于数据分析信息列表
 * @route POST /api/private/analysis/update
 * @group 关于数据分析管理 - list of analysis
 * @param {string} analysis_content - 请输入关于数据分析内容
 * @returns {object} 200 - An array of analysis info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/update", analysis.update);

/**
 * 导出
 * @route POST /api/private/analysis/exportExcel
 * @group 关于数据分析管理 - list of analysis
 * @param {string} analysis_content - 请输出关于数据分析内容
 * @returns {object} 200 - An array of analysis info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/exportExcel", analysis.export);


/**
 * 模板下载
 * @route POST /api/private/analysis/downloadTemplate
 * @group 关于数据分析管理 - list of analysis
 * @param {string} analysis_content - 请输出关于数据分析内容
 * @returns {object} 200 - An array of analysis info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/downloadTemplate", analysis.downloadTemplate);

/**
 * 导入数据分析信息列表
 * @route POST /api/private/analysis/importExcel
 * @group 导入数据分析管理 - list of analysis
 * @param {object} query - 请按固定查询规范
 * @returns {object} 200 - An array of Friends info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
const multer = require('multer');
// 临时上传目录
let upload = multer({dest: 'uploads_files/excel/'});
router.post("/importExcel",upload.single('file'),analysis.importExcel);

module.exports = router;
