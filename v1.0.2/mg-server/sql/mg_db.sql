/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : mg_db

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 29/05/2022 16:52:15
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mg_about
-- ----------------------------
INSERT INTO `mg_about` VALUES ('aec4181a-bcab-4e7f-aa93-189c38a2ca87', '来的哼', '2022-04-23 13:00:29', '2022-04-23 13:00:29');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mg_article_tags
-- ----------------------------
INSERT INTO `mg_article_tags` VALUES ('84e3d084-cc32-4f94-a3ec-0c86049dce47', '1efd6089-a61b-4db7-8808-65a8eea113b3', '141b1b1e-b233-4182-bfb1-876cd88cd690', '2022-04-24 15:54:42', '2022-04-24 15:54:42');
INSERT INTO `mg_article_tags` VALUES ('a86d0d2e-e52f-4fee-9a89-9dc5b5b2b3c5', '02053028-dec5-459a-a8e5-9c94815a7029', 'f78f1211-08e6-4cac-8ec4-8a9878f9d0cb', '2022-04-24 10:43:52', '2022-04-24 10:43:52');
INSERT INTO `mg_article_tags` VALUES ('c5dd2a90-77cf-4f2c-a3ce-fc2e603696af', 'f3a478df-b157-4f1d-9bc2-bd068cd6eacc', 'beaea537-24ad-45a1-93e3-cac43f2a735e', '2022-04-24 12:23:28', '2022-04-24 12:23:28');
INSERT INTO `mg_article_tags` VALUES ('c7b251d3-c8f5-4811-8b33-820d3e7d2a10', '3c844314-736d-4359-ba5b-cac19640ca6c', 'beaea537-24ad-45a1-93e3-cac43f2a735e', '2022-04-23 23:23:34', '2022-04-23 23:23:34');
INSERT INTO `mg_article_tags` VALUES ('e536f8a4-909d-45a0-9337-c27311aaad73', '02053028-dec5-459a-a8e5-9c94815a7029', 'beaea537-24ad-45a1-93e3-cac43f2a735e', '2022-04-24 10:43:52', '2022-04-24 10:43:52');

-- ----------------------------
-- Table structure for mg_articles
-- ----------------------------
DROP TABLE IF EXISTS `mg_articles`;
CREATE TABLE `mg_articles`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sort_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类ID',
  `article_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `article_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `article_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa3rMMTNtwMeiHwh3ZBJ-dHyg84iWK04GGyA&usqp=CAU' COMMENT '文章封面',
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mg_articles
-- ----------------------------
INSERT INTO `mg_articles` VALUES ('02053028-dec5-459a-a8e5-9c94815a7029', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', '5个一定要学会的JavaScript新特性', '#### 1.# 使用\"Object.hasOwn\"替代“in”操作符\n\n有时，我们想知道对象上是否存在某个属性，一般会使用“in”操作符或“obj.hasOwnProperty”，但它们都有各自的缺陷。\nin 如果指定的属性位于对象或其原型链中，“in”运算符将返回true。\n\n``` js\nconst Person = function (age) {\n  this.age = age\n}\nPerson.prototype.name = \'fatfish\'\n\nconst p1 = new Person(24)\nconsole.log(\'age\' in p1) // true \nconsole.log(\'name\' in p1) // true  注意这里\n\n```', 'http://localhost:3001/api/public/admin/getFiles?id=90e858a15a292cdff1bf0362acd1b9fb.png&&mimetype=image/png', 1, 18, 4, '2022-04-24 10:43:52', '2022-04-24 15:41:16', '\"5个一定要学会的JavaScript新特性\"', 0, 0, 1, NULL, 'md');
INSERT INTO `mg_articles` VALUES ('0e74d95a-5277-4297-96b0-10994ff27884', '1ba60c63-9cf9-4e98-9858-c934f44aa511', 'JavaScript新特性', '<div>\n<blockquote>\n<p>也许你我素未谋面，但很可能相见恨晚，我是<strong>前端胖头鱼</strong></p>\n</blockquote>\n<h2 data-id=\"heading-0\">前言</h2>\n<p>JavaScript在不断地升级迭代，越来越多的新特性让我们的代码写起来变得简洁有趣，这篇文章会介绍5个新特性，一起研究一下把。</p>\n<h2 data-id=\"heading-1\">1.# 使用\"Object.hasOwn\"替代&ldquo;in&rdquo;操作符</h2>\n<p>有时，我们想知道对象上是否存在某个属性，一般会使用&ldquo;in&rdquo;操作符或&ldquo;obj.hasOwnProperty&rdquo;，但它们都有各自的缺陷。</p>\n<p><strong>in</strong></p>\n<p>如果指定的属性位于对象或其原型链中，&ldquo;in&rdquo;运算符将返回true。</p>\n<pre><code class=\"hljs language-javascript copyable\" lang=\"javascript\"><span class=\"hljs-keyword\">const</span> Person = <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\">age</span>) </span>{\n  <span class=\"hljs-built_in\">this</span>.age = age\n}\nPerson.prototype.name = <span class=\"hljs-string\">\'fatfish\'</span>\n\n<span class=\"hljs-keyword\">const</span> p1 = <span class=\"hljs-keyword\">new</span> Person(<span class=\"hljs-number\">24</span>)\n<span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'age\'</span> <span class=\"hljs-keyword\">in</span> p1) <span class=\"hljs-comment\">// true </span>\n<span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-string\">\'name\'</span> <span class=\"hljs-keyword\">in</span> p1) <span class=\"hljs-comment\">// true  注意这里</span>\n<span class=\"copy-code-btn\">复制代码</span></code></pre>\n<p><strong>obj.hasOwnProperty</strong></p>\n<p><code>hasOwnProperty</code> 方法会返回一个布尔值，表示对象<strong>自身属性</strong>中是否具有对应的值（原型链上的属性不会读取）。</p>\n<pre><code class=\"hljs language-javascript copyable\" lang=\"javascript\"><span class=\"hljs-keyword\">const</span> Person = <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\">age</span>) </span>{\n  <span class=\"hljs-built_in\">this</span>.age = age\n}\nPerson.prototype.name = <span class=\"hljs-string\">\'fatfish\'</span>\n\n<span class=\"hljs-keyword\">const</span> p1 = <span class=\"hljs-keyword\">new</span> Person(<span class=\"hljs-number\">24</span>)\n<span class=\"hljs-built_in\">console</span>.log(p1.hasOwnProperty(<span class=\"hljs-string\">\'age\'</span>)) <span class=\"hljs-comment\">// true </span>\n<span class=\"hljs-built_in\">console</span>.log(p1.hasOwnProperty(<span class=\"hljs-string\">\'name\'</span>)) <span class=\"hljs-comment\">// fasle  注意这里</span>\n\n<span class=\"copy-code-btn\">复制代码</span></code></pre>\n<p><code>obj.hasOwnProperty</code>已经可以过滤掉原型链上的属性，但在某些情况下，它还是不安全。</p>\n<pre><code class=\"hljs language-javascript copyable\" lang=\"javascript\"><span class=\"hljs-built_in\">Object</span>.create(<span class=\"hljs-literal\">null</span>).hasOwnProperty(<span class=\"hljs-string\">\'name\'</span>)\n<span class=\"hljs-comment\">// Uncaught TypeError: Object.create(...).hasOwnProperty is not a function</span>\n\n<span class=\"copy-code-btn\">复制代码</span></code></pre>\n<p><strong>Object.hasOwn</strong></p>\n<p>别急，我们可以使用<code>Object.hasOwn</code>来避免这两个问题，这比&ldquo;obj.hasOwnProperty&rdquo;方法更加方便、安全。</p>\n<pre><code class=\"hljs language-javascript copyable\" lang=\"javascript\"><span class=\"hljs-keyword\">let</span> object = { <span class=\"hljs-attr\">age</span>: <span class=\"hljs-number\">24</span> }\n<span class=\"hljs-built_in\">Object</span>.hasOwn(object, <span class=\"hljs-string\">\'age\'</span>) <span class=\"hljs-comment\">// true</span>\n<span class=\"hljs-keyword\">let</span> object2 = <span class=\"hljs-built_in\">Object</span>.create({ <span class=\"hljs-attr\">age</span>: <span class=\"hljs-number\">24</span> })\n<span class=\"hljs-built_in\">Object</span>.hasOwn(object2, <span class=\"hljs-string\">\'age\'</span>) <span class=\"hljs-comment\">// false  </span>\n<span class=\"hljs-keyword\">let</span> object3 = <span class=\"hljs-built_in\">Object</span>.create(<span class=\"hljs-literal\">null</span>)\n<span class=\"hljs-built_in\">Object</span>.hasOwn(object3, <span class=\"hljs-string\">\'age\'</span>) <span class=\"hljs-comment\">// false </span>\n\n<span class=\"copy-code-btn\">复制代码</span></code></pre>\n<h2 data-id=\"heading-2\">2.# 使用\"#\"声明私有属性</h2>\n<p>以前，我们一般用<code>_</code>表示私有属性，但它并不靠谱，还是会被外部修改。</p>\n<pre><code class=\"hljs language-javascript copyable\" lang=\"javascript\"><span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">Person</span> </span>{\n  <span class=\"hljs-title\">constructor</span> (<span class=\"hljs-params\">name</span>) {\n    <span class=\"hljs-built_in\">this</span>._money = <span class=\"hljs-number\">1</span>\n    <span class=\"hljs-built_in\">this</span>.name = name\n  }\n  get money () {\n    <span class=\"hljs-keyword\">return</span> <span class=\"hljs-built_in\">this</span>._money\n  }\n  set money (money) {\n    <span class=\"hljs-built_in\">this</span>._money = money\n  }\n  showMoney () {\n    <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-built_in\">this</span>._money)\n  }\n}\n<span class=\"hljs-keyword\">const</span> p1 = <span class=\"hljs-keyword\">new</span> Person(<span class=\"hljs-string\">\'fatfish\'</span>)\n<span class=\"hljs-built_in\">console</span>.log(p1.money) <span class=\"hljs-comment\">// 1</span>\n<span class=\"hljs-built_in\">console</span>.log(p1._money) <span class=\"hljs-comment\">// 1</span>\np1._money = <span class=\"hljs-number\">2</span> <span class=\"hljs-comment\">// 依旧可以从外部修改_money属性，所以这种做法并不安全</span>\n<span class=\"hljs-built_in\">console</span>.log(p1.money) <span class=\"hljs-comment\">// 2</span>\n<span class=\"hljs-built_in\">console</span>.log(p1._money) <span class=\"hljs-comment\">// 2</span>\n\n<span class=\"copy-code-btn\">复制代码</span></code></pre>\n<p><strong>使用&ldquo;#&rdquo;实现真正私有属性</strong></p>\n<pre><code class=\"hljs language-javascript copyable\" lang=\"javascript\"><span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">Person</span> </span>{\n  #money=<span class=\"hljs-number\">1</span>\n  <span class=\"hljs-title\">constructor</span> (<span class=\"hljs-params\">name</span>) {\n    <span class=\"hljs-built_in\">this</span>.name = name\n  }\n  get money () {\n    <span class=\"hljs-keyword\">return</span> <span class=\"hljs-built_in\">this</span>.#money\n  }\n  set money (money) {\n    <span class=\"hljs-built_in\">this</span>.#money = money\n  }\n  showMoney () {\n    <span class=\"hljs-built_in\">console</span>.log(<span class=\"hljs-built_in\">this</span>.#money)\n  }\n}\n<span class=\"hljs-keyword\">const</span> p1 = <span class=\"hljs-keyword\">new</span> Person(<span class=\"hljs-string\">\'fatfish\'</span>)\n<span class=\"hljs-built_in\">console</span>.log(p1.money) <span class=\"hljs-comment\">// 1</span>\n<span class=\"hljs-comment\">// p1.#money = 2 // 没法从外部直接修改</span>\np1.money = <span class=\"hljs-number\">2</span>\n<span class=\"hljs-built_in\">console</span>.log(p1.money) <span class=\"hljs-comment\">// 2</span>\n<span class=\"hljs-built_in\">console</span>.log(p1.#money) <span class=\"hljs-comment\">// Uncaught SyntaxError: Private field \'#money\' must be declared in an enclosing class</span>\n\n\n<span class=\"copy-code-btn\">复制代码</span></code></pre>\n<h2 data-id=\"heading-3\">3.# 超有用的\"数字分隔符\"</h2>\n<p>直接看例子，惊呆了我...</p>\n<pre><code class=\"hljs language-javascript copyable\" lang=\"javascript\"><span class=\"hljs-keyword\">const</span> sixBillion = <span class=\"hljs-number\">6000000000</span>\n<span class=\"hljs-comment\">// ❌ 难以阅读</span>\n<span class=\"hljs-keyword\">const</span> sixBillion2 = <span class=\"hljs-number\">6000_000_000</span>\n<span class=\"hljs-comment\">// ✅ 更加易于阅读</span>\n<span class=\"hljs-built_in\">console</span>.log(sixBillion2) <span class=\"hljs-comment\">// 6000000000</span>\n\n<span class=\"copy-code-btn\">复制代码</span></code></pre>\n<p>当然也可以使用\"_\"用于计算</p>\n<pre><code class=\"hljs language-javascript copyable\" lang=\"javascript\"><span class=\"hljs-keyword\">const</span> sum = <span class=\"hljs-number\">1000</span> + <span class=\"hljs-number\">6000_000_000</span> <span class=\"hljs-comment\">// 6000001000</span>\n<span class=\"copy-code-btn\">复制代码</span></code></pre>\n<h2 data-id=\"heading-4\">4.# 使用\"?.\"简化\"&amp;&amp;\"和三元运算符</h2>\n<p>这些例子，你一定非常熟悉，咱们有办法可以简化它吗？</p>\n<pre><code class=\"hljs language-javascript copyable\" lang=\"javascript\"><span class=\"hljs-keyword\">const</span> obj = <span class=\"hljs-literal\">null</span>\n<span class=\"hljs-built_in\">console</span>.log(obj &amp;&amp; obj.name)\n<span class=\"hljs-keyword\">const</span> $title = <span class=\"hljs-built_in\">document</span>.querySelector(<span class=\"hljs-string\">\'.title\'</span>)\n<span class=\"hljs-keyword\">const</span> title = $title ? title.innerText : <span class=\"hljs-literal\">undefined</span>\n\n<span class=\"copy-code-btn\">复制代码</span></code></pre>\n<p><strong>&ldquo;?.&rdquo;</strong></p>\n<pre><code class=\"hljs language-javascript copyable\" lang=\"javascript\"><span class=\"hljs-keyword\">const</span> obj = <span class=\"hljs-literal\">null</span>\n<span class=\"hljs-built_in\">console</span>.log(obj?.name)\n<span class=\"hljs-keyword\">const</span> $title = <span class=\"hljs-built_in\">document</span>.querySelector(<span class=\"hljs-string\">\'.title\'</span>)\n<span class=\"hljs-keyword\">const</span></code><code class=\"hljs language-javascript copyable\" lang=\"javascript\"> title = $title?.innerText</code><code class=\"hljs language-javascript copyable\" lang=\"javascript\">\n\n<span class=\"copy-code-btn\">复制代码</span></code></pre>\n<p><strong>Tips</strong></p>\n<p><strong>?.</strong> 的一般用法</p>\n<ol>\n<li>obj?.prop 对象属性</li>\n<li>obj?.[expr] 对象属性</li>\n<li>func?.(...args) 执行函数</li>\n</ol>\n<h2 data-id=\"heading-5\">5.# 使用\"BigInt\"支持大数计算</h2>\n<p>JS中超过&ldquo;Number.MAX_SAFE_INTEGER&rdquo;的数字计算将是不安全的。</p>\n<p><strong>Example:</strong></p>\n<pre><code class=\"hljs language-javascript copyable\" lang=\"javascript\"><span class=\"hljs-built_in\">Math</span>.pow(<span class=\"hljs-number\">2</span>, <span class=\"hljs-number\">53</span>) === <span class=\"hljs-built_in\">Math</span>.pow(<span class=\"hljs-number\">2</span>, <span class=\"hljs-number\">53</span>) + <span class=\"hljs-number\">1</span> <span class=\"hljs-comment\">// true</span>\n<span class=\"hljs-comment\">// Math.pow(2, 53) =&gt; 9007199254740992</span>\n<span class=\"hljs-comment\">// Math.pow(2, 53) + 1 =&gt; 9007199254740992</span>\n<span class=\"copy-code-btn\">复制代码</span></code></pre>\n<p>使用\"BigInt\"完全可以避免这个问题</p>\n<pre><code class=\"hljs language-javascript copyable\" lang=\"javascript\"><span class=\"hljs-built_in\">BigInt</span>(<span class=\"hljs-built_in\">Math</span>.pow(<span class=\"hljs-number\">2</span>, <span class=\"hljs-number\">53</span>)) === <span class=\"hljs-built_in\">BigInt</span>(<span class=\"hljs-built_in\">Math</span>.pow(<span class=\"hljs-number\">2</span>, <span class=\"hljs-number\">53</span>)) + <span class=\"hljs-built_in\">BigInt</span>(<span class=\"hljs-number\">1</span>) <span class=\"hljs-comment\">// false</span>\n\n<span class=\"copy-code-btn\">复制代码</span></code></pre>\n<h2 data-id=\"heading-6\">最后</h2>\n<p>希望能一直给大家分享实用、基础、进阶的知识点，一起早早下班，快乐摸鱼。</p>\n<p>期待你在<strong>掘金</strong>关注我：<strong>前端胖头鱼</strong>，也可以在<strong>公众号</strong>里找到我：<strong>前端胖头鱼</strong>。</p>\n</div>', 'http://localhost:3001/api/public/admin/getFiles?id=b79ca5d9f281f132fc1c02d6253b7252.jfif&&mimetype=image/jpeg', 1, 26, 0, '2022-04-24 10:45:58', '2022-04-29 13:49:09', '\"JavaScript新特性\"', 1, 1, 1, NULL, 'mce');
INSERT INTO `mg_articles` VALUES ('1efd6089-a61b-4db7-8808-65a8eea113b3', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', 'JavaScript在不断地升级迭代', '> 也许你我素未谋面，但很可能相见恨晚，我是前端芒果\n\n### 前言:black_nib:\nJavaScript在不断地升级迭代，越来越多的新特性让我们的代码写起来变得简洁有趣，这篇文章会介绍5个新特性，一起研究一下把。\n### 1.# 使用\"Object.hasOwn\"替代“in”操作符:black_nib:\n有时，我们想知道对象上是否存在某个属性，一般会使用“in”操作符或“obj.hasOwnProperty”，但它们都有各自的缺陷。\n``` js\nconst Person = function (age) {\n  this.age = age\n}\nPerson.prototype.name = \'fatfish\'\n\nconst p1 = new Person(24)\nconsole.log(\'age\' in p1) // true \nconsole.log(\'name\' in p1) // true  注意这里\n```\n**hasOwnProperty** 方法会返回一个布尔值，表示对象自身属性中是否具有对应的值（原型链上的属性不会读取）。\n``` js\nObject.create(null).hasOwnProperty(\'name\')\n```\n### 2.# 使用\"#\"声明私有属性:black_nib:\n内容\n\n### 最后 :black_nib:\n希望能一直给大家分享实用、基础、进阶的知识点，一起早早下班', 'http://localhost:3001/api/public/admin/getFiles?id=4a8bd0bc19ce5336c21e49560069d240.jpg&&mimetype=image/jpeg', 1, 4, 0, '2022-04-24 15:54:42', '2022-05-05 19:51:57', '\"JavaScript在不断地升级迭代\"', 1, 0, 1, NULL, 'md');
INSERT INTO `mg_articles` VALUES ('3c844314-736d-4359-ba5b-cac19640ca6c', '9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', '没事的罚款决定书', '>Express-Mysql-Server 项目是一套 集成 express sequelize swagger-ui 框架 api 模板，\n***\n:smiley:\n\n![七龙珠](https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1269952892,3525182336&fm=26&gp=0.jpg)\n\n[Gitee](https://gitee.com/Z568_568)\n\n\"Express-Mysql-Server\"\n一个 \"开箱即用\" node接口服务模板去快速开始你的项目！\n|名称|办公|column3|\n|-|-|-|\n|content1|content2|content3|\n目录\n详细上手指南\n开发前的配置要求\n安装步骤\n文件目录说明\n部署\n使用到的框架\n版本控制\n作者\n详细上手指南\n开发前的配置要求\n1. node.js 环境\n2. Express.js 框架\n3. IDEA / WebStorm / VS Code 开发工具\n4. Navicat 可视化数据库\n5. apiPost / postman 接口调试工具\n安装步骤\n克隆本项目代码\ngit clone https://gitee.com/Z568_568/zy-express-sequelize-mysql.git\n安装依赖\nnpm install\n3.打开 Navicat软件 创建数据库 mk_db,运行sql文件\n\n4.配置数据库信息 文件 config/db.config.js\n\n``` js\n  HOST: \"localhost\",\n    USER: \"root\",\n    PASSWORD: \"root\",\n    DB: \"mk_db\",\n    dialect: \"mysql\",\n    pool: {\n        max: 5,\n        min: 0,\n        acquire: 30000,\n        idle: 10000\n    },\n// 配置文件上传地址信息 文件 config/upload.config.js\nmodule.exports = {\n    \"baseURL\":\"http://localhost:3001\",\n}\n```\n6.启动项目\n\nnodemon app.js (热加载)  or  node app.js\n7.启动成功示例\n\n项目启动成功: http://localhost:3001\n接口文档地址: http://localhost:3001/swagger\n8.测试接口: 打开postman / apiPost 软件 输入获取验证码接口地址\n\n注意： 测试接口中 \'/api/private/\' 开头的接口地址都需要进行token验证，在请求头 header中加入 authorization 并携带 token\n\n获取 token 需要在 登录接口进行登录后用户名：admin 密码：123456 返回 token\n\neg:获取验证码接口 （无需token验证）\n\n GET http://localhost:3001/api/public/v1/captcha \n响应结果是 Svg 格式\n**********************\n``` js\n  {\n	\"data\": {\n		\"codeSvg\": \"<svg xmlns=\\\"http://www.w3.org/2000/svg\\\"....></svg>\",\n		\"codeText\": \"06PEo3AZTK41g7oA7paQAg==\",\n		\"key\": 1649573015653\n	},\n	\"meta\": {\n		\"msg\": \"获取验证码成功\",\n		\"status\": 200\n	}\n}\n```\n9.上面的步骤都已经成功，你就可以开始 增加模块进行 接口开发 并且加上规范的swagger注解后 自动生成接口文档。快去试试吧\n\n文件目录说明\n\n``` js\n├── README.md\n├── cheese.log                日志记录文件\n├── app.js                    入口文件\n├── .env                      环境配置文件\n├── /utils/                   工具方法文件夹\n│  ├── /swagger/              swagger配置文件夹\n│  │  ├── utils.resextra.js   统一响应格式\n│  │  └── utils.loger.js      日志记录配置文件\n│  │  └── ...\n├── /uploads_files/           上传图片存放的文件夹\n│  │  │ \n├── /routes/                  接口路由文件夹\n│  ├── /api/                  api文件夹\n│  │  ├── /private/           存放需要权限token的接口文件夹\n│  │  │  ├── ...    \n│  │  │  │ \n│  │  └── /public/            存放无需token校验的接口\n│  │  │  ├── ...\n│  │  │  │ \n├── /models/                  数据模型和定义\n│  ├── index.js               sequelize 实例 和 模型主入口\n│  ├── ...\n│  │ \n├── /dao/                     数据库查询方法\n│  ├── DAO                    公共数据库查询方法\n│  ├── ...\n├── /controllers/             控制层 处理具体业务\n│  ├── ...\n└──/config/                   数据库等其他配置文件\n│  ├── ...\n└──└──\n```\n \n部署\n暂无\n\n使用到的框架\n``` js\nExpress.js\nSequelize\nSwagger-ui\n```\n版本控制\n该项目使用Git进行版本管理。\n\n作者\n1840354092@qq.com\n\n知乎:芒果快熟   qq:1840354092', 'http://localhost:3001/api/public/admin/getFiles?id=87122ba1894d5d5ce41763fb4b5c47a9.png&&mimetype=image/png', 1, 26, 0, '2022-04-23 23:23:34', '2022-05-05 19:53:40', '\"没事的罚款决定书\"', 0, 0, 1, NULL, 'md');
INSERT INTO `mg_articles` VALUES ('646d84af-baa6-4e11-b4aa-f0870e0c0c0f', '1ba60c63-9cf9-4e98-9858-c934f44aa511', '你说神农', '使用  \n``` js\n  active-text\n```   \n## 属性与inactive-text属性来设置开关的文字描述。\n\n``` xml\n<!DOCTYPE html>\n<title>Title</title>\n\n<style>body {width: 500px;}</style>\n\n<script type=\"application/javascript\">\n  function $init() {return true;}\n</script>\n\n<body>\n  <p checked class=\"title\" id=\'title\'>Title</p>\n  <!-- here goes the rest of the page -->\n</body>\n```\n``` js\nfunction $initHighlight(block, cls) {\n  try {\n    if (cls.search(/\\bno\\-highlight\\b/) != -1)\n      return process(block, true, 0x0F) +\n             ` class=\"${cls}\"`;\n  } catch (e) {\n    /* handle exception */\n  }\n  for (var i = 0 / 2; i < classes.length; i++) {\n    if (checkCondition(classes[i]) === undefined)\n      console.log(\'undefined\');\n  }\n\n  return (\n    <div>\n      <web-component>{block}</web-component>\n    </div>\n  )\n}\n\nexport  $initHighlight;\n```', 'http://localhost:3001/api/public/admin/getFiles?id=f0a6f9e0d65048523039b7e6e78ea0b4.webp&&mimetype=image/webp', 1, 10, 0, '2022-04-23 20:00:31', '2022-05-05 20:55:45', '\"你说神农\"', 0, 0, 1, NULL, 'md');
INSERT INTO `mg_articles` VALUES ('f3a478df-b157-4f1d-9bc2-bd068cd6eacc', '1ba60c63-9cf9-4e98-9858-c934f44aa511', '你觉得JS里命名最糟糕的API有哪些？', '<div>\n<p>比如<code>Object.prototype.hasOwnProperty()</code>， 用于检测某个属性是否属于某个对象，跟in 不同的是，<code>hasOwnProperty</code>排除了原型上的</p>\n<pre><code class=\"hljs language-js copyable\" lang=\"js\"><span class=\"hljs-keyword\">const</span> object1 = {};\nobject1.property1 = <span class=\"hljs-number\">42</span>;\n\n<span class=\"hljs-built_in\">console</span>.log(object1.hasOwnProperty(<span class=\"hljs-string\">\'property1\'</span>));<span class=\"hljs-comment\">// true</span>\n<span class=\"hljs-built_in\">console</span>.log(object1.hasOwnProperty(<span class=\"hljs-string\">\'toString\'</span>));<span class=\"hljs-comment\">//false</span>\n<span class=\"hljs-built_in\">console</span>.log(object1.hasOwnProperty(<span class=\"hljs-string\">\'hasOwnProperty\'</span>));<span class=\"hljs-comment\">// false</span>\n<span class=\"copy-code-btn\">复制代码</span></code></pre>\n<h3 data-id=\"heading-9\">Top10. for in 和 for of</h3>\n<p><code>for..of</code>和<code>for..in</code>均用于迭代，但是它们又有所不同</p>\n<p>首先是<strong>迭代的值不同</strong></p>\n<p><code>for..in</code>迭代的是对象的键的列表，而<code>for..of</code>则迭代对象的键对应的值</p>\n</div>\n<p>&nbsp;</p>', 'https://images.pexels.com/photos/1767016/pexels-photo-1767016.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260', 1, 14, 1, '2022-04-24 12:23:28', '2022-04-29 13:49:01', '\"范德萨范德萨分\"', 1, 0, 1, NULL, 'md');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mg_comments
-- ----------------------------
INSERT INTO `mg_comments` VALUES ('00cee838-565d-4e34-ae4e-f82ca5ecf719', '02053028-dec5-459a-a8e5-9c94815a7029', NULL, '0', '1', '匿名', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', 'const Person = function (age) {&nbsp; this.age = age}Person.prototype.name = \'fatfish\'const p1 = new Person(24)console.log(\'age\' in p1) // true console.log(\'name\' in p1) // true&nbsp; 注意这里', '2022-04-24 10:48:55', '2022-04-24 10:48:55');
INSERT INTO `mg_comments` VALUES ('1f5906c5-6cf0-448a-b115-c03df32b2999', '02053028-dec5-459a-a8e5-9c94815a7029', NULL, '00cee838-565d-4e34-ae4e-f82ca5ecf719', '1', '周杰伦', 'https://ci.xiaohongshu.com/9c287080-630d-33ad-a988-76a8cf21e152?imageView2/2/w/540/format/jpg', '1', '周杰伦', 'https://ci.xiaohongshu.com/9c287080-630d-33ad-a988-76a8cf21e152?imageView2/2/w/540/format/jpg', '范德萨范德萨', '2022-04-24 14:37:12', '2022-04-24 14:37:12');
INSERT INTO `mg_comments` VALUES ('7ff4a953-a402-40bb-949a-9cf8fa05d5f5', 'f3a478df-b157-4f1d-9bc2-bd068cd6eacc', NULL, '0', '1', '匿名', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '', '', '', '<img data-v-7c9572d1=\"\" width=\"20\" height=\"20\" src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNiAzNiI+PHBhdGggZmlsbD0iI0ZGREI1RSIgZD0iTTM0Ljk1NiAxNy45MTZjMC0uNTAzLS4xMi0uOTc1LS4zMjEtMS40MDQtMS4zNDEtNC4zMjYtNy42MTktNC4wMS0xNi41NDktNC4yMjEtMS40OTMtLjAzNS0uNjM5LTEuNzk4LS4xMTUtNS42NjguMzQxLTIuNTE3LTEuMjgyLTYuMzgyLTQuMDEtNi4zODItNC40OTggMC0uMTcxIDMuNTQ4LTQuMTQ4IDEyLjMyMi0yLjEyNSA0LjY4OC02Ljg3NSAyLjA2Mi02Ljg3NSA2Ljc3MXYxMC43MTljMCAxLjgzMy4xOCAzLjU5NSAyLjc1OCAzLjg4NUM4LjE5NSAzNC4yMTkgNy42MzMgMzYgMTEuMjM4IDM2aDE4LjA0NGMxLjgzOCAwIDMuMzMzLTEuNDk2IDMuMzMzLTMuMzM0IDAtLjc2Mi0uMjY3LTEuNDU2LS42OTgtMi4wMTggMS4wMi0uNTcxIDEuNzItMS42NDkgMS43Mi0yLjg5OSAwLS43Ni0uMjY2LTEuNDU0LS42OTYtMi4wMTUgMS4wMjMtLjU3IDEuNzI1LTEuNjQ5IDEuNzI1LTIuOTAxIDAtLjkwOS0uMzY4LTEuNzMzLS45NjEtMi4zMzYuNzU3LS42MTEgMS4yNTEtMS41MzUgMS4yNTEtMi41ODF6Ii8+PHBhdGggZmlsbD0iI0VFOTU0NyIgZD0iTTIzLjAyIDIxLjI0OWg4LjYwNGMxLjE3IDAgMi4yNjgtLjYyNiAyLjg2Ni0xLjYzMy4yNDYtLjQxNS4xMDktLjk1Mi0uMzA3LTEuMTk5LS40MTUtLjI0Ny0uOTUyLS4xMDgtMS4xOTkuMzA3LS4yODMuNDc5LS44MDYuNzc1LTEuMzYxLjc3NWgtOC44MWMtLjg3MyAwLTEuNTgzLS43MS0xLjU4My0xLjU4M3MuNzEtMS41ODMgMS41ODMtMS41ODNIMjguN2MuNDgzIDAgLjg3NS0uMzkyLjg3NS0uODc1cy0uMzkyLS44NzUtLjg3NS0uODc1aC01Ljg4OGMtMS44MzggMC0zLjMzMyAxLjQ5NS0zLjMzMyAzLjMzMyAwIDEuMDI1LjQ3NSAxLjkzMiAxLjIwNSAyLjU0NC0uNjE1LjYwNS0uOTk4IDEuNDQ1LS45OTggMi4zNzMgMCAxLjAyOC40NzggMS45MzggMS4yMTIgMi41NDktLjYxMS42MDQtLjk5IDEuNDQxLS45OSAyLjM2NyAwIDEuMTIuNTU5IDIuMTA4IDEuNDA5IDIuNzEzLS41MjQuNTg5LS44NTIgMS4zNTYtLjg1MiAyLjIwNCAwIDEuODM4IDEuNDk1IDMuMzMzIDMuMzMzIDMuMzMzaDUuNDg0YzEuMTcgMCAyLjI2OS0uNjI1IDIuODY3LTEuNjMyLjI0Ny0uNDE1LjExLS45NTItLjMwNS0xLjE5OS0uNDE2LS4yNDUtLjk1My0uMTEtMS4xOTkuMzA1LS4yODUuNDc5LS44MDguNzc2LTEuMzYzLjc3NmgtNS40ODRjLS44NzMgMC0xLjU4My0uNzEtMS41ODMtMS41ODNzLjcxLTEuNTgzIDEuNTgzLTEuNTgzaDYuNTA2YzEuMTcgMCAyLjI3LS42MjYgMi44NjctMS42MzMuMjQ3LS40MTYuMTEtLjk1My0uMzA1LTEuMTk5LS40MTktLjI1MS0uOTU0LS4xMS0xLjE5OS4zMDUtLjI4OS40ODctLjc5OS43NzctMS4zNjMuNzc3aC03LjA2M2MtLjg3MyAwLTEuNTgzLS43MTEtMS41ODMtMS41ODRzLjcxLTEuNTgzIDEuNTgzLTEuNTgzaDguMDkxYzEuMTcgMCAyLjI2OS0uNjI1IDIuODY3LTEuNjMyLjI0Ny0uNDE1LjExLS45NTItLjMwNS0xLjE5OS0uNDE3LS4yNDYtLjk1My0uMTEtMS4xOTkuMzA1LS4yODkuNDg2LS43OTkuNzc2LTEuMzYzLjc3NkgyMy4wMmMtLjg3MyAwLTEuNTgzLS43MS0xLjU4My0xLjU4M3MuNzA5LTEuNTg0IDEuNTgzLTEuNTg0eiIvPjwvc3ZnPg==\" alt=\"\" class=\"emoji-icon\" style=\"vertical-align: text-top;\">', '2022-04-24 14:18:57', '2022-04-24 14:18:57');
INSERT INTO `mg_comments` VALUES ('ec7d6645-d029-4393-83e1-4a012d47a626', '02053028-dec5-459a-a8e5-9c94815a7029', NULL, '00cee838-565d-4e34-ae4e-f82ca5ecf719', '1', '周杰伦', 'https://ci.xiaohongshu.com/9c287080-630d-33ad-a988-76a8cf21e152?imageView2/2/w/540/format/jpg', '1', '匿名', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXSYITOSgSQdTv0Z_Z0KkvwWsBMwadCA2PRA&usqp=CAU', '<img data-v-7c9572d1=\"\" width=\"20\" height=\"20\" src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNiAzNiI+PHBhdGggZmlsbD0iI0ZGREI1RSIgZD0iTTM0Ljk1NiAxNy45MTZjMC0uNTAzLS4xMi0uOTc1LS4zMjEtMS40MDQtMS4zNDEtNC4zMjYtNy42MTktNC4wMS0xNi41NDktNC4yMjEtMS40OTMtLjAzNS0uNjM5LTEuNzk4LS4xMTUtNS42NjguMzQxLTIuNTE3LTEuMjgyLTYuMzgyLTQuMDEtNi4zODItNC40OTggMC0uMTcxIDMuNTQ4LTQuMTQ4IDEyLjMyMi0yLjEyNSA0LjY4OC02Ljg3NSAyLjA2Mi02Ljg3NSA2Ljc3MXYxMC43MTljMCAxLjgzMy4xOCAzLjU5NSAyLjc1OCAzLjg4NUM4LjE5NSAzNC4yMTkgNy42MzMgMzYgMTEuMjM4IDM2aDE4LjA0NGMxLjgzOCAwIDMuMzMzLTEuNDk2IDMuMzMzLTMuMzM0IDAtLjc2Mi0uMjY3LTEuNDU2LS42OTgtMi4wMTggMS4wMi0uNTcxIDEuNzItMS42NDkgMS43Mi0yLjg5OSAwLS43Ni0uMjY2LTEuNDU0LS42OTYtMi4wMTUgMS4wMjMtLjU3IDEuNzI1LTEuNjQ5IDEuNzI1LTIuOTAxIDAtLjkwOS0uMzY4LTEuNzMzLS45NjEtMi4zMzYuNzU3LS42MTEgMS4yNTEtMS41MzUgMS4yNTEtMi41ODF6Ii8+PHBhdGggZmlsbD0iI0VFOTU0NyIgZD0iTTIzLjAyIDIxLjI0OWg4LjYwNGMxLjE3IDAgMi4yNjgtLjYyNiAyLjg2Ni0xLjYzMy4yNDYtLjQxNS4xMDktLjk1Mi0uMzA3LTEuMTk5LS40MTUtLjI0Ny0uOTUyLS4xMDgtMS4xOTkuMzA3LS4yODMuNDc5LS44MDYuNzc1LTEuMzYxLjc3NWgtOC44MWMtLjg3MyAwLTEuNTgzLS43MS0xLjU4My0xLjU4M3MuNzEtMS41ODMgMS41ODMtMS41ODNIMjguN2MuNDgzIDAgLjg3NS0uMzkyLjg3NS0uODc1cy0uMzkyLS44NzUtLjg3NS0uODc1aC01Ljg4OGMtMS44MzggMC0zLjMzMyAxLjQ5NS0zLjMzMyAzLjMzMyAwIDEuMDI1LjQ3NSAxLjkzMiAxLjIwNSAyLjU0NC0uNjE1LjYwNS0uOTk4IDEuNDQ1LS45OTggMi4zNzMgMCAxLjAyOC40NzggMS45MzggMS4yMTIgMi41NDktLjYxMS42MDQtLjk5IDEuNDQxLS45OSAyLjM2NyAwIDEuMTIuNTU5IDIuMTA4IDEuNDA5IDIuNzEzLS41MjQuNTg5LS44NTIgMS4zNTYtLjg1MiAyLjIwNCAwIDEuODM4IDEuNDk1IDMuMzMzIDMuMzMzIDMuMzMzaDUuNDg0YzEuMTcgMCAyLjI2OS0uNjI1IDIuODY3LTEuNjMyLjI0Ny0uNDE1LjExLS45NTItLjMwNS0xLjE5OS0uNDE2LS4yNDUtLjk1My0uMTEtMS4xOTkuMzA1LS4yODUuNDc5LS44MDguNzc2LTEuMzYzLjc3NmgtNS40ODRjLS44NzMgMC0xLjU4My0uNzEtMS41ODMtMS41ODNzLjcxLTEuNTgzIDEuNTgzLTEuNTgzaDYuNTA2YzEuMTcgMCAyLjI3LS42MjYgMi44NjctMS42MzMuMjQ3LS40MTYuMTEtLjk1My0uMzA1LTEuMTk5LS40MTktLjI1MS0uOTU0LS4xMS0xLjE5OS4zMDUtLjI4OS40ODctLjc5OS43NzctMS4zNjMuNzc3aC03LjA2M2MtLjg3MyAwLTEuNTgzLS43MTEtMS41ODMtMS41ODRzLjcxLTEuNTgzIDEuNTgzLTEuNTgzaDguMDkxYzEuMTcgMCAyLjI2OS0uNjI1IDIuODY3LTEuNjMyLjI0Ny0uNDE1LjExLS45NTItLjMwNS0xLjE5OS0uNDE3LS4yNDYtLjk1My0uMTEtMS4xOTkuMzA1LS4yODkuNDg2LS43OTkuNzc2LTEuMzYzLjc3NkgyMy4wMmMtLjg3MyAwLTEuNTgzLS43MS0xLjU4My0xLjU4M3MuNzA5LTEuNTg0IDEuNTgzLTEuNTg0eiIvPjwvc3ZnPg==\" alt=\"\" class=\"emoji-icon\" style=\"vertical-align: text-top;\">', '2022-04-24 14:33:28', '2022-04-24 14:33:28');
INSERT INTO `mg_comments` VALUES ('fe336f81-97de-41a5-a1b9-1733c5c1049d', '02053028-dec5-459a-a8e5-9c94815a7029', NULL, '00cee838-565d-4e34-ae4e-f82ca5ecf719', '1', '周杰伦', 'https://ci.xiaohongshu.com/9c287080-630d-33ad-a988-76a8cf21e152?imageView2/2/w/540/format/jpg', '1', '周杰伦', 'https://ci.xiaohongshu.com/9c287080-630d-33ad-a988-76a8cf21e152?imageView2/2/w/540/format/jpg', '大师傅大师傅', '2022-04-24 14:37:07', '2022-04-24 14:37:07');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mg_friends
-- ----------------------------
INSERT INTO `mg_friends` VALUES ('3861e7af-350a-43d8-b116-e9f4bc4cd796', 'http://www.zhouyi.run/#/', 'ZY\'blog', '1840354092@qq.com', '个人博客', '2022-04-20 21:23:25', '2022-04-20 21:33:49');
INSERT INTO `mg_friends` VALUES ('44c366ef-755d-4bb0-81b4-87656179180c', 'www.zhouyi.run', 'ZY\'blog是', '1840354092@qq.com', '个人博客，请多关注谢谢', '2022-04-20 21:35:32', '2022-04-20 21:35:32');

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
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `mg_menus` VALUES (13, 12, '/code/dir-code-info', '代码生成', 'th-large', '2022-04-26 14:15:58', '2022-05-29 16:43:16', 2, 'POST /api/private/code/list');
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
INSERT INTO `mg_menus` VALUES (86, 13, 'POST /api/private/code/one', '表详情', 'th-large', '2022-05-29 16:44:24', '2022-05-29 16:44:24', 3, 'POST /api/private/code/one');
INSERT INTO `mg_menus` VALUES (87, 15, 'POST /api/private/roles/one', '角色详情', 'th-large', '2022-05-29 16:44:50', '2022-05-29 16:44:50', 3, 'POST /api/private/roles/one');

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
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '回复状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mg_message
-- ----------------------------
INSERT INTO `mg_message` VALUES ('3d0c08eb-4da0-44e3-8406-985c023946e0', '1840354092@qq.com', '1236fdsflkd发电量数据粉红色的艰苦奋斗是:rage:', '2022-04-20 23:21:07', '2022-04-28 20:44:56', 0);
INSERT INTO `mg_message` VALUES ('8cb46963-8dc4-46ce-af00-859be07de463', '1840354092@qq.com', '你撒娇和水果和反馈是否规范打算开个饭店', '2022-04-20 23:18:28', '2022-04-20 23:18:28', 0);

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mg_musics
-- ----------------------------
INSERT INTO `mg_musics` VALUES ('09c93363-6a77-4d61-a737-a8ce145e61dc', '还是分开', '张叶蕾', 'https://m701.music.126.net/20220503000151/8d4111bc78de7942745cdc6e22ee2bb5/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/14096407555/d87d/c228/403a/9e4ee76f5023e19f3ebbc9c56925f568.mp3', 'http://p1.music.126.net/tH5FdakJX47uy8mlM0GMWQ==/19218363741925314.jpg?param=300x300', '[00:00.000] 作词 : 张叶蕾[00:01.000] 作曲 : 张叶蕾[00:05.210]Arrangement 编曲：宇弘 Ng Yuhong[00:06.130]Guitars 吉他：Shawn Tseng[00:07.320]Recording Engineer 录音师：Shawn Tseng[00:08.410]Mixing Engineer 混音工程师：Shawn Tseng[00:09.500][00:14.810]眼光瞥向阳台[00:18.580]你又叼着烟手支着栏杆[00:22.430]烟雾连风也吹不散[00:25.110]就像我的思绪[00:26.860]越思考越混乱[00:28.730][00:28.890]你就在太阳底下晒[00:30.790]我在房里傻傻地站[00:32.630]你不出声仿佛就当我不存在[00:35.830]我的故事里只有你[00:37.550]没有任何旁白[00:39.520]可是最后的情绪 竟是无奈[00:44.810]竟是空白[00:49.130][00:49.290]我和你猜了又猜 想过再想 决定分开[00:53.040]为什么我们的结局还是没有例外[00:56.470]你说我没有想法 不懂浪漫 惹人厌烦[01:00.127]为什么曾经不说 却拖到了现在[01:03.837][01:03.965]我和你吵了又吵 闹过再闹 还是分开[01:07.268]为什么我在你眼里是如此的不堪[01:10.816]我还是追了出去 不想在家傻傻等待[01:14.468]最后只看见车门在我面前 用力地关[01:21.286][01:32.628]你掐灭没吸的烟[01:36.488]大步流星地掠过我向前[01:40.718]我用力去抓你的衣角[01:43.747]以为我挽留你结局就会改变[01:47.599][01:47.756]你不说一句就要离开[01:49.637]我在原地喊了又喊[01:51.176]你不回头仿佛就当我不存在[01:54.837]我的故事里只有你[01:56.527]你却走得迫不及待[01:58.426]剩下来的情节 全是无奈[02:03.896]竟是空白[02:08.187][02:08.298]我和你猜了又猜 想过再想 决定分开[02:11.784]为什么我们的结局还是没有例外[02:15.377]你说我没有想法 不懂浪漫 惹人厌烦[02:18.937]为什么曾经不说 却拖到了现在[02:22.556][02:22.687]我和你吵了又吵 闹过再闹 还是分开[02:26.098]为什么我在你眼里是如此的不堪[02:29.695]我还是追了出去 不想在家傻傻等待[02:33.258]最后只看见车门在我面前 用力地关[02:39.336][02:51.297]呜 挽留也终告失败[02:56.348]这第一次的恋爱[03:04.997][03:05.295]我和你猜了又猜 想过再想 决定分开[03:09.306]为什么我们的结局还是没有例外[03:12.634]你说我没有想法 不懂浪漫 惹人厌烦[03:16.306]为什么曾经不说 却拖到了现在[03:19.836][03:19.967]我和你吵了又吵 闹过再闹 还是分开[03:23.284]为什么我在你眼里是如此的不堪[03:26.915]我还是追了出去 不想在家傻傻等待[03:30.556]最后只看见车门在我面前 用力地关[03:37.747]', '2022-05-02 23:37:51', '2022-05-02 23:37:51');
INSERT INTO `mg_musics` VALUES ('160e5262-e2f0-4d59-8505-61912145eb01', '山谷的回声', '春野杉卉', 'https://m10.music.126.net/20220502230051/416320c624d6550f95a6c6f73187109b/ymusic/obj/w5zDlMODwrDDiGjCn8Ky/3420511929/ee36/26fa/3a76/11c78a0fbf0773b5d762dddfbf6360b3.mp3', 'https://p1.music.126.net/eazwds1LxPAubKPAyE-5Ug==/109951165255354601.jpg?param=300x300', '[00:00.00] 暂无歌词', '2022-05-02 23:30:33', '2022-05-02 23:30:33');
INSERT INTO `mg_musics` VALUES ('6a507cfd-d47d-4207-858a-b629083d1731', '我怀念的 (Live)', '林俊杰', 'https://m701.music.126.net/20220503000151/0395c73e5ae64210ac95460a4c0017d3/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/14096409257/a2b7/3f07/8f05/eef75dc93ac7e61a485abd1ddb5e88cc.mp3', 'http://p1.music.126.net/qTFCTnAq5r9jCRyo79NE-A==/3416182645968894.jpg?param=300x300', '[00:00.000] 作词 : 姚若龙[00:01.000] 作曲 : 李偲菘[00:02.000] 编曲 : Kenn C[00:03.000] 制作人 : 林俊杰[00:04.000] 音乐总监 : 刘卓[00:05.000] 吉他 : 高飞/金天/熊林[00:06.000] 键盘 : 刘卓/李海郡/尹岳洋[00:07.000] Program : 尹岳洋[00:08.000] 贝斯 : 李九君[00:09.000] 鼓 : 卢炜/刘效松/陈志龙[00:10.000] 和音 : 朱江/张炜/关冰效/黄琬婷[00:11.000] 弦乐 : 靳海音®弦乐团[00:12.000] 长号 : 胡清文[00:13.000] 小号 : 夏非[00:14.000] 萨克斯 : 刘聪[00:29.530]我问为什么[00:32.520]那女孩传简讯给我[00:37.940]而你为什么[00:40.450]不解释低着头沉默[00:44.740]我该相信你很爱我[00:48.870]不愿意敷衍我[00:52.250]还是明白[00:54.260]你已不想挽回什么[00:58.870][01:02.580]想问为什么[01:05.530]我不再是你的快乐[01:10.210]可是为什么[01:12.850]却苦笑说我都懂了[01:17.240]自尊常常将人拖着[01:21.280]把爱都走曲折[01:24.140][01:24.820]假装了解是怕[01:27.320]真相太赤裸裸[01:30.980]狼狈比失去难受[01:34.400][01:36.560]我怀念的 是无话不说[01:40.410]我怀念的 是一起做梦[01:44.270]我怀念的 是争吵以后[01:47.750]还是想要 爱你的冲动[01:52.300]我记得那年生日[01:55.830]也记得那一首歌[01:59.480]记得那片星空[02:01.450]最紧的右手[02:03.410]最暖的胸口[02:05.680]谁 记得[02:08.100][02:19.250]想问为什么[02:21.330]我不再是你的快乐[02:26.360]可是为什么[02:28.640]却苦笑说我都懂了[02:32.500]自尊常常将人拖着[02:36.470]把爱都走曲折[02:39.040][02:39.650]假装了解是怕[02:42.000]真相太赤裸裸[02:45.080]狼狈比失去难受[02:48.080]我怀念的 是无话不说[02:51.580]我怀念的 是一起做梦[02:55.290]我怀念的 是争吵以后[02:58.420]还是想要爱你的冲动[03:02.430]我记得那年生日[03:06.040]也记得那一首歌[03:09.560]记得那片星空[03:11.350]最紧的右手[03:13.160]最暖的胸口[03:14.610]谁忘了[03:16.220]我怀念的 是无言感动[03:19.600]我怀念的 是绝对炽热[03:23.190]我怀念的 是你很激动[03:26.410]求我原谅抱得我都痛[03:30.350]我记得你在背后[03:33.990]也记得我颤抖着[03:37.330]记得感觉汹涌[03:39.060]最美的烟火[03:40.820]最长的相拥[03:48.590]谁要走我的心[03:52.650]谁忘了那就是承诺[03:56.270]谁自顾自地走[03:59.590]谁忘了看着我[04:02.870]谁让爱变沉重[04:06.280]谁忘了要给你温柔[04:09.930][04:20.220]我怀念的[04:22.410]我还有想要 爱你的冲动[04:28.340][04:30.180]我记得那年生日[04:34.460]也记得那一首歌[04:37.440]记得那片星空[04:39.490]最紧的右手[04:41.050]最暖的胸口[04:43.350][04:44.710]太爱了[04:47.580]所以我[04:51.220]没有哭[04:55.030]没有说', '2022-05-02 23:39:23', '2022-05-02 23:39:23');
INSERT INTO `mg_musics` VALUES ('7a5039a5-fa3c-4c7e-9261-a6a6840b4049', '青石巷', '魏琮霏', 'https://m10.music.126.net/20220502235818/c992071491dc4fb716f501fa321e0506/ymusic/acfa/5b48/de5b/ca73b059d47c0f2eae5c1cd8dcc28298.mp3', 'http://p1.music.126.net/uNpSTrse-CivyZ2NUyhJUQ==/17892352718986703.jpg?param=300x300', '[00:00.00] 暂无歌词', '2022-05-02 23:34:36', '2022-05-02 23:34:36');
INSERT INTO `mg_musics` VALUES ('b4306dc8-8e66-4b12-b897-073dfff68c90', '天空之城(吟唱版)', '小娟&山谷里的居民', 'https://m10.music.126.net/20220502235633/61824ac73c2aabeda83039b0eb877542/ymusic/22e5/e818/328f/38537fd3c726dfea48b63b2700415a0f.mp3', 'http://p2.music.126.net/K_3KGTbKKb2j-YSyrlPq3Q==/1713039116096073.jpg?param=300x300', '[00:00.00] 暂无歌词', '2022-05-02 23:32:41', '2022-05-02 23:32:41');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mg_roles
-- ----------------------------
INSERT INTO `mg_roles` VALUES ('86deca84-5bdb-4ec4-8979-a72abcbc27bb', 'editer', '访客', '2022-04-28 10:23:17', '2022-04-28 10:23:17');
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mg_roles_menus
-- ----------------------------
INSERT INTO `mg_roles_menus` VALUES ('05027b41-e45e-48c3-9589-5dabdb5a0d0e', 'af709d7f-883d-4f94-884c-b6010e0a415c', '54', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('051ae337-319c-44b0-b918-9ee80ffc1dc5', 'af709d7f-883d-4f94-884c-b6010e0a415c', '81', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('085c957f-c712-4e14-963f-617266de9504', 'af709d7f-883d-4f94-884c-b6010e0a415c', '85', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('089192fb-6123-4927-9c5e-325dd7ad04a1', 'af709d7f-883d-4f94-884c-b6010e0a415c', '64', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('0ec2b393-bb8b-4d21-8cc1-2f3274019bcf', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '33', '2022-05-29 16:46:33', '2022-05-29 16:46:33');
INSERT INTO `mg_roles_menus` VALUES ('143fd750-b806-40e0-94e0-6ab4fad2eff1', 'af709d7f-883d-4f94-884c-b6010e0a415c', '49', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('19b8744a-1df6-4025-8d11-c3b39dac5a34', 'af709d7f-883d-4f94-884c-b6010e0a415c', '50', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('1a22544f-0555-49b1-b8af-9cf961ce596f', 'af709d7f-883d-4f94-884c-b6010e0a415c', '8', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('1b8f58d0-a92e-473e-8908-a35f5d9a8e61', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '80', '2022-05-29 16:46:33', '2022-05-29 16:46:33');
INSERT INTO `mg_roles_menus` VALUES ('222d738a-940e-4ebd-988e-6acd094a4c9b', 'af709d7f-883d-4f94-884c-b6010e0a415c', '59', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('23473c95-b524-4b32-90a6-8532bd122b63', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '2', '2022-05-29 16:46:33', '2022-05-29 16:46:33');
INSERT INTO `mg_roles_menus` VALUES ('251aebe2-39d6-4077-bbf3-ee7ace19b379', 'af709d7f-883d-4f94-884c-b6010e0a415c', '11', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('31fc6586-8f53-496e-af7d-89908b130b4c', 'af709d7f-883d-4f94-884c-b6010e0a415c', '70', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('36fb6f2e-f94c-4869-b9ad-a7ea3fc4a6b7', 'af709d7f-883d-4f94-884c-b6010e0a415c', '5', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('3719f4c7-5f6f-4279-8791-d212464f496b', 'af709d7f-883d-4f94-884c-b6010e0a415c', '55', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('3e7254fa-66b8-4f05-a40d-5ccdf83c6a4f', 'af709d7f-883d-4f94-884c-b6010e0a415c', '82', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('41d63a6e-7f87-48d5-abbf-748b5a80f614', 'af709d7f-883d-4f94-884c-b6010e0a415c', '7', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('420e74e7-616d-4a98-9fc0-02b842de66a5', 'af709d7f-883d-4f94-884c-b6010e0a415c', '47', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('427da68c-c6af-4c20-99b0-5a6e8ab824ac', 'af709d7f-883d-4f94-884c-b6010e0a415c', '48', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('4315807f-82cf-44fd-802b-618150f0a811', 'af709d7f-883d-4f94-884c-b6010e0a415c', '60', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('44520eb4-9e64-4f6b-951f-1d87a9e3b1ea', 'af709d7f-883d-4f94-884c-b6010e0a415c', '36', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('46b92ed3-6bee-42e0-bbc6-8ab31f611dfa', 'af709d7f-883d-4f94-884c-b6010e0a415c', '61', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('4d0bac32-62a9-4ce5-97cd-7c12c5a8f2f0', 'af709d7f-883d-4f94-884c-b6010e0a415c', '45', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('50f59483-d05a-4d5f-b8f1-2921eb567060', 'af709d7f-883d-4f94-884c-b6010e0a415c', '67', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('5176a85b-1186-4bcf-a5a4-ab808ebf69c1', 'af709d7f-883d-4f94-884c-b6010e0a415c', '44', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('5369b0d2-9bef-47ac-a575-6894725fc13b', 'af709d7f-883d-4f94-884c-b6010e0a415c', '71', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('53c67164-9c4d-4490-a9b2-c2aa60683d39', 'af709d7f-883d-4f94-884c-b6010e0a415c', '86', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('5412e826-adb5-436c-a053-2de97027b3dc', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '12', '2022-05-29 16:46:33', '2022-05-29 16:46:33');
INSERT INTO `mg_roles_menus` VALUES ('5ce91114-7f23-430a-bca0-f38a6f252026', 'af709d7f-883d-4f94-884c-b6010e0a415c', '53', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('5d32a240-1bbe-45eb-b0f5-a211fbfacdf4', 'af709d7f-883d-4f94-884c-b6010e0a415c', '13', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('5e8a50e8-efe1-4ca8-96a9-aadcfffed1e8', 'af709d7f-883d-4f94-884c-b6010e0a415c', '62', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('5f5c2f40-32ae-4e30-831e-28f7181ef190', 'af709d7f-883d-4f94-884c-b6010e0a415c', '72', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('5ffd69ea-b6fc-485d-91cc-cbc1b6a533f8', 'af709d7f-883d-4f94-884c-b6010e0a415c', '74', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('616f141b-dfe0-4721-a27a-5934cc36aec1', 'af709d7f-883d-4f94-884c-b6010e0a415c', '32', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('64a63e70-a67e-4c4d-afea-84e449aa79c5', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '86', '2022-05-29 16:46:33', '2022-05-29 16:46:33');
INSERT INTO `mg_roles_menus` VALUES ('72dd931f-cdfc-4b78-9617-3b36246b4562', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '13', '2022-05-29 16:46:33', '2022-05-29 16:46:33');
INSERT INTO `mg_roles_menus` VALUES ('75504659-16d0-4786-9cde-4461488bfd6b', 'af709d7f-883d-4f94-884c-b6010e0a415c', '9', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('816efd30-4fe5-4361-8ca9-f25a1cff5349', 'af709d7f-883d-4f94-884c-b6010e0a415c', '68', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('823ab922-d348-4d49-b277-10e2bb4b9661', 'af709d7f-883d-4f94-884c-b6010e0a415c', '16', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('82432aaa-1b0e-410c-9b6c-6528fce7322b', 'af709d7f-883d-4f94-884c-b6010e0a415c', '75', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('9460ba71-3ab4-456e-8bbe-830c04708d3b', 'af709d7f-883d-4f94-884c-b6010e0a415c', '43', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('952d33be-ad6f-4444-b9e8-cbcc8b18b4c3', 'af709d7f-883d-4f94-884c-b6010e0a415c', '10', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('96566f3d-f33e-4098-b297-1f4a91842b3b', 'af709d7f-883d-4f94-884c-b6010e0a415c', '37', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('96c18a98-31ef-4d15-a967-b9139cee1c56', 'af709d7f-883d-4f94-884c-b6010e0a415c', '80', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('99c5e931-f51e-49c0-b1f9-36ff11b4cef3', 'af709d7f-883d-4f94-884c-b6010e0a415c', '73', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('9a0c50e7-572a-4f5c-bdc6-c96aae6801be', 'af709d7f-883d-4f94-884c-b6010e0a415c', '35', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('a2d74e09-e342-42e6-b392-efcdefa3d734', 'af709d7f-883d-4f94-884c-b6010e0a415c', '58', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('a4f35e22-7ac1-466c-a39d-374044660336', 'af709d7f-883d-4f94-884c-b6010e0a415c', '56', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('a5205758-0bbf-4903-9d75-8fc1689a37c8', 'af709d7f-883d-4f94-884c-b6010e0a415c', '38', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('aef8a7be-1716-4ec7-b082-15082d7fc1dd', 'af709d7f-883d-4f94-884c-b6010e0a415c', '52', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('b5a9033a-cf63-4691-bf7c-468cde593f13', 'af709d7f-883d-4f94-884c-b6010e0a415c', '34', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('b872a030-38c8-474c-bb66-ecc1e4834e5f', 'af709d7f-883d-4f94-884c-b6010e0a415c', '15', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('baea0d52-8473-4249-8d6a-082b56ecce44', 'af709d7f-883d-4f94-884c-b6010e0a415c', '69', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('bb0703e0-5814-424d-9437-1869205f1f0c', 'af709d7f-883d-4f94-884c-b6010e0a415c', '65', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('bdc31899-5787-4b30-b4b1-7788ca9318a2', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '31', '2022-05-29 16:46:33', '2022-05-29 16:46:33');
INSERT INTO `mg_roles_menus` VALUES ('bfdb1a12-0546-4dac-a99d-945b12396a66', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '15', '2022-05-29 16:46:33', '2022-05-29 16:46:33');
INSERT INTO `mg_roles_menus` VALUES ('c365b042-6617-436a-a670-2a0ee97ea145', 'af709d7f-883d-4f94-884c-b6010e0a415c', '39', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('c3a56244-1f62-49c9-9c75-43705a8e9be5', 'af709d7f-883d-4f94-884c-b6010e0a415c', '3', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('c3d78031-5103-4bc2-924e-953545efb9c9', 'af709d7f-883d-4f94-884c-b6010e0a415c', '66', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('c547d41a-3221-4943-8014-444d22dc17b5', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '3', '2022-05-29 16:46:33', '2022-05-29 16:46:33');
INSERT INTO `mg_roles_menus` VALUES ('c654b333-5e80-4321-be8c-706f39ea5dbd', 'af709d7f-883d-4f94-884c-b6010e0a415c', '84', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('cc0293a3-6c37-4148-84f1-38fbe501521c', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', '87', '2022-05-29 16:46:33', '2022-05-29 16:46:33');
INSERT INTO `mg_roles_menus` VALUES ('cecf30f4-f2d0-4b7c-826f-d965decab136', 'af709d7f-883d-4f94-884c-b6010e0a415c', '31', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('d18d6c5f-d975-4977-951e-0fd44ed9168b', 'af709d7f-883d-4f94-884c-b6010e0a415c', '51', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('d52c78c8-1a5f-44c2-9618-50ca25eda001', 'af709d7f-883d-4f94-884c-b6010e0a415c', '87', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('d73d5eed-a4d5-4329-8a2d-a35a9f27e198', 'af709d7f-883d-4f94-884c-b6010e0a415c', '83', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('d870e908-49d1-4043-986b-d24f43f4cb5d', 'af709d7f-883d-4f94-884c-b6010e0a415c', '12', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('dd7922c9-2bd9-4fa7-86db-362f907a0277', 'af709d7f-883d-4f94-884c-b6010e0a415c', '2', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('def0fb85-b76d-4bf2-910c-042402cdcf1c', 'af709d7f-883d-4f94-884c-b6010e0a415c', '46', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('dfd5a64d-236e-4d88-acb9-96146598cf90', 'af709d7f-883d-4f94-884c-b6010e0a415c', '57', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('e2080d93-7488-423f-b662-89d7316b24cd', 'af709d7f-883d-4f94-884c-b6010e0a415c', '33', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('e67b7c01-c564-4989-b25b-b22c9fde16b1', 'af709d7f-883d-4f94-884c-b6010e0a415c', '14', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('ee42233a-591a-40f4-9d24-c871dfafb778', 'af709d7f-883d-4f94-884c-b6010e0a415c', '41', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('f5cb8884-17d8-41ae-94ed-83b751079a5f', 'af709d7f-883d-4f94-884c-b6010e0a415c', '40', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('f63c1ca3-643c-4caf-b755-456b49488e3a', 'af709d7f-883d-4f94-884c-b6010e0a415c', '63', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('f77a895b-a251-4cbc-abad-4b6751812010', 'af709d7f-883d-4f94-884c-b6010e0a415c', '42', '2022-05-29 16:45:36', '2022-05-29 16:45:36');
INSERT INTO `mg_roles_menus` VALUES ('fdd57f15-c516-44be-8433-d47bc8a76992', 'af709d7f-883d-4f94-884c-b6010e0a415c', '6', '2022-05-29 16:45:36', '2022-05-29 16:45:36');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mg_socials
-- ----------------------------
INSERT INTO `mg_socials` VALUES ('90490802-b8c3-4766-85b5-82904a27cd5e', 'Gitee', 'icon-gitee', '#ff6d6d', 'https://gitee.com/Z568_568', '', '', '2022-04-24 10:55:49', '2022-04-24 10:55:49');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mg_sorts
-- ----------------------------
INSERT INTO `mg_sorts` VALUES ('1ba60c63-9cf9-4e98-9858-c934f44aa511', '后端', '后端相关文章', '/comment/index', '2022-04-17 11:11:26', '2022-04-26 14:08:23');
INSERT INTO `mg_sorts` VALUES ('9a58d27b-ed33-4cfa-a1a7-af4e8d46e9c6', '前端', '前端相关文章', '/comment/index', '2022-04-17 11:26:37', '2022-04-26 14:08:06');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mg_tags
-- ----------------------------
INSERT INTO `mg_tags` VALUES ('141b1b1e-b233-4182-bfb1-876cd88cd690', '测试威威标签', 'vue蒂摩艾殊', '2022-04-17 11:06:40', '2022-04-17 11:06:40');
INSERT INTO `mg_tags` VALUES ('bb2bcdff-249d-4663-b95c-426c9e4ac5db', '测试标签', 'vue蒂摩艾殊', '2022-04-16 21:36:42', '2022-04-16 21:36:42');
INSERT INTO `mg_tags` VALUES ('beaea537-24ad-45a1-93e3-cac43f2a735e', 'vue.js', 'vue蒂摩艾殊', '2022-04-16 20:46:36', '2022-04-16 20:46:36');
INSERT INTO `mg_tags` VALUES ('c12dc649-f95f-4b17-9a38-82f6cbd1d2e5', '幅度萨芬看签', 'vue蒂摩艾殊', '2022-04-17 11:25:42', '2022-04-17 11:25:42');
INSERT INTO `mg_tags` VALUES ('e973bae4-a895-4c6e-8400-c52ce2594cb0', '123456', '看符尽快发货的四个', '2022-04-17 11:15:04', '2022-04-17 11:15:25');
INSERT INTO `mg_tags` VALUES ('f78f1211-08e6-4cac-8ec4-8a9878f9d0cb', 'react.js', 'vue蒂摩艾殊', '2022-04-16 20:50:13', '2022-04-16 20:50:13');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mg_users
-- ----------------------------
INSERT INTO `mg_users` VALUES ('c1310297-443e-44f6-83f1-8a416e6a2973', 'ZYFK', 'LxlrAAx6eAI8vDHriZVzPqA77y76YaZYh0kxTFT3cXgROwVI5zUnZs9ZI41d0/+n', 'ZYFK', NULL, '2022-04-26 23:10:08', '2022-04-28 17:42:29', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', 1);
INSERT INTO `mg_users` VALUES ('cb404a29-c68f-495f-97f0-d3d0e8369853', 'editor', 'Vchs0bbdk2pr/Ac6DsHruw==', 'Editor', NULL, '2022-04-28 17:49:36', '2022-04-28 17:49:36', '86deca84-5bdb-4ec4-8979-a72abcbc27bb', 1);
INSERT INTO `mg_users` VALUES ('e5d03ffa-39ee-42d5-a9e3-2bba1c987bd1', 'admin', 'Vchs0bbdk2pr/Ac6DsHruw==', '芒果快熟', NULL, '2022-04-26 21:53:54', '2022-04-26 21:53:54', 'af709d7f-883d-4f94-884c-b6010e0a415c', 1);

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mg_website
-- ----------------------------
INSERT INTO `mg_website` VALUES ('7d5a2521-9a6d-410d-8531-f07afe4c3b92', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy_130iiorSSjF1RWgNBX7qy3evKv2HKsH0g&usqp=CAU', 'MG′blog', 'Be encouraged in time, time waits for no one.', 'https://www.zhouyi.run', '及时当勉励，岁月不待人。', '一个It技术的探索者', NULL, '2022-04-23 13:00:04', '2022-04-28 17:07:12');

SET FOREIGN_KEY_CHECKS = 1;
