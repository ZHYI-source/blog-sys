const db = require("../models");
const logger = require("../utils/utils.logger");
const DAO = require("../dao/DAO");
const Visitor = db.visitor;
const Op = db.Op;

// Create and Save a new Visitor
exports.create = (req, res) => {
    const pm = req.body;
    if (!pm.about_content) return res.sendResultAto(null,605,'内容不能为空')
    // Create a Visitor
    const about = {
        about_content: pm.about_content,
    };
    Visitor.create(about).then(singleVisitor=>{
        res.sendResultAto(singleVisitor,200,'添加成功！')
    }).catch(err=>{
        console.log(err)
    })
};

// Retrieve all Visitor from the database.
exports.findAll = (req, res) => {
    const pm = req.body;

    DAO.list(Visitor, pm, list => {
        res.sendResult(list)
    })
};

// Find a single Visitor with an id
exports.findOne = (req, res) => {
    const pm = req.body;
    DAO.findOne(Visitor,pm,data=>{
        res.sendResult(data)
    })
};

// Update a Visitor by the id in the request
exports.update = (req, res) => {
    const pm = req.body;
    // 请求验证
    DAO.update(Visitor,pm,{id:pm.id},data=>{
        res.sendResult(data)
    })

};

// Delete a Visitor with the specified id in the request
exports.delete = (req, res) => {
    const pm = req.body;
    // 请求验证
    if (!pm.id)  return res.sendResult({data: '', code: 605, message: "ID不能为空！"})
    DAO.delete(Visitor,{id:pm.id},data=>{
        res.sendResult(data)
    })

};



