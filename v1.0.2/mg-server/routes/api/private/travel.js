const express = require('express');
const router = express.Router();
const travel = require("../../../controllers/travel.controller");
const travelDetail = require("../../../controllers/trave.detail.controller");

/**
 * 创建关于旅行轨迹信息
 * @route POST /api/private/travel/create
 * @group 关于旅行轨迹管理 - Operations travel travel
 * @param {string} travel_content - 请输入关于旅行轨迹内容
 * @returns {object} 200 - An array of travel info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */

router.post("/create", travel.create);

/**
 * 删除关于旅行轨迹信息
 * @route POST /api/private/travel/delete
 * @group 关于旅行轨迹管理 - delete of travel
 * @param {number} id - 请输入关于旅行轨迹ID
 * @param {string} authorization - 请输入token
 * @returns {object} 200 - An array of travel info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/delete", travel.delete);
/**
 * 查询关于旅行轨迹信息列表
 * @route POST /api/private/travel/list
 * @group 关于旅行轨迹管理 - list of travel
 * @param {object} query - 请按固定查询规范
 * @returns {object} 200 - An array of travel info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/list", travel.findAll);
/**
 * 更新关于旅行轨迹信息列表
 * @route POST /api/private/travel/update
 * @group 关于旅行轨迹管理 - list of travel
 * @param {string} travel_content - 请输入关于旅行轨迹内容
 * @returns {object} 200 - An array of travel info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/update", travel.update);

/**
 * 更新关于旅行轨迹信息列表
 * @route POST /api/private/travel/findOne
 * @group 关于旅行轨迹管理 - list of travel
 * @param {string} id - 请输入关于旅行轨迹id
 * @returns {object} 200 - An array of travel info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/findOne", travel.findOne);



/**
 * 创建关于旅行轨迹信息
 * @route POST /api/private/travel/createDetail
 * @group 关于旅行轨迹管理 - Operations travel travel
 * @param {string} travel_content - 请输入关于旅行轨迹内容
 * @returns {object} 200 - An array of travel info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */

router.post("/createDetail", travelDetail.createDetail);


/**
 * 删除关于旅行轨迹信息
 * @route POST /api/private/travel/deleteDetail
 * @group 关于旅行轨迹管理 - delete of travel
 * @param {number} id - 请输入关于旅行轨迹ID
 * @param {string} authorization - 请输入token
 * @returns {object} 200 - An array of travel info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/deleteDetail", travelDetail.deleteDetail);
/**
 * 查询关于旅行轨迹信息列表
 * @route POST /api/private/travel/listDetail
 * @group 关于旅行轨迹管理 - list of travel
 * @param {object} query - 请按固定查询规范
 * @returns {object} 200 - An array of travel info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/listDetail", travelDetail.findAllDetail);
/**
 * 更新关于旅行轨迹信息列表
 * @route POST /api/private/travel/updateDetail
 * @group 关于旅行轨迹管理 - list of travel
 * @param {string} travel_content - 请输入关于旅行轨迹内容
 * @returns {object} 200 - An array of travel info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/updateDetail", travelDetail.updateDetail);

/**
 * 更新关于旅行轨迹信息列表
 * @route POST /api/private/travel/findOneDetail
 * @group 关于旅行轨迹管理 - list of travel
 * @param {string} id - 请输入关于旅行轨迹id
 * @returns {object} 200 - An array of travel info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/findOneDetail", travelDetail.findOneDetail);

module.exports = router;
