const db = require("../models");
const logger = require("../utils/utils.logger");
const DAO = require("../dao/DAO");
const Analysis = db.analysis;
const Op = db.Op;
const xlsx = require('node-xlsx');
const fs = require('fs');
const path = require('path');
const dayjs = require('dayjs')
// Create and Save a new Analysis
exports.create = (req, res) => {
    const pm = req.body;
    if (!pm.axi_x) return res.sendResultAto(null, 605, 'X轴数据不能为空')
    if (!pm.axi_y) return res.sendResultAto(null, 605, 'Y轴数据不能为空')
    // Create a Analysis
    const analysis = {
        axi_x: pm.axi_x,
        axi_y: pm.axi_y,
    };
    Analysis.create(analysis).then(singleAnalysis => {
        res.sendResultAto(singleAnalysis, 200, '添加成功！')
    }).catch(err => {
        console.log(err)
    })
};

// Retrieve all Analysis from the database.
exports.findAll = (req, res) => {
    const pm = req.body;

    DAO.list(Analysis, pm, list => {
        res.sendResult(list)
    })
};

// Find a single Analysis with an id
exports.findOne = (req, res) => {
    const pm = req.body;
    DAO.findOne(Analysis, pm, data => {
        res.sendResult(data)
    })
};

// Update a Analysis by the id in the request
exports.update = (req, res) => {
    const pm = req.body;
    // 请求验证
    DAO.update(Analysis, pm, {id: pm.id}, data => {
        res.sendResult(data)
    })

};

// Delete a Analysis with the specified id in the request
exports.delete = (req, res) => {
    const pm = req.body;
    // 请求验证
    if (!pm.id) return res.sendResult({data: '', code: 605, message: "ID不能为空！"})
    DAO.delete(Analysis, {id: pm.id}, data => {
        res.sendResult(data)
    })
};
// Delete a Analysis with the specified id in the request
exports.deleteAll = (req, res) => {
    const pm = req.body;
    // 请求验证
    if (!pm.pid) return res.sendResult({data: '', code: 605, message: "pid不能为空！"})
    DAO.delete(Analysis, {pid: pm.pid}, data => {
        res.sendResult(data)
    })
};
// 导出
exports.export = (req, res) => {
    const pm = req.body;
    DAO.list(Analysis, pm, list => {
        let arr = [
            ['ID', 'GST', '平均数', '标准误', '备注', '创建时间']
        ]
        // 模板名称
        let name = `数据分析${dayjs().format('YYYY-MM-DD-hh')}.xlsx`
        for (const listElement of list.data.data) {
            let arrItem = []
            arrItem.push(listElement.id)
            arrItem.push(listElement.axi_x)
            arrItem.push(listElement.axi_y)
            arrItem.push(listElement.axi_y_a)
            arrItem.push(listElement.remark)
            arrItem.push(listElement.createdAt)
            arr.push(arrItem)
        }
        let buffer = xlsx.build([{name: '数据', data: arr}]);
        let url = path.resolve(__dirname, `../uploads_files/excel/${name}`);
        console.log(url)
        console.log(__dirname)
        // 如果文件存在，覆盖
        fs.writeFileSync(url, buffer, {'flag': 'w'});
        //下载地址响应出去
        res.sendResultAto({url: `${process.env.DEV_URL}:${process.env.DEV_PORT}/api/public/common/common/download?name=${name}`}, 200, '导出成功')
    })
};

// 导入模板下载
exports.downloadTemplate = (req, res) => {
    try {
        // 模板名称
        let name = `模板${dayjs().format('YYYY-MM-DD-hh')}.xlsx`
        //下载地址响应出去
        let arr = [
            ['GST', '平均数', '标准误', '备注',]
        ]
        //生成excel
        let buffer = xlsx.build([{name: '数据分析模板导入模板', data: arr}]);
        let url = path.resolve(process.cwd(), `uploads_files/excel/${name}`);
        console.log(buffer)
        fs.writeFileSync(url, buffer, {'flag': 'w'}); // 如果文件存在，覆盖
        res.status(200).sendResultAto(
            {url: `${process.env.DEV_URL}:${process.env.DEV_PORT}/api/public/common/common/download?name=${name}`},
            200,
            '模板下载成功')
    } catch (err) {
        res.status(500).sendResultAto(null, 500, '模板下载失败')
    }

};
//批量插入表格数据
const insetExcelData = (data) => {
    return new Promise((resolve, reject) => {
        Analysis.bulkCreate(data).then(_d => {
            resolve(_d)
        }).catch(err => {
            reject(err)
        })
    })
}
// 导入表格数据
exports.importExcel = (req, res) => {
    let pid = req.body.pid || ''
    console.log(pid)
    if (!pid) return res.status(500).sendResult({data: null, code: 500, message: '项目组ID为空'})
    let targetPath = req.file.destination + '/' + req.file.originalname;
    //文件更名
    fs.rename(path.join(process.cwd(), "/" + req.file.path), path.join(process.cwd(), targetPath), function (err) {
        if (err) return res.status(500).sendResult({data: null, code: 500, message: '上传文件失败'})

        //上传的文件地址
        const filePath = path.resolve(process.cwd(), `uploads_files/excel/${req.file.originalname}`);
        // 读取Excel
        // 表名 列标题 数据
        let exceldata = xlsx.parse(filePath)
        //去掉表头标题
        exceldata[0].data.splice(0, 1)
        let excelArr = []
        for (const exceldatum of exceldata[0].data) {
            let obj = {
                axi_x: exceldatum[0],
                axi_y: exceldatum[1],
                axi_y_a: exceldatum[2],
                remark: exceldatum[3],
                pid: pid,
            }
            excelArr.push(obj)
        }
        console.log(excelArr)
        /*
        excelArr：[
            { axi_x: 2, axi_y: 1, remark: '测试' },
            { axi_x: 4, axi_y: 3, remark: undefined },
            { axi_x: 2, axi_y: 3, remark: undefined }
         ]
        * */

        if (!excelArr.length) {
            return res.sendResultAto(null, 605, '不能导入空表格')
        }
        insetExcelData(excelArr).then(_ires => {
            res.sendResultAto(null, 200, '成功导入' + excelArr.length + '条数据')
        }).catch(err => {
            res.sendResultAto(null, 605, '导入失败')
        })
    })
};
