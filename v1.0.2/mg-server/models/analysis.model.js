//模型创建 https://www.sequelize.com.cn/core-concepts/model-basics#%E5%AD%97%E7%AC%A6%E4%B8%B2

//关于博主信息
module.exports = (sequelize, Sequelize) => {
    return sequelize.define("analysis",
        {
            id: {
                type: Sequelize.UUID,
                notNull: true,
                primaryKey: true,
                defaultValue: Sequelize.UUIDV4 // 或 DataTypes.UUIDV1
            },
            pid: {
                type: Sequelize.STRING,
                notEmpty: false,
                notNull: false,
                comment: '父级ID',
            },
            axi_x: {
                type: Sequelize.STRING,
                notEmpty: false,
                notNull: false,
                comment: 'GST',
            },
            axi_y: {
                type: Sequelize.FLOAT,
                notEmpty: false,
                notNull: false,
                comment: '平均数',
            },
            axi_y_a: {
                type: Sequelize.FLOAT,
                notEmpty: false,
                notNull: false,
                comment: '标准误',
            },
            remark: {
                type: Sequelize.STRING,
                notEmpty: false,
                notNull: false,
                comment: '备注',
            },

        }, {
            tableName: 'mg_analysis'
        });
};
