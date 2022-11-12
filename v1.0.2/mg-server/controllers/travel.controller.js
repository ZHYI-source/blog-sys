const db = require("../models");
const logger = require("../utils/utils.logger");
const DAO = require("../dao/DAO");
const Travel = db.travel;
const TravelDetail = db.travelDetail;
const Op = db.Op;

Travel.hasMany(TravelDetail, {foreignKey: 'travel_id', sourceKey: 'id',});
TravelDetail.belongsTo(Travel, {foreignKey: 'travel_id', sourceKey: 'id'});

// Create and Save a new Travel
exports.create = (req, res) => {
    const pm = req.body;
    if (!pm.city) return res.sendResultAto(null, 605, '城市名称不能为空')
    if (!pm.latitude) return res.sendResultAto(null, 605, '经度不能为空')
    if (!pm.longitude) return res.sendResultAto(null, 605, '纬度不能为空')
    if (!pm.img) return res.sendResultAto(null, 605, '城市图片不能为空')
    if (!pm.title) return res.sendResultAto(null, 605, '旅行标题不能为空')
    let dateArr = pm.date || []

    const travel = {
        city: pm.city,
        latitude: pm.latitude,
        longitude: pm.longitude,
        img: pm.img,
        date: '',//废弃
        title: pm.title,
        budget: pm.budget,
    };


    Travel.create(travel).then(singleTravel => {
        //批量创建行程单详细计划
        const travelList = []
        for (const travelElement of dateArr) {
            let obj = {
                travel_id: singleTravel.id,
                planDate: travelElement,
            }
            travelList.push(obj)
        }
        TravelDetail.bulkCreate(travelList).then(_t => {
            res.sendResultAto({singleTravel, _t}, 200, '添加城市成功！')
        }).catch(er => {
            logger.error(JSON.stringify(er))
            console.error(er)
        })
    }).catch(err => {
        console.error(err)
    })
};

// Retrieve all Travel from the database.
exports.findAll = (req, res) => {
    const pm = req.body;

    DAO.list(Travel, pm, list => {
        res.sendResult(list)
    })
};

// Update a Travel by the id in the request
exports.update = (req, res) => {
    const pm = req.body;
    if (pm.date) {
        pm.date = pm.date.toString()
    }
    // 请求验证
    DAO.update(Travel, pm, {id: pm.id}, data => {
        res.sendResult(data)
    })
};

// Delete a Travel with the specified id in the request
exports.delete = (req, res) => {
    const pm = req.body;
    // 请求验证
    if (!pm.id) return res.sendResult({data: '', code: 605, message: "ID不能为空！"})
    DAO.delete(Travel, {id: pm.id}, data => {
        DAO.delete(TravelDetail, {travel_id: pm.id}, data1 => {
            res.sendResult(data)
        })
    })
};
// Find a single Travel with an id
exports.findOne = (req, res) => {
    const pm = req.body;
    Travel.findOne({
        where: {
            id: pm.params.id
        },
        include: {
            model: TravelDetail,

        },
        order: [
            // 我们从要排序的模型开始排序数组  关联的子表排序
            [TravelDetail, 'planDate', 'ASC']
        ]
    }).then(data => {
        res.sendResultAto(data, 200, '查询成功')
    })
};



