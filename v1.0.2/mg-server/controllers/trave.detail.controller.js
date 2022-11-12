const db = require("../models");
const logger = require("../utils/utils.logger");
const DAO = require("../dao/DAO");
const TravelDetail = db.travelDetail;
const Op = db.Op;

// Create and Save a new TravelDetail
exports.createDetail = (req, res) => {
    const pm = req.body
    if (!pm.travel_id) return res.sendResultAto(null, 605, '行程id不能为空')
    if (!pm.planDate) return res.sendResultAto(null, 605, '行程时间不能为空')
    // Create a TravelDetail
    const travelDetail = {
        travel_id: pm.travel_id,
        planDate: pm.planDate,
        latitude: pm.latitude,
        longitude: pm.longitude,
        duration: pm.duration,
        city: pm.city,
        isDone: pm.isDone,
        mark: pm.mark || '',
        planTxt: pm.planTxt || '',
        planImgs: pm.planImgs || '',
    };
    TravelDetail.create(travelDetail).then(singleTravelDetail=>{
        res.sendResultAto(singleTravelDetail,200,'添加成功！')
    }).catch(err=>{
        console.log(err)
    })
};

// Retrieve all TravelDetail from the database.
exports.findAllDetail = (req, res) => {
    const pm = req.body;

    DAO.list(TravelDetail, pm, list => {
        res.sendResult(list)
    })
};

// Find a single TravelDetail with an id
exports.findOneDetail = (req, res) => {
    const pm = req.body;
    DAO.findOne(TravelDetail,pm,data=>{
        res.sendResult(data)
    })
};

// Update a TravelDetail by the id in the request
exports.updateDetail = (req, res) => {
    const pm = req.body;
    // 请求验证
    DAO.update(TravelDetail,pm,{id:pm.id},data=>{
        res.sendResult(data)
    })
};

// Delete a TravelDetail with the specified id in the request
exports.deleteDetail = (req, res) => {
    const pm = req.body;
    // 请求验证
    if (!pm.id)  return res.sendResult({data: '', code: 605, message: "ID不能为空！"})
    DAO.delete(TravelDetail,{id:pm.id},data=>{
        res.sendResult(data)
    })
};



