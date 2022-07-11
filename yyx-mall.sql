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

 Date: 11/07/2022 17:49:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品基本信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_goods
-- ----------------------------
INSERT INTO `pms_goods` VALUES (00000000001, '100101', '芒果水果 云南大青芒 2斤装单果150-300g 新鲜水果 热带水果', 2, 1046002, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220704/e5c9705ad6fccea1.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220704/12e03797b09d6391.jpg.avif\"]', '新鲜水果,热带水果', '芒果水果 云南大青芒 2斤装单果150-300g 新鲜水果 热带水果', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220704/mangguo.avif', NULL, 1, 0, '个', 12.00, 10.00, '<p><img src=\"https://img2.baidu.com/it/u=542186524,1799706584&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img0.baidu.com/it/u=3980150824,3597382374&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=320\" alt=\"\" data-href=\"\" style=\"\"/></p><p><br></p>', '2022-07-04 09:50:55', '2022-07-11 17:04:20', 1);
INSERT INTO `pms_goods` VALUES (00000000002, '100102', '维他奶柠檬茶', 2, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/4f64e15beec86322.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/8a7a1817df343e2e.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/263ba9b66b4da4cd.jpg.avif\"]', '柠檬', '维他经典柠檬茶饮料250ml*24盒 柠檬味红茶饮料 正宗港式风味 网红茶 整箱装 家庭备货', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/2c5c3681520647d8.jpg.avif', NULL, 1, 1, '箱', 55.80, 15.00, '<p><img src=\"https://img2.baidu.com/it/u=4160178831,548973621&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img0.baidu.com/it/u=4067577702,1206259352&fm=253&fmt=auto&app=138&f=JPEG?w=350&h=350\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2022-07-10 00:12:20', '2022-07-11 17:34:05', 1);
INSERT INTO `pms_goods` VALUES (00000000003, '100103', '正宗内蒙古牛蹄筋零食麻辣小吃牛蹄筋 125*4包【独立包装】', 3, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/3749b84b4329ab8e.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/263ba9b66b4da4cd.jpg.avif\"]', '牛蹄筋', '百事可乐 Pepsi 清柠味汽水 碳酸饮料 330ml*24听 百事出品', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/2012ef0f9097b7bc.jpg.avif', NULL, 1, 1, '包', 48.90, 20.00, '<p><img src=\"https://img1.baidu.com/it/u=3030153620,443093464&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img2.baidu.com/it/u=507621939,372933065&fm=253&fmt=auto&app=138&f=JPG?w=650&h=463\" alt=\"\" data-href=\"\" style=\"\"/></p><p><br></p>', '2022-07-10 00:18:58', '2022-07-11 17:37:50', 1);
INSERT INTO `pms_goods` VALUES (00000000004, '100104', '爱尚虾条', 2, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/59583a25N6eba3fff.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/bb3f92052698740c.jpg.avif\"]', '虾条', '爱尚咪咪 虾条 虾味 怀旧好吃零食大礼包 网红休闲小零食（18g*20包）360g/袋', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/59583a1dN16748a8e.jpg.avif', NULL, 1, 0, '包', 9.80, 200.00, '<p><img src=\"https://img1.baidu.com/it/u=337038871,1192223465&fm=253&fmt=auto&app=138&f=JPEG?w=804&h=500\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img2.baidu.com/it/u=1437085839,3211808087&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=430\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2022-07-10 11:27:01', '2022-07-11 17:39:12', 1);
INSERT INTO `pms_goods` VALUES (00000000005, '100105', '三只松鼠小米锅巴', 2, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/bb3f92052698740c.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/a4dd4b6706d39687.jpg.avif\"]', '锅巴', '三只松鼠小贱麻辣味小米锅巴 休闲零食地方特产膨化食品儿童食品小吃锅巴60g/袋', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/12031da645d3e2e9.jpg.avif', NULL, 1, 1, '包', 9.90, 35.00, '<p><img src=\"https://img0.baidu.com/it/u=1629579575,2888224240&fm=253&fmt=auto&app=138&f=JPG?w=500&h=500\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img2.baidu.com/it/u=3544021142,1499399026&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2022-07-10 11:30:32', '2022-07-11 17:39:53', 1);
INSERT INTO `pms_goods` VALUES (00000000006, '100106', '蒙牛纯牛奶', 2, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/bfb489f3cd146bec.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/7c75565bcc4b797c.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/7edba6d6c54e5952.jpg.avif\"]', '牛奶', '蒙牛 特仑苏有机纯牛奶3.8g蛋白质含量升级 250ml*24 梦幻盖礼盒装 （新老包装随机发货）', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/46560f61b787eef7.jpg.avif', NULL, 1, 1, '箱', 187.20, 187.20, '<p><img src=\"https://img0.baidu.com/it/u=1641232441,4139542563&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img0.baidu.com/it/u=3213718960,1285801930&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2022-07-10 11:45:45', '2022-07-11 17:40:36', 1);
INSERT INTO `pms_goods` VALUES (00000000007, '100107', '良品铺子 甘栗80g ', 2, 1046001, '[\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/35de4290b1711ebe.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/ccfe41dccacf31b9.jpg.avif\",\"https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/a37b7f721bc22541.jpg.avif\"]', '板栗', '【299 减180】良品铺子 甘栗80g 无添加甘栗仁板栗仁燕山板栗特产零食 坚果炒货炒栗子零食', 1, 100, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220710/fd1dc4fbac02fcc8.jpg.avif', NULL, 1, 1, '盒', 16.80, 1038.00, '<p><img src=\"https://img0.baidu.com/it/u=4047623452,2160104851&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://img2.baidu.com/it/u=2202273209,1712137413&fm=253&fmt=auto&app=138&f=JPEG?w=763&h=500\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2022-07-10 11:49:32', '2022-07-11 17:41:51', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品参数表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_goods_attribute
-- ----------------------------
INSERT INTO `pms_goods_attribute` VALUES (34, 1, '净含量', '1kg', '2022-07-11 17:04:20', '2022-07-11 17:04:20', 1);
INSERT INTO `pms_goods_attribute` VALUES (35, 1, '保质期', '15天', '2022-07-11 17:04:21', '2022-07-11 17:04:21', 1);
INSERT INTO `pms_goods_attribute` VALUES (39, 2, '包装清单', '250ml*24', '2022-07-11 17:34:05', '2022-07-11 17:34:05', 1);
INSERT INTO `pms_goods_attribute` VALUES (42, 3, '包装清单', '清柠 可乐型汽水330ml*24罐', '2022-07-11 17:37:51', '2022-07-11 17:37:51', 1);
INSERT INTO `pms_goods_attribute` VALUES (43, 4, '包装清单', '爱尚 咪咪虾条虾味 油炸休闲小零食（18g*20包）360g/袋*1', '2022-07-11 17:39:12', '2022-07-11 17:39:12', 1);
INSERT INTO `pms_goods_attribute` VALUES (44, 5, '包装清单', '小米锅巴X1', '2022-07-11 17:39:53', '2022-07-11 17:39:53', 1);
INSERT INTO `pms_goods_attribute` VALUES (45, 6, '包装清单', '蒙牛 特仑苏 有机纯牛奶利乐梦幻盖 250ml×24包', '2022-07-11 17:40:36', '2022-07-11 17:40:36', 1);
INSERT INTO `pms_goods_attribute` VALUES (46, 7, '包装清单', '暂无', '2022-07-11 17:41:51', '2022-07-11 17:41:51', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品货品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_goods_product
-- ----------------------------
INSERT INTO `pms_goods_product` VALUES (1, 1, '暂无', 10.00, 12, 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220706/663f568475c994358bf31bcb67d122fe.png', '2022-07-04 09:50:55', '2022-07-06 13:43:38', 1);
INSERT INTO `pms_goods_product` VALUES (2, 2, '6000ml', 15.00, 20, '', '2022-07-10 00:12:20', '2022-07-10 11:38:13', 1);
INSERT INTO `pms_goods_product` VALUES (3, 2, '330天', 15.00, 30, '', '2022-07-10 00:12:20', '2022-07-10 11:38:13', 1);
INSERT INTO `pms_goods_product` VALUES (4, 3, '7920ml', 20.00, 70, '', '2022-07-10 00:18:58', '2022-07-10 00:18:58', 1);
INSERT INTO `pms_goods_product` VALUES (5, 4, '201-500g', 200.00, 10, '', '2022-07-10 11:27:01', '2022-07-10 11:27:01', 1);
INSERT INTO `pms_goods_product` VALUES (6, 5, '270天', 35.00, 10, '', '2022-07-10 11:30:32', '2022-07-10 11:38:33', 1);
INSERT INTO `pms_goods_product` VALUES (7, 6, '6个月', 187.20, 100, '', '2022-07-10 11:45:45', '2022-07-10 11:45:45', 1);
INSERT INTO `pms_goods_product` VALUES (8, 7, '果仁', 1038.00, 50, '', '2022-07-10 11:49:32', '2022-07-10 11:49:32', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品规格表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_goods_specification
-- ----------------------------
INSERT INTO `pms_goods_specification` VALUES (1, 1, '包装清单', '暂无', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220706/4aab4598017b5749e3b63309d25e9f6b.png', '2022-07-04 09:50:55', '2022-07-06 13:43:38', 1);
INSERT INTO `pms_goods_specification` VALUES (2, 2, '净含量', '6000ml', '', '2022-07-10 00:12:20', '2022-07-10 00:12:20', 1);
INSERT INTO `pms_goods_specification` VALUES (3, 2, '保质期', '330天', '', '2022-07-10 00:12:20', '2022-07-10 00:12:20', 1);
INSERT INTO `pms_goods_specification` VALUES (4, 3, '净含量', '7920ml', '', '2022-07-10 00:18:58', '2022-07-10 00:18:58', 1);
INSERT INTO `pms_goods_specification` VALUES (5, 4, '净含量', '201-500g', '', '2022-07-10 11:27:01', '2022-07-10 11:27:01', 1);
INSERT INTO `pms_goods_specification` VALUES (6, 5, '保质期', '270天', '', '2022-07-10 11:30:32', '2022-07-10 11:30:32', 1);
INSERT INTO `pms_goods_specification` VALUES (7, 6, '保质期', '6个月', '', '2022-07-10 11:45:45', '2022-07-10 11:45:45', 1);
INSERT INTO `pms_goods_specification` VALUES (8, 7, '特性', '果仁', '', '2022-07-10 11:49:32', '2022-07-10 11:49:32', 1);

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
INSERT INTO `ums_admin` VALUES (3, 'admin', '123456', '0:0:0:0:0:0:0:1', '2022-07-11 16:40:50', 'https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220620/lihezong.webp', '2022-06-20 16:11:43', '2022-06-23 10:01:03', 1);
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
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_role_menu
-- ----------------------------
INSERT INTO `ums_role_menu` VALUES (5, 11, 6);
INSERT INTO `ums_role_menu` VALUES (6, 11, 7);
INSERT INTO `ums_role_menu` VALUES (47, 10, 1);
INSERT INTO `ums_role_menu` VALUES (48, 10, 2);
INSERT INTO `ums_role_menu` VALUES (49, 10, 4);
INSERT INTO `ums_role_menu` VALUES (50, 10, 5);
INSERT INTO `ums_role_menu` VALUES (51, 10, 6);
INSERT INTO `ums_role_menu` VALUES (52, 10, 7);
INSERT INTO `ums_role_menu` VALUES (53, 10, 9);
INSERT INTO `ums_role_menu` VALUES (54, 10, 10);
INSERT INTO `ums_role_menu` VALUES (55, 10, 11);
INSERT INTO `ums_role_menu` VALUES (56, 10, 13);
INSERT INTO `ums_role_menu` VALUES (57, 10, 14);

SET FOREIGN_KEY_CHECKS = 1;
