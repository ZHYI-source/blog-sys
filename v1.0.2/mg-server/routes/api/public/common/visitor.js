const express = require('express');
const router = express.Router();
const os = require('os');
let logger = require("../../../../utils/utils.logger");
const UAParser = require("ua-parser-js");
const db = require("../../../../models");
const Visitor = db.visitor
let request = require('request');
const sequelize = db.sequelize;
const {Op} = require("sequelize");
let headers = {
    "Content-Type": "application/json;charset=UTF-8",
    "X-Bce-Signature": "AppCode/0658cf6ba73046d39b52b5288f6c956b",
}


let options = {
    method: 'POST',
    headers: headers,
}

const visitorGene = (req, body, ip,params) => {
    let u = new UAParser(req.headers['user-agent'])
    let visitor = {
        username: req.body.username || 'visitor',
        browser: u.getBrowser().name + '.v' + u.getBrowser().major,
        os: os.type() + os.release() + ' ' + os.arch(),
        type: params.type, //1 admin 0 client
        ipaddr: ip,
        loginLocation: JSON.parse(body).code === 200 ? JSON.parse(body).data.country + '-' + JSON.parse(body).data.region + '-' + JSON.parse(body).data.city : JSON.parse(body).msg,
    }
    const start = new Date()
    const ms = new Date() - start
    return new Promise((resolve, reject) => {
        Visitor.create(visitor).then(singleVisitor => {
            resolve({data: singleVisitor, msg: '新访客记录成功'})
            logger.info(`访客：${ip} : ${req.method} ${req.url} - ${ms}ms`)
        }).catch(err => {
            reject({data: err, msg: '访客记录错误'})
            logger.error(`访客记录错误：${ip} : ${req.method} ${req.url} - ${ms}ms`)
        })
    })

}
//查询当天的访客
const queryFindOne = function (model, pm) {
    return new Promise((resolve, reject) => {
        model.findOne({
            where: {
                [Op.and]: [
                    pm,
                    sequelize.where(
                        sequelize.fn('DATE', sequelize.col('createdAt')), // 表对应的字段
                        sequelize.literal('CURRENT_DATE')
                    )
                ]
            },
        }).then(data => {
            resolve(data)
        }).catch(err => {
            reject(err)
        })
    })
}
//更新当天的老访客
const updateVisitorCount = function (model, pm, ip) {
    return new Promise((resolve, reject) => {
        model.update(pm, {
            where: ip
        }).then(data => {
            resolve(data)
        }).catch(err => {
            reject(err)
        })
    })
}
//  生成访客记录 获取ip和解析地址
const generateVisitorRecord = function (req, clientIp,params) {
    let u = new UAParser(req.headers['user-agent'])
    //查询今天之内的访客
    return new Promise((resolve, reject) => {
        queryFindOne(Visitor, {ipaddr: clientIp}).then(todayVisitor => {
            if (!todayVisitor) {
                //当日的新访客
                request(
                    `https://ipaddquery.api.bdymkt.com/ip/query?ip=${clientIp}`,
                    options,
                    function (error, response, body) {
                        if (error !== null) {
                            console.log('error:', error);
                            logger.error(`访客ip地址解析错误：${clientIp} : ${req.method} ${req.url}`)
                            return;
                        }
                        console.log('****', body)
                        visitorGene(req, body, clientIp,params).then(_res => {
                            resolve(_res)
                        }).catch(err => {
                            reject(err)
                        })
                    }).catch(err => {
                    reject(err)
                })
            } else {
                // 老访客不入库 更新当天访问次数
                updateVisitorCount(Visitor, {
                    username: todayVisitor.username || 'visitor',
                    browser: u.getBrowser().name + '.v' + u.getBrowser().major,
                    os: os.type() + os.release() + ' ' + os.arch(),
                    type: params.type, //1 admin 0 client
                    count: todayVisitor.count + 1
                }, {
                    ipaddr: todayVisitor.ipaddr,
                    createdAt: todayVisitor.createdAt
                }).then(update => {
                    resolve({data: update, msg: '老访客更新成功'})
                    console.log('老访客更新成功')
                })
            }
        }).catch(err => {
            reject(err)
        })
    })


}
/**
 * 记录客户的ip
 * @route POST /api/public/common/visitor/record
 * @group Client 客户端 - list of sort
 * @param {object} query - 请按固定查询规范
 * @returns {object} 200 - An array of Friends info
 * @returns {object} 605 - 请求失败
 * @returns {Error}  default - Unexpected error
 */
router.post("/record", (req, res) => {
    const pm = req.body;
    let clientIp = pm.ip
    generateVisitorRecord(req, clientIp,pm).then(_res => {
        res.status(200).send(_res)
    }).catch(err => {
        console.log('******', err)
        res.status(500).send(err)
    })
});


module.exports = router;
