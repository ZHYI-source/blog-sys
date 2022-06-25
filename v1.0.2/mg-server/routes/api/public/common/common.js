const express = require('express');
const router = express.Router();
const path = require("path");

/**
 *@author ZY
 *@date 2022/3/6 17:58
 *@Description:下载表格文件接口
 *@params {name} string 文件名称带有后缀名
 */

router.get("/download",
    async (req, res, next) => {
        try {
            let name = req.query.name
            let url = path.resolve(process.cwd(), `uploads_files/excel/${name}`);
            console.log(url)
            res.download(url)
        } catch (err) {
            console.log('下载文件错误')
            next(err)
        }
    })

module.exports = router;
