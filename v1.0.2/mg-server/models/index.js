const fs = require("fs");
const path = require("path");
const dbConfig = require("../config/db.config.js");
const _ = require('lodash');
const Sequelize = require("sequelize");
const {Op} = require("sequelize");
const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
    host: dbConfig.HOST,
    dialect: dbConfig.dialect,
    operatorsAliases: false,
    timezone: '+08:00', //东八时区
    pool: {
        max: dbConfig.pool.max,
        min: dbConfig.pool.min,
        acquire: dbConfig.pool.acquire,
        idle: dbConfig.pool.idle
    }
});

const db = {};

db.Sequelize = Sequelize;//引入
db.sequelize = sequelize;//实例
db.Op = Op; //操作符


//菜单
db.menus = require("./menus.model")(sequelize, Sequelize);
//角色
db.roles = require("./roles.model.js")(sequelize, Sequelize);
//角色-菜单
db.rolesMenus = require("./roles_menus.model.js")(sequelize, Sequelize);

//用户
db.users = require("./users.model.js")(sequelize, Sequelize);
//访客
db.visitor = require("./visitor.model.js")(sequelize, Sequelize);

//站点信息
db.website = require("./website.model.js")(sequelize, Sequelize);
//社交方式
db.socials = require("./socials.model.js")(sequelize, Sequelize);
//关于博主
db.about = require("./about.model.js")(sequelize, Sequelize);
//标签
db.tags = require("./tags.model")(sequelize, Sequelize);
//评论
db.comments = require("./comments.model")(sequelize, Sequelize);
//博文
db.article = require("./article.model")(sequelize, Sequelize);
db.ArticleTags = require("./article_tags.model")(sequelize, Sequelize);

//分类
db.cate = require("./sort.model")(sequelize, Sequelize);

//友链
db.friends = require("./friend.model")(sequelize, Sequelize);
//留言
db.message = require("./message.model")(sequelize, Sequelize);
//音乐
db.music = require("./music.model")(sequelize, Sequelize);

//excel表格数据分析
db.analysis = require("./analysis.model")(sequelize, Sequelize);
//excel表格数据分析-项目组
db.analysisProject = require("./analysis_project.model")(sequelize, Sequelize);

//我的世界-旅游轨迹
db.travel = require("./travel.model")(sequelize, Sequelize);
//我的世界-旅游计划详情
db.travelDetail = require("./travel_detail.model")(sequelize, Sequelize);

//各个表的应用关系

module.exports = db;
