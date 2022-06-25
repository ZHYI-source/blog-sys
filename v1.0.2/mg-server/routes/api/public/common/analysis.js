const express = require('express');
const router = express.Router();
const db = require("../../../../models");
// const sequelize = db.sequelize;
// const {Op} = require("sequelize");
const path = require("path");
const xlsx = require('node-xlsx').default


/**
 * 导入excel文件进行入库
 * @route POST /api/public/common/excelToRaw/import
 * @group Client 客户端 - list of sort
 * @param {object} query - 请按固定查询规范
 * @returns {object} 200 - An array of Friends info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
// router.post("/importExcel", (req, res) => {
//     const pm = req.body;
//     const filePath = path.resolve(process.cwd(), `uploads_files/analysis.xlsx`);
//     // 读取Excel
//     // 表名 列标题 数据
//     let exceldata = xlsx.parse(filePath)
//     console.log('导入调试', exceldata[0].data)
//     res.send({data: '导入成功！', code: 200})
// });

/**
 *@author ZY
 *@date 2022/3/6 17:58
 *@Description:下载excel文件模板接口
 *@params {name} string 文件名称带有后缀名
 */

router.get("/downloadTemplate",
    async (req, res, next) => {
        try {
            // let name = req.query.name
            let url = path.resolve(process.cwd(), `uploads_files/analysis.xlsx`);
            res.download(url)
        } catch (err) {
            logger.error('/download => err:', err);
            next(err)
        }
    })

module.exports = router;
