//模型创建 https://www.sequelize.com.cn/core-concepts/model-basics#%E5%AD%97%E7%AC%A6%E4%B8%B2

//关于旅行轨迹信息
module.exports = (sequelize, Sequelize) => {
    return sequelize.define("travel_detail",
        {
            id: {
                type: Sequelize.UUID,
                notNull: true,
                primaryKey: true,
                defaultValue: Sequelize.UUIDV4 // 或 DataTypes.UUIDV1
            },
            travel_id: {
                type: Sequelize.STRING,
                notNull: true,
                notEmpty: true,
                comment: '旅行id',
            },
            city: {
                type: Sequelize.STRING,
                comment: '地点',
            },
            latitude: {
                type: Sequelize.STRING,
                comment: '经度',
            },
            longitude: {
                type: Sequelize.STRING,
                comment: '纬度',
            },
            planDate: {
                type: Sequelize.STRING,
                notEmpty: true,
                notNull: true,
                comment: '旅行计划日期',
            },
            duration: {
                type: Sequelize.STRING,
                comment: '持续时间',
            },
            isDone: {
                type: Sequelize.BOOLEAN,
                notNull: true,
                notEmpty: true,
                comment: '是否完成',
                defaultValue: false
            },
            planTxt: {
                type: Sequelize.TEXT("long"),
                comment: '计划内容',
            },
            planImgs: {
                type: Sequelize.TEXT("long"),
                comment: '照片',
            },
            mark: {
                type: Sequelize.TEXT("long"),
                comment: '备注',
            },

        }, {
            tableName: 'mg_travel_detail'
        });
};
