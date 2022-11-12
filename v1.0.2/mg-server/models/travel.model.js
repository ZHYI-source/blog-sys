//模型创建 https://www.sequelize.com.cn/core-concepts/model-basics#%E5%AD%97%E7%AC%A6%E4%B8%B2

//关于旅行轨迹信息
module.exports = (sequelize, Sequelize) => {
    return sequelize.define("travel",
        {
            id: {
                type: Sequelize.UUID,
                notNull: true,
                primaryKey: true,
                defaultValue: Sequelize.UUIDV4 // 或 DataTypes.UUIDV1
            },
            city: {
                type: Sequelize.STRING,
                notNull: true,
                notEmpty: true,
                comment: '城市名称',
            },
            latitude: {
                type: Sequelize.STRING,
                notNull: true,
                notEmpty: true,
                comment: '经度',
            },
            longitude: {
                type: Sequelize.STRING,
                notNull: true,
                notEmpty: true,
                comment: '纬度',
            },
            title: {
                type: Sequelize.STRING,
                notNull: true,
                notEmpty: true,
                comment: '旅行标题',
            },
            budget: {
                type: Sequelize.DECIMAL(10, 2),
                comment: '旅行预算',
                defaultValue: 0.00
            },
            img: {
                type: Sequelize.TEXT("long"),
                notEmpty: true,
                notNull: true,
                comment: '城市图片',
            },
            date: {
                type: Sequelize.TEXT("long"),
                notEmpty: true,
                notNull: true,
                comment: '旅行时间',
            },
            memoirTxt: {
                type: Sequelize.TEXT("long"),
                comment: '旅行回忆录',
            },
            memoirImgs: {
                type: Sequelize.TEXT("long"),
                comment: '旅行照片',
            },

        }, {
            tableName: 'mg_travel'
        });
};
