/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : yyx-mall

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 25/07/2022 17:52:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_address
-- ----------------------------
DROP TABLE IF EXISTS `cms_address`;
CREATE TABLE `cms_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货人名称',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户表的用户ID',
  `province` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行政区域表的省ID',
  `city` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行政区域表的市ID',
  `county` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行政区域表的区县ID',
  `address_detail` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细收货地址',
  `area_code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区编码',
  `postal_code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认地址',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_address
-- ----------------------------
INSERT INTO `cms_address` VALUES (1, 'hl243695czyn', 6, '贵州省', '黔西南布依族苗族自治州', '贞丰县', '岩鱼村', NULL, NULL, '17823659874', 0, '2022-07-22 17:12:27', '2022-07-22 17:12:27', 0);
INSERT INTO `cms_address` VALUES (2, 'hl243695czyn', 6, '辽宁省', '锦州市', '北镇市', '101号', NULL, NULL, '178456875659', 0, '2022-07-25 10:30:03', '2022-07-25 10:30:03', 0);
INSERT INTO `cms_address` VALUES (3, 'hl243695czyn', 6, '山西省', '朔州市', '应县', '101号', NULL, NULL, '17845681235', 0, '2022-07-25 10:31:11', '2022-07-25 10:31:11', 0);

-- ----------------------------
-- Table structure for cms_collect
-- ----------------------------
DROP TABLE IF EXISTS `cms_collect`;
CREATE TABLE `cms_collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户表的用户ID',
  `value_id` int(11) NOT NULL DEFAULT 0 COMMENT '如果type=0，则是商品ID；如果type=1，则是专题ID',
  `type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '收藏类型，如果type=0，则是商品ID；如果type=1，则是专题ID',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `goods_id`(`value_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_collect
-- ----------------------------
INSERT INTO `cms_collect` VALUES (1, 6, 13, 0, '2022-07-25 11:12:30', '2022-07-25 11:12:30', 1);

-- ----------------------------
-- Table structure for cms_footprint
-- ----------------------------
DROP TABLE IF EXISTS `cms_footprint`;
CREATE TABLE `cms_footprint`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户表的用户ID',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '浏览商品ID',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户浏览足迹表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_footprint
-- ----------------------------
INSERT INTO `cms_footprint` VALUES (20, 6, 14, '2022-07-25 11:18:46', '2022-07-25 11:18:46', 1);
INSERT INTO `cms_footprint` VALUES (21, 6, 12, '2022-07-25 15:51:16', '2022-07-25 15:51:16', 1);

-- ----------------------------
-- Table structure for cms_search_history
-- ----------------------------
DROP TABLE IF EXISTS `cms_search_history`;
CREATE TABLE `cms_search_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户表的用户ID',
  `keyword` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '搜索关键字',
  `from` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '搜索来源，如pc、wx、app',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '搜索历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_search_history
-- ----------------------------
INSERT INTO `cms_search_history` VALUES (1, 6, '油', 'wx', '2022-07-25 17:08:28', '2022-07-25 17:08:28', 1);

-- ----------------------------
-- Table structure for cms_user
-- ----------------------------
DROP TABLE IF EXISTS `cms_user`;
CREATE TABLE `cms_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `gender` varbinary(3) NOT NULL DEFAULT 0 COMMENT '性别：0 未知， 1男， 2 女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最近一次登录时间',
  `last_login_ip` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最近一次登录IP地址',
  `user_level` tinyint(3) NULL DEFAULT 0 COMMENT '0 普通用户，1 VIP用户，2 高级VIP用户',
  `nickname` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称或网络名称',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像图片',
  `weixin_openid` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信登录openid',
  `session_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信登录会话KEY',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '0 可用, 1 禁用, 2 注销',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_user
-- ----------------------------
INSERT INTO `cms_user` VALUES (6, 'hl243695czyn', '$2a$10$509u4bdHYH0FR/kH0KU1y.4uGMVqpwecAKXYYL/ra4.2WsnV878/q', 0x30, NULL, '2022-07-09 22:04:38', '192.168.0.102', 0, 'hl243695czyn', '', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220620/lihezong.webp', 'odsj15LuTKjuxX5aTqFrv3eI_lko', '', 0, '2022-07-09 22:00:27', '2022-07-09 22:04:38', 1);

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '品牌商名称',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '品牌商简介',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '品牌商页的品牌商图片',
  `sort_order` tinyint(3) NULL DEFAULT 50,
  `floor_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '品牌商的商品低价，仅用于页面展示',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1046003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '品牌商表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES (1046001, 'WMF制造商', '严选找寻德国百年高端厨具WMF的制造商， 选择拥有14年经验的不锈钢生产工厂， 为你甄选事半功倍的优质厨具。', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220624/2018e9ac91ec37d9aaf437a1fd5d7070.png', 50, 9.90, '2022-06-24 13:23:15', '2022-06-24 13:23:15', 1);
INSERT INTO `pms_brand` VALUES (1046002, 'KitchenAid制造商', '严选寻访KitchenAid品牌的制造商， 采用德国LFGB认证食品级专用不锈钢， 欧式简约设计，可靠安心，尽享下厨乐趣。', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220624/e11385bf29d1b3949435b80fcd000948.png', 50, 98.00, '2022-06-24 13:23:50', '2022-06-24 13:51:29', 1);

-- ----------------------------
-- Table structure for pms_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_category`;
CREATE TABLE `pms_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类目名称',
  `keywords` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类目关键字，以JSON数组格式',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类目广告语介绍',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父类目ID',
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类目图标',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类目图片',
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'L1',
  `sort_order` tinyint(3) NULL DEFAULT 50 COMMENT '排序',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_category
-- ----------------------------
INSERT INTO `pms_category` VALUES (1, '饮食', '', '好吃，高颜值美食', 0, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220623/c9280327a3fd2374c000f6bf52dff6eb.png', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220623/fb670ff3511182833e5b035275e4ac09.png', 'L1', 1, '2022-06-23 14:14:15', '2022-06-23 14:14:15', 1);
INSERT INTO `pms_category` VALUES (2, '小食', '', '原香鲜材', 1, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220623/663f568475c994358bf31bcb67d122fe.png', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220623/418f86049f957108a31ad55cec42c349.png', 'L2', 1, '2022-06-23 15:03:53', '2022-06-23 15:08:00', 1);
INSERT INTO `pms_category` VALUES (3, '肉制品', '', '佳肴美馔真滋味', 1, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220624/db3e11b8a6974a253818ae0d6fb2d24e.png', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220624/94480324b376a51af47cf92df70d1ade.png', 'L2', 2, '2022-06-24 10:14:20', '2022-06-24 10:14:35', 1);
INSERT INTO `pms_category` VALUES (4, '餐厨', '', '爱，囿于厨房', 0, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220624/ad8b00d084cb7d0958998edb5fee9c0a.png', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220624/3708dbcb35ad5abf9e001500f73db615.png', 'L1', 2, '2022-06-24 11:08:46', '2022-06-24 11:09:20', 1);
INSERT INTO `pms_category` VALUES (5, '锅具', '', '一口好锅，炖煮生活一日三餐', 4, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220624/4aab4598017b5749e3b63309d25e9f6b.png', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220624/d2db0d1d0622c621a8aa5a7c06b0fc6d.png', 'L2', 1, '2022-06-24 11:10:48', '2022-06-24 11:13:07', 1);
INSERT INTO `pms_category` VALUES (6, '餐具', '', '餐桌上的舞蹈', 4, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220624/f109afbb7e7a00c243c1da29991a5aa3.png', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220624/695ed861a63d8c0fc51a51f42a5a993b.png', 'L2', 2, '2022-06-24 11:12:42', '2022-06-24 11:12:42', 1);
INSERT INTO `pms_category` VALUES (7, '111', '', '11', 0, '', '', 'L1', 50, '2022-06-24 14:16:28', '2022-06-24 14:16:28', 0);
INSERT INTO `pms_category` VALUES (8, '2222', '', '222', 7, '', '', 'L2', 50, '2022-06-24 14:16:38', '2022-06-24 14:16:38', 0);
INSERT INTO `pms_category` VALUES (9, '333', '', '333', 7, '', '', 'L2', 50, '2022-06-24 14:16:57', '2022-06-24 14:16:57', 0);

-- ----------------------------
-- Table structure for pms_goods
-- ----------------------------
DROP TABLE IF EXISTS `pms_goods`;
CREATE TABLE `pms_goods`  (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品编号',
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `category_id` int(11) NULL DEFAULT 0 COMMENT '商品所属类目ID',
  `brand_id` int(11) NULL DEFAULT 0,
  `gallery` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品宣传图片列表，采用JSON数组格式',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商品关键字，采用逗号间隔',
  `brief` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商品简介',
  `is_on_sale` tinyint(1) NULL DEFAULT 1 COMMENT '是否上架',
  `sort_order` smallint(4) NULL DEFAULT 100,
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品页面商品图片',
  `share_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品分享海报',
  `is_new` tinyint(1) NULL DEFAULT 0 COMMENT '是否新品首发，如果设置则可以在新品首发页面展示',
  `is_hot` tinyint(1) NULL DEFAULT 0 COMMENT '是否人气推荐，如果设置则可以在人气推荐页面展示',
  `unit` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '’件‘' COMMENT '商品单位，例如件、盒',
  `counter_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '专柜价格',
  `retail_price` decimal(10, 2) NULL DEFAULT 100000.00 COMMENT '零售价格',
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品详细介绍，是富文本格式',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_sn`(`goods_sn`) USING BTREE,
  INDEX `cat_id`(`category_id`) USING BTREE,
  INDEX `brand_id`(`brand_id`) USING BTREE,
  INDEX `sort_order`(`sort_order`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品基本信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_goods
-- ----------------------------
INSERT INTO `pms_goods` VALUES (00000000009, '100105', '德运 (Devondale) 澳大利亚原装进口 全脂纯牛奶早餐奶1L*10盒整箱装 高钙优质乳蛋白', 2, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/d6dd8d2e58d22dd4.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/dbfd6751d0c1b307.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/fe1a9729e118cf12.jpg.avif\"]', '牛奶', '德运 (Devondale) 澳大利亚原装进口 全脂纯牛奶早餐奶1L*10盒整箱装 高钙优质乳蛋白', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/441c4cc7ddca5c5d.jpg.avif', NULL, 1, 1, '盒', 99.00, 95.00, '<p><img src=\"https://img11.360buyimg.com/n1/jfs/t1/123399/14/17439/295180/614d9815Eb3ddf85e/926912268913378c.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img11.360buyimg.com/n1/jfs/t1/165588/2/22285/189247/614d981cEe22daf34/f7664dbb8aa4f5ae.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2022-07-14 13:18:43', '2022-07-15 11:10:21', 1);
INSERT INTO `pms_goods` VALUES (00000000010, '100110', '俄罗斯Russia国家馆 斯拉贡进口方便食品光头饼 早餐代餐饼干 香蕉味450g', 2, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/dfd19a2ee6583958.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/29942b1654b91a8b.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/ad418c695d3e3876.jpg.avif\"]', '饼干', '俄罗斯Russia国家馆 斯拉贡进口方便食品光头饼 早餐代餐饼干 香蕉味450g', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/d0c8db75871497d3.jpg.avif', NULL, 1, 1, '包', 25.90, 26.00, '<p><img src=\"https://img12.360buyimg.com/n1/jfs/t1/177249/15/23810/505212/6273613eE4bc132ac/a171bd08631cdc6f.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img12.360buyimg.com/n1/jfs/t1/179533/12/23957/306883/625fff43Ee3b5e327/f182fd760c7006eb.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2022-07-14 13:23:58', '2022-07-14 13:23:58', 1);
INSERT INTO `pms_goods` VALUES (00000000011, '100111', '沃隆每日坚果750gA成人款（25g*30袋）坚果炒货年货礼盒 进口原料扁桃仁腰果核桃仁', 2, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/792b914b0d9f469e.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/741857e6eff0efd5.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/e7a076065778919b.jpg.avif\"]', '', '沃隆每日坚果750gA成人款（25g*30袋）坚果炒货年货礼盒 进口原料扁桃仁腰果核桃仁', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/2ca5332417bb94c8.jpg.avif', NULL, 1, 1, '包', 139.00, 123.00, '<p><img src=\"https://img12.360buyimg.com/n1/jfs/t1/8503/15/16424/322654/6278dda7Eb8751ed0/e6130d1b4c162e9c.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img12.360buyimg.com/n1/jfs/t1/16763/34/15886/132389/6278dda7E8bde35f5/7f35fa876f2b077b.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2022-07-14 13:30:01', '2022-07-14 13:30:01', 1);
INSERT INTO `pms_goods` VALUES (00000000012, '100113', '延中 经典原味盐汽水 饮料 600ml*20瓶 整箱', 2, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/30b102489039c39e.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/754b4bc21c7b8cbf.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/4575d3e26804a6c2.jpg.avif\"]', '', '延中 经典原味盐汽水 饮料 600ml*20瓶 整箱', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/00aa42fb88c91f8d.jpg.avif', NULL, 1, 1, '箱', 48.90, 46.00, '<p><img src=\"https://img11.360buyimg.com/n1/jfs/t1/100083/2/30207/105257/62bd6ea4Ed79de5cd/554ed54116868951.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img11.360buyimg.com/n1/jfs/t1/80457/2/20196/454269/62bd6e9cEab5e66f9/30b102489039c39e.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2022-07-14 13:34:12', '2022-07-14 13:34:12', 1);
INSERT INTO `pms_goods` VALUES (00000000013, '100113', ' 蒙牛 特仑苏 纯牛奶250ml*16每100ml含3.6g优质蛋白质 礼盒装', 2, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/880f921501da06c4.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/6348016a04950f5c.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/ad48bcf71922f775.jpg.avif\"]', '', ' 蒙牛 特仑苏 纯牛奶250ml*16每100ml含3.6g优质蛋白质 礼盒装', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/242d4558a95a361e.jpg.avif', NULL, 1, 1, '箱', 67.90, 67.90, '<p><img src=\"https://img14.360buyimg.com/n1/jfs/t1/156765/20/22512/403077/6183a292E66f2cc39/232529fcf416c674.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img14.360buyimg.com/n1/jfs/t1/205560/1/13963/483306/6183a268E39682246/c41d088f71c04ce0.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2022-07-14 13:39:10', '2022-07-14 13:39:10', 1);
INSERT INTO `pms_goods` VALUES (00000000014, '100115', '东北大米 蟹田大米 蟹稻共生 原粮产地盘锦 软糯香2斤真空装包邮', 2, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/26ceda9145fb3c2a.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/325e992cab532435.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/ca410e6be2e97384.jpg.avif\"]', '面', '东北大米 蟹田大米 蟹稻共生 原粮产地盘锦 软糯香2斤真空装包邮', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/0cd6a467c612682b.jpg.avif', NULL, 1, 1, '千克', 12.00, 12.00, '<p><img src=\"https://img13.360buyimg.com/n1/jfs/t1/127414/3/18182/101260/5faaa44fE117e471a/bbe0e5448cc63915.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img13.360buyimg.com/n1/jfs/t1/126083/19/18295/85581/5faaa457Ed04b6a5c/10465d35b1dc2453.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2022-07-14 13:42:59', '2022-07-14 13:42:59', 1);
INSERT INTO `pms_goods` VALUES (00000000015, '100116', ' 鲁花 食用油 5S物理压榨 压榨一级 花生油 6.18L', 3, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/58fea755Ndf878657.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/58fea756N3144a6b1.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/aae13b3e70ad981b.jpg.avif\"]', '', ' 鲁花 食用油 5S物理压榨 压榨一级 花生油 6.18L', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/58fea755Na5ee2e70.jpg.avif', NULL, 1, 1, '瓶', 193.30, 193.30, '<p><img src=\"https://img12.360buyimg.com/n1/jfs/t1/198081/38/20521/380265/61b85200E3b2f2bae/8e21b555f66a1cd1.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img12.360buyimg.com/n1/jfs/t1/134190/9/18622/138122/5fcb2ba8Ecc27f8c0/5f57ceeae15e1fee.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2022-07-14 13:46:28', '2022-07-14 13:46:28', 1);
INSERT INTO `pms_goods` VALUES (00000000016, '100118', '【俄罗斯国家馆】中国产俄罗斯风味牛筋肠牛肉火腿香肠早餐地道美食鑫圣和源 俄式牛筋风味肠2根', 2, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/9ae153e05248dae8.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/u=675803222,1534446410&fm=253&fmt=auto&app=138&f=JPEG.webp\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/u=2464803713,3587022025&fm=253&fmt=auto&app=138&f=PNG.webp\"]', '', '【俄罗斯国家馆】中国产俄罗斯风味牛筋肠牛肉火腿香肠早餐地道美食鑫圣和源 俄式牛筋风味肠2根', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/1f298983be8e98a5.jpg.avif', NULL, 1, 0, '包', 75.90, 75.90, '<p><img src=\"https://img10.360buyimg.com/n1/jfs/t1/136472/2/27274/65534/6265ffecEe15b7f26/999db4952e0b509e.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img10.360buyimg.com/n1/jfs/t1/176619/36/24215/151180/61d25f05Edfc09062/90ec3aaa47298069.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2022-07-14 14:02:36', '2022-07-15 11:10:39', 1);

-- ----------------------------
-- Table structure for pms_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_goods_attribute`;
CREATE TABLE `pms_goods_attribute`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品表的商品ID',
  `attribute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品参数名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品参数值',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品参数表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_goods_attribute
-- ----------------------------
INSERT INTO `pms_goods_attribute` VALUES (52, 10, '商品产地', '中国大陆', '2022-07-14 13:23:58', '2022-07-14 13:23:58', 1);
INSERT INTO `pms_goods_attribute` VALUES (53, 10, '商品毛重', '500g', '2022-07-14 13:23:58', '2022-07-14 13:23:58', 1);
INSERT INTO `pms_goods_attribute` VALUES (54, 10, '包装形式', '袋装', '2022-07-14 13:23:58', '2022-07-14 13:23:58', 1);
INSERT INTO `pms_goods_attribute` VALUES (55, 10, '使用人群', '通用', '2022-07-14 13:23:58', '2022-07-14 13:23:58', 1);
INSERT INTO `pms_goods_attribute` VALUES (56, 11, '商品毛重', '1.075kg', '2022-07-14 13:30:01', '2022-07-14 13:30:01', 1);
INSERT INTO `pms_goods_attribute` VALUES (57, 11, '特性', '果仁', '2022-07-14 13:30:01', '2022-07-14 13:30:01', 1);
INSERT INTO `pms_goods_attribute` VALUES (58, 11, '商品产地', '中国大陆', '2022-07-14 13:30:01', '2022-07-14 13:30:01', 1);
INSERT INTO `pms_goods_attribute` VALUES (59, 12, '包装形式', '塑膜包装', '2022-07-14 13:34:12', '2022-07-14 13:34:12', 1);
INSERT INTO `pms_goods_attribute` VALUES (60, 12, '净含量', '>2L', '2022-07-14 13:34:12', '2022-07-14 13:34:12', 1);
INSERT INTO `pms_goods_attribute` VALUES (61, 12, '商品产地', '中国大陆', '2022-07-14 13:34:12', '2022-07-14 13:34:12', 1);
INSERT INTO `pms_goods_attribute` VALUES (62, 13, '净含量', '>1000mL', '2022-07-14 13:39:10', '2022-07-14 13:39:10', 1);
INSERT INTO `pms_goods_attribute` VALUES (63, 13, '脂肪含量', '全脂', '2022-07-14 13:39:10', '2022-07-14 13:39:10', 1);
INSERT INTO `pms_goods_attribute` VALUES (64, 13, '蛋白质含量', '非高蛋白', '2022-07-14 13:39:10', '2022-07-14 13:39:10', 1);
INSERT INTO `pms_goods_attribute` VALUES (65, 13, '含钙量', '非高钙', '2022-07-14 13:39:10', '2022-07-14 13:39:10', 1);
INSERT INTO `pms_goods_attribute` VALUES (66, 14, '包装形式', '袋装', '2022-07-14 13:42:59', '2022-07-14 13:42:59', 1);
INSERT INTO `pms_goods_attribute` VALUES (67, 14, '商品毛重', '1.0kg', '2022-07-14 13:42:59', '2022-07-14 13:42:59', 1);
INSERT INTO `pms_goods_attribute` VALUES (68, 15, '商品产地', '中国大陆', '2022-07-14 13:46:28', '2022-07-14 13:46:28', 1);
INSERT INTO `pms_goods_attribute` VALUES (69, 15, '包装形式', '桶装', '2022-07-14 13:46:28', '2022-07-14 13:46:28', 1);
INSERT INTO `pms_goods_attribute` VALUES (70, 15, '加工工艺', '压榨', '2022-07-14 13:46:28', '2022-07-14 13:46:28', 1);
INSERT INTO `pms_goods_attribute` VALUES (80, 9, '商品毛重', '11.25kg', '2022-07-15 11:10:21', '2022-07-15 11:10:21', 1);
INSERT INTO `pms_goods_attribute` VALUES (81, 9, '商品产地', '中国大陆', '2022-07-15 11:10:21', '2022-07-15 11:10:21', 1);
INSERT INTO `pms_goods_attribute` VALUES (82, 9, '是否有机', '非有机', '2022-07-15 11:10:21', '2022-07-15 11:10:21', 1);
INSERT INTO `pms_goods_attribute` VALUES (83, 9, '包装形式', '箱装', '2022-07-15 11:10:21', '2022-07-15 11:10:21', 1);
INSERT INTO `pms_goods_attribute` VALUES (84, 16, '商品产地', '中国大陆', '2022-07-15 11:10:39', '2022-07-15 11:10:39', 1);
INSERT INTO `pms_goods_attribute` VALUES (85, 16, '包装形式', '袋装', '2022-07-15 11:10:39', '2022-07-15 11:10:39', 1);
INSERT INTO `pms_goods_attribute` VALUES (86, 16, '类别', '猪肉肠', '2022-07-15 11:10:39', '2022-07-15 11:10:39', 1);

-- ----------------------------
-- Table structure for pms_goods_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_goods_product`;
CREATE TABLE `pms_goods_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品表的商品ID',
  `specifications` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品规格值列表，采用JSON数组格式',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品货品价格',
  `number` int(11) NOT NULL DEFAULT 0 COMMENT '商品货品数量',
  `url` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品货品图片',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品货品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_goods_product
-- ----------------------------
INSERT INTO `pms_goods_product` VALUES (11, 9, '[\"全脂纯牛奶\"]', 95.00, 0, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/fe1a9729e118cf12.jpg.avif', '2022-07-14 13:18:43', '2022-07-15 11:10:21', 1);
INSERT INTO `pms_goods_product` VALUES (12, 9, '[\"健康脱脂\"]', 96.00, 25, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/d6dd8d2e58d22dd4.jpg.avif', '2022-07-14 13:18:43', '2022-07-14 13:18:43', 1);
INSERT INTO `pms_goods_product` VALUES (13, 10, '[\"香蕉味\"]', 26.00, 33, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/ad418c695d3e3876.jpg.avif', '2022-07-14 13:23:58', '2022-07-14 13:23:58', 1);
INSERT INTO `pms_goods_product` VALUES (14, 10, '[\"甜蜜味\"]', 32.00, 22, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/29942b1654b91a8b.jpg.avif', '2022-07-14 13:23:58', '2022-07-14 13:23:58', 1);
INSERT INTO `pms_goods_product` VALUES (15, 11, '[\"成人经典款\"]', 123.00, 30, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/741857e6eff0efd5.jpg.avif', '2022-07-14 13:30:01', '2022-07-14 13:30:01', 1);
INSERT INTO `pms_goods_product` VALUES (16, 11, '[\"学生活力款\"]', 135.00, 24, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/e7a076065778919b.jpg.avif', '2022-07-14 13:30:01', '2022-07-14 13:30:01', 1);
INSERT INTO `pms_goods_product` VALUES (17, 12, '[\"咸柠汽\"]', 52.00, 15, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/754b4bc21c7b8cbf.jpg.avif', '2022-07-14 13:34:12', '2022-07-14 13:34:12', 1);
INSERT INTO `pms_goods_product` VALUES (18, 12, '[\"小桃汽\"]', 46.00, 35, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/00aa42fb88c91f8d.jpg.avif', '2022-07-14 13:34:12', '2022-07-14 13:34:12', 1);
INSERT INTO `pms_goods_product` VALUES (19, 13, '[\"高端品质\"]', 67.90, 353, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/6348016a04950f5c.jpg.avif', '2022-07-14 13:39:10', '2022-07-14 13:39:10', 1);
INSERT INTO `pms_goods_product` VALUES (20, 13, '[\"有机苗条\"]', 68.00, 23, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/ad48bcf71922f775.jpg.avif', '2022-07-14 13:39:10', '2022-07-14 13:39:10', 1);
INSERT INTO `pms_goods_product` VALUES (21, 14, '[\"一级\"]', 18.00, 200, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/325e992cab532435.jpg.avif', '2022-07-14 13:42:59', '2022-07-14 13:42:59', 1);
INSERT INTO `pms_goods_product` VALUES (22, 14, '[\"二级\"]', 12.00, 30, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/ca410e6be2e97384.jpg.avif', '2022-07-14 13:42:59', '2022-07-14 13:42:59', 1);
INSERT INTO `pms_goods_product` VALUES (23, 15, '[\"花生油3.09L\"]', 193.30, 30, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/58fea756N3144a6b1.jpg.avif', '2022-07-14 13:46:28', '2022-07-14 13:46:28', 1);
INSERT INTO `pms_goods_product` VALUES (24, 15, '[\"花生油6.18L\"]', 225.60, 30, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/aae13b3e70ad981b.jpg.avif', '2022-07-14 13:46:28', '2022-07-14 13:46:28', 1);
INSERT INTO `pms_goods_product` VALUES (25, 16, '[\"俄式牛筋风味肠1根\",\"大型\"]', 75.90, 0, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/1f298983be8e98a5.jpg.avif', '2022-07-14 14:02:37', '2022-07-15 11:10:39', 1);
INSERT INTO `pms_goods_product` VALUES (26, 16, '[\"早餐火腿420克1根\",\"大型\"]', 85.00, 35, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/bd5dc008caf60212.jpg.avif', '2022-07-14 14:02:37', '2022-07-14 14:02:37', 1);

-- ----------------------------
-- Table structure for pms_goods_specification
-- ----------------------------
DROP TABLE IF EXISTS `pms_goods_specification`;
CREATE TABLE `pms_goods_specification`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品表的商品ID',
  `specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品规格名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品规格值',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品规格图片',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品规格表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_goods_specification
-- ----------------------------
INSERT INTO `pms_goods_specification` VALUES (12, 9, '口味', '全脂纯牛奶', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/441c4cc7ddca5c5d.jpg.avif', '2022-07-14 13:18:43', '2022-07-14 13:18:43', 1);
INSERT INTO `pms_goods_specification` VALUES (13, 9, '口味', '健康脱脂', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/d6dd8d2e58d22dd4.jpg.avif', '2022-07-14 13:18:43', '2022-07-14 13:18:43', 1);
INSERT INTO `pms_goods_specification` VALUES (14, 10, '口味', '香蕉味', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/29942b1654b91a8b.jpg.avif', '2022-07-14 13:23:58', '2022-07-14 13:23:58', 1);
INSERT INTO `pms_goods_specification` VALUES (15, 10, '口味', '甜蜜味', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/ad418c695d3e3876.jpg.avif', '2022-07-14 13:23:58', '2022-07-14 13:23:58', 1);
INSERT INTO `pms_goods_specification` VALUES (16, 11, '口味', '成人经典款', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/2ca5332417bb94c8.jpg.avif', '2022-07-14 13:30:01', '2022-07-14 13:30:01', 1);
INSERT INTO `pms_goods_specification` VALUES (17, 11, '口味', '学生活力款', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/792b914b0d9f469e.jpg.avif', '2022-07-14 13:30:01', '2022-07-14 13:30:01', 1);
INSERT INTO `pms_goods_specification` VALUES (18, 12, '类别', '咸柠汽', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/4575d3e26804a6c2.jpg.avif', '2022-07-14 13:34:12', '2022-07-14 13:34:12', 1);
INSERT INTO `pms_goods_specification` VALUES (19, 12, '类别', '小桃汽', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/30b102489039c39e.jpg.avif', '2022-07-14 13:34:12', '2022-07-14 13:34:12', 1);
INSERT INTO `pms_goods_specification` VALUES (20, 13, '类别', '高端品质', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/242d4558a95a361e.jpg.avif', '2022-07-14 13:39:10', '2022-07-14 13:39:10', 1);
INSERT INTO `pms_goods_specification` VALUES (21, 13, '类别', '有机苗条', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/880f921501da06c4.jpg.avif', '2022-07-14 13:39:10', '2022-07-14 13:39:10', 1);
INSERT INTO `pms_goods_specification` VALUES (22, 14, '等级', '一级', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/0cd6a467c612682b.jpg.avif', '2022-07-14 13:42:59', '2022-07-14 13:42:59', 1);
INSERT INTO `pms_goods_specification` VALUES (23, 14, '等级', '二级', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/26ceda9145fb3c2a.jpg.avif', '2022-07-14 13:42:59', '2022-07-14 13:42:59', 1);
INSERT INTO `pms_goods_specification` VALUES (24, 15, '类别', '花生油3.09L', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/58fea755Na5ee2e70.jpg.avif', '2022-07-14 13:46:28', '2022-07-14 13:46:28', 1);
INSERT INTO `pms_goods_specification` VALUES (25, 15, '类别', '花生油6.18L', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/58fea755Ndf878657.jpg.avif', '2022-07-14 13:46:28', '2022-07-14 13:46:28', 1);
INSERT INTO `pms_goods_specification` VALUES (26, 16, '净含量', '俄式牛筋风味肠1根', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/1f298983be8e98a5.jpg.avif', '2022-07-14 14:02:37', '2022-07-14 14:02:37', 1);
INSERT INTO `pms_goods_specification` VALUES (27, 16, '净含量', '早餐火腿420克1根', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/9ae153e05248dae8.jpg.avif', '2022-07-14 14:02:37', '2022-07-14 14:02:37', 1);
INSERT INTO `pms_goods_specification` VALUES (28, 16, '尺寸', '大型', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/4747572db3481487.jpg.avif', '2022-07-14 14:02:37', '2022-07-14 14:02:37', 1);

-- ----------------------------
-- Table structure for pms_issue
-- ----------------------------
DROP TABLE IF EXISTS `pms_issue`;
CREATE TABLE `pms_issue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题标题',
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题答案',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '常见问题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_issue
-- ----------------------------
INSERT INTO `pms_issue` VALUES (5, '购买运费如何收取？', '单笔订单金额(不含运费)满50元免邮费，不满50元，每单收取10元运费。(港澳台地区除外)', '2022-07-12 09:32:43', '2022-07-12 09:32:43', 1);
INSERT INTO `pms_issue` VALUES (6, '使用什么快递发货？', '严选默认使用顺丰快递发货(个别商品使用其他快递)，配送范围覆盖全国大部分地区', '2022-07-12 09:33:31', '2022-07-12 09:33:31', 1);
INSERT INTO `pms_issue` VALUES (7, '如何申请退货？', '1、自收到商品之日起5日内，顾客可申请无忧退货，退款将原路返还，不同的银行处理时间不同', '2022-07-12 09:35:24', '2022-07-12 09:36:18', 1);
INSERT INTO `pms_issue` VALUES (8, '如何开具发票？', '1、如需开具发票，请在下单是选择【我要开发票】并填写相关信息', '2022-07-12 09:36:00', '2022-07-12 09:36:00', 1);

-- ----------------------------
-- Table structure for pms_keyword
-- ----------------------------
DROP TABLE IF EXISTS `pms_keyword`;
CREATE TABLE `pms_keyword`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字的跳转链接',
  `is_hot` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是热门关键字',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是默认关键字',
  `sort_order` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关键字表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_keyword
-- ----------------------------
INSERT INTO `pms_keyword` VALUES (8, '牛奶', '', 0, 0, 100, '2022-07-25 14:53:28', '2022-07-25 14:53:28', 1);
INSERT INTO `pms_keyword` VALUES (9, '特产', '', 0, 0, 100, '2022-07-25 14:53:39', '2022-07-25 14:53:39', 1);
INSERT INTO `pms_keyword` VALUES (10, '饮料', '', 0, 0, 100, '2022-07-25 14:53:48', '2022-07-25 14:53:48', 1);
INSERT INTO `pms_keyword` VALUES (11, '食用油', '', 0, 0, 100, '2022-07-25 14:53:55', '2022-07-25 14:55:06', 1);

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员名称',
  `password` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员密码',
  `last_login_ip` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最近一次登录IP地址',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最近一次登录时间',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'' COMMENT '头像图片',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES (3, 'admin', '123456', '0:0:0:0:0:0:0:1', '2022-07-25 14:00:11', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220620/lihezong.webp', '2022-06-20 16:11:43', '2022-06-23 10:01:03', 1);
INSERT INTO `ums_admin` VALUES (4, 'test', '123456', '', NULL, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220623/hw-logo.png', '2022-06-23 10:15:19', '2022-06-23 10:15:19', 1);

-- ----------------------------
-- Table structure for ums_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role`;
CREATE TABLE `ums_admin_role`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `admin_id` int(20) NULL DEFAULT NULL COMMENT '管理员id',
  `role_id` int(20) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和角色关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_admin_role
-- ----------------------------
INSERT INTO `ums_admin_role` VALUES (3, 3, 10);
INSERT INTO `ums_admin_role` VALUES (4, 4, 11);

-- ----------------------------
-- Table structure for ums_menu
-- ----------------------------
DROP TABLE IF EXISTS `ums_menu`;
CREATE TABLE `ums_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单地址',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组件名称',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组件地址',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `is_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '超链接地址',
  `is_hide` tinyint(1) NULL DEFAULT NULL COMMENT '是否隐藏',
  `is_keep_alive` tinyint(1) NULL DEFAULT NULL COMMENT '是否缓存组件',
  `is_affix` tinyint(1) NULL DEFAULT NULL COMMENT '是否固定',
  `is_iframe` tinyint(1) NULL DEFAULT NULL COMMENT '是否内嵌窗口',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `sort` int(10) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_menu
-- ----------------------------
INSERT INTO `ums_menu` VALUES (1, NULL, '/system', 'system', 'layout', '系统管理', '', 0, 1, 0, 0, 'iconfont icon-bolangneng', 1);
INSERT INTO `ums_menu` VALUES (2, 1, '/system/meun', 'systemMenu', '/system/menu', '菜单管理', '', 0, 1, 0, 0, 'iconfont icon--chaifenhang', 1);
INSERT INTO `ums_menu` VALUES (4, 1, '/system/user', 'systemUser', '/system/user', '用户管理', '', 0, 1, 0, 0, 'ele-Avatar', 2);
INSERT INTO `ums_menu` VALUES (5, 1, '/system/role', 'systemRole', '/system/role', '角色管理', '', 0, 1, 0, 0, 'ele-Briefcase', 3);
INSERT INTO `ums_menu` VALUES (6, NULL, '/product', 'product', 'layout', '商品管理', '', 0, 1, 0, 0, 'iconfont icon-ico_shuju', 2);
INSERT INTO `ums_menu` VALUES (7, 6, '/product/category', 'productCategory', '/product/category', '商品类目', '', 0, 1, 0, 0, 'iconfont icon-bolangneng', 1);
INSERT INTO `ums_menu` VALUES (9, 6, '/product/brand', 'productBrand', '/product/brand', '品牌制造商', '', 0, 1, 0, 0, 'iconfont icon-diannao-shuju', 2);
INSERT INTO `ums_menu` VALUES (10, 6, '/product/goods', 'productGoods', '/product/goods', '商品列表', '', 0, 1, 0, 0, 'iconfont icon-zhongduancanshu', 3);
INSERT INTO `ums_menu` VALUES (11, 6, '/product/goodsInfo/:id/:tagsViewName', 'productGoodsInfo', '/product/goodsInfo', '商品信息', '', 1, 1, 0, 0, 'iconfont icon-juxingkaobei', 4);
INSERT INTO `ums_menu` VALUES (13, NULL, '/cms', 'cms', 'layout', '用户管理', '', 0, 1, 0, 0, 'iconfont icon-diqiu', 1);
INSERT INTO `ums_menu` VALUES (14, 13, '/cms/member', 'cmsMember', '/cms/member', '会员管理', '', 0, 1, 0, 0, 'iconfont icon-zidingyibuju', 1);
INSERT INTO `ums_menu` VALUES (15, 6, '/product/issue', 'productIssue', '/product/issue', '常见问题', '', 0, 1, 0, 0, 'fa fa-question-circle-o', 2);
INSERT INTO `ums_menu` VALUES (16, 13, '/cms/collection', 'cmsCollection', '/cms/collection', '会员收藏', '', 0, 1, 0, 0, 'iconfont icon-skin', 2);
INSERT INTO `ums_menu` VALUES (17, 13, '/cms/footprint', 'cmsFootprint', '/cms/footprint', '会员足迹', '', 0, 1, 0, 0, 'iconfont icon-xianshimima', 3);
INSERT INTO `ums_menu` VALUES (18, 13, '/cms/address', 'cmsAddress', '/cms/address', '收货地址', '', 0, 1, 0, 0, 'iconfont icon-shuxing', 4);
INSERT INTO `ums_menu` VALUES (19, 6, '/product/keyword', 'productKeyword', '/product/keyword', '关键字管理', '', 0, 1, 0, 0, 'iconfont icon-tongzhi1', 6);

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色key',
  `desc` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name_UNIQUE`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES (10, '超级管理员', 'admin', '拥有所有权限', 1, '2022-06-20 11:13:09', '2022-06-21 11:49:57', 1);
INSERT INTO `ums_role` VALUES (11, '普通管理员', 'common', '拥有部分权限', 1, '2022-06-20 11:27:15', '2022-06-21 11:50:05', 1);

-- ----------------------------
-- Table structure for ums_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_menu`;
CREATE TABLE `ums_role_menu`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(20) NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` int(20) NULL DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_role_menu
-- ----------------------------
INSERT INTO `ums_role_menu` VALUES (5, 11, 6);
INSERT INTO `ums_role_menu` VALUES (6, 11, 7);
INSERT INTO `ums_role_menu` VALUES (98, 10, 1);
INSERT INTO `ums_role_menu` VALUES (99, 10, 2);
INSERT INTO `ums_role_menu` VALUES (100, 10, 4);
INSERT INTO `ums_role_menu` VALUES (101, 10, 5);
INSERT INTO `ums_role_menu` VALUES (102, 10, 6);
INSERT INTO `ums_role_menu` VALUES (103, 10, 7);
INSERT INTO `ums_role_menu` VALUES (104, 10, 9);
INSERT INTO `ums_role_menu` VALUES (105, 10, 10);
INSERT INTO `ums_role_menu` VALUES (106, 10, 11);
INSERT INTO `ums_role_menu` VALUES (107, 10, 15);
INSERT INTO `ums_role_menu` VALUES (108, 10, 19);
INSERT INTO `ums_role_menu` VALUES (109, 10, 13);
INSERT INTO `ums_role_menu` VALUES (110, 10, 14);
INSERT INTO `ums_role_menu` VALUES (111, 10, 16);
INSERT INTO `ums_role_menu` VALUES (112, 10, 17);
INSERT INTO `ums_role_menu` VALUES (113, 10, 18);

SET FOREIGN_KEY_CHECKS = 1;
