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

 Date: 02/08/2022 18:02:19
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收货地址表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_collect
-- ----------------------------
INSERT INTO `cms_collect` VALUES (1, 6, 13, 0, '2022-07-25 11:12:30', '2022-07-25 11:12:30', 1);

-- ----------------------------
-- Table structure for cms_feedback
-- ----------------------------
DROP TABLE IF EXISTS `cms_feedback`;
CREATE TABLE `cms_feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户表的用户ID',
  `username` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名称',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `feed_type` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '反馈类型',
  `content` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '反馈内容',
  `status` int(3) NOT NULL DEFAULT 0 COMMENT '状态',
  `has_picture` tinyint(1) NULL DEFAULT 0 COMMENT '是否含有图片',
  `pic_urls` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址列表，采用JSON数组格式',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_value`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '意见反馈表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_feedback
-- ----------------------------
INSERT INTO `cms_feedback` VALUES (6, 6, 'hl243695czyn', '17885395648', '商品相关', '多加一点商品嘛', 0, 1, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220728/G0XZq30L6iZed7c9c5b431bf88de3342e892a853db12.png\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220728/O32UubUa740L1b51437e620bed05ef6ec58df8588e1a.png\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220728/mXBIQslOOkzEb005edd41a4b711ae8ed9953bdcec9e4.png\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220728/bLp3SB5jxbTT0e4f9c63b29245e3c27021e8e10a2d8e.png\"]', '2022-07-28 14:23:53', '2022-07-28 14:23:53', 1);
INSERT INTO `cms_feedback` VALUES (8, 6, 'hl243695czyn', '17845612345', '优化建议', '图片多选测试', 0, 1, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220728/tmp_9901a7a262dea2c557ac21bc908775fd28706d902548b9a3.jpg\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220728/tmp_bb513252eb218ecad2a05b1435481f71b3b8342b5d5416f7.jpg\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220728/tmp_4100b362979a2b84cdc0f593a38c783d4548db958e217e4a.jpg\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220728/tmp_6eab10f61214f86b4ba791f0ce9eca69aaabf7d43c3902d5.jpg\"]', '2022-07-28 16:01:14', '2022-07-28 16:01:14', 1);
INSERT INTO `cms_feedback` VALUES (9, 6, 'hl243695czyn', '17894653127', '优化建议', '拍照选取图片', 0, 1, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220728/tmp_932350f649ff4c719c1fe7fef8c5cd65f5017a577a858338.jpg\"]', '2022-07-28 16:02:33', '2022-07-28 16:02:33', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户浏览足迹表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_footprint
-- ----------------------------
INSERT INTO `cms_footprint` VALUES (25, 6, 9, '2022-07-28 17:48:33', '2022-08-02 17:19:16', 1);
INSERT INTO `cms_footprint` VALUES (26, 6, 16, '2022-08-01 16:58:49', '2022-08-02 17:12:41', 1);
INSERT INTO `cms_footprint` VALUES (27, 6, 11, '2022-08-02 11:36:28', '2022-08-02 17:46:47', 1);
INSERT INTO `cms_footprint` VALUES (30, 6, 14, '2022-08-02 16:56:55', '2022-08-02 17:07:29', 1);
INSERT INTO `cms_footprint` VALUES (31, 6, 13, '2022-08-02 17:19:39', '2022-08-02 17:19:39', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '搜索历史表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_search_history
-- ----------------------------
INSERT INTO `cms_search_history` VALUES (1, 6, '油', 'wx', '2022-07-25 17:08:28', '2022-07-25 17:08:28', 0);
INSERT INTO `cms_search_history` VALUES (2, 6, '牛奶', 'wx', '2022-07-26 09:16:18', '2022-07-26 09:16:18', 0);
INSERT INTO `cms_search_history` VALUES (3, 6, '牛奶', 'wx', '2022-07-26 09:43:20', '2022-07-26 09:43:20', 0);
INSERT INTO `cms_search_history` VALUES (4, 6, '牛奶', 'wx', '2022-07-26 09:51:58', '2022-07-26 09:51:58', 0);
INSERT INTO `cms_search_history` VALUES (5, 6, '牛奶', 'wx', '2022-07-26 09:52:05', '2022-07-26 09:52:05', 0);
INSERT INTO `cms_search_history` VALUES (6, 6, '牛奶', 'wx', '2022-07-26 09:52:36', '2022-07-26 09:52:36', 0);
INSERT INTO `cms_search_history` VALUES (7, 6, '牛奶', 'wx', '2022-07-26 09:56:31', '2022-07-26 09:56:31', 0);
INSERT INTO `cms_search_history` VALUES (8, 6, '牛奶', 'wx', '2022-07-26 09:57:43', '2022-07-26 09:57:43', 0);
INSERT INTO `cms_search_history` VALUES (9, 6, '食用油', 'wx', '2022-07-26 09:57:57', '2022-07-26 09:57:57', 0);
INSERT INTO `cms_search_history` VALUES (10, 6, '特产', 'wx', '2022-07-26 10:32:24', '2022-07-26 10:32:24', 1);
INSERT INTO `cms_search_history` VALUES (11, 6, '饮料', 'wx', '2022-07-26 10:32:25', '2022-07-26 10:32:25', 1);
INSERT INTO `cms_search_history` VALUES (12, 6, '牛奶', 'wx', '2022-08-02 17:00:07', '2022-08-02 17:00:07', 1);

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
-- Table structure for pms_cart
-- ----------------------------
DROP TABLE IF EXISTS `pms_cart`;
CREATE TABLE `pms_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户表的用户ID',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品表的商品ID',
  `goods_sn` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  `goods_name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品货品表的货品ID',
  `price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '商品货品的价格',
  `number` smallint(5) NULL DEFAULT 0 COMMENT '商品货品的数量',
  `specifications` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品规格值列表，采用JSON数组格式',
  `checked` tinyint(1) NULL DEFAULT 1 COMMENT '购物车中商品是否选择状态',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片或者商品货品图片',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 1 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_cart
-- ----------------------------
INSERT INTO `pms_cart` VALUES (9, 6, 12, '100113', '延中 经典原味盐汽水 饮料 600ml*20瓶 整箱', 18, 46.00, 1, '[\"小桃汽\"]', 1, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/00aa42fb88c91f8d.jpg.avif', '2022-08-02 16:56:42', '2022-08-02 16:56:42', 1);
INSERT INTO `pms_cart` VALUES (10, 6, 11, '100111', '沃隆每日坚果750gA成人款（25g*30袋）坚果炒货年货礼盒 进口原料扁桃仁腰果核桃仁', 16, 135.00, 2, '[\"学生活力款\"]', 1, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/e7a076065778919b.jpg.avif', '2022-08-02 16:56:51', '2022-08-02 16:56:51', 1);

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
INSERT INTO `pms_goods` VALUES (00000000016, '100118', '【俄罗斯国家馆】中国产俄罗斯风味牛筋肠牛肉火腿香肠早餐地道美食鑫圣和源 俄式牛筋风味肠2根', 2, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/9ae153e05248dae8.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/u=675803222,1534446410&fm=253&fmt=auto&app=138&f=JPEG.webp\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/u=2464803713,3587022025&fm=253&fmt=auto&app=138&f=PNG.webp\"]', '', '【俄罗斯国家馆】中国产俄罗斯风味牛筋肠牛肉火腿香肠早餐地道美食鑫圣和源 俄式牛筋风味肠2根', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/1f298983be8e98a5.jpg.avif', NULL, 1, 0, '包', 75.90, 75.90, '<p><img src=\"https://img10.360buyimg.com/n1/jfs/t1/136472/2/27274/65534/6265ffecEe15b7f26/999db4952e0b509e.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img10.360buyimg.com/n1/jfs/t1/176619/36/24215/151180/61d25f05Edfc09062/90ec3aaa47298069.jpg.avif\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2022-07-14 14:02:36', '2022-08-01 17:52:23', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品参数表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `pms_goods_attribute` VALUES (87, 16, '商品产地', '中国大陆', '2022-08-01 17:52:23', '2022-08-01 17:52:23', 1);
INSERT INTO `pms_goods_attribute` VALUES (88, 16, '包装形式', '袋装', '2022-08-01 17:52:23', '2022-08-01 17:52:23', 1);
INSERT INTO `pms_goods_attribute` VALUES (89, 16, '类别', '猪肉肠', '2022-08-01 17:52:23', '2022-08-01 17:52:23', 1);

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
INSERT INTO `pms_goods_product` VALUES (25, 16, '[\"俄式牛筋风味肠1根\",\"大型\"]', 75.90, 10, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220714/1f298983be8e98a5.jpg.avif', '2022-07-14 14:02:37', '2022-08-01 17:52:23', 1);
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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关键字表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_keyword
-- ----------------------------
INSERT INTO `pms_keyword` VALUES (8, '牛奶', '', 1, 1, 100, '2022-07-25 14:53:28', '2022-07-25 14:53:28', 1);
INSERT INTO `pms_keyword` VALUES (9, '特产', '', 1, 0, 100, '2022-07-25 14:53:39', '2022-07-25 14:53:39', 1);
INSERT INTO `pms_keyword` VALUES (10, '饮料', '', 1, 0, 100, '2022-07-25 14:53:48', '2022-07-25 14:53:48', 1);
INSERT INTO `pms_keyword` VALUES (11, '食用油', '', 1, 0, 100, '2022-07-25 14:53:55', '2022-07-25 14:55:06', 1);

-- ----------------------------
-- Table structure for pms_region
-- ----------------------------
DROP TABLE IF EXISTS `pms_region`;
CREATE TABLE `pms_region`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '区划信息id',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级挂接id',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态 0 正常 -2 删除 -1 停用',
  `level` tinyint(1) NULL DEFAULT NULL COMMENT '级次id 0:省/自治区/直辖市 1:市级 2:县级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3220 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of pms_region
-- ----------------------------
INSERT INTO `pms_region` VALUES (1, 0, '110000', '北京', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (2, 3216, '110101', '东城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3, 3216, '110102', '西城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (4, 3216, '110105', '朝阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (5, 3216, '110106', '丰台区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (6, 3216, '110107', '石景山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (7, 3216, '110108', '海淀区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (8, 3216, '110109', '门头沟区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (9, 3216, '110111', '房山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (10, 3216, '110112', '通州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (11, 3216, '110113', '顺义区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (12, 3216, '110114', '昌平区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (13, 3216, '110115', '大兴区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (14, 3216, '110116', '怀柔区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (15, 3216, '110117', '平谷区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (16, 3216, '110118', '密云区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (17, 3216, '110119', '延庆区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (18, 0, '120000', '天津', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (19, 3217, '120101', '和平区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (20, 3217, '120102', '河东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (21, 3217, '120103', '河西区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (22, 3217, '120104', '南开区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (23, 3217, '120105', '河北区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (24, 3217, '120106', '红桥区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (25, 3217, '120110', '东丽区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (26, 3217, '120111', '西青区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (27, 3217, '120112', '津南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (28, 3217, '120113', '北辰区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (29, 3217, '120114', '武清区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (30, 3217, '120115', '宝坻区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (31, 3217, '120116', '滨海新区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (32, 3217, '120117', '宁河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (33, 3217, '120118', '静海区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (34, 3217, '120119', '蓟州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (35, 0, '130000', '河北省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (36, 35, '130100', '石家庄市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (37, 36, '130102', '长安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (38, 36, '130104', '桥西区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (39, 36, '130105', '新华区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (40, 36, '130107', '井陉矿区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (41, 36, '130108', '裕华区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (42, 36, '130109', '藁城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (43, 36, '130110', '鹿泉区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (44, 36, '130111', '栾城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (45, 36, '130121', '井陉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (46, 36, '130123', '正定县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (47, 36, '130125', '行唐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (48, 36, '130126', '灵寿县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (49, 36, '130127', '高邑县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (50, 36, '130128', '深泽县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (51, 36, '130129', '赞皇县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (52, 36, '130130', '无极县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (53, 36, '130131', '平山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (54, 36, '130132', '元氏县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (55, 36, '130133', '赵县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (56, 36, '130181', '辛集市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (57, 36, '130183', '晋州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (58, 36, '130184', '新乐市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (59, 35, '130200', '唐山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (60, 59, '130202', '路南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (61, 59, '130203', '路北区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (62, 59, '130204', '古冶区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (63, 59, '130205', '开平区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (64, 59, '130207', '丰南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (65, 59, '130208', '丰润区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (66, 59, '130209', '曹妃甸区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (67, 59, '130224', '滦南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (68, 59, '130225', '乐亭县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (69, 59, '130227', '迁西县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (70, 59, '130229', '玉田县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (71, 59, '130281', '遵化市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (72, 59, '130283', '迁安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (73, 59, '130284', '滦州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (74, 35, '130300', '秦皇岛市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (75, 74, '130302', '海港区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (76, 74, '130303', '山海关区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (77, 74, '130304', '北戴河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (78, 74, '130306', '抚宁区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (79, 74, '130321', '青龙满族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (80, 74, '130322', '昌黎县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (81, 74, '130324', '卢龙县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (82, 35, '130400', '邯郸市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (83, 82, '130402', '邯山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (84, 82, '130403', '丛台区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (85, 82, '130404', '复兴区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (86, 82, '130406', '峰峰矿区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (87, 82, '130407', '肥乡区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (88, 82, '130408', '永年区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (89, 82, '130423', '临漳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (90, 82, '130424', '成安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (91, 82, '130425', '大名县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (92, 82, '130426', '涉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (93, 82, '130427', '磁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (94, 82, '130430', '邱县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (95, 82, '130431', '鸡泽县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (96, 82, '130432', '广平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (97, 82, '130433', '馆陶县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (98, 82, '130434', '魏县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (99, 82, '130435', '曲周县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (100, 82, '130481', '武安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (101, 35, '130500', '邢台市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (102, 101, '130502', '桥东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (103, 101, '130503', '桥西区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (104, 101, '130521', '邢台县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (105, 101, '130522', '临城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (106, 101, '130523', '内丘县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (107, 101, '130524', '柏乡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (108, 101, '130525', '隆尧县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (109, 101, '130526', '任县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (110, 101, '130527', '南和县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (111, 101, '130528', '宁晋县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (112, 101, '130529', '巨鹿县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (113, 101, '130530', '新河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (114, 101, '130531', '广宗县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (115, 101, '130532', '平乡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (116, 101, '130533', '威县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (117, 101, '130534', '清河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (118, 101, '130535', '临西县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (119, 101, '130581', '南宫市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (120, 101, '130582', '沙河市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (121, 35, '130600', '保定市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (122, 121, '130602', '竞秀区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (123, 121, '130606', '莲池区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (124, 121, '130607', '满城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (125, 121, '130608', '清苑区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (126, 121, '130609', '徐水区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (127, 121, '130623', '涞水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (128, 121, '130624', '阜平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (129, 121, '130626', '定兴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (130, 121, '130627', '唐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (131, 121, '130628', '高阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (132, 121, '130629', '容城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (133, 121, '130630', '涞源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (134, 121, '130631', '望都县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (135, 121, '130632', '安新县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (136, 121, '130633', '易县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (137, 121, '130634', '曲阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (138, 121, '130635', '蠡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (139, 121, '130636', '顺平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (140, 121, '130637', '博野县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (141, 121, '130638', '雄县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (142, 121, '130681', '涿州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (143, 121, '130682', '定州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (144, 121, '130683', '安国市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (145, 121, '130684', '高碑店市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (146, 35, '130700', '张家口市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (147, 146, '130702', '桥东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (148, 146, '130703', '桥西区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (149, 146, '130705', '宣化区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (150, 146, '130706', '下花园区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (151, 146, '130708', '万全区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (152, 146, '130709', '崇礼区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (153, 146, '130722', '张北县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (154, 146, '130723', '康保县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (155, 146, '130724', '沽源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (156, 146, '130725', '尚义县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (157, 146, '130726', '蔚县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (158, 146, '130727', '阳原县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (159, 146, '130728', '怀安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (160, 146, '130730', '怀来县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (161, 146, '130731', '涿鹿县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (162, 146, '130732', '赤城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (163, 35, '130800', '承德市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (164, 163, '130802', '双桥区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (165, 163, '130803', '双滦区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (166, 163, '130804', '鹰手营子矿区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (167, 163, '130821', '承德县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (168, 163, '130822', '兴隆县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (169, 163, '130824', '滦平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (170, 163, '130825', '隆化县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (171, 163, '130826', '丰宁满族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (172, 163, '130827', '宽城满族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (173, 163, '130828', '围场满族蒙古族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (174, 163, '130881', '平泉市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (175, 35, '130900', '沧州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (176, 175, '130902', '新华区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (177, 175, '130903', '运河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (178, 175, '130921', '沧县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (179, 175, '130922', '青县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (180, 175, '130923', '东光县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (181, 175, '130924', '海兴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (182, 175, '130925', '盐山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (183, 175, '130926', '肃宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (184, 175, '130927', '南皮县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (185, 175, '130928', '吴桥县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (186, 175, '130929', '献县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (187, 175, '130930', '孟村回族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (188, 175, '130981', '泊头市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (189, 175, '130982', '任丘市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (190, 175, '130983', '黄骅市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (191, 175, '130984', '河间市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (192, 35, '131000', '廊坊市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (193, 192, '131002', '安次区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (194, 192, '131003', '广阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (195, 192, '131022', '固安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (196, 192, '131023', '永清县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (197, 192, '131024', '香河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (198, 192, '131025', '大城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (199, 192, '131026', '文安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (200, 192, '131028', '大厂回族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (201, 192, '131081', '霸州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (202, 192, '131082', '三河市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (203, 35, '131100', '衡水市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (204, 203, '131102', '桃城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (205, 203, '131103', '冀州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (206, 203, '131121', '枣强县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (207, 203, '131122', '武邑县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (208, 203, '131123', '武强县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (209, 203, '131124', '饶阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (210, 203, '131125', '安平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (211, 203, '131126', '故城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (212, 203, '131127', '景县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (213, 203, '131128', '阜城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (214, 203, '131182', '深州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (215, 0, '140000', '山西省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (216, 215, '140100', '太原市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (217, 216, '140105', '小店区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (218, 216, '140106', '迎泽区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (219, 216, '140107', '杏花岭区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (220, 216, '140108', '尖草坪区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (221, 216, '140109', '万柏林区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (222, 216, '140110', '晋源区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (223, 216, '140121', '清徐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (224, 216, '140122', '阳曲县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (225, 216, '140123', '娄烦县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (226, 216, '140181', '古交市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (227, 215, '140200', '大同市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (228, 227, '140212', '新荣区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (229, 227, '140213', '平城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (230, 227, '140214', '云冈区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (231, 227, '140215', '云州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (232, 227, '140221', '阳高县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (233, 227, '140222', '天镇县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (234, 227, '140223', '广灵县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (235, 227, '140224', '灵丘县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (236, 227, '140225', '浑源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (237, 227, '140226', '左云县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (238, 215, '140300', '阳泉市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (239, 238, '140302', '城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (240, 238, '140303', '矿区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (241, 238, '140311', '郊区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (242, 238, '140321', '平定县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (243, 238, '140322', '盂县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (244, 215, '140400', '长治市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (245, 244, '140403', '潞州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (246, 244, '140404', '上党区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (247, 244, '140405', '屯留区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (248, 244, '140406', '潞城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (249, 244, '140423', '襄垣县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (250, 244, '140425', '平顺县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (251, 244, '140426', '黎城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (252, 244, '140427', '壶关县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (253, 244, '140428', '长子县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (254, 244, '140429', '武乡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (255, 244, '140430', '沁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (256, 244, '140431', '沁源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (257, 215, '140500', '晋城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (258, 257, '140502', '城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (259, 257, '140521', '沁水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (260, 257, '140522', '阳城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (261, 257, '140524', '陵川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (262, 257, '140525', '泽州县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (263, 257, '140581', '高平市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (264, 215, '140600', '朔州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (265, 264, '140602', '朔城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (266, 264, '140603', '平鲁区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (267, 264, '140621', '山阴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (268, 264, '140622', '应县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (269, 264, '140623', '右玉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (270, 264, '140681', '怀仁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (271, 215, '140700', '晋中市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (272, 271, '140702', '榆次区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (273, 271, '140703', '太谷区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (274, 271, '140721', '榆社县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (275, 271, '140722', '左权县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (276, 271, '140723', '和顺县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (277, 271, '140724', '昔阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (278, 271, '140725', '寿阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (279, 271, '140727', '祁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (280, 271, '140728', '平遥县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (281, 271, '140729', '灵石县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (282, 271, '140781', '介休市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (283, 215, '140800', '运城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (284, 283, '140802', '盐湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (285, 283, '140821', '临猗县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (286, 283, '140822', '万荣县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (287, 283, '140823', '闻喜县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (288, 283, '140824', '稷山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (289, 283, '140825', '新绛县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (290, 283, '140826', '绛县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (291, 283, '140827', '垣曲县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (292, 283, '140828', '夏县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (293, 283, '140829', '平陆县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (294, 283, '140830', '芮城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (295, 283, '140881', '永济市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (296, 283, '140882', '河津市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (297, 215, '140900', '忻州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (298, 297, '140902', '忻府区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (299, 297, '140921', '定襄县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (300, 297, '140922', '五台县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (301, 297, '140923', '代县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (302, 297, '140924', '繁峙县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (303, 297, '140925', '宁武县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (304, 297, '140926', '静乐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (305, 297, '140927', '神池县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (306, 297, '140928', '五寨县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (307, 297, '140929', '岢岚县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (308, 297, '140930', '河曲县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (309, 297, '140931', '保德县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (310, 297, '140932', '偏关县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (311, 297, '140981', '原平市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (312, 215, '141000', '临汾市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (313, 312, '141002', '尧都区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (314, 312, '141021', '曲沃县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (315, 312, '141022', '翼城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (316, 312, '141023', '襄汾县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (317, 312, '141024', '洪洞县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (318, 312, '141025', '古县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (319, 312, '141026', '安泽县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (320, 312, '141027', '浮山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (321, 312, '141028', '吉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (322, 312, '141029', '乡宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (323, 312, '141030', '大宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (324, 312, '141031', '隰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (325, 312, '141032', '永和县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (326, 312, '141033', '蒲县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (327, 312, '141034', '汾西县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (328, 312, '141081', '侯马市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (329, 312, '141082', '霍州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (330, 215, '141100', '吕梁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (331, 330, '141102', '离石区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (332, 330, '141121', '文水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (333, 330, '141122', '交城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (334, 330, '141123', '兴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (335, 330, '141124', '临县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (336, 330, '141125', '柳林县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (337, 330, '141126', '石楼县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (338, 330, '141127', '岚县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (339, 330, '141128', '方山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (340, 330, '141129', '中阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (341, 330, '141130', '交口县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (342, 330, '141181', '孝义市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (343, 330, '141182', '汾阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (344, 0, '150000', '内蒙古自治区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (345, 344, '150100', '呼和浩特市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (346, 345, '150102', '新城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (347, 345, '150103', '回民区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (348, 345, '150104', '玉泉区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (349, 345, '150105', '赛罕区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (350, 345, '150121', '土默特左旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (351, 345, '150122', '托克托县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (352, 345, '150123', '和林格尔县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (353, 345, '150124', '清水河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (354, 345, '150125', '武川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (355, 344, '150200', '包头市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (356, 355, '150202', '东河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (357, 355, '150203', '昆都仑区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (358, 355, '150204', '青山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (359, 355, '150205', '石拐区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (360, 355, '150206', '白云鄂博矿区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (361, 355, '150207', '九原区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (362, 355, '150221', '土默特右旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (363, 355, '150222', '固阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (364, 355, '150223', '达尔罕茂明安联合旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (365, 344, '150300', '乌海市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (366, 365, '150302', '海勃湾区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (367, 365, '150303', '海南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (368, 365, '150304', '乌达区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (369, 344, '150400', '赤峰市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (370, 369, '150402', '红山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (371, 369, '150403', '元宝山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (372, 369, '150404', '松山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (373, 369, '150421', '阿鲁科尔沁旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (374, 369, '150422', '巴林左旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (375, 369, '150423', '巴林右旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (376, 369, '150424', '林西县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (377, 369, '150425', '克什克腾旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (378, 369, '150426', '翁牛特旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (379, 369, '150428', '喀喇沁旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (380, 369, '150429', '宁城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (381, 369, '150430', '敖汉旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (382, 344, '150500', '通辽市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (383, 382, '150502', '科尔沁区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (384, 382, '150521', '科尔沁左翼中旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (385, 382, '150522', '科尔沁左翼后旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (386, 382, '150523', '开鲁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (387, 382, '150524', '库伦旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (388, 382, '150525', '奈曼旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (389, 382, '150526', '扎鲁特旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (390, 382, '150581', '霍林郭勒市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (391, 344, '150600', '鄂尔多斯市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (392, 391, '150602', '东胜区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (393, 391, '150603', '康巴什区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (394, 391, '150621', '达拉特旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (395, 391, '150622', '准格尔旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (396, 391, '150623', '鄂托克前旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (397, 391, '150624', '鄂托克旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (398, 391, '150625', '杭锦旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (399, 391, '150626', '乌审旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (400, 391, '150627', '伊金霍洛旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (401, 344, '150700', '呼伦贝尔市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (402, 401, '150702', '海拉尔区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (403, 401, '150703', '扎赉诺尔区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (404, 401, '150721', '阿荣旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (405, 401, '150722', '莫力达瓦达斡尔族自治旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (406, 401, '150723', '鄂伦春自治旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (407, 401, '150724', '鄂温克族自治旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (408, 401, '150725', '陈巴尔虎旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (409, 401, '150726', '新巴尔虎左旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (410, 401, '150727', '新巴尔虎右旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (411, 401, '150781', '满洲里市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (412, 401, '150782', '牙克石市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (413, 401, '150783', '扎兰屯市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (414, 401, '150784', '额尔古纳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (415, 401, '150785', '根河市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (416, 344, '150800', '巴彦淖尔市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (417, 416, '150802', '临河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (418, 416, '150821', '五原县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (419, 416, '150822', '磴口县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (420, 416, '150823', '乌拉特前旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (421, 416, '150824', '乌拉特中旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (422, 416, '150825', '乌拉特后旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (423, 416, '150826', '杭锦后旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (424, 344, '150900', '乌兰察布市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (425, 424, '150902', '集宁区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (426, 424, '150921', '卓资县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (427, 424, '150922', '化德县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (428, 424, '150923', '商都县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (429, 424, '150924', '兴和县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (430, 424, '150925', '凉城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (431, 424, '150926', '察哈尔右翼前旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (432, 424, '150927', '察哈尔右翼中旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (433, 424, '150928', '察哈尔右翼后旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (434, 424, '150929', '四子王旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (435, 424, '150981', '丰镇市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (436, 344, '152200', '兴安盟', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (437, 436, '152201', '乌兰浩特市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (438, 436, '152202', '阿尔山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (439, 436, '152221', '科尔沁右翼前旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (440, 436, '152222', '科尔沁右翼中旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (441, 436, '152223', '扎赉特旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (442, 436, '152224', '突泉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (443, 344, '152500', '锡林郭勒盟', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (444, 443, '152501', '二连浩特市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (445, 443, '152502', '锡林浩特市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (446, 443, '152522', '阿巴嘎旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (447, 443, '152523', '苏尼特左旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (448, 443, '152524', '苏尼特右旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (449, 443, '152525', '东乌珠穆沁旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (450, 443, '152526', '西乌珠穆沁旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (451, 443, '152527', '太仆寺旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (452, 443, '152528', '镶黄旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (453, 443, '152529', '正镶白旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (454, 443, '152530', '正蓝旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (455, 443, '152531', '多伦县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (456, 344, '152900', '阿拉善盟', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (457, 456, '152921', '阿拉善左旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (458, 456, '152922', '阿拉善右旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (459, 456, '152923', '额济纳旗', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (460, 0, '210000', '辽宁省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (461, 460, '210100', '沈阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (462, 461, '210102', '和平区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (463, 461, '210103', '沈河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (464, 461, '210104', '大东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (465, 461, '210105', '皇姑区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (466, 461, '210106', '铁西区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (467, 461, '210111', '苏家屯区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (468, 461, '210112', '浑南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (469, 461, '210113', '沈北新区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (470, 461, '210114', '于洪区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (471, 461, '210115', '辽中区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (472, 461, '210123', '康平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (473, 461, '210124', '法库县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (474, 461, '210181', '新民市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (475, 460, '210200', '大连市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (476, 475, '210202', '中山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (477, 475, '210203', '西岗区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (478, 475, '210204', '沙河口区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (479, 475, '210211', '甘井子区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (480, 475, '210212', '旅顺口区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (481, 475, '210213', '金州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (482, 475, '210214', '普兰店区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (483, 475, '210224', '长海县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (484, 475, '210281', '瓦房店市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (485, 475, '210283', '庄河市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (486, 460, '210300', '鞍山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (487, 486, '210302', '铁东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (488, 486, '210303', '铁西区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (489, 486, '210304', '立山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (490, 486, '210311', '千山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (491, 486, '210321', '台安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (492, 486, '210323', '岫岩满族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (493, 486, '210381', '海城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (494, 460, '210400', '抚顺市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (495, 494, '210402', '新抚区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (496, 494, '210403', '东洲区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (497, 494, '210404', '望花区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (498, 494, '210411', '顺城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (499, 494, '210421', '抚顺县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (500, 494, '210422', '新宾满族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (501, 494, '210423', '清原满族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (502, 460, '210500', '本溪市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (503, 502, '210502', '平山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (504, 502, '210503', '溪湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (505, 502, '210504', '明山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (506, 502, '210505', '南芬区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (507, 502, '210521', '本溪满族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (508, 502, '210522', '桓仁满族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (509, 460, '210600', '丹东市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (510, 509, '210602', '元宝区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (511, 509, '210603', '振兴区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (512, 509, '210604', '振安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (513, 509, '210624', '宽甸满族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (514, 509, '210681', '东港市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (515, 509, '210682', '凤城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (516, 460, '210700', '锦州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (517, 516, '210702', '古塔区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (518, 516, '210703', '凌河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (519, 516, '210711', '太和区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (520, 516, '210726', '黑山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (521, 516, '210727', '义县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (522, 516, '210781', '凌海市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (523, 516, '210782', '北镇市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (524, 460, '210800', '营口市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (525, 524, '210802', '站前区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (526, 524, '210803', '西市区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (527, 524, '210804', '鲅鱼圈区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (528, 524, '210811', '老边区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (529, 524, '210881', '盖州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (530, 524, '210882', '大石桥市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (531, 460, '210900', '阜新市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (532, 531, '210902', '海州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (533, 531, '210903', '新邱区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (534, 531, '210904', '太平区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (535, 531, '210905', '清河门区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (536, 531, '210911', '细河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (537, 531, '210921', '阜新蒙古族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (538, 531, '210922', '彰武县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (539, 460, '211000', '辽阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (540, 539, '211002', '白塔区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (541, 539, '211003', '文圣区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (542, 539, '211004', '宏伟区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (543, 539, '211005', '弓长岭区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (544, 539, '211011', '太子河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (545, 539, '211021', '辽阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (546, 539, '211081', '灯塔市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (547, 460, '211100', '盘锦市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (548, 547, '211102', '双台子区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (549, 547, '211103', '兴隆台区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (550, 547, '211104', '大洼区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (551, 547, '211122', '盘山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (552, 460, '211200', '铁岭市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (553, 552, '211202', '银州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (554, 552, '211204', '清河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (555, 552, '211221', '铁岭县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (556, 552, '211223', '西丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (557, 552, '211224', '昌图县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (558, 552, '211281', '调兵山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (559, 552, '211282', '开原市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (560, 460, '211300', '朝阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (561, 560, '211302', '双塔区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (562, 560, '211303', '龙城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (563, 560, '211321', '朝阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (564, 560, '211322', '建平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (565, 560, '211324', '喀喇沁左翼蒙古族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (566, 560, '211381', '北票市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (567, 560, '211382', '凌源市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (568, 460, '211400', '葫芦岛市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (569, 568, '211402', '连山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (570, 568, '211403', '龙港区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (571, 568, '211404', '南票区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (572, 568, '211421', '绥中县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (573, 568, '211422', '建昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (574, 568, '211481', '兴城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (575, 0, '220000', '吉林省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (576, 575, '220100', '长春市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (577, 576, '220102', '南关区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (578, 576, '220103', '宽城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (579, 576, '220104', '朝阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (580, 576, '220105', '二道区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (581, 576, '220106', '绿园区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (582, 576, '220112', '双阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (583, 576, '220113', '九台区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (584, 576, '220122', '农安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (585, 576, '220182', '榆树市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (586, 576, '220183', '德惠市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (587, 575, '220200', '吉林市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (588, 587, '220202', '昌邑区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (589, 587, '220203', '龙潭区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (590, 587, '220204', '船营区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (591, 587, '220211', '丰满区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (592, 587, '220221', '永吉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (593, 587, '220281', '蛟河市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (594, 587, '220282', '桦甸市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (595, 587, '220283', '舒兰市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (596, 587, '220284', '磐石市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (597, 575, '220300', '四平市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (598, 597, '220302', '铁西区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (599, 597, '220303', '铁东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (600, 597, '220322', '梨树县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (601, 597, '220323', '伊通满族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (602, 597, '220381', '公主岭市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (603, 597, '220382', '双辽市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (604, 575, '220400', '辽源市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (605, 604, '220402', '龙山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (606, 604, '220403', '西安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (607, 604, '220421', '东丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (608, 604, '220422', '东辽县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (609, 575, '220500', '通化市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (610, 609, '220502', '东昌区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (611, 609, '220503', '二道江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (612, 609, '220521', '通化县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (613, 609, '220523', '辉南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (614, 609, '220524', '柳河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (615, 609, '220581', '梅河口市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (616, 609, '220582', '集安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (617, 575, '220600', '白山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (618, 617, '220602', '浑江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (619, 617, '220605', '江源区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (620, 617, '220621', '抚松县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (621, 617, '220622', '靖宇县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (622, 617, '220623', '长白朝鲜族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (623, 617, '220681', '临江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (624, 575, '220700', '松原市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (625, 624, '220702', '宁江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (626, 624, '220721', '前郭尔罗斯蒙古族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (627, 624, '220722', '长岭县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (628, 624, '220723', '乾安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (629, 624, '220781', '扶余市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (630, 575, '220800', '白城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (631, 630, '220802', '洮北区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (632, 630, '220821', '镇赉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (633, 630, '220822', '通榆县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (634, 630, '220881', '洮南市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (635, 630, '220882', '大安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (636, 575, '222400', '延边朝鲜族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (637, 636, '222401', '延吉市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (638, 636, '222402', '图们市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (639, 636, '222403', '敦化市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (640, 636, '222404', '珲春市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (641, 636, '222405', '龙井市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (642, 636, '222406', '和龙市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (643, 636, '222424', '汪清县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (644, 636, '222426', '安图县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (645, 0, '230000', '黑龙江省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (646, 645, '230100', '哈尔滨市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (647, 646, '230102', '道里区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (648, 646, '230103', '南岗区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (649, 646, '230104', '道外区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (650, 646, '230108', '平房区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (651, 646, '230109', '松北区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (652, 646, '230110', '香坊区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (653, 646, '230111', '呼兰区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (654, 646, '230112', '阿城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (655, 646, '230113', '双城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (656, 646, '230123', '依兰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (657, 646, '230124', '方正县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (658, 646, '230125', '宾县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (659, 646, '230126', '巴彦县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (660, 646, '230127', '木兰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (661, 646, '230128', '通河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (662, 646, '230129', '延寿县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (663, 646, '230183', '尚志市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (664, 646, '230184', '五常市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (665, 645, '230200', '齐齐哈尔市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (666, 665, '230202', '龙沙区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (667, 665, '230203', '建华区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (668, 665, '230204', '铁锋区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (669, 665, '230205', '昂昂溪区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (670, 665, '230206', '富拉尔基区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (671, 665, '230207', '碾子山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (672, 665, '230208', '梅里斯达斡尔族区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (673, 665, '230221', '龙江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (674, 665, '230223', '依安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (675, 665, '230224', '泰来县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (676, 665, '230225', '甘南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (677, 665, '230227', '富裕县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (678, 665, '230229', '克山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (679, 665, '230230', '克东县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (680, 665, '230231', '拜泉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (681, 665, '230281', '讷河市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (682, 645, '230300', '鸡西市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (683, 682, '230302', '鸡冠区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (684, 682, '230303', '恒山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (685, 682, '230304', '滴道区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (686, 682, '230305', '梨树区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (687, 682, '230306', '城子河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (688, 682, '230307', '麻山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (689, 682, '230321', '鸡东县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (690, 682, '230381', '虎林市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (691, 682, '230382', '密山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (692, 645, '230400', '鹤岗市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (693, 692, '230402', '向阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (694, 692, '230403', '工农区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (695, 692, '230404', '南山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (696, 692, '230405', '兴安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (697, 692, '230406', '东山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (698, 692, '230407', '兴山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (699, 692, '230421', '萝北县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (700, 692, '230422', '绥滨县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (701, 645, '230500', '双鸭山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (702, 701, '230502', '尖山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (703, 701, '230503', '岭东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (704, 701, '230505', '四方台区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (705, 701, '230506', '宝山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (706, 701, '230521', '集贤县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (707, 701, '230522', '友谊县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (708, 701, '230523', '宝清县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (709, 701, '230524', '饶河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (710, 645, '230600', '大庆市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (711, 710, '230602', '萨尔图区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (712, 710, '230603', '龙凤区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (713, 710, '230604', '让胡路区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (714, 710, '230605', '红岗区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (715, 710, '230606', '大同区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (716, 710, '230621', '肇州县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (717, 710, '230622', '肇源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (718, 710, '230623', '林甸县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (719, 710, '230624', '杜尔伯特蒙古族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (720, 645, '230700', '伊春市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (721, 720, '230717', '伊美区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (722, 720, '230718', '乌翠区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (723, 720, '230719', '友好区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (724, 720, '230722', '嘉荫县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (725, 720, '230723', '汤旺县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (726, 720, '230724', '丰林县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (727, 720, '230725', '大箐山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (728, 720, '230726', '南岔县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (729, 720, '230751', '金林区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (730, 720, '230781', '铁力市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (731, 645, '230800', '佳木斯市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (732, 731, '230803', '向阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (733, 731, '230804', '前进区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (734, 731, '230805', '东风区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (735, 731, '230811', '郊区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (736, 731, '230822', '桦南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (737, 731, '230826', '桦川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (738, 731, '230828', '汤原县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (739, 731, '230881', '同江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (740, 731, '230882', '富锦市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (741, 731, '230883', '抚远市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (742, 645, '230900', '七台河市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (743, 742, '230902', '新兴区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (744, 742, '230903', '桃山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (745, 742, '230904', '茄子河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (746, 742, '230921', '勃利县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (747, 645, '231000', '牡丹江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (748, 747, '231002', '东安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (749, 747, '231003', '阳明区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (750, 747, '231004', '爱民区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (751, 747, '231005', '西安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (752, 747, '231025', '林口县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (753, 747, '231081', '绥芬河市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (754, 747, '231083', '海林市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (755, 747, '231084', '宁安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (756, 747, '231085', '穆棱市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (757, 747, '231086', '东宁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (758, 645, '231100', '黑河市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (759, 758, '231102', '爱辉区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (760, 758, '231123', '逊克县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (761, 758, '231124', '孙吴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (762, 758, '231181', '北安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (763, 758, '231182', '五大连池市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (764, 758, '231183', '嫩江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (765, 645, '231200', '绥化市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (766, 765, '231202', '北林区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (767, 765, '231221', '望奎县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (768, 765, '231222', '兰西县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (769, 765, '231223', '青冈县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (770, 765, '231224', '庆安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (771, 765, '231225', '明水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (772, 765, '231226', '绥棱县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (773, 765, '231281', '安达市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (774, 765, '231282', '肇东市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (775, 765, '231283', '海伦市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (776, 645, '232700', '大兴安岭地区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (777, 776, '232701', '漠河市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (778, 776, '232721', '呼玛县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (779, 776, '232722', '塔河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (780, 0, '310000', '上海', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (781, 3218, '310101', '黄浦区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (782, 3218, '310104', '徐汇区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (783, 3218, '310105', '长宁区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (784, 3218, '310106', '静安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (785, 3218, '310107', '普陀区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (786, 3218, '310109', '虹口区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (787, 3218, '310110', '杨浦区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (788, 3218, '310112', '闵行区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (789, 3218, '310113', '宝山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (790, 3218, '310114', '嘉定区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (791, 3218, '310115', '浦东新区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (792, 3218, '310116', '金山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (793, 3218, '310117', '松江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (794, 3218, '310118', '青浦区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (795, 3218, '310120', '奉贤区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (796, 3218, '310151', '崇明区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (797, 0, '320000', '江苏省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (798, 797, '320100', '南京市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (799, 798, '320102', '玄武区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (800, 798, '320104', '秦淮区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (801, 798, '320105', '建邺区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (802, 798, '320106', '鼓楼区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (803, 798, '320111', '浦口区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (804, 798, '320113', '栖霞区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (805, 798, '320114', '雨花台区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (806, 798, '320115', '江宁区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (807, 798, '320116', '六合区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (808, 798, '320117', '溧水区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (809, 798, '320118', '高淳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (810, 797, '320200', '无锡市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (811, 810, '320205', '锡山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (812, 810, '320206', '惠山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (813, 810, '320211', '滨湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (814, 810, '320213', '梁溪区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (815, 810, '320214', '新吴区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (816, 810, '320281', '江阴市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (817, 810, '320282', '宜兴市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (818, 797, '320300', '徐州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (819, 818, '320302', '鼓楼区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (820, 818, '320303', '云龙区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (821, 818, '320305', '贾汪区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (822, 818, '320311', '泉山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (823, 818, '320312', '铜山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (824, 818, '320321', '丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (825, 818, '320322', '沛县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (826, 818, '320324', '睢宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (827, 818, '320381', '新沂市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (828, 818, '320382', '邳州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (829, 797, '320400', '常州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (830, 829, '320402', '天宁区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (831, 829, '320404', '钟楼区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (832, 829, '320411', '新北区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (833, 829, '320412', '武进区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (834, 829, '320413', '金坛区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (835, 829, '320481', '溧阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (836, 797, '320500', '苏州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (837, 836, '320505', '虎丘区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (838, 836, '320506', '吴中区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (839, 836, '320507', '相城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (840, 836, '320508', '姑苏区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (841, 836, '320509', '吴江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (842, 836, '320581', '常熟市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (843, 836, '320582', '张家港市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (844, 836, '320583', '昆山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (845, 836, '320585', '太仓市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (846, 797, '320600', '南通市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (847, 846, '320602', '崇川区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (848, 846, '320611', '港闸区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (849, 846, '320612', '通州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (850, 846, '320623', '如东县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (851, 846, '320681', '启东市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (852, 846, '320682', '如皋市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (853, 846, '320684', '海门市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (854, 846, '320685', '海安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (855, 797, '320700', '连云港市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (856, 855, '320703', '连云区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (857, 855, '320706', '海州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (858, 855, '320707', '赣榆区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (859, 855, '320722', '东海县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (860, 855, '320723', '灌云县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (861, 855, '320724', '灌南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (862, 797, '320800', '淮安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (863, 862, '320803', '淮安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (864, 862, '320804', '淮阴区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (865, 862, '320812', '清江浦区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (866, 862, '320813', '洪泽区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (867, 862, '320826', '涟水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (868, 862, '320830', '盱眙县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (869, 862, '320831', '金湖县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (870, 797, '320900', '盐城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (871, 870, '320902', '亭湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (872, 870, '320903', '盐都区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (873, 870, '320904', '大丰区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (874, 870, '320921', '响水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (875, 870, '320922', '滨海县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (876, 870, '320923', '阜宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (877, 870, '320924', '射阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (878, 870, '320925', '建湖县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (879, 870, '320981', '东台市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (880, 797, '321000', '扬州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (881, 880, '321002', '广陵区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (882, 880, '321003', '邗江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (883, 880, '321012', '江都区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (884, 880, '321023', '宝应县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (885, 880, '321081', '仪征市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (886, 880, '321084', '高邮市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (887, 797, '321100', '镇江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (888, 887, '321102', '京口区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (889, 887, '321111', '润州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (890, 887, '321112', '丹徒区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (891, 887, '321181', '丹阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (892, 887, '321182', '扬中市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (893, 887, '321183', '句容市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (894, 797, '321200', '泰州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (895, 894, '321202', '海陵区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (896, 894, '321203', '高港区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (897, 894, '321204', '姜堰区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (898, 894, '321281', '兴化市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (899, 894, '321282', '靖江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (900, 894, '321283', '泰兴市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (901, 797, '321300', '宿迁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (902, 901, '321302', '宿城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (903, 901, '321311', '宿豫区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (904, 901, '321322', '沭阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (905, 901, '321323', '泗阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (906, 901, '321324', '泗洪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (907, 0, '330000', '浙江省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (908, 907, '330100', '杭州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (909, 908, '330102', '上城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (910, 908, '330103', '下城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (911, 908, '330104', '江干区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (912, 908, '330105', '拱墅区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (913, 908, '330106', '西湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (914, 908, '330108', '滨江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (915, 908, '330109', '萧山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (916, 908, '330110', '余杭区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (917, 908, '330111', '富阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (918, 908, '330112', '临安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (919, 908, '330122', '桐庐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (920, 908, '330127', '淳安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (921, 908, '330182', '建德市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (922, 907, '330200', '宁波市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (923, 922, '330203', '海曙区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (924, 922, '330205', '江北区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (925, 922, '330206', '北仑区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (926, 922, '330211', '镇海区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (927, 922, '330212', '鄞州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (928, 922, '330213', '奉化区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (929, 922, '330225', '象山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (930, 922, '330226', '宁海县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (931, 922, '330281', '余姚市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (932, 922, '330282', '慈溪市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (933, 907, '330300', '温州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (934, 933, '330302', '鹿城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (935, 933, '330303', '龙湾区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (936, 933, '330304', '瓯海区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (937, 933, '330305', '洞头区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (938, 933, '330324', '永嘉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (939, 933, '330326', '平阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (940, 933, '330327', '苍南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (941, 933, '330328', '文成县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (942, 933, '330329', '泰顺县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (943, 933, '330381', '瑞安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (944, 933, '330382', '乐清市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (945, 933, '330383', '龙港市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (946, 907, '330400', '嘉兴市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (947, 946, '330402', '南湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (948, 946, '330411', '秀洲区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (949, 946, '330421', '嘉善县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (950, 946, '330424', '海盐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (951, 946, '330481', '海宁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (952, 946, '330482', '平湖市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (953, 946, '330483', '桐乡市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (954, 907, '330500', '湖州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (955, 954, '330502', '吴兴区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (956, 954, '330503', '南浔区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (957, 954, '330521', '德清县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (958, 954, '330522', '长兴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (959, 954, '330523', '安吉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (960, 907, '330600', '绍兴市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (961, 960, '330602', '越城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (962, 960, '330603', '柯桥区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (963, 960, '330604', '上虞区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (964, 960, '330624', '新昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (965, 960, '330681', '诸暨市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (966, 960, '330683', '嵊州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (967, 907, '330700', '金华市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (968, 967, '330702', '婺城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (969, 967, '330703', '金东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (970, 967, '330723', '武义县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (971, 967, '330726', '浦江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (972, 967, '330727', '磐安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (973, 967, '330781', '兰溪市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (974, 967, '330782', '义乌市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (975, 967, '330783', '东阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (976, 967, '330784', '永康市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (977, 907, '330800', '衢州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (978, 977, '330802', '柯城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (979, 977, '330803', '衢江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (980, 977, '330822', '常山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (981, 977, '330824', '开化县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (982, 977, '330825', '龙游县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (983, 977, '330881', '江山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (984, 907, '330900', '舟山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (985, 984, '330902', '定海区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (986, 984, '330903', '普陀区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (987, 984, '330921', '岱山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (988, 984, '330922', '嵊泗县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (989, 907, '331000', '台州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (990, 989, '331002', '椒江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (991, 989, '331003', '黄岩区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (992, 989, '331004', '路桥区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (993, 989, '331022', '三门县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (994, 989, '331023', '天台县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (995, 989, '331024', '仙居县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (996, 989, '331081', '温岭市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (997, 989, '331082', '临海市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (998, 989, '331083', '玉环市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (999, 907, '331100', '丽水市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1000, 999, '331102', '莲都区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1001, 999, '331121', '青田县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1002, 999, '331122', '缙云县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1003, 999, '331123', '遂昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1004, 999, '331124', '松阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1005, 999, '331125', '云和县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1006, 999, '331126', '庆元县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1007, 999, '331127', '景宁畲族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1008, 999, '331181', '龙泉市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1009, 0, '340000', '安徽省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (1010, 1009, '340100', '合肥市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1011, 1010, '340102', '瑶海区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1012, 1010, '340103', '庐阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1013, 1010, '340104', '蜀山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1014, 1010, '340111', '包河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1015, 1010, '340121', '长丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1016, 1010, '340122', '肥东县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1017, 1010, '340123', '肥西县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1018, 1010, '340124', '庐江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1019, 1010, '340181', '巢湖市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1020, 1009, '340200', '芜湖市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1021, 1020, '340202', '镜湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1022, 1020, '340203', '弋江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1023, 1020, '340207', '鸠江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1024, 1020, '340208', '三山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1025, 1020, '340221', '芜湖县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1026, 1020, '340222', '繁昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1027, 1020, '340223', '南陵县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1028, 1020, '340281', '无为市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1029, 1009, '340300', '蚌埠市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1030, 1029, '340302', '龙子湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1031, 1029, '340303', '蚌山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1032, 1029, '340304', '禹会区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1033, 1029, '340311', '淮上区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1034, 1029, '340321', '怀远县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1035, 1029, '340322', '五河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1036, 1029, '340323', '固镇县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1037, 1009, '340400', '淮南市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1038, 1037, '340402', '大通区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1039, 1037, '340403', '田家庵区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1040, 1037, '340404', '谢家集区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1041, 1037, '340405', '八公山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1042, 1037, '340406', '潘集区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1043, 1037, '340421', '凤台县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1044, 1037, '340422', '寿县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1045, 1009, '340500', '马鞍山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1046, 1045, '340503', '花山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1047, 1045, '340504', '雨山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1048, 1045, '340506', '博望区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1049, 1045, '340521', '当涂县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1050, 1045, '340522', '含山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1051, 1045, '340523', '和县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1052, 1009, '340600', '淮北市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1053, 1052, '340602', '杜集区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1054, 1052, '340603', '相山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1055, 1052, '340604', '烈山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1056, 1052, '340621', '濉溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1057, 1009, '340700', '铜陵市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1058, 1057, '340705', '铜官区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1059, 1057, '340706', '义安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1060, 1057, '340711', '郊区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1061, 1057, '340722', '枞阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1062, 1009, '340800', '安庆市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1063, 1062, '340802', '迎江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1064, 1062, '340803', '大观区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1065, 1062, '340811', '宜秀区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1066, 1062, '340822', '怀宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1067, 1062, '340825', '太湖县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1068, 1062, '340826', '宿松县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1069, 1062, '340827', '望江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1070, 1062, '340828', '岳西县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1071, 1062, '340881', '桐城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1072, 1062, '340882', '潜山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1073, 1009, '341000', '黄山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1074, 1073, '341002', '屯溪区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1075, 1073, '341003', '黄山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1076, 1073, '341004', '徽州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1077, 1073, '341021', '歙县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1078, 1073, '341022', '休宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1079, 1073, '341023', '黟县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1080, 1073, '341024', '祁门县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1081, 1009, '341100', '滁州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1082, 1081, '341102', '琅琊区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1083, 1081, '341103', '南谯区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1084, 1081, '341122', '来安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1085, 1081, '341124', '全椒县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1086, 1081, '341125', '定远县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1087, 1081, '341126', '凤阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1088, 1081, '341181', '天长市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1089, 1081, '341182', '明光市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1090, 1009, '341200', '阜阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1091, 1090, '341202', '颍州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1092, 1090, '341203', '颍东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1093, 1090, '341204', '颍泉区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1094, 1090, '341221', '临泉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1095, 1090, '341222', '太和县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1096, 1090, '341225', '阜南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1097, 1090, '341226', '颍上县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1098, 1090, '341282', '界首市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1099, 1009, '341300', '宿州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1100, 1099, '341302', '埇桥区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1101, 1099, '341321', '砀山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1102, 1099, '341322', '萧县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1103, 1099, '341323', '灵璧县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1104, 1099, '341324', '泗县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1105, 1009, '341500', '六安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1106, 1105, '341502', '金安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1107, 1105, '341503', '裕安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1108, 1105, '341504', '叶集区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1109, 1105, '341522', '霍邱县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1110, 1105, '341523', '舒城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1111, 1105, '341524', '金寨县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1112, 1105, '341525', '霍山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1113, 1009, '341600', '亳州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1114, 1113, '341602', '谯城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1115, 1113, '341621', '涡阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1116, 1113, '341622', '蒙城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1117, 1113, '341623', '利辛县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1118, 1009, '341700', '池州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1119, 1118, '341702', '贵池区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1120, 1118, '341721', '东至县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1121, 1118, '341722', '石台县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1122, 1118, '341723', '青阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1123, 1009, '341800', '宣城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1124, 1123, '341802', '宣州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1125, 1123, '341821', '郎溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1126, 1123, '341823', '泾县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1127, 1123, '341824', '绩溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1128, 1123, '341825', '旌德县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1129, 1123, '341881', '宁国市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1130, 1123, '341882', '广德市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1131, 0, '350000', '福建省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (1132, 1131, '350100', '福州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1133, 1132, '350102', '鼓楼区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1134, 1132, '350103', '台江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1135, 1132, '350104', '仓山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1136, 1132, '350105', '马尾区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1137, 1132, '350111', '晋安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1138, 1132, '350112', '长乐区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1139, 1132, '350121', '闽侯县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1140, 1132, '350122', '连江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1141, 1132, '350123', '罗源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1142, 1132, '350124', '闽清县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1143, 1132, '350125', '永泰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1144, 1132, '350128', '平潭县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1145, 1132, '350181', '福清市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1146, 1131, '350200', '厦门市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1147, 1146, '350203', '思明区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1148, 1146, '350205', '海沧区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1149, 1146, '350206', '湖里区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1150, 1146, '350211', '集美区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1151, 1146, '350212', '同安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1152, 1146, '350213', '翔安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1153, 1131, '350300', '莆田市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1154, 1153, '350302', '城厢区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1155, 1153, '350303', '涵江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1156, 1153, '350304', '荔城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1157, 1153, '350305', '秀屿区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1158, 1153, '350322', '仙游县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1159, 1131, '350400', '三明市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1160, 1159, '350402', '梅列区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1161, 1159, '350403', '三元区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1162, 1159, '350421', '明溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1163, 1159, '350423', '清流县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1164, 1159, '350424', '宁化县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1165, 1159, '350425', '大田县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1166, 1159, '350426', '尤溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1167, 1159, '350427', '沙县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1168, 1159, '350428', '将乐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1169, 1159, '350429', '泰宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1170, 1159, '350430', '建宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1171, 1159, '350481', '永安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1172, 1131, '350500', '泉州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1173, 1172, '350502', '鲤城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1174, 1172, '350503', '丰泽区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1175, 1172, '350504', '洛江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1176, 1172, '350505', '泉港区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1177, 1172, '350521', '惠安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1178, 1172, '350524', '安溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1179, 1172, '350525', '永春县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1180, 1172, '350526', '德化县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1181, 1172, '350527', '金门县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1182, 1172, '350581', '石狮市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1183, 1172, '350582', '晋江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1184, 1172, '350583', '南安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1185, 1131, '350600', '漳州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1186, 1185, '350602', '芗城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1187, 1185, '350603', '龙文区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1188, 1185, '350622', '云霄县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1189, 1185, '350623', '漳浦县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1190, 1185, '350624', '诏安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1191, 1185, '350625', '长泰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1192, 1185, '350626', '东山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1193, 1185, '350627', '南靖县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1194, 1185, '350628', '平和县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1195, 1185, '350629', '华安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1196, 1185, '350681', '龙海市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1197, 1131, '350700', '南平市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1198, 1197, '350702', '延平区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1199, 1197, '350703', '建阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1200, 1197, '350721', '顺昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1201, 1197, '350722', '浦城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1202, 1197, '350723', '光泽县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1203, 1197, '350724', '松溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1204, 1197, '350725', '政和县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1205, 1197, '350781', '邵武市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1206, 1197, '350782', '武夷山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1207, 1197, '350783', '建瓯市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1208, 1131, '350800', '龙岩市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1209, 1208, '350802', '新罗区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1210, 1208, '350803', '永定区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1211, 1208, '350821', '长汀县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1212, 1208, '350823', '上杭县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1213, 1208, '350824', '武平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1214, 1208, '350825', '连城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1215, 1208, '350881', '漳平市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1216, 1131, '350900', '宁德市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1217, 1216, '350902', '蕉城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1218, 1216, '350921', '霞浦县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1219, 1216, '350922', '古田县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1220, 1216, '350923', '屏南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1221, 1216, '350924', '寿宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1222, 1216, '350925', '周宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1223, 1216, '350926', '柘荣县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1224, 1216, '350981', '福安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1225, 1216, '350982', '福鼎市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1226, 0, '360000', '江西省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (1227, 1226, '360100', '南昌市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1228, 1227, '360102', '东湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1229, 1227, '360103', '西湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1230, 1227, '360104', '青云谱区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1231, 1227, '360111', '青山湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1232, 1227, '360112', '新建区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1233, 1227, '360113', '红谷滩区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1234, 1227, '360121', '南昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1235, 1227, '360123', '安义县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1236, 1227, '360124', '进贤县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1237, 1226, '360200', '景德镇市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1238, 1237, '360202', '昌江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1239, 1237, '360203', '珠山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1240, 1237, '360222', '浮梁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1241, 1237, '360281', '乐平市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1242, 1226, '360300', '萍乡市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1243, 1242, '360302', '安源区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1244, 1242, '360313', '湘东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1245, 1242, '360321', '莲花县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1246, 1242, '360322', '上栗县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1247, 1242, '360323', '芦溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1248, 1226, '360400', '九江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1249, 1248, '360402', '濂溪区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1250, 1248, '360403', '浔阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1251, 1248, '360404', '柴桑区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1252, 1248, '360423', '武宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1253, 1248, '360424', '修水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1254, 1248, '360425', '永修县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1255, 1248, '360426', '德安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1256, 1248, '360428', '都昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1257, 1248, '360429', '湖口县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1258, 1248, '360430', '彭泽县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1259, 1248, '360481', '瑞昌市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1260, 1248, '360482', '共青城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1261, 1248, '360483', '庐山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1262, 1226, '360500', '新余市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1263, 1262, '360502', '渝水区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1264, 1262, '360521', '分宜县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1265, 1226, '360600', '鹰潭市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1266, 1265, '360602', '月湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1267, 1265, '360603', '余江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1268, 1265, '360681', '贵溪市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1269, 1226, '360700', '赣州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1270, 1269, '360702', '章贡区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1271, 1269, '360703', '南康区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1272, 1269, '360704', '赣县区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1273, 1269, '360722', '信丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1274, 1269, '360723', '大余县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1275, 1269, '360724', '上犹县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1276, 1269, '360725', '崇义县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1277, 1269, '360726', '安远县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1278, 1269, '360727', '龙南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1279, 1269, '360728', '定南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1280, 1269, '360729', '全南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1281, 1269, '360730', '宁都县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1282, 1269, '360731', '于都县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1283, 1269, '360732', '兴国县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1284, 1269, '360733', '会昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1285, 1269, '360734', '寻乌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1286, 1269, '360735', '石城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1287, 1269, '360781', '瑞金市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1288, 1226, '360800', '吉安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1289, 1288, '360802', '吉州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1290, 1288, '360803', '青原区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1291, 1288, '360821', '吉安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1292, 1288, '360822', '吉水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1293, 1288, '360823', '峡江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1294, 1288, '360824', '新干县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1295, 1288, '360825', '永丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1296, 1288, '360826', '泰和县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1297, 1288, '360827', '遂川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1298, 1288, '360828', '万安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1299, 1288, '360829', '安福县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1300, 1288, '360830', '永新县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1301, 1288, '360881', '井冈山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1302, 1226, '360900', '宜春市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1303, 1302, '360902', '袁州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1304, 1302, '360921', '奉新县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1305, 1302, '360922', '万载县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1306, 1302, '360923', '上高县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1307, 1302, '360924', '宜丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1308, 1302, '360925', '靖安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1309, 1302, '360926', '铜鼓县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1310, 1302, '360981', '丰城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1311, 1302, '360982', '樟树市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1312, 1302, '360983', '高安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1313, 1226, '361000', '抚州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1314, 1313, '361002', '临川区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1315, 1313, '361003', '东乡区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1316, 1313, '361021', '南城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1317, 1313, '361022', '黎川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1318, 1313, '361023', '南丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1319, 1313, '361024', '崇仁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1320, 1313, '361025', '乐安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1321, 1313, '361026', '宜黄县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1322, 1313, '361027', '金溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1323, 1313, '361028', '资溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1324, 1313, '361030', '广昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1325, 1226, '361100', '上饶市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1326, 1325, '361102', '信州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1327, 1325, '361103', '广丰区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1328, 1325, '361104', '广信区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1329, 1325, '361123', '玉山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1330, 1325, '361124', '铅山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1331, 1325, '361125', '横峰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1332, 1325, '361126', '弋阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1333, 1325, '361127', '余干县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1334, 1325, '361128', '鄱阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1335, 1325, '361129', '万年县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1336, 1325, '361130', '婺源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1337, 1325, '361181', '德兴市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1338, 0, '370000', '山东省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (1339, 1338, '370100', '济南市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1340, 1339, '370102', '历下区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1341, 1339, '370103', '市中区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1342, 1339, '370104', '槐荫区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1343, 1339, '370105', '天桥区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1344, 1339, '370112', '历城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1345, 1339, '370113', '长清区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1346, 1339, '370114', '章丘区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1347, 1339, '370115', '济阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1348, 1339, '370116', '莱芜区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1349, 1339, '370117', '钢城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1350, 1339, '370124', '平阴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1351, 1339, '370126', '商河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1352, 1338, '370200', '青岛市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1353, 1352, '370202', '市南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1354, 1352, '370203', '市北区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1355, 1352, '370211', '黄岛区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1356, 1352, '370212', '崂山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1357, 1352, '370213', '李沧区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1358, 1352, '370214', '城阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1359, 1352, '370215', '即墨区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1360, 1352, '370281', '胶州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1361, 1352, '370283', '平度市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1362, 1352, '370285', '莱西市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1363, 1338, '370300', '淄博市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1364, 1363, '370302', '淄川区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1365, 1363, '370303', '张店区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1366, 1363, '370304', '博山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1367, 1363, '370305', '临淄区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1368, 1363, '370306', '周村区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1369, 1363, '370321', '桓台县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1370, 1363, '370322', '高青县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1371, 1363, '370323', '沂源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1372, 1338, '370400', '枣庄市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1373, 1372, '370402', '市中区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1374, 1372, '370403', '薛城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1375, 1372, '370404', '峄城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1376, 1372, '370405', '台儿庄区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1377, 1372, '370406', '山亭区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1378, 1372, '370481', '滕州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1379, 1338, '370500', '东营市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1380, 1379, '370502', '东营区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1381, 1379, '370503', '河口区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1382, 1379, '370505', '垦利区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1383, 1379, '370522', '利津县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1384, 1379, '370523', '广饶县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1385, 1338, '370600', '烟台市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1386, 1385, '370602', '芝罘区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1387, 1385, '370611', '福山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1388, 1385, '370612', '牟平区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1389, 1385, '370613', '莱山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1390, 1385, '370634', '长岛县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1391, 1385, '370681', '龙口市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1392, 1385, '370682', '莱阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1393, 1385, '370683', '莱州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1394, 1385, '370684', '蓬莱市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1395, 1385, '370685', '招远市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1396, 1385, '370686', '栖霞市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1397, 1385, '370687', '海阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1398, 1338, '370700', '潍坊市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1399, 1398, '370702', '潍城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1400, 1398, '370703', '寒亭区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1401, 1398, '370704', '坊子区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1402, 1398, '370705', '奎文区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1403, 1398, '370724', '临朐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1404, 1398, '370725', '昌乐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1405, 1398, '370781', '青州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1406, 1398, '370782', '诸城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1407, 1398, '370783', '寿光市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1408, 1398, '370784', '安丘市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1409, 1398, '370785', '高密市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1410, 1398, '370786', '昌邑市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1411, 1338, '370800', '济宁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1412, 1411, '370811', '任城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1413, 1411, '370812', '兖州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1414, 1411, '370826', '微山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1415, 1411, '370827', '鱼台县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1416, 1411, '370828', '金乡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1417, 1411, '370829', '嘉祥县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1418, 1411, '370830', '汶上县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1419, 1411, '370831', '泗水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1420, 1411, '370832', '梁山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1421, 1411, '370881', '曲阜市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1422, 1411, '370883', '邹城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1423, 1338, '370900', '泰安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1424, 1423, '370902', '泰山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1425, 1423, '370911', '岱岳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1426, 1423, '370921', '宁阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1427, 1423, '370923', '东平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1428, 1423, '370982', '新泰市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1429, 1423, '370983', '肥城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1430, 1338, '371000', '威海市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1431, 1430, '371002', '环翠区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1432, 1430, '371003', '文登区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1433, 1430, '371082', '荣成市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1434, 1430, '371083', '乳山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1435, 1338, '371100', '日照市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1436, 1435, '371102', '东港区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1437, 1435, '371103', '岚山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1438, 1435, '371121', '五莲县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1439, 1435, '371122', '莒县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1440, 1338, '371300', '临沂市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1441, 1440, '371302', '兰山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1442, 1440, '371311', '罗庄区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1443, 1440, '371312', '河东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1444, 1440, '371321', '沂南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1445, 1440, '371322', '郯城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1446, 1440, '371323', '沂水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1447, 1440, '371324', '兰陵县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1448, 1440, '371325', '费县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1449, 1440, '371326', '平邑县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1450, 1440, '371327', '莒南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1451, 1440, '371328', '蒙阴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1452, 1440, '371329', '临沭县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1453, 1338, '371400', '德州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1454, 1453, '371402', '德城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1455, 1453, '371403', '陵城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1456, 1453, '371422', '宁津县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1457, 1453, '371423', '庆云县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1458, 1453, '371424', '临邑县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1459, 1453, '371425', '齐河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1460, 1453, '371426', '平原县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1461, 1453, '371427', '夏津县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1462, 1453, '371428', '武城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1463, 1453, '371481', '乐陵市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1464, 1453, '371482', '禹城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1465, 1338, '371500', '聊城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1466, 1465, '371502', '东昌府区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1467, 1465, '371503', '茌平区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1468, 1465, '371521', '阳谷县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1469, 1465, '371522', '莘县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1470, 1465, '371524', '东阿县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1471, 1465, '371525', '冠县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1472, 1465, '371526', '高唐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1473, 1465, '371581', '临清市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1474, 1338, '371600', '滨州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1475, 1474, '371602', '滨城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1476, 1474, '371603', '沾化区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1477, 1474, '371621', '惠民县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1478, 1474, '371622', '阳信县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1479, 1474, '371623', '无棣县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1480, 1474, '371625', '博兴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1481, 1474, '371681', '邹平市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1482, 1338, '371700', '菏泽市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1483, 1482, '371702', '牡丹区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1484, 1482, '371703', '定陶区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1485, 1482, '371721', '曹县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1486, 1482, '371722', '单县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1487, 1482, '371723', '成武县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1488, 1482, '371724', '巨野县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1489, 1482, '371725', '郓城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1490, 1482, '371726', '鄄城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1491, 1482, '371728', '东明县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1492, 0, '410000', '河南省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (1493, 1492, '410100', '郑州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1494, 1493, '410102', '中原区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1495, 1493, '410103', '二七区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1496, 1493, '410104', '管城回族区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1497, 1493, '410105', '金水区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1498, 1493, '410106', '上街区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1499, 1493, '410108', '惠济区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1500, 1493, '410122', '中牟县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1501, 1493, '410181', '巩义市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1502, 1493, '410182', '荥阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1503, 1493, '410183', '新密市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1504, 1493, '410184', '新郑市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1505, 1493, '410185', '登封市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1506, 1492, '410200', '开封市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1507, 1506, '410202', '龙亭区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1508, 1506, '410203', '顺河回族区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1509, 1506, '410204', '鼓楼区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1510, 1506, '410205', '禹王台区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1511, 1506, '410212', '祥符区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1512, 1506, '410221', '杞县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1513, 1506, '410222', '通许县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1514, 1506, '410223', '尉氏县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1515, 1506, '410225', '兰考县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1516, 1492, '410300', '洛阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1517, 1516, '410302', '老城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1518, 1516, '410303', '西工区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1519, 1516, '410304', '瀍河回族区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1520, 1516, '410305', '涧西区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1521, 1516, '410306', '吉利区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1522, 1516, '410311', '洛龙区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1523, 1516, '410322', '孟津县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1524, 1516, '410323', '新安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1525, 1516, '410324', '栾川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1526, 1516, '410325', '嵩县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1527, 1516, '410326', '汝阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1528, 1516, '410327', '宜阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1529, 1516, '410328', '洛宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1530, 1516, '410329', '伊川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1531, 1516, '410381', '偃师市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1532, 1492, '410400', '平顶山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1533, 1532, '410402', '新华区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1534, 1532, '410403', '卫东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1535, 1532, '410404', '石龙区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1536, 1532, '410411', '湛河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1537, 1532, '410421', '宝丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1538, 1532, '410422', '叶县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1539, 1532, '410423', '鲁山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1540, 1532, '410425', '郏县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1541, 1532, '410481', '舞钢市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1542, 1532, '410482', '汝州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1543, 1492, '410500', '安阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1544, 1543, '410502', '文峰区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1545, 1543, '410503', '北关区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1546, 1543, '410505', '殷都区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1547, 1543, '410506', '龙安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1548, 1543, '410522', '安阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1549, 1543, '410523', '汤阴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1550, 1543, '410526', '滑县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1551, 1543, '410527', '内黄县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1552, 1543, '410581', '林州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1553, 1492, '410600', '鹤壁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1554, 1553, '410602', '鹤山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1555, 1553, '410603', '山城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1556, 1553, '410611', '淇滨区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1557, 1553, '410621', '浚县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1558, 1553, '410622', '淇县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1559, 1492, '410700', '新乡市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1560, 1559, '410702', '红旗区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1561, 1559, '410703', '卫滨区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1562, 1559, '410704', '凤泉区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1563, 1559, '410711', '牧野区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1564, 1559, '410721', '新乡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1565, 1559, '410724', '获嘉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1566, 1559, '410725', '原阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1567, 1559, '410726', '延津县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1568, 1559, '410727', '封丘县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1569, 1559, '410781', '卫辉市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1570, 1559, '410782', '辉县市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1571, 1559, '410783', '长垣市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1572, 1492, '410800', '焦作市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1573, 1572, '410802', '解放区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1574, 1572, '410803', '中站区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1575, 1572, '410804', '马村区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1576, 1572, '410811', '山阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1577, 1572, '410821', '修武县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1578, 1572, '410822', '博爱县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1579, 1572, '410823', '武陟县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1580, 1572, '410825', '温县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1581, 1572, '410882', '沁阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1582, 1572, '410883', '孟州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1583, 1492, '410900', '濮阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1584, 1583, '410902', '华龙区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1585, 1583, '410922', '清丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1586, 1583, '410923', '南乐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1587, 1583, '410926', '范县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1588, 1583, '410927', '台前县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1589, 1583, '410928', '濮阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1590, 1492, '411000', '许昌市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1591, 1590, '411002', '魏都区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1592, 1590, '411003', '建安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1593, 1590, '411024', '鄢陵县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1594, 1590, '411025', '襄城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1595, 1590, '411081', '禹州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1596, 1590, '411082', '长葛市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1597, 1492, '411100', '漯河市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1598, 1597, '411102', '源汇区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1599, 1597, '411103', '郾城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1600, 1597, '411104', '召陵区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1601, 1597, '411121', '舞阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1602, 1597, '411122', '临颍县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1603, 1492, '411200', '三门峡市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1604, 1603, '411202', '湖滨区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1605, 1603, '411203', '陕州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1606, 1603, '411221', '渑池县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1607, 1603, '411224', '卢氏县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1608, 1603, '411281', '义马市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1609, 1603, '411282', '灵宝市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1610, 1492, '411300', '南阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1611, 1610, '411302', '宛城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1612, 1610, '411303', '卧龙区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1613, 1610, '411321', '南召县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1614, 1610, '411322', '方城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1615, 1610, '411323', '西峡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1616, 1610, '411324', '镇平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1617, 1610, '411325', '内乡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1618, 1610, '411326', '淅川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1619, 1610, '411327', '社旗县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1620, 1610, '411328', '唐河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1621, 1610, '411329', '新野县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1622, 1610, '411330', '桐柏县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1623, 1610, '411381', '邓州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1624, 1492, '411400', '商丘市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1625, 1624, '411402', '梁园区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1626, 1624, '411403', '睢阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1627, 1624, '411421', '民权县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1628, 1624, '411422', '睢县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1629, 1624, '411423', '宁陵县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1630, 1624, '411424', '柘城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1631, 1624, '411425', '虞城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1632, 1624, '411426', '夏邑县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1633, 1624, '411481', '永城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1634, 1492, '411500', '信阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1635, 1634, '411502', '浉河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1636, 1634, '411503', '平桥区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1637, 1634, '411521', '罗山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1638, 1634, '411522', '光山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1639, 1634, '411523', '新县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1640, 1634, '411524', '商城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1641, 1634, '411525', '固始县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1642, 1634, '411526', '潢川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1643, 1634, '411527', '淮滨县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1644, 1634, '411528', '息县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1645, 1492, '411600', '周口市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1646, 1645, '411602', '川汇区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1647, 1645, '411603', '淮阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1648, 1645, '411621', '扶沟县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1649, 1645, '411622', '西华县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1650, 1645, '411623', '商水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1651, 1645, '411624', '沈丘县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1652, 1645, '411625', '郸城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1653, 1645, '411627', '太康县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1654, 1645, '411628', '鹿邑县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1655, 1645, '411681', '项城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1656, 1492, '411700', '驻马店市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1657, 1656, '411702', '驿城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1658, 1656, '411721', '西平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1659, 1656, '411722', '上蔡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1660, 1656, '411723', '平舆县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1661, 1656, '411724', '正阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1662, 1656, '411725', '确山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1663, 1656, '411726', '泌阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1664, 1656, '411727', '汝南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1665, 1656, '411728', '遂平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1666, 1656, '411729', '新蔡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1667, 1492, '419001', '济源市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1668, 0, '420000', '湖北省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (1669, 1668, '420100', '武汉市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1670, 1669, '420102', '江岸区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1671, 1669, '420103', '江汉区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1672, 1669, '420104', '硚口区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1673, 1669, '420105', '汉阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1674, 1669, '420106', '武昌区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1675, 1669, '420107', '青山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1676, 1669, '420111', '洪山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1677, 1669, '420112', '东西湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1678, 1669, '420113', '汉南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1679, 1669, '420114', '蔡甸区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1680, 1669, '420115', '江夏区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1681, 1669, '420116', '黄陂区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1682, 1669, '420117', '新洲区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1683, 1668, '420200', '黄石市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1684, 1683, '420202', '黄石港区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1685, 1683, '420203', '西塞山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1686, 1683, '420204', '下陆区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1687, 1683, '420205', '铁山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1688, 1683, '420222', '阳新县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1689, 1683, '420281', '大冶市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1690, 1668, '420300', '十堰市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1691, 1690, '420302', '茅箭区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1692, 1690, '420303', '张湾区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1693, 1690, '420304', '郧阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1694, 1690, '420322', '郧西县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1695, 1690, '420323', '竹山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1696, 1690, '420324', '竹溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1697, 1690, '420325', '房县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1698, 1690, '420381', '丹江口市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1699, 1668, '420500', '宜昌市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1700, 1699, '420502', '西陵区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1701, 1699, '420503', '伍家岗区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1702, 1699, '420504', '点军区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1703, 1699, '420505', '猇亭区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1704, 1699, '420506', '夷陵区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1705, 1699, '420525', '远安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1706, 1699, '420526', '兴山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1707, 1699, '420527', '秭归县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1708, 1699, '420528', '长阳土家族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1709, 1699, '420529', '五峰土家族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1710, 1699, '420581', '宜都市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1711, 1699, '420582', '当阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1712, 1699, '420583', '枝江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1713, 1668, '420600', '襄阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1714, 1713, '420602', '襄城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1715, 1713, '420606', '樊城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1716, 1713, '420607', '襄州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1717, 1713, '420624', '南漳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1718, 1713, '420625', '谷城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1719, 1713, '420626', '保康县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1720, 1713, '420682', '老河口市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1721, 1713, '420683', '枣阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1722, 1713, '420684', '宜城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1723, 1668, '420700', '鄂州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1724, 1723, '420702', '梁子湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1725, 1723, '420703', '华容区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1726, 1723, '420704', '鄂城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1727, 1668, '420800', '荆门市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1728, 1727, '420802', '东宝区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1729, 1727, '420804', '掇刀区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1730, 1727, '420822', '沙洋县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1731, 1727, '420881', '钟祥市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1732, 1727, '420882', '京山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1733, 1668, '420900', '孝感市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1734, 1733, '420902', '孝南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1735, 1733, '420921', '孝昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1736, 1733, '420922', '大悟县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1737, 1733, '420923', '云梦县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1738, 1733, '420981', '应城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1739, 1733, '420982', '安陆市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1740, 1733, '420984', '汉川市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1741, 1668, '421000', '荆州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1742, 1741, '421002', '沙市区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1743, 1741, '421003', '荆州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1744, 1741, '421022', '公安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1745, 1741, '421023', '监利县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1746, 1741, '421024', '江陵县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1747, 1741, '421081', '石首市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1748, 1741, '421083', '洪湖市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1749, 1741, '421087', '松滋市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1750, 1668, '421100', '黄冈市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1751, 1750, '421102', '黄州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1752, 1750, '421121', '团风县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1753, 1750, '421122', '红安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1754, 1750, '421123', '罗田县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1755, 1750, '421124', '英山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1756, 1750, '421125', '浠水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1757, 1750, '421126', '蕲春县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1758, 1750, '421127', '黄梅县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1759, 1750, '421181', '麻城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1760, 1750, '421182', '武穴市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1761, 1668, '421200', '咸宁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1762, 1761, '421202', '咸安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1763, 1761, '421221', '嘉鱼县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1764, 1761, '421222', '通城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1765, 1761, '421223', '崇阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1766, 1761, '421224', '通山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1767, 1761, '421281', '赤壁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1768, 1668, '421300', '随州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1769, 1768, '421303', '曾都区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1770, 1768, '421321', '随县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1771, 1768, '421381', '广水市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1772, 1668, '422800', '恩施土家族苗族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1773, 1772, '422801', '恩施市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1774, 1772, '422802', '利川市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1775, 1772, '422822', '建始县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1776, 1772, '422823', '巴东县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1777, 1772, '422825', '宣恩县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1778, 1772, '422826', '咸丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1779, 1772, '422827', '来凤县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1780, 1772, '422828', '鹤峰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1781, 1668, '429004', '仙桃市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1782, 1668, '429005', '潜江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1783, 1668, '429006', '天门市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1784, 1668, '429021', '神农架林区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1785, 0, '430000', '湖南省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (1786, 1785, '430100', '长沙市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1787, 1786, '430102', '芙蓉区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1788, 1786, '430103', '天心区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1789, 1786, '430104', '岳麓区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1790, 1786, '430105', '开福区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1791, 1786, '430111', '雨花区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1792, 1786, '430112', '望城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1793, 1786, '430121', '长沙县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1794, 1786, '430181', '浏阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1795, 1786, '430182', '宁乡市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1796, 1785, '430200', '株洲市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1797, 1796, '430202', '荷塘区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1798, 1796, '430203', '芦淞区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1799, 1796, '430204', '石峰区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1800, 1796, '430211', '天元区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1801, 1796, '430212', '渌口区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1802, 1796, '430223', '攸县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1803, 1796, '430224', '茶陵县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1804, 1796, '430225', '炎陵县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1805, 1796, '430281', '醴陵市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1806, 1785, '430300', '湘潭市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1807, 1806, '430302', '雨湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1808, 1806, '430304', '岳塘区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1809, 1806, '430321', '湘潭县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1810, 1806, '430381', '湘乡市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1811, 1806, '430382', '韶山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1812, 1785, '430400', '衡阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1813, 1812, '430405', '珠晖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1814, 1812, '430406', '雁峰区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1815, 1812, '430407', '石鼓区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1816, 1812, '430408', '蒸湘区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1817, 1812, '430412', '南岳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1818, 1812, '430421', '衡阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1819, 1812, '430422', '衡南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1820, 1812, '430423', '衡山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1821, 1812, '430424', '衡东县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1822, 1812, '430426', '祁东县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1823, 1812, '430481', '耒阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1824, 1812, '430482', '常宁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1825, 1785, '430500', '邵阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1826, 1825, '430502', '双清区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1827, 1825, '430503', '大祥区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1828, 1825, '430511', '北塔区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1829, 1825, '430522', '新邵县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1830, 1825, '430523', '邵阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1831, 1825, '430524', '隆回县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1832, 1825, '430525', '洞口县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1833, 1825, '430527', '绥宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1834, 1825, '430528', '新宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1835, 1825, '430529', '城步苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1836, 1825, '430581', '武冈市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1837, 1825, '430582', '邵东市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1838, 1785, '430600', '岳阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1839, 1838, '430602', '岳阳楼区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1840, 1838, '430603', '云溪区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1841, 1838, '430611', '君山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1842, 1838, '430621', '岳阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1843, 1838, '430623', '华容县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1844, 1838, '430624', '湘阴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1845, 1838, '430626', '平江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1846, 1838, '430681', '汨罗市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1847, 1838, '430682', '临湘市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1848, 1785, '430700', '常德市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1849, 1848, '430702', '武陵区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1850, 1848, '430703', '鼎城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1851, 1848, '430721', '安乡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1852, 1848, '430722', '汉寿县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1853, 1848, '430723', '澧县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1854, 1848, '430724', '临澧县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1855, 1848, '430725', '桃源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1856, 1848, '430726', '石门县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1857, 1848, '430781', '津市市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1858, 1785, '430800', '张家界市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1859, 1858, '430802', '永定区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1860, 1858, '430811', '武陵源区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1861, 1858, '430821', '慈利县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1862, 1858, '430822', '桑植县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1863, 1785, '430900', '益阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1864, 1863, '430902', '资阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1865, 1863, '430903', '赫山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1866, 1863, '430921', '南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1867, 1863, '430922', '桃江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1868, 1863, '430923', '安化县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1869, 1863, '430981', '沅江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1870, 1785, '431000', '郴州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1871, 1870, '431002', '北湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1872, 1870, '431003', '苏仙区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1873, 1870, '431021', '桂阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1874, 1870, '431022', '宜章县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1875, 1870, '431023', '永兴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1876, 1870, '431024', '嘉禾县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1877, 1870, '431025', '临武县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1878, 1870, '431026', '汝城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1879, 1870, '431027', '桂东县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1880, 1870, '431028', '安仁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1881, 1870, '431081', '资兴市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1882, 1785, '431100', '永州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1883, 1882, '431102', '零陵区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1884, 1882, '431103', '冷水滩区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1885, 1882, '431121', '祁阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1886, 1882, '431122', '东安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1887, 1882, '431123', '双牌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1888, 1882, '431124', '道县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1889, 1882, '431125', '江永县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1890, 1882, '431126', '宁远县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1891, 1882, '431127', '蓝山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1892, 1882, '431128', '新田县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1893, 1882, '431129', '江华瑶族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1894, 1785, '431200', '怀化市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1895, 1894, '431202', '鹤城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1896, 1894, '431221', '中方县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1897, 1894, '431222', '沅陵县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1898, 1894, '431223', '辰溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1899, 1894, '431224', '溆浦县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1900, 1894, '431225', '会同县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1901, 1894, '431226', '麻阳苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1902, 1894, '431227', '新晃侗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1903, 1894, '431228', '芷江侗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1904, 1894, '431229', '靖州苗族侗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1905, 1894, '431230', '通道侗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1906, 1894, '431281', '洪江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1907, 1785, '431300', '娄底市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1908, 1907, '431302', '娄星区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1909, 1907, '431321', '双峰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1910, 1907, '431322', '新化县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1911, 1907, '431381', '冷水江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1912, 1907, '431382', '涟源市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1913, 1785, '433100', '湘西土家族苗族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1914, 1913, '433101', '吉首市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1915, 1913, '433122', '泸溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1916, 1913, '433123', '凤凰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1917, 1913, '433124', '花垣县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1918, 1913, '433125', '保靖县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1919, 1913, '433126', '古丈县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1920, 1913, '433127', '永顺县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1921, 1913, '433130', '龙山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1922, 0, '440000', '广东省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (1923, 1922, '440100', '广州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1924, 1923, '440103', '荔湾区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1925, 1923, '440104', '越秀区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1926, 1923, '440105', '海珠区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1927, 1923, '440106', '天河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1928, 1923, '440111', '白云区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1929, 1923, '440112', '黄埔区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1930, 1923, '440113', '番禺区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1931, 1923, '440114', '花都区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1932, 1923, '440115', '南沙区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1933, 1923, '440117', '从化区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1934, 1923, '440118', '增城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1935, 1922, '440200', '韶关市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1936, 1935, '440203', '武江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1937, 1935, '440204', '浈江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1938, 1935, '440205', '曲江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1939, 1935, '440222', '始兴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1940, 1935, '440224', '仁化县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1941, 1935, '440229', '翁源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1942, 1935, '440232', '乳源瑶族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1943, 1935, '440233', '新丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1944, 1935, '440281', '乐昌市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1945, 1935, '440282', '南雄市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1946, 1922, '440300', '深圳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1947, 1946, '440303', '罗湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1948, 1946, '440304', '福田区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1949, 1946, '440305', '南山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1950, 1946, '440306', '宝安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1951, 1946, '440307', '龙岗区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1952, 1946, '440308', '盐田区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1953, 1946, '440309', '龙华区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1954, 1946, '440310', '坪山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1955, 1946, '440311', '光明区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1956, 1922, '440400', '珠海市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1957, 1956, '440402', '香洲区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1958, 1956, '440403', '斗门区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1959, 1956, '440404', '金湾区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1960, 1922, '440500', '汕头市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1961, 1960, '440507', '龙湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1962, 1960, '440511', '金平区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1963, 1960, '440512', '濠江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1964, 1960, '440513', '潮阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1965, 1960, '440514', '潮南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1966, 1960, '440515', '澄海区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1967, 1960, '440523', '南澳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1968, 1922, '440600', '佛山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1969, 1968, '440604', '禅城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1970, 1968, '440605', '南海区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1971, 1968, '440606', '顺德区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1972, 1968, '440607', '三水区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1973, 1968, '440608', '高明区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1974, 1922, '440700', '江门市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1975, 1974, '440703', '蓬江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1976, 1974, '440704', '江海区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1977, 1974, '440705', '新会区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1978, 1974, '440781', '台山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1979, 1974, '440783', '开平市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1980, 1974, '440784', '鹤山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1981, 1974, '440785', '恩平市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1982, 1922, '440800', '湛江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1983, 1982, '440802', '赤坎区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1984, 1982, '440803', '霞山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1985, 1982, '440804', '坡头区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1986, 1982, '440811', '麻章区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1987, 1982, '440823', '遂溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1988, 1982, '440825', '徐闻县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1989, 1982, '440881', '廉江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1990, 1982, '440882', '雷州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1991, 1982, '440883', '吴川市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1992, 1922, '440900', '茂名市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1993, 1992, '440902', '茂南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1994, 1992, '440904', '电白区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1995, 1992, '440981', '高州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1996, 1992, '440982', '化州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1997, 1992, '440983', '信宜市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (1998, 1922, '441200', '肇庆市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (1999, 1998, '441202', '端州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2000, 1998, '441203', '鼎湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2001, 1998, '441204', '高要区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2002, 1998, '441223', '广宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2003, 1998, '441224', '怀集县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2004, 1998, '441225', '封开县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2005, 1998, '441226', '德庆县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2006, 1998, '441284', '四会市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2007, 1922, '441300', '惠州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2008, 2007, '441302', '惠城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2009, 2007, '441303', '惠阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2010, 2007, '441322', '博罗县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2011, 2007, '441323', '惠东县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2012, 2007, '441324', '龙门县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2013, 1922, '441400', '梅州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2014, 2013, '441402', '梅江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2015, 2013, '441403', '梅县区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2016, 2013, '441422', '大埔县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2017, 2013, '441423', '丰顺县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2018, 2013, '441424', '五华县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2019, 2013, '441426', '平远县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2020, 2013, '441427', '蕉岭县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2021, 2013, '441481', '兴宁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2022, 1922, '441500', '汕尾市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2023, 2022, '441502', '城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2024, 2022, '441521', '海丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2025, 2022, '441523', '陆河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2026, 2022, '441581', '陆丰市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2027, 1922, '441600', '河源市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2028, 2027, '441602', '源城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2029, 2027, '441621', '紫金县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2030, 2027, '441622', '龙川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2031, 2027, '441623', '连平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2032, 2027, '441624', '和平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2033, 2027, '441625', '东源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2034, 1922, '441700', '阳江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2035, 2034, '441702', '江城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2036, 2034, '441704', '阳东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2037, 2034, '441721', '阳西县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2038, 2034, '441781', '阳春市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2039, 1922, '441800', '清远市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2040, 2039, '441802', '清城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2041, 2039, '441803', '清新区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2042, 2039, '441821', '佛冈县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2043, 2039, '441823', '阳山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2044, 2039, '441825', '连山壮族瑶族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2045, 2039, '441826', '连南瑶族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2046, 2039, '441881', '英德市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2047, 2039, '441882', '连州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2048, 1922, '441900', '东莞市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2049, 1922, '442000', '中山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2050, 1922, '445100', '潮州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2051, 2050, '445102', '湘桥区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2052, 2050, '445103', '潮安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2053, 2050, '445122', '饶平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2054, 1922, '445200', '揭阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2055, 2054, '445202', '榕城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2056, 2054, '445203', '揭东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2057, 2054, '445222', '揭西县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2058, 2054, '445224', '惠来县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2059, 2054, '445281', '普宁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2060, 1922, '445300', '云浮市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2061, 2060, '445302', '云城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2062, 2060, '445303', '云安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2063, 2060, '445321', '新兴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2064, 2060, '445322', '郁南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2065, 2060, '445381', '罗定市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2066, 0, '450000', '广西壮族自治区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (2067, 2066, '450100', '南宁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2068, 2067, '450102', '兴宁区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2069, 2067, '450103', '青秀区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2070, 2067, '450105', '江南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2071, 2067, '450107', '西乡塘区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2072, 2067, '450108', '良庆区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2073, 2067, '450109', '邕宁区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2074, 2067, '450110', '武鸣区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2075, 2067, '450123', '隆安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2076, 2067, '450124', '马山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2077, 2067, '450125', '上林县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2078, 2067, '450126', '宾阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2079, 2067, '450127', '横县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2080, 2066, '450200', '柳州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2081, 2080, '450202', '城中区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2082, 2080, '450203', '鱼峰区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2083, 2080, '450204', '柳南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2084, 2080, '450205', '柳北区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2085, 2080, '450206', '柳江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2086, 2080, '450222', '柳城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2087, 2080, '450223', '鹿寨县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2088, 2080, '450224', '融安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2089, 2080, '450225', '融水苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2090, 2080, '450226', '三江侗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2091, 2066, '450300', '桂林市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2092, 2091, '450302', '秀峰区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2093, 2091, '450303', '叠彩区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2094, 2091, '450304', '象山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2095, 2091, '450305', '七星区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2096, 2091, '450311', '雁山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2097, 2091, '450312', '临桂区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2098, 2091, '450321', '阳朔县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2099, 2091, '450323', '灵川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2100, 2091, '450324', '全州县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2101, 2091, '450325', '兴安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2102, 2091, '450326', '永福县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2103, 2091, '450327', '灌阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2104, 2091, '450328', '龙胜各族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2105, 2091, '450329', '资源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2106, 2091, '450330', '平乐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2107, 2091, '450381', '荔浦市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2108, 2091, '450332', '恭城瑶族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2109, 2066, '450400', '梧州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2110, 2109, '450403', '万秀区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2111, 2109, '450405', '长洲区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2112, 2109, '450406', '龙圩区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2113, 2109, '450421', '苍梧县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2114, 2109, '450422', '藤县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2115, 2109, '450423', '蒙山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2116, 2109, '450481', '岑溪市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2117, 2066, '450500', '北海市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2118, 2117, '450502', '海城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2119, 2117, '450503', '银海区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2120, 2117, '450512', '铁山港区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2121, 2117, '450521', '合浦县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2122, 2066, '450600', '防城港市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2123, 2122, '450602', '港口区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2124, 2122, '450603', '防城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2125, 2122, '450621', '上思县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2126, 2122, '450681', '东兴市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2127, 2066, '450700', '钦州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2128, 2127, '450702', '钦南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2129, 2127, '450703', '钦北区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2130, 2127, '450721', '灵山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2131, 2127, '450722', '浦北县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2132, 2066, '450800', '贵港市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2133, 2132, '450802', '港北区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2134, 2132, '450803', '港南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2135, 2132, '450804', '覃塘区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2136, 2132, '450821', '平南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2137, 2132, '450881', '桂平市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2138, 2066, '450900', '玉林市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2139, 2138, '450902', '玉州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2140, 2138, '450903', '福绵区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2141, 2138, '450921', '容县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2142, 2138, '450922', '陆川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2143, 2138, '450923', '博白县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2144, 2138, '450924', '兴业县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2145, 2138, '450981', '北流市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2146, 2066, '451000', '百色市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2147, 2146, '451002', '右江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2148, 2146, '451003', '田阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2149, 2146, '451022', '田东县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2150, 2146, '451024', '德保县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2151, 2146, '451026', '那坡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2152, 2146, '451027', '凌云县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2153, 2146, '451028', '乐业县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2154, 2146, '451029', '田林县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2155, 2146, '451030', '西林县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2156, 2146, '451031', '隆林各族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2157, 2146, '451081', '靖西市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2158, 2146, '451082', '平果市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2159, 2066, '451100', '贺州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2160, 2159, '451102', '八步区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2161, 2159, '451103', '平桂区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2162, 2159, '451121', '昭平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2163, 2159, '451122', '钟山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2164, 2159, '451123', '富川瑶族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2165, 2066, '451200', '河池市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2166, 2165, '451202', '金城江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2167, 2165, '451203', '宜州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2168, 2165, '451221', '南丹县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2169, 2165, '451222', '天峨县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2170, 2165, '451223', '凤山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2171, 2165, '451224', '东兰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2172, 2165, '451225', '罗城仫佬族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2173, 2165, '451226', '环江毛南族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2174, 2165, '451227', '巴马瑶族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2175, 2165, '451228', '都安瑶族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2176, 2165, '451229', '大化瑶族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2177, 2066, '451300', '来宾市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2178, 2177, '451302', '兴宾区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2179, 2177, '451321', '忻城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2180, 2177, '451322', '象州县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2181, 2177, '451323', '武宣县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2182, 2177, '451324', '金秀瑶族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2183, 2177, '451381', '合山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2184, 2066, '451400', '崇左市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2185, 2184, '451402', '江州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2186, 2184, '451421', '扶绥县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2187, 2184, '451422', '宁明县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2188, 2184, '451423', '龙州县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2189, 2184, '451424', '大新县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2190, 2184, '451425', '天等县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2191, 2184, '451481', '凭祥市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2192, 0, '460000', '海南省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (2193, 2192, '460100', '海口市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2194, 2193, '460105', '秀英区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2195, 2193, '460106', '龙华区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2196, 2193, '460107', '琼山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2197, 2193, '460108', '美兰区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2198, 2192, '460200', '三亚市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2199, 2198, '460202', '海棠区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2200, 2198, '460203', '吉阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2201, 2198, '460204', '天涯区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2202, 2198, '460205', '崖州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2203, 2192, '460300', '三沙市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2204, 2192, '460400', '儋州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2205, 2192, '469001', '五指山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2206, 2192, '469002', '琼海市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2207, 2192, '469005', '文昌市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2208, 2192, '469006', '万宁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2209, 2192, '469007', '东方市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2210, 2192, '469021', '定安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2211, 2192, '469022', '屯昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2212, 2192, '469023', '澄迈县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2213, 2192, '469024', '临高县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2214, 2192, '469025', '白沙黎族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2215, 2192, '469026', '昌江黎族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2216, 2192, '469027', '乐东黎族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2217, 2192, '469028', '陵水黎族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2218, 2192, '469029', '保亭黎族苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2219, 2192, '469030', '琼中黎族苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2220, 0, '500000', '重庆', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (2221, 3219, '500101', '万州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2222, 3219, '500102', '涪陵区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2223, 3219, '500103', '渝中区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2224, 3219, '500104', '大渡口区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2225, 3219, '500105', '江北区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2226, 3219, '500106', '沙坪坝区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2227, 3219, '500107', '九龙坡区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2228, 3219, '500108', '南岸区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2229, 3219, '500109', '北碚区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2230, 3219, '500110', '綦江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2231, 3219, '500111', '大足区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2232, 3219, '500112', '渝北区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2233, 3219, '500113', '巴南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2234, 3219, '500114', '黔江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2235, 3219, '500115', '长寿区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2236, 3219, '500116', '江津区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2237, 3219, '500117', '合川区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2238, 3219, '500118', '永川区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2239, 3219, '500119', '南川区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2240, 3219, '500120', '璧山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2241, 3219, '500151', '铜梁区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2242, 3219, '500152', '潼南区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2243, 3219, '500153', '荣昌区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2244, 3219, '500154', '开州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2245, 3219, '500155', '梁平区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2246, 3219, '500156', '武隆区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2247, 3219, '500229', '城口县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2248, 3219, '500230', '丰都县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2249, 3219, '500231', '垫江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2250, 3219, '500233', '忠县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2251, 3219, '500235', '云阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2252, 3219, '500236', '奉节县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2253, 3219, '500237', '巫山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2254, 3219, '500238', '巫溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2255, 3219, '500240', '石柱土家族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2256, 3219, '500241', '秀山土家族苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2257, 3219, '500242', '酉阳土家族苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2258, 3219, '500243', '彭水苗族土家族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2259, 0, '510000', '四川省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (2260, 2259, '510100', '成都市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2261, 2260, '510104', '锦江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2262, 2260, '510105', '青羊区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2263, 2260, '510106', '金牛区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2264, 2260, '510107', '武侯区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2265, 2260, '510108', '成华区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2266, 2260, '510112', '龙泉驿区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2267, 2260, '510113', '青白江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2268, 2260, '510114', '新都区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2269, 2260, '510115', '温江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2270, 2260, '510116', '双流区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2271, 2260, '510117', '郫都区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2272, 2260, '510121', '金堂县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2273, 2260, '510129', '大邑县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2274, 2260, '510131', '蒲江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2275, 2260, '510132', '新津县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2276, 2260, '510181', '都江堰市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2277, 2260, '510182', '彭州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2278, 2260, '510183', '邛崃市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2279, 2260, '510184', '崇州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2280, 2260, '510185', '简阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2281, 2259, '510300', '自贡市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2282, 2281, '510302', '自流井区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2283, 2281, '510303', '贡井区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2284, 2281, '510304', '大安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2285, 2281, '510311', '沿滩区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2286, 2281, '510321', '荣县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2287, 2281, '510322', '富顺县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2288, 2259, '510400', '攀枝花市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2289, 2288, '510402', '东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2290, 2288, '510403', '西区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2291, 2288, '510411', '仁和区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2292, 2288, '510421', '米易县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2293, 2288, '510422', '盐边县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2294, 2259, '510500', '泸州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2295, 2294, '510502', '江阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2296, 2294, '510503', '纳溪区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2297, 2294, '510504', '龙马潭区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2298, 2294, '510521', '泸县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2299, 2294, '510522', '合江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2300, 2294, '510524', '叙永县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2301, 2294, '510525', '古蔺县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2302, 2259, '510600', '德阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2303, 2302, '510603', '旌阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2304, 2302, '510604', '罗江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2305, 2302, '510623', '中江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2306, 2302, '510681', '广汉市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2307, 2302, '510682', '什邡市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2308, 2302, '510683', '绵竹市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2309, 2259, '510700', '绵阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2310, 2309, '510703', '涪城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2311, 2309, '510704', '游仙区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2312, 2309, '510705', '安州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2313, 2309, '510722', '三台县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2314, 2309, '510723', '盐亭县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2315, 2309, '510725', '梓潼县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2316, 2309, '510726', '北川羌族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2317, 2309, '510727', '平武县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2318, 2309, '510781', '江油市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2319, 2259, '510800', '广元市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2320, 2319, '510802', '利州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2321, 2319, '510811', '昭化区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2322, 2319, '510812', '朝天区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2323, 2319, '510821', '旺苍县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2324, 2319, '510822', '青川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2325, 2319, '510823', '剑阁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2326, 2319, '510824', '苍溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2327, 2259, '510900', '遂宁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2328, 2327, '510903', '船山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2329, 2327, '510904', '安居区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2330, 2327, '510921', '蓬溪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2331, 2327, '510923', '大英县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2332, 2327, '510981', '射洪市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2333, 2259, '511000', '内江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2334, 2333, '511002', '市中区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2335, 2333, '511011', '东兴区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2336, 2333, '511024', '威远县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2337, 2333, '511025', '资中县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2338, 2333, '511083', '隆昌市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2339, 2259, '511100', '乐山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2340, 2339, '511102', '市中区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2341, 2339, '511111', '沙湾区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2342, 2339, '511112', '五通桥区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2343, 2339, '511113', '金口河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2344, 2339, '511123', '犍为县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2345, 2339, '511124', '井研县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2346, 2339, '511126', '夹江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2347, 2339, '511129', '沐川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2348, 2339, '511132', '峨边彝族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2349, 2339, '511133', '马边彝族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2350, 2339, '511181', '峨眉山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2351, 2259, '511300', '南充市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2352, 2351, '511302', '顺庆区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2353, 2351, '511303', '高坪区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2354, 2351, '511304', '嘉陵区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2355, 2351, '511321', '南部县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2356, 2351, '511322', '营山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2357, 2351, '511323', '蓬安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2358, 2351, '511324', '仪陇县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2359, 2351, '511325', '西充县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2360, 2351, '511381', '阆中市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2361, 2259, '511400', '眉山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2362, 2361, '511402', '东坡区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2363, 2361, '511403', '彭山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2364, 2361, '511421', '仁寿县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2365, 2361, '511423', '洪雅县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2366, 2361, '511424', '丹棱县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2367, 2361, '511425', '青神县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2368, 2259, '511500', '宜宾市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2369, 2368, '511502', '翠屏区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2370, 2368, '511503', '南溪区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2371, 2368, '511504', '叙州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2372, 2368, '511523', '江安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2373, 2368, '511524', '长宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2374, 2368, '511525', '高县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2375, 2368, '511526', '珙县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2376, 2368, '511527', '筠连县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2377, 2368, '511528', '兴文县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2378, 2368, '511529', '屏山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2379, 2259, '511600', '广安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2380, 2379, '511602', '广安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2381, 2379, '511603', '前锋区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2382, 2379, '511621', '岳池县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2383, 2379, '511622', '武胜县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2384, 2379, '511623', '邻水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2385, 2379, '511681', '华蓥市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2386, 2259, '511700', '达州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2387, 2386, '511702', '通川区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2388, 2386, '511703', '达川区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2389, 2386, '511722', '宣汉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2390, 2386, '511723', '开江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2391, 2386, '511724', '大竹县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2392, 2386, '511725', '渠县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2393, 2386, '511781', '万源市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2394, 2259, '511800', '雅安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2395, 2394, '511802', '雨城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2396, 2394, '511803', '名山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2397, 2394, '511822', '荥经县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2398, 2394, '511823', '汉源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2399, 2394, '511824', '石棉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2400, 2394, '511825', '天全县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2401, 2394, '511826', '芦山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2402, 2394, '511827', '宝兴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2403, 2259, '511900', '巴中市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2404, 2403, '511902', '巴州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2405, 2403, '511903', '恩阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2406, 2403, '511921', '通江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2407, 2403, '511922', '南江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2408, 2403, '511923', '平昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2409, 2259, '512000', '资阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2410, 2409, '512002', '雁江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2411, 2409, '512021', '安岳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2412, 2409, '512022', '乐至县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2413, 2259, '513200', '阿坝藏族羌族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2414, 2413, '513201', '马尔康市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2415, 2413, '513221', '汶川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2416, 2413, '513222', '理县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2417, 2413, '513223', '茂县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2418, 2413, '513224', '松潘县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2419, 2413, '513225', '九寨沟县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2420, 2413, '513226', '金川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2421, 2413, '513227', '小金县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2422, 2413, '513228', '黑水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2423, 2413, '513230', '壤塘县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2424, 2413, '513231', '阿坝县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2425, 2413, '513232', '若尔盖县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2426, 2413, '513233', '红原县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2427, 2259, '513300', '甘孜藏族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2428, 2427, '513301', '康定市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2429, 2427, '513322', '泸定县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2430, 2427, '513323', '丹巴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2431, 2427, '513324', '九龙县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2432, 2427, '513325', '雅江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2433, 2427, '513326', '道孚县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2434, 2427, '513327', '炉霍县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2435, 2427, '513328', '甘孜县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2436, 2427, '513329', '新龙县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2437, 2427, '513330', '德格县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2438, 2427, '513331', '白玉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2439, 2427, '513332', '石渠县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2440, 2427, '513333', '色达县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2441, 2427, '513334', '理塘县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2442, 2427, '513335', '巴塘县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2443, 2427, '513336', '乡城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2444, 2427, '513337', '稻城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2445, 2427, '513338', '得荣县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2446, 2259, '513400', '凉山彝族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2447, 2446, '513401', '西昌市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2448, 2446, '513422', '木里藏族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2449, 2446, '513423', '盐源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2450, 2446, '513424', '德昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2451, 2446, '513425', '会理县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2452, 2446, '513426', '会东县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2453, 2446, '513427', '宁南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2454, 2446, '513428', '普格县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2455, 2446, '513429', '布拖县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2456, 2446, '513430', '金阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2457, 2446, '513431', '昭觉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2458, 2446, '513432', '喜德县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2459, 2446, '513433', '冕宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2460, 2446, '513434', '越西县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2461, 2446, '513435', '甘洛县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2462, 2446, '513436', '美姑县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2463, 2446, '513437', '雷波县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2464, 0, '520000', '贵州省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (2465, 2464, '520100', '贵阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2466, 2465, '520102', '南明区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2467, 2465, '520103', '云岩区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2468, 2465, '520111', '花溪区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2469, 2465, '520112', '乌当区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2470, 2465, '520113', '白云区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2471, 2465, '520115', '观山湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2472, 2465, '520121', '开阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2473, 2465, '520122', '息烽县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2474, 2465, '520123', '修文县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2475, 2465, '520181', '清镇市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2476, 2464, '520200', '六盘水市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2477, 2476, '520201', '钟山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2478, 2476, '520203', '六枝特区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2479, 2476, '520221', '水城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2480, 2476, '520281', '盘州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2481, 2464, '520300', '遵义市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2482, 2481, '520302', '红花岗区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2483, 2481, '520303', '汇川区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2484, 2481, '520304', '播州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2485, 2481, '520322', '桐梓县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2486, 2481, '520323', '绥阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2487, 2481, '520324', '正安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2488, 2481, '520325', '道真仡佬族苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2489, 2481, '520326', '务川仡佬族苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2490, 2481, '520327', '凤冈县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2491, 2481, '520328', '湄潭县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2492, 2481, '520329', '余庆县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2493, 2481, '520330', '习水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2494, 2481, '520381', '赤水市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2495, 2481, '520382', '仁怀市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2496, 2464, '520400', '安顺市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2497, 2496, '520402', '西秀区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2498, 2496, '520403', '平坝区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2499, 2496, '520422', '普定县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2500, 2496, '520423', '镇宁布依族苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2501, 2496, '520424', '关岭布依族苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2502, 2496, '520425', '紫云苗族布依族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2503, 2464, '520500', '毕节市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2504, 2503, '520502', '七星关区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2505, 2503, '520521', '大方县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2506, 2503, '520522', '黔西县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2507, 2503, '520523', '金沙县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2508, 2503, '520524', '织金县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2509, 2503, '520525', '纳雍县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2510, 2503, '520526', '威宁彝族回族苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2511, 2503, '520527', '赫章县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2512, 2464, '520600', '铜仁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2513, 2512, '520602', '碧江区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2514, 2512, '520603', '万山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2515, 2512, '520621', '江口县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2516, 2512, '520622', '玉屏侗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2517, 2512, '520623', '石阡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2518, 2512, '520624', '思南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2519, 2512, '520625', '印江土家族苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2520, 2512, '520626', '德江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2521, 2512, '520627', '沿河土家族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2522, 2512, '520628', '松桃苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2523, 2464, '522300', '黔西南布依族苗族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2524, 2523, '522301', '兴义市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2525, 2523, '522302', '兴仁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2526, 2523, '522323', '普安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2527, 2523, '522324', '晴隆县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2528, 2523, '522325', '贞丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2529, 2523, '522326', '望谟县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2530, 2523, '522327', '册亨县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2531, 2523, '522328', '安龙县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2532, 2464, '522600', '黔东南苗族侗族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2533, 2532, '522601', '凯里市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2534, 2532, '522622', '黄平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2535, 2532, '522623', '施秉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2536, 2532, '522624', '三穗县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2537, 2532, '522625', '镇远县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2538, 2532, '522626', '岑巩县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2539, 2532, '522627', '天柱县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2540, 2532, '522628', '锦屏县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2541, 2532, '522629', '剑河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2542, 2532, '522630', '台江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2543, 2532, '522631', '黎平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2544, 2532, '522632', '榕江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2545, 2532, '522633', '从江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2546, 2532, '522634', '雷山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2547, 2532, '522635', '麻江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2548, 2532, '522636', '丹寨县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2549, 2464, '522700', '黔南布依族苗族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2550, 2549, '522701', '都匀市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2551, 2549, '522702', '福泉市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2552, 2549, '522722', '荔波县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2553, 2549, '522723', '贵定县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2554, 2549, '522725', '瓮安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2555, 2549, '522726', '独山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2556, 2549, '522727', '平塘县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2557, 2549, '522728', '罗甸县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2558, 2549, '522729', '长顺县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2559, 2549, '522730', '龙里县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2560, 2549, '522731', '惠水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2561, 2549, '522732', '三都水族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2562, 0, '530000', '云南省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (2563, 2562, '530100', '昆明市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2564, 2563, '530102', '五华区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2565, 2563, '530103', '盘龙区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2566, 2563, '530111', '官渡区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2567, 2563, '530112', '西山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2568, 2563, '530113', '东川区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2569, 2563, '530114', '呈贡区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2570, 2563, '530115', '晋宁区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2571, 2563, '530124', '富民县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2572, 2563, '530125', '宜良县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2573, 2563, '530126', '石林彝族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2574, 2563, '530127', '嵩明县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2575, 2563, '530128', '禄劝彝族苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2576, 2563, '530129', '寻甸回族彝族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2577, 2563, '530181', '安宁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2578, 2562, '530300', '曲靖市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2579, 2578, '530302', '麒麟区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2580, 2578, '530303', '沾益区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2581, 2578, '530304', '马龙区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2582, 2578, '530322', '陆良县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2583, 2578, '530323', '师宗县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2584, 2578, '530324', '罗平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2585, 2578, '530325', '富源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2586, 2578, '530326', '会泽县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2587, 2578, '530381', '宣威市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2588, 2562, '530400', '玉溪市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2589, 2588, '530402', '红塔区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2590, 2588, '530403', '江川区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2591, 2588, '530423', '通海县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2592, 2588, '530424', '华宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2593, 2588, '530425', '易门县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2594, 2588, '530426', '峨山彝族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2595, 2588, '530427', '新平彝族傣族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2596, 2588, '530428', '元江哈尼族彝族傣族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2597, 2588, '530481', '澄江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2598, 2562, '530500', '保山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2599, 2598, '530502', '隆阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2600, 2598, '530521', '施甸县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2601, 2598, '530523', '龙陵县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2602, 2598, '530524', '昌宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2603, 2598, '530581', '腾冲市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2604, 2562, '530600', '昭通市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2605, 2604, '530602', '昭阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2606, 2604, '530621', '鲁甸县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2607, 2604, '530622', '巧家县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2608, 2604, '530623', '盐津县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2609, 2604, '530624', '大关县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2610, 2604, '530625', '永善县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2611, 2604, '530626', '绥江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2612, 2604, '530627', '镇雄县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2613, 2604, '530628', '彝良县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2614, 2604, '530629', '威信县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2615, 2604, '530681', '水富市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2616, 2562, '530700', '丽江市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2617, 2616, '530702', '古城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2618, 2616, '530721', '玉龙纳西族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2619, 2616, '530722', '永胜县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2620, 2616, '530723', '华坪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2621, 2616, '530724', '宁蒗彝族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2622, 2562, '530800', '普洱市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2623, 2622, '530802', '思茅区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2624, 2622, '530821', '宁洱哈尼族彝族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2625, 2622, '530822', '墨江哈尼族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2626, 2622, '530823', '景东彝族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2627, 2622, '530824', '景谷傣族彝族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2628, 2622, '530825', '镇沅彝族哈尼族拉祜族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2629, 2622, '530826', '江城哈尼族彝族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2630, 2622, '530827', '孟连傣族拉祜族佤族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2631, 2622, '530828', '澜沧拉祜族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2632, 2622, '530829', '西盟佤族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2633, 2562, '530900', '临沧市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2634, 2633, '530902', '临翔区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2635, 2633, '530921', '凤庆县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2636, 2633, '530922', '云县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2637, 2633, '530923', '永德县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2638, 2633, '530924', '镇康县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2639, 2633, '530925', '双江拉祜族佤族布朗族傣族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2640, 2633, '530926', '耿马傣族佤族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2641, 2633, '530927', '沧源佤族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2642, 2562, '532300', '楚雄彝族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2643, 2642, '532301', '楚雄市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2644, 2642, '532322', '双柏县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2645, 2642, '532323', '牟定县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2646, 2642, '532324', '南华县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2647, 2642, '532325', '姚安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2648, 2642, '532326', '大姚县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2649, 2642, '532327', '永仁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2650, 2642, '532328', '元谋县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2651, 2642, '532329', '武定县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2652, 2642, '532331', '禄丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2653, 2562, '532500', '红河哈尼族彝族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2654, 2653, '532501', '个旧市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2655, 2653, '532502', '开远市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2656, 2653, '532503', '蒙自市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2657, 2653, '532504', '弥勒市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2658, 2653, '532523', '屏边苗族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2659, 2653, '532524', '建水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2660, 2653, '532525', '石屏县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2661, 2653, '532527', '泸西县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2662, 2653, '532528', '元阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2663, 2653, '532529', '红河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2664, 2653, '532530', '金平苗族瑶族傣族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2665, 2653, '532531', '绿春县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2666, 2653, '532532', '河口瑶族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2667, 2562, '532600', '文山壮族苗族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2668, 2667, '532601', '文山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2669, 2667, '532622', '砚山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2670, 2667, '532623', '西畴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2671, 2667, '532624', '麻栗坡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2672, 2667, '532625', '马关县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2673, 2667, '532626', '丘北县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2674, 2667, '532627', '广南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2675, 2667, '532628', '富宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2676, 2562, '532800', '西双版纳傣族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2677, 2676, '532801', '景洪市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2678, 2676, '532822', '勐海县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2679, 2676, '532823', '勐腊县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2680, 2562, '532900', '大理白族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2681, 2680, '532901', '大理市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2682, 2680, '532922', '漾濞彝族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2683, 2680, '532923', '祥云县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2684, 2680, '532924', '宾川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2685, 2680, '532925', '弥渡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2686, 2680, '532926', '南涧彝族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2687, 2680, '532927', '巍山彝族回族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2688, 2680, '532928', '永平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2689, 2680, '532929', '云龙县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2690, 2680, '532930', '洱源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2691, 2680, '532931', '剑川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2692, 2680, '532932', '鹤庆县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2693, 2562, '533100', '德宏傣族景颇族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2694, 2693, '533102', '瑞丽市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2695, 2693, '533103', '芒市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2696, 2693, '533122', '梁河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2697, 2693, '533123', '盈江县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2698, 2693, '533124', '陇川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2699, 2562, '533300', '怒江傈僳族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2700, 2699, '533301', '泸水市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2701, 2699, '533323', '福贡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2702, 2699, '533324', '贡山独龙族怒族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2703, 2699, '533325', '兰坪白族普米族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2704, 2562, '533400', '迪庆藏族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2705, 2704, '533401', '香格里拉市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2706, 2704, '533422', '德钦县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2707, 2704, '533423', '维西傈僳族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2708, 0, '540000', '西藏自治区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (2709, 2708, '540100', '拉萨市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2710, 2709, '540102', '城关区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2711, 2709, '540103', '堆龙德庆区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2712, 2709, '540104', '达孜区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2713, 2709, '540121', '林周县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2714, 2709, '540122', '当雄县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2715, 2709, '540123', '尼木县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2716, 2709, '540124', '曲水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2717, 2709, '540127', '墨竹工卡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2718, 2708, '540200', '日喀则市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2719, 2718, '540202', '桑珠孜区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2720, 2718, '540221', '南木林县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2721, 2718, '540222', '江孜县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2722, 2718, '540223', '定日县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2723, 2718, '540224', '萨迦县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2724, 2718, '540225', '拉孜县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2725, 2718, '540226', '昂仁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2726, 2718, '540227', '谢通门县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2727, 2718, '540228', '白朗县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2728, 2718, '540229', '仁布县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2729, 2718, '540230', '康马县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2730, 2718, '540231', '定结县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2731, 2718, '540232', '仲巴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2732, 2718, '540233', '亚东县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2733, 2718, '540234', '吉隆县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2734, 2718, '540235', '聂拉木县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2735, 2718, '540236', '萨嘎县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2736, 2718, '540237', '岗巴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2737, 2708, '540300', '昌都市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2738, 2737, '540302', '卡若区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2739, 2737, '540321', '江达县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2740, 2737, '540322', '贡觉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2741, 2737, '540323', '类乌齐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2742, 2737, '540324', '丁青县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2743, 2737, '540325', '察雅县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2744, 2737, '540326', '八宿县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2745, 2737, '540327', '左贡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2746, 2737, '540328', '芒康县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2747, 2737, '540329', '洛隆县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2748, 2737, '540330', '边坝县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2749, 2708, '540400', '林芝市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2750, 2749, '540402', '巴宜区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2751, 2749, '540421', '工布江达县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2752, 2749, '540422', '米林县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2753, 2749, '540423', '墨脱县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2754, 2749, '540424', '波密县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2755, 2749, '540425', '察隅县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2756, 2749, '540426', '朗县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2757, 2708, '540500', '山南市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2758, 2757, '540502', '乃东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2759, 2757, '540521', '扎囊县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2760, 2757, '540522', '贡嘎县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2761, 2757, '540523', '桑日县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2762, 2757, '540524', '琼结县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2763, 2757, '540525', '曲松县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2764, 2757, '540526', '措美县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2765, 2757, '540527', '洛扎县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2766, 2757, '540528', '加查县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2767, 2757, '540529', '隆子县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2768, 2757, '540530', '错那县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2769, 2757, '540531', '浪卡子县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2770, 2708, '540600', '那曲市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2771, 2770, '540602', '色尼区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2772, 2770, '540621', '嘉黎县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2773, 2770, '540622', '比如县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2774, 2770, '540623', '聂荣县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2775, 2770, '540624', '安多县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2776, 2770, '540625', '申扎县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2777, 2770, '540626', '索县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2778, 2770, '540627', '班戈县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2779, 2770, '540628', '巴青县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2780, 2770, '540629', '尼玛县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2781, 2770, '540630', '双湖县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2782, 2708, '542500', '阿里地区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2783, 2782, '542521', '普兰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2784, 2782, '542522', '札达县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2785, 2782, '542523', '噶尔县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2786, 2782, '542524', '日土县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2787, 2782, '542525', '革吉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2788, 2782, '542526', '改则县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2789, 2782, '542527', '措勤县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2790, 0, '610000', '陕西省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (2791, 2790, '610100', '西安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2792, 2791, '610102', '新城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2793, 2791, '610103', '碑林区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2794, 2791, '610104', '莲湖区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2795, 2791, '610111', '灞桥区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2796, 2791, '610112', '未央区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2797, 2791, '610113', '雁塔区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2798, 2791, '610114', '阎良区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2799, 2791, '610115', '临潼区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2800, 2791, '610116', '长安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2801, 2791, '610117', '高陵区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2802, 2791, '610118', '鄠邑区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2803, 2791, '610122', '蓝田县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2804, 2791, '610124', '周至县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2805, 2790, '610200', '铜川市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2806, 2805, '610202', '王益区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2807, 2805, '610203', '印台区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2808, 2805, '610204', '耀州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2809, 2805, '610222', '宜君县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2810, 2790, '610300', '宝鸡市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2811, 2810, '610302', '渭滨区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2812, 2810, '610303', '金台区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2813, 2810, '610304', '陈仓区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2814, 2810, '610322', '凤翔县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2815, 2810, '610323', '岐山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2816, 2810, '610324', '扶风县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2817, 2810, '610326', '眉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2818, 2810, '610327', '陇县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2819, 2810, '610328', '千阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2820, 2810, '610329', '麟游县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2821, 2810, '610330', '凤县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2822, 2810, '610331', '太白县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2823, 2790, '610400', '咸阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2824, 2823, '610402', '秦都区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2825, 2823, '610403', '杨陵区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2826, 2823, '610404', '渭城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2827, 2823, '610422', '三原县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2828, 2823, '610423', '泾阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2829, 2823, '610424', '乾县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2830, 2823, '610425', '礼泉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2831, 2823, '610426', '永寿县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2832, 2823, '610428', '长武县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2833, 2823, '610429', '旬邑县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2834, 2823, '610430', '淳化县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2835, 2823, '610431', '武功县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2836, 2823, '610481', '兴平市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2837, 2823, '610482', '彬州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2838, 2790, '610500', '渭南市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2839, 2838, '610502', '临渭区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2840, 2838, '610503', '华州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2841, 2838, '610522', '潼关县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2842, 2838, '610523', '大荔县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2843, 2838, '610524', '合阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2844, 2838, '610525', '澄城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2845, 2838, '610526', '蒲城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2846, 2838, '610527', '白水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2847, 2838, '610528', '富平县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2848, 2838, '610581', '韩城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2849, 2838, '610582', '华阴市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2850, 2790, '610600', '延安市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2851, 2850, '610602', '宝塔区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2852, 2850, '610603', '安塞区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2853, 2850, '610621', '延长县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2854, 2850, '610622', '延川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2855, 2850, '610625', '志丹县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2856, 2850, '610626', '吴起县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2857, 2850, '610627', '甘泉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2858, 2850, '610628', '富县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2859, 2850, '610629', '洛川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2860, 2850, '610630', '宜川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2861, 2850, '610631', '黄龙县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2862, 2850, '610632', '黄陵县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2863, 2850, '610681', '子长市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2864, 2790, '610700', '汉中市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2865, 2864, '610702', '汉台区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2866, 2864, '610703', '南郑区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2867, 2864, '610722', '城固县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2868, 2864, '610723', '洋县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2869, 2864, '610724', '西乡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2870, 2864, '610725', '勉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2871, 2864, '610726', '宁强县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2872, 2864, '610727', '略阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2873, 2864, '610728', '镇巴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2874, 2864, '610729', '留坝县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2875, 2864, '610730', '佛坪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2876, 2790, '610800', '榆林市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2877, 2876, '610802', '榆阳区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2878, 2876, '610803', '横山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2879, 2876, '610822', '府谷县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2880, 2876, '610824', '靖边县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2881, 2876, '610825', '定边县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2882, 2876, '610826', '绥德县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2883, 2876, '610827', '米脂县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2884, 2876, '610828', '佳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2885, 2876, '610829', '吴堡县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2886, 2876, '610830', '清涧县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2887, 2876, '610831', '子洲县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2888, 2876, '610881', '神木市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2889, 2790, '610900', '安康市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2890, 2889, '610902', '汉滨区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2891, 2889, '610921', '汉阴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2892, 2889, '610922', '石泉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2893, 2889, '610923', '宁陕县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2894, 2889, '610924', '紫阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2895, 2889, '610925', '岚皋县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2896, 2889, '610926', '平利县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2897, 2889, '610927', '镇坪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2898, 2889, '610928', '旬阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2899, 2889, '610929', '白河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2900, 2790, '611000', '商洛市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2901, 2900, '611002', '商州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2902, 2900, '611021', '洛南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2903, 2900, '611022', '丹凤县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2904, 2900, '611023', '商南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2905, 2900, '611024', '山阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2906, 2900, '611025', '镇安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2907, 2900, '611026', '柞水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2908, 0, '620000', '甘肃省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (2909, 2908, '620100', '兰州市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2910, 2909, '620102', '城关区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2911, 2909, '620103', '七里河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2912, 2909, '620104', '西固区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2913, 2909, '620105', '安宁区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2914, 2909, '620111', '红古区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2915, 2909, '620121', '永登县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2916, 2909, '620122', '皋兰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2917, 2909, '620123', '榆中县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2918, 2908, '620200', '嘉峪关市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2919, 2908, '620300', '金昌市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2920, 2919, '620302', '金川区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2921, 2919, '620321', '永昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2922, 2908, '620400', '白银市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2923, 2922, '620402', '白银区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2924, 2922, '620403', '平川区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2925, 2922, '620421', '靖远县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2926, 2922, '620422', '会宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2927, 2922, '620423', '景泰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2928, 2908, '620500', '天水市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2929, 2928, '620502', '秦州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2930, 2928, '620503', '麦积区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2931, 2928, '620521', '清水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2932, 2928, '620522', '秦安县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2933, 2928, '620523', '甘谷县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2934, 2928, '620524', '武山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2935, 2928, '620525', '张家川回族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2936, 2908, '620600', '武威市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2937, 2936, '620602', '凉州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2938, 2936, '620621', '民勤县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2939, 2936, '620622', '古浪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2940, 2936, '620623', '天祝藏族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2941, 2908, '620700', '张掖市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2942, 2941, '620702', '甘州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2943, 2941, '620721', '肃南裕固族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2944, 2941, '620722', '民乐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2945, 2941, '620723', '临泽县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2946, 2941, '620724', '高台县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2947, 2941, '620725', '山丹县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2948, 2908, '620800', '平凉市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2949, 2948, '620802', '崆峒区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2950, 2948, '620821', '泾川县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2951, 2948, '620822', '灵台县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2952, 2948, '620823', '崇信县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2953, 2948, '620825', '庄浪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2954, 2948, '620826', '静宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2955, 2948, '620881', '华亭市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2956, 2908, '620900', '酒泉市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2957, 2956, '620902', '肃州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2958, 2956, '620921', '金塔县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2959, 2956, '620922', '瓜州县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2960, 2956, '620923', '肃北蒙古族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2961, 2956, '620924', '阿克塞哈萨克族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2962, 2956, '620981', '玉门市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2963, 2956, '620982', '敦煌市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2964, 2908, '621000', '庆阳市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2965, 2964, '621002', '西峰区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2966, 2964, '621021', '庆城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2967, 2964, '621022', '环县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2968, 2964, '621023', '华池县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2969, 2964, '621024', '合水县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2970, 2964, '621025', '正宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2971, 2964, '621026', '宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2972, 2964, '621027', '镇原县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2973, 2908, '621100', '定西市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2974, 2973, '621102', '安定区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2975, 2973, '621121', '通渭县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2976, 2973, '621122', '陇西县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2977, 2973, '621123', '渭源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2978, 2973, '621124', '临洮县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2979, 2973, '621125', '漳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2980, 2973, '621126', '岷县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2981, 2908, '621200', '陇南市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2982, 2981, '621202', '武都区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2983, 2981, '621221', '成县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2984, 2981, '621222', '文县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2985, 2981, '621223', '宕昌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2986, 2981, '621224', '康县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2987, 2981, '621225', '西和县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2988, 2981, '621226', '礼县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2989, 2981, '621227', '徽县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2990, 2981, '621228', '两当县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2991, 2908, '622900', '临夏回族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (2992, 2991, '622901', '临夏市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2993, 2991, '622921', '临夏县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2994, 2991, '622922', '康乐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2995, 2991, '622923', '永靖县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2996, 2991, '622924', '广河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2997, 2991, '622925', '和政县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2998, 2991, '622926', '东乡族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (2999, 2991, '622927', '积石山保安族东乡族撒拉族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3000, 2908, '623000', '甘南藏族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3001, 3000, '623001', '合作市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3002, 3000, '623021', '临潭县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3003, 3000, '623022', '卓尼县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3004, 3000, '623023', '舟曲县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3005, 3000, '623024', '迭部县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3006, 3000, '623025', '玛曲县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3007, 3000, '623026', '碌曲县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3008, 3000, '623027', '夏河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3009, 0, '630000', '青海省', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (3010, 3009, '630100', '西宁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3011, 3010, '630102', '城东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3012, 3010, '630103', '城中区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3013, 3010, '630104', '城西区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3014, 3010, '630105', '城北区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3015, 3010, '630106', '湟中区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3016, 3010, '630121', '大通回族土族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3017, 3010, '630123', '湟源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3018, 3009, '630200', '海东市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3019, 3018, '630202', '乐都区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3020, 3018, '630203', '平安区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3021, 3018, '630222', '民和回族土族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3022, 3018, '630223', '互助土族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3023, 3018, '630224', '化隆回族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3024, 3018, '630225', '循化撒拉族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3025, 3009, '632200', '海北藏族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3026, 3025, '632221', '门源回族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3027, 3025, '632222', '祁连县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3028, 3025, '632223', '海晏县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3029, 3025, '632224', '刚察县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3030, 3009, '632300', '黄南藏族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3031, 3030, '632321', '同仁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3032, 3030, '632322', '尖扎县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3033, 3030, '632323', '泽库县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3034, 3030, '632324', '河南蒙古族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3035, 3009, '632500', '海南藏族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3036, 3035, '632521', '共和县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3037, 3035, '632522', '同德县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3038, 3035, '632523', '贵德县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3039, 3035, '632524', '兴海县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3040, 3035, '632525', '贵南县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3041, 3009, '632600', '果洛藏族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3042, 3041, '632621', '玛沁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3043, 3041, '632622', '班玛县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3044, 3041, '632623', '甘德县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3045, 3041, '632624', '达日县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3046, 3041, '632625', '久治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3047, 3041, '632626', '玛多县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3048, 3009, '632700', '玉树藏族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3049, 3048, '632701', '玉树市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3050, 3048, '632722', '杂多县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3051, 3048, '632723', '称多县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3052, 3048, '632724', '治多县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3053, 3048, '632725', '囊谦县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3054, 3048, '632726', '曲麻莱县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3055, 3009, '632800', '海西蒙古族藏族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3056, 3055, '632801', '格尔木市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3057, 3055, '632802', '德令哈市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3058, 3055, '632803', '茫崖市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3059, 3055, '632821', '乌兰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3060, 3055, '632822', '都兰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3061, 3055, '632823', '天峻县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3062, 0, '640000', '宁夏回族自治区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (3063, 3062, '640100', '银川市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3064, 3063, '640104', '兴庆区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3065, 3063, '640105', '西夏区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3066, 3063, '640106', '金凤区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3067, 3063, '640121', '永宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3068, 3063, '640122', '贺兰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3069, 3063, '640181', '灵武市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3070, 3062, '640200', '石嘴山市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3071, 3070, '640202', '大武口区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3072, 3070, '640205', '惠农区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3073, 3070, '640221', '平罗县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3074, 3062, '640300', '吴忠市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3075, 3074, '640302', '利通区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3076, 3074, '640303', '红寺堡区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3077, 3074, '640323', '盐池县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3078, 3074, '640324', '同心县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3079, 3074, '640381', '青铜峡市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3080, 3062, '640400', '固原市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3081, 3080, '640402', '原州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3082, 3080, '640422', '西吉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3083, 3080, '640423', '隆德县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3084, 3080, '640424', '泾源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3085, 3080, '640425', '彭阳县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3086, 3062, '640500', '中卫市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3087, 3086, '640502', '沙坡头区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3088, 3086, '640521', '中宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3089, 3086, '640522', '海原县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3090, 0, '650000', '新疆维吾尔自治区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (3091, 3090, '650100', '乌鲁木齐市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3092, 3091, '650102', '天山区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3093, 3091, '650103', '沙依巴克区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3094, 3091, '650104', '新市区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3095, 3091, '650105', '水磨沟区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3096, 3091, '650106', '头屯河区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3097, 3091, '650107', '达坂城区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3098, 3091, '650109', '米东区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3099, 3091, '650121', '乌鲁木齐县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3100, 3090, '650200', '克拉玛依市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3101, 3100, '650202', '独山子区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3102, 3100, '650203', '克拉玛依区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3103, 3100, '650204', '白碱滩区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3104, 3100, '650205', '乌尔禾区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3105, 3090, '650400', '吐鲁番市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3106, 3105, '650402', '高昌区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3107, 3105, '650421', '鄯善县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3108, 3105, '650422', '托克逊县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3109, 3090, '650500', '哈密市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3110, 3109, '650502', '伊州区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3111, 3109, '650521', '巴里坤哈萨克自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3112, 3109, '650522', '伊吾县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3113, 3090, '652300', '昌吉回族自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3114, 3113, '652301', '昌吉市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3115, 3113, '652302', '阜康市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3116, 3113, '652323', '呼图壁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3117, 3113, '652324', '玛纳斯县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3118, 3113, '652325', '奇台县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3119, 3113, '652327', '吉木萨尔县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3120, 3113, '652328', '木垒哈萨克自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3121, 3090, '652700', '博尔塔拉蒙古自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3122, 3121, '652701', '博乐市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3123, 3121, '652702', '阿拉山口市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3124, 3121, '652722', '精河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3125, 3121, '652723', '温泉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3126, 3090, '652800', '巴音郭楞蒙古自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3127, 3126, '652801', '库尔勒市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3128, 3126, '652822', '轮台县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3129, 3126, '652823', '尉犁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3130, 3126, '652824', '若羌县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3131, 3126, '652825', '且末县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3132, 3126, '652826', '焉耆回族自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3133, 3126, '652827', '和静县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3134, 3126, '652828', '和硕县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3135, 3126, '652829', '博湖县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3136, 3090, '652900', '阿克苏地区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3137, 3136, '652901', '阿克苏市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3138, 3136, '652902', '库车市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3139, 3136, '652922', '温宿县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3140, 3136, '652924', '沙雅县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3141, 3136, '652925', '新和县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3142, 3136, '652926', '拜城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3143, 3136, '652927', '乌什县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3144, 3136, '652928', '阿瓦提县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3145, 3136, '652929', '柯坪县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3146, 3090, '653000', '克孜勒苏柯尔克孜自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3147, 3146, '653001', '阿图什市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3148, 3146, '653022', '阿克陶县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3149, 3146, '653023', '阿合奇县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3150, 3146, '653024', '乌恰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3151, 3090, '653100', '喀什地区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3152, 3151, '653101', '喀什市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3153, 3151, '653121', '疏附县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3154, 3151, '653122', '疏勒县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3155, 3151, '653123', '英吉沙县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3156, 3151, '653124', '泽普县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3157, 3151, '653125', '莎车县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3158, 3151, '653126', '叶城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3159, 3151, '653127', '麦盖提县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3160, 3151, '653128', '岳普湖县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3161, 3151, '653129', '伽师县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3162, 3151, '653130', '巴楚县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3163, 3151, '653131', '塔什库尔干塔吉克自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3164, 3090, '653200', '和田地区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3165, 3164, '653201', '和田市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3166, 3164, '653221', '和田县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3167, 3164, '653222', '墨玉县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3168, 3164, '653223', '皮山县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3169, 3164, '653224', '洛浦县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3170, 3164, '653225', '策勒县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3171, 3164, '653226', '于田县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3172, 3164, '653227', '民丰县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3173, 3090, '654000', '伊犁哈萨克自治州', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3174, 3173, '654002', '伊宁市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3175, 3173, '654003', '奎屯市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3176, 3173, '654004', '霍尔果斯市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3177, 3173, '654021', '伊宁县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3178, 3173, '654022', '察布查尔锡伯自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3179, 3173, '654023', '霍城县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3180, 3173, '654024', '巩留县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3181, 3173, '654025', '新源县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3182, 3173, '654026', '昭苏县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3183, 3173, '654027', '特克斯县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3184, 3173, '654028', '尼勒克县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3185, 3090, '654200', '塔城地区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3186, 3185, '654201', '塔城市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3187, 3185, '654202', '乌苏市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3188, 3185, '654221', '额敏县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3189, 3185, '654223', '沙湾县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3190, 3185, '654224', '托里县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3191, 3185, '654225', '裕民县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3192, 3185, '654226', '和布克赛尔蒙古自治县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3193, 3090, '654300', '阿勒泰地区', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3194, 3193, '654301', '阿勒泰市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3195, 3193, '654321', '布尔津县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3196, 3193, '654322', '富蕴县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3197, 3193, '654323', '福海县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3198, 3193, '654324', '哈巴河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3199, 3193, '654325', '青河县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3200, 3193, '654326', '吉木乃县', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3201, 3090, '659001', '石河子市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3202, 3090, '659002', '阿拉尔市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3203, 3090, '659003', '图木舒克市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3204, 3090, '659004', '五家渠市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3205, 3090, '659005', '北屯市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3206, 3090, '659006', '铁门关市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3207, 3090, '659007', '双河市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3208, 3090, '659008', '可克达拉市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3209, 3090, '659009', '昆玉市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3210, 3090, '659010', '胡杨河市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 2);
INSERT INTO `pms_region` VALUES (3211, 0, '710000', '中国台湾', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (3212, 0, '810000', '中国香港', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (3213, 0, '820000', '中国澳门', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 0);
INSERT INTO `pms_region` VALUES (3216, 1, '110010', '北京市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3217, 18, '120010', '天津市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3218, 780, '310010', '上海市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);
INSERT INTO `pms_region` VALUES (3219, 2220, '500010', '重庆市', '无', '2022-07-26 16:26:52', '2022-07-26 16:27:45', 0, 1);

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
INSERT INTO `ums_admin` VALUES (3, 'admin', '123456', '0:0:0:0:0:0:0:1', '2022-08-01 10:32:28', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220620/lihezong.webp', '2022-06-20 16:11:43', '2022-06-23 10:01:03', 1);
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
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `ums_menu` VALUES (20, 13, '/cms/searchHistory', 'cmsSearchHistory', '/cms/searchHistory', '搜索历史', '', 0, 1, 0, 0, 'iconfont icon--chaifenlie', 5);
INSERT INTO `ums_menu` VALUES (21, 6, '/product/region', 'productRegion', '/product/region', '行政区域', '', 0, 1, 0, 0, 'iconfont icon-shouye_dongtaihui', 6);
INSERT INTO `ums_menu` VALUES (22, 13, '/cms/feedback', 'cmsFeedback', '/cms/feedback', '意见反馈', '', 0, 1, 0, 0, 'iconfont icon--chaifenhang', 6);

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
) ENGINE = InnoDB AUTO_INCREMENT = 168 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_role_menu
-- ----------------------------
INSERT INTO `ums_role_menu` VALUES (5, 11, 6);
INSERT INTO `ums_role_menu` VALUES (6, 11, 7);
INSERT INTO `ums_role_menu` VALUES (149, 10, 1);
INSERT INTO `ums_role_menu` VALUES (150, 10, 2);
INSERT INTO `ums_role_menu` VALUES (151, 10, 4);
INSERT INTO `ums_role_menu` VALUES (152, 10, 5);
INSERT INTO `ums_role_menu` VALUES (153, 10, 6);
INSERT INTO `ums_role_menu` VALUES (154, 10, 7);
INSERT INTO `ums_role_menu` VALUES (155, 10, 9);
INSERT INTO `ums_role_menu` VALUES (156, 10, 10);
INSERT INTO `ums_role_menu` VALUES (157, 10, 11);
INSERT INTO `ums_role_menu` VALUES (158, 10, 15);
INSERT INTO `ums_role_menu` VALUES (159, 10, 19);
INSERT INTO `ums_role_menu` VALUES (160, 10, 21);
INSERT INTO `ums_role_menu` VALUES (161, 10, 13);
INSERT INTO `ums_role_menu` VALUES (162, 10, 14);
INSERT INTO `ums_role_menu` VALUES (163, 10, 16);
INSERT INTO `ums_role_menu` VALUES (164, 10, 17);
INSERT INTO `ums_role_menu` VALUES (165, 10, 18);
INSERT INTO `ums_role_menu` VALUES (166, 10, 20);
INSERT INTO `ums_role_menu` VALUES (167, 10, 22);

SET FOREIGN_KEY_CHECKS = 1;
