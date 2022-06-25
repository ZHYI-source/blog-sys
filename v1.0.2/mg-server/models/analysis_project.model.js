//模型创建 https://www.sequelize.com.cn/core-concepts/model-basics#%E5%AD%97%E7%AC%A6%E4%B8%B2

//关于数据分析项目组
module.exports = (sequelize, Sequelize) => {
    return sequelize.define("proAnalysis",
        {
            id: {
                type: Sequelize.UUID,
                notNull: true,
                primaryKey: true,
                defaultValue: Sequelize.UUIDV4 // 或 DataTypes.UUIDV1
            },
            pro_title: {
                type: Sequelize.STRING,
                notEmpty: false,
                notNull: false,
                comment: '项目组名称',
            },
            remark: {
                type: Sequelize.STRING,
                notEmpty: false,
                notNull: false,
                comment: '备注',
            },

        }, {
            tableName: 'mg_proAnalysis'
        });
};
