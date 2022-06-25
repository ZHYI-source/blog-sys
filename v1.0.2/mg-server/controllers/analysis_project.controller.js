const db = require("../models");
const logger = require("../utils/utils.logger");
const DAO = require("../dao/DAO");
const analysisProject = db.analysisProject;
const Op = db.Op;

// Create and Save a new analysisProject
exports.create = (req, res) => {
    const pm = req.body;
    if (!pm.pro_title) return res.sendResultAto(null,605,'项目组名称不能为空')
    // Create a analysisProject
    const proAnalysis = {
        pro_title: pm.pro_title,
    };
    analysisProject.create(proAnalysis).then(singleanalysisProject=>{
        res.sendResultAto(singleanalysisProject,200,'添加成功！')
    }).catch(err=>{
        console.log(err)
    })
};

// Retrieve all analysisProject from the database.
exports.findAll = (req, res) => {
    const pm = req.body;

    DAO.list(analysisProject, pm, list => {
        res.sendResult(list)
    })
};

// Find a single analysisProject with an id
exports.findOne = (req, res) => {
    const pm = req.body;
    DAO.findOne(analysisProject,pm,data=>{
        res.sendResult(data)
    })
};

// Update a analysisProject by the id in the request
exports.update = (req, res) => {
    const pm = req.body;
    // 请求验证
    DAO.update(analysisProject,pm,{id:pm.id},data=>{
        res.sendResult(data)
    })

};

// Delete a analysisProject with the specified id in the request
exports.delete = (req, res) => {
    const pm = req.body;
    // 请求验证
    if (!pm.id)  return res.sendResult({data: '', code: 605, message: "ID不能为空！"})
    DAO.delete(analysisProject,{id:pm.id},data=>{
        res.sendResult(data)
    })

};



