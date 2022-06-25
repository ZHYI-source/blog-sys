//各种通用工具类

const os = require('os');
const UAParser = require("ua-parser-js");
const db = require("../models");
let {md5} = require("./utils.crypto");
let logger = require("./utils.logger");
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
//时间格式化
Date.prototype.Format = function (fmt) { //author: meizz
    let o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (let k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

const utilsTools = {
    //生成永不重复的id
    createRandomId: () => {
        return md5((new Date()).getTime() + '-' + Math.random().toString().substr(2, 5)
        ).toString()
    },
    //获取实时时间
    getDate: () => {
        return new Date().Format("yyyy-MM-dd hh:mm:ss")
    },
    //对象参数为空就删除该属性
    deleteNullObj: (keywords) => {
        if (!keywords) {
            return keywords
        }
        for (let key in keywords) {
            if (keywords[key] === '') {
                delete keywords[key]
            }
        }
        return keywords
    },
    //扁平数组转换为树形结构
    listToTree: (list) => {
        let map = {}, node, tree = [], i;
        for (i = 0; i < list.length; i++) {
            map[list[i].id] = list[i];
            list[i].children = [];
        }
        for (i = 0; i < list.length; i += 1) {
            node = list[i];
            if (node.pid !== 1) {
                map[node.pid].children.push(node);
            } else {
                tree.push(node);
            }
        }
        return tree;
    },

    //树形结构转换为扁平数组
    treeToList: (tree) => {
        let queen = [];
        let out = [];
        queen = queen.concat(tree);
        while (queen.length) {
            let first = queen.shift();
            if (first.children) {
                queen = queen.concat(first.children)
                delete first['children'];
            }
            out.push(first);
        }
        return out;
    },

    visitorGene: (req, body,ip) => {
        let headersInfo = req.headers
        let pm = req.body

        let u = new UAParser(req.headers['user-agent'])
        let visitor = {
            username: pm.username || 'visitor',
            browser: u.getBrowser().name + '.v' + u.getBrowser().major,
            os: os.type() + os.release() + ' ' + os.arch(),
            type: req.baseUrl.includes('admin') ? 1 : 0, //1 admin 0 client
            ipaddr: ip,
            loginLocation: JSON.parse(body).code === 200 ? JSON.parse(body).data.country + '-' + JSON.parse(body).data.region + '-' + JSON.parse(body).data.city : JSON.parse(body).msg,
        }
        const start = new Date()
        const ms = new Date() - start
        Visitor.create(visitor).then(singleVisitor => {
            logger.info(`访客：${ip} : ${req.method} ${req.url} - ${ms}ms`)
        }).catch(err => {
            logger.error(`访客记录错误：${ip} : ${req.method} ${req.url} - ${ms}ms`)
        })
    },
    //查询当天的访客
    queryFindOne: function (model, pm) {
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
    },
    //更新当天的老访客
    updateVisitorCount: function (model, pm, ip) {
        return new Promise((resolve, reject) => {
            model.update(pm, {
                where: ip
            }).then(data => {
                resolve(data)
            }).catch(err => {
                reject(err)
            })
        })
    },
    //  生成访客记录 获取ip和解析地址
    generateVisitorRecord: function (req,) {
        let that = this
        request(
            `http://pv.sohu.com/cityjson`,
            {method: 'GET',},
            function (error, response, bodys) {
                let ip = JSON.parse(bodys.slice(bodys.indexOf('{'),bodys.indexOf('}')+1)).cip
                let u = new UAParser(req.headers['user-agent'])
                //查询今天之内的访客
                that.queryFindOne(Visitor, {ipaddr: ip}).then(todayVisitor => {
                    if (!todayVisitor) {
                        //当日的新访客
                        request(
                            `https://ipaddquery.api.bdymkt.com/ip/query?ip=${ip}`,
                            options,
                            function (error, response, body) {
                                if (error !== null) {
                                    console.log('error:', error);
                                    logger.error(`访客ip地址解析错误：${ip} : ${req.method} ${req.url}`)
                                    return;
                                }
                                console.log('****',body)
                                that.visitorGene(req, body,ip)
                            })
                    } else {
                        // 老访客不入库 更新当天访问次数
                        that.updateVisitorCount(Visitor, {
                            username: todayVisitor.username || 'visitor',
                            browser: u.getBrowser().name + '.v' + u.getBrowser().major,
                            os: os.type() + os.release() + ' ' + os.arch(),
                            type: req.baseUrl.includes('admin') ? 1 : 0, //1 admin 0 client
                            count: todayVisitor.count + 1
                        }, {
                            ipaddr: todayVisitor.ipaddr,
                            createdAt: todayVisitor.createdAt
                        }).then(update => {
                            console.log('老访客跟新成功')
                        }).catch(err => {
                            console.log('老访客跟新失败', err)
                        })
                    }
                })
            })


    },
}
module.exports = utilsTools
