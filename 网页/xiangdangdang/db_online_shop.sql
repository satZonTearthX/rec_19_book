/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost
 Source Database       : db_online_shop

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : utf-8

 Date: 07/02/2019 18:20:03 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `trueName` varchar(32) DEFAULT NULL,
  `sex` int(2) DEFAULT '0',
  `status` int(2) DEFAULT '1',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `account`
-- ----------------------------
BEGIN;
INSERT INTO `account` VALUES ('2', '猿来入此', '1', 'llq@qq.com', '猿来入此', '1', '1', '2019-05-16 22:38:03'), ('8', 'test', '11', 'test@qq.com', '张三', '1', '1', '2019-05-29 20:44:10'), ('9', 'libohan', '123', '16301041@bjtu.edu.cn', null, '0', '1', '2019-07-01 21:48:38');
COMMIT;

-- ----------------------------
--  Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `phone` varchar(32) NOT NULL DEFAULT '',
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `address`
-- ----------------------------
BEGIN;
INSERT INTO `address` VALUES ('12', '2', '猿来入此', '上海 浦东 世纪大道311号', '13656565656', '2019-05-25 22:19:25'), ('13', '2', '马冬梅', '北京 海淀 梧桐大道666号', '138188181818', '2019-05-25 22:20:28'), ('14', '8', '张三', '北京 海淀 梧桐大道666号', '13656565656', '2019-05-29 20:48:30'), ('16', '9', 'aaa', 'aaa', 'qq', '2019-07-01 21:49:34');
COMMIT;

-- ----------------------------
--  Table structure for `authority`
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `authority_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `authority_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `authority`
-- ----------------------------
BEGIN;
INSERT INTO `authority` VALUES ('148', '2', '35'), ('149', '2', '36'), ('150', '2', '25'), ('151', '2', '1'), ('152', '2', '14'), ('153', '2', '15'), ('331', '1', '1'), ('332', '1', '5'), ('333', '1', '17'), ('334', '1', '18'), ('335', '1', '19'), ('336', '1', '20'), ('337', '1', '13'), ('338', '1', '21'), ('339', '1', '22'), ('340', '1', '23'), ('341', '1', '35'), ('342', '1', '36'), ('343', '1', '14'), ('344', '1', '15'), ('345', '1', '24'), ('346', '1', '25'), ('347', '1', '26'), ('348', '1', '31'), ('349', '1', '32'), ('350', '1', '33'), ('351', '1', '34'), ('352', '1', '37'), ('353', '1', '38'), ('354', '1', '39'), ('355', '1', '40'), ('356', '1', '41'), ('357', '1', '42'), ('358', '1', '43'), ('359', '1', '44'), ('360', '1', '45'), ('361', '1', '46'), ('362', '1', '47'), ('363', '1', '48'), ('364', '1', '49'), ('365', '1', '50'), ('366', '1', '51'), ('367', '1', '52'), ('368', '1', '53'), ('369', '1', '54'), ('370', '1', '55'), ('371', '1', '56'), ('372', '1', '57'), ('373', '1', '58'), ('374', '1', '59'), ('375', '1', '60'), ('376', '1', '61');
COMMIT;

-- ----------------------------
--  Table structure for `c3p0testtable`
-- ----------------------------
DROP TABLE IF EXISTS `c3p0testtable`;
CREATE TABLE `c3p0testtable` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `imageUrl` varchar(128) NOT NULL,
  `price` float(8,2) NOT NULL DEFAULT '0.00',
  `num` int(8) NOT NULL DEFAULT '0',
  `money` double(8,2) NOT NULL DEFAULT '0.00',
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productCategoryId` (`productId`),
  KEY `userId` (`userId`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `account` (`id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cart`
-- ----------------------------
BEGIN;
INSERT INTO `cart` VALUES ('8', '8', '2', '女士上衣夏季最新款式冰丝凉爽', '/OnlineShop/resources/upload/1558012737181.jpg', '399.00', '1', '399.00', '2019-05-29 20:49:03'), ('9', '9', '11', '羿萱19年夏新款高跟凉鞋女欧美真皮一字绑带性感细跟防水台高跟鞋', '/OnlineShop/resources/upload/1559133484283.jpg', '248.00', '1', '248.00', '2019-07-02 09:34:42'), ('10', '9', '9', '发夹女韩国成人顶夹水钻头饰优雅发卡弹簧夹横夹后脑勺盘发马尾夹', '/OnlineShop/resources/upload/1559133217699.png', '79.00', '1', '79.00', '2019-07-02 09:35:09');
COMMIT;

-- ----------------------------
--  Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` int(2) NOT NULL DEFAULT '1',
  `content` varchar(512) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `userId` (`userId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `comment`
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES ('1', '1', '2', '1', '非常好！', '2019-05-26 21:45:18'), ('2', '2', '2', '2', '还行吧，模特穿着好看，真人就不行了！', '2019-05-28 19:22:43'), ('4', '1', '2', '0', '不行呀！', '2019-05-28 19:24:28'), ('5', '6', '8', '1', '真的很不错！', '2019-05-29 20:51:53');
COMMIT;

-- ----------------------------
--  Table structure for `favorite`
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `imageUrl` varchar(128) NOT NULL,
  `price` float(8,2) NOT NULL DEFAULT '0.00',
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productCategoryId` (`productId`),
  KEY `userId` (`userId`),
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `account` (`id`),
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `favorite`
-- ----------------------------
BEGIN;
INSERT INTO `favorite` VALUES ('12', '2', '5', '施华洛世奇 LIFELONG手镯 扭结设计气质手', '/OnlineShop/resources/upload/1558249319805.png', '1498.00', '2019-05-25 21:01:50'), ('13', '2', '3', 'NIKE耐克男鞋板鞋2019新款系列高帮小白鞋', '/OnlineShop/resources/upload/1558249017645.png', '559.00', '2019-05-25 21:02:05'), ('14', '8', '11', '羿萱19年夏新款高跟凉鞋女欧美真皮一字绑带性感细跟防水台高跟鞋', '/OnlineShop/resources/upload/1559133484283.jpg', '248.00', '2019-05-29 20:48:55'), ('15', '8', '2', '女士上衣夏季最新款式冰丝凉爽', '/OnlineShop/resources/upload/1558012737181.jpg', '399.00', '2019-05-29 20:49:01'), ('16', '8', '6', 'Crocs女靴子保暖 秋季卡骆驰阿瑞安娜反绒平底中筒时装靴', '/OnlineShop/resources/upload/1559132898198.png', '256.00', '2019-05-29 20:52:09');
COMMIT;

-- ----------------------------
--  Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `log`
-- ----------------------------
BEGIN;
INSERT INTO `log` VALUES ('13', '用户名为admin的用户登录时输入验证码错误!', '2018-12-16 18:17:30'), ('14', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:22:56'), ('15', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:37:15'), ('16', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:40:21'), ('17', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 19:11:49'), ('18', '用户名为{admin}，的用户成功修改密码!', '2018-12-16 19:13:32'), ('19', '用户名为{admin}，的用户成功修改密码!', '2018-12-16 19:14:01'), ('20', '用户名为{猿来入此}，角色为{普通用户}的用户登录成功!', '2018-12-16 19:17:46'), ('22', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-11 12:57:34'), ('23', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-11 21:40:09'), ('24', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-11 21:54:06'), ('25', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-11 21:58:33'), ('26', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-12 20:13:42'), ('27', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-12 20:22:05'), ('28', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-12 20:29:01'), ('29', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-12 21:17:59'), ('30', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-12 21:19:26'), ('31', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-12 21:31:46'), ('32', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-12 21:33:51'), ('33', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-12 22:17:49'), ('34', '用户名为admin的用户登录时输入验证码错误!', '2019-05-14 21:20:08'), ('35', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-14 21:20:16'), ('36', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-15 19:14:10'), ('37', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-15 19:17:26'), ('38', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-15 19:23:03'), ('39', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-15 19:25:28'), ('40', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-15 19:33:06'), ('41', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-15 20:41:21'), ('42', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-15 21:04:28'), ('43', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-15 21:05:49'), ('44', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-15 22:05:41'), ('45', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-15 22:14:42'), ('46', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-15 22:16:23'), ('47', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-15 22:21:00'), ('48', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-15 22:36:01'), ('49', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-16 19:24:56'), ('50', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-16 19:40:45'), ('51', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-16 19:50:03'), ('52', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-16 21:18:09'), ('53', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-16 21:34:36'), ('54', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-16 21:36:41'), ('55', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-16 22:21:34'), ('56', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-16 22:24:09'), ('57', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-16 22:36:53'), ('58', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-17 22:40:24'), ('59', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-18 11:58:57'), ('60', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-18 12:09:15'), ('61', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-18 12:14:11'), ('62', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-18 12:26:37'), ('63', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-18 12:27:52'), ('64', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-18 13:07:54'), ('65', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-18 14:27:55'), ('66', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-18 15:19:48'), ('67', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-18 15:23:44'), ('68', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-18 15:46:50'), ('69', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-18 17:29:48'), ('70', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-18 17:33:18'), ('71', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-18 20:06:23'), ('72', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-19 12:05:18'), ('73', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-19 12:26:59'), ('74', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-19 14:50:48'), ('75', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-26 19:55:02'), ('76', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-26 20:07:40'), ('77', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-28 20:16:59'), ('78', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-28 21:20:18'), ('79', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-28 21:30:27'), ('80', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-29 19:48:21'), ('81', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-29 19:50:37'), ('82', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-29 19:55:26'), ('83', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-29 19:57:26'), ('84', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-29 20:01:38'), ('85', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-29 20:05:04'), ('86', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-29 20:10:43'), ('87', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-29 20:19:45'), ('88', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-29 20:21:31'), ('89', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-29 20:43:39'), ('90', '用户名为admin的用户登录时输入验证码错误!', '2019-05-29 20:50:06'), ('91', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-29 20:50:14');
COMMIT;

-- ----------------------------
--  Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL DEFAULT '-1',
  `name` varchar(32) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `menu`
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES ('1', '0', '系统设置', '', 'icon-advancedsettings'), ('5', '1', '菜单管理', '../admin/menu/list', 'icon-chart-organisation'), ('13', '1', '角色管理', '../admin/role/list', 'icon-group-key'), ('14', '0', '用户管理', '', 'icon-group-gear'), ('15', '14', '用户列表', '../admin/user/list', 'icon-group'), ('17', '5', '添加', 'openAdd()', 'icon-add'), ('18', '5', '编辑', 'openEdit()', 'icon-bullet-edit'), ('19', '5', '删除', 'remove()', 'icon-cross'), ('20', '5', '添加按钮', 'openAddMenu()', 'icon-add'), ('21', '13', '添加', 'openAdd()', 'icon-add'), ('22', '13', '编辑', 'openEdit()', 'icon-bullet-edit'), ('23', '13', '删除', 'remove()', 'icon-cross'), ('24', '15', '添加', 'openAdd()', 'icon-add'), ('25', '15', '编辑', 'openEdit()', 'icon-bullet-edit'), ('26', '15', '删除', 'remove()', 'icon-cross'), ('31', '0', '系统日志', '', 'icon-table-cell'), ('32', '31', '日志列表', '../admin/log/list', 'icon-page-white-text'), ('33', '32', '添加日志', 'openAdd()', 'icon-add1'), ('34', '32', '删除', 'remove()', 'icon-cancel'), ('35', '1', '修改密码', 'edit_password', 'icon-lock-edit'), ('36', '35', '修改密码', 'openAdd()', 'icon-lock-edit'), ('37', '0', '商品分类', '', 'icon-sitemap-color'), ('38', '37', '分类列表', '../admin/product_category/list', 'icon-sitemap'), ('39', '38', '添加', 'openAdd()', 'icon-chart-organisation-add'), ('40', '38', '编辑', 'openEdit()', 'icon-bullet-edit'), ('41', '38', '删除', 'remove()', 'icon-chart-organisation-delete'), ('42', '0', '商品管理', '', 'icon-cart-full'), ('43', '42', '商品列表', '../admin/product/list', 'icon-cart'), ('44', '43', '添加', 'openAdd()', 'icon-cart-add'), ('45', '43', '编辑', 'openEdit()', 'icon-cart-edit'), ('46', '43', '删除', 'remove()', 'icon-cart-delete'), ('47', '0', '客户管理', '', 'icon-users'), ('48', '47', '客户列表', '../admin/account/list', 'icon-user-group'), ('49', '48', '添加', 'openAdd()', 'icon-user-add'), ('50', '48', '编辑', 'openEdit()', 'icon-user-edit'), ('51', '48', '删除', 'remove()', 'icon-user-cross'), ('52', '0', '订单管理', '', 'icon-database'), ('53', '52', '订单列表', '../admin/order/list', 'icon-database-gear'), ('54', '53', '编辑订单', 'openEdit()', 'icon-database-edit'), ('55', '53', '查看订单', 'openView()', 'icon-eye'), ('56', '0', '评论管理', '', 'icon-comment'), ('57', '56', '评论列表', '../admin/comment/list', 'icon-comments'), ('58', '57', '编辑', 'openEdit()', 'icon-comment-edit'), ('59', '57', '删除', 'remove()', 'icon-comment-delete'), ('60', '0', '销售统计', '', 'icon-chart-curve'), ('61', '60', '统计图表', '../admin/stats/stats', 'icon-chart-line');
COMMIT;

-- ----------------------------
--  Table structure for `order_item`
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `imageUrl` varchar(128) NOT NULL,
  `price` float(8,2) NOT NULL,
  `num` int(8) NOT NULL DEFAULT '0',
  `money` double(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `productCategoryId` (`orderId`),
  KEY `productId` (`productId`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `order_item`
-- ----------------------------
BEGIN;
INSERT INTO `order_item` VALUES ('11', '1', '6', '男士上衣夏季最新款式冰丝凉爽', '/OnlineShop/resources/upload/1557930073452.png', '256.00', '2', '512.00'), ('12', '2', '6', '女士上衣夏季最新款式冰丝凉爽', '/OnlineShop/resources/upload/1558012737181.jpg', '399.00', '6', '2394.00'), ('13', '5', '6', '施华洛世奇 LIFELONG手镯 扭结设计气质手', '/OnlineShop/resources/upload/1558249319805.png', '1498.00', '1', '1498.00'), ('14', '3', '7', 'NIKE耐克男鞋板鞋2019新款系列高帮小白鞋', '/OnlineShop/resources/upload/1558249017645.png', '559.00', '1', '559.00'), ('15', '4', '7', 'adidas阿迪达斯NEO男子双肩包休闲', '/OnlineShop/resources/upload/1558249165107.png', '169.00', '3', '507.00'), ('16', '2', '8', '女士上衣夏季最新款式冰丝凉爽', '/OnlineShop/resources/upload/1558012737181.jpg', '399.00', '3', '1197.00'), ('17', '5', '8', '施华洛世奇 LIFELONG手镯 扭结设计气质手', '/OnlineShop/resources/upload/1558249319805.png', '1498.00', '1', '1498.00'), ('18', '1', '9', '男士上衣夏季最新款式冰丝凉爽', '/OnlineShop/resources/upload/1557930073452.png', '256.00', '1', '256.00'), ('19', '4', '9', 'adidas阿迪达斯NEO男子双肩包休闲', '/OnlineShop/resources/upload/1558249165107.png', '169.00', '1', '169.00'), ('20', '5', '9', '施华洛世奇 LIFELONG手镯 扭结设计气质手', '/OnlineShop/resources/upload/1558249319805.png', '1498.00', '4', '5992.00'), ('21', '6', '10', 'Crocs女靴子保暖 秋季卡骆驰阿瑞安娜反绒平底中筒时装靴', '/OnlineShop/resources/upload/1559132898198.png', '256.00', '1', '256.00'), ('22', '11', '10', '羿萱19年夏新款高跟凉鞋女欧美真皮一字绑带性感细跟防水台高跟鞋', '/OnlineShop/resources/upload/1559133484283.jpg', '248.00', '2', '496.00'), ('23', '10', '10', '盈月黑狗牙吊坠项链真藏獒牙齿狼牙形男女时尚挂件本命年个性饰品', '/OnlineShop/resources/upload/1559133369645.png', '79.00', '1', '79.00'), ('24', '7', '10', '小米小米胸包男士单肩斜跨包斜挎多功能实用耐磨迷你腰包', '/OnlineShop/resources/upload/1559133008831.jpg', '66.00', '2', '132.00'), ('25', '10', '11', '盈月黑狗牙吊坠项链真藏獒牙齿狼牙形男女时尚挂件本命年个性饰品', '/OnlineShop/resources/upload/1559133369645.png', '79.00', '1', '79.00');
COMMIT;

-- ----------------------------
--  Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(32) NOT NULL,
  `userId` int(11) NOT NULL,
  `address` varchar(128) NOT NULL,
  `money` double(8,2) NOT NULL DEFAULT '0.00',
  `productNum` int(5) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '0',
  `remark` varchar(128) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `orders`
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES ('6', 'O1558860859191', '2', '上海 浦东 世纪大道311号 猿来入此(收) 13656565656', '4404.00', '9', '2', '奢侈一把！', '2019-05-14 16:54:19'), ('7', 'O1558871439034', '2', '北京 海淀 梧桐大道666号 马冬梅(收) 138188181818', '1066.00', '4', '1', '麻烦尽快发货！', '2019-05-18 19:50:39'), ('8', 'O1558872310401', '2', '上海 浦东 世纪大道311号 猿来入此(收) 13656565656', '2695.00', '4', '0', '麻烦发顺丰快递！', '2019-05-22 20:05:10'), ('9', 'O1559131982370', '2', '北京 海淀 梧桐大道666号 马冬梅(收) 138188181818', '6417.00', '6', '0', '', '2019-05-25 20:13:02'), ('10', 'O1559134120931', '8', '北京 海淀 梧桐大道666号 张三(收) 13656565656', '963.00', '6', '2', '第一次购买！', '2019-05-29 20:48:40'), ('11', 'O1561988979501', '9', 'aaa aaa(��) qq', '79.00', '1', '0', '', '2019-07-01 21:49:40');
COMMIT;

-- ----------------------------
--  Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productCategoryId` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `tags` varchar(32) NOT NULL,
  `imageUrl` varchar(128) NOT NULL,
  `price` float(8,2) NOT NULL,
  `stock` int(8) NOT NULL DEFAULT '0',
  `sellNum` int(8) NOT NULL DEFAULT '0',
  `viewNum` int(8) NOT NULL DEFAULT '0',
  `commentNum` int(8) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `createTime` datetime(6) NOT NULL,
  `ISBN` bigint(50) DEFAULT NULL,
  `author` varchar(50) NOT NULL,
  `publisher` varchar(20) DEFAULT NULL,
  `pub_time` varchar(12) DEFAULT NULL,
  `scale` varchar(10) DEFAULT NULL,
  `page_no` varchar(10) DEFAULT NULL,
  `rating` int(10) DEFAULT NULL,
  `ori_price` float(10,0) DEFAULT NULL,
  `barcode` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productCategoryId` (`productCategoryId`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`productCategoryId`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `product`
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES ('1', '14', '男士上衣夏季最新款式冰丝凉爽', '10,13,14', '/OnlineShop/resources/upload/1557930073452.png', '256.00', '96', '3', '29', '2', '<p>递四方速递割发代首撒旦打撒<br/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0016.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/></p>', '2019-05-15 22:21:53.000000', null, '胡适', null, null, null, null, null, null, null), ('2', '21', '女士上衣夏季最新款式冰丝凉爽', '10,19,21', '/OnlineShop/resources/upload/1558012737181.jpg', '399.00', '46', '9', '37', '1', '<p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 20px;\">女士上衣</span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 20px;\"><img src=\"/OnlineShop/resources/upload/image/20190515/1557929575652070109.jpg\" alt=\"1557929575652070109.jpg\"/></span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 20px;\"><img src=\"/OnlineShop/resources/upload/image/20190516/1558012775313039494.jpg\" title=\"1558012775313039494.jpg\" alt=\"u=2305748553,3511779727&amp;fm=11&amp;gp=0.jpg\"/></span></p>', '2019-05-16 21:19:37.000000', null, '胡适', null, null, null, null, null, null, null), ('3', '38', 'NIKE耐克男鞋板鞋2019新款系列高帮小白鞋', '11,16,38', '/OnlineShop/resources/upload/1558249017645.png', '559.00', '97', '1', '14', '0', '<ul class=\"goodsprops clearfix list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">商品重量：</span><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">960.000</span><span class=\"Apple-converted-space\">&nbsp;</span>克(g)</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">货号：</span><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\"><span class=\"Apple-converted-space\">&nbsp;</span>耐克<span class=\"Apple-converted-space\">&nbsp;</span><strong style=\"margin: 0px; padding: 0px;\">AQ1773-100</strong></span></p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">品　　牌：</span>NIKE</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">配色：</span><span class=\"Apple-converted-space\">&nbsp;</span>白/白</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">款式：</span><span class=\"Apple-converted-space\">&nbsp;</span>板鞋</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">帮面材质：</span><span class=\"Apple-converted-space\">&nbsp;</span>牛剖层革+合成革</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">性别：</span><span class=\"Apple-converted-space\">&nbsp;</span>男</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">大底材质：</span><span class=\"Apple-converted-space\">&nbsp;</span>橡胶</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">价格区间：</span><span class=\"Apple-converted-space\">&nbsp;</span>400-499元</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">试穿建议：</span><span class=\"Apple-converted-space\">&nbsp;</span>正常码购买</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">包装情况：</span><span class=\"Apple-converted-space\">&nbsp;</span>无挂牌</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">产地：</span><span class=\"Apple-converted-space\">&nbsp;</span>印尼</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">鞋名：</span><span class=\"Apple-converted-space\">&nbsp;</span>NIKE EBERNON MID</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">适合：</span><span class=\"Apple-converted-space\">&nbsp;</span>硬地</p></li></ul><p><img src=\"/OnlineShop/resources/upload/image/20190519/1558249045703088170.jpg\" title=\"1558249045703088170.jpg\" alt=\"AQ1773-100_06.jpg\"/></p>', '2019-05-19 14:57:29.000000', null, '胡适', null, null, null, null, null, null, null), ('4', '24', 'adidas阿迪达斯NEO男子双肩包休闲', '11,20,24', '/OnlineShop/resources/upload/1558249165107.png', '169.00', '62', '4', '8', '0', '<ul class=\"goodsprops clearfix list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">商品重量：</span><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">320.000</span><span class=\"Apple-converted-space\">&nbsp;</span>克(g)</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">货号：</span><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\"><span class=\"Apple-converted-space\">&nbsp;</span>NEO<span class=\"Apple-converted-space\">&nbsp;</span><strong style=\"margin: 0px; padding: 0px;\">CF6852</strong></span></p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">品　　牌：</span>neo</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">款式：</span><span class=\"Apple-converted-space\">&nbsp;</span>双肩包</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">背包方式：</span><span class=\"Apple-converted-space\">&nbsp;</span>双肩</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">质地：</span><span class=\"Apple-converted-space\">&nbsp;</span>主料（非纤维物质除外）聚酯纤维 拼料（非物质纤维除外）：聚酯纤维</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">开袋方式：</span><span class=\"Apple-converted-space\">&nbsp;</span>拉链</p></li><li><p><span style=\"margin: 0px; padding: 0px 5px 0px 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; list-style: none;\">流行元素：</span><span class=\"Apple-converted-space\">&nbsp;</span>无</p></li></ul><p><img src=\"/OnlineShop/resources/upload/image/20190519/1558249175946070275.jpg\" title=\"1558249175946070275.jpg\" alt=\"CF6852_02.jpg\"/></p>', '2019-05-19 14:59:39.000000', null, '胡适', null, null, null, null, null, null, null), ('5', '48', '施华洛世奇 LIFELONG手镯 扭结设计气质手', '11,47,48', '/OnlineShop/resources/upload/1558249319805.png', '1498.00', '3', '6', '11', '0', '<h1 style=\"margin: 0px; padding: 0px 0px 0.2em; font-size: 16px; font-family: &quot;microsoft yahei&quot;; line-height: 1; white-space: normal; background-color: rgb(255, 255, 255);\">施华洛世奇 LIFELONG手镯 扭结设计气质手链女首饰 520礼物</h1><p><img src=\"/OnlineShop/resources/upload/image/20190519/1558249374009017452.gif\" title=\"1558249374009017452.gif\" alt=\"O1CN01HOW63z1Umyqr9EOof_!!2576722561.gif\"/></p>', '2019-05-19 15:02:56.000000', null, '胡适', null, null, null, null, null, null, null), ('6', '40', 'Crocs女靴子保暖 秋季卡骆驰阿瑞安娜反绒平底中筒时装靴', '11,16,40', '/OnlineShop/resources/upload/1559132898198.png', '256.00', '65', '1', '2', '1', '<p><img src=\"/OnlineShop/resources/upload/image/20190529/1559132923205092854.jpg\"/></p>', '2019-05-29 20:28:50.000000', null, '胡适', null, null, null, null, null, null, null), ('7', '23', '小米小米胸包男士单肩斜跨包斜挎多功能实用耐磨迷你腰包', '11,20,23', '/OnlineShop/resources/upload/1559133008831.jpg', '66.00', '76', '2', '2', '0', '<p><img src=\"/OnlineShop/resources/upload/image/20190529/1559133028832034986.jpg\"/></p>', '2019-05-29 20:30:39.000000', null, '胡适', null, null, null, null, null, null, null), ('8', '43', '稻草人钱包男士真皮短款男式钱夹大容量牛皮青年多功能驾驶证皮夹', '11,20,43', '/OnlineShop/resources/upload/1559133135872.jpg', '138.00', '99', '0', '2', '0', '<p><img src=\"/OnlineShop/resources/upload/image/20190529/1559133151772024402.jpg\"/></p>', '2019-05-29 20:32:33.000000', null, '胡适', null, null, null, null, null, null, null), ('9', '49', '发夹女韩国成人顶夹水钻头饰优雅发卡弹簧夹横夹后脑勺盘发马尾夹', '11,47,49', '/OnlineShop/resources/upload/1559133217699.png', '79.00', '99', '0', '4', '0', '<p><img src=\"https://img.alicdn.com/imgextra/i1/729183874/O1CN01UhGL9W1eUKscvret8_!!729183874.jpg\"/></p>', '2019-05-29 20:34:03.000000', null, '胡适', null, null, null, null, null, null, null), ('10', '52', '人生是一件严重的事实-胡适谈人生', '11,47,52', '/OnlineShop/resources/upload/1559133369645.png', '11.20', '35', '15', '131', '0', '<p><img src=\"/OnlineShop/resources/upload/image/20190529/1559133385355016104.jpg\" alt=\"04.jpg\"/></p>', '2019-06-17 20:36:28.000000', '9787550282766', '胡适', '北京联合出版公司', '2016-08-01', '32开', '299', '5', '35', '9787550282766'), ('11', '42', '羿萱19年夏新款高跟凉鞋女欧美真皮一字绑带性感细跟防水台高跟鞋', '11,16,42', '/OnlineShop/resources/upload/1559133484283.jpg', '248.00', '54', '2', '8', '0', '<p><img src=\"/OnlineShop/resources/upload/image/20190529/1559133498834014291.jpg\" width=\"636\" height=\"867\"/></p><p><img src=\"/OnlineShop/resources/upload/image/20190529/1559133512547097023.jpg\"/></p>', '2019-05-29 20:38:34.000000', null, '胡适', null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `product_category`
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `name` varchar(128) CHARACTER SET utf32 NOT NULL,
  `tags` varchar(32) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `product_category`
-- ----------------------------
BEGIN;
INSERT INTO `product_category` VALUES ('10', null, '男女服装', null, '男女服装'), ('11', null, '鞋包配饰', null, '鞋包配饰'), ('12', null, '美容美妆', null, '美容美妆'), ('13', '10', '男装', '10', '男装'), ('14', '13', '男士上衣', '10,13', '男士上衣'), ('16', '11', '鞋子', '11', '鞋子'), ('17', '12', '美容', '12', '美容'), ('18', '12', '美妆', '12', '美妆'), ('19', '10', '女装', '10', '女装'), ('20', '11', '包包', '11', '包包'), ('21', '19', '女士上衣', '10,19', '女士上衣'), ('22', '16', '皮鞋', '11,16', '皮鞋'), ('23', '20', '单肩包', '11,20', '单肩包'), ('24', '20', '双肩包', '11,20', '双肩包'), ('26', '13', '风衣', '10,13', '风衣'), ('27', '13', '牛仔裤', '10,13', '牛仔裤'), ('28', '13', '毛呢大衣', '10,13', '毛呢大衣'), ('29', '13', '棉衣', '10,13', '棉衣'), ('30', '13', '情侣装', '10,13', '情侣装'), ('31', '19', '情侣装', '10,19', '情侣装'), ('32', '19', '长袖连衣裙', '10,19', '长袖连衣裙'), ('33', '19', '毛呢连衣裙', '10,19', '毛呢连衣裙'), ('34', '19', '半身裙', '10,19', '半身裙'), ('35', '19', '加绒打底裤', '10,19', '加绒打底裤'), ('36', '16', '布鞋', '11,16', '布鞋'), ('37', '16', '板鞋', '11,16', '板鞋'), ('38', '16', '高帮鞋', '11,16', '高帮鞋'), ('39', '16', '棉鞋', '11,16', '棉鞋'), ('40', '16', '靴子', '11,16', '靴子'), ('41', '16', '豆豆鞋', '11,16', '豆豆鞋'), ('42', '16', '高跟鞋', '11,16', '高跟鞋'), ('43', '20', '钱包', '11,20', '钱包'), ('44', '20', '钥匙包', '11,20', '钥匙包'), ('45', '20', '公文包', '11,20', '公文包'), ('46', '20', '书包', '11,20', '书包'), ('47', '11', '饰品', '11', '饰品'), ('48', '47', '首饰类', '11,47', '首饰类'), ('49', '47', '头饰', '11,47', '头饰'), ('50', '47', '胸饰', '11,47', '胸饰'), ('51', '47', '脚饰', '11,47', '脚饰'), ('52', '47', '挂饰', '11,47', '挂饰'), ('53', '17', '洗面乳', '12,17', '洗面乳'), ('54', '17', '浴液', '12,17', '浴液'), ('55', '17', '洗发液', '12,17', '洗发液'), ('56', '17', '化妆水', '12,17', '化妆水'), ('57', '17', '香水', '12,17', '香水'), ('58', '17', '洁肤水', '12,17', '洁肤水'), ('59', '17', '卸妆液', '12,17', '卸妆液'), ('60', '17', '精华液', '12,17', '精华液'), ('61', '17', '原液', '12,17', '原液'), ('62', '17', '乳液', '12,17', '乳液'), ('63', '17', '润面霜', '12,17', '润面霜'), ('64', '17', '粉底霜', '12,17', '粉底霜'), ('65', '18', '底妆', '12,18', '底妆'), ('66', '18', ' 定妆', '12,18', ' 定妆'), ('67', '18', '眼线', '12,18', '眼线'), ('68', '18', '眼影', '12,18', '眼影'), ('69', '18', '睫毛膏', '12,18', '睫毛膏'), ('70', '18', '下眼线', '12,18', '下眼线'), ('71', '18', ' 修颜', '12,18', ' 修颜'), ('72', '18', ' 腮红', '12,18', ' 腮红'), ('73', '18', '唇彩', '12,18', '唇彩'), ('74', '18', '成妆', '12,18', '成妆'), ('75', null, '家用电器', null, '家用电器'), ('76', '75', '大家电', '75', '大家电'), ('77', '75', '生活电器', '75', '生活电器'), ('78', '75', '个护健康', '75', '个护健康'), ('79', '75', '厨房电器', '75', '厨房电器'), ('80', '75', '五金家族', '75', '五金家族'), ('81', '76', '家庭影院', '75,76', '家庭影院'), ('82', '76', '洗衣机', '75,76', '洗衣机'), ('83', '76', '冰箱/酒柜', '75,76', '冰箱/酒柜'), ('84', '76', '空调', '75,76', '空调'), ('85', '76', '平板电视', '75,76', '平板电视'), ('86', '77', '净化器', '75,77', '净化器'), ('87', '77', '电话机', '75,77', '电话机'), ('88', '77', '除湿机', '75,77', '除湿机'), ('89', '77', '电风扇', '75,77', '电风扇'), ('90', '77', '热水器', '75,77', '热水器'), ('91', '77', '取暖电器', '75,77', '取暖电器'), ('92', '77', '吸尘器', '75,77', '吸尘器'), ('93', '78', '理发器', '75,78', '理发器'), ('94', '78', '美容器', '75,78', '美容器'), ('95', '78', '电吹风', '75,78', '电吹风'), ('96', '78', '口腔护理', '75,78', '口腔护理'), ('97', '78', '按摩椅', '75,78', '按摩椅'), ('98', '78', '夹板', '75,78', '夹板'), ('99', '79', '电饭煲', '75,79', '电饭煲'), ('100', '79', '电压力锅', '75,79', '电压力锅'), ('101', '79', '榨汁机', '75,79', '榨汁机'), ('102', '79', '电水壶', '75,79', '电水壶'), ('103', '79', '吸油烟机', '75,79', '吸油烟机'), ('104', '79', '洗碗机/消毒柜', '75,79', '洗碗机/消毒柜'), ('105', '79', '电烤箱', '75,79', '电烤箱'), ('106', '79', '咖啡机', '75,79', '咖啡机'), ('107', '79', '面包机', '75,79', '面包机'), ('108', '79', '豆浆机', '75,79', '豆浆机'), ('109', '80', 'LED灯', '75,80', 'LED灯'), ('110', '80', '电动工具', '75,80', '电动工具'), ('111', '80', '手动工具', '75,80', '手动工具'), ('112', '80', '仪器仪表', '75,80', '仪器仪表'), ('113', '80', '浴霸/排气扇', '75,80', '浴霸/排气扇'), ('114', '80', '灯具', '75,80', '灯具'), ('115', null, '手机数码', null, '手机数码'), ('116', '115', '手机通讯', '115', '手机通讯'), ('117', '116', '智能设备', '115,116', '智能设备'), ('118', '116', '非智能手机', '115,116', '非智能手机'), ('119', '116', '智能手机', '115,116', '智能手机'), ('120', '115', '数码配件', '115', '数码配件'), ('121', '115', '摄影摄像', '115', '摄影摄像'), ('122', '115', '影音娱乐', '115', '影音娱乐'), ('123', '120', '相机清洁/贴膜', '115,120', '相机清洁/贴膜'), ('124', '120', '相机电池', '115,120', '相机电池'), ('125', '120', '三脚架/云台', '115,120', '三脚架/云台'), ('126', '120', '读卡器', '115,120', '读卡器'), ('127', '120', '储存卡', '115,120', '储存卡'), ('128', '120', '三脚架', '115,120', '三脚架'), ('129', '121', '拍立得', '115,121', '拍立得'), ('130', '121', '镜头', '115,121', '镜头'), ('131', '121', '摄像机', '115,121', '摄像机'), ('132', '121', '数码相机', '115,121', '数码相机'), ('133', '121', '单反相机', '115,121', '单反相机'), ('134', '121', '单电/微单', '115,121', '单电/微单'), ('135', '122', '苹果周边', '115,122', '苹果周边'), ('136', '122', '专业音频', '115,122', '专业音频'), ('137', '122', 'MP3/MP4', '115,122', 'MP3/MP4'), ('138', '122', '音箱/音响', '115,122', '音箱/音响'), ('139', '122', '耳机/耳麦', '115,122', '耳机/耳麦'), ('140', '122', '打印', '115,122', '打印'), ('141', '122', '平板', '115,122', '平板'), ('142', '122', '电脑', '115,122', '电脑'), ('143', null, '电脑、办公', null, '电脑、办公'), ('144', '143', '电脑整机', '143', '电脑整机'), ('145', '143', '电脑配件', '143', '电脑配件'), ('146', '143', '网络产品', '143', '网络产品'), ('147', '143', '办公设备', '143', '办公设备'), ('148', '143', '文具耗材', '143', '文具耗材'), ('149', '143', '外设产品', '143', '外设产品'), ('150', '144', '笔记本', '143,144', '笔记本'), ('151', '144', '台式机', '143,144', '台式机'), ('152', '144', '平板电脑', '143,144', '平板电脑'), ('153', '145', '相光驱', '143,145', '相光驱'), ('154', '145', '相电源', '143,145', '相电源'), ('155', '145', '机箱', '143,145', '机箱'), ('156', '145', '显卡', '143,145', '显卡'), ('157', '145', 'SSD固态硬盘', '143,145', 'SSD固态硬盘'), ('158', '145', '硬盘', '143,145', '硬盘'), ('159', '145', '内存', '143,145', '内存'), ('160', '145', '主板', '143,145', '主板'), ('161', '145', 'CPU', '143,145', 'CPU'), ('162', '146', '网络配件', '143,146', '网络配件'), ('163', '146', '上网卡', '143,146', '上网卡'), ('164', '146', '网络存储', '143,146', '网络存储'), ('165', '146', '交换机', '143,146', '交换机'), ('166', '146', '路由器', '143,146', '路由器'), ('167', '146', '网卡', '143,146', '网卡'), ('168', '146', '网络盒子', '143,146', '网络盒子'), ('169', '146', '4G/3G上网', '143,146', '4G/3G上网'), ('170', '147', '安防监控', '143,147', '安防监控'), ('171', '147', '保险柜', '143,147', '保险柜'), ('172', '147', '会议音频视频', '143,147', '会议音频视频'), ('173', '147', '考勤机', '143,147', '考勤机'), ('174', '147', '扫描设备', '143,147', '扫描设备'), ('175', '147', '传真机', '143,147', '传真机'), ('176', '147', '多功能一体机', '143,147', '多功能一体机'), ('177', '147', '投影设备', '143,147', '投影设备'), ('178', '147', '打印机', '143,147', '打印机'), ('179', '148', '本册/便签', '143,148', '本册/便签'), ('180', '148', '财会用品', '143,148', '财会用品'), ('181', '148', '办公文具', '143,148', '办公文具'), ('182', '148', '色带', '143,148', '色带'), ('183', '148', '墨盒', '143,148', '墨盒'), ('184', '148', '画具画材', '143,148', '画具画材'), ('185', '148', '计算器', '143,148', '计算器'), ('186', '148', '文件管理', '143,148', '文件管理'), ('187', '149', '插座', '143,149', '插座'), ('188', '149', 'U盘', '143,149', 'U盘'), ('189', '149', '鼠标', '143,149', '鼠标'), ('190', '149', 'UPS', '143,149', 'UPS'), ('191', '149', '电脑清洁', '143,149', '电脑清洁'), ('192', '149', '电脑工具', '143,149', '电脑工具'), ('193', '149', '外置盒具', '143,149', '外置盒'), ('194', '149', '手写板', '143,149', '手写板'), ('195', '149', '电玩', '143,149', '电玩'), ('196', null, '母婴、玩具', null, '母婴、玩具'), ('197', null, '家居用品', null, '家居用品'), ('198', null, '营养保健', null, '营养保健'), ('200', '196', '童装、童鞋', '196', '童装、童鞋'), ('201', '196', '尿裤湿巾', '196', '尿裤湿巾'), ('202', '196', '洗护用品', '196', '洗护用品'), ('203', '196', '营养辅食', '196', '营养辅食'), ('204', '196', '奶粉', '196', '奶粉'), ('205', '196', '喂养用品', '196', '喂养用品'), ('206', '196', '玩具乐器', '196', '玩具乐器'), ('207', '196', '妈妈专区', '196', '妈妈专区'), ('208', '197', '家装软饰', '197', '家装软饰'), ('209', '197', '灯具', '197', '灯具'), ('210', '197', '厨房用具', '197', '厨房用具'), ('211', '197', '生活用品', '197', '生活用品'), ('212', '197', '家具', '197', '家具'), ('213', '198', '营养健康', '198', '营养健康'), ('214', '198', '成人用品', '198', '成人用品'), ('215', '200', '童鞋', '196,200', '童鞋'), ('216', '200', '童装', '196,200', '童装'), ('217', '201', '婴儿尿裤', '196,201', '婴儿尿裤'), ('218', '201', '湿巾', '196,201', '湿巾'), ('219', '202', '奶瓶清洗', '196,202', '奶瓶清洗'), ('220', '202', '日常护理', '196,202', '日常护理'), ('221', '202', '宝宝护肤', '196,202', '宝宝护肤'), ('222', '202', '宝宝洗浴', '196,202', '宝宝洗浴'), ('223', '202', '驱蚊防蚊', '196,202', '驱蚊防蚊'), ('224', '202', '坐便器', '196,202', '坐便器'), ('225', '202', '洗衣液/皂', '196,202', '洗衣液/皂'), ('226', '202', '理发器', '196,202', '理发器'), ('227', '203', '果泥/果汁', '196,203', '果泥/果汁'), ('228', '203', '宝宝零食', '196,203', '宝宝零食'), ('229', '203', '益生菌/初乳', '196,203', '益生菌/初乳'), ('230', '203', 'DHA', '196,203', 'DHA'), ('231', '203', '钙铁锌/维生素', '196,203', '钙铁锌/维生素'), ('232', '203', '清火/开胃', '196,203', '清火/开胃'), ('233', '203', '面条/粥', '196,203', '面条/粥'), ('234', '204', '婴幼奶粉', '196,204', '婴幼奶粉'), ('235', '204', '成人奶粉', '196,204', '成人奶粉'), ('236', '205', '奶嘴奶壶', '196,205', '奶嘴奶壶'), ('237', '205', '暖奶消毒', '196,205', '暖奶消毒'), ('238', '205', '吸奶器', '196,205', '吸奶器'), ('239', '205', '水壶/水杯', '196,205', '水壶/水杯'), ('240', '205', '碗盘叉勺', '196,205', '碗盘叉勺'), ('241', '205', '辅食料理机', '196,205', '辅食料理机'), ('242', '205', '牙胶安抚', '196,205', '牙胶安抚'), ('243', '206', '开发智力', '196,206', '开发智力'), ('244', '206', '娃娃玩具', '196,206', '娃娃玩具'), ('245', '206', '乐器相关', '196,206', '乐器相关'), ('246', '206', 'DIY玩具', '196,206', 'DIY玩具'), ('247', '206', '健身玩具', '196,206', '健身玩具'), ('248', '206', '动漫玩具', '196,206', '动漫玩具'), ('249', '206', '毛绒布艺', '196,206', '毛绒布艺'), ('250', '206', '适用年龄', '196,206', '适用年龄'), ('251', '206', '遥控/电动', '196,206', '遥控/电动'), ('252', '207', '孕妈美容', '196,207', '孕妈美容'), ('253', '207', '孕期营养', '196,207', '孕期营养'), ('254', '207', '月子装', '196,207', '月子装'), ('255', '207', '孕妇装', '196,207', '孕妇装'), ('256', '207', '防辐射服', '196,207', '防辐射服'), ('257', '207', '文胸/内裤', '196,207', '文胸/内裤'), ('258', '207', '产后塑身', '196,207', '产后塑身'), ('259', '207', '待产/新生', '196,207', '待产/新生'), ('260', '207', '妈咪包/背婴带', '196,207', '妈咪包/背婴带'), ('261', '208', '钟饰', '197,208', '钟饰'), ('262', '208', '手工/十字绣', '197,208', '手工/十字绣'), ('263', '208', '节庆装饰', '197,208', '节庆装饰'), ('264', '208', '沙发垫套/椅垫', '197,208', '沙发垫套/椅垫'), ('265', '208', '地毯地垫', '197,208', '地毯地垫'), ('266', '208', '桌布/罩件', '197,208', '桌布/罩件'), ('267', '209', '应急灯/手灯', '197,209', '应急灯/手灯'), ('268', '209', '落地灯', '197,209', '落地灯'), ('269', '209', '节能灯', '197,209', '节能灯'), ('270', '209', 'LED灯', '197,209', 'LED灯'), ('271', '209', '吸顶灯', '197,209', '吸顶灯'), ('272', '209', '台灯', '197,209', '台灯'), ('273', '210', '配件', '197,210', '配件'), ('274', '210', '杯具', '197,210', '杯具'), ('275', '210', '餐具', '197,210', '餐具'), ('276', '210', '刀具/菜板', '197,210', '刀具/菜板'), ('277', '210', '锅具', '197,210', '锅具'), ('278', '211', '净化出味', '197,211', '净化出味'), ('279', '211', '洗晒用品', '197,211', '洗晒用品'), ('280', '211', '浴室用品', '197,211', '浴室用品'), ('281', '211', '雨具伞具', '197,211', '雨具伞具'), ('282', '211', '收纳用品', '197,211', '收纳用品'), ('283', '212', '办公', '197,212', '办公'), ('284', '212', '储物', '197,212', '储物'), ('285', '212', '餐厅家具', '197,212', '餐厅家具'), ('286', '212', '客厅家具', '197,212', '客厅家具'), ('287', '212', '卧室家具', '197,212', '卧室家具'), ('288', '213', '明目益智', '198,213', '明目益智'), ('289', '213', '肠胃养护', '198,213', '肠胃养护'), ('290', '213', '肝肾护养', '198,213', '肝肾护养'), ('291', '213', '缓解疲劳', '198,213', '缓解疲劳'), ('292', '213', '调节三高', '198,213', '调节三高'), ('293', '213', '调节免疫', '198,213', '调节免疫'), ('294', '214', '验孕测孕', '198,214', '验孕测孕'), ('295', '214', '安全避孕', '198,214', '安全避孕');
COMMIT;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `role`
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('1', '超级管理员', '超级管理员拥有一切权限！'), ('2', '普通用户', '普通用户，请自由授权！');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `roleId` int(11) NOT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `sex` int(1) NOT NULL DEFAULT '0',
  `age` int(3) NOT NULL DEFAULT '0',
  `address` varchar(128) DEFAULT NULL,
  `star` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '1', '/OnlineShop/resources/upload/1557550588702.png', '1', '1', '上海市浦东新区浦东南路1835号', null), ('13', '猿来入此', '123456', '2', '/OnlineShop/resources/upload/1557550599521.jpg', '1', '1', '猿来入此', null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
