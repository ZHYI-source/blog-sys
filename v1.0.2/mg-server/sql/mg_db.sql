/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : mg_db

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 24/06/2022 20:29:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mg_about
-- ----------------------------
DROP TABLE IF EXISTS `mg_about`;
CREATE TABLE `mg_about`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `about_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于博主内容',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_about
-- ----------------------------
INSERT INTO `mg_about` VALUES ('aec4181a-bcab-4e7f-aa93-189c38a2ca87', '\n> 及时当勉励，岁月不待人。\n\n- Hello，大家好呀，我是“芒果快熟”，是本站的作者。\n:black_nib: 2年前端开发工作经验\n:heart: 喜欢编程\n:airplane: 现居贵阳\n\n- 有啥优化建议或者页面有bug可以反馈给我,联系方式见最下方,感谢！\n- :smile_cat:邮箱：1840354092@qq.com\n\n- :smile_cat:留言：[下方留言板](http://www.zhouyi.run/#/about)\n\n:stuck_out_tongue_winking_eye:欢迎您的来访...\n- ?贴上博客小程序\n![mini.jpg](http://zhouyi.run:5222/api/public/admin/getFiles?id=e51aeec84e5e3c35dd5861223e2b1ce0.jpg&&mimetype=image/jpeg)', '2022-04-23 13:00:29', '2022-05-20 19:31:54');

-- ----------------------------
-- Table structure for mg_analysis
-- ----------------------------
DROP TABLE IF EXISTS `mg_analysis`;
CREATE TABLE `mg_analysis`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级ID',
  `axi_x` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GST',
  `axi_y` float NULL DEFAULT NULL COMMENT '平均数',
  `axi_y_a` float NULL DEFAULT NULL COMMENT '标准误',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mg_analysis
-- ----------------------------
INSERT INTO `mg_analysis` VALUES ('07be5d7b-6d50-4492-a095-e1c375ea4c29', 'd261ee54-80b3-4377-b25b-bc4b078b148c', '氯虫M-M', 737.558, 132.033, NULL, '2022-06-24 18:58:50', '2022-06-24 18:58:50');
INSERT INTO `mg_analysis` VALUES ('1b135bb9-7f24-4bf6-a1f4-00d46b06cef1', '5a068b21-cfc0-4d12-9457-99a5e9409367', '阿维菌素M-D', 895.973, 32.5478, NULL, '2022-06-24 20:25:05', '2022-06-24 20:25:05');
INSERT INTO `mg_analysis` VALUES ('1ea9921f-24d6-478e-806e-0055c05938ec', 'd261ee54-80b3-4377-b25b-bc4b078b148c', 'CKM-D', 124.26, 3.45219, NULL, '2022-06-24 18:58:50', '2022-06-24 18:58:50');
INSERT INTO `mg_analysis` VALUES ('31c64586-c668-4053-bee1-8577bf31dc78', 'd261ee54-80b3-4377-b25b-bc4b078b148c', '阿维菌素M-M', 1221.93, 97.1097, NULL, '2022-06-24 18:58:50', '2022-06-24 18:58:50');
INSERT INTO `mg_analysis` VALUES ('40b46e3b-a6a0-49a0-977c-ee65ced665f2', '5a068b21-cfc0-4d12-9457-99a5e9409367', 'CKM-D', 124.26, 3.45219, NULL, '2022-06-24 20:25:05', '2022-06-24 20:25:05');
INSERT INTO `mg_analysis` VALUES ('485e62f2-9bb8-4883-8ab6-09fd084ac3b2', '5a068b21-cfc0-4d12-9457-99a5e9409367', 'CKM-M', 270.339, 15.207, NULL, '2022-06-24 20:25:05', '2022-06-24 20:25:05');
INSERT INTO `mg_analysis` VALUES ('5a735295-6c7e-4a26-bbd5-8b26452d13d3', 'd261ee54-80b3-4377-b25b-bc4b078b148c', '茚虫威M-M', 1239.35, 35.119, NULL, '2022-06-24 18:58:50', '2022-06-24 18:58:50');
INSERT INTO `mg_analysis` VALUES ('610d4957-8f95-4106-a429-9b4b370433d2', '5a068b21-cfc0-4d12-9457-99a5e9409367', '阿维菌素M-M', 1221.93, 97.1097, NULL, '2022-06-24 20:25:05', '2022-06-24 20:25:05');
INSERT INTO `mg_analysis` VALUES ('6e4412cd-4c58-44f4-a7be-a3895bb70624', '5a068b21-cfc0-4d12-9457-99a5e9409367', '毒死蜱M-M', 551.156, 61.2885, NULL, '2022-06-24 20:25:05', '2022-06-24 20:25:05');
INSERT INTO `mg_analysis` VALUES ('7040987e-5c16-4450-af72-1ba8f4e3acd7', 'd261ee54-80b3-4377-b25b-bc4b078b148c', '茚虫威M-D', 909.13, 28.3813, NULL, '2022-06-24 18:58:50', '2022-06-24 18:58:50');
INSERT INTO `mg_analysis` VALUES ('7ae5e067-a9c7-4423-8ba0-91c5059dbe7e', '5a068b21-cfc0-4d12-9457-99a5e9409367', 'CKM-D', 124.26, 3.45219, NULL, '2022-06-24 20:25:05', '2022-06-24 20:25:05');
INSERT INTO `mg_analysis` VALUES ('81952029-427a-4981-876d-a66c49cccccf', '5a068b21-cfc0-4d12-9457-99a5e9409367', 'CKM-M', 270.339, 15.207, NULL, '2022-06-24 20:25:05', '2022-06-24 20:25:05');
INSERT INTO `mg_analysis` VALUES ('9d0c67bd-7c14-4515-b868-3a734f9d4679', '5a068b21-cfc0-4d12-9457-99a5e9409367', '氯虫M-D', 684.043, 123.451, NULL, '2022-06-24 20:25:05', '2022-06-24 20:25:05');
INSERT INTO `mg_analysis` VALUES ('9e09c242-916d-4b90-bdd0-aea99e5c6be4', 'd261ee54-80b3-4377-b25b-bc4b078b148c', '阿维菌素M-D', 895.973, 32.5478, NULL, '2022-06-24 18:58:50', '2022-06-24 18:58:50');
INSERT INTO `mg_analysis` VALUES ('af54928f-bcbd-46ba-8306-d1eeffeb658e', 'd261ee54-80b3-4377-b25b-bc4b078b148c', '毒死蜱M-D', 799.725, 77.2595, NULL, '2022-06-24 18:58:50', '2022-06-24 18:58:50');
INSERT INTO `mg_analysis` VALUES ('b238cdbf-2612-4dc0-8856-066036f313eb', '5a068b21-cfc0-4d12-9457-99a5e9409367', '毒死蜱M-D', 799.725, 77.2595, NULL, '2022-06-24 20:25:05', '2022-06-24 20:25:05');
INSERT INTO `mg_analysis` VALUES ('b7ee6eb5-6c83-4312-85d8-4ef824d4ff7f', 'd261ee54-80b3-4377-b25b-bc4b078b148c', 'CKM-M', 270.339, 15.207, NULL, '2022-06-24 18:58:50', '2022-06-24 18:58:50');
INSERT INTO `mg_analysis` VALUES ('bc2df17f-2ea8-4207-add8-e9f17641960d', 'd261ee54-80b3-4377-b25b-bc4b078b148c', '氯虫M-D', 684.043, 123.451, NULL, '2022-06-24 18:58:50', '2022-06-24 18:58:50');
INSERT INTO `mg_analysis` VALUES ('c71e94e1-d463-42b0-b3f8-52116f25760c', 'd261ee54-80b3-4377-b25b-bc4b078b148c', 'CKM-M', 270.339, 15.207, NULL, '2022-06-24 18:58:50', '2022-06-24 18:58:50');
INSERT INTO `mg_analysis` VALUES ('d056de02-03de-4671-b8cf-deb707937f8b', 'd261ee54-80b3-4377-b25b-bc4b078b148c', '毒死蜱M-M', 551.156, 61.2885, NULL, '2022-06-24 18:58:50', '2022-06-24 18:58:50');
INSERT INTO `mg_analysis` VALUES ('e4226989-2eeb-42b2-93be-55fb53b25f96', 'd261ee54-80b3-4377-b25b-bc4b078b148c', 'CKM-D', 124.26, 3.45219, NULL, '2022-06-24 18:58:50', '2022-06-24 18:58:50');
INSERT INTO `mg_analysis` VALUES ('e484cd4f-4324-4c1d-bb2f-59b562534499', '5a068b21-cfc0-4d12-9457-99a5e9409367', '茚虫威M-M', 1239.35, 35.119, NULL, '2022-06-24 20:25:05', '2022-06-24 20:25:05');
INSERT INTO `mg_analysis` VALUES ('eab3e06d-5f1e-4af6-8a62-eda3cd636a95', '5a068b21-cfc0-4d12-9457-99a5e9409367', '氯虫M-M', 737.558, 132.033, NULL, '2022-06-24 20:25:05', '2022-06-24 20:25:05');
INSERT INTO `mg_analysis` VALUES ('f29c4a2c-ae07-4c8e-85d6-afdfa569c726', '5a068b21-cfc0-4d12-9457-99a5e9409367', '茚虫威M-D', 909.13, 28.3813, NULL, '2022-06-24 20:25:05', '2022-06-24 20:25:05');

-- ----------------------------
-- Table structure for mg_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `mg_article_tags`;
CREATE TABLE `mg_article_tags`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `article_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章id',
  `tag_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签id',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ArticleTags`(`article_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_article_tags
-- ----------------------------
INSERT INTO `mg_article_tags` VALUES ('09fbb390-9b61-4d10-b930-93ede540b217', '21b9f626-b6e3-4dab-9e04-f088e8d6df03', 'beaea537-24ad-45a1-93e3-cac43f2a735e', '2022-05-09 13:19:58', '2022-05-09 13:19:58');
INSERT INTO `mg_article_tags` VALUES ('103a7063-5721-49ae-8f33-ac1bb311733b', '10486e3a-1579-47f6-a549-671529776450', 'beaea537-24ad-45a1-93e3-cac43f2a735e', '2022-05-26 20:34:13', '2022-05-26 20:34:13');
INSERT INTO `mg_article_tags` VALUES ('1a1cfb39-8dcf-40d3-857a-24350fef06b9', '9ebe1246-c190-41b8-8392-e16cf810f248', '5ebf25ef-93ed-4625-8cb0-b8c185f2ee55', '2022-05-28 19:52:51', '2022-05-28 19:52:51');
INSERT INTO `mg_article_tags` VALUES ('3919dd51-76ba-489d-bef5-41f8cee89f9a', '6c0d32eb-9995-4194-9f99-a718d3ee0ae8', 'beaea537-24ad-45a1-93e3-cac43f2a735e', '2022-05-07 15:30:51', '2022-05-07 15:30:51');
INSERT INTO `mg_article_tags` VALUES ('7339643c-ec23-4e76-9ccf-cb8070a9f6c4', '546ee5a8-ea0f-43bd-92b4-f4d41c545b97', 'bb2bcdff-249d-4663-b95c-426c9e4ac5db', '2022-06-01 17:51:43', '2022-06-01 17:51:43');
INSERT INTO `mg_article_tags` VALUES ('7926aad5-2750-409a-b5a8-f9beffc6cb1b', '49bd5f91-a08a-4548-ae83-f5a66fadcab5', 'beaea537-24ad-45a1-93e3-cac43f2a735e', '2022-05-07 15:45:07', '2022-05-07 15:45:07');
INSERT INTO `mg_article_tags` VALUES ('84e3d084-cc32-4f94-a3ec-0c86049dce47', '1efd6089-a61b-4db7-8808-65a8eea113b3', '141b1b1e-b233-4182-bfb1-876cd88cd690', '2022-04-24 15:54:42', '2022-04-24 15:54:42');
INSERT INTO `mg_article_tags` VALUES ('9a15aca8-c5d7-4d3b-b9e4-628dbbb3010d', '02ace927-8356-4297-8fcd-9db2841309fc', 'beaea537-24ad-45a1-93e3-cac43f2a735e', '2022-05-27 11:39:46', '2022-05-27 11:39:46');
INSERT INTO `mg_article_tags` VALUES ('a4aa6411-5255-41e3-a477-3bbfeb8ccd7e', '7ce524b4-f5a1-47c2-a2b7-0ec09f2d5705', 'bb2bcdff-249d-4663-b95c-426c9e4ac5db', '2022-06-01 17:20:40', '2022-06-01 17:20:40');
INSERT INTO `mg_article_tags` VALUES ('a54a7264-95e4-46b1-bf77-f51bec02f12b', 'f80d786a-b735-42be-abdf-532d93097c17', 'beaea537-24ad-45a1-93e3-cac43f2a735e', '2022-05-08 22:49:13', '2022-05-08 22:49:13');
INSERT INTO `mg_article_tags` VALUES ('bb8b916d-47b1-4c72-bf94-a58cdeda2248', '1c42d541-ed6f-447b-998e-ade64ba10eeb', 'beaea537-24ad-45a1-93e3-cac43f2a735e', '2022-05-07 15:49:12', '2022-05-07 15:49:12');

-- ----------------------------
-- Table structure for mg_articles
-- ----------------------------
DROP TABLE IF EXISTS `mg_articles`;
CREATE TABLE `mg_articles`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sort_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类ID',
  `article_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `article_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `article_cover` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章封面',
  `isPublish` tinyint(1) NULL DEFAULT 1 COMMENT '是否发布',
  `viewsCount` int(11) NULL DEFAULT 0 COMMENT '文章浏览量',
  `commentsCount` int(11) NULL DEFAULT 0 COMMENT '文章评论数',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `article_summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章摘要',
  `isTop` tinyint(1) NULL DEFAULT 0 COMMENT '是否顶置',
  `isHot` tinyint(1) NULL DEFAULT 0 COMMENT '是否火热',
  `isRecommend` tinyint(1) NULL DEFAULT 0 COMMENT '是否推荐',
  `reprint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转载地址',
  `editType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编辑器类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_articles
-- ----------------------------
INSERT INTO `mg_articles` VALUES ('02ace927-8356-4297-8fcd-9db2841309fc', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', 'Sass 在vue中使用', '<h3>安装</h3>\n<pre class=\"language-javascript\"><code>cnpm i sass-loader node-sass --save</code></pre>\n<h3 id=\"设置全局变量\">设置全局变量</h3>\n<h6>vue.config.js 文件内输入</h6>\n<pre class=\"language-javascript\"><code>{\n    css:{ \n        loaderOptions: {\n            // 给 sass-loader 传递选项\n            sass: {\n                prependData:`@import \"public/static/css/varuables\";` //新版 sass-loader\n                data: `@import \"public/static/css/varuables\";` //旧版\n            }\n        }\n    }\n}</code></pre>', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=e52cfbc48528687fd6100e33e40f49ae.jpg&&mimetype=image/jpeg', 1, 20, 1, '2022-05-27 11:39:46', '2022-06-23 12:22:01', 'Sass 在vue中使用', 0, 0, 1, NULL, 'mce');
INSERT INTO `mg_articles` VALUES ('0694183b-538c-4680-9822-399b07fd143f', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', '关于本项目Tinymce报错', '<blockquote>\n<p>关于本项目Tinymce报错：Failed to load <a href=\"https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.9.0/tinymce.min.js\" target=\"_blank\" rel=\"noopener\">https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.9.0/tinymce.min.js</a></p>\n<p>原因：tinymce的镜像在你电脑上运行被和谐了</p>\n</blockquote>\n<h4>解决办法：</h4>\n<blockquote>\n<p><span style=\"font-size: 10pt;\"><strong>本项目v1.0.1版解决方案：</strong></span><span style=\"font-size: 10pt;\"><strong>找到 zy-blog-admin/src/components/Tinymce/index.vue 文件内 ：const tinymceCDN = \'链接\'，替换底部的两个任意链接之一</strong></span></p>\n</blockquote>\n<blockquote>\n<p><span style=\"font-size: 10pt;\"><strong>本项目v1.0.2版解决方案：找到 mg-admin/src/components/Tinymce/index.vue 文件内 ：const tinymceCDN = \'链接\'，替换底部的两个任意链接之一</strong></span></p>\n</blockquote>\n<pre class=\"language-javascript\"><code>镜像1：https://cdnjs.cloudflare.com/ajax/libs/tinymce/6.0.3/tinymce.min.js \n       会部分菜单栏没有需要手动添加，但是ui会发生变化\n\n镜像2：https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.9.0/tinymce.min.js \n       ui界面不会发生变化，不支持中文，原有功能正常使用，\n       界面会弹出报错不支持中文，点击关闭即可</code></pre>\n<ul>\n<li>镜像换上后，重启项目或者刷新页面即可</li>\n</ul>', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=e52cfbc48528687fd6100e33e40f49ae.jpg&&mimetype=image/jpeg', 1, 38, 0, '2022-06-01 17:33:58', '2022-06-23 12:39:30', '关于本项目Tinymce报错', 1, 0, 1, NULL, 'mce');
INSERT INTO `mg_articles` VALUES ('10486e3a-1579-47f6-a549-671529776450', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', '解决 npm install 卡死不动？', '<p><code>npm config set registry https://registry.npm.taobao.org</code></p>', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=5c2fced7c8635dcfc7719a5fd107dfb1.png&&mimetype=image/png', 1, 20, 4, '2022-05-26 20:34:12', '2022-06-20 15:44:13', '解决 npm install 卡死不动？', 0, 0, 1, NULL, 'mce');
INSERT INTO `mg_articles` VALUES ('14b7e534-ef61-4907-a7dc-9349bb1a3481', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', 'vue自定义指令loading', '<h3>效果图预览：</h3>\n<p><img class=\"wscnph\" src=\"http://zhouyi.run:5222/api/public/admin/getFiles?id=f73d4c866347befd90fdf671d9598d88.gif&amp;&amp;mimetype=image/gif\" width=\"869\" height=\"432\" /></p>\n<h3>1.先创建v-loading 组件</h3>\n<pre class=\"language-javascript\"><code>&lt;template&gt;\n    &lt;section id=\"loading\"&gt;\n        &lt;section class=\"loader-container\" :style=\"{width,height}\"&gt;\n            &lt;div class=\"loader-child\"&gt;&lt;/div&gt;\n            &lt;div class=\"loader-child\"&gt;&lt;/div&gt;\n            &lt;div class=\"loader-child\"&gt;&lt;/div&gt;\n            &lt;p class=\"load-text\"&gt;loading...&lt;/p&gt;\n        &lt;/section&gt;\n    &lt;/section&gt;\n&lt;/template&gt;\n\n&lt;script&gt;\n    //加载动画✌\n    export default {\n        name: \"m-loading\",\n        props: {\n            width: {\n                type: String,\n                default() {\n                    return \'60px\'\n                }\n            },\n            height: {\n                type: String,\n                default() {\n                    return \'60px\'\n                }\n            }\n        },\n        computed: {},\n        watch: {}\n    }\n&lt;/script&gt;\n\n&lt;style lang=\"scss\" scoped&gt;\n    #loading {\n        user-select: none;\n        position: absolute;\n        z-index: 999;\n        top: 0;\n        left: 0;\n        right: 0;\n        bottom: 0;\n        background-color: hsla(0,0%,100%,.9);\n        display: flex;\n        align-items: center;\n        justify-content: center;\n        width: 100%;\n        height: 100%;\n        .load-text {\n            font-size: 13px;\n            position: absolute;\n            top: 100%;\n            text-align: center;\n            width: 100%;\n        }\n    }\n\n    .loader-container {\n        perspective: 780px;\n        border-radius: 5px;\n        position: absolute;\n        top: 50%;\n        transform: translateY(-50%);\n\n        .loader-child {\n            position: absolute;\n            width: 100%;\n            height: 100%;\n            box-sizing: border-box;\n            border-radius: 50%;\n            animation: all 1s linear;\n\n            &amp;:nth-of-type(1) {\n                left: 0;\n                top: 0;\n                border-right: 3px solid #f80f00;\n                animation: rotate-one 1.25s linear infinite;\n            }\n\n            &amp;:nth-of-type(2) {\n                left: 0;\n                top: 0;\n                border-right: 3px solid #f80f00;\n                animation: rotate-two 1.05s linear infinite;\n\n            }\n\n            &amp;:nth-of-type(3) {\n                left: 0;\n                top: 0;\n                border-right: 3px solid #f80f00;\n                animation: rotate-three 1.15s linear infinite;\n\n            }\n        }\n\n        /*  开始动画实现 */\n        @keyframes rotate-one {\n            0% {\n                transform: rotateX(35deg) rotateY(-45deg) rotateZ(0deg);\n            }\n            100% {\n                transform: rotateX(35deg) rotateY(-45deg) rotateZ(360deg);\n            }\n        }\n        @keyframes rotate-two {\n            0% {\n                transform: rotateX(50deg) rotateY(10deg) rotateZ(0deg);\n            }\n            100% {\n                transform: rotateX(50deg) rotateY(10deg) rotateZ(360deg);\n            }\n        }\n        @keyframes rotate-three {\n            0% {\n                transform: rotateX(35deg) rotateY(55deg) rotateZ(0deg);\n            }\n            100% {\n                transform: rotateX(35deg) rotateY(55deg) rotateZ(360deg);\n            }\n        }\n\n    }\n&lt;/style&gt;\n</code></pre>\n<p>&nbsp;</p>\n<h3>2.定义全局自定义指令文件</h3>\n<p><img class=\"wscnph\" src=\"http://zhouyi.run:5222/api/public/admin/getFiles?id=7931c0889e1622b5888f04f2ed6fe338.png&amp;&amp;mimetype=image/png\" width=\"344\" height=\"333\" /></p>\n<p><strong>v-loading.js:</strong></p>\n<pre class=\"language-javascript\"><code>import Vue from \'vue\'\n// 引入 loading 组件\nimport Loading from \'../../components/common/m-loading\'\n\nfunction append(el) {\n    el.appendChild(el.instance.$el)\n}\n\nfunction remove(el) {\n    el.removeChild(el.instance.$el)\n}\n\nconst vLoading = {\n    inserted: function (el, binding) {\n        // 创建 loading 组件构造函数\n        const LoadingCtor = Vue.extend(Loading)\n        // new 一个 loading组件实例\n        const loadingInstance = new LoadingCtor()\n        console.log(el)\n        // 组件挂载\n        el.instance = loadingInstance.$mount()\n        console.log(binding.value)\n        // 传入值为 true 时才展示\n        if (binding.value) {\n            // 将组件挂载到绑定指令的元素上\n            append(el)\n        }\n    },\n    update(el, binding) {\n        // 值更新时进行操作\n        if (binding.value !== binding.oldValue) {\n            binding.value ? append(el) : remove(el)\n        }\n    }\n}\n\n\nexport default vLoading;\n</code></pre>\n<p>&nbsp;</p>\n<p><strong>统一导出自定义指令文件 index.js</strong></p>\n<p><strong><img class=\"wscnph\" src=\"http://zhouyi.run:5222/api/public/admin/getFiles?id=0decca32c49171a8110643a8071f6cd6.png&amp;&amp;mimetype=image/png\" width=\"337\" height=\"422\" /></strong></p>\n<p><strong>index.js:</strong></p>\n<pre class=\"language-javascript\"><code>import copy from \'./v-copy\';\nimport vHighlight from \'./v-heightlight\';\nimport loading from \'./v-loading\';\n// 自定义指令\nconst directives = {\n  copy,\n  vHighlight,\n  loading\n};\n// 这种写法可以批量注册指令\nexport default {\n  install(Vue) {\n    Object.keys(directives).forEach((key) =&gt; {\n      Vue.directive(key, directives[key]);\n    });\n  },\n};\n</code></pre>\n<h3>3.在main.js文件注册自定义函数</h3>\n<pre><code>import directives from \'./utils/directives/index\';</code><br /><code>Vue.use(directives);</code></pre>\n<p>&nbsp;</p>\n<h3>4.使用：</h3>\n<pre><code>&lt;div class=\"test\" v-loading=\"true\"&gt;&lt;/div&gt;</code></pre>', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=8c82cc895bcef92cefc3f2c2d3c83642.png&&mimetype=image/png', 1, 113, 7, '2022-05-27 10:43:25', '2022-06-23 12:40:06', 'vue自定义指令loading,并且挂载到自定义元素上', 1, 0, 1, NULL, 'mce');
INSERT INTO `mg_articles` VALUES ('1c42d541-ed6f-447b-998e-ade64ba10eeb', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', 'navicat建立数据库 运行sql文件 加载数据表', '<h3 style=\"text-align: center;\">&nbsp;</h3>\n<h3 style=\"text-align: center;\">1.打开navicat-新建连接-输入主机、用户名和密码</h3>\n<p style=\"text-align: center;\">&nbsp;</p>\n<p style=\"text-align: center;\"><img class=\"wscnph\" src=\"http://zhouyi.run:5220/zy-server/public/images?id=1648173008124579f0cf5fc692.png\" width=\"780\" height=\"440\" /></p>\n<p style=\"text-align: center;\">&nbsp;</p>\n<h3 style=\"text-align: center;\">2.点击测试连接-（连接成功）-点击确认-点击确认</h3>\n<p style=\"text-align: center;\">&nbsp;</p>\n<p style=\"text-align: center;\"><img class=\"wscnph\" src=\"http://zhouyi.run:5220/zy-server/public/images?id=164817319119320d02606d88f6.png\" width=\"780\" height=\"429\" /></p>\n<h3 style=\"text-align: center;\">3.找到左侧边栏-本地连接-双击变成绿色-右键-新建数据库-点击确认</h3>\n<p style=\"text-align: center;\"><img class=\"wscnph\" src=\"http://zhouyi.run:5220/zy-server/public/images?id=1648173454209312d3cccfa3c7.png\" width=\"780\" height=\"439\" /></p>\n<h3 style=\"text-align: center;\">4.找到左边栏-本地连接-zy_blog数据库并且双击变绿色-右键-运行sql文件-选择文件-开始-&lsquo;Finished successfully&rsquo;</h3>\n<h3 style=\"text-align: center;\">&nbsp; &nbsp;表示已经导入成功-点击表右键-刷新</h3>\n<p style=\"text-align: center;\">注：sql文件 就是 <a href=\"https://gitee.com/Z568_568/all-blog-sys/blob/master/zy-blog-server/sql/zy-blog.sql\">all-blog-sys/zy-blog-server/sql/zy-blog.sql</a></p>\n<p style=\"text-align: center;\"><img class=\"wscnph\" src=\"http://zhouyi.run:5220/zy-server/public/images?id=1648173620515f9af0294c537.png\" width=\"780\" height=\"417\" /></p>\n<p style=\"text-align: center;\"><img class=\"wscnph\" src=\"http://zhouyi.run:5220/zy-server/public/images?id=1648173992249c352d692c1bb9.png\" width=\"780\" height=\"427\" /></p>\n<p style=\"text-align: center;\"><img class=\"wscnph\" src=\"http://zhouyi.run:5220/zy-server/public/images?id=1648173992254e0b275673f46b.png\" width=\"780\" height=\"381\" /></p>\n<p style=\"text-align: center;\"><img class=\"wscnph\" src=\"http://zhouyi.run:5220/zy-server/public/images?id=1648173992274103537037c3d7.png\" width=\"780\" height=\"342\" /></p>\n<p style=\"text-align: center;\"><img class=\"wscnph\" src=\"http://zhouyi.run:5220/zy-server/public/images?id=164817399227760f94f7c19d8d.png\" width=\"780\" height=\"456\" /></p>\n<p><img class=\"wscnph\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://zhouyi.run:5220/zy-server/public/images?id=1648173992313d5844d992313b.png\" width=\"780\" height=\"375\" /></p>', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=91f474709357de6045d2ab4d2043e107.png&&mimetype=image/png', 1, 139, 5, '2022-05-07 15:49:12', '2022-06-23 12:22:15', '\"navicat建立数据库 运行sql文件 加载数据表\"', 0, 0, 1, NULL, 'mce');
INSERT INTO `mg_articles` VALUES ('1efd6089-a61b-4db7-8808-65a8eea113b3', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', 'JavaScript在不断地升级迭代', '> 也许你我素未谋面，但很可能相见恨晚，我是前端芒果\n\n### 前言:black_nib:\nJavaScript在不断地升级迭代，越来越多的新特性让我们的代码写起来变得简洁有趣，这篇文章会介绍5个新特性，一起研究一下把。\n### 1.# 使用\"Object.hasOwn\"替代“in”操作符:black_nib:\n有时，我们想知道对象上是否存在某个属性，一般会使用“in”操作符或“obj.hasOwnProperty”，但它们都有各自的缺陷。\n``` js\nconst Person = function (age) {\n  this.age = age\n}\nPerson.prototype.name = \'fatfish\'\n\nconst p1 = new Person(24)\nconsole.log(\'age\' in p1) // true \nconsole.log(\'name\' in p1) // true  注意这里\n```\n**hasOwnProperty** 方法会返回一个布尔值，表示对象自身属性中是否具有对应的值（原型链上的属性不会读取）。\n``` js\nObject.create(null).hasOwnProperty(\'name\')\n```\n### 2.# 使用\"#\"声明私有属性:black_nib:\n内容\n\n### 最后 :black_nib:\n希望能一直给大家分享实用、基础、进阶的知识点，一起早早下班', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=071269d9793c59c52722df38329cf1dc.jpg&&mimetype=image/jpeg', 1, 89, 0, '2022-04-24 15:54:42', '2022-06-20 23:50:52', '\"JavaScript在不断地升级迭代\"', 0, 0, 1, NULL, 'md');
INSERT INTO `mg_articles` VALUES ('21b9f626-b6e3-4dab-9e04-f088e8d6df03', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', '测试的啊', '<pre class=\"language-javascript\"><code> changeType(val){\n      if (val.index===\'1\'){\n        this.form.editType = \'mce\'\n      }else {\n        this.form.editType = \'md\'\n      }\n    },\n    headerUpdate() {\n      if (this.updateData &amp;&amp; this.updateData.id) {\n        this.form = this.updateData\n        this.activeName = this.form.editType || \'md\'\n        let arr = []\n        //转换一下回填v-selectpage\n        for (const argument of this.updateData.tags) {\n          arr.push(argument.tagId)\n        }\n        this.form.tag_ids = arr.join(\",\")\n\n        this.isAdd = false\n      }\n    },\n    save() {\n      let that = this\n      this.$refs[\'formAdd\'].validate((valid) =&gt; {\n        if (valid) {\n          let _FUC = \'\'\n          _FUC = this.isAdd ? dirArticleCreate : dirArticleUpdate\n          if (this.isAdd&amp;&amp;!this.form.article_summary){\n            this.form.article_summary = this.form.article_title\n          }\n          this.form.editType = this.activeName\n          _FUC(this.form).then(res =&gt; {\n            that.$message.success(\'修改成功\')\n            that.$emit(\'close\');\n          }).catch(err =&gt; {\n            console.log(err)\n            return that.$message.error(err.msg)\n          })\n\n        } else {\n          console.log(\'error submit!!\');\n          return false;\n        }\n      });\n    },\n    close(show) {\n      if (show) {\n        this.$toast.confirmSave().then(() =&gt; {\n          this.$emit(\'close\');\n        });\n      } else {\n        this.$emit(\'close\');\n      }\n    }\n  }</code></pre>', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=e52cfbc48528687fd6100e33e40f49ae.jpg&&mimetype=image/jpeg', 1, 222, 12, '2022-05-09 13:19:58', '2022-06-23 12:22:05', '测试的啊', 0, 0, 1, 'http://www.zhouyi.run/#/', 'mce');
INSERT INTO `mg_articles` VALUES ('32c92b62-c52d-46fc-bb1f-0d067dfec0dc', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', '分享12个有用的网站工具', '> 今天，我想跟大家分享12个有用的网站工具，其中包括视频、音频编辑、文案写作、设计工具、浏览器应用程序等，这些工具可以使你的工作效率飙升，让你的工作生活更轻松。\n\n\n# 01s、Vocalremover \n\n======================\n\n网址：[https://vocalremover.org/](https://vocalremover.org/)  \n\n![图片](https://mmbiz.qpic.cn/mmbiz_jpg/eXCSRjyNYcZ8UZDnSmxMPIf2KNIUgyTXn1F5G8r3nLFC6MKAq8ycgR8bLWC0KDgKmMYlBxQj4gw17PxXppz3Nw/640?wx_fmt=jpeg)\n\n它通过强大的人工智能算法将音乐与人声分离，此网站还允许我们在不影响速度的情况下更改音频高低。\n\n**02、Unscreen**\n===============\n\n网址：[https://www.unscreen.com/](https://www.unscreen.com/)\n\n![图片](https://mmbiz.qpic.cn/mmbiz_png/eXCSRjyNYcZ8UZDnSmxMPIf2KNIUgyTXoACH6ibSDOw9lDkRH3wIFX1SlWWvsALxeKqrQg6rBTJUpIMVZiblo2Qg/640?wx_fmt=png)\n\n这是一个简单的可以更换或者删除视频背景的工具。通过使用 Unscreen，我们可以轻松删除或更改任何视频或 GIF 的背景。\n\n**03、Smartmockups**\n===================\n\n网址：[https://smartmockups.com/zh](https://smartmockups.com/zh)\n\n![图片](https://mmbiz.qpic.cn/mmbiz_png/eXCSRjyNYcZ8UZDnSmxMPIf2KNIUgyTXFPYZElm2n5zAibpuibKBOfAVBe4swHeJHZfxzGoibp3n2EiaSAYL8yjvjg/640?wx_fmt=png)\n\nSmartmockups是一个网络应用程序，网站上有很多演示文稿、网站演示模板、社交媒体活动、作品集等高质量的样机模型。\n\n**04、Panzoid**\n==============\n\n网址：[https://panzoid.com/](https://panzoid.com/)\n\n![图片](https://mmbiz.qpic.cn/mmbiz_png/eXCSRjyNYcZ8UZDnSmxMPIf2KNIUgyTXwuaZwUW0EOApK3CuLcHMjPIPh65g0WfWK2G9HqTos69oNN5MtPwHmw/640?wx_fmt=png)\n\n网站上有很多视频素材，可以用于视频创作时候的视频介绍、结尾或片尾素材资源。\n\n**05、Midomi**\n=============\n\n网址：[https://www.midomi.com/](https://www.midomi.com/)  \n\n![图片](https://mmbiz.qpic.cn/mmbiz_png/eXCSRjyNYcZ8UZDnSmxMPIf2KNIUgyTX2ItakSSMvb2nffKO4zhZ84oGrqGyibrUf86icVcxjPfA2IBeibFtclwtg/640?wx_fmt=png)\n\n这个网站有趣的地方是，我们只要知道歌词，网站就会帮我们找到相应的歌曲。\n\n**06、Kamua.com**\n================\n\n网址：[https://kamua.com/](https://kamua.com/) \n\n![图片](https://mmbiz.qpic.cn/mmbiz_png/eXCSRjyNYcZ8UZDnSmxMPIf2KNIUgyTXZNua52FfCI4FicuBOBIcwKt3O0xNfSPeia6Khw6fDpH5D7eWXibiaiad8Gg/640?wx_fmt=png)\n\n如果我们为视频调整大小、剪切和添加字幕，此工具是必备工具。使用这款智能工具将任何横板视频转换为动态竖版视频。\n\n**07、Justtherecipe**\n====================\n\n网址：[https://www.justtherecipe.com/](https://www.justtherecipe.com/)  \n\n![图片](https://mmbiz.qpic.cn/mmbiz_png/eXCSRjyNYcZ8UZDnSmxMPIf2KNIUgyTXSF09umy5TnT632lJo7tGsic4Qz2Lp6GiclbfPWOI9f7LGiayIiap2LbB3Q/640?wx_fmt=png)\n\n如果您是烹饪爱好者，那么这个网站非常适合您，您只需将页面的 URL 粘贴到网页中，它就会向您显示成分列表以及如何制作食物的说明。\n\n**08、jitter**\n=============\n\n网址：[https://jitter.video/](https://jitter.video/)\n\n![图片](https://mmbiz.qpic.cn/mmbiz_png/eXCSRjyNYcZ8UZDnSmxMPIf2KNIUgyTXGCNsph8geCeqYMcKdkV7ckoXYURnwZsA3iaxN4kqoHLMSujUexZrcicA/640?wx_fmt=png)\n\n使用此工具，我们可以免费创建自定义动态图形；只需选择喜欢的模板并开始编辑。\n\n**09、Loading**\n==============\n\n网址：[https://loading.io/](https://loading.io/)\n\n![图片](https://mmbiz.qpic.cn/mmbiz_png/eXCSRjyNYcZ8UZDnSmxMPIf2KNIUgyTXVUGoMNfYib5euvRWq2grHFPeL4OSicYIVGV9seXj3UvS0IibE0xme1LYA/640?wx_fmt=png)\n\n通过这个网站，我们可以制作简单的动画、创建加载模式和背景以及设计进度条，虽然没有最漂亮的用户界面，但可以完美运行。\n\n**10、shortlyai**\n\n网址：[https://shortlyai.com/](https://shortlyai.com/)\n\n![图片](https://mmbiz.qpic.cn/mmbiz_png/eXCSRjyNYcZ8UZDnSmxMPIf2KNIUgyTXibiaJIZdlv3hIouQriapM0kPxJNEYmxIs8NyictDYoia7gGP9aOko67iaJ6g/640?wx_fmt=png)\n\n如果我告诉你，你可以不写任何东西就写出好文章，你会相信吗？是的，去Shortlyai网站，选择一个主题，选择一个输出长度，输入一个简短的标题，人工智能都会为你写一篇文章，这个就是人工智能写作。\n\n**11、Renderforest**\n===================\n\n网址：[https://www.renderforest.com/](https://www.renderforest.com/)  \n\n![图片](https://mmbiz.qpic.cn/mmbiz_png/eXCSRjyNYcZ8UZDnSmxMPIf2KNIUgyTXsqkpq0W0bfLTSdcVLXB4SUyHnicdWialxIb6jP4OF878V7UchNkB0aTg/640?wx_fmt=png)\n\n这个网站可以帮助我们以最少的时间和精力创建各种品牌素材——从视频到Logo，图标、模型和网站。  \n\n**12、Naturalreaders**\n=====================\n\n网址：[https://www.naturalreaders.com/](https://www.naturalreaders.com/)\n\n![图片](https://mmbiz.qpic.cn/mmbiz_png/eXCSRjyNYcZ8UZDnSmxMPIf2KNIUgyTXla47WDQ2QbjsC48pAdbO7xjYfvDtVthkIhTK5Uq71ejPjkiaelanHRw/640?wx_fmt=png)\n\n这个工具实用的出色的地方在于，它可以将任何文本转换为音频，如果你需要为你的视频配音配乐的话，这个网站就非常实用。\n\n**总结**\n\n以上就是我跟大家分享的12个有用的网站、Web 应用程序工具，它们将使您的生活变得超级轻松。\n\n如果你觉得我今天分享的这些工具有用的话，请记得点赞我，关注我。\n\n感谢你的阅读。  \n\n\n====================================================================\n\n![smwx.png](http://zhouyi.run:5222/api/public/admin/getFiles?id=aa2f3fa9d8d253c4c5380f3947a1a385.png&&mimetype=image/png)', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=a5854ac154b944943fd2c6fc951f85c9.jpg&&mimetype=image/jpeg', 1, 39, 0, '2022-05-24 09:40:55', '2022-06-01 17:24:01', '分享12个有用的网站工具，其中包括视频、音频编辑、文案写作、设计工具、浏览器应用程序等，这些工具可以使你的工作效率飙升，让你的工作生活更轻松。', 0, 0, 0, 'https://mp.weixin.qq.com/s/x63xhz-h9DMW_rcxMeqOwg', 'md');
INSERT INTO `mg_articles` VALUES ('49bd5f91-a08a-4548-ae83-f5a66fadcab5', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', 'yarn超时', '> yarn 错误: There appears to be trouble with your network connection. Retrying\n  原因：yarn超时\n\n:point_up: **解决途径：**\n\n#### 1.查看代理\n\n``` js\n  yarn config list\n```\n\n#### 2.删除代理\n\n``` js\n  yarn config delete proxy\n```\n\n#### 3.更换淘宝镜像\n\n``` js\n  yarn config set registry https://registry.npm.taobao.org\n```', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=02da12ad3c71e58a8aee53a6ac5a1cb9.jpg&&mimetype=image/jpeg', 1, 78, 0, '2022-05-07 15:45:07', '2022-06-20 23:50:40', '\"yarn超时\"', 0, 0, 1, NULL, 'md');
INSERT INTO `mg_articles` VALUES ('546ee5a8-ea0f-43bd-92b4-f4d41c545b97', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', '学习笔记：React父子组件通信', '## 学习笔记：React父子组件通信\n\n**1.父传子**\n<br/>\n\n- 方法：**props** 函数  单向数据流，只能渲染，不能修改\n\n ```javascript\n\n# Father组件a\n\nimport React, {Component} from \'react\';\n\nclass Father extends Component {\n    state={\n        arr:[1,2,3],\n        obj:{name:\'son\',age:12},\n        num:98,\n        str:\'Son组件\'\n    }\n    render() {\n        return (\n            <div>\n                //eg:整个state传给子组件 SonB\n                <SonB state={this.state}/>\n            </div>\n        );\n    }\n}\n\nexport default Father;\n\n# Son组件\n\nimport React, {Component} from \'react\';\n\nclass SonB extends Component {\n    const { state:{ arr,obj,num,str } } = this.props //解构 props\n\n    render() {\n        return (\n            <div>\n                <p>{str}</p>\n             // do something...\n            </div>\n        );\n    }\n}\n\nexport default SonB;\n\n```\n\n---\n\n**2.子传父**\n<br/>\n\n- 方法：子组件调用父组件传递过来的函数，并且把想要传递的数据当成函数的实参传入即可\n\n ```javascript\n\n# Son组件\n\nimport React, {Component} from \'react\';\n\nclass SonB extends Component {\n    const { getSonMsg } = this.props //解构 props\n    render() {\n        return (\n            <div>\n                <button onClick={()=>getSonMsg(\'Son组件的消息\')}></button>\n            </div>\n        );\n    }\n}\n\nexport default SonB;\n    \n# Father组件\n\nimport React, {Component} from \'react\';\n\nclass Father extends Component {\n    //定义一个传递给子组件的函数\n    getSonMsg=(val)=>{\n        console.log(\'我是子组件传来的：\', val) //我是子组件传来的：Son组件的消息\n    }\n    \n    render() {\n        return (\n            <div>\n                <SonB getSonMsg={getSonMsg}/>\n            </div>\n        );\n    }\n}\n\nexport default Father;\n\n```\n', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=e52cfbc48528687fd6100e33e40f49ae.jpg&&mimetype=image/jpeg', 1, 17, 0, '2022-06-01 17:51:43', '2022-06-23 10:31:42', '学习笔记：React父子组件通信', 0, 0, 0, NULL, 'md');
INSERT INTO `mg_articles` VALUES ('6c0d32eb-9995-4194-9f99-a718d3ee0ae8', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', '管理端权限配置引导', '<h3>#v1.0.2 管理端权限配置引导</h3>\n<p>&nbsp; &nbsp;1.前往 <code>mg-admin/src/router/routes.js</code> 路由表内找到需要配置的菜单权限；在 perms 内配置 操作接口 （增删改查...） 分类管理 为例：</p>\n<pre class=\"language-markup\"><code>   {\n        path: \'/dir-sort-info\',\n        name: \'dir-sort-info\',\n        meta: {\n          title: \'分类管理\',\n          auth: true,\n          perms: [\n            \'POST /api/private/sort/create\',\n            \'POST /api/private/sort/list\',\n            \'POST /api/private/sort/delete\',\n            \'POST /api/private/sort/update\',\n         ],\n      },\n      component: _import(\'client/dir-sort-info\')\n   }</code></pre>\n<p>&nbsp;&nbsp;&nbsp;2. 前往 <code>mg-admin/src/views/client/dir-sort-info.vue</code> 分类管理列表页面 进行配置 控制按钮&nbsp;&nbsp;</p>\n<pre class=\"language-markup\"><code> //data内定义控制按钮权限 \n permBtn:{\n        createButton:false,\n        queryButton:false,\n        deleteButton:false,\n        updateButton:false,\n      },</code></pre>\n<pre class=\"language-javascript\"><code>//权限筛选方法    \ngetPerms() {\n      let perms =JSON.parse(util.cookies.get(\'permMenus\'))\n      if (perms.includes(\'*\')) {\n        this.permBtn.createButton = true;\n        this.permBtn.queryButton = true;\n        this.permBtn.deleteButton = true;\n        this.permBtn.updateButton = true;\n      } else {\n        if (perms.includes(\'POST /api/private/sort/create\')) {\n          this.permBtn.createButton = true;\n        }\n        if (perms.includes(\'POST /api/private/sort/list\')) {\n          this.permBtn.queryButton = true;\n        }\n        if (perms.includes(\'POST /api/private/sort/update\')) {\n          this.permBtn.updateButton = true;\n        }\n        if (perms.includes(\'POST /api/private/sort/delete\')) {\n          this.permBtn.deleteButton = true;\n        }\n      }\n    },</code></pre>\n<pre class=\"language-markup\"><code>  //例如操作组件的修改、删除、查看等进行控制即可 \n  &lt;mk-tool-button \n             @view=\"goView(scope.row)\"\n             :dis-delete=\"!permBtn.deleteButton\"\n             :dis-edit=\"!permBtn.updateButton\"\n             @edit=\"goEdit(scope.row)\"\n             @delete=\"goDelete(scope.row)\"&gt;\n   &lt;/mk-tool-button&gt;</code></pre>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp;3.上面两步代码配置成功后，进入项目页面 菜单管理-分类管理 增加三级菜单</p>\n<p><img class=\"wscnph\" src=\"http://zhouyi.run:5222/api/public/admin/getFiles?id=3aa283772251e6df10a5181f5b43622e.png&amp;&amp;mimetype=image/png\" width=\"750\" height=\"250\" /></p>\n<p>&nbsp; &nbsp;4.前往角色信息-分配权限 - 完成</p>\n<p><img class=\"wscnph\" src=\"http://zhouyi.run:5222/api/public/admin/getFiles?id=43dbb127cf41514310cd4daa3e018c04.png&amp;&amp;mimetype=image/png\" width=\"748\" height=\"350\" /></p>', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=b8db82d85496c9856e4d70be50230745.webp&&mimetype=image/webp', 1, 144, 0, '2022-05-07 15:30:51', '2022-06-20 20:40:51', '\"管理端权限配置引导\"', 0, 0, 1, NULL, 'mce');
INSERT INTO `mg_articles` VALUES ('7ce524b4-f5a1-47c2-a2b7-0ec09f2d5705', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', 'React父子组件通信', '<h3>1.父传子</h3>\n<ul>\n<li>方法：<strong>props</strong> 函数 单向数据流，只能渲染，不能修改</li>\n</ul>\n<pre class=\"language-javascript\"><code># Father组件a\n\nimport React, {Component} from \'react\';\n\nclass Father extends Component {\n    state={\n        arr:[1,2,3],\n        obj:{name:\'son\',age:12},\n        num:98,\n        str:\'Son组件\'\n    }\n    render() {\n        return (\n            &lt;div&gt;\n                //eg:整个state传给子组件 SonB\n                &lt;SonB state={this.state}/&gt;\n            &lt;/div&gt;\n        );\n    }\n}\n\nexport default Father;\n\n# Son组件\n\nimport React, {Component} from \'react\';\n\nclass SonB extends Component {\n    const { state:{ arr,obj,num,str } } = this.props //解构 props\n\n    render() {\n        return (\n            &lt;div&gt;\n                &lt;p&gt;{str}&lt;/p&gt;\n             // do something...\n            &lt;/div&gt;\n        );\n    }\n}\n\nexport default SonB;</code></pre>\n<h3>1.子传父</h3>\n<ul>\n<li>方法：子组件调用父组件传递过来的函数，并且把想要传递的数据当成函数的实参传入即可</li>\n</ul>\n<pre class=\"language-javascript\"><code># Son组件\n\nimport React, {Component} from \'react\';\n\nclass SonB extends Component {\n    const { getSonMsg } = this.props //解构 props\n    render() {\n        return (\n            &lt;div&gt;\n                &lt;button onClick={()=&gt;getSonMsg(\'Son组件的消息\')}&gt;&lt;/button&gt;\n            &lt;/div&gt;\n        );\n    }\n}\n\nexport default SonB;\n    \n# Father组件\n\nimport React, {Component} from \'react\';\n\nclass Father extends Component {\n    //定义一个传递给子组件的函数\n    getSonMsg=(val)=&gt;{\n        console.log(\'我是子组件传来的：\', val) //我是子组件传来的：Son组件的消息\n    }\n    \n    render() {\n        return (\n            &lt;div&gt;\n                &lt;SonB getSonMsg={getSonMsg}/&gt;\n            &lt;/div&gt;\n        );\n    }\n}\n\nexport default Father;\n</code></pre>', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=e52cfbc48528687fd6100e33e40f49ae.jpg&&mimetype=image/jpeg', 1, 24, 0, '2022-06-01 17:20:40', '2022-06-23 12:22:47', '学习笔记：React父子组件通信', 1, 0, 1, NULL, 'mce');
INSERT INTO `mg_articles` VALUES ('9ebe1246-c190-41b8-8392-e16cf810f248', 'd8fe526f-b9a3-44c2-9cee-625b84f2156c', 'Markdown编辑文字排版', '### 欢迎使用 Cmd Markdown 编辑阅读器\n------------------------------------\n我们理解您需要更便捷更高效的工具记录思想，整理笔记、知识，并将其中承载的价值传播给他人，**md Markdown** 是我们给出的答案 —— 我们为记录思想和分享知识提供更专业的工具。 您可以使用 md Markdown：\n\n> - 整理知识，学习笔记\n> - 发布日记，杂文，所见所想\n> - 撰写发布技术文稿（代码支持）\n> - 撰写发布学术论文（LaTeX 公式支持）\n\n#### 什么是 Markdown\n\n![](https://static01.imgkr.com/temp/ce0d6e88072942fb8932783c056aa2ed.jpg)\nMarkdown 是一种方便记忆、书写的纯文本标记语言，用户可以使用这些标记符号以最小的输入代价生成极富表现力的文档：譬如您正在阅读的这份文档。它使用简单的符号标记不同的标题，分割不同的段落，**粗体** 或者 _斜体_ 某些文字，更棒的是，它还可以\n\n> - 更加贴合微信 UI 标准\n> - 支持实时预览\n> - 支持同步滚动\n> - 支持语法高亮\n> - 支持 emoji 表情（注意开了水印会影响效果）\n> - 扩展语法支持自定义颜色和字号\n\n#### 编辑器工具\n\n1、Editor.md -- 一款开源的 Markdown 编辑器:[Editor.md](https://pandao.github.io/editor.md/examples/index.html)\n\n2、sparksuite/simplemde-markdown-editor:[html-to-markdown](https://github.com/thephpleague/html-to-markdown)\n\n**引用链接**\n\n*[1] Editor.md: https://pandao.github.io/editor.md/examples/index.html*\n*[2] html-to-markdown: https://github.com/thephpleague/html-to-markdown*', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=e52cfbc48528687fd6100e33e40f49ae.jpg&&mimetype=image/jpeg', 1, 14, 0, '2022-05-28 19:52:51', '2022-06-23 12:40:32', '我们理解您需要更便捷更高效的工具记录思想，整理笔记、知识，并将其中承载的价值传播给他人，**md Markdown** 是我们给出的答案 —— 我们为记录思想和分享知识提供更专业的工具。 您可以使用 md Markdown：', 0, 0, 1, NULL, 'md');
INSERT INTO `mg_articles` VALUES ('aee3edea-add2-46b3-834f-832476967101', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', '关于vue.config.js 的 proxy 配置', '<h2>关于vue.config.js 的 proxy 配置</h2>\n<blockquote>\n<p>有的同学不怎么明白项目里面有的配置了 pathRewrite 地址重写，有的又没有进行配置？</p>\n</blockquote>\n<pre class=\"language-javascript\"><code>/*\n* proxy代理配置的说明\n\n* *接口例子：/zy-server/sms/captcha\n*\n* 1.没有配置地址重写 pathRewrite：\n* proxy: {\n  \'/zy-server\': {\n    target: \'http://localhost:5220\', //测试环境\n  },\n},\n*  proxy: \'http://localhost:5220\'  //也可以这样写\n*  \n*  比如: http://localhost:8081/zy-server/sms/captcha \n        会被转发到 http://localhost:5220/zy-server/sms/captcha //浏览器是看不到的\n*\n* 2.配置有 地址重写 pathRewrite： 就不能用 &lsquo;/zy-server&rsquo; 作为代理字段,因为后端接口是带有的，\n*  前端接口得加上自定义 &lsquo;/mg&rsquo; 进行实现更多的代理控制行为：\n* *接口例子：/mg/zy-server/sms/captcha\n*\n* proxy: {\n  \'/mg\': {\n    target: \'http://localhost:5220\', //测试环境\n    pathRewrite: {\n      \'^/mg\': \'\'\n    }\n  },\n},\n*\n*  比如: http://localhost:8081/mg/zy-server/sms/captcha 会被转发到 \n        http://localhost:5220/zy-server/sms/captcha\n* */</code></pre>\n<p>&nbsp;</p>\n<blockquote>\n<p><a href=\"https://cli.vuejs.org/zh/config/#devserver-proxy\" target=\"_blank\" rel=\"noopener\">?查看官网 vue.config.js 配置</a></p>\n</blockquote>\n<p>&nbsp;</p>', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=1161f8ab2fd4da7baaa1a6e303e8d9d4.png&&mimetype=image/png', 1, 62, 2, '2022-05-22 11:14:58', '2022-06-14 21:11:27', 'vue.config.js的proxy原理，不怎么明白项目里面有的配置了 pathRewrite 地址重写，有的又没有进行配置？', 0, 0, 1, NULL, 'mce');
INSERT INTO `mg_articles` VALUES ('c605f6e7-e06f-4b5b-8297-ed3d5e42ed79', '4ecc1acc-e2fa-489c-a288-ce8fd8bfa132', '博客微信小程序端上线啦', '<h3>博客微信小程序端上线啦，源码已开放，快去看看吧</h3>\n<blockquote>\n<p>Gitee地址：<a href=\"https://gitee.com/Z568_568/all-blog-sys/tree/master/v1.0.2/mg-mini\" target=\"_blank\" rel=\"noopener\">https://gitee.com/Z568_568/all-blog-sys/tree/master/v1.0.2/mg-mini</a></p>\n</blockquote>\n<h3>项目预览</h3>\n<p><img class=\"wscnph\" src=\"http://zhouyi.run:5222/api/public/admin/getFiles?id=769b9ff839e0b3be513e57e6ce0c7ef6.png&amp;&amp;mimetype=image/png\" /></p>\n<p>&nbsp;</p>\n<h3>项目截图</h3>\n<p><img class=\"wscnph\" style=\"width: 375px;\" src=\"http://zhouyi.run:5222/api/public/admin/getFiles?id=4d176daaeb13350fdd8fc52f5050f4cd.jpg&amp;&amp;mimetype=image/jpeg\" /><img class=\"wscnph\" style=\"width: 375px;\" src=\"http://zhouyi.run:5222/api/public/admin/getFiles?id=71ef63fd033b7aa0e063a96c5eed450f.jpg&amp;&amp;mimetype=image/jpeg\" /><img class=\"wscnph\" style=\"width: 375px;\" src=\"http://zhouyi.run:5222/api/public/admin/getFiles?id=bfe744f0e053f0a8d543b750ee5a341f.jpg&amp;&amp;mimetype=image/jpeg\" /><img class=\"wscnph\" style=\"width: 375px;\" src=\"http://zhouyi.run:5222/api/public/admin/getFiles?id=73595bc7e0e97686887c018df68c25ce.jpg&amp;&amp;mimetype=image/jpeg\" /></p>\n<p>&nbsp;</p>\n<blockquote>\n<p>记得 点亮星星哦！希望对你有帮助&nbsp; 有问题可以给我留言 ?</p>\n</blockquote>', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=a569ad5cbb9765bda1cfed5736559d75.jpg&&mimetype=image/jpeg', 1, 100, 0, '2022-05-20 18:41:20', '2022-06-23 10:27:47', '博客微信小程序端上线啦，记得 点亮星星哦！希望对你有帮助', 0, 0, 1, NULL, 'mce');
INSERT INTO `mg_articles` VALUES ('dbd0e36a-711a-41d1-b268-f37ab00cf0f5', '4ecc1acc-e2fa-489c-a288-ce8fd8bfa132', '博客微信小程序启动教程', '<h3>博客微信小程序启动教程</h3>\n<pre class=\"language-javascript\"><code>....</code></pre>\n<ul>\n<li>有需要的话请 <a href=\"http://www.zhouyi.run/#/about\" target=\"_blank\" rel=\"noopener\">留言 </a>...</li>\n</ul>', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=c0637df054b42f13380da87bc2a140a8.jpg&&mimetype=image/jpeg', 1, 51, 0, '2022-05-20 19:04:07', '2022-06-17 13:39:36', '博客微信小程序启动教程,有同学需要的话再写吧', 0, 0, 1, NULL, 'mce');
INSERT INTO `mg_articles` VALUES ('f80d786a-b735-42be-abdf-532d93097c17', 'd8fe526f-b9a3-44c2-9cee-625b84f2156c', '周兴哲 - 永不失联的爱', '<blockquote>\n<p>永不失联的爱</p>\n<p><a href=\"http://freetyst.nf.migu.cn/public/product9th/product45/2021/10/2716/2020%E5%B9%B412%E6%9C%8819%E6%97%A517%E7%82%B933%E5%88%86%E7%B4%A7%E6%80%A5%E5%86%85%E5%AE%B9%E5%87%86%E5%85%A5%E6%A2%A6%E5%93%8D%E5%BC%BA%E9%9F%B3274%E9%A6%96/%E5%85%A8%E6%9B%B2%E8%AF%95%E5%90%AC/Mp3_64_22_16/6404689Z1J9161225.mp3?channelid=02&amp;msisdn=a426959b-6412-4b39-90e5-d51838056a15&amp;Tim=1652019526567&amp;Key=a0ad825b33820979\" target=\"_blank\" rel=\"noopener\">下载地址</a></p>\n</blockquote>\n<pre class=\"language-javascript\"><code>[00:00.16]周兴哲 - 永不失联的爱\n[00:01.09]词：饶雪漫\n[00:01.25]曲：周兴哲\n[00:23.05]亲爱的你躲在哪里发呆\n[00:28.79]有什么心事还无法释怀\n[00:34.37]我们总把人生想得太坏\n[00:39.99]像旁人不允许我们的怪\n[00:45.69]每一片与众不同的云彩\n[00:51.38]都需要找到天空去存在\n[00:56.96]我们都习惯了原地徘徊\n[01:02.61]却无法习惯被依赖\n[01:08.97]你给我 这一辈子都不想失联的爱\n[01:15.60]相信爱的征途就是星辰大海\n[01:20.62]美好剧情 不会更改\n[01:25.82]是命运最好的安排\n[01:31.50]你是我\n[01:33.30]这一辈子都不想失联的爱\n[01:38.27]何苦残忍逼我把手轻轻放开\n[01:43.18]请快回来 想听你说\n[01:48.43]说你还在\n[02:16.17]走过陪你看流星的天台\n[02:21.71]熬过失去你漫长的等待\n[02:27.36]好担心没人懂你的无奈\n[02:32.97]离开我谁还把你当小孩\n[02:38.79]我猜你一定也会想念我\n[02:44.23]也怕我失落在茫茫人海\n[02:49.90]没关系只要你肯回头望\n[02:55.52]会发现我一直都在\n[03:01.93]你给我 这一辈子都不想失联的爱\n[03:08.77]你的每条讯息都是心跳节拍\n[03:13.55]每秒都想 拥你入怀\n[03:18.78]全世界你最可爱\n[03:24.59]你是我 这一辈子都不想失联的爱\n[03:31.08]就算你的呼吸远在千山之外\n[03:36.09]请你相信 我给的爱\n[03:41.35]值得你爱</code></pre>', 'http://d.musicapp.migu.cn/prod/file-service/file-down/8121e8df41a5c12f48b69aea89b71dab/e27dccd008b264a4b76b35c4ed59abb1/acabc4887435b492e759069802d04dd5', 1, 89, 2, '2022-05-08 22:49:13', '2022-06-20 23:51:22', '周兴哲 - 永不失联的爱', 0, 0, 1, NULL, 'mce');

-- ----------------------------
-- Table structure for mg_comments
-- ----------------------------
DROP TABLE IF EXISTS `mg_comments`;
CREATE TABLE `mg_comments`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `article_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章ID',
  `article_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级评论Id',
  `from_userId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论来源Id',
  `from_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论来源',
  `from_user_logo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '来源评论用户头像',
  `to_userId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复评论用户Id',
  `to_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复评论名称',
  `to_user_logo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复评论用户头像',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复评论内容',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_comments
-- ----------------------------
INSERT INTO `mg_comments` VALUES ('061524e5-3651-4dfc-8d42-e10b065eaca9', '02ace927-8356-4297-8fcd-9db2841309fc', 'Sass 在vue中使用', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', 'ssss', '2022-06-05 00:48:45', '2022-06-05 00:48:45');
INSERT INTO `mg_comments` VALUES ('07f9cb98-15d9-4f3a-9245-de253d393edd', '10486e3a-1579-47f6-a549-671529776450', '解决 npm install 卡死不动？', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '666<div><br></div>', '2022-06-16 20:01:42', '2022-06-16 20:01:42');
INSERT INTO `mg_comments` VALUES ('1021ece6-2003-46cd-918b-986ed21e2118', '21b9f626-b6e3-4dab-9e04-f088e8d6df03', '测试的啊', '66939a2a-216e-4079-a196-bf00e3dee879', '1', '彭于晏', 'https://ci.xiaohongshu.com/9c287080-630d-33ad-a988-76a8cf21e152?imageView2/2/w/540/format/jpg', '1', '彭于晏', 'https://ci.xiaohongshu.com/9c287080-630d-33ad-a988-76a8cf21e152?imageView2/2/w/540/format/jpg', 'fdsr', '2022-05-16 02:15:08', '2022-05-16 02:15:08');
INSERT INTO `mg_comments` VALUES ('17121040-d0e8-4385-ab15-280850368d70', '21b9f626-b6e3-4dab-9e04-f088e8d6df03', '测试的啊', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '去去去', '2022-05-27 16:54:32', '2022-05-27 16:54:32');
INSERT INTO `mg_comments` VALUES ('19e7ebd4-596e-4eb9-bf97-c4943c89957a', '1c42d541-ed6f-447b-998e-ade64ba10eeb', 'navicat建立数据库 运行sql文件 加载数据表', 'b7f1fc00-1cfd-48fc-acaa-86aae7db97c9', '1', '彭于晏', 'https://ci.xiaohongshu.com/9c287080-630d-33ad-a988-76a8cf21e152?imageView2/2/w/540/format/jpg', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '<img data-v-7c9572d1=\"\" width=\"20\" height=\"20\" src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNiAzNiI+PHBhdGggZmlsbD0iI0ZGQ0M0RCIgZD0iTTM2IDE4YzAgOS45NDEtOC4wNTkgMTgtMTggMTgtOS45NCAwLTE4LTguMDU5LTE4LTE4QzAgOC4wNiA4LjA2IDAgMTggMGM5Ljk0MSAwIDE4IDguMDYgMTggMTgiLz48ZWxsaXBzZSBmaWxsPSIjNjY0NTAwIiBjeD0iMTEuNSIgY3k9IjE2LjUiIHJ4PSIyLjUiIHJ5PSIzLjUiLz48cGF0aCBmaWxsPSIjNjY0NTAwIiBkPSJNMjguNDU3IDE3Ljc5N2MtLjA2LS4xMzUtMS40OTktMy4yOTctNC40NTctMy4yOTctMi45NTcgMC00LjM5NyAzLjE2Mi00LjQ1NyAzLjI5Ny0uMDkyLjIwNy0uMDMyLjQ0OS4xNDUuNTkxLjE3NS4xNDIuNDI2LjE0Ny42MS4wMTQuMDEyLS4wMDkgMS4yNjItLjkwMiAzLjcwMi0uOTAyIDIuNDI2IDAgMy42NzQuODgxIDMuNzAyLjkwMS4wODguMDY2LjE5NC4wOTkuMjk4LjA5OS4xMSAwIC4yMjEtLjAzNy4zMTItLjEwOS4xNzctLjE0Mi4yMzgtLjM4Ni4xNDUtLjU5NHpNNS45OTkgMTIuNDU4Yy0uMjA4IDAtLjQxOS0uMDY1LS41OTktLjItLjQ0Mi0uMzMxLS41MzEtLjk1OC0uMi0xLjQgMy4yNjItNC4zNSA3LjYxNi00LjQgNy44LTQuNC41NTIgMCAxIC40NDggMSAxIDAgLjU1MS0uNDQ1Ljk5OC0uOTk2IDEtLjE1Ni4wMDItMy41NjkuMDg2LTYuMjA1IDMuNi0uMTk1LjI2Mi0uNDk2LjQtLjguNHptMjMuMDAyIDIuMTI1Yy0uMzA1IDAtLjYwNC0uMTM4LS44MDEtLjQtMi41OTItMy40NTctNi45NjEtMi42MjctNy4wMDQtMi42Mi0uNTQ3LjEwOC0xLjA2OC0uMjQzLTEuMTc3LS43ODQtLjEwOC0uNTQyLjI0My0xLjA2OC43ODQtMS4xNzcuMjMxLS4wNDcgNS42NTctMS4wNzIgOC45OTYgMy4zOC4zMzIuNDQyLjI0MiAxLjA2OS0uMiAxLjQtLjE3OS4xMzctLjM4OS4yMDEtLjU5OC4yMDF6bS01Ljc0NyA4Ljk5NGMtLjE4OC0uMTEtLjQzMi0uMDg3LS41OTcuMDYtLjAxLjAwOC0xLjAxMy44NjMtNC42NTcuODYzLTMuNjQxIDAtNC42NDYtLjg1NC00LjY0Ni0uODU0LS4xNTktLjE2LS40MDQtLjE5LS42LS4wODItLjE5NS4xMTEtLjI5My4zMzktLjIzOC41NTcuMDEuMDQ0IDEuMTQ0IDQuMzc5IDUuNDg0IDQuMzc5czUuNDc0LTQuMzM1IDUuNDg1LTQuMzc5Yy4wNTMtLjIxMy0uMDQ0LS40MzEtLjIzMS0uNTQ0eiIvPjwvc3ZnPg==\" alt=\"\" class=\"emoji-icon\" style=\"vertical-align: text-top;\">', '2022-05-25 15:33:36', '2022-05-25 15:33:36');
INSERT INTO `mg_comments` VALUES ('470c5cc3-39dc-438d-a6ce-0f6164926689', '21b9f626-b6e3-4dab-9e04-f088e8d6df03', '测试的啊', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', 'vhfg', '2022-05-16 02:14:54', '2022-05-16 02:14:54');
INSERT INTO `mg_comments` VALUES ('4751a149-cb40-492c-a4e0-904fc728a545', '1c42d541-ed6f-447b-998e-ade64ba10eeb', 'navicat建立数据库 运行sql文件 加载数据表', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '123', '2022-05-10 08:56:17', '2022-05-10 08:56:17');
INSERT INTO `mg_comments` VALUES ('4daf923c-a418-47bc-95a7-77756294089f', '14b7e534-ef61-4907-a7dc-9349bb1a3481', 'vue自定义指令loading', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '能看见我吗<div><br></div>', '2022-06-16 20:10:07', '2022-06-16 20:10:07');
INSERT INTO `mg_comments` VALUES ('50b1a7df-2355-47f7-867f-1dc79a27e48d', '14b7e534-ef61-4907-a7dc-9349bb1a3481', 'vue自定义指令loading', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '<img data-v-7c9572d1=\"\" width=\"20\" height=\"20\" src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNiAzNiI+PHBhdGggZmlsbD0iI0ZGQ0M0RCIgZD0iTTM2IDE4YzAgOS45NDEtOC4wNTkgMTgtMTggMTgtOS45NCAwLTE4LTguMDU5LTE4LTE4QzAgOC4wNiA4LjA2IDAgMTggMGM5Ljk0MSAwIDE4IDguMDYgMTggMTgiLz48cGF0aCBmaWxsPSIjNjY0NTAwIiBkPSJNMjguNDU3IDE3Ljc5N2MtLjA2LS4xMzUtMS40OTktMy4yOTctNC40NTctMy4yOTctMi45NTcgMC00LjM5NyAzLjE2Mi00LjQ1NyAzLjI5Ny0uMDkyLjIwNy0uMDMyLjQ0OS4xNDUuNTkxLjE3NS4xNDIuNDI2LjE0Ny42MS4wMTQuMDEyLS4wMDkgMS4yNjItLjkwMiAzLjcwMi0uOTAyIDIuNDI2IDAgMy42NzQuODgxIDMuNzAyLjkwMS4wODguMDY2LjE5NC4wOTkuMjk4LjA5OS4xMSAwIC4yMjEtLjAzNy4zMTItLjEwOS4xNzctLjE0Mi4yMzgtLjM4Ni4xNDUtLjU5NHptLTEyIDBjLS4wNi0uMTM1LTEuNDk5LTMuMjk3LTQuNDU3LTMuMjk3LTIuOTU3IDAtNC4zOTcgMy4xNjItNC40NTcgMy4yOTctLjA5Mi4yMDctLjAzMi40NDkuMTQ0LjU5MS4xNzYuMTQyLjQyNy4xNDcuNjEuMDE0LjAxMy0uMDA5IDEuMjYyLS45MDIgMy43MDMtLjkwMiAyLjQyNiAwIDMuNjc0Ljg4MSAzLjcwMi45MDEuMDg4LjA2Ni4xOTQuMDk5LjI5OC4wOTkuMTEgMCAuMjIxLS4wMzcuMzEyLS4xMDkuMTc4LS4xNDIuMjM3LS4zODYuMTQ1LS41OTR6TTE4IDIyYy0zLjYyMyAwLTYuMDI3LS40MjItOS0xLS42NzktLjEzMS0yIDAtMiAyIDAgNCA0LjU5NSA5IDExIDkgNi40MDQgMCAxMS01IDExLTkgMC0yLTEuMzIxLTIuMTMyLTItMi0yLjk3My41NzgtNS4zNzcgMS05IDF6Ii8+PHBhdGggZmlsbD0iI0ZGRiIgZD0iTTkgMjNzMyAxIDkgMSA5LTEgOS0xLTIgNC05IDQtOS00LTktNHoiLz48L3N2Zz4=\" alt=\"\" class=\"emoji-icon\" style=\"vertical-align: text-top;\">', '2022-05-27 11:48:08', '2022-05-27 11:48:08');
INSERT INTO `mg_comments` VALUES ('51d8dd7f-fa8a-4bc2-93da-134db889853f', '14b7e534-ef61-4907-a7dc-9349bb1a3481', 'vue自定义指令loading', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '000', '2022-06-10 18:19:28', '2022-06-10 18:19:28');
INSERT INTO `mg_comments` VALUES ('5d94820a-09af-410a-ae3a-2c54a29e4f3e', '21b9f626-b6e3-4dab-9e04-f088e8d6df03', '测试的啊', '66939a2a-216e-4079-a196-bf00e3dee879', '1', '彭于晏', 'https://ci.xiaohongshu.com/9c287080-630d-33ad-a988-76a8cf21e152?imageView2/2/w/540/format/jpg', '1', '彭于晏', 'https://ci.xiaohongshu.com/9c287080-630d-33ad-a988-76a8cf21e152?imageView2/2/w/540/format/jpg', 'asdf1', '2022-05-22 14:45:16', '2022-05-22 14:45:16');
INSERT INTO `mg_comments` VALUES ('61cc9e28-283f-4ec1-9cd5-bcbe7e7c3e73', '21b9f626-b6e3-4dab-9e04-f088e8d6df03', '测试的啊', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '222', '2022-05-16 14:08:14', '2022-05-16 14:08:14');
INSERT INTO `mg_comments` VALUES ('66638bd2-2230-4637-a7d1-6855fc50ea65', 'f80d786a-b735-42be-abdf-532d93097c17', '周兴哲 - 永不失联的爱', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '<img data-v-7c9572d1=\"\" width=\"20\" height=\"20\" src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNiAzNiI+PHBhdGggZmlsbD0iI0VGOTY0NSIgZD0iTTMyLjMwMiAyNC4zNDdjLS42OTUtMS4wMS0uMzA3LTIuNDctLjQ4LTQuMDgyLS4xNzgtMi42My0xLjMwOC01LjE3OC0zLjUtNy4yMTZsLTcuNDY2LTYuOTQycy0xLjQ3MS0xLjM2OS0yLjg0MS4xMDNjLTEuMzY4IDEuNDcxLjEwNCAyLjg0LjEwNCAyLjg0bDMuMTU0IDIuOTM0IDIuNzM0IDIuNTQycy0uNjg1LjczNi0zLjcxMS0yLjA3OGwtMTAuMjItOS41MDZzLTEuNDczLTEuMzY4LTIuODQyLjEwNGMtMS4zNjggMS40NzEuMTAzIDIuODQuMTAzIDIuODRsOS42NjQgOC45ODljLS4wMjEtLjAyLS43MzEuNjkyLS43NDQuNjhMNS45MTcgNS45MzhzLTEuNDcyLTEuMzY5LTIuODQxLjEwM2MtMS4zNjkgMS40NzIuMTAzIDIuODQuMTAzIDIuODRMMTMuNTIgMTguNWMuMDEyLjAxMi0uNjU0Ljc2NC0uNjM0Ljc4M2wtOC45Mi04LjI5OHMtMS40NzItMS4zNjktMi44NDEuMTAzYy0xLjM2OSAxLjQ3Mi4xMDMgMi44NDEuMTAzIDIuODQxbDkuNDg0IDguODJjLjA4Ny4wODEtLjUuOTA4LS4zOTEgMS4wMDlsLTYuODM0LTYuMzU2cy0xLjQ3Mi0xLjM2OS0yLjg0MS4xMDRjLTEuMzY5IDEuNDcyLjEwMyAyLjg0MS4xMDMgMi44NDFMMTEuODk2IDMwLjcxYzEuODYxIDEuNzMxIDMuNzcyIDIuNjA3IDYuMDc2IDIuOTI4LjQ2OS4wNjUgMS4wNjkuMDY1IDEuMzE1LjA5Ni43NzcuMDk4IDEuNDU5LjM3NCAyLjM3Mi45MzQgMS4xNzUuNzIgMi45MzggMS4wMiAzLjk1MS0uMDYzbDMuNDU0LTMuNjk1IDMuMTg5LTMuNDEyYzEuMDEyLTEuMDgyLjgzMS0yLjAxNi4wNDktMy4xNTF6Ii8+PHBhdGggZD0iTTEuOTU2IDM1LjAyNmMtLjI1NiAwLS41MTItLjA5OC0uNzA3LS4yOTMtLjM5MS0uMzkxLS4zOTEtMS4wMjMgMC0xLjQxNEw0LjggMjkuNzdjLjM5MS0uMzkxIDEuMDIzLS4zOTEgMS40MTQgMHMuMzkxIDEuMDIzIDAgMS40MTRsLTMuNTUxIDMuNTVjLS4xOTUuMTk1LS40NTEuMjkyLS43MDcuMjkyem02Ljc0Ni45MjJjLS4xMDkgMC0uMjIxLS4wMTgtLjMzMS0uMDU2LS41MjEtLjE4Mi0uNzk2LS43NTItLjYxMy0xLjI3NGwuOTcxLTIuNzczYy4xODItLjUyMS43NTMtLjc5NSAxLjI3NC0uNjE0LjUyMS4xODMuNzk2Ljc1My42MTMgMS4yNzRsLS45NzEgMi43NzNjLS4xNDQuNDEyLS41My42Ny0uOTQzLjY3em0tNy42NjctNy42NjdjLS40MTIgMC0uNzk4LS4yNTctLjk0My0uNjY3LS4xODQtLjUyMS4wODktMS4wOTIuNjEtMS4yNzZsMi40OTUtLjg4MWMuNTIzLS4xOCAxLjA5Mi4wOTEgMS4yNzYuNjEuMTg0LjUyMS0uMDg5IDEuMDkyLS42MSAxLjI3NmwtMi40OTUuODgxYy0uMTExLjAzOS0uMjIzLjA1Ny0uMzMzLjA1N3ptMjkuNDYtMjEuNzY3Yy0uMjU2IDAtLjUxMi0uMDk4LS43MDctLjI5My0uMzkxLS4zOTEtLjM5MS0xLjAyNCAwLTEuNDE1bDMuNTUyLTMuNTVjLjM5MS0uMzkgMS4wMjMtLjM5IDEuNDE0IDBzLjM5MSAxLjAyNCAwIDEuNDE1bC0zLjU1MiAzLjU1Yy0uMTk1LjE5Ni0uNDUxLjI5My0uNzA3LjI5M3ptLTQuMTY0LTEuNjk3Yy0uMTA5IDAtLjIyMS0uMDE5LS4zMy0uMDU3LS41MjEtLjE4Mi0uNzk2LS43NTItLjYxNC0xLjI3NGwuOTctMi43NzNjLjE4My0uNTIxLjc1Mi0uNzk2IDEuMjc0LS42MTQuNTIxLjE4Mi43OTYuNzUyLjYxNCAxLjI3NGwtLjk3IDIuNzczYy0uMTQ0LjQxMy0uNTMxLjY3MS0uOTQ0LjY3MXptNi4xNDMgNS43NzRjLS40MTIgMC0uNzk4LS4yNTctLjk0My0uNjY3LS4xODQtLjUyMS4wOS0xLjA5Mi42MS0xLjI3NmwyLjQ5NC0uODgxYy41MjItLjE4NSAxLjA5Mi4wOSAxLjI3Ni42MS4xODQuNTIxLS4wOSAxLjA5Mi0uNjEgMS4yNzZsLTIuNDk0Ljg4MWMtLjExMS4wMzktLjIyMy4wNTctLjMzMy4wNTd6IiBmaWxsPSIjRkE3NDNFIi8+PHBhdGggZmlsbD0iI0ZGREI1RSIgZD0iTTM1LjM5IDIzLjgyMmMtLjY2MS0xLjAzMi0uMjI0LTIuNDc5LS4zNDItNC4wOTYtLjA5LTIuNjM0LTEuMTMzLTUuMjE5LTMuMjU1LTcuMzNsLTcuMjI4LTcuMTg5cy0xLjQyNC0xLjQxNy0yLjg0My4wMDhjLTEuNDE3IDEuNDI0LjAwOCAyLjg0Mi4wMDggMi44NDJsMy4wNTQgMy4wMzkgMi42NDYgMi42MzJzLS43MS43MTItMy42MzktMi4yMDJjLTIuOTMxLTIuOTE1LTkuODk0LTkuODQ1LTkuODk0LTkuODQ1cy0xLjQyNS0xLjQxNy0yLjg0My4wMDhjLTEuNDE4IDEuNDI0LjAwNyAyLjg0MS4wMDcgMi44NDFsOS4zNTYgOS4zMWMtLjAyLS4wMi0uNzU0LjY2Ny0uNzY3LjY1NEw5LjY0IDQuNTM0cy0xLjQyNS0xLjQxOC0yLjg0My4wMDdjLTEuNDE3IDEuNDI1LjAwNyAyLjg0Mi4wMDcgMi44NDJsMTAuMDExIDkuOTYyYy4wMTIuMDEyLS42OC43NDEtLjY2Ljc2MUw3LjUyIDkuNTEzcy0xLjQyNS0xLjQxNy0yLjg0My4wMDguMDA3IDIuODQzLjAwNyAyLjg0M2w5LjE4MSA5LjEzNWMuMDg0LjA4My0uNTMuODkxLS40MjUuOTk2bC02LjYxNi02LjU4M3MtMS40MjUtMS40MTctMi44NDMuMDA4LjAwNyAyLjg0My4wMDcgMi44NDNsMTAuNzkgMTAuNzMyYzEuODAyIDEuNzkzIDMuNjgyIDIuNzMyIDUuOTc0IDMuMTMxLjQ2Ny4wODEgMS4wNjcuMTAxIDEuMzExLjE0Ljc3My4xMjQgMS40NDUuNDIzIDIuMzQgMS4wMTQgMS4xNS43NTkgMi45MDIgMS4xMTggMy45NTEuMDdsMy41NzctMy41NzYgMy4zMDItMy4zMDJjMS4wNDktMS4wNS45LTEuOTkuMTU3LTMuMTV6Ii8+PC9zdmc+\" alt=\"\" class=\"emoji-icon\" style=\"vertical-align: text-top;\"><img data-v-7c9572d1=\"\" width=\"20\" height=\"20\" src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNiAzNiI+PHBhdGggZmlsbD0iI0VGOTY0NSIgZD0iTTMyLjMwMiAyNC4zNDdjLS42OTUtMS4wMS0uMzA3LTIuNDctLjQ4LTQuMDgyLS4xNzgtMi42My0xLjMwOC01LjE3OC0zLjUtNy4yMTZsLTcuNDY2LTYuOTQycy0xLjQ3MS0xLjM2OS0yLjg0MS4xMDNjLTEuMzY4IDEuNDcxLjEwNCAyLjg0LjEwNCAyLjg0bDMuMTU0IDIuOTM0IDIuNzM0IDIuNTQycy0uNjg1LjczNi0zLjcxMS0yLjA3OGwtMTAuMjItOS41MDZzLTEuNDczLTEuMzY4LTIuODQyLjEwNGMtMS4zNjggMS40NzEuMTAzIDIuODQuMTAzIDIuODRsOS42NjQgOC45ODljLS4wMjEtLjAyLS43MzEuNjkyLS43NDQuNjhMNS45MTcgNS45MzhzLTEuNDcyLTEuMzY5LTIuODQxLjEwM2MtMS4zNjkgMS40NzIuMTAzIDIuODQuMTAzIDIuODRMMTMuNTIgMTguNWMuMDEyLjAxMi0uNjU0Ljc2NC0uNjM0Ljc4M2wtOC45Mi04LjI5OHMtMS40NzItMS4zNjktMi44NDEuMTAzYy0xLjM2OSAxLjQ3Mi4xMDMgMi44NDEuMTAzIDIuODQxbDkuNDg0IDguODJjLjA4Ny4wODEtLjUuOTA4LS4zOTEgMS4wMDlsLTYuODM0LTYuMzU2cy0xLjQ3Mi0xLjM2OS0yLjg0MS4xMDRjLTEuMzY5IDEuNDcyLjEwMyAyLjg0MS4xMDMgMi44NDFMMTEuODk2IDMwLjcxYzEuODYxIDEuNzMxIDMuNzcyIDIuNjA3IDYuMDc2IDIuOTI4LjQ2OS4wNjUgMS4wNjkuMDY1IDEuMzE1LjA5Ni43NzcuMDk4IDEuNDU5LjM3NCAyLjM3Mi45MzQgMS4xNzUuNzIgMi45MzggMS4wMiAzLjk1MS0uMDYzbDMuNDU0LTMuNjk1IDMuMTg5LTMuNDEyYzEuMDEyLTEuMDgyLjgzMS0yLjAxNi4wNDktMy4xNTF6Ii8+PHBhdGggZD0iTTEuOTU2IDM1LjAyNmMtLjI1NiAwLS41MTItLjA5OC0uNzA3LS4yOTMtLjM5MS0uMzkxLS4zOTEtMS4wMjMgMC0xLjQxNEw0LjggMjkuNzdjLjM5MS0uMzkxIDEuMDIzLS4zOTEgMS40MTQgMHMuMzkxIDEuMDIzIDAgMS40MTRsLTMuNTUxIDMuNTVjLS4xOTUuMTk1LS40NTEuMjkyLS43MDcuMjkyem02Ljc0Ni45MjJjLS4xMDkgMC0uMjIxLS4wMTgtLjMzMS0uMDU2LS41MjEtLjE4Mi0uNzk2LS43NTItLjYxMy0xLjI3NGwuOTcxLTIuNzczYy4xODItLjUyMS43NTMtLjc5NSAxLjI3NC0uNjE0LjUyMS4xODMuNzk2Ljc1My42MTMgMS4yNzRsLS45NzEgMi43NzNjLS4xNDQuNDEyLS41My42Ny0uOTQzLjY3em0tNy42NjctNy42NjdjLS40MTIgMC0uNzk4LS4yNTctLjk0My0uNjY3LS4xODQtLjUyMS4wODktMS4wOTIuNjEtMS4yNzZsMi40OTUtLjg4MWMuNTIzLS4xOCAxLjA5Mi4wOTEgMS4yNzYuNjEuMTg0LjUyMS0uMDg5IDEuMDkyLS42MSAxLjI3NmwtMi40OTUuODgxYy0uMTExLjAzOS0uMjIzLjA1Ny0uMzMzLjA1N3ptMjkuNDYtMjEuNzY3Yy0uMjU2IDAtLjUxMi0uMDk4LS43MDctLjI5My0uMzkxLS4zOTEtLjM5MS0xLjAyNCAwLTEuNDE1bDMuNTUyLTMuNTVjLjM5MS0uMzkgMS4wMjMtLjM5IDEuNDE0IDBzLjM5MSAxLjAyNCAwIDEuNDE1bC0zLjU1MiAzLjU1Yy0uMTk1LjE5Ni0uNDUxLjI5My0uNzA3LjI5M3ptLTQuMTY0LTEuNjk3Yy0uMTA5IDAtLjIyMS0uMDE5LS4zMy0uMDU3LS41MjEtLjE4Mi0uNzk2LS43NTItLjYxNC0xLjI3NGwuOTctMi43NzNjLjE4My0uNTIxLjc1Mi0uNzk2IDEuMjc0LS42MTQuNTIxLjE4Mi43OTYuNzUyLjYxNCAxLjI3NGwtLjk3IDIuNzczYy0uMTQ0LjQxMy0uNTMxLjY3MS0uOTQ0LjY3MXptNi4xNDMgNS43NzRjLS40MTIgMC0uNzk4LS4yNTctLjk0My0uNjY3LS4xODQtLjUyMS4wOS0xLjA5Mi42MS0xLjI3NmwyLjQ5NC0uODgxYy41MjItLjE4NSAxLjA5Mi4wOSAxLjI3Ni42MS4xODQuNTIxLS4wOSAxLjA5Mi0uNjEgMS4yNzZsLTIuNDk0Ljg4MWMtLjExMS4wMzktLjIyMy4wNTctLjMzMy4wNTd6IiBmaWxsPSIjRkE3NDNFIi8+PHBhdGggZmlsbD0iI0ZGREI1RSIgZD0iTTM1LjM5IDIzLjgyMmMtLjY2MS0xLjAzMi0uMjI0LTIuNDc5LS4zNDItNC4wOTYtLjA5LTIuNjM0LTEuMTMzLTUuMjE5LTMuMjU1LTcuMzNsLTcuMjI4LTcuMTg5cy0xLjQyNC0xLjQxNy0yLjg0My4wMDhjLTEuNDE3IDEuNDI0LjAwOCAyLjg0Mi4wMDggMi44NDJsMy4wNTQgMy4wMzkgMi42NDYgMi42MzJzLS43MS43MTItMy42MzktMi4yMDJjLTIuOTMxLTIuOTE1LTkuODk0LTkuODQ1LTkuODk0LTkuODQ1cy0xLjQyNS0xLjQxNy0yLjg0My4wMDhjLTEuNDE4IDEuNDI0LjAwNyAyLjg0MS4wMDcgMi44NDFsOS4zNTYgOS4zMWMtLjAyLS4wMi0uNzU0LjY2Ny0uNzY3LjY1NEw5LjY0IDQuNTM0cy0xLjQyNS0xLjQxOC0yLjg0My4wMDdjLTEuNDE3IDEuNDI1LjAwNyAyLjg0Mi4wMDcgMi44NDJsMTAuMDExIDkuOTYyYy4wMTIuMDEyLS42OC43NDEtLjY2Ljc2MUw3LjUyIDkuNTEzcy0xLjQyNS0xLjQxNy0yLjg0My4wMDguMDA3IDIuODQzLjAwNyAyLjg0M2w5LjE4MSA5LjEzNWMuMDg0LjA4My0uNTMuODkxLS40MjUuOTk2bC02LjYxNi02LjU4M3MtMS40MjUtMS40MTctMi44NDMuMDA4LjAwNyAyLjg0My4wMDcgMi44NDNsMTAuNzkgMTAuNzMyYzEuODAyIDEuNzkzIDMuNjgyIDIuNzMyIDUuOTc0IDMuMTMxLjQ2Ny4wODEgMS4wNjcuMTAxIDEuMzExLjE0Ljc3My4xMjQgMS40NDUuNDIzIDIuMzQgMS4wMTQgMS4xNS43NTkgMi45MDIgMS4xMTggMy45NTEuMDdsMy41NzctMy41NzYgMy4zMDItMy4zMDJjMS4wNDktMS4wNS45LTEuOTkuMTU3LTMuMTV6Ii8+PC9zdmc+\" alt=\"\" class=\"emoji-icon\" style=\"vertical-align: text-top;\">', '2022-05-08 22:50:28', '2022-05-08 22:50:28');
INSERT INTO `mg_comments` VALUES ('66939a2a-216e-4079-a196-bf00e3dee879', '21b9f626-b6e3-4dab-9e04-f088e8d6df03', '测试的啊', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', 'hkhj', '2022-05-13 11:01:53', '2022-05-13 11:01:53');
INSERT INTO `mg_comments` VALUES ('8b2fbcf9-0eeb-4b51-918f-3e3f20bfb889', '21b9f626-b6e3-4dab-9e04-f088e8d6df03', '测试的啊', 'f9fa175d-9e6c-4764-aa38-b50d1b17d749', '1', '彭于晏', 'https://ci.xiaohongshu.com/9c287080-630d-33ad-a988-76a8cf21e152?imageView2/2/w/540/format/jpg', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', 'asdf1', '2022-05-22 14:45:03', '2022-05-22 14:45:03');
INSERT INTO `mg_comments` VALUES ('8f0acb45-1988-47d3-9c55-e8c66451385a', '10486e3a-1579-47f6-a549-671529776450', '解决 npm install 卡死不动？', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '9999', '2022-05-29 19:04:22', '2022-05-29 19:04:22');
INSERT INTO `mg_comments` VALUES ('9553b981-a097-4116-abe0-a84b9ff7244c', '21b9f626-b6e3-4dab-9e04-f088e8d6df03', '测试的啊', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '来了', '2022-06-07 17:01:34', '2022-06-07 17:01:34');
INSERT INTO `mg_comments` VALUES ('9567f472-a96b-4d61-9484-eaf8ddd2f209', '14b7e534-ef61-4907-a7dc-9349bb1a3481', 'vue自定义指令loading', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '111111', '2022-06-06 22:50:05', '2022-06-06 22:50:05');
INSERT INTO `mg_comments` VALUES ('97fe3d44-df8f-445b-a040-122d5a1b4178', 'aee3edea-add2-46b3-834f-832476967101', '关于vue.config.js 的 proxy 配置', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '感谢分享<img data-v-7c9572d1=\"\" width=\"20\" height=\"20\" src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNiAzNiI+PHBhdGggZmlsbD0iI0ZGREI1RSIgZD0iTTM0Ljk1NiAxNy45MTZjMC0uNTAzLS4xMi0uOTc1LS4zMjEtMS40MDQtMS4zNDEtNC4zMjYtNy42MTktNC4wMS0xNi41NDktNC4yMjEtMS40OTMtLjAzNS0uNjM5LTEuNzk4LS4xMTUtNS42NjguMzQxLTIuNTE3LTEuMjgyLTYuMzgyLTQuMDEtNi4zODItNC40OTggMC0uMTcxIDMuNTQ4LTQuMTQ4IDEyLjMyMi0yLjEyNSA0LjY4OC02Ljg3NSAyLjA2Mi02Ljg3NSA2Ljc3MXYxMC43MTljMCAxLjgzMy4xOCAzLjU5NSAyLjc1OCAzLjg4NUM4LjE5NSAzNC4yMTkgNy42MzMgMzYgMTEuMjM4IDM2aDE4LjA0NGMxLjgzOCAwIDMuMzMzLTEuNDk2IDMuMzMzLTMuMzM0IDAtLjc2Mi0uMjY3LTEuNDU2LS42OTgtMi4wMTggMS4wMi0uNTcxIDEuNzItMS42NDkgMS43Mi0yLjg5OSAwLS43Ni0uMjY2LTEuNDU0LS42OTYtMi4wMTUgMS4wMjMtLjU3IDEuNzI1LTEuNjQ5IDEuNzI1LTIuOTAxIDAtLjkwOS0uMzY4LTEuNzMzLS45NjEtMi4zMzYuNzU3LS42MTEgMS4yNTEtMS41MzUgMS4yNTEtMi41ODF6Ii8+PHBhdGggZmlsbD0iI0VFOTU0NyIgZD0iTTIzLjAyIDIxLjI0OWg4LjYwNGMxLjE3IDAgMi4yNjgtLjYyNiAyLjg2Ni0xLjYzMy4yNDYtLjQxNS4xMDktLjk1Mi0uMzA3LTEuMTk5LS40MTUtLjI0Ny0uOTUyLS4xMDgtMS4xOTkuMzA3LS4yODMuNDc5LS44MDYuNzc1LTEuMzYxLjc3NWgtOC44MWMtLjg3MyAwLTEuNTgzLS43MS0xLjU4My0xLjU4M3MuNzEtMS41ODMgMS41ODMtMS41ODNIMjguN2MuNDgzIDAgLjg3NS0uMzkyLjg3NS0uODc1cy0uMzkyLS44NzUtLjg3NS0uODc1aC01Ljg4OGMtMS44MzggMC0zLjMzMyAxLjQ5NS0zLjMzMyAzLjMzMyAwIDEuMDI1LjQ3NSAxLjkzMiAxLjIwNSAyLjU0NC0uNjE1LjYwNS0uOTk4IDEuNDQ1LS45OTggMi4zNzMgMCAxLjAyOC40NzggMS45MzggMS4yMTIgMi41NDktLjYxMS42MDQtLjk5IDEuNDQxLS45OSAyLjM2NyAwIDEuMTIuNTU5IDIuMTA4IDEuNDA5IDIuNzEzLS41MjQuNTg5LS44NTIgMS4zNTYtLjg1MiAyLjIwNCAwIDEuODM4IDEuNDk1IDMuMzMzIDMuMzMzIDMuMzMzaDUuNDg0YzEuMTcgMCAyLjI2OS0uNjI1IDIuODY3LTEuNjMyLjI0Ny0uNDE1LjExLS45NTItLjMwNS0xLjE5OS0uNDE2LS4yNDUtLjk1My0uMTEtMS4xOTkuMzA1LS4yODUuNDc5LS44MDguNzc2LTEuMzYzLjc3NmgtNS40ODRjLS44NzMgMC0xLjU4My0uNzEtMS41ODMtMS41ODNzLjcxLTEuNTgzIDEuNTgzLTEuNTgzaDYuNTA2YzEuMTcgMCAyLjI3LS42MjYgMi44NjctMS42MzMuMjQ3LS40MTYuMTEtLjk1My0uMzA1LTEuMTk5LS40MTktLjI1MS0uOTU0LS4xMS0xLjE5OS4zMDUtLjI4OS40ODctLjc5OS43NzctMS4zNjMuNzc3aC03LjA2M2MtLjg3MyAwLTEuNTgzLS43MTEtMS41ODMtMS41ODRzLjcxLTEuNTgzIDEuNTgzLTEuNTgzaDguMDkxYzEuMTcgMCAyLjI2OS0uNjI1IDIuODY3LTEuNjMyLjI0Ny0uNDE1LjExLS45NTItLjMwNS0xLjE5OS0uNDE3LS4yNDYtLjk1My0uMTEtMS4xOTkuMzA1LS4yODkuNDg2LS43OTkuNzc2LTEuMzYzLjc3NkgyMy4wMmMtLjg3MyAwLTEuNTgzLS43MS0xLjU4My0xLjU4M3MuNzA5LTEuNTg0IDEuNTgzLTEuNTg0eiIvPjwvc3ZnPg==\" alt=\"\" class=\"emoji-icon\" style=\"vertical-align: text-top;\">', '2022-05-23 19:00:40', '2022-05-23 19:00:40');
INSERT INTO `mg_comments` VALUES ('9f6f85a6-8a5f-4e70-b27c-a8893a3ce05d', '14b7e534-ef61-4907-a7dc-9349bb1a3481', 'vue自定义指令loading', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '<img data-v-7c9572d1=\"\" width=\"20\" height=\"20\" src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNiAzNiI+PHBhdGggZmlsbD0iI0ZGQ0M0RCIgZD0iTTM2IDE4YzAgOS45NDEtOC4wNTkgMTgtMTggMTgtOS45NCAwLTE4LTguMDU5LTE4LTE4QzAgOC4wNiA4LjA2IDAgMTggMGM5Ljk0MSAwIDE4IDguMDYgMTggMTgiLz48cGF0aCBmaWxsPSIjNjY0NTAwIiBkPSJNMTYgMThjLS40MTkgMC0uODA5LS4yNjUtLjk0OS0uNjg0QzE0Ljg0OCAxNi43MTcgMTQuMDM0IDE1IDEzIDE1Yy0xLjA2MiAwLTEuODg4IDEuODI3LTIuMDUxIDIuMzE2LS4xNzUuNTIzLS43MzguODA4LTEuMjY1LjYzMi0uNTI0LS4xNzQtLjgwNy0uNzQxLS42MzItMS4yNjVDOS4xNzcgMTYuMzA3IDEwLjM1NiAxMyAxMyAxM3MzLjgyMyAzLjMwNyAzLjk0OSAzLjY4NGMuMTc1LjUyNC0uMTA4IDEuMDkxLS42MzIgMS4yNjUtLjEwNi4wMzQtLjIxMy4wNTEtLjMxNy4wNTF6bTEwIDBjLS40MTkgMC0uODA5LS4yNjUtLjk0OC0uNjg0QzI0Ljg0OSAxNi43MTcgMjQuMDMzIDE1IDIzIDE1Yy0xLjA2MiAwLTEuODg5IDEuODI3LTIuMDUyIDIuMzE2LS4xNzUuNTIzLS43MzYuODA4LTEuMjY1LjYzMi0uNTIzLS4xNzQtLjgwNy0uNzQxLS42MzItMS4yNjVDMTkuMTc3IDE2LjMwNyAyMC4zNTUgMTMgMjMgMTNzMy44MjMgMy4zMDcgMy45NDggMy42ODRjLjE3NS41MjQtLjEwOCAxLjA5MS0uNjMyIDEuMjY1LS4xMDUuMDM0LS4yMTIuMDUxLS4zMTYuMDUxem0tOCA0Yy0zLjYyMyAwLTYuMDI3LS40MjItOS0xLS42NzktLjEzMS0yIDAtMiAyIDAgNCA0LjU5NSA5IDExIDkgNi40MDQgMCAxMS01IDExLTkgMC0yLTEuMzIxLTIuMTMyLTItMi0yLjk3My41NzgtNS4zNzcgMS05IDF6Ii8+PHBhdGggZmlsbD0iI0ZGRiIgZD0iTTkgMjNzMyAxIDkgMSA5LTEgOS0xLTEuMzQ0IDYuNzUtOSA2Ljc1UzkgMjMgOSAyM3oiLz48cGF0aCBmaWxsPSIjNjY0NTAwIiBkPSJNMTggMjcuNTk0Yy0zLjU5NiAwLTYuMjcyLS4zNzItNy45MzctLjc0NWwtLjgyNS0xLjg3MWMuODIzLjMxMiAzLjg4OS44OTcgOC43NjMuODk3IDQuOTU0IDAgOC4wMzctLjYxNiA4Ljg2NC0uOTM4bC0uNzAxIDEuODQyYy0xLjYzNC4zOC00LjQxOS44MTUtOC4xNjQuODE1eiIvPjwvc3ZnPg==\" alt=\"\" class=\"emoji-icon\" style=\"vertical-align: text-top;\">', '2022-06-01 13:26:37', '2022-06-01 13:26:37');
INSERT INTO `mg_comments` VALUES ('a5556dc5-5dd4-4d61-ba47-75782e7aeead', '14b7e534-ef61-4907-a7dc-9349bb1a3481', 'vue自定义指令loading', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '大佬抱歉，给你弄了俩不能播放的音乐，还不能删除...', '2022-06-16 20:36:35', '2022-06-16 20:36:35');
INSERT INTO `mg_comments` VALUES ('b56ee681-eebd-432f-ace0-aae3f8c20b09', '14b7e534-ef61-4907-a7dc-9349bb1a3481', 'vue自定义指令loading', '4daf923c-a418-47bc-95a7-77756294089f', '1', '彭于晏', 'https://ci.xiaohongshu.com/9c287080-630d-33ad-a988-76a8cf21e152?imageView2/2/w/540/format/jpg', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '123', '2022-06-16 20:10:33', '2022-06-16 20:10:33');
INSERT INTO `mg_comments` VALUES ('b643577b-b3f1-4c52-83a6-13d726b900a6', '10486e3a-1579-47f6-a549-671529776450', '解决 npm install 卡死不动？', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '666', '2022-06-16 20:01:49', '2022-06-16 20:01:49');
INSERT INTO `mg_comments` VALUES ('b7f1fc00-1cfd-48fc-acaa-86aae7db97c9', '1c42d541-ed6f-447b-998e-ade64ba10eeb', 'navicat建立数据库 运行sql文件 加载数据表', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '阿萨飒飒', '2022-05-14 14:44:26', '2022-05-14 14:44:26');
INSERT INTO `mg_comments` VALUES ('c72b2789-edb6-4bc4-b843-15f13a6cd905', '21b9f626-b6e3-4dab-9e04-f088e8d6df03', '测试的啊', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '111', '2022-05-16 14:08:23', '2022-05-16 14:08:23');
INSERT INTO `mg_comments` VALUES ('cdc162ec-5493-415c-a995-c6ccf966c5e9', 'aee3edea-add2-46b3-834f-832476967101', '关于vue.config.js 的 proxy 配置', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '131312', '2022-05-23 11:44:20', '2022-05-23 11:44:20');
INSERT INTO `mg_comments` VALUES ('d3b120cb-5515-4a3a-b8e4-1c7bbc9254df', '1c42d541-ed6f-447b-998e-ade64ba10eeb', 'navicat建立数据库 运行sql文件 加载数据表', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '，厉害！', '2022-05-25 23:21:23', '2022-05-25 23:21:23');
INSERT INTO `mg_comments` VALUES ('d735b807-607b-4e96-a39a-557450a9936b', '1c42d541-ed6f-447b-998e-ade64ba10eeb', 'navicat建立数据库 运行sql文件 加载数据表', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', 'yes<div><br></div>', '2022-05-13 00:38:53', '2022-05-13 00:38:53');
INSERT INTO `mg_comments` VALUES ('d8f4f9a0-25bd-450d-a3a3-8109c1de8104', '21b9f626-b6e3-4dab-9e04-f088e8d6df03', '测试的啊', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '??', '2022-05-19 11:31:31', '2022-05-19 11:31:31');
INSERT INTO `mg_comments` VALUES ('dbe786fd-e146-46e5-9af5-30aeaec3cbe8', '21b9f626-b6e3-4dab-9e04-f088e8d6df03', '测试的啊', '66939a2a-216e-4079-a196-bf00e3dee879', '1', '彭于晏', 'https://ci.xiaohongshu.com/9c287080-630d-33ad-a988-76a8cf21e152?imageView2/2/w/540/format/jpg', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '而他如同', '2022-05-16 02:15:02', '2022-05-16 02:15:02');
INSERT INTO `mg_comments` VALUES ('ddf9bae6-07bc-4a0b-b6ce-a477f38f1e05', 'f80d786a-b735-42be-abdf-532d93097c17', '周兴哲 - 永不失联的爱', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', 'aaa', '2022-06-18 16:17:51', '2022-06-18 16:17:51');
INSERT INTO `mg_comments` VALUES ('e0f25130-8f9a-4813-917a-d65243851b2b', '10486e3a-1579-47f6-a549-671529776450', '解决 npm install 卡死不动？', '8f0acb45-1988-47d3-9c55-e8c66451385a', '1', '彭于晏', 'https://ci.xiaohongshu.com/9c287080-630d-33ad-a988-76a8cf21e152?imageView2/2/w/540/format/jpg', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '999', '2022-05-29 19:04:31', '2022-05-29 19:04:31');
INSERT INTO `mg_comments` VALUES ('f9fa175d-9e6c-4764-aa38-b50d1b17d749', '21b9f626-b6e3-4dab-9e04-f088e8d6df03', '测试的啊', '0', '1', '吴彦祖', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '新风系统人的', '2022-05-16 02:14:48', '2022-05-16 02:14:48');

-- ----------------------------
-- Table structure for mg_excel
-- ----------------------------
DROP TABLE IF EXISTS `mg_excel`;
CREATE TABLE `mg_excel`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `axi_x` int(11) NULL DEFAULT NULL COMMENT 'X轴数据',
  `axi_y` int(11) NULL DEFAULT NULL COMMENT 'Y轴数据',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_excel
-- ----------------------------

-- ----------------------------
-- Table structure for mg_friends
-- ----------------------------
DROP TABLE IF EXISTS `mg_friends`;
CREATE TABLE `mg_friends`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链地址',
  `siteName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链站点',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链邮箱',
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '友链描述',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_friends
-- ----------------------------
INSERT INTO `mg_friends` VALUES ('12642dc6-7218-4ff4-9758-d9ec129c91f0', 'https://gitee.com/Z568_568/zy-express-sequelize-mysql.git', '开箱即用的 api 基础模板', '1840354092@qq.com', '集成 express sequelize swagger-ui mysql 一套开箱即用的 api 基础模板', '2022-05-28 23:05:04', '2022-05-28 23:05:04');
INSERT INTO `mg_friends` VALUES ('2c4cf5f9-7595-4d66-9b6a-fc83d3383422', 'http://www.zhouyi.run:5226/', 'mg-maple', '1840354092@qq.com', 'React版本博客、个人网站模板', '2022-06-08 13:10:27', '2022-06-08 13:10:27');
INSERT INTO `mg_friends` VALUES ('2f639041-06d5-4207-a269-d10193a3d11c', 'https://www.html.cn/create-react-app/docs/getting-started/', 'create-react-app', '1840354092@qq.com', 'Create React App 是一个官方支持的创建 React 单页应用程序的方法', '2022-06-06 13:05:46', '2022-06-06 13:06:02');
INSERT INTO `mg_friends` VALUES ('3861e7af-350a-43d8-b116-e9f4bc4cd796', 'http://www.zhouyi.run/#/', 'ZY\'blog', '1840354092@qq.com', '个人博客', '2022-04-20 21:23:25', '2022-04-20 21:33:49');
INSERT INTO `mg_friends` VALUES ('cc24f892-7b2e-4e84-b7f7-9e45c41eacdb', 'https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects', 'JavaScript 标准', '1840354092@qq.com', 'JavaScript 中所有的标准内置对象、以及它们的方法和属性。', '2022-05-31 10:38:47', '2022-05-31 10:38:47');

-- ----------------------------
-- Table structure for mg_menus
-- ----------------------------
DROP TABLE IF EXISTS `mg_menus`;
CREATE TABLE `mg_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级ID',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标题',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `createdAt` datetime NOT NULL COMMENT '创建时间',
  `updatedAt` datetime NOT NULL COMMENT '更新时间',
  `lever` int(1) NOT NULL COMMENT '层级',
  `authority` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_menus
-- ----------------------------
INSERT INTO `mg_menus` VALUES (2, 1, '/index', '首页', 'home', '2022-04-26 14:11:49', '2022-04-26 14:11:49', 1, '');
INSERT INTO `mg_menus` VALUES (3, 1, 'client', '客户端管理', 'universal-access', '2022-04-26 14:12:36', '2022-04-28 11:47:48', 1, '');
INSERT INTO `mg_menus` VALUES (5, 3, '/dir-sort-info', '分类管理', 'navicon', '2022-04-26 14:13:06', '2022-04-27 15:47:05', 2, '');
INSERT INTO `mg_menus` VALUES (6, 3, '/dir-friends-info', '友链管理', 'th-large', '2022-04-26 14:13:19', '2022-04-26 14:13:19', 2, '');
INSERT INTO `mg_menus` VALUES (7, 3, '/dir-website-info', '站点管理', 'th-large', '2022-04-26 14:13:35', '2022-04-26 14:13:35', 2, '');
INSERT INTO `mg_menus` VALUES (8, 3, '/dir-about-info', '博主管理', 'th-large', '2022-04-26 14:13:50', '2022-04-26 14:13:50', 2, '');
INSERT INTO `mg_menus` VALUES (9, 3, '/dir-message-info', '留言管理', 'th-large', '2022-04-26 14:14:03', '2022-04-26 14:14:03', 2, '');
INSERT INTO `mg_menus` VALUES (10, 3, '/dir-comments-info', '评论管理', 'th-large', '2022-04-26 14:14:23', '2022-04-26 14:14:23', 2, '');
INSERT INTO `mg_menus` VALUES (11, 3, '/dir-socials-info', '社交管理', 'th-large', '2022-04-26 14:14:36', '2022-04-26 14:14:36', 2, '');
INSERT INTO `mg_menus` VALUES (12, 1, 'sys', '系统管理', 'gear', '2022-04-26 14:15:37', '2022-04-28 11:47:55', 1, '');
INSERT INTO `mg_menus` VALUES (13, 12, '/code/dir-code-info', '代码生成', 'th-large', '2022-04-26 14:15:58', '2022-05-29 13:02:17', 2, 'POST /api/private/code/list');
INSERT INTO `mg_menus` VALUES (14, 12, '/users/dir-users-info', '用户管理', 'th-large', '2022-04-26 14:16:10', '2022-04-26 14:16:10', 2, '');
INSERT INTO `mg_menus` VALUES (15, 12, '/roles/dir-roles-info', '角色管理', 'th-large', '2022-04-26 14:16:23', '2022-04-26 14:16:23', 2, '');
INSERT INTO `mg_menus` VALUES (16, 12, '/menus/dir-menus-info', '菜单管理', 'th-large', '2022-04-26 14:16:35', '2022-04-26 14:16:35', 2, '');
INSERT INTO `mg_menus` VALUES (31, 3, '/dir-article-info', '博文管理', 'th-large', '2022-04-27 14:12:10', '2022-04-27 14:12:10', 2, '');
INSERT INTO `mg_menus` VALUES (32, 31, 'POST /api/private/article/create', '添加', 'th-large', '2022-04-27 14:13:58', '2022-04-27 14:14:35', 3, 'POST /api/private/article/create');
INSERT INTO `mg_menus` VALUES (33, 31, 'POST /api/private/article/list', '查询', 'th-large', '2022-04-27 14:14:23', '2022-04-27 14:16:36', 3, 'POST /api/private/article/list');
INSERT INTO `mg_menus` VALUES (34, 31, 'POST /api/private/article/update', '修改', 'th-large', '2022-04-27 14:14:59', '2022-04-27 14:14:59', 3, 'POST /api/private/article/update');
INSERT INTO `mg_menus` VALUES (35, 31, 'POST /api/private/article/delete', '删除', 'th-large', '2022-04-27 14:15:17', '2022-04-27 14:15:17', 3, 'POST /api/private/article/delete');
INSERT INTO `mg_menus` VALUES (36, 16, 'POST /api/private/menus/create', '添加', 'th-large', '2022-04-27 15:50:26', '2022-04-27 15:50:26', 3, 'POST /api/private/menus/create');
INSERT INTO `mg_menus` VALUES (37, 16, 'POST /api/private/menus/list', '查询', 'th-large', '2022-04-27 15:50:43', '2022-04-27 15:50:43', 3, 'POST /api/private/menus/list');
INSERT INTO `mg_menus` VALUES (38, 16, 'POST /api/private/menus/delete', '删除', 'th-large', '2022-04-27 15:51:10', '2022-04-27 15:51:10', 3, 'POST /api/private/menus/delete');
INSERT INTO `mg_menus` VALUES (39, 16, 'POST /api/private/menus/update', '更新', 'th-large', '2022-04-27 15:51:28', '2022-04-27 15:51:28', 3, 'POST /api/private/menus/update');
INSERT INTO `mg_menus` VALUES (40, 15, 'POST /api/private/roles/update', '更新', 'th-large', '2022-04-27 15:52:04', '2022-04-27 15:53:55', 3, 'POST /api/private/roles/update');
INSERT INTO `mg_menus` VALUES (41, 15, 'POST /api/private/roles/list', '查询', 'th-large', '2022-04-27 15:52:37', '2022-04-27 15:52:37', 3, 'POST /api/private/roles/list');
INSERT INTO `mg_menus` VALUES (42, 15, 'POST /api/private/roles/delete', '删除', 'th-large', '2022-04-27 15:52:59', '2022-04-27 15:52:59', 3, 'POST /api/private/roles/delete');
INSERT INTO `mg_menus` VALUES (43, 15, 'POST /api/private/roles/create', '添加', 'th-large', '2022-04-27 15:54:15', '2022-04-27 15:54:15', 3, 'POST /api/private/roles/create');
INSERT INTO `mg_menus` VALUES (44, 14, 'POST /api/private/users/create', '添加', 'th-large', '2022-04-27 15:54:43', '2022-04-27 15:54:43', 3, 'POST /api/private/users/create');
INSERT INTO `mg_menus` VALUES (45, 14, 'POST /api/private/users/list', '查询', 'th-large', '2022-04-27 15:55:13', '2022-04-27 15:55:13', 3, 'POST /api/private/users/list');
INSERT INTO `mg_menus` VALUES (46, 14, 'POST /api/private/users/delete', '删除', 'th-large', '2022-04-27 15:55:34', '2022-04-27 15:55:34', 3, 'POST /api/private/users/delete');
INSERT INTO `mg_menus` VALUES (47, 14, 'POST /api/private/users/update', '更新', 'th-large', '2022-04-27 15:55:55', '2022-04-27 15:55:55', 3, 'POST /api/private/users/update');
INSERT INTO `mg_menus` VALUES (48, 5, 'POST /api/private/sort/update', '更新', 'navicon', '2022-04-27 15:56:27', '2022-04-27 15:56:27', 3, 'POST /api/private/sort/update');
INSERT INTO `mg_menus` VALUES (49, 5, 'POST /api/private/sort/list', '查询', 'navicon', '2022-04-27 15:56:45', '2022-04-27 15:56:45', 3, 'POST /api/private/sort/list');
INSERT INTO `mg_menus` VALUES (50, 5, 'POST /api/private/sort/create', '添加', 'navicon', '2022-04-27 15:57:08', '2022-04-27 15:57:08', 3, 'POST /api/private/sort/create');
INSERT INTO `mg_menus` VALUES (51, 5, 'POST /api/private/sort/delete', '删除', 'navicon', '2022-04-27 15:58:06', '2022-04-27 15:58:06', 3, 'POST /api/private/sort/delete');
INSERT INTO `mg_menus` VALUES (52, 6, 'POST /api/private/friends/delete', '删除', 'th-large', '2022-04-27 15:58:30', '2022-04-27 15:58:30', 3, 'POST /api/private/friends/delete');
INSERT INTO `mg_menus` VALUES (53, 6, 'POST /api/private/friends/create', '添加', 'th-large', '2022-04-27 15:59:05', '2022-04-27 15:59:05', 3, 'POST /api/private/friends/create');
INSERT INTO `mg_menus` VALUES (54, 6, 'POST /api/private/friends/update', '更新', 'th-large', '2022-04-27 15:59:34', '2022-04-27 15:59:34', 3, 'POST /api/private/friends/update');
INSERT INTO `mg_menus` VALUES (55, 6, 'POST /api/private/friends/list', '查询', 'th-large', '2022-04-27 15:59:52', '2022-04-27 15:59:52', 3, 'POST /api/private/friends/list');
INSERT INTO `mg_menus` VALUES (56, 7, 'POST /api/private/website/list', '查询', 'th-large', '2022-04-27 16:00:22', '2022-04-27 16:00:22', 3, 'POST /api/private/website/list');
INSERT INTO `mg_menus` VALUES (57, 7, 'POST /api/private/website/create', '添加', 'th-large', '2022-04-27 16:00:42', '2022-04-27 16:00:42', 3, 'POST /api/private/website/create');
INSERT INTO `mg_menus` VALUES (58, 7, 'POST /api/private/website/delete', '删除', 'th-large', '2022-04-27 16:01:06', '2022-04-27 16:01:06', 3, 'POST /api/private/website/delete');
INSERT INTO `mg_menus` VALUES (59, 7, 'POST /api/private/website/update', '更新', 'th-large', '2022-04-27 16:01:29', '2022-04-27 16:01:29', 3, 'POST /api/private/website/update');
INSERT INTO `mg_menus` VALUES (60, 8, 'POST /api/private/about/delete', '删除', 'th-large', '2022-04-27 16:01:56', '2022-04-27 16:01:56', 3, 'POST /api/private/about/delete');
INSERT INTO `mg_menus` VALUES (61, 8, 'POST /api/private/about/list', '查询', 'th-large', '2022-04-27 16:02:16', '2022-04-27 16:02:16', 3, 'POST /api/private/about/list');
INSERT INTO `mg_menus` VALUES (62, 8, 'POST /api/private/about/create', '添加', 'th-large', '2022-04-27 16:02:44', '2022-04-27 16:02:44', 3, 'POST /api/private/about/create');
INSERT INTO `mg_menus` VALUES (63, 8, 'POST /api/private/about/update', '更新', 'th-large', '2022-04-27 16:03:03', '2022-04-27 16:03:03', 3, 'POST /api/private/about/update');
INSERT INTO `mg_menus` VALUES (64, 9, 'POST /api/private/message/update', '更新', 'th-large', '2022-04-27 16:03:36', '2022-04-27 16:03:36', 3, 'POST /api/private/message/update');
INSERT INTO `mg_menus` VALUES (65, 9, 'POST /api/private/message/list', '查询', 'th-large', '2022-04-27 16:03:56', '2022-04-27 16:03:56', 3, 'POST /api/private/message/list');
INSERT INTO `mg_menus` VALUES (66, 9, 'POST /api/private/message/delete', '删除', 'th-large', '2022-04-27 16:05:20', '2022-04-27 16:05:20', 3, 'POST /api/private/message/delete');
INSERT INTO `mg_menus` VALUES (67, 9, 'POST /api/private/message/create', '添加', 'th-large', '2022-04-27 16:05:40', '2022-04-27 16:05:40', 3, 'POST /api/private/message/create');
INSERT INTO `mg_menus` VALUES (68, 10, 'POST /api/private/comments/create', '创建', 'th-large', '2022-04-27 16:05:59', '2022-04-27 16:05:59', 3, 'POST /api/private/comments/create');
INSERT INTO `mg_menus` VALUES (69, 10, 'POST /api/private/comments/list', '查询', 'th-large', '2022-04-27 16:06:18', '2022-04-27 16:06:18', 3, 'POST /api/private/comments/list');
INSERT INTO `mg_menus` VALUES (70, 10, 'POST /api/private/comments/delete', '删除', 'th-large', '2022-04-27 16:06:57', '2022-04-27 16:06:57', 3, 'POST /api/private/comments/delete');
INSERT INTO `mg_menus` VALUES (71, 10, 'POST /api/private/comments/update', '更新', 'th-large', '2022-04-27 16:08:48', '2022-04-27 16:08:48', 3, 'POST /api/private/comments/update');
INSERT INTO `mg_menus` VALUES (72, 11, 'POST /api/private/socials/update', '更新', 'th-large', '2022-04-27 16:09:21', '2022-04-27 16:09:21', 3, 'POST /api/private/socials/update');
INSERT INTO `mg_menus` VALUES (73, 11, 'POST /api/private/socials/list', '查询', 'th-large', '2022-04-27 16:10:19', '2022-04-27 16:10:19', 3, 'POST /api/private/socials/list');
INSERT INTO `mg_menus` VALUES (74, 11, 'POST /api/private/socials/delete', '删除', 'th-large', '2022-04-27 16:10:39', '2022-04-27 16:10:39', 3, 'POST /api/private/socials/delete');
INSERT INTO `mg_menus` VALUES (75, 11, 'POST /api/private/socials/create', '添加', 'th-large', '2022-04-27 16:10:58', '2022-04-27 16:10:58', 3, 'POST /api/private/socials/create');
INSERT INTO `mg_menus` VALUES (80, 12, '/icon/list', '图标列表', 'gear', '2022-04-28 12:08:51', '2022-04-28 12:15:09', 2, '');
INSERT INTO `mg_menus` VALUES (81, 3, '/dir-musics-info', '音乐管理', 'universal-access', '2022-05-02 23:11:26', '2022-05-02 23:11:26', 2, '');
INSERT INTO `mg_menus` VALUES (82, 81, 'POST /api/private/musics/list', '查询', 'universal-access', '2022-05-02 23:12:10', '2022-05-02 23:12:10', 3, 'POST /api/private/musics/list');
INSERT INTO `mg_menus` VALUES (83, 81, 'POST /api/private/musics/create', '添加', 'universal-access', '2022-05-02 23:14:18', '2022-05-02 23:14:18', 3, 'POST /api/private/musics/create');
INSERT INTO `mg_menus` VALUES (84, 81, 'POST /api/private/musics/delete', '删除', 'universal-access', '2022-05-02 23:14:42', '2022-05-02 23:14:42', 3, 'POST /api/private/musics/delete');
INSERT INTO `mg_menus` VALUES (85, 81, 'POST /api/private/musics/update', '更新', 'universal-access', '2022-05-02 23:15:04', '2022-05-02 23:15:04', 3, 'POST /api/private/musics/update');
INSERT INTO `mg_menus` VALUES (86, 3, '/dir-tags-info', '标签管理', 'universal-access', '2022-05-07 17:13:30', '2022-05-07 17:13:30', 2, '');
INSERT INTO `mg_menus` VALUES (87, 86, 'POST /api/private/tags/list', '查询', 'universal-access', '2022-05-07 17:15:08', '2022-05-07 17:15:08', 3, 'POST /api/private/tags/list');
INSERT INTO `mg_menus` VALUES (88, 86, 'POST /api/private/tags/create', '增加', 'universal-access', '2022-05-07 17:15:37', '2022-05-07 17:15:37', 3, 'POST /api/private/tags/create');
INSERT INTO `mg_menus` VALUES (89, 86, 'POST /api/private/tags/delete', '删除', 'universal-access', '2022-05-07 17:15:52', '2022-05-07 17:15:52', 3, 'POST /api/private/tags/delete');
INSERT INTO `mg_menus` VALUES (90, 86, 'POST /api/private/tags/update', '修改', 'universal-access', '2022-05-07 17:16:06', '2022-05-07 17:16:06', 3, 'POST /api/private/tags/update');
INSERT INTO `mg_menus` VALUES (91, 9, 'POST /api/private/message/replyMsg', '回复', 'th-large', '2022-05-08 13:53:55', '2022-05-08 13:53:55', 3, 'POST /api/private/message/replyMsg');
INSERT INTO `mg_menus` VALUES (92, 14, 'POST /api/private/users/reset', '重置密码', 'low-vision', '2022-05-13 21:05:38', '2022-05-13 21:05:38', 3, 'POST /api/private/users/reset');
INSERT INTO `mg_menus` VALUES (93, 15, 'POST /api/private/roles/one', '角色详情', 'th-large', '2022-05-29 12:57:12', '2022-05-29 12:57:12', 3, 'POST /api/private/roles/one');
INSERT INTO `mg_menus` VALUES (94, 13, 'POST /api/private/code/one', '表详情', 'th-large', '2022-05-29 13:08:11', '2022-05-29 13:08:11', 3, 'POST /api/private/code/one');
INSERT INTO `mg_menus` VALUES (95, 12, '/visitor/dir-visitor-info', '访客管理', 'gear', '2022-06-18 17:02:55', '2022-06-18 17:02:55', 2, '');
INSERT INTO `mg_menus` VALUES (96, 95, 'POST /api/private/visitor/list', '查询', 'gear', '2022-06-18 17:03:17', '2022-06-18 17:03:17', 3, 'POST /api/private/visitor/list');
INSERT INTO `mg_menus` VALUES (97, 12, '/analysis/proAnalysis/dir-proanalysis-info', '数据分析', 'bar-chart', '2022-06-21 23:34:14', '2022-06-24 17:48:25', 2, '');
INSERT INTO `mg_menus` VALUES (98, 97, 'POST /api/private/analysis/list', '查询', 'bar-chart', '2022-06-21 23:35:12', '2022-06-21 23:35:12', 3, 'POST /api/private/analysis/list');
INSERT INTO `mg_menus` VALUES (99, 97, 'POST /api/private/analysis/create', '增加', 'bar-chart', '2022-06-21 23:35:40', '2022-06-21 23:35:40', 3, 'POST /api/private/analysis/create');
INSERT INTO `mg_menus` VALUES (100, 97, 'POST /api/private/analysis/delete', '删除', 'bar-chart', '2022-06-21 23:36:07', '2022-06-21 23:36:07', 3, 'POST /api/private/analysis/delete');
INSERT INTO `mg_menus` VALUES (101, 97, 'POST /api/private/analysis/update', '更新', 'bar-chart', '2022-06-21 23:36:31', '2022-06-21 23:36:31', 3, 'POST /api/private/analysis/update');
INSERT INTO `mg_menus` VALUES (102, 97, 'POST /api/private/analysis/downloadTemplate', '模板下载', 'bar-chart', '2022-06-21 23:36:57', '2022-06-22 17:06:22', 3, 'POST /api/private/analysis/downloadTemplate');
INSERT INTO `mg_menus` VALUES (103, 97, 'POST /api/private/analysis/importExcel', '导入表格', 'bar-chart', '2022-06-21 23:37:18', '2022-06-22 00:02:43', 3, 'POST /api/private/analysis/importExcel');
INSERT INTO `mg_menus` VALUES (104, 97, 'POST /api/private/analysis/exportExcel', '导出', 'bar-chart', '2022-06-22 15:59:54', '2022-06-22 15:59:54', 3, 'POST /api/private/analysis/exportExcel');
INSERT INTO `mg_menus` VALUES (105, 97, 'POST /api/private/proanalysis/list', '项目组分析查询', 'bar-chart', '2022-06-24 17:49:30', '2022-06-24 17:49:30', 3, 'POST /api/private/proanalysis/list');
INSERT INTO `mg_menus` VALUES (106, 97, 'POST /api/private/proanalysis/delete', '项目组删除', 'bar-chart', '2022-06-24 17:51:19', '2022-06-24 17:51:19', 3, 'POST /api/private/proanalysis/delete');
INSERT INTO `mg_menus` VALUES (107, 97, 'POST /api/private/proanalysis/create', '项目组创建', 'bar-chart', '2022-06-24 17:51:42', '2022-06-24 17:51:42', 3, 'POST /api/private/proanalysis/create');
INSERT INTO `mg_menus` VALUES (108, 97, 'POST /api/private/proanalysis/update', '项目组更新', 'bar-chart', '2022-06-24 17:51:58', '2022-06-24 17:51:58', 3, 'POST /api/private/proanalysis/update');

-- ----------------------------
-- Table structure for mg_message
-- ----------------------------
DROP TABLE IF EXISTS `mg_message`;
CREATE TABLE `mg_message`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言邮箱',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '留言内容',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '回复状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_message
-- ----------------------------
INSERT INTO `mg_message` VALUES ('3a9292b0-7123-4e27-b500-a584e174d11c', '1840354092@qq.com', '我把我整个灵魂都给你，连同它的怪癖，耍小脾气，忽明忽暗，一千八百种坏毛病。它真讨厌，只有一点好，爱你', '2022-05-18 22:51:09', '2022-05-18 22:51:09', 0);
INSERT INTO `mg_message` VALUES ('f833f16b-4ecd-4f8a-a79a-25f96aef5728', '1840354092@qq.com', '``` js\n{key: \'syncs\', name: \'同步状态\', show: true, width: \'80\', enableSort: false, align: \"center\", fixed: \'right\'},\n{key: \'status\', name: \'投保状态\', show: true, width: \'80\', enableSort: false, align: \"center\", fixed: \'right\'},\n{key: \'toolButton\', name: \'操作\', show: true, width: \'120\', enableSort: false, align: \"center\", fixed: \'right\'},\n```', '2022-05-09 17:28:39', '2022-05-09 22:52:21', 1);

-- ----------------------------
-- Table structure for mg_musics
-- ----------------------------
DROP TABLE IF EXISTS `mg_musics`;
CREATE TABLE `mg_musics`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '音乐名称',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地址',
  `cover` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '封面',
  `lrc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '歌词',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_musics
-- ----------------------------
INSERT INTO `mg_musics` VALUES ('9de5af04-a01f-441e-8c46-9408f6747239', '永不失联的爱', '单依纯', 'http://freetyst.nf.migu.cn/public/product9th/product45/2021/10/2716/2020%E5%B9%B412%E6%9C%8819%E6%97%A517%E7%82%B933%E5%88%86%E7%B4%A7%E6%80%A5%E5%86%85%E5%AE%B9%E5%87%86%E5%85%A5%E6%A2%A6%E5%93%8D%E5%BC%BA%E9%9F%B3274%E9%A6%96/%E5%85%A8%E6%9B%B2%E8%AF%95%E5%90%AC/Mp3_64_22_16/6404689Z1J9161225.mp3?channelid=02&msisdn=a426959b-6412-4b39-90e5-d51838056a15&Tim=1652019526567&Key=a0ad825b33820979', 'http://d.musicapp.migu.cn/prod/file-service/file-down/8121e8df41a5c12f48b69aea89b71dab/e27dccd008b264a4b76b35c4ed59abb1/acabc4887435b492e759069802d04dd5', '[00:00.16]周兴哲 - 永不失联的爱\n[00:01.09]词：饶雪漫\n[00:01.25]曲：周兴哲\n[00:23.05]亲爱的你躲在哪里发呆\n[00:28.79]有什么心事还无法释怀\n[00:34.37]我们总把人生想得太坏\n[00:39.99]像旁人不允许我们的怪\n[00:45.69]每一片与众不同的云彩\n[00:51.38]都需要找到天空去存在\n[00:56.96]我们都习惯了原地徘徊\n[01:02.61]却无法习惯被依赖\n[01:08.97]你给我 这一辈子都不想失联的爱\n[01:15.60]相信爱的征途就是星辰大海\n[01:20.62]美好剧情 不会更改\n[01:25.82]是命运最好的安排\n[01:31.50]你是我\n[01:33.30]这一辈子都不想失联的爱\n[01:38.27]何苦残忍逼我把手轻轻放开\n[01:43.18]请快回来 想听你说\n[01:48.43]说你还在\n[02:16.17]走过陪你看流星的天台\n[02:21.71]熬过失去你漫长的等待\n[02:27.36]好担心没人懂你的无奈\n[02:32.97]离开我谁还把你当小孩\n[02:38.79]我猜你一定也会想念我\n[02:44.23]也怕我失落在茫茫人海\n[02:49.90]没关系只要你肯回头望\n[02:55.52]会发现我一直都在\n[03:01.93]你给我 这一辈子都不想失联的爱\n[03:08.77]你的每条讯息都是心跳节拍\n[03:13.55]每秒都想 拥你入怀\n[03:18.78]全世界你最可爱\n[03:24.59]你是我 这一辈子都不想失联的爱\n[03:31.08]就算你的呼吸远在千山之外\n[03:36.09]请你相信 我给的爱\n[03:41.35]值得你爱', '2022-05-08 22:15:27', '2022-05-08 22:45:29');

-- ----------------------------
-- Table structure for mg_proanalysis
-- ----------------------------
DROP TABLE IF EXISTS `mg_proanalysis`;
CREATE TABLE `mg_proanalysis`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pro_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目组名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mg_proanalysis
-- ----------------------------
INSERT INTO `mg_proanalysis` VALUES ('5a068b21-cfc0-4d12-9457-99a5e9409367', '氨基酸的浓度', 'Enzyme activity/(nmol/min/mg/prot)', '2022-06-24 20:21:05', '2022-06-24 20:22:29');
INSERT INTO `mg_proanalysis` VALUES ('d261ee54-80b3-4377-b25b-bc4b078b148c', '酶活值', 'Enzyme activity/(nmol/min/mg/prot)', '2022-06-24 17:53:22', '2022-06-24 20:22:36');

-- ----------------------------
-- Table structure for mg_roles
-- ----------------------------
DROP TABLE IF EXISTS `mg_roles`;
CREATE TABLE `mg_roles`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_roles
-- ----------------------------
INSERT INTO `mg_roles` VALUES ('86deca84-5bdb-4ec4-8979-a72abcbc27bb', 'editor', '访客', '2022-04-28 10:23:17', '2022-05-13 10:05:16');
INSERT INTO `mg_roles` VALUES ('af709d7f-883d-4f94-884c-b6010e0a415c', 'admin', '超级管理员', '2022-04-26 11:49:25', '2022-04-26 11:49:25');

-- ----------------------------
-- Table structure for mg_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `mg_roles_menus`;
CREATE TABLE `mg_roles_menus`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `roleId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `menuIds` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单ID',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_roles_menus
-- ----------------------------
INSERT INTO `mg_roles_menus` VALUES ('00e605de-576e-4d59-a8be-d08dea58948f', 'af709d7f-883d-4f94-884c-b6010e0a415c', '38', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('0362e277-6419-4395-a5d8-98d242b13f5f', 'af709d7f-883d-4f94-884c-b6010e0a415c', '80', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('098b4aff-04b9-45b6-bc4e-ca0f46f7d2b5', 'af709d7f-883d-4f94-884c-b6010e0a415c', '55', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('0b597313-ac0f-416b-81ac-26de8876ab68', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '55', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('0c797237-66cf-44f0-8818-e2caeada0741', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '9', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('0ca6a13c-0dac-4cec-b1ef-fd8c2de82c45', 'af709d7f-883d-4f94-884c-b6010e0a415c', '35', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('0d844b2e-2dec-4fa6-8890-ecea50e2760c', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '86', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('0fc99d75-260a-4bca-b9ae-55a3f9b0856c', 'af709d7f-883d-4f94-884c-b6010e0a415c', '63', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('10668226-96d2-45ca-b999-2844d8b1084e', 'af709d7f-883d-4f94-884c-b6010e0a415c', '12', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('1399f6e2-88ec-4a1c-a69b-c41c513b4cb4', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '94', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('14251b9d-ebf2-42ad-8f8c-661bfe5c6d06', 'af709d7f-883d-4f94-884c-b6010e0a415c', '58', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('14f2221a-2d59-4849-966d-89fc754c2446', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '48', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('186fd938-07da-4951-8c78-c1958769f348', 'af709d7f-883d-4f94-884c-b6010e0a415c', '71', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('18aeb7e9-6833-4f7a-942c-b6db0797089c', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '37', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('1cb6691b-8c9f-4db1-a36e-6cdae936d176', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '10', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('1cfa3e69-bf21-4d3f-b8cf-cf1a1f92da43', 'af709d7f-883d-4f94-884c-b6010e0a415c', '81', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('1dbba7d6-5db3-45b9-9ae5-e044c2d7ee48', 'af709d7f-883d-4f94-884c-b6010e0a415c', '74', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('20dbf952-c2bc-40de-bd9a-77de94559a1a', 'af709d7f-883d-4f94-884c-b6010e0a415c', '73', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('243d2d94-71e8-4aaa-b9a8-30187b8dfc51', 'af709d7f-883d-4f94-884c-b6010e0a415c', '93', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('269a59f0-d70b-4e74-b4d0-9b243d85a504', 'af709d7f-883d-4f94-884c-b6010e0a415c', '94', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('269b9c11-a925-4b93-a495-a7e4e32c1e45', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '31', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('26e7a9f4-e4f7-480f-9990-08d12431c34a', 'af709d7f-883d-4f94-884c-b6010e0a415c', '44', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('28b89196-44ad-4df4-b7ca-e545037ad309', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '41', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('2902883f-26f8-478a-b62a-d5acbb346060', 'af709d7f-883d-4f94-884c-b6010e0a415c', '42', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('314682ea-7d71-42b4-a8d1-3cd219fcbee7', 'af709d7f-883d-4f94-884c-b6010e0a415c', '52', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('3753e0a1-b943-4a00-838a-6e84c009fbf3', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '82', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('38e4229c-d1fc-4740-819b-035bc22c2d46', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '33', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('3f0b3fc6-5e74-452a-9982-aed2e3dd5cf5', 'af709d7f-883d-4f94-884c-b6010e0a415c', '64', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('46367a51-2f77-408a-b876-fa589d5c3ea3', 'af709d7f-883d-4f94-884c-b6010e0a415c', '56', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('46dc95c0-b025-4a67-ab47-a8a8615f7dcd', 'af709d7f-883d-4f94-884c-b6010e0a415c', '47', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('4d4be672-bd0c-471a-ae57-5fca6b40bcae', 'af709d7f-883d-4f94-884c-b6010e0a415c', '83', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('536505a1-e596-413a-8bd4-77734e17ec93', 'af709d7f-883d-4f94-884c-b6010e0a415c', '53', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('5786dff5-562e-4f54-9670-da655366cd3a', 'af709d7f-883d-4f94-884c-b6010e0a415c', '95', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('57bf7cbb-ff2e-4d5e-9bf4-85d4563a64fa', 'af709d7f-883d-4f94-884c-b6010e0a415c', '39', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('5902ba5b-afeb-4ed4-b689-8343e927bd06', 'af709d7f-883d-4f94-884c-b6010e0a415c', '97', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('5ab5333f-bee6-4a8f-8a23-e23f50605ba5', 'af709d7f-883d-4f94-884c-b6010e0a415c', '43', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('5e19028c-3226-4d17-98a8-4517c1c3864d', 'af709d7f-883d-4f94-884c-b6010e0a415c', '9', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('5ed8f5d6-5747-40c0-9baa-787f4d0763db', 'af709d7f-883d-4f94-884c-b6010e0a415c', '48', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('603c9d1d-5740-4c0b-8f4c-2b73bea70e95', 'af709d7f-883d-4f94-884c-b6010e0a415c', '108', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('62b2445f-9907-40fc-b662-698a413076ae', 'af709d7f-883d-4f94-884c-b6010e0a415c', '50', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('63342f63-030e-4976-bf54-5290ea328975', 'af709d7f-883d-4f94-884c-b6010e0a415c', '8', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('66a1fe7c-ca2c-4cb4-8c91-b363f18ae057', 'af709d7f-883d-4f94-884c-b6010e0a415c', '15', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('678e9556-01a1-4a36-a266-1ba8f781af47', 'af709d7f-883d-4f94-884c-b6010e0a415c', '87', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('68b05b28-0177-47f3-b03b-d30df7621da4', 'af709d7f-883d-4f94-884c-b6010e0a415c', '45', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('6b1e1c3a-53d3-4d20-a927-69fb6fbdb141', 'af709d7f-883d-4f94-884c-b6010e0a415c', '61', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('722c157c-ad59-4d92-a642-16f4e99db98d', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '6', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('723c2d50-ced3-4eb9-8007-f20fbbd897fe', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '16', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('726017fe-8cd7-41a8-834b-d79eb0055945', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '93', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('729185b8-3a7f-41d4-b9fb-975ff6cede10', 'af709d7f-883d-4f94-884c-b6010e0a415c', '49', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('73627f53-04af-4498-a307-c6e153005b08', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '32', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('738757e2-9442-41db-ab00-953580ee1112', 'af709d7f-883d-4f94-884c-b6010e0a415c', '98', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('73d00a8b-6736-46f4-9d1a-338e9619e525', 'af709d7f-883d-4f94-884c-b6010e0a415c', '2', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('73eed958-f022-498e-94c6-6295fa3c73c9', 'af709d7f-883d-4f94-884c-b6010e0a415c', '104', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('7561a0eb-de6d-40b3-ba18-a95631b0955d', 'af709d7f-883d-4f94-884c-b6010e0a415c', '60', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('77ce4af2-9452-45f6-a789-6817311b41f3', 'af709d7f-883d-4f94-884c-b6010e0a415c', '92', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('7a0119a4-dfef-457f-8188-c69f701e0a37', 'af709d7f-883d-4f94-884c-b6010e0a415c', '5', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('7b26d8d2-c716-4ab9-b10a-0b7653448b6c', 'af709d7f-883d-4f94-884c-b6010e0a415c', '3', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('7b2efca3-01e3-418c-9ffa-e7f21fc4ad12', 'af709d7f-883d-4f94-884c-b6010e0a415c', '65', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('7ed6392d-a32e-477f-bf1a-985ad8d6802b', 'af709d7f-883d-4f94-884c-b6010e0a415c', '67', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('7ef5aaca-98bf-4cb4-8dae-003a4e70474b', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '2', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('7f49eb60-cc7d-42f2-b572-37a8f12df84a', 'af709d7f-883d-4f94-884c-b6010e0a415c', '14', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('830813d0-48a1-45e0-8053-feea9b3729ad', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '80', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('83a70dee-96e2-4261-85fe-6346d47d8993', 'af709d7f-883d-4f94-884c-b6010e0a415c', '11', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('88bfddc5-5a06-423e-8b2b-acf7319ab095', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '56', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('8acd99f8-c981-4655-93cd-f7ba09364f94', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '34', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('8b671544-733e-491a-affd-3b13a94bd8b1', 'af709d7f-883d-4f94-884c-b6010e0a415c', '75', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('8c268dc1-94ed-49ad-8d01-0155f68c924b', 'af709d7f-883d-4f94-884c-b6010e0a415c', '34', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('8d5e3d6c-1e11-4dad-aa88-5903178a5615', 'af709d7f-883d-4f94-884c-b6010e0a415c', '70', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('8f66e1d3-14bd-4b44-9a71-564c26758f36', 'af709d7f-883d-4f94-884c-b6010e0a415c', '99', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('95ef040b-3e5e-4282-8e0d-a239b652cd53', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '12', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('9646dda1-87ca-4de7-ada6-1352dcba0cde', 'af709d7f-883d-4f94-884c-b6010e0a415c', '40', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('9677f06d-4f3a-4079-8235-0980f8a5c075', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '61', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('9af3ee04-b711-4b11-b5bd-0731b8839962', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '8', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('9b03b81a-0896-40b1-aeb1-e74b29cbb31a', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '7', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('9b565b4e-7521-4360-9f03-271beba9ce9d', 'af709d7f-883d-4f94-884c-b6010e0a415c', '37', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('9b7ffb2f-934e-412d-85ba-1e9300975acc', 'af709d7f-883d-4f94-884c-b6010e0a415c', '59', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('9d7183ce-114a-4d7c-b4ae-a8fbe84cb9fc', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '35', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('9efd03b9-b09f-4ac3-8186-031de14b095e', 'af709d7f-883d-4f94-884c-b6010e0a415c', '105', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('a2005640-1bad-41a8-88d4-29889df59545', 'af709d7f-883d-4f94-884c-b6010e0a415c', '103', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('a5a24749-c71e-410d-ae7f-9656a1728346', 'af709d7f-883d-4f94-884c-b6010e0a415c', '86', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('a94350e3-335a-452b-b38b-0dc95813cb9c', 'af709d7f-883d-4f94-884c-b6010e0a415c', '100', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('ac71b180-4af1-409d-a2b1-7e74675f3d75', 'af709d7f-883d-4f94-884c-b6010e0a415c', '33', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('afa4b645-1453-4f9e-bdc4-c8199cf09e4c', 'af709d7f-883d-4f94-884c-b6010e0a415c', '90', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('b0c4efe1-a0a9-4b64-8544-dcce334f0288', 'af709d7f-883d-4f94-884c-b6010e0a415c', '68', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('b32946b9-926a-4741-85d3-8a4e00c81875', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '13', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('b3325bec-39d4-4117-b8d6-8a6a5cea28c2', 'af709d7f-883d-4f94-884c-b6010e0a415c', '6', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('b7cca015-a070-4ca3-b77d-199adc1714e1', 'af709d7f-883d-4f94-884c-b6010e0a415c', '101', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('bb90a752-70c6-47c5-8903-228a2b1317b4', 'af709d7f-883d-4f94-884c-b6010e0a415c', '84', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('bcafb56f-b18f-4850-854a-26dfb6b1397d', 'af709d7f-883d-4f94-884c-b6010e0a415c', '69', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('bced9daa-f499-4efc-8eab-b52591b6a7af', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '81', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('beb707eb-b61a-4959-9b63-31cb747625d2', 'af709d7f-883d-4f94-884c-b6010e0a415c', '106', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('c2f7c44b-0029-4b19-91b3-1b80d17bdece', 'af709d7f-883d-4f94-884c-b6010e0a415c', '13', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('c4406b7f-8cbf-4c6f-b340-c53764d9fd78', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '11', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('c68b7664-2678-4c02-82f1-59db85b76b4e', 'af709d7f-883d-4f94-884c-b6010e0a415c', '88', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('c75c15d2-596d-43d7-9002-84d9958d7cd9', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '69', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('cb4f5ef4-4c92-42dc-8a03-82594f35dbec', 'af709d7f-883d-4f94-884c-b6010e0a415c', '41', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('d1c4c16a-d568-4da8-a08e-d5ed48e0e831', 'af709d7f-883d-4f94-884c-b6010e0a415c', '107', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('d32577e5-3d0a-4983-8e86-a5df4a583b85', 'af709d7f-883d-4f94-884c-b6010e0a415c', '32', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('d8dbe769-951d-41d9-9b04-f2b3a8402701', 'af709d7f-883d-4f94-884c-b6010e0a415c', '31', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('da307564-da9d-461b-9ef2-74efafeabd8b', 'af709d7f-883d-4f94-884c-b6010e0a415c', '72', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('db2c7bce-98cb-4159-b67b-4ebb8e2acd42', 'af709d7f-883d-4f94-884c-b6010e0a415c', '57', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('db71e1f6-c552-4a11-9f76-249390ae39e9', 'af709d7f-883d-4f94-884c-b6010e0a415c', '36', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('dbd41e3e-fd9d-4bee-9ae3-dc757b21fe62', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '73', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('dd3a46c8-fff9-491c-bf30-20f863a40d81', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '5', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('de6a74eb-a4e3-4a8f-93fa-70ad203adb7d', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '3', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('e03047fc-8e39-4f1b-82e3-5ecdeececc2b', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '15', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('e05e8f49-4960-41ad-91b0-e6db493d6612', 'af709d7f-883d-4f94-884c-b6010e0a415c', '51', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('e05f3165-2bd6-4dac-922d-ab4ab5346193', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '65', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('e3c98de8-acc6-4c50-a842-0f071c273d16', 'af709d7f-883d-4f94-884c-b6010e0a415c', '89', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('e4cccb74-67b5-48ee-bce9-01b4e064d7bf', 'af709d7f-883d-4f94-884c-b6010e0a415c', '7', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('e5fb25e8-8368-4f59-9ec5-d3d188bfaff4', 'af709d7f-883d-4f94-884c-b6010e0a415c', '96', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('e72e18ce-c07e-423c-834c-bc1efdb3c393', 'af709d7f-883d-4f94-884c-b6010e0a415c', '85', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('e766a989-b4f3-4b34-98e6-6b4bfe188a83', 'af709d7f-883d-4f94-884c-b6010e0a415c', '66', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('ed798dc2-3edb-4510-ad44-4c7524fe2ae2', 'af709d7f-883d-4f94-884c-b6010e0a415c', '91', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('ef93dcb8-1f45-4e68-9775-2133af010f37', 'af709d7f-883d-4f94-884c-b6010e0a415c', '62', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('f04586d6-6b6a-476e-9628-b963e1572da6', 'af709d7f-883d-4f94-884c-b6010e0a415c', '46', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('f3695004-c751-4ebe-b961-68cce042b38d', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '87', '2022-06-23 14:27:25', '2022-06-23 14:27:25');
INSERT INTO `mg_roles_menus` VALUES ('f45d5837-8dc9-4be5-b9bc-8fa0b2e0c93e', 'af709d7f-883d-4f94-884c-b6010e0a415c', '54', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('f8f14821-06fc-4672-b267-3b2414d8719b', 'af709d7f-883d-4f94-884c-b6010e0a415c', '102', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('fb9e4cb1-6ab7-4e80-9462-99d29eee8b18', 'af709d7f-883d-4f94-884c-b6010e0a415c', '10', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('feaf30bd-85bf-4dfa-9575-b2aa83a2f1fe', 'af709d7f-883d-4f94-884c-b6010e0a415c', '82', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('ff84173f-0e65-4d9f-bbfa-42a398458329', 'af709d7f-883d-4f94-884c-b6010e0a415c', '16', '2022-06-24 17:52:07', '2022-06-24 17:52:07');
INSERT INTO `mg_roles_menus` VALUES ('fffab0a2-4644-4ba7-a57f-e8f5f0788ee0', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '49', '2022-06-23 14:27:25', '2022-06-23 14:27:25');

-- ----------------------------
-- Table structure for mg_socials
-- ----------------------------
DROP TABLE IF EXISTS `mg_socials`;
CREATE TABLE `mg_socials`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社交图标提示title',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社交个体的图标iconfont',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标颜色',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社交链接',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社交文字说明',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社交图片',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_socials
-- ----------------------------
INSERT INTO `mg_socials` VALUES ('25db3bee-d798-4bb3-abfd-c8b8d3e0fa60', '博客园', 'icon-blog', '#2E7ACC', 'https://www.cnblogs.com/zy-mg/', NULL, NULL, '2022-05-22 13:55:31', '2022-05-22 13:59:10');
INSERT INTO `mg_socials` VALUES ('4f92bd85-5c4c-4adc-98ac-a0ce4b5d0816', '知乎', 'icon-shejiaotubiao-46', '#0196FE', 'https://www.zhihu.com/people/mang-guo-kuai-shou', NULL, NULL, '2022-05-22 14:00:56', '2022-05-22 14:00:56');
INSERT INTO `mg_socials` VALUES ('64d7068d-2fd6-4906-971f-4f588340281e', '邮箱', 'icon-youxiang1', '#F0850E', NULL, '1840354092@qq.com', NULL, '2022-05-07 17:09:23', '2022-05-07 17:26:21');
INSERT INTO `mg_socials` VALUES ('90490802-b8c3-4766-85b5-82904a27cd5e', 'Gitee', 'icon-gitee', '#ff6d6d', 'https://gitee.com/Z568_568', '', '', '2022-04-24 10:55:49', '2022-04-24 10:55:49');
INSERT INTO `mg_socials` VALUES ('acfe1269-ef2c-49bd-829c-28c8f53ec057', 'github', 'icon-github', '#24292F', 'https://github.com/ZHYI-source', NULL, NULL, '2022-05-08 20:19:42', '2022-05-08 20:19:42');

-- ----------------------------
-- Table structure for mg_sorts
-- ----------------------------
DROP TABLE IF EXISTS `mg_sorts`;
CREATE TABLE `mg_sorts`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sort_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `sort_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类描述',
  `sort_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类页面路径',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_sorts
-- ----------------------------
INSERT INTO `mg_sorts` VALUES ('1ba60c63-9cf9-4e98-9858-c934f44aa511', '后端', '后端相关文章', '/comment/index', '2022-04-17 11:11:26', '2022-04-26 14:08:23');
INSERT INTO `mg_sorts` VALUES ('4ecc1acc-e2fa-489c-a288-ce8fd8bfa132', '小程序', 'uniapp相关技术', NULL, '2022-05-20 19:20:05', '2022-05-20 19:20:05');
INSERT INTO `mg_sorts` VALUES ('9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', '前端', '前端相关文章', '/comment/index', '2022-04-17 11:26:37', '2022-04-26 14:08:06');
INSERT INTO `mg_sorts` VALUES ('d8fe526f-b9a3-44c2-9cee-625b84f2156c', '日记', '记录工作中的日常笔记', NULL, '2022-05-08 19:11:44', '2022-05-08 19:11:44');

-- ----------------------------
-- Table structure for mg_tags
-- ----------------------------
DROP TABLE IF EXISTS `mg_tags`;
CREATE TABLE `mg_tags`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `tag_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签描述',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_tags
-- ----------------------------
INSERT INTO `mg_tags` VALUES ('113198e4-6c8e-402d-8738-9dbf27583d80', 'react-router-dom.V6', NULL, '2022-06-17 09:42:20', '2022-06-17 09:42:20');
INSERT INTO `mg_tags` VALUES ('3508d25d-383a-41ac-8992-436f7c12e46d', 'CSS3', NULL, '2022-05-20 19:16:25', '2022-05-20 19:16:25');
INSERT INTO `mg_tags` VALUES ('5ebf25ef-93ed-4625-8cb0-b8c185f2ee55', 'blog', NULL, '2022-05-20 19:18:35', '2022-05-20 19:18:35');
INSERT INTO `mg_tags` VALUES ('7cef493a-1070-4de7-a8e0-7637d3ed4cce', '小程序', NULL, '2022-05-20 19:17:27', '2022-05-20 19:17:27');
INSERT INTO `mg_tags` VALUES ('86c6f25e-580e-4ec2-87b8-14c1f272d5a0', 'JavaScript', NULL, '2022-05-09 14:35:37', '2022-05-20 19:16:46');
INSERT INTO `mg_tags` VALUES ('8f3bd5f0-1cec-42e9-86cc-78d917f70fa4', 'Redux', NULL, '2022-06-17 09:41:52', '2022-06-17 09:41:52');
INSERT INTO `mg_tags` VALUES ('acca07b2-3ae4-4f09-9aa6-e3eec4e5745d', 'mysql', NULL, '2022-05-07 22:28:31', '2022-05-07 22:28:31');
INSERT INTO `mg_tags` VALUES ('bb2bcdff-249d-4663-b95c-426c9e4ac5db', 'react.js', 'react.js', '2022-04-16 21:36:42', '2022-05-07 22:27:35');
INSERT INTO `mg_tags` VALUES ('beaea537-24ad-45a1-93e3-cac43f2a735e', 'vue.js', '', '2022-04-16 20:46:36', '2022-05-08 16:14:23');
INSERT INTO `mg_tags` VALUES ('c12dc649-f95f-4b17-9a38-82f6cbd1d2e5', 'node.js', 'node.js', '2022-04-17 11:25:42', '2022-05-07 22:27:58');
INSERT INTO `mg_tags` VALUES ('c1872f4e-7b81-44c0-ad07-7657530d6fac', 'Html5', NULL, '2022-05-20 19:17:03', '2022-05-20 19:17:03');
INSERT INTO `mg_tags` VALUES ('e973bae4-a895-4c6e-8400-c52ce2594cb0', 'express.js', ' ', '2022-04-17 11:15:04', '2022-05-07 22:28:10');
INSERT INTO `mg_tags` VALUES ('f78f1211-08e6-4cac-8ec4-8a9878f9d0cb', 'sequlize', 'sequlize', '2022-04-16 20:50:13', '2022-05-07 22:28:23');
INSERT INTO `mg_tags` VALUES ('f7c91cca-8c5a-4a5b-919e-1b5bc024b8d7', 'uniApp', NULL, '2022-05-20 19:17:15', '2022-05-20 19:17:15');

-- ----------------------------
-- Table structure for mg_users
-- ----------------------------
DROP TABLE IF EXISTS `mg_users`;
CREATE TABLE `mg_users`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'admin' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Vchs0bbdk2pr/Ac6DsHruw==' COMMENT '密码',
  `nickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'John Doe' COMMENT '昵称',
  `verificationCode` int(11) NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL COMMENT '创建时间',
  `updatedAt` datetime NOT NULL COMMENT '更新时间',
  `roleId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_users
-- ----------------------------
INSERT INTO `mg_users` VALUES ('cb404a29-c68f-495f-97f0-d3d0e8369853', 'editor', 'Vchs0bbdk2pr/Ac6DsHruw==', 'Editor', NULL, '2022-04-28 17:49:36', '2022-05-30 09:35:05', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', 1);
INSERT INTO `mg_users` VALUES ('e5d03ffa-39ee-42d5-a9e3-2bba1c987bd1', 'admin', 'Vchs0bbdk2pr/Ac6DsHruw==', '芒果快熟', NULL, '2022-04-26 21:53:54', '2022-05-06 17:34:41', 'af709d7f-883d-4f94-884c-b6010e0a415c', 1);

-- ----------------------------
-- Table structure for mg_visitor
-- ----------------------------
DROP TABLE IF EXISTS `mg_visitor`;
CREATE TABLE `mg_visitor`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `count` int(11) NULL DEFAULT NULL COMMENT '访问次数',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `type` int(11) NULL DEFAULT NULL COMMENT '项目类型',
  `ipaddr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `loginLocation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_visitor
-- ----------------------------
INSERT INTO `mg_visitor` VALUES ('1506bbb2-ccd1-48d3-9888-80693f684772', 2, 'visitor', 'Chrome.v102', 'Windows_NT10.0.19044 x64', 0, '117.188.31.208', '中国-贵州-贵阳', '2022-06-19 14:39:37', '2022-06-19 14:39:42');
INSERT INTO `mg_visitor` VALUES ('3bd0d2e7-0444-4796-a3b5-a9d35c200bd6', 3, 'visitor', 'Chrome.v102', 'Windows_NT10.0.19044 x64', 1, '111.121.10.219', '中国-贵州-贵阳', '2022-06-22 15:02:44', '2022-06-22 15:57:58');
INSERT INTO `mg_visitor` VALUES ('d141ead3-df34-4d75-aa37-d5d0c523f0fc', 5, 'visitor', 'Chrome.v102', 'Windows_NT10.0.19044 x64', 1, '111.121.46.173', '中国-贵州-贵阳', '2022-06-23 09:41:22', '2022-06-23 14:22:33');

-- ----------------------------
-- Table structure for mg_website
-- ----------------------------
DROP TABLE IF EXISTS `mg_website`;
CREATE TABLE `mg_website`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点主头像',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `slogan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点格言',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点主页',
  `notice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点通知',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点描述',
  `globalStyle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点全局样式：公祭日置灰等',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of mg_website
-- ----------------------------
INSERT INTO `mg_website` VALUES ('7d5a2521-9a6d-410d-8531-f07afe4c3b92', 'http://zhouyi.run:5222/api/public/admin/getFiles?id=5d38c26acf509bdcab4f8c677ce90088.png&&mimetype=image/png', 'MG′blog', 'Be encouraged in time, time waits for no one.', 'https://www.zhouyi.run', '及时当勉励，岁月不待人。欢迎访问我的博客.项目源码在上方', '一个It技术的探索者', '', '2022-04-23 13:00:04', '2022-05-29 20:09:44');

SET FOREIGN_KEY_CHECKS = 1;
