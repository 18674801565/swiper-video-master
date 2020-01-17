/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : myvideodb

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2020-01-17 16:03:18
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(250) NOT NULL AUTO_INCREMENT,
  `reply_id` bigint(250) NOT NULL,
  `content` varchar(213) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `parse_count` int(11) DEFAULT '0',
  `create_time` date NOT NULL,
  `update_time` date DEFAULT NULL,
  `topic_id` bigint(20) NOT NULL,
  `replyed_id` bigint(20) DEFAULT NULL COMMENT '评论级别',
  `comment_rank` int(11) DEFAULT NULL COMMENT '评论级别，只有一二级',
  `comment_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', 'uni-app一套代码八端共用啊', '1', '23', '2020-01-15', '2020-01-24', '1', null, '1', '1');
INSERT INTO `comment` VALUES ('2', '2', 'uni-app国产，支持国产', '1', '232', '2020-01-06', '2020-01-17', '1', null, '1', '2');
INSERT INTO `comment` VALUES ('3', '3', 'uni-app还行吧', '1', '23', '2019-12-10', '2020-01-15', '1', null, '1', '3');
INSERT INTO `comment` VALUES ('4', '4', '效率不行啊', '1', '232', '2020-01-23', '2020-01-08', '1', '1', '2', '1');
INSERT INTO `comment` VALUES ('5', '3', '效率低的一批', '1', '23', '2020-01-02', '2020-01-07', '1', '1', '2', '1');
INSERT INTO `comment` VALUES ('6', '3', '确实', '1', '232', '2020-01-14', '2020-01-22', '1', '1', '2', '1');
INSERT INTO `comment` VALUES ('7', '2', '哈哈', '1', '0', '2020-01-02', '2020-01-15', '1', '3', '2', '3');

-- ----------------------------
-- Table structure for `comment_like`
-- ----------------------------
DROP TABLE IF EXISTS `comment_like`;
CREATE TABLE `comment_like` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `like` int(11) DEFAULT '1',
  `state` int(11) DEFAULT '1',
  `comment_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comment_like
-- ----------------------------
INSERT INTO `comment_like` VALUES ('1', '1', '2020-01-15 11:55:23', '2020-01-24 11:55:27', '1', '1', '1');
INSERT INTO `comment_like` VALUES ('2', '1', '2020-01-01 11:57:09', '2020-01-22 11:56:39', '1', '1', '2');
INSERT INTO `comment_like` VALUES ('3', '2', '2020-01-02 11:57:12', '2020-01-15 11:56:43', '1', '1', '3');
INSERT INTO `comment_like` VALUES ('4', '2', '2020-01-03 11:57:19', '2020-01-31 11:56:46', '1', '1', '1');
INSERT INTO `comment_like` VALUES ('5', '3', '2020-01-03 11:57:25', '2020-01-15 11:56:49', '1', '1', '4');
INSERT INTO `comment_like` VALUES ('6', '4', '2020-01-04 11:57:28', '2020-01-30 11:56:53', '1', '1', '5');
INSERT INTO `comment_like` VALUES ('7', '4', '2020-01-03 11:57:32', '2020-01-17 11:56:56', '1', '1', '1');
INSERT INTO `comment_like` VALUES ('8', '1', '2020-01-04 11:57:36', '2020-01-15 11:57:03', '1', '1', '6');
INSERT INTO `comment_like` VALUES ('9', '2', '2020-01-06 11:57:41', '2020-01-16 11:57:06', '1', '1', '7');

-- ----------------------------
-- Table structure for `concern`
-- ----------------------------
DROP TABLE IF EXISTS `concern`;
CREATE TABLE `concern` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `concern_id` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of concern
-- ----------------------------
INSERT INTO `concern` VALUES ('1', '3', '1', '0000-00-00 00:00:00', '1');
INSERT INTO `concern` VALUES ('2', '3', '1', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1388 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '::1 - GET /test HTTP/1.1 200 164 - 81.664 ms\n', '2019-12-31 16:23:52');
INSERT INTO `log` VALUES ('2', '::1 - POST /login?name=root&password=root HTTP/1.1 - - - - ms\n', '2019-12-31 17:02:07');
INSERT INTO `log` VALUES ('3', '::1 - POST /login?name=root&password=root HTTP/1.1 200 51 - 69.492 ms\n', '2019-12-31 17:08:46');
INSERT INTO `log` VALUES ('4', '::1 - POST /login?name=root&password=root HTTP/1.1 200 51 - 77.157 ms\n', '2019-12-31 17:14:33');
INSERT INTO `log` VALUES ('5', '::1 - POST /login?name=root&password=root HTTP/1.1 200 51 - 72.086 ms\n', '2019-12-31 17:15:22');
INSERT INTO `log` VALUES ('6', '::1 - POST /login?name=root&password=root HTTP/1.1 200 51 - 80.968 ms\n', '2019-12-31 17:15:49');
INSERT INTO `log` VALUES ('7', '::1 - POST /login?name=root&password=root HTTP/1.1 200 178 - 71.201 ms\n', '2019-12-31 17:18:50');
INSERT INTO `log` VALUES ('8', '::1 - POST /tokenTestRouter/test HTTP/1.1 404 1173 - 211.657 ms\n', '2019-12-31 17:28:25');
INSERT INTO `log` VALUES ('9', '::1 - POST /tokenTestRouter HTTP/1.1 404 1173 - 204.709 ms\n', '2019-12-31 17:30:03');
INSERT INTO `log` VALUES ('10', '::1 - POST /test HTTP/1.1 404 1173 - 0.805 ms\n', '2019-12-31 17:30:31');
INSERT INTO `log` VALUES ('11', '::1 - POST /test HTTP/1.1 404 1173 - 180.192 ms\n', '2019-12-31 17:31:24');
INSERT INTO `log` VALUES ('12', '::1 - POST /test HTTP/1.1 404 1108 - 2.495 ms\n', '2019-12-31 17:34:01');
INSERT INTO `log` VALUES ('13', '::1 - GET /test HTTP/1.1 200 164 - 75.299 ms\n', '2019-12-31 17:35:02');
INSERT INTO `log` VALUES ('14', '::1 - GET /tokenTestRouter HTTP/1.1 500 1210 - 201.058 ms\n', '2019-12-31 17:35:40');
INSERT INTO `log` VALUES ('15', '::1 - GET /tokenTestRouter HTTP/1.1 500 1210 - 0.835 ms\n', '2019-12-31 17:36:38');
INSERT INTO `log` VALUES ('16', '::1 - GET /tokenTestRouter HTTP/1.1 200 39 - 4.348 ms\n', '2019-12-31 17:42:14');
INSERT INTO `log` VALUES ('17', '::1 - GET /tokentest HTTP/1.1 200 39 - 7.406 ms\n', '2019-12-31 17:43:12');
INSERT INTO `log` VALUES ('18', '::1 - GET /tokentest HTTP/1.1 200 185 - 4.009 ms\n', '2019-12-31 17:48:51');
INSERT INTO `log` VALUES ('19', '::1 - GET /tokenTestRouter/test HTTP/1.1 200 185 - 7.004 ms\n', '2019-12-31 17:51:22');
INSERT INTO `log` VALUES ('20', '::1 - GET /tokenTestRouter/test HTTP/1.1 200 185 - 1.181 ms\n', '2019-12-31 17:51:29');
INSERT INTO `log` VALUES ('21', '::1 - GET /tokenTestRouter/test HTTP/1.1 200 185 - 4.890 ms\n', '2019-12-31 17:52:31');
INSERT INTO `log` VALUES ('22', '::1 - GET /tokenTestRouter/tes HTTP/1.1 - - - - ms\n', '2019-12-31 17:53:17');
INSERT INTO `log` VALUES ('23', '::1 - GET /tokenTestRouter/tes HTTP/1.1 404 33 - 4.174 ms\n', '2019-12-31 17:53:26');
INSERT INTO `log` VALUES ('24', '::1 - GET /tokenTestRouter/test HTTP/1.1 200 185 - 13.963 ms\n', '2019-12-31 17:53:35');
INSERT INTO `log` VALUES ('25', '::1 - GET /tokenTestRouter/test HTTP/1.1 200 185 - 3.182 ms\n', '2019-12-31 17:53:56');
INSERT INTO `log` VALUES ('26', '::1 - GET /tokenTestRouter/test HTTP/1.1 200 185 - 5.790 ms\n', '2019-12-31 17:54:59');
INSERT INTO `log` VALUES ('27', '::1 - GET /tokenTestRouter/test HTTP/1.1 200 185 - 10.437 ms\n', '2019-12-31 18:45:50');
INSERT INTO `log` VALUES ('28', '::1 - GET /tokenTestRouter/test HTTP/1.1 200 185 - 5.380 ms\n', '2020-01-01 10:49:12');
INSERT INTO `log` VALUES ('29', '::1 - GET /tokenTestRouter/test HTTP/1.1 200 185 - 36.937 ms\n', '2020-01-01 10:50:21');
INSERT INTO `log` VALUES ('30', '::1 - GET /tokenTestRouter/test HTTP/1.1 200 185 - 12.478 ms\n', '2020-01-01 10:50:35');
INSERT INTO `log` VALUES ('31', '::1 - GET /tokenTestRouter/test HTTP/1.1 500 33 - 8.694 ms\n', '2020-01-01 13:13:56');
INSERT INTO `log` VALUES ('32', '::1 - GET /tokenTestRouter/test HTTP/1.1 500 33 - 12.358 ms\n', '2020-01-01 13:19:38');
INSERT INTO `log` VALUES ('33', '::1 - GET /tokenTestRouter/test HTTP/1.1 500 33 - 4.874 ms\n', '2020-01-01 13:20:01');
INSERT INTO `log` VALUES ('34', '::1 - GET /tokenTestRouter/test HTTP/1.1 500 33 - 3.088 ms\n', '2020-01-01 13:20:03');
INSERT INTO `log` VALUES ('35', '::1 - GET /tokenTestRouter/ HTTP/1.1 500 33 - 10.666 ms\n', '2020-01-01 13:20:11');
INSERT INTO `log` VALUES ('36', '::1 - GET /tokenTestRouter HTTP/1.1 500 33 - 8.011 ms\n', '2020-01-01 13:20:15');
INSERT INTO `log` VALUES ('37', '::1 - GET /tokenTestRouter HTTP/1.1 500 33 - 8.548 ms\n', '2020-01-01 13:21:50');
INSERT INTO `log` VALUES ('38', '::1 - GET /tokenTestRouter/ HTTP/1.1 500 33 - 3.629 ms\n', '2020-01-01 13:22:05');
INSERT INTO `log` VALUES ('39', '::1 - GET /tokenTestRouter/ HTTP/1.1 500 33 - 7.697 ms\n', '2020-01-01 13:22:59');
INSERT INTO `log` VALUES ('40', '::1 - GET / HTTP/1.1 500 33 - 2.778 ms\n', '2020-01-01 13:23:59');
INSERT INTO `log` VALUES ('41', '::1 - GET / HTTP/1.1 500 33 - 6.728 ms\n', '2020-01-01 13:24:14');
INSERT INTO `log` VALUES ('42', '::1 - GET /tokenTestRouter/test HTTP/1.1 500 33 - 2.124 ms\n', '2020-01-01 13:24:58');
INSERT INTO `log` VALUES ('43', '::1 - GET /tokenTestRouter/test HTTP/1.1 500 33 - 2.470 ms\n', '2020-01-01 13:25:11');
INSERT INTO `log` VALUES ('44', '::1 - GET /test HTTP/1.1 500 33 - 12.545 ms\n', '2020-01-01 13:26:15');
INSERT INTO `log` VALUES ('45', '::1 - GET /test HTTP/1.1 500 33 - 13.103 ms\n', '2020-01-01 13:27:34');
INSERT INTO `log` VALUES ('46', '::1 - GET /test HTTP/1.1 200 164 - 24.506 ms\n', '2020-01-01 13:27:55');
INSERT INTO `log` VALUES ('47', '::1 - GET /test HTTP/1.1 200 164 - 19.976 ms\n', '2020-01-01 13:33:49');
INSERT INTO `log` VALUES ('48', '::1 - GET /test HTTP/1.1 200 164 - 29.341 ms\n', '2020-01-01 13:34:17');
INSERT INTO `log` VALUES ('49', '::1 - GET /test HTTP/1.1 200 36 - 18.748 ms\n', '2020-01-01 13:37:56');
INSERT INTO `log` VALUES ('50', '::1 - GET /test HTTP/1.1 200 36 - 16.137 ms\n', '2020-01-01 13:54:54');
INSERT INTO `log` VALUES ('51', '::1 - GET /test HTTP/1.1 200 36 - 17.158 ms\n', '2020-01-01 14:00:23');
INSERT INTO `log` VALUES ('52', '::1 - GET /test HTTP/1.1 200 164 - 20.637 ms\n', '2020-01-01 14:01:46');
INSERT INTO `log` VALUES ('53', '::1 - GET /login HTTP/1.1 404 33 - 12.209 ms\n', '2020-01-01 14:43:23');
INSERT INTO `log` VALUES ('54', '::1 - POST /login HTTP/1.1 200 36 - 17.761 ms\n', '2020-01-01 14:45:25');
INSERT INTO `log` VALUES ('55', '::1 - POST /login HTTP/1.1 200 36 - 18.007 ms\n', '2020-01-01 14:46:52');
INSERT INTO `log` VALUES ('56', '::1 - POST /login HTTP/1.1 200 169 - 35.856 ms\n', '2020-01-01 14:49:32');
INSERT INTO `log` VALUES ('57', '::1 - POST /login HTTP/1.1 200 169 - 32.055 ms\n', '2020-01-01 14:59:31');
INSERT INTO `log` VALUES ('58', '::1 - POST /login HTTP/1.1 200 169 - 12.979 ms\n', '2020-01-01 15:01:24');
INSERT INTO `log` VALUES ('59', '::1 - POST /login HTTP/1.1 200 169 - 16.396 ms\n', '2020-01-01 15:02:29');
INSERT INTO `log` VALUES ('60', '::1 - POST /login HTTP/1.1 500 56 - 30.601 ms\n', '2020-01-01 15:25:33');
INSERT INTO `log` VALUES ('61', '::1 - POST /login HTTP/1.1 200 169 - 16.226 ms\n', '2020-01-01 15:25:46');
INSERT INTO `log` VALUES ('62', '::1 - POST /test HTTP/1.1 404 33 - 4.088 ms\n', '2020-01-01 15:26:20');
INSERT INTO `log` VALUES ('63', '::1 - POST /test HTTP/1.1 404 33 - 3.015 ms\n', '2020-01-01 15:27:33');
INSERT INTO `log` VALUES ('64', '::1 - POST /test HTTP/1.1 404 33 - 17.066 ms\n', '2020-01-01 15:28:31');
INSERT INTO `log` VALUES ('65', '::1 - POST /test HTTP/1.1 200 38 - 22.735 ms\n', '2020-01-01 15:37:42');
INSERT INTO `log` VALUES ('66', '::1 - POST /test HTTP/1.1 200 38 - 10.865 ms\n', '2020-01-01 15:38:04');
INSERT INTO `log` VALUES ('67', '::1 - POST /wechat/login HTTP/1.1 200 38 - 32.333 ms\n', '2020-01-06 13:55:00');
INSERT INTO `log` VALUES ('68', '::1 - POST /wechat/login HTTP/1.1 200 38 - 21.632 ms\n', '2020-01-06 13:56:47');
INSERT INTO `log` VALUES ('69', '::1 - POST /wechat/login HTTP/1.1 200 38 - 19.911 ms\n', '2020-01-06 13:57:40');
INSERT INTO `log` VALUES ('70', '::1 - POST /wechat/login HTTP/1.1 200 38 - 9.388 ms\n', '2020-01-06 13:59:56');
INSERT INTO `log` VALUES ('71', '::1 - POST /wechat/login HTTP/1.1 200 38 - 12.400 ms\n', '2020-01-06 14:00:43');
INSERT INTO `log` VALUES ('72', '::1 - POST /wechat/login HTTP/1.1 200 38 - 12.104 ms\n', '2020-01-06 14:03:36');
INSERT INTO `log` VALUES ('73', '::1 - POST /wechat/login HTTP/1.1 200 38 - 11.486 ms\n', '2020-01-06 14:04:50');
INSERT INTO `log` VALUES ('74', '::1 - POST /wechat/login HTTP/1.1 200 296 - 332.467 ms\n', '2020-01-06 14:19:26');
INSERT INTO `log` VALUES ('75', '::1 - POST /wechat/login HTTP/1.1 200 296 - 287.037 ms\n', '2020-01-06 14:33:59');
INSERT INTO `log` VALUES ('76', '::1 - POST /wechat/login HTTP/1.1 200 296 - 260.413 ms\n', '2020-01-06 14:49:35');
INSERT INTO `log` VALUES ('77', '::1 - POST /wechat/login HTTP/1.1 200 294 - 235.503 ms\n', '2020-01-06 14:51:02');
INSERT INTO `log` VALUES ('78', '::1 - POST /wechat/login HTTP/1.1 - - - - ms\n', '2020-01-06 17:50:16');
INSERT INTO `log` VALUES ('79', '::1 - POST /wechat/login HTTP/1.1 - - - - ms\n', '2020-01-06 17:50:22');
INSERT INTO `log` VALUES ('80', '::1 - POST /wechat/login HTTP/1.1 - - - - ms\n', '2020-01-06 17:52:54');
INSERT INTO `log` VALUES ('81', '::1 - POST /wechat/login HTTP/1.1 - - - - ms\n', '2020-01-06 17:59:15');
INSERT INTO `log` VALUES ('82', '::1 - POST /wechat/login HTTP/1.1 - - - - ms\n', '2020-01-06 18:02:57');
INSERT INTO `log` VALUES ('83', '::1 - POST /wechat/login HTTP/1.1 - - - - ms\n', '2020-01-06 18:26:43');
INSERT INTO `log` VALUES ('84', '::1 - POST /wechat/login HTTP/1.1 200 309 - 291.380 ms\n', '2020-01-06 18:29:32');
INSERT INTO `log` VALUES ('85', '::1 - POST /wechat/update/userinfo HTTP/1.1 - - - - ms\n', '2020-01-06 18:30:32');
INSERT INTO `log` VALUES ('86', '::1 - POST /wechat/login HTTP/1.1 - - - - ms\n', '2020-01-06 18:34:34');
INSERT INTO `log` VALUES ('87', '::1 - POST /wechat/login HTTP/1.1 200 59 - 16.786 ms\n', '2020-01-06 18:36:03');
INSERT INTO `log` VALUES ('88', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 59 - 5.339 ms\n', '2020-01-06 18:36:03');
INSERT INTO `log` VALUES ('89', '::1 - POST /wechat/login HTTP/1.1 200 309 - 263.127 ms\n', '2020-01-06 18:37:54');
INSERT INTO `log` VALUES ('90', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 28.391 ms\n', '2020-01-06 18:37:55');
INSERT INTO `log` VALUES ('91', '::1 - POST /wechat/login HTTP/1.1 200 309 - 329.385 ms\n', '2020-01-06 18:44:43');
INSERT INTO `log` VALUES ('92', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 11.640 ms\n', '2020-01-06 18:44:43');
INSERT INTO `log` VALUES ('93', '::1 - POST /wechat/login HTTP/1.1 200 309 - 267.363 ms\n', '2020-01-06 18:46:23');
INSERT INTO `log` VALUES ('94', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 14.437 ms\n', '2020-01-06 18:46:24');
INSERT INTO `log` VALUES ('95', '::1 - POST /wechat/login HTTP/1.1 200 309 - 278.177 ms\n', '2020-01-06 18:49:42');
INSERT INTO `log` VALUES ('96', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 29.666 ms\n', '2020-01-06 18:49:43');
INSERT INTO `log` VALUES ('97', '::1 - POST /wechat/login HTTP/1.1 200 309 - 265.753 ms\n', '2020-01-06 18:55:29');
INSERT INTO `log` VALUES ('98', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 28 - 14.687 ms\n', '2020-01-06 18:55:30');
INSERT INTO `log` VALUES ('99', '::1 - POST /wechat/login HTTP/1.1 200 309 - 257.019 ms\n', '2020-01-06 18:59:24');
INSERT INTO `log` VALUES ('100', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 19.055 ms\n', '2020-01-06 18:59:24');
INSERT INTO `log` VALUES ('101', '::1 - POST /wechat/login HTTP/1.1 200 309 - 276.747 ms\n', '2020-01-06 19:00:19');
INSERT INTO `log` VALUES ('102', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 16.776 ms\n', '2020-01-06 19:00:19');
INSERT INTO `log` VALUES ('103', '::1 - POST /wechat/login HTTP/1.1 200 309 - 263.287 ms\n', '2020-01-06 19:01:21');
INSERT INTO `log` VALUES ('104', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 36.621 ms\n', '2020-01-06 19:01:22');
INSERT INTO `log` VALUES ('105', '::1 - POST /wechat/login HTTP/1.1 200 309 - 275.662 ms\n', '2020-01-06 19:01:53');
INSERT INTO `log` VALUES ('106', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 37.685 ms\n', '2020-01-06 19:01:53');
INSERT INTO `log` VALUES ('107', '::1 - POST /wechat/login HTTP/1.1 200 59 - 17.163 ms\n', '2020-01-07 10:31:39');
INSERT INTO `log` VALUES ('108', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 59 - 7.076 ms\n', '2020-01-07 10:31:39');
INSERT INTO `log` VALUES ('109', '::1 - POST /wechat/login HTTP/1.1 200 309 - 288.820 ms\n', '2020-01-07 10:33:52');
INSERT INTO `log` VALUES ('110', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 26.349 ms\n', '2020-01-07 10:33:52');
INSERT INTO `log` VALUES ('111', '::1 - POST /wechat/login HTTP/1.1 200 309 - 282.833 ms\n', '2020-01-07 10:36:16');
INSERT INTO `log` VALUES ('112', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 20.419 ms\n', '2020-01-07 10:36:16');
INSERT INTO `log` VALUES ('113', '::1 - POST /wechat/login HTTP/1.1 200 309 - 291.852 ms\n', '2020-01-07 12:32:38');
INSERT INTO `log` VALUES ('114', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 33.336 ms\n', '2020-01-07 12:32:38');
INSERT INTO `log` VALUES ('115', '::1 - POST /wechat/login HTTP/1.1 200 59 - 20.668 ms\n', '2020-01-07 13:34:12');
INSERT INTO `log` VALUES ('116', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 59 - 10.732 ms\n', '2020-01-07 13:34:12');
INSERT INTO `log` VALUES ('117', '::1 - POST /wechat/login HTTP/1.1 200 59 - 14.370 ms\n', '2020-01-07 13:53:50');
INSERT INTO `log` VALUES ('118', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 59 - 9.069 ms\n', '2020-01-07 13:53:50');
INSERT INTO `log` VALUES ('119', '::1 - POST /wechat/login HTTP/1.1 200 59 - 6.536 ms\n', '2020-01-07 13:57:39');
INSERT INTO `log` VALUES ('120', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 59 - 6.809 ms\n', '2020-01-07 13:57:39');
INSERT INTO `log` VALUES ('121', '::1 - POST /wechat/login HTTP/1.1 200 309 - 336.108 ms\n', '2020-01-07 13:59:06');
INSERT INTO `log` VALUES ('122', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 26.254 ms\n', '2020-01-07 13:59:07');
INSERT INTO `log` VALUES ('123', '::1 - POST /wechat/login HTTP/1.1 200 59 - 14.061 ms\n', '2020-01-07 14:01:55');
INSERT INTO `log` VALUES ('124', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 59 - 11.460 ms\n', '2020-01-07 14:01:55');
INSERT INTO `log` VALUES ('125', '::1 - POST /wechat/login HTTP/1.1 200 309 - 286.825 ms\n', '2020-01-07 14:05:56');
INSERT INTO `log` VALUES ('126', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 59 - 9.260 ms\n', '2020-01-07 14:05:56');
INSERT INTO `log` VALUES ('127', '::1 - POST /wechat/login HTTP/1.1 200 309 - 260.255 ms\n', '2020-01-07 14:09:42');
INSERT INTO `log` VALUES ('128', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 41.188 ms\n', '2020-01-07 14:09:42');
INSERT INTO `log` VALUES ('129', '::1 - POST /wechat/login HTTP/1.1 200 309 - 228.271 ms\n', '2020-01-07 14:09:53');
INSERT INTO `log` VALUES ('130', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 35.614 ms\n', '2020-01-07 14:09:53');
INSERT INTO `log` VALUES ('131', '::1 - POST /wechat/login HTTP/1.1 200 309 - 275.597 ms\n', '2020-01-07 14:14:02');
INSERT INTO `log` VALUES ('132', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 33.907 ms\n', '2020-01-07 14:14:03');
INSERT INTO `log` VALUES ('133', '::1 - POST /wechat/login HTTP/1.1 200 309 - 319.124 ms\n', '2020-01-09 13:09:52');
INSERT INTO `log` VALUES ('134', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 34.838 ms\n', '2020-01-09 13:09:52');
INSERT INTO `log` VALUES ('135', '::1 - POST /wechat/login HTTP/1.1 200 309 - 273.972 ms\n', '2020-01-09 13:13:33');
INSERT INTO `log` VALUES ('136', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 17.169 ms\n', '2020-01-09 13:13:34');
INSERT INTO `log` VALUES ('137', '::1 - POST /wechat/login HTTP/1.1 200 309 - 262.100 ms\n', '2020-01-09 13:13:58');
INSERT INTO `log` VALUES ('138', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 16.636 ms\n', '2020-01-09 13:13:59');
INSERT INTO `log` VALUES ('139', '::1 - POST /wechat/login HTTP/1.1 200 309 - 211.921 ms\n', '2020-01-09 13:18:02');
INSERT INTO `log` VALUES ('140', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 27.489 ms\n', '2020-01-09 13:18:03');
INSERT INTO `log` VALUES ('141', '::1 - POST /wechat/login HTTP/1.1 200 309 - 261.947 ms\n', '2020-01-09 13:19:20');
INSERT INTO `log` VALUES ('142', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 20.930 ms\n', '2020-01-09 13:19:20');
INSERT INTO `log` VALUES ('143', '::1 - POST /wechat/login HTTP/1.1 200 59 - 13.440 ms\n', '2020-01-09 13:21:24');
INSERT INTO `log` VALUES ('144', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 59 - 8.615 ms\n', '2020-01-09 13:21:24');
INSERT INTO `log` VALUES ('145', '::1 - POST /wechat/login HTTP/1.1 200 59 - 8.047 ms\n', '2020-01-09 13:21:39');
INSERT INTO `log` VALUES ('146', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 59 - 13.513 ms\n', '2020-01-09 13:21:39');
INSERT INTO `log` VALUES ('147', '::1 - POST /wechat/login HTTP/1.1 200 59 - 11.415 ms\n', '2020-01-09 13:21:57');
INSERT INTO `log` VALUES ('148', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 59 - 9.829 ms\n', '2020-01-09 13:21:57');
INSERT INTO `log` VALUES ('149', '::1 - POST /wechat/login HTTP/1.1 200 309 - 223.112 ms\n', '2020-01-09 13:22:19');
INSERT INTO `log` VALUES ('150', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 16.294 ms\n', '2020-01-09 13:22:19');
INSERT INTO `log` VALUES ('151', '::1 - POST /wechat/login HTTP/1.1 200 309 - 273.772 ms\n', '2020-01-09 13:24:10');
INSERT INTO `log` VALUES ('152', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 14.444 ms\n', '2020-01-09 13:24:10');
INSERT INTO `log` VALUES ('153', '::1 - POST /wechat/login HTTP/1.1 200 309 - 249.099 ms\n', '2020-01-09 13:25:27');
INSERT INTO `log` VALUES ('154', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 15.143 ms\n', '2020-01-09 13:25:27');
INSERT INTO `log` VALUES ('155', '::1 - POST /wechat/login HTTP/1.1 200 309 - 305.852 ms\n', '2020-01-09 13:30:47');
INSERT INTO `log` VALUES ('156', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 25.899 ms\n', '2020-01-09 13:30:47');
INSERT INTO `log` VALUES ('157', '::1 - POST /wechat/login HTTP/1.1 200 309 - 294.058 ms\n', '2020-01-09 13:31:35');
INSERT INTO `log` VALUES ('158', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 30 - 16.465 ms\n', '2020-01-09 13:31:36');
INSERT INTO `log` VALUES ('159', '::1 - POST /wechat/login HTTP/1.1 200 309 - 272.061 ms\n', '2020-01-09 13:45:04');
INSERT INTO `log` VALUES ('160', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 28 - 15.665 ms\n', '2020-01-09 13:45:05');
INSERT INTO `log` VALUES ('161', '::1 - POST /wechat/login HTTP/1.1 200 309 - 269.293 ms\n', '2020-01-09 13:47:09');
INSERT INTO `log` VALUES ('162', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 28 - 17.185 ms\n', '2020-01-09 13:47:09');
INSERT INTO `log` VALUES ('163', '::1 - POST /wechat/login HTTP/1.1 200 309 - 228.131 ms\n', '2020-01-09 13:47:55');
INSERT INTO `log` VALUES ('164', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 28 - 14.377 ms\n', '2020-01-09 13:47:55');
INSERT INTO `log` VALUES ('165', '::1 - POST /wechat/login HTTP/1.1 200 59 - 12.644 ms\n', '2020-01-09 13:49:31');
INSERT INTO `log` VALUES ('166', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 59 - 12.804 ms\n', '2020-01-09 13:49:31');
INSERT INTO `log` VALUES ('167', '::1 - POST /wechat/login HTTP/1.1 200 309 - 247.912 ms\n', '2020-01-09 13:49:47');
INSERT INTO `log` VALUES ('168', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 368 - 28.387 ms\n', '2020-01-09 13:49:47');
INSERT INTO `log` VALUES ('169', '::1 - POST /wechat/login HTTP/1.1 200 59 - 12.216 ms\n', '2020-01-09 13:50:35');
INSERT INTO `log` VALUES ('170', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 59 - 9.187 ms\n', '2020-01-09 13:50:35');
INSERT INTO `log` VALUES ('171', '::1 - POST /wechat/login HTTP/1.1 200 309 - 234.023 ms\n', '2020-01-09 13:50:51');
INSERT INTO `log` VALUES ('172', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 366 - 14.760 ms\n', '2020-01-09 13:50:52');
INSERT INTO `log` VALUES ('173', '::1 - POST /wechat/login HTTP/1.1 200 309 - 282.165 ms\n', '2020-01-09 13:54:36');
INSERT INTO `log` VALUES ('174', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 46.128 ms\n', '2020-01-09 13:54:36');
INSERT INTO `log` VALUES ('175', '::1 - POST /wechat/login HTTP/1.1 200 309 - 225.773 ms\n', '2020-01-09 13:59:09');
INSERT INTO `log` VALUES ('176', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 37.388 ms\n', '2020-01-09 13:59:09');
INSERT INTO `log` VALUES ('177', '::1 - POST /wechat/login HTTP/1.1 200 309 - 221.147 ms\n', '2020-01-09 14:03:36');
INSERT INTO `log` VALUES ('178', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 16.554 ms\n', '2020-01-09 14:03:36');
INSERT INTO `log` VALUES ('179', '::1 - POST /wechat/login HTTP/1.1 200 309 - 265.974 ms\n', '2020-01-09 14:04:26');
INSERT INTO `log` VALUES ('180', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 20.872 ms\n', '2020-01-09 14:04:26');
INSERT INTO `log` VALUES ('181', '::1 - POST /wechat/login HTTP/1.1 200 309 - 218.657 ms\n', '2020-01-09 14:04:43');
INSERT INTO `log` VALUES ('182', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 13.855 ms\n', '2020-01-09 14:04:43');
INSERT INTO `log` VALUES ('183', '::1 - POST /wechat/login HTTP/1.1 200 309 - 215.174 ms\n', '2020-01-09 14:06:47');
INSERT INTO `log` VALUES ('184', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 16.832 ms\n', '2020-01-09 14:06:47');
INSERT INTO `log` VALUES ('185', '::1 - POST /wechat/login HTTP/1.1 200 309 - 220.227 ms\n', '2020-01-09 14:07:08');
INSERT INTO `log` VALUES ('186', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 33.781 ms\n', '2020-01-09 14:07:08');
INSERT INTO `log` VALUES ('187', '::1 - POST /wechat/login HTTP/1.1 200 309 - 219.091 ms\n', '2020-01-09 14:11:03');
INSERT INTO `log` VALUES ('188', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 28.127 ms\n', '2020-01-09 14:11:04');
INSERT INTO `log` VALUES ('189', '::1 - POST /wechat/login HTTP/1.1 200 309 - 214.287 ms\n', '2020-01-09 14:12:18');
INSERT INTO `log` VALUES ('190', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 35.753 ms\n', '2020-01-09 14:12:19');
INSERT INTO `log` VALUES ('191', '::1 - POST /wechat/login HTTP/1.1 200 309 - 245.805 ms\n', '2020-01-09 14:14:20');
INSERT INTO `log` VALUES ('192', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 20.953 ms\n', '2020-01-09 14:14:21');
INSERT INTO `log` VALUES ('193', '::1 - POST /wechat/login HTTP/1.1 200 309 - 301.201 ms\n', '2020-01-09 14:17:18');
INSERT INTO `log` VALUES ('194', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 22.307 ms\n', '2020-01-09 14:17:18');
INSERT INTO `log` VALUES ('195', '::1 - POST /wechat/login HTTP/1.1 200 309 - 227.976 ms\n', '2020-01-09 14:19:08');
INSERT INTO `log` VALUES ('196', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 26.806 ms\n', '2020-01-09 14:19:09');
INSERT INTO `log` VALUES ('197', '::1 - POST /wechat/login HTTP/1.1 200 309 - 247.313 ms\n', '2020-01-09 14:20:51');
INSERT INTO `log` VALUES ('198', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 20.815 ms\n', '2020-01-09 14:20:52');
INSERT INTO `log` VALUES ('199', '::1 - POST /wechat/login HTTP/1.1 200 309 - 239.439 ms\n', '2020-01-09 14:21:37');
INSERT INTO `log` VALUES ('200', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 31.709 ms\n', '2020-01-09 14:21:37');
INSERT INTO `log` VALUES ('201', '::1 - POST /wechat/login HTTP/1.1 200 309 - 224.884 ms\n', '2020-01-09 14:22:28');
INSERT INTO `log` VALUES ('202', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 24.207 ms\n', '2020-01-09 14:22:28');
INSERT INTO `log` VALUES ('203', '::1 - POST /wechat/login HTTP/1.1 200 309 - 210.143 ms\n', '2020-01-09 14:23:25');
INSERT INTO `log` VALUES ('204', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 286 - 20.896 ms\n', '2020-01-09 14:23:26');
INSERT INTO `log` VALUES ('205', '::1 - POST /wechat/login HTTP/1.1 200 309 - 289.686 ms\n', '2020-01-09 16:01:57');
INSERT INTO `log` VALUES ('206', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 301 - 29.585 ms\n', '2020-01-09 16:01:57');
INSERT INTO `log` VALUES ('207', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 38 - 13.280 ms\n', '2020-01-10 10:45:30');
INSERT INTO `log` VALUES ('208', '::1 - POST /wechat/login HTTP/1.1 200 309 - 392.372 ms\n', '2020-01-10 10:45:31');
INSERT INTO `log` VALUES ('209', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 301 - 20.387 ms\n', '2020-01-10 10:45:31');
INSERT INTO `log` VALUES ('210', '::1 - POST /wechat/login HTTP/1.1 200 309 - 341.532 ms\n', '2020-01-10 10:46:46');
INSERT INTO `log` VALUES ('211', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 56 - 19.406 ms\n', '2020-01-10 10:46:46');
INSERT INTO `log` VALUES ('212', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 301 - 16.141 ms\n', '2020-01-10 10:46:47');
INSERT INTO `log` VALUES ('213', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 310.171 ms\n', '2020-01-11 12:58:48');
INSERT INTO `log` VALUES ('214', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 256.721 ms\n', '2020-01-11 12:59:15');
INSERT INTO `log` VALUES ('215', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 259.599 ms\n', '2020-01-11 13:11:26');
INSERT INTO `log` VALUES ('216', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 268.021 ms\n', '2020-01-11 13:11:27');
INSERT INTO `log` VALUES ('217', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 211.159 ms\n', '2020-01-11 13:11:27');
INSERT INTO `log` VALUES ('218', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 276.595 ms\n', '2020-01-11 13:14:21');
INSERT INTO `log` VALUES ('219', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 269.383 ms\n', '2020-01-11 13:15:32');
INSERT INTO `log` VALUES ('220', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 266.600 ms\n', '2020-01-11 13:15:36');
INSERT INTO `log` VALUES ('221', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 250.434 ms\n', '2020-01-11 13:16:06');
INSERT INTO `log` VALUES ('222', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 245.533 ms\n', '2020-01-11 13:16:21');
INSERT INTO `log` VALUES ('223', '::ffff:192.168.56.1 - POST /wechat/update/userinfo HTTP/1.1 200 175 - 19.499 ms\n', '2020-01-11 13:16:23');
INSERT INTO `log` VALUES ('224', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 288.993 ms\n', '2020-01-11 13:20:09');
INSERT INTO `log` VALUES ('225', '::ffff:192.168.56.1 - POST /wechat/update/userinfo HTTP/1.1 200 175 - 14.575 ms\n', '2020-01-11 13:20:23');
INSERT INTO `log` VALUES ('226', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 252.556 ms\n', '2020-01-11 13:22:46');
INSERT INTO `log` VALUES ('227', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 284.218 ms\n', '2020-01-11 13:24:28');
INSERT INTO `log` VALUES ('228', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 231.815 ms\n', '2020-01-11 13:25:12');
INSERT INTO `log` VALUES ('229', '::ffff:192.168.56.1 - POST /wechat/update/userinfo HTTP/1.1 200 301 - 30.010 ms\n', '2020-01-11 13:25:20');
INSERT INTO `log` VALUES ('230', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 289.115 ms\n', '2020-01-11 13:27:22');
INSERT INTO `log` VALUES ('231', '::ffff:192.168.56.1 - POST /wechat/update/userinfo HTTP/1.1 200 301 - 17.695 ms\n', '2020-01-11 13:27:42');
INSERT INTO `log` VALUES ('232', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 222.543 ms\n', '2020-01-11 13:30:02');
INSERT INTO `log` VALUES ('233', '::ffff:192.168.56.1 - POST /wechat/update/userinfo HTTP/1.1 200 301 - 16.640 ms\n', '2020-01-11 13:30:18');
INSERT INTO `log` VALUES ('234', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 243.366 ms\n', '2020-01-11 13:30:35');
INSERT INTO `log` VALUES ('235', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 277.012 ms\n', '2020-01-11 14:07:36');
INSERT INTO `log` VALUES ('236', '::ffff:192.168.56.1 - POST /wechat/update/userinfo HTTP/1.1 200 301 - 18.490 ms\n', '2020-01-11 14:07:47');
INSERT INTO `log` VALUES ('237', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 302.190 ms\n', '2020-01-11 14:31:32');
INSERT INTO `log` VALUES ('238', '::ffff:192.168.56.1 - POST /wechat/update/userinfo HTTP/1.1 200 301 - 28.470 ms\n', '2020-01-11 14:31:35');
INSERT INTO `log` VALUES ('239', '::1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1375 - 35.941 ms\n', '2020-01-11 16:53:03');
INSERT INTO `log` VALUES ('240', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 59 - 63.089 ms\n', '2020-01-11 17:00:32');
INSERT INTO `log` VALUES ('241', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 59 - 6.596 ms\n', '2020-01-11 17:00:38');
INSERT INTO `log` VALUES ('242', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 59 - 4.461 ms\n', '2020-01-11 17:01:19');
INSERT INTO `log` VALUES ('243', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 59 - 17.587 ms\n', '2020-01-11 17:02:14');
INSERT INTO `log` VALUES ('244', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1375 - 12.275 ms\n', '2020-01-11 17:02:59');
INSERT INTO `log` VALUES ('245', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1375 - 11.175 ms\n', '2020-01-11 17:03:11');
INSERT INTO `log` VALUES ('246', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1375 - 24.850 ms\n', '2020-01-12 08:53:12');
INSERT INTO `log` VALUES ('247', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 355.752 ms\n', '2020-01-12 08:54:03');
INSERT INTO `log` VALUES ('248', '::ffff:192.168.56.1 - POST /wechat/update/userinfo HTTP/1.1 200 59 - 13.300 ms\n', '2020-01-12 08:54:28');
INSERT INTO `log` VALUES ('249', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1375 - 13.369 ms\n', '2020-01-12 08:54:41');
INSERT INTO `log` VALUES ('250', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 301.860 ms\n', '2020-01-12 08:54:46');
INSERT INTO `log` VALUES ('251', '::ffff:192.168.56.1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 13.123 ms\n', '2020-01-12 08:54:49');
INSERT INTO `log` VALUES ('252', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1375 - 28.804 ms\n', '2020-01-12 08:54:53');
INSERT INTO `log` VALUES ('253', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 59 - 13.827 ms\n', '2020-01-12 08:57:39');
INSERT INTO `log` VALUES ('254', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 59 - 18.718 ms\n', '2020-01-12 08:57:50');
INSERT INTO `log` VALUES ('255', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 59 - 18.216 ms\n', '2020-01-12 09:09:46');
INSERT INTO `log` VALUES ('256', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1390 - 14.497 ms\n', '2020-01-12 09:10:08');
INSERT INTO `log` VALUES ('257', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1390 - 22.313 ms\n', '2020-01-12 09:11:16');
INSERT INTO `log` VALUES ('258', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1390 - 10.096 ms\n', '2020-01-12 09:11:23');
INSERT INTO `log` VALUES ('259', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1408 - 22.982 ms\n', '2020-01-12 09:13:13');
INSERT INTO `log` VALUES ('260', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1408 - 21.895 ms\n', '2020-01-12 09:19:09');
INSERT INTO `log` VALUES ('261', '::ffff:192.168.56.1 - POST /wechat/login HTTP/1.1 200 309 - 293.068 ms\n', '2020-01-12 09:50:11');
INSERT INTO `log` VALUES ('262', '::ffff:192.168.56.1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 19.793 ms\n', '2020-01-12 09:50:15');
INSERT INTO `log` VALUES ('263', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1408 - 21.146 ms\n', '2020-01-12 09:52:28');
INSERT INTO `log` VALUES ('264', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1408 - 28.428 ms\n', '2020-01-12 09:53:58');
INSERT INTO `log` VALUES ('265', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1408 - 21.140 ms\n', '2020-01-12 09:55:10');
INSERT INTO `log` VALUES ('266', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1408 - 14.578 ms\n', '2020-01-12 09:56:35');
INSERT INTO `log` VALUES ('267', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1408 - 9.445 ms\n', '2020-01-12 09:56:58');
INSERT INTO `log` VALUES ('268', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1408 - 13.700 ms\n', '2020-01-12 09:57:07');
INSERT INTO `log` VALUES ('269', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1408 - 10.282 ms\n', '2020-01-12 09:58:14');
INSERT INTO `log` VALUES ('270', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1408 - 12.270 ms\n', '2020-01-12 09:58:24');
INSERT INTO `log` VALUES ('271', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1408 - 37.619 ms\n', '2020-01-12 10:00:51');
INSERT INTO `log` VALUES ('272', '::ffff:192.168.56.1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1408 - 27.950 ms\n', '2020-01-12 10:01:33');
INSERT INTO `log` VALUES ('273', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 8.102 ms\n', '2020-01-12 10:21:04');
INSERT INTO `log` VALUES ('274', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 18.517 ms\n', '2020-01-12 10:50:22');
INSERT INTO `log` VALUES ('275', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 14.710 ms\n', '2020-01-12 10:53:33');
INSERT INTO `log` VALUES ('276', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 8.807 ms\n', '2020-01-12 10:54:19');
INSERT INTO `log` VALUES ('277', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 10.225 ms\n', '2020-01-12 10:54:35');
INSERT INTO `log` VALUES ('278', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 11.992 ms\n', '2020-01-12 10:54:42');
INSERT INTO `log` VALUES ('279', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 10.045 ms\n', '2020-01-12 10:55:05');
INSERT INTO `log` VALUES ('280', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 8.342 ms\n', '2020-01-12 10:56:03');
INSERT INTO `log` VALUES ('281', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 22.590 ms\n', '2020-01-12 10:56:08');
INSERT INTO `log` VALUES ('282', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 8.044 ms\n', '2020-01-12 10:56:56');
INSERT INTO `log` VALUES ('283', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 9.291 ms\n', '2020-01-12 10:57:04');
INSERT INTO `log` VALUES ('284', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 13.946 ms\n', '2020-01-12 10:58:23');
INSERT INTO `log` VALUES ('285', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 24.477 ms\n', '2020-01-12 10:58:25');
INSERT INTO `log` VALUES ('286', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 21.543 ms\n', '2020-01-12 10:58:42');
INSERT INTO `log` VALUES ('287', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 15.483 ms\n', '2020-01-12 11:07:21');
INSERT INTO `log` VALUES ('288', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 11.851 ms\n', '2020-01-12 11:08:26');
INSERT INTO `log` VALUES ('289', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 15.702 ms\n', '2020-01-12 11:08:31');
INSERT INTO `log` VALUES ('290', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 10.634 ms\n', '2020-01-12 11:11:02');
INSERT INTO `log` VALUES ('291', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 13.218 ms\n', '2020-01-12 11:11:37');
INSERT INTO `log` VALUES ('292', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 13.976 ms\n', '2020-01-12 11:11:45');
INSERT INTO `log` VALUES ('293', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 13.973 ms\n', '2020-01-12 11:13:37');
INSERT INTO `log` VALUES ('294', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 21.679 ms\n', '2020-01-12 11:13:48');
INSERT INTO `log` VALUES ('295', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 12.730 ms\n', '2020-01-12 11:17:32');
INSERT INTO `log` VALUES ('296', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 15.841 ms\n', '2020-01-12 11:18:29');
INSERT INTO `log` VALUES ('297', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 11.914 ms\n', '2020-01-12 11:18:43');
INSERT INTO `log` VALUES ('298', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 13.094 ms\n', '2020-01-12 11:20:25');
INSERT INTO `log` VALUES ('299', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 13.426 ms\n', '2020-01-12 11:20:31');
INSERT INTO `log` VALUES ('300', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 15.104 ms\n', '2020-01-12 11:22:24');
INSERT INTO `log` VALUES ('301', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 13.416 ms\n', '2020-01-12 11:26:42');
INSERT INTO `log` VALUES ('302', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 8.777 ms\n', '2020-01-12 11:27:50');
INSERT INTO `log` VALUES ('303', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 43.499 ms\n', '2020-01-12 11:29:35');
INSERT INTO `log` VALUES ('304', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 18.384 ms\n', '2020-01-12 11:29:52');
INSERT INTO `log` VALUES ('305', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 9.164 ms\n', '2020-01-12 11:35:03');
INSERT INTO `log` VALUES ('306', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 9.364 ms\n', '2020-01-12 11:36:02');
INSERT INTO `log` VALUES ('307', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 10.090 ms\n', '2020-01-12 11:42:18');
INSERT INTO `log` VALUES ('308', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 33.750 ms\n', '2020-01-12 11:45:17');
INSERT INTO `log` VALUES ('309', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 26.980 ms\n', '2020-01-12 11:45:22');
INSERT INTO `log` VALUES ('310', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 22.025 ms\n', '2020-01-12 11:45:55');
INSERT INTO `log` VALUES ('311', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 20.273 ms\n', '2020-01-12 11:46:08');
INSERT INTO `log` VALUES ('312', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 31.027 ms\n', '2020-01-12 11:46:23');
INSERT INTO `log` VALUES ('313', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 27.321 ms\n', '2020-01-12 11:46:27');
INSERT INTO `log` VALUES ('314', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 14.907 ms\n', '2020-01-12 11:46:43');
INSERT INTO `log` VALUES ('315', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 16.251 ms\n', '2020-01-12 11:46:47');
INSERT INTO `log` VALUES ('316', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 14.060 ms\n', '2020-01-12 11:47:30');
INSERT INTO `log` VALUES ('317', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 19.429 ms\n', '2020-01-12 11:48:47');
INSERT INTO `log` VALUES ('318', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 30.076 ms\n', '2020-01-12 11:48:54');
INSERT INTO `log` VALUES ('319', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 16.763 ms\n', '2020-01-12 11:49:20');
INSERT INTO `log` VALUES ('320', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 17.795 ms\n', '2020-01-12 11:51:30');
INSERT INTO `log` VALUES ('321', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 7.595 ms\n', '2020-01-12 11:52:36');
INSERT INTO `log` VALUES ('322', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 6.047 ms\n', '2020-01-12 11:55:45');
INSERT INTO `log` VALUES ('323', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 10.509 ms\n', '2020-01-12 11:55:52');
INSERT INTO `log` VALUES ('324', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 8.648 ms\n', '2020-01-12 11:57:53');
INSERT INTO `log` VALUES ('325', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 6.324 ms\n', '2020-01-12 12:18:11');
INSERT INTO `log` VALUES ('326', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 10.900 ms\n', '2020-01-12 12:51:55');
INSERT INTO `log` VALUES ('327', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1408 - 10.743 ms\n', '2020-01-12 13:09:39');
INSERT INTO `log` VALUES ('328', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 17.246 ms\n', '2020-01-13 11:59:13');
INSERT INTO `log` VALUES ('329', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.072 ms\n', '2020-01-13 11:59:25');
INSERT INTO `log` VALUES ('330', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 10.734 ms\n', '2020-01-13 11:59:34');
INSERT INTO `log` VALUES ('331', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 16.747 ms\n', '2020-01-13 12:01:54');
INSERT INTO `log` VALUES ('332', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 9.485 ms\n', '2020-01-13 12:02:05');
INSERT INTO `log` VALUES ('333', '::1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1408 - 26.200 ms\n', '2020-01-13 12:04:05');
INSERT INTO `log` VALUES ('334', '::1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1390 - 74.770 ms\n', '2020-01-13 12:04:50');
INSERT INTO `log` VALUES ('335', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 10.808 ms\n', '2020-01-13 12:07:31');
INSERT INTO `log` VALUES ('336', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.973 ms\n', '2020-01-13 12:07:37');
INSERT INTO `log` VALUES ('337', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.095 ms\n', '2020-01-13 12:08:11');
INSERT INTO `log` VALUES ('338', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 15.685 ms\n', '2020-01-13 12:08:17');
INSERT INTO `log` VALUES ('339', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.335 ms\n', '2020-01-13 12:08:47');
INSERT INTO `log` VALUES ('340', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.189 ms\n', '2020-01-13 12:08:55');
INSERT INTO `log` VALUES ('341', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 8.180 ms\n', '2020-01-13 12:09:52');
INSERT INTO `log` VALUES ('342', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.572 ms\n', '2020-01-13 12:10:03');
INSERT INTO `log` VALUES ('343', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.351 ms\n', '2020-01-13 12:10:21');
INSERT INTO `log` VALUES ('344', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 4.968 ms\n', '2020-01-13 12:10:44');
INSERT INTO `log` VALUES ('345', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 25.687 ms\n', '2020-01-13 12:12:10');
INSERT INTO `log` VALUES ('346', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 5.683 ms\n', '2020-01-13 12:12:21');
INSERT INTO `log` VALUES ('347', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 95.117 ms\n', '2020-01-13 12:12:53');
INSERT INTO `log` VALUES ('348', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.420 ms\n', '2020-01-13 12:14:54');
INSERT INTO `log` VALUES ('349', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 66.124 ms\n', '2020-01-13 12:18:11');
INSERT INTO `log` VALUES ('350', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 21.187 ms\n', '2020-01-13 12:20:41');
INSERT INTO `log` VALUES ('351', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 12.933 ms\n', '2020-01-13 12:21:05');
INSERT INTO `log` VALUES ('352', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 26.485 ms\n', '2020-01-13 12:21:37');
INSERT INTO `log` VALUES ('353', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 30.548 ms\n', '2020-01-13 12:24:20');
INSERT INTO `log` VALUES ('354', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 50.426 ms\n', '2020-01-13 12:24:54');
INSERT INTO `log` VALUES ('355', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 11.018 ms\n', '2020-01-13 12:26:52');
INSERT INTO `log` VALUES ('356', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.963 ms\n', '2020-01-13 12:39:25');
INSERT INTO `log` VALUES ('357', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 14.162 ms\n', '2020-01-13 12:41:16');
INSERT INTO `log` VALUES ('358', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 9.345 ms\n', '2020-01-13 12:44:57');
INSERT INTO `log` VALUES ('359', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 29.756 ms\n', '2020-01-13 12:45:14');
INSERT INTO `log` VALUES ('360', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 15.065 ms\n', '2020-01-13 12:47:30');
INSERT INTO `log` VALUES ('361', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 61.172 ms\n', '2020-01-13 12:49:43');
INSERT INTO `log` VALUES ('362', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 8.433 ms\n', '2020-01-13 12:52:40');
INSERT INTO `log` VALUES ('363', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 22.210 ms\n', '2020-01-13 12:53:04');
INSERT INTO `log` VALUES ('364', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 40.584 ms\n', '2020-01-13 12:53:54');
INSERT INTO `log` VALUES ('365', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 8.115 ms\n', '2020-01-13 12:54:12');
INSERT INTO `log` VALUES ('366', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 88.271 ms\n', '2020-01-13 13:50:09');
INSERT INTO `log` VALUES ('367', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 5.895 ms\n', '2020-01-13 13:51:16');
INSERT INTO `log` VALUES ('368', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.693 ms\n', '2020-01-13 13:52:13');
INSERT INTO `log` VALUES ('369', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 37.343 ms\n', '2020-01-13 13:57:53');
INSERT INTO `log` VALUES ('370', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 35.700 ms\n', '2020-01-13 14:01:52');
INSERT INTO `log` VALUES ('371', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 9.565 ms\n', '2020-01-13 14:04:21');
INSERT INTO `log` VALUES ('372', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 16.579 ms\n', '2020-01-13 14:05:06');
INSERT INTO `log` VALUES ('373', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 21.835 ms\n', '2020-01-13 14:06:48');
INSERT INTO `log` VALUES ('374', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.758 ms\n', '2020-01-13 14:10:56');
INSERT INTO `log` VALUES ('375', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 29.160 ms\n', '2020-01-13 14:12:11');
INSERT INTO `log` VALUES ('376', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 32.878 ms\n', '2020-01-13 14:12:30');
INSERT INTO `log` VALUES ('377', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 31.893 ms\n', '2020-01-13 14:16:14');
INSERT INTO `log` VALUES ('378', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 31.949 ms\n', '2020-01-13 14:16:53');
INSERT INTO `log` VALUES ('379', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 14.975 ms\n', '2020-01-13 14:17:10');
INSERT INTO `log` VALUES ('380', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 28.000 ms\n', '2020-01-13 14:17:51');
INSERT INTO `log` VALUES ('381', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 19.447 ms\n', '2020-01-13 14:18:52');
INSERT INTO `log` VALUES ('382', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 41.045 ms\n', '2020-01-13 14:20:45');
INSERT INTO `log` VALUES ('383', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 21.589 ms\n', '2020-01-13 14:21:09');
INSERT INTO `log` VALUES ('384', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 11.990 ms\n', '2020-01-13 14:21:24');
INSERT INTO `log` VALUES ('385', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 56.185 ms\n', '2020-01-13 14:21:59');
INSERT INTO `log` VALUES ('386', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.155 ms\n', '2020-01-13 14:22:51');
INSERT INTO `log` VALUES ('387', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 5.991 ms\n', '2020-01-13 14:24:22');
INSERT INTO `log` VALUES ('388', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 9.628 ms\n', '2020-01-13 14:26:13');
INSERT INTO `log` VALUES ('389', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 37.266 ms\n', '2020-01-13 14:27:03');
INSERT INTO `log` VALUES ('390', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 21.975 ms\n', '2020-01-13 14:27:13');
INSERT INTO `log` VALUES ('391', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 18.594 ms\n', '2020-01-13 14:27:39');
INSERT INTO `log` VALUES ('392', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 13.257 ms\n', '2020-01-13 14:29:40');
INSERT INTO `log` VALUES ('393', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 17.159 ms\n', '2020-01-13 14:30:09');
INSERT INTO `log` VALUES ('394', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 28.979 ms\n', '2020-01-13 14:32:11');
INSERT INTO `log` VALUES ('395', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 51.834 ms\n', '2020-01-13 14:34:26');
INSERT INTO `log` VALUES ('396', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 19.728 ms\n', '2020-01-13 14:34:29');
INSERT INTO `log` VALUES ('397', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 9.858 ms\n', '2020-01-13 14:36:41');
INSERT INTO `log` VALUES ('398', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 56.172 ms\n', '2020-01-13 14:38:06');
INSERT INTO `log` VALUES ('399', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 60.097 ms\n', '2020-01-13 14:39:23');
INSERT INTO `log` VALUES ('400', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 44.390 ms\n', '2020-01-13 14:39:53');
INSERT INTO `log` VALUES ('401', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.784 ms\n', '2020-01-13 14:40:59');
INSERT INTO `log` VALUES ('402', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 18.401 ms\n', '2020-01-13 14:41:24');
INSERT INTO `log` VALUES ('403', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.139 ms\n', '2020-01-13 14:42:14');
INSERT INTO `log` VALUES ('404', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 22.780 ms\n', '2020-01-13 14:42:48');
INSERT INTO `log` VALUES ('405', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 10.844 ms\n', '2020-01-13 14:44:04');
INSERT INTO `log` VALUES ('406', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 30.494 ms\n', '2020-01-13 14:48:22');
INSERT INTO `log` VALUES ('407', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 13.230 ms\n', '2020-01-13 14:51:40');
INSERT INTO `log` VALUES ('408', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 19.069 ms\n', '2020-01-13 14:51:59');
INSERT INTO `log` VALUES ('409', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 21.800 ms\n', '2020-01-13 14:52:56');
INSERT INTO `log` VALUES ('410', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 20.725 ms\n', '2020-01-13 14:53:33');
INSERT INTO `log` VALUES ('411', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.958 ms\n', '2020-01-13 14:54:30');
INSERT INTO `log` VALUES ('412', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 15.564 ms\n', '2020-01-13 14:54:59');
INSERT INTO `log` VALUES ('413', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 10.063 ms\n', '2020-01-13 14:55:15');
INSERT INTO `log` VALUES ('414', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.235 ms\n', '2020-01-13 14:58:16');
INSERT INTO `log` VALUES ('415', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 25.018 ms\n', '2020-01-13 14:59:08');
INSERT INTO `log` VALUES ('416', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 26.472 ms\n', '2020-01-13 15:00:09');
INSERT INTO `log` VALUES ('417', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 21.427 ms\n', '2020-01-13 15:00:34');
INSERT INTO `log` VALUES ('418', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 40.794 ms\n', '2020-01-13 15:01:11');
INSERT INTO `log` VALUES ('419', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 16.393 ms\n', '2020-01-13 15:01:45');
INSERT INTO `log` VALUES ('420', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 11.596 ms\n', '2020-01-13 15:03:31');
INSERT INTO `log` VALUES ('421', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.857 ms\n', '2020-01-13 15:04:14');
INSERT INTO `log` VALUES ('422', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 52.629 ms\n', '2020-01-13 15:50:19');
INSERT INTO `log` VALUES ('423', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 48.377 ms\n', '2020-01-13 15:54:05');
INSERT INTO `log` VALUES ('424', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 15.553 ms\n', '2020-01-13 15:55:19');
INSERT INTO `log` VALUES ('425', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 42.973 ms\n', '2020-01-13 15:55:26');
INSERT INTO `log` VALUES ('426', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 8.177 ms\n', '2020-01-13 15:55:54');
INSERT INTO `log` VALUES ('427', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 55.677 ms\n', '2020-01-13 15:56:13');
INSERT INTO `log` VALUES ('428', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 47.739 ms\n', '2020-01-13 15:59:25');
INSERT INTO `log` VALUES ('429', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 4.458 ms\n', '2020-01-13 15:59:44');
INSERT INTO `log` VALUES ('430', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 14.959 ms\n', '2020-01-13 16:00:56');
INSERT INTO `log` VALUES ('431', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 14.740 ms\n', '2020-01-13 16:02:39');
INSERT INTO `log` VALUES ('432', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 11.428 ms\n', '2020-01-13 16:06:39');
INSERT INTO `log` VALUES ('433', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 22.657 ms\n', '2020-01-13 16:08:06');
INSERT INTO `log` VALUES ('434', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 8.564 ms\n', '2020-01-13 16:08:35');
INSERT INTO `log` VALUES ('435', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 42.123 ms\n', '2020-01-13 16:08:48');
INSERT INTO `log` VALUES ('436', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 14.141 ms\n', '2020-01-13 16:09:51');
INSERT INTO `log` VALUES ('437', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 8.812 ms\n', '2020-01-13 16:10:02');
INSERT INTO `log` VALUES ('438', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 11.430 ms\n', '2020-01-13 16:10:43');
INSERT INTO `log` VALUES ('439', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 11.899 ms\n', '2020-01-13 16:11:00');
INSERT INTO `log` VALUES ('440', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 23.379 ms\n', '2020-01-13 16:11:27');
INSERT INTO `log` VALUES ('441', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 29.951 ms\n', '2020-01-13 16:15:55');
INSERT INTO `log` VALUES ('442', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 28.954 ms\n', '2020-01-13 16:16:11');
INSERT INTO `log` VALUES ('443', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 11.681 ms\n', '2020-01-13 16:24:11');
INSERT INTO `log` VALUES ('444', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 16.403 ms\n', '2020-01-13 16:25:18');
INSERT INTO `log` VALUES ('445', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 16.324 ms\n', '2020-01-13 16:25:53');
INSERT INTO `log` VALUES ('446', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 48.091 ms\n', '2020-01-13 16:27:07');
INSERT INTO `log` VALUES ('447', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 75.240 ms\n', '2020-01-13 16:27:16');
INSERT INTO `log` VALUES ('448', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 44.662 ms\n', '2020-01-13 16:27:34');
INSERT INTO `log` VALUES ('449', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.588 ms\n', '2020-01-13 16:27:47');
INSERT INTO `log` VALUES ('450', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.115 ms\n', '2020-01-13 16:34:22');
INSERT INTO `log` VALUES ('451', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 33.170 ms\n', '2020-01-13 18:21:03');
INSERT INTO `log` VALUES ('452', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 45.455 ms\n', '2020-01-13 18:43:02');
INSERT INTO `log` VALUES ('453', '::1 - POST /wechat/login HTTP/1.1 200 309 - 366.937 ms\n', '2020-01-13 18:43:06');
INSERT INTO `log` VALUES ('454', '::1 - POST /wechat/login HTTP/1.1 200 309 - 299.651 ms\n', '2020-01-13 18:43:11');
INSERT INTO `log` VALUES ('455', '::1 - POST /wechat/login HTTP/1.1 200 309 - 276.617 ms\n', '2020-01-13 18:43:13');
INSERT INTO `log` VALUES ('456', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 48.767 ms\n', '2020-01-13 18:43:21');
INSERT INTO `log` VALUES ('457', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 22.015 ms\n', '2020-01-13 18:44:23');
INSERT INTO `log` VALUES ('458', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 20.956 ms\n', '2020-01-13 18:44:49');
INSERT INTO `log` VALUES ('459', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 78.524 ms\n', '2020-01-13 18:46:07');
INSERT INTO `log` VALUES ('460', '::1 - POST /wechat/login HTTP/1.1 200 309 - 257.554 ms\n', '2020-01-13 18:46:22');
INSERT INTO `log` VALUES ('461', '::1 - POST /wechat/login HTTP/1.1 200 309 - 238.053 ms\n', '2020-01-13 18:46:23');
INSERT INTO `log` VALUES ('462', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 63.130 ms\n', '2020-01-13 18:51:24');
INSERT INTO `log` VALUES ('463', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 106.764 ms\n', '2020-01-13 18:53:55');
INSERT INTO `log` VALUES ('464', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 21.581 ms\n', '2020-01-13 18:54:57');
INSERT INTO `log` VALUES ('465', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 71.652 ms\n', '2020-01-13 18:55:04');
INSERT INTO `log` VALUES ('466', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 29.797 ms\n', '2020-01-13 18:55:37');
INSERT INTO `log` VALUES ('467', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 53.792 ms\n', '2020-01-13 18:56:26');
INSERT INTO `log` VALUES ('468', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 44.898 ms\n', '2020-01-13 18:58:04');
INSERT INTO `log` VALUES ('469', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 39.498 ms\n', '2020-01-13 18:58:26');
INSERT INTO `log` VALUES ('470', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 66.199 ms\n', '2020-01-13 18:59:38');
INSERT INTO `log` VALUES ('471', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 14.635 ms\n', '2020-01-13 19:00:48');
INSERT INTO `log` VALUES ('472', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 75.370 ms\n', '2020-01-13 19:01:50');
INSERT INTO `log` VALUES ('473', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 13.674 ms\n', '2020-01-13 19:03:19');
INSERT INTO `log` VALUES ('474', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 61.520 ms\n', '2020-01-13 19:03:56');
INSERT INTO `log` VALUES ('475', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1390 - 16.864 ms\n', '2020-01-13 19:04:01');
INSERT INTO `log` VALUES ('476', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 19.196 ms\n', '2020-01-14 10:41:24');
INSERT INTO `log` VALUES ('477', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 33.444 ms\n', '2020-01-14 10:45:59');
INSERT INTO `log` VALUES ('478', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 15.944 ms\n', '2020-01-14 10:50:59');
INSERT INTO `log` VALUES ('479', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 40.040 ms\n', '2020-01-14 10:51:42');
INSERT INTO `log` VALUES ('480', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.291 ms\n', '2020-01-14 10:53:34');
INSERT INTO `log` VALUES ('481', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.921 ms\n', '2020-01-14 10:53:42');
INSERT INTO `log` VALUES ('482', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 5.749 ms\n', '2020-01-14 11:00:43');
INSERT INTO `log` VALUES ('483', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 87.594 ms\n', '2020-01-14 11:02:12');
INSERT INTO `log` VALUES ('484', '::1 - POST /wechat/login HTTP/1.1 200 59 - 4.154 ms\n', '2020-01-14 11:02:13');
INSERT INTO `log` VALUES ('485', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.201 ms\n', '2020-01-14 11:03:46');
INSERT INTO `log` VALUES ('486', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 5.640 ms\n', '2020-01-14 11:04:38');
INSERT INTO `log` VALUES ('487', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 10.984 ms\n', '2020-01-14 11:05:19');
INSERT INTO `log` VALUES ('488', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 36.002 ms\n', '2020-01-14 11:08:12');
INSERT INTO `log` VALUES ('489', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 75.215 ms\n', '2020-01-14 11:08:43');
INSERT INTO `log` VALUES ('490', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 9.844 ms\n', '2020-01-14 11:09:45');
INSERT INTO `log` VALUES ('491', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 12.960 ms\n', '2020-01-14 11:12:56');
INSERT INTO `log` VALUES ('492', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.139 ms\n', '2020-01-14 11:14:58');
INSERT INTO `log` VALUES ('493', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 22.890 ms\n', '2020-01-14 11:16:41');
INSERT INTO `log` VALUES ('494', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.551 ms\n', '2020-01-14 11:17:28');
INSERT INTO `log` VALUES ('495', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 18.544 ms\n', '2020-01-14 11:18:23');
INSERT INTO `log` VALUES ('496', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 103.376 ms\n', '2020-01-14 11:18:52');
INSERT INTO `log` VALUES ('497', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 16.573 ms\n', '2020-01-14 11:19:32');
INSERT INTO `log` VALUES ('498', '::1 - POST /wechat/login HTTP/1.1 200 59 - 7.693 ms\n', '2020-01-14 11:19:34');
INSERT INTO `log` VALUES ('499', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.748 ms\n', '2020-01-14 11:21:24');
INSERT INTO `log` VALUES ('500', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 22.764 ms\n', '2020-01-14 11:22:17');
INSERT INTO `log` VALUES ('501', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.032 ms\n', '2020-01-14 11:23:38');
INSERT INTO `log` VALUES ('502', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.721 ms\n', '2020-01-14 11:24:15');
INSERT INTO `log` VALUES ('503', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 23.795 ms\n', '2020-01-14 11:24:31');
INSERT INTO `log` VALUES ('504', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.649 ms\n', '2020-01-14 11:24:35');
INSERT INTO `log` VALUES ('505', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 9.239 ms\n', '2020-01-14 11:26:01');
INSERT INTO `log` VALUES ('506', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.095 ms\n', '2020-01-14 11:28:01');
INSERT INTO `log` VALUES ('507', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 18.020 ms\n', '2020-01-14 11:28:15');
INSERT INTO `log` VALUES ('508', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 26.546 ms\n', '2020-01-14 11:33:08');
INSERT INTO `log` VALUES ('509', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 5.975 ms\n', '2020-01-14 11:36:29');
INSERT INTO `log` VALUES ('510', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 39.582 ms\n', '2020-01-14 11:39:10');
INSERT INTO `log` VALUES ('511', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 58.791 ms\n', '2020-01-14 11:49:11');
INSERT INTO `log` VALUES ('512', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 103.130 ms\n', '2020-01-14 12:07:16');
INSERT INTO `log` VALUES ('513', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 22.075 ms\n', '2020-01-14 12:07:38');
INSERT INTO `log` VALUES ('514', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 5.376 ms\n', '2020-01-14 12:08:23');
INSERT INTO `log` VALUES ('515', '::1 - GET /index/index/getCommentInfo?pageSize=10&pageNum=1 HTTP/1.1 200 38 - 19.840 ms\n', '2020-01-14 13:23:09');
INSERT INTO `log` VALUES ('516', '::1 - GET /index/index/getCommentInfo?pageSize=10&pageNum=1 HTTP/1.1 200 38 - 87.826 ms\n', '2020-01-14 13:23:31');
INSERT INTO `log` VALUES ('517', '::1 - GET /index/getCommentInfo?pageSize=10&pageNum=1 HTTP/1.1 200 38 - 23.232 ms\n', '2020-01-14 13:23:42');
INSERT INTO `log` VALUES ('518', '::1 - GET /index/getCommentInfo?pageSize=10&pageNum=1 HTTP/1.1 200 1761 - 42.141 ms\n', '2020-01-14 13:25:08');
INSERT INTO `log` VALUES ('519', '::1 - GET /index/getCommentInfo?pageSize=10&pageNum=2 HTTP/1.1 200 1761 - 52.468 ms\n', '2020-01-14 13:27:02');
INSERT INTO `log` VALUES ('520', '::1 - GET /index/getCommentInfo?pageSize=10&pageNum=2 HTTP/1.1 200 1761 - 36.800 ms\n', '2020-01-14 13:28:11');
INSERT INTO `log` VALUES ('521', '::1 - GET /index/getCommentInfo?pageSize=10&pageNum=2 HTTP/1.1 200 1746 - 40.147 ms\n', '2020-01-14 13:31:10');
INSERT INTO `log` VALUES ('522', '::1 - GET /index/getCommentInfo?pageSize=10&pageNum=2 HTTP/1.1 200 1746 - 55.269 ms\n', '2020-01-14 13:32:06');
INSERT INTO `log` VALUES ('523', '::1 - GET /index/getCommentInfo?pageSize=10&pageNum=2 HTTP/1.1 200 1746 - 78.400 ms\n', '2020-01-14 13:34:46');
INSERT INTO `log` VALUES ('524', '::1 - GET /index/getCommentInfo?pageSize=10&pageNum=2 HTTP/1.1 200 1746 - 58.303 ms\n', '2020-01-14 13:35:48');
INSERT INTO `log` VALUES ('525', '::1 - GET /index/getCommentInfo?pageSize=10&pageNum=2 HTTP/1.1 200 1746 - 48.330 ms\n', '2020-01-14 13:36:34');
INSERT INTO `log` VALUES ('526', '::1 - GET /index/getCommentInfo?pageSize=10&pageNum=2 HTTP/1.1 200 1746 - 45.502 ms\n', '2020-01-14 13:40:14');
INSERT INTO `log` VALUES ('527', '::1 - GET /index/getCommentInfo?pageSize=10&pageNum=2 HTTP/1.1 200 79 - 47.110 ms\n', '2020-01-14 13:41:35');
INSERT INTO `log` VALUES ('528', '::1 - GET /index/getCommentInfo?pageSize=10&pageNum=1 HTTP/1.1 200 1751 - 77.570 ms\n', '2020-01-14 13:41:44');
INSERT INTO `log` VALUES ('529', '::1 - GET /index/commentgroup/commentInfo?pageSize=10&pageNum=1&commentGroup=1 HTTP/1.1 200 1366 - 23.828 ms\n', '2020-01-14 13:43:21');
INSERT INTO `log` VALUES ('530', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 16.446 ms\n', '2020-01-14 13:45:16');
INSERT INTO `log` VALUES ('531', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 9.593 ms\n', '2020-01-14 13:46:13');
INSERT INTO `log` VALUES ('532', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 16.959 ms\n', '2020-01-14 13:47:06');
INSERT INTO `log` VALUES ('533', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 7.534 ms\n', '2020-01-14 13:47:12');
INSERT INTO `log` VALUES ('534', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 11.001 ms\n', '2020-01-14 13:48:34');
INSERT INTO `log` VALUES ('535', '::1 - GET /index/getCommentInfo?pageSize=10&pageNum=1 HTTP/1.1 200 1751 - 47.357 ms\n', '2020-01-14 13:49:34');
INSERT INTO `log` VALUES ('536', '::1 - GET /index/commentgroup/commentInfo?pageSize=10&pageNum=1&commentGroup=1 HTTP/1.1 200 1366 - 25.030 ms\n', '2020-01-14 14:01:48');
INSERT INTO `log` VALUES ('537', '::1 - GET /index/commentgroup/commentInfo?pageSize=10&pageNum=1&commentGroup=1 HTTP/1.1 200 1435 - 28.610 ms\n', '2020-01-14 14:02:20');
INSERT INTO `log` VALUES ('538', '::1 - GET /index/commentgroup/commentInfo?pageSize=10&pageNum=1&commentGroup=1 HTTP/1.1 200 1405 - 23.945 ms\n', '2020-01-14 14:03:30');
INSERT INTO `log` VALUES ('539', '::1 - GET /index/commentgroup/commentInfo?pageSize=10&pageNum=1&commentGroup=1 HTTP/1.1 200 1405 - 48.051 ms\n', '2020-01-14 14:04:53');
INSERT INTO `log` VALUES ('540', '::1 - GET /index/commentgroup/commentInfo?pageSize=10&pageNum=1&commentGroup=1 HTTP/1.1 200 1419 - 25.054 ms\n', '2020-01-14 14:05:39');
INSERT INTO `log` VALUES ('541', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 12.285 ms\n', '2020-01-14 14:06:32');
INSERT INTO `log` VALUES ('542', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 15.056 ms\n', '2020-01-14 14:07:16');
INSERT INTO `log` VALUES ('543', '::1 - GET /index/getCommentInfo?pageSize=10&pageNum=1 HTTP/1.1 200 1751 - 43.364 ms\n', '2020-01-14 14:07:30');
INSERT INTO `log` VALUES ('544', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 10.485 ms\n', '2020-01-14 14:14:59');
INSERT INTO `log` VALUES ('545', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 3.538 ms\n', '2020-01-14 14:15:48');
INSERT INTO `log` VALUES ('546', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 17.256 ms\n', '2020-01-14 14:15:59');
INSERT INTO `log` VALUES ('547', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 29.379 ms\n', '2020-01-14 14:16:42');
INSERT INTO `log` VALUES ('548', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 66.005 ms\n', '2020-01-14 14:17:04');
INSERT INTO `log` VALUES ('549', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 59 - 105.810 ms\n', '2020-01-14 14:17:56');
INSERT INTO `log` VALUES ('550', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 82.081 ms\n', '2020-01-14 14:17:56');
INSERT INTO `log` VALUES ('551', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 59 - 8.556 ms\n', '2020-01-14 14:18:28');
INSERT INTO `log` VALUES ('552', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 5.140 ms\n', '2020-01-14 14:18:28');
INSERT INTO `log` VALUES ('553', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 59 - 5.477 ms\n', '2020-01-14 14:19:13');
INSERT INTO `log` VALUES ('554', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 10.393 ms\n', '2020-01-14 14:19:13');
INSERT INTO `log` VALUES ('555', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 59 - 18.188 ms\n', '2020-01-14 14:19:19');
INSERT INTO `log` VALUES ('556', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 10.436 ms\n', '2020-01-14 14:19:19');
INSERT INTO `log` VALUES ('557', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 59 - 17.760 ms\n', '2020-01-14 14:19:55');
INSERT INTO `log` VALUES ('558', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 36.669 ms\n', '2020-01-14 14:19:56');
INSERT INTO `log` VALUES ('559', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 59 - 12.428 ms\n', '2020-01-14 14:21:37');
INSERT INTO `log` VALUES ('560', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 10.404 ms\n', '2020-01-14 14:21:37');
INSERT INTO `log` VALUES ('561', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 59 - 14.750 ms\n', '2020-01-14 14:21:46');
INSERT INTO `log` VALUES ('562', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 5.348 ms\n', '2020-01-14 14:21:46');
INSERT INTO `log` VALUES ('563', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 59 - 5.978 ms\n', '2020-01-14 14:22:20');
INSERT INTO `log` VALUES ('564', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 28.859 ms\n', '2020-01-14 14:22:20');
INSERT INTO `log` VALUES ('565', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 59 - 11.470 ms\n', '2020-01-14 14:24:11');
INSERT INTO `log` VALUES ('566', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 4.870 ms\n', '2020-01-14 14:24:11');
INSERT INTO `log` VALUES ('567', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 59 - 10.655 ms\n', '2020-01-14 14:24:13');
INSERT INTO `log` VALUES ('568', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 59 - 25.908 ms\n', '2020-01-14 14:24:50');
INSERT INTO `log` VALUES ('569', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 18.607 ms\n', '2020-01-14 14:24:50');
INSERT INTO `log` VALUES ('570', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 59 - 11.139 ms\n', '2020-01-14 14:25:07');
INSERT INTO `log` VALUES ('571', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1750 - 48.305 ms\n', '2020-01-14 14:25:22');
INSERT INTO `log` VALUES ('572', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1750 - 60.555 ms\n', '2020-01-14 14:26:10');
INSERT INTO `log` VALUES ('573', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1750 - 71.756 ms\n', '2020-01-14 14:26:12');
INSERT INTO `log` VALUES ('574', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 - - - - ms\n', '2020-01-14 14:27:09');
INSERT INTO `log` VALUES ('575', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1750 - 31.820 ms\n', '2020-01-14 14:27:11');
INSERT INTO `log` VALUES ('576', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1750 - 54.214 ms\n', '2020-01-14 14:27:12');
INSERT INTO `log` VALUES ('577', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 - - - - ms\n', '2020-01-14 14:28:11');
INSERT INTO `log` VALUES ('578', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1491 - 37.154 ms\n', '2020-01-14 14:29:35');
INSERT INTO `log` VALUES ('579', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1491 - 35.233 ms\n', '2020-01-14 14:33:42');
INSERT INTO `log` VALUES ('580', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1491 - 80.999 ms\n', '2020-01-14 14:33:43');
INSERT INTO `log` VALUES ('581', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1491 - 39.097 ms\n', '2020-01-14 14:34:05');
INSERT INTO `log` VALUES ('582', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1491 - 35.990 ms\n', '2020-01-14 14:34:08');
INSERT INTO `log` VALUES ('583', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1491 - 46.443 ms\n', '2020-01-14 14:34:10');
INSERT INTO `log` VALUES ('584', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1491 - 52.799 ms\n', '2020-01-14 14:34:23');
INSERT INTO `log` VALUES ('585', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1491 - 63.667 ms\n', '2020-01-14 14:34:27');
INSERT INTO `log` VALUES ('586', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 - - - - ms\n', '2020-01-14 14:34:42');
INSERT INTO `log` VALUES ('587', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1491 - 32.851 ms\n', '2020-01-14 14:37:36');
INSERT INTO `log` VALUES ('588', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 - - - - ms\n', '2020-01-14 14:38:36');
INSERT INTO `log` VALUES ('589', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8 HTTP/1.1 200 1491 - 30.684 ms\n', '2020-01-14 14:40:54');
INSERT INTO `log` VALUES ('590', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 - - - - ms\n', '2020-01-14 14:41:30');
INSERT INTO `log` VALUES ('591', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=undefined HTTP/1.1 200 1491 - 28.787 ms\n', '2020-01-14 14:41:32');
INSERT INTO `log` VALUES ('592', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1491 - 123.942 ms\n', '2020-01-14 14:41:34');
INSERT INTO `log` VALUES ('593', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 1491 - 47.512 ms\n', '2020-01-14 14:41:38');
INSERT INTO `log` VALUES ('594', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=3 HTTP/1.1 200 1491 - 58.625 ms\n', '2020-01-14 14:41:45');
INSERT INTO `log` VALUES ('595', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1491 - 39.460 ms\n', '2020-01-14 14:42:01');
INSERT INTO `log` VALUES ('596', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 - - - - ms\n', '2020-01-14 14:42:32');
INSERT INTO `log` VALUES ('597', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1491 - 51.794 ms\n', '2020-01-14 14:46:32');
INSERT INTO `log` VALUES ('598', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 78 - 52.696 ms\n', '2020-01-14 14:46:37');
INSERT INTO `log` VALUES ('599', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=3 HTTP/1.1 200 78 - 62.860 ms\n', '2020-01-14 14:46:40');
INSERT INTO `log` VALUES ('600', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1491 - 50.871 ms\n', '2020-01-14 14:46:43');
INSERT INTO `log` VALUES ('601', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1491 - 70.997 ms\n', '2020-01-14 14:49:41');
INSERT INTO `log` VALUES ('602', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1491 - 56.418 ms\n', '2020-01-14 14:49:48');
INSERT INTO `log` VALUES ('603', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 - - - - ms\n', '2020-01-14 14:52:34');
INSERT INTO `log` VALUES ('604', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1491 - 56.122 ms\n', '2020-01-14 14:52:37');
INSERT INTO `log` VALUES ('605', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 78 - 66.377 ms\n', '2020-01-14 14:52:40');
INSERT INTO `log` VALUES ('606', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 - - - - ms\n', '2020-01-14 14:53:36');
INSERT INTO `log` VALUES ('607', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1491 - 61.697 ms\n', '2020-01-14 14:53:51');
INSERT INTO `log` VALUES ('608', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 78 - 41.508 ms\n', '2020-01-14 14:53:54');
INSERT INTO `log` VALUES ('609', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=3 HTTP/1.1 200 78 - 40.950 ms\n', '2020-01-14 14:53:58');
INSERT INTO `log` VALUES ('610', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 78 - 72.853 ms\n', '2020-01-14 14:54:04');
INSERT INTO `log` VALUES ('611', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1491 - 30.097 ms\n', '2020-01-14 14:54:08');
INSERT INTO `log` VALUES ('612', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 - - - - ms\n', '2020-01-14 14:54:50');
INSERT INTO `log` VALUES ('613', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1491 - 49.749 ms\n', '2020-01-14 14:55:00');
INSERT INTO `log` VALUES ('614', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1491 - 44.963 ms\n', '2020-01-14 14:55:07');
INSERT INTO `log` VALUES ('615', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=3 HTTP/1.1 200 78 - 55.903 ms\n', '2020-01-14 14:55:13');
INSERT INTO `log` VALUES ('616', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 78 - 122.435 ms\n', '2020-01-14 14:55:16');
INSERT INTO `log` VALUES ('617', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1491 - 46.269 ms\n', '2020-01-14 14:55:21');
INSERT INTO `log` VALUES ('618', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1505 - 50.617 ms\n', '2020-01-14 14:58:57');
INSERT INTO `log` VALUES ('619', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 - - - - ms\n', '2020-01-14 14:59:57');
INSERT INTO `log` VALUES ('620', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1505 - 58.442 ms\n', '2020-01-14 15:00:40');
INSERT INTO `log` VALUES ('621', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 - - - - ms\n', '2020-01-14 15:01:06');
INSERT INTO `log` VALUES ('622', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1505 - 46.776 ms\n', '2020-01-14 15:01:09');
INSERT INTO `log` VALUES ('623', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 92 - 48.840 ms\n', '2020-01-14 15:01:12');
INSERT INTO `log` VALUES ('624', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=3 HTTP/1.1 200 92 - 63.340 ms\n', '2020-01-14 15:01:15');
INSERT INTO `log` VALUES ('625', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1505 - 48.304 ms\n', '2020-01-14 15:01:21');
INSERT INTO `log` VALUES ('626', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1505 - 67.109 ms\n', '2020-01-14 15:01:38');
INSERT INTO `log` VALUES ('627', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1505 - 45.588 ms\n', '2020-01-14 15:01:40');
INSERT INTO `log` VALUES ('628', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 - - - - ms\n', '2020-01-14 15:01:59');
INSERT INTO `log` VALUES ('629', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1505 - 35.344 ms\n', '2020-01-14 15:18:43');
INSERT INTO `log` VALUES ('630', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1505 - 35.765 ms\n', '2020-01-14 15:18:48');
INSERT INTO `log` VALUES ('631', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1505 - 42.687 ms\n', '2020-01-14 15:19:05');
INSERT INTO `log` VALUES ('632', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1505 - 45.208 ms\n', '2020-01-14 15:19:18');
INSERT INTO `log` VALUES ('633', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1505 - 54.724 ms\n', '2020-01-14 15:20:08');
INSERT INTO `log` VALUES ('634', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1505 - 47.230 ms\n', '2020-01-14 15:20:10');
INSERT INTO `log` VALUES ('635', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 - - - - ms\n', '2020-01-14 15:20:24');
INSERT INTO `log` VALUES ('636', '::1 - GET /index/updateVideoLike?like=true&userId=1&videoId=1 HTTP/1.1 200 38 - 19.527 ms\n', '2020-01-15 10:52:58');
INSERT INTO `log` VALUES ('637', '::1 - GET /index/updateVideoLike?like=true&userId=1&videoId=1 HTTP/1.1 - - - - ms\n', '2020-01-15 10:56:40');
INSERT INTO `log` VALUES ('638', '::1 - GET /index/updateVideoLike?like=true&userId=1&videoId=1 HTTP/1.1 - - - - ms\n', '2020-01-15 10:59:27');
INSERT INTO `log` VALUES ('639', '::1 - GET /index/updateVideoLike?like=true&userId=1&videoId=1 HTTP/1.1 - - - - ms\n', '2020-01-15 11:03:05');
INSERT INTO `log` VALUES ('640', '::1 - GET /index/updateVideoLike?like=true&userId=1&videoId=1 HTTP/1.1 - - - - ms\n', '2020-01-15 11:12:13');
INSERT INTO `log` VALUES ('641', '::1 - GET /index/updateVideoLike?like=true&userId=1&videoId=1 HTTP/1.1 - - - - ms\n', '2020-01-15 11:20:47');
INSERT INTO `log` VALUES ('642', '::1 - GET /index/updateVideoLike?like=true&userId=1&videoId=1 HTTP/1.1 200 30 - 23.460 ms\n', '2020-01-15 11:51:32');
INSERT INTO `log` VALUES ('643', '::1 - GET /index/updateVideoLike?like=true&userId=1&videoId=1 HTTP/1.1 200 30 - 14.731 ms\n', '2020-01-15 11:51:36');
INSERT INTO `log` VALUES ('644', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1189 - 16.792 ms\n', '2020-01-15 11:53:49');
INSERT INTO `log` VALUES ('645', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1189 - 28.877 ms\n', '2020-01-15 11:55:30');
INSERT INTO `log` VALUES ('646', '::ffff:192.168.56.1 - GET /index/updateVideoLike HTTP/1.1 200 28 - 7.487 ms\n', '2020-01-15 12:06:38');
INSERT INTO `log` VALUES ('647', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1189 - 58.972 ms\n', '2020-01-15 12:46:15');
INSERT INTO `log` VALUES ('648', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1189 - 29.324 ms\n', '2020-01-15 12:57:07');
INSERT INTO `log` VALUES ('649', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1189 - 93.040 ms\n', '2020-01-15 12:58:35');
INSERT INTO `log` VALUES ('650', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1189 - 107.026 ms\n', '2020-01-15 12:59:18');
INSERT INTO `log` VALUES ('651', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1189 - 118.231 ms\n', '2020-01-15 13:00:34');
INSERT INTO `log` VALUES ('652', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1189 - 74.764 ms\n', '2020-01-15 13:01:53');
INSERT INTO `log` VALUES ('653', '::1 - GET /index/updateVideoLike?like=false&userId=null&videoId=1 HTTP/1.1 200 30 - 8.132 ms\n', '2020-01-15 13:01:55');
INSERT INTO `log` VALUES ('654', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1189 - 72.649 ms\n', '2020-01-15 13:03:05');
INSERT INTO `log` VALUES ('655', '::1 - GET /index/updateVideoLike?like=false&userId=null&videoId=1 HTTP/1.1 200 30 - 24.021 ms\n', '2020-01-15 13:03:07');
INSERT INTO `log` VALUES ('656', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1189 - 49.042 ms\n', '2020-01-15 13:03:47');
INSERT INTO `log` VALUES ('657', '::1 - GET /index/updateVideoLike?like=true&userId=null&videoId=1 HTTP/1.1 200 30 - 11.190 ms\n', '2020-01-15 13:03:48');
INSERT INTO `log` VALUES ('658', '::1 - GET /index/updateVideoLike?like=true&userId=null&videoId=1 HTTP/1.1 200 30 - 4.632 ms\n', '2020-01-15 13:26:02');
INSERT INTO `log` VALUES ('659', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1505 - 52.867 ms\n', '2020-01-15 13:26:04');
INSERT INTO `log` VALUES ('660', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 92 - 39.764 ms\n', '2020-01-15 13:26:07');
INSERT INTO `log` VALUES ('661', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 92 - 95.566 ms\n', '2020-01-15 13:26:09');
INSERT INTO `log` VALUES ('662', '::1 - GET /index/updateVideoLike?like=true&userId=null&videoId=2 HTTP/1.1 200 30 - 12.834 ms\n', '2020-01-15 13:26:11');
INSERT INTO `log` VALUES ('663', '::1 - POST /wechat/login HTTP/1.1 200 309 - 299.572 ms\n', '2020-01-15 13:26:13');
INSERT INTO `log` VALUES ('664', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 33.336 ms\n', '2020-01-15 13:26:22');
INSERT INTO `log` VALUES ('665', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 57.006 ms\n', '2020-01-15 13:26:23');
INSERT INTO `log` VALUES ('666', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1189 - 67.743 ms\n', '2020-01-15 13:26:26');
INSERT INTO `log` VALUES ('667', '::1 - GET /index/updateVideoLike?like=true&userId=3&videoId=1 HTTP/1.1 200 30 - 24.727 ms\n', '2020-01-15 13:26:27');
INSERT INTO `log` VALUES ('668', '::1 - GET /index/updateVideoLike?like=false&userId=3&videoId=1 HTTP/1.1 200 30 - 27.547 ms\n', '2020-01-15 13:26:38');
INSERT INTO `log` VALUES ('669', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1189 - 89.666 ms\n', '2020-01-15 14:30:23');
INSERT INTO `log` VALUES ('670', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1598 - 49.120 ms\n', '2020-01-15 14:30:25');
INSERT INTO `log` VALUES ('671', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1189 - 108.144 ms\n', '2020-01-15 14:35:45');
INSERT INTO `log` VALUES ('672', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 42.611 ms\n', '2020-01-15 14:36:37');
INSERT INTO `log` VALUES ('673', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 88.686 ms\n', '2020-01-15 14:37:05');
INSERT INTO `log` VALUES ('674', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 43.442 ms\n', '2020-01-15 14:39:10');
INSERT INTO `log` VALUES ('675', '::1 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 5.916 ms\n', '2020-01-15 14:39:14');
INSERT INTO `log` VALUES ('676', '::1 - POST /wechat/login HTTP/1.1 200 309 - 293.366 ms\n', '2020-01-15 14:39:17');
INSERT INTO `log` VALUES ('677', '::1 - POST /wechat/login HTTP/1.1 200 309 - 288.353 ms\n', '2020-01-15 14:39:18');
INSERT INTO `log` VALUES ('678', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 18.443 ms\n', '2020-01-15 14:39:23');
INSERT INTO `log` VALUES ('679', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 79.456 ms\n', '2020-01-15 14:39:26');
INSERT INTO `log` VALUES ('680', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 200 30 - 11.585 ms\n', '2020-01-15 14:39:29');
INSERT INTO `log` VALUES ('681', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 72.619 ms\n', '2020-01-15 14:42:40');
INSERT INTO `log` VALUES ('682', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 200 30 - 14.445 ms\n', '2020-01-15 14:42:59');
INSERT INTO `log` VALUES ('683', '::1 - GET /index/updateVideoLike?videoLike=false&userId=3&videoId=1 HTTP/1.1 200 30 - 14.219 ms\n', '2020-01-15 14:43:01');
INSERT INTO `log` VALUES ('684', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 200 30 - 21.710 ms\n', '2020-01-15 14:43:03');
INSERT INTO `log` VALUES ('685', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=2 HTTP/1.1 200 30 - 34.550 ms\n', '2020-01-15 14:43:38');
INSERT INTO `log` VALUES ('686', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=3 HTTP/1.1 200 30 - 16.939 ms\n', '2020-01-15 14:43:55');
INSERT INTO `log` VALUES ('687', '::1 - GET /index/updateVideoLike?videoLike=false&userId=3&videoId=2 HTTP/1.1 200 30 - 13.814 ms\n', '2020-01-15 14:44:19');
INSERT INTO `log` VALUES ('688', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=2 HTTP/1.1 200 30 - 17.520 ms\n', '2020-01-15 14:44:44');
INSERT INTO `log` VALUES ('689', '::1 - GET /index/updateVideoLike?videoLike=false&userId=3&videoId=2 HTTP/1.1 200 30 - 11.827 ms\n', '2020-01-15 14:44:45');
INSERT INTO `log` VALUES ('690', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 20.878 ms\n', '2020-01-15 14:46:56');
INSERT INTO `log` VALUES ('691', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 200 30 - 18.243 ms\n', '2020-01-15 14:47:00');
INSERT INTO `log` VALUES ('692', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 31.095 ms\n', '2020-01-15 14:50:10');
INSERT INTO `log` VALUES ('693', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 109.785 ms\n', '2020-01-15 14:50:38');
INSERT INTO `log` VALUES ('694', '::1 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 8.515 ms\n', '2020-01-15 14:50:43');
INSERT INTO `log` VALUES ('695', '::1 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 12.271 ms\n', '2020-01-15 14:50:46');
INSERT INTO `log` VALUES ('696', '::1 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 5.218 ms\n', '2020-01-15 14:50:47');
INSERT INTO `log` VALUES ('697', '::1 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 22.241 ms\n', '2020-01-15 14:50:50');
INSERT INTO `log` VALUES ('698', '::1 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 6.551 ms\n', '2020-01-15 14:50:51');
INSERT INTO `log` VALUES ('699', '::1 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 4.913 ms\n', '2020-01-15 14:50:52');
INSERT INTO `log` VALUES ('700', '::1 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 6.846 ms\n', '2020-01-15 14:52:25');
INSERT INTO `log` VALUES ('701', '::1 - POST /wechat/login HTTP/1.1 200 309 - 262.926 ms\n', '2020-01-15 14:52:27');
INSERT INTO `log` VALUES ('702', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 32.222 ms\n', '2020-01-15 14:52:32');
INSERT INTO `log` VALUES ('703', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 30.343 ms\n', '2020-01-15 14:52:34');
INSERT INTO `log` VALUES ('704', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 200 30 - 33.928 ms\n', '2020-01-15 14:52:39');
INSERT INTO `log` VALUES ('705', '::1 - GET /index/updateVideoLike?videoLike=false&userId=3&videoId=1 HTTP/1.1 200 30 - 18.032 ms\n', '2020-01-15 14:52:41');
INSERT INTO `log` VALUES ('706', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 84.700 ms\n', '2020-01-15 14:55:26');
INSERT INTO `log` VALUES ('707', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 37.392 ms\n', '2020-01-15 14:56:25');
INSERT INTO `log` VALUES ('708', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 21.070 ms\n', '2020-01-15 14:56:34');
INSERT INTO `log` VALUES ('709', '::1 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 4.512 ms\n', '2020-01-15 14:56:43');
INSERT INTO `log` VALUES ('710', '::1 - POST /wechat/login HTTP/1.1 200 309 - 279.027 ms\n', '2020-01-15 14:56:46');
INSERT INTO `log` VALUES ('711', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 20.519 ms\n', '2020-01-15 14:56:51');
INSERT INTO `log` VALUES ('712', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 28.775 ms\n', '2020-01-15 14:56:52');
INSERT INTO `log` VALUES ('713', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 34.331 ms\n', '2020-01-15 14:56:54');
INSERT INTO `log` VALUES ('714', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 200 30 - 28.417 ms\n', '2020-01-15 14:57:00');
INSERT INTO `log` VALUES ('715', '::1 - GET /index/updateVideoLike?videoLike=false&userId=3&videoId=1 HTTP/1.1 200 30 - 13.581 ms\n', '2020-01-15 14:57:11');
INSERT INTO `log` VALUES ('716', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 200 30 - 15.342 ms\n', '2020-01-15 14:57:21');
INSERT INTO `log` VALUES ('717', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 107.177 ms\n', '2020-01-15 14:58:11');
INSERT INTO `log` VALUES ('718', '::1 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 6.693 ms\n', '2020-01-15 14:58:20');
INSERT INTO `log` VALUES ('719', '::1 - POST /wechat/login HTTP/1.1 200 309 - 253.151 ms\n', '2020-01-15 15:00:25');
INSERT INTO `log` VALUES ('720', '::1 - POST /wechat/login HTTP/1.1 200 309 - 239.382 ms\n', '2020-01-15 15:00:26');
INSERT INTO `log` VALUES ('721', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 14.252 ms\n', '2020-01-15 15:00:30');
INSERT INTO `log` VALUES ('722', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 11.638 ms\n', '2020-01-15 15:00:31');
INSERT INTO `log` VALUES ('723', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 13.768 ms\n', '2020-01-15 15:00:33');
INSERT INTO `log` VALUES ('724', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 200 30 - 15.216 ms\n', '2020-01-15 15:00:35');
INSERT INTO `log` VALUES ('725', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 60.244 ms\n', '2020-01-15 15:02:30');
INSERT INTO `log` VALUES ('726', '::1 - POST /wechat/login HTTP/1.1 200 309 - 302.828 ms\n', '2020-01-15 15:02:34');
INSERT INTO `log` VALUES ('727', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 23.412 ms\n', '2020-01-15 15:02:38');
INSERT INTO `log` VALUES ('728', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 46.099 ms\n', '2020-01-15 15:02:40');
INSERT INTO `log` VALUES ('729', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 200 30 - 14.047 ms\n', '2020-01-15 15:02:42');
INSERT INTO `log` VALUES ('730', '::1 - GET /index/updateVideoLike?videoLike=false&userId=3&videoId=1 HTTP/1.1 200 30 - 15.604 ms\n', '2020-01-15 15:03:05');
INSERT INTO `log` VALUES ('731', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 30.885 ms\n', '2020-01-15 15:04:42');
INSERT INTO `log` VALUES ('732', '::1 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 11.032 ms\n', '2020-01-15 15:04:44');
INSERT INTO `log` VALUES ('733', '::1 - POST /wechat/login HTTP/1.1 200 309 - 262.838 ms\n', '2020-01-15 15:04:55');
INSERT INTO `log` VALUES ('734', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 15.927 ms\n', '2020-01-15 15:04:59');
INSERT INTO `log` VALUES ('735', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 34.008 ms\n', '2020-01-15 15:05:02');
INSERT INTO `log` VALUES ('736', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 200 30 - 21.979 ms\n', '2020-01-15 15:05:03');
INSERT INTO `log` VALUES ('737', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 27.748 ms\n', '2020-01-15 15:06:54');
INSERT INTO `log` VALUES ('738', '::1 - POST /wechat/login HTTP/1.1 200 309 - 237.140 ms\n', '2020-01-15 15:06:57');
INSERT INTO `log` VALUES ('739', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 22.462 ms\n', '2020-01-15 15:07:01');
INSERT INTO `log` VALUES ('740', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 35.628 ms\n', '2020-01-15 15:07:02');
INSERT INTO `log` VALUES ('741', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 30.033 ms\n', '2020-01-15 15:07:03');
INSERT INTO `log` VALUES ('742', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 - - - - ms\n', '2020-01-15 15:08:06');
INSERT INTO `log` VALUES ('743', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 106.929 ms\n', '2020-01-15 15:10:06');
INSERT INTO `log` VALUES ('744', '::1 - POST /wechat/login HTTP/1.1 200 309 - 260.213 ms\n', '2020-01-15 15:10:08');
INSERT INTO `log` VALUES ('745', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 16.782 ms\n', '2020-01-15 15:10:12');
INSERT INTO `log` VALUES ('746', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 13.662 ms\n', '2020-01-15 15:10:15');
INSERT INTO `log` VALUES ('747', '::ffff:127.0.0.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 56.111 ms\n', '2020-01-15 15:10:40');
INSERT INTO `log` VALUES ('748', '::ffff:127.0.0.1 - POST /wechat/login HTTP/1.1 200 309 - 235.422 ms\n', '2020-01-15 15:10:41');
INSERT INTO `log` VALUES ('749', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 18.680 ms\n', '2020-01-15 15:10:45');
INSERT INTO `log` VALUES ('750', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 24.583 ms\n', '2020-01-15 15:10:48');
INSERT INTO `log` VALUES ('751', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 200 30 - 22.006 ms\n', '2020-01-15 15:10:48');
INSERT INTO `log` VALUES ('752', '::1 - GET /index/updateVideoLike?videoLike=false&userId=3&videoId=1 HTTP/1.1 200 30 - 16.102 ms\n', '2020-01-15 15:10:58');
INSERT INTO `log` VALUES ('753', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 200 30 - 24.381 ms\n', '2020-01-15 15:11:05');
INSERT INTO `log` VALUES ('754', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 21.602 ms\n', '2020-01-15 15:11:51');
INSERT INTO `log` VALUES ('755', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 38.047 ms\n', '2020-01-15 15:16:29');
INSERT INTO `log` VALUES ('756', '::1 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 12.355 ms\n', '2020-01-15 15:45:24');
INSERT INTO `log` VALUES ('757', '::1 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 8.803 ms\n', '2020-01-15 15:45:25');
INSERT INTO `log` VALUES ('758', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 65.534 ms\n', '2020-01-15 15:45:26');
INSERT INTO `log` VALUES ('759', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 37.738 ms\n', '2020-01-15 15:45:32');
INSERT INTO `log` VALUES ('760', '::1 - POST /wechat/login HTTP/1.1 200 309 - 256.360 ms\n', '2020-01-15 15:45:38');
INSERT INTO `log` VALUES ('761', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 18.561 ms\n', '2020-01-15 15:57:25');
INSERT INTO `log` VALUES ('762', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 14.071 ms\n', '2020-01-15 15:57:26');
INSERT INTO `log` VALUES ('763', '::1 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 10.955 ms\n', '2020-01-15 15:57:26');
INSERT INTO `log` VALUES ('764', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 17.750 ms\n', '2020-01-15 15:57:28');
INSERT INTO `log` VALUES ('765', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 26.022 ms\n', '2020-01-15 15:57:38');
INSERT INTO `log` VALUES ('766', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 88 - 53.567 ms\n', '2020-01-15 15:57:40');
INSERT INTO `log` VALUES ('767', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 24.763 ms\n', '2020-01-15 16:10:58');
INSERT INTO `log` VALUES ('768', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 68.760 ms\n', '2020-01-15 16:12:03');
INSERT INTO `log` VALUES ('769', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 17.170 ms\n', '2020-01-15 16:14:18');
INSERT INTO `log` VALUES ('770', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 36.026 ms\n', '2020-01-15 16:14:36');
INSERT INTO `log` VALUES ('771', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 29.552 ms\n', '2020-01-15 16:16:23');
INSERT INTO `log` VALUES ('772', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 45.401 ms\n', '2020-01-15 16:16:28');
INSERT INTO `log` VALUES ('773', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 34.989 ms\n', '2020-01-15 16:16:50');
INSERT INTO `log` VALUES ('774', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 26.784 ms\n', '2020-01-15 16:17:48');
INSERT INTO `log` VALUES ('775', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 53.139 ms\n', '2020-01-15 16:17:53');
INSERT INTO `log` VALUES ('776', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 56.961 ms\n', '2020-01-15 16:17:54');
INSERT INTO `log` VALUES ('777', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 18.773 ms\n', '2020-01-15 16:20:01');
INSERT INTO `log` VALUES ('778', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 34.719 ms\n', '2020-01-15 16:20:18');
INSERT INTO `log` VALUES ('779', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 53.421 ms\n', '2020-01-15 16:20:50');
INSERT INTO `log` VALUES ('780', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 33.551 ms\n', '2020-01-15 16:21:39');
INSERT INTO `log` VALUES ('781', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 60.541 ms\n', '2020-01-15 16:21:43');
INSERT INTO `log` VALUES ('782', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 56.484 ms\n', '2020-01-15 16:22:47');
INSERT INTO `log` VALUES ('783', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 23.699 ms\n', '2020-01-15 16:22:53');
INSERT INTO `log` VALUES ('784', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 88 - 69.377 ms\n', '2020-01-15 16:22:57');
INSERT INTO `log` VALUES ('785', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 35.080 ms\n', '2020-01-15 16:22:59');
INSERT INTO `log` VALUES ('786', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 37.364 ms\n', '2020-01-15 16:23:49');
INSERT INTO `log` VALUES ('787', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 73.648 ms\n', '2020-01-15 16:25:24');
INSERT INTO `log` VALUES ('788', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 88 - 56.638 ms\n', '2020-01-15 16:25:30');
INSERT INTO `log` VALUES ('789', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 35.626 ms\n', '2020-01-15 16:25:33');
INSERT INTO `log` VALUES ('790', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 51.644 ms\n', '2020-01-15 16:26:50');
INSERT INTO `log` VALUES ('791', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 10.974 ms\n', '2020-01-15 16:31:25');
INSERT INTO `log` VALUES ('792', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 60.527 ms\n', '2020-01-15 16:31:27');
INSERT INTO `log` VALUES ('793', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 83.194 ms\n', '2020-01-15 16:32:11');
INSERT INTO `log` VALUES ('794', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 46.583 ms\n', '2020-01-15 16:35:19');
INSERT INTO `log` VALUES ('795', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 36.833 ms\n', '2020-01-15 16:35:22');
INSERT INTO `log` VALUES ('796', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 30.961 ms\n', '2020-01-15 16:37:13');
INSERT INTO `log` VALUES ('797', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 39.449 ms\n', '2020-01-15 16:37:15');
INSERT INTO `log` VALUES ('798', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 22.325 ms\n', '2020-01-15 16:38:21');
INSERT INTO `log` VALUES ('799', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 33.793 ms\n', '2020-01-15 16:38:23');
INSERT INTO `log` VALUES ('800', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 14.754 ms\n', '2020-01-15 16:39:59');
INSERT INTO `log` VALUES ('801', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 56.179 ms\n', '2020-01-15 16:40:00');
INSERT INTO `log` VALUES ('802', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 21.071 ms\n', '2020-01-15 16:41:29');
INSERT INTO `log` VALUES ('803', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 35.415 ms\n', '2020-01-15 16:41:48');
INSERT INTO `log` VALUES ('804', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 40.064 ms\n', '2020-01-15 16:42:26');
INSERT INTO `log` VALUES ('805', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 42.027 ms\n', '2020-01-15 16:42:28');
INSERT INTO `log` VALUES ('806', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 24.279 ms\n', '2020-01-15 16:43:44');
INSERT INTO `log` VALUES ('807', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 34.553 ms\n', '2020-01-15 16:43:45');
INSERT INTO `log` VALUES ('808', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 22.207 ms\n', '2020-01-15 16:45:55');
INSERT INTO `log` VALUES ('809', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 34.206 ms\n', '2020-01-15 16:45:56');
INSERT INTO `log` VALUES ('810', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 37.098 ms\n', '2020-01-15 16:46:23');
INSERT INTO `log` VALUES ('811', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 33.052 ms\n', '2020-01-15 16:46:24');
INSERT INTO `log` VALUES ('812', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 53.304 ms\n', '2020-01-15 16:46:29');
INSERT INTO `log` VALUES ('813', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 32.087 ms\n', '2020-01-15 16:46:31');
INSERT INTO `log` VALUES ('814', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 22.500 ms\n', '2020-01-15 16:49:26');
INSERT INTO `log` VALUES ('815', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 16.649 ms\n', '2020-01-15 16:50:06');
INSERT INTO `log` VALUES ('816', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 39.150 ms\n', '2020-01-15 16:50:16');
INSERT INTO `log` VALUES ('817', '::1 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 200 30 - 18.374 ms\n', '2020-01-15 16:51:56');
INSERT INTO `log` VALUES ('818', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 20.348 ms\n', '2020-01-15 16:55:22');
INSERT INTO `log` VALUES ('819', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 29.461 ms\n', '2020-01-15 16:55:29');
INSERT INTO `log` VALUES ('820', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 52.819 ms\n', '2020-01-15 16:57:07');
INSERT INTO `log` VALUES ('821', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 105.188 ms\n', '2020-01-15 16:57:43');
INSERT INTO `log` VALUES ('822', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 24.288 ms\n', '2020-01-15 16:58:24');
INSERT INTO `log` VALUES ('823', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1201 - 42.165 ms\n', '2020-01-15 16:58:29');
INSERT INTO `log` VALUES ('824', '::1 - GET /index/getvideo?pageSize=10&pageNum=1 HTTP/1.1 200 1201 - 162.152 ms\n', '2020-01-15 16:59:10');
INSERT INTO `log` VALUES ('825', '::1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1198 - 101.987 ms\n', '2020-01-15 17:01:24');
INSERT INTO `log` VALUES ('826', '::1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 65.889 ms\n', '2020-01-15 17:01:39');
INSERT INTO `log` VALUES ('827', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1198 - 25.574 ms\n', '2020-01-15 17:40:25');
INSERT INTO `log` VALUES ('828', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 62.530 ms\n', '2020-01-15 18:12:58');
INSERT INTO `log` VALUES ('829', '::ffff:192.168.0.105 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=2 HTTP/1.1 200 30 - 6.494 ms\n', '2020-01-15 18:13:08');
INSERT INTO `log` VALUES ('830', '::ffff:192.168.0.105 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 88 - 40.668 ms\n', '2020-01-15 18:13:09');
INSERT INTO `log` VALUES ('831', '::ffff:192.168.0.105 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 63.423 ms\n', '2020-01-15 18:13:12');
INSERT INTO `log` VALUES ('832', '::ffff:192.168.0.106 - GET /favicon.ico HTTP/1.1 200 38 - 14.092 ms\n', '2020-01-15 18:20:28');
INSERT INTO `log` VALUES ('833', '::ffff:192.168.0.106 - GET /index/getvideo HTTP/1.1 200 1243 - 18.853 ms\n', '2020-01-15 18:20:28');
INSERT INTO `log` VALUES ('834', '::ffff:192.168.0.101 - GET /index/getvideo HTTP/1.1 200 1243 - 25.266 ms\n', '2020-01-15 18:21:19');
INSERT INTO `log` VALUES ('835', '::ffff:192.168.0.101 - GET /favicon.ico HTTP/1.1 200 38 - 62.812 ms\n', '2020-01-15 18:21:19');
INSERT INTO `log` VALUES ('836', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 48.803 ms\n', '2020-01-15 18:21:59');
INSERT INTO `log` VALUES ('837', '::ffff:192.168.0.101 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 19.909 ms\n', '2020-01-15 18:22:13');
INSERT INTO `log` VALUES ('838', '::ffff:192.168.0.101 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=3 HTTP/1.1 200 88 - 57.912 ms\n', '2020-01-15 18:22:28');
INSERT INTO `log` VALUES ('839', '::ffff:192.168.0.101 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 88 - 58.460 ms\n', '2020-01-15 18:22:32');
INSERT INTO `log` VALUES ('840', '::ffff:192.168.0.101 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 62.689 ms\n', '2020-01-15 18:22:35');
INSERT INTO `log` VALUES ('841', '::ffff:192.168.0.101 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 56.060 ms\n', '2020-01-15 18:22:44');
INSERT INTO `log` VALUES ('842', '::ffff:192.168.0.101 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=1 HTTP/1.1 200 30 - 10.142 ms\n', '2020-01-15 18:22:49');
INSERT INTO `log` VALUES ('843', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 331.586 ms\n', '2020-01-15 18:22:51');
INSERT INTO `log` VALUES ('844', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 280.514 ms\n', '2020-01-15 18:22:53');
INSERT INTO `log` VALUES ('845', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 245.007 ms\n', '2020-01-15 18:22:56');
INSERT INTO `log` VALUES ('846', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 268.632 ms\n', '2020-01-15 18:22:56');
INSERT INTO `log` VALUES ('847', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 213.627 ms\n', '2020-01-15 18:22:57');
INSERT INTO `log` VALUES ('848', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 263.051 ms\n', '2020-01-15 18:22:57');
INSERT INTO `log` VALUES ('849', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 15.497 ms\n', '2020-01-15 18:22:57');
INSERT INTO `log` VALUES ('850', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 310.441 ms\n', '2020-01-15 18:22:58');
INSERT INTO `log` VALUES ('851', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 7.798 ms\n', '2020-01-15 18:22:58');
INSERT INTO `log` VALUES ('852', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 292.240 ms\n', '2020-01-15 18:22:58');
INSERT INTO `log` VALUES ('853', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 273.385 ms\n', '2020-01-15 18:22:59');
INSERT INTO `log` VALUES ('854', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 223.624 ms\n', '2020-01-15 18:22:59');
INSERT INTO `log` VALUES ('855', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 223.531 ms\n', '2020-01-15 18:22:59');
INSERT INTO `log` VALUES ('856', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 6.589 ms\n', '2020-01-15 18:22:59');
INSERT INTO `log` VALUES ('857', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 260.421 ms\n', '2020-01-15 18:22:59');
INSERT INTO `log` VALUES ('858', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 12.668 ms\n', '2020-01-15 18:22:59');
INSERT INTO `log` VALUES ('859', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 217.512 ms\n', '2020-01-15 18:22:59');
INSERT INTO `log` VALUES ('860', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 285.176 ms\n', '2020-01-15 18:23:00');
INSERT INTO `log` VALUES ('861', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 238.196 ms\n', '2020-01-15 18:23:00');
INSERT INTO `log` VALUES ('862', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 250.985 ms\n', '2020-01-15 18:23:00');
INSERT INTO `log` VALUES ('863', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 235.095 ms\n', '2020-01-15 18:23:00');
INSERT INTO `log` VALUES ('864', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 209.888 ms\n', '2020-01-15 18:23:00');
INSERT INTO `log` VALUES ('865', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 256.203 ms\n', '2020-01-15 18:23:01');
INSERT INTO `log` VALUES ('866', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 247.633 ms\n', '2020-01-15 18:23:01');
INSERT INTO `log` VALUES ('867', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 227.642 ms\n', '2020-01-15 18:23:01');
INSERT INTO `log` VALUES ('868', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 236.779 ms\n', '2020-01-15 18:23:01');
INSERT INTO `log` VALUES ('869', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 251.357 ms\n', '2020-01-15 18:23:01');
INSERT INTO `log` VALUES ('870', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 233.319 ms\n', '2020-01-15 18:23:02');
INSERT INTO `log` VALUES ('871', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 223.698 ms\n', '2020-01-15 18:23:02');
INSERT INTO `log` VALUES ('872', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 9.833 ms\n', '2020-01-15 18:23:02');
INSERT INTO `log` VALUES ('873', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 260.022 ms\n', '2020-01-15 18:23:02');
INSERT INTO `log` VALUES ('874', '::ffff:192.168.0.101 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=1 HTTP/1.1 200 30 - 32.181 ms\n', '2020-01-15 18:23:05');
INSERT INTO `log` VALUES ('875', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 229.468 ms\n', '2020-01-15 18:23:07');
INSERT INTO `log` VALUES ('876', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 271.096 ms\n', '2020-01-15 18:23:07');
INSERT INTO `log` VALUES ('877', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 269.139 ms\n', '2020-01-15 18:23:07');
INSERT INTO `log` VALUES ('878', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 247.706 ms\n', '2020-01-15 18:23:07');
INSERT INTO `log` VALUES ('879', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 264.314 ms\n', '2020-01-15 18:23:07');
INSERT INTO `log` VALUES ('880', '::ffff:192.168.0.101 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 59.280 ms\n', '2020-01-15 18:23:07');
INSERT INTO `log` VALUES ('881', '::ffff:192.168.0.105 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 44.243 ms\n', '2020-01-15 18:23:17');
INSERT INTO `log` VALUES ('882', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 111.786 ms\n', '2020-01-15 18:24:03');
INSERT INTO `log` VALUES ('883', '::ffff:192.168.0.101 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 46.026 ms\n', '2020-01-15 18:24:10');
INSERT INTO `log` VALUES ('884', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 16.039 ms\n', '2020-01-15 18:24:21');
INSERT INTO `log` VALUES ('885', '::ffff:192.168.0.101 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 11.190 ms\n', '2020-01-15 18:24:29');
INSERT INTO `log` VALUES ('886', '::ffff:192.168.0.101 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 29.980 ms\n', '2020-01-15 18:24:34');
INSERT INTO `log` VALUES ('887', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 250.553 ms\n', '2020-01-15 18:24:49');
INSERT INTO `log` VALUES ('888', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 276.685 ms\n', '2020-01-15 18:24:50');
INSERT INTO `log` VALUES ('889', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 237.567 ms\n', '2020-01-15 18:24:50');
INSERT INTO `log` VALUES ('890', '::ffff:192.168.0.101 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=3 HTTP/1.1 200 88 - 60.953 ms\n', '2020-01-15 18:24:54');
INSERT INTO `log` VALUES ('891', '::ffff:192.168.0.101 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=3 HTTP/1.1 200 30 - 9.393 ms\n', '2020-01-15 18:24:56');
INSERT INTO `log` VALUES ('892', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 249.321 ms\n', '2020-01-15 18:24:58');
INSERT INTO `log` VALUES ('893', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 3.562 ms\n', '2020-01-15 18:24:58');
INSERT INTO `log` VALUES ('894', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 278.646 ms\n', '2020-01-15 18:24:58');
INSERT INTO `log` VALUES ('895', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 278.522 ms\n', '2020-01-15 18:24:59');
INSERT INTO `log` VALUES ('896', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 207.256 ms\n', '2020-01-15 18:24:59');
INSERT INTO `log` VALUES ('897', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 6.130 ms\n', '2020-01-15 18:24:59');
INSERT INTO `log` VALUES ('898', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 309 - 273.513 ms\n', '2020-01-15 18:24:59');
INSERT INTO `log` VALUES ('899', '::ffff:192.168.0.105 - POST /wechat/login HTTP/1.1 200 309 - 239.444 ms\n', '2020-01-15 18:25:05');
INSERT INTO `log` VALUES ('900', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 19.863 ms\n', '2020-01-15 18:25:11');
INSERT INTO `log` VALUES ('901', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 3.574 ms\n', '2020-01-15 18:25:12');
INSERT INTO `log` VALUES ('902', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 6.733 ms\n', '2020-01-15 18:25:12');
INSERT INTO `log` VALUES ('903', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 10.352 ms\n', '2020-01-15 18:25:12');
INSERT INTO `log` VALUES ('904', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 11.236 ms\n', '2020-01-15 18:25:12');
INSERT INTO `log` VALUES ('905', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 9.519 ms\n', '2020-01-15 18:25:12');
INSERT INTO `log` VALUES ('906', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 6.399 ms\n', '2020-01-15 18:25:13');
INSERT INTO `log` VALUES ('907', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 87.450 ms\n', '2020-01-15 18:25:50');
INSERT INTO `log` VALUES ('908', '::ffff:192.168.0.101 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 3.656 ms\n', '2020-01-15 18:26:02');
INSERT INTO `log` VALUES ('909', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 6.361 ms\n', '2020-01-15 18:26:11');
INSERT INTO `log` VALUES ('910', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 28.390 ms\n', '2020-01-15 18:26:11');
INSERT INTO `log` VALUES ('911', '::ffff:192.168.0.105 - POST /wechat/login HTTP/1.1 200 309 - 307.468 ms\n', '2020-01-15 18:26:56');
INSERT INTO `log` VALUES ('912', '::ffff:192.168.0.105 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 13.973 ms\n', '2020-01-15 18:27:11');
INSERT INTO `log` VALUES ('913', '::ffff:192.168.0.101 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 7.090 ms\n', '2020-01-15 18:27:30');
INSERT INTO `log` VALUES ('914', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 18.626 ms\n', '2020-01-15 18:27:32');
INSERT INTO `log` VALUES ('915', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 83.899 ms\n', '2020-01-15 18:28:39');
INSERT INTO `log` VALUES ('916', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 19.462 ms\n', '2020-01-15 18:28:44');
INSERT INTO `log` VALUES ('917', '::ffff:192.168.0.101 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 6.722 ms\n', '2020-01-15 18:28:50');
INSERT INTO `log` VALUES ('918', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 9.351 ms\n', '2020-01-15 18:28:55');
INSERT INTO `log` VALUES ('919', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 12.524 ms\n', '2020-01-15 18:29:59');
INSERT INTO `log` VALUES ('920', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 19.506 ms\n', '2020-01-15 18:30:00');
INSERT INTO `log` VALUES ('921', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 22.344 ms\n', '2020-01-15 18:30:09');
INSERT INTO `log` VALUES ('922', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 35.117 ms\n', '2020-01-15 18:30:15');
INSERT INTO `log` VALUES ('923', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 27.094 ms\n', '2020-01-15 18:30:50');
INSERT INTO `log` VALUES ('924', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 47.255 ms\n', '2020-01-15 18:31:42');
INSERT INTO `log` VALUES ('925', '::ffff:192.168.0.101 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 10.294 ms\n', '2020-01-15 18:31:55');
INSERT INTO `log` VALUES ('926', '::ffff:192.168.0.101 - POST /wechat/login HTTP/1.1 200 56 - 6.887 ms\n', '2020-01-15 18:31:59');
INSERT INTO `log` VALUES ('927', '::ffff:192.168.0.101 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 56 - 7.051 ms\n', '2020-01-15 18:32:07');
INSERT INTO `log` VALUES ('928', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 20.137 ms\n', '2020-01-15 18:33:57');
INSERT INTO `log` VALUES ('929', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 36.170 ms\n', '2020-01-15 18:34:03');
INSERT INTO `log` VALUES ('930', '::ffff:192.168.0.101 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 15.574 ms\n', '2020-01-15 18:34:13');
INSERT INTO `log` VALUES ('931', '::ffff:192.168.0.101 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 15.293 ms\n', '2020-01-15 18:42:32');
INSERT INTO `log` VALUES ('932', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 68.135 ms\n', '2020-01-15 18:44:22');
INSERT INTO `log` VALUES ('933', '::ffff:192.168.0.101 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 6.971 ms\n', '2020-01-15 18:44:38');
INSERT INTO `log` VALUES ('934', '::ffff:192.168.0.101 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 56 - 4.540 ms\n', '2020-01-15 18:44:48');
INSERT INTO `log` VALUES ('935', '::ffff:192.168.0.101 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 56 - 21.546 ms\n', '2020-01-15 18:45:00');
INSERT INTO `log` VALUES ('936', '::ffff:192.168.0.101 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=2 HTTP/1.1 200 56 - 9.831 ms\n', '2020-01-15 18:45:07');
INSERT INTO `log` VALUES ('937', '::ffff:192.168.0.101 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=2 HTTP/1.1 200 56 - 3.813 ms\n', '2020-01-15 18:45:08');
INSERT INTO `log` VALUES ('938', '::ffff:192.168.0.101 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=2 HTTP/1.1 200 56 - 10.670 ms\n', '2020-01-15 18:45:08');
INSERT INTO `log` VALUES ('939', '::ffff:192.168.0.101 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=2 HTTP/1.1 200 56 - 14.862 ms\n', '2020-01-15 18:45:08');
INSERT INTO `log` VALUES ('940', '::ffff:192.168.0.101 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=2 HTTP/1.1 200 56 - 22.088 ms\n', '2020-01-15 18:45:08');
INSERT INTO `log` VALUES ('941', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 28.254 ms\n', '2020-01-15 18:45:19');
INSERT INTO `log` VALUES ('942', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 51.317 ms\n', '2020-01-15 18:45:50');
INSERT INTO `log` VALUES ('943', '::ffff:192.168.0.101 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 3.893 ms\n', '2020-01-15 18:46:18');
INSERT INTO `log` VALUES ('944', '::ffff:192.168.0.101 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 56 - 8.614 ms\n', '2020-01-15 18:46:25');
INSERT INTO `log` VALUES ('945', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 29.506 ms\n', '2020-01-15 18:46:42');
INSERT INTO `log` VALUES ('946', '::ffff:192.168.0.101 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 11.740 ms\n', '2020-01-15 18:46:53');
INSERT INTO `log` VALUES ('947', '::ffff:192.168.0.101 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 56 - 6.089 ms\n', '2020-01-15 18:47:02');
INSERT INTO `log` VALUES ('948', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 40.519 ms\n', '2020-01-15 18:47:47');
INSERT INTO `log` VALUES ('949', '::ffff:192.168.0.101 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 19.765 ms\n', '2020-01-15 18:48:19');
INSERT INTO `log` VALUES ('950', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 17.603 ms\n', '2020-01-15 18:53:30');
INSERT INTO `log` VALUES ('951', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 19.603 ms\n', '2020-01-15 18:53:36');
INSERT INTO `log` VALUES ('952', '::ffff:192.168.0.101 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 25.428 ms\n', '2020-01-15 18:53:46');
INSERT INTO `log` VALUES ('953', '::ffff:192.168.0.105 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 48.088 ms\n', '2020-01-15 18:54:37');
INSERT INTO `log` VALUES ('954', '::ffff:192.168.0.105 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 35.792 ms\n', '2020-01-15 18:57:11');
INSERT INTO `log` VALUES ('955', '::ffff:192.168.0.105 - POST /wechat/login HTTP/1.1 200 309 - 265.312 ms\n', '2020-01-15 18:57:47');
INSERT INTO `log` VALUES ('956', '::ffff:192.168.0.105 - POST /wechat/login HTTP/1.1 200 309 - 231.523 ms\n', '2020-01-15 18:57:48');
INSERT INTO `log` VALUES ('957', '::ffff:192.168.0.105 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 16.831 ms\n', '2020-01-15 18:57:54');
INSERT INTO `log` VALUES ('958', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 23.158 ms\n', '2020-01-15 18:57:56');
INSERT INTO `log` VALUES ('959', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 22.291 ms\n', '2020-01-15 18:57:59');
INSERT INTO `log` VALUES ('960', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 37.865 ms\n', '2020-01-15 18:58:01');
INSERT INTO `log` VALUES ('961', '::ffff:192.168.0.105 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=3 HTTP/1.1 200 88 - 48.377 ms\n', '2020-01-15 19:01:03');
INSERT INTO `log` VALUES ('962', '::ffff:192.168.0.105 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=3 HTTP/1.1 200 30 - 17.991 ms\n', '2020-01-15 19:01:05');
INSERT INTO `log` VALUES ('963', '::ffff:192.168.0.105 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=2 HTTP/1.1 200 30 - 27.650 ms\n', '2020-01-15 19:01:07');
INSERT INTO `log` VALUES ('964', '::ffff:192.168.0.105 - GET /index/updateVideoLike?videoLike=false&userId=3&videoId=1 HTTP/1.1 200 30 - 13.938 ms\n', '2020-01-15 19:01:09');
INSERT INTO `log` VALUES ('965', '::ffff:192.168.0.105 - GET /index/updateVideoLike?videoLike=false&userId=3&videoId=2 HTTP/1.1 200 30 - 28.569 ms\n', '2020-01-15 19:01:11');
INSERT INTO `log` VALUES ('966', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 22.213 ms\n', '2020-01-15 19:01:16');
INSERT INTO `log` VALUES ('967', '::ffff:192.168.0.105 - GET /index/updateVideoLike?videoLike=false&userId=3&videoId=3 HTTP/1.1 200 30 - 18.938 ms\n', '2020-01-15 19:01:20');
INSERT INTO `log` VALUES ('968', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 23.603 ms\n', '2020-01-15 19:01:24');
INSERT INTO `log` VALUES ('969', '::ffff:192.168.0.105 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=3 HTTP/1.1 200 30 - 18.149 ms\n', '2020-01-15 19:01:27');
INSERT INTO `log` VALUES ('970', '::ffff:192.168.0.105 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 15.821 ms\n', '2020-01-15 19:01:31');
INSERT INTO `log` VALUES ('971', '::ffff:192.168.0.102 - POST /wechat/login HTTP/1.1 200 309 - 385.302 ms\n', '2020-01-16 10:44:23');
INSERT INTO `log` VALUES ('972', '::ffff:192.168.0.102 - POST /wechat/login HTTP/1.1 200 309 - 273.389 ms\n', '2020-01-16 10:44:24');
INSERT INTO `log` VALUES ('973', '::ffff:192.168.0.102 - POST /wechat/login HTTP/1.1 200 309 - 244.322 ms\n', '2020-01-16 10:44:24');
INSERT INTO `log` VALUES ('974', '::ffff:192.168.0.102 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 21.314 ms\n', '2020-01-16 10:44:31');
INSERT INTO `log` VALUES ('975', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 33.138 ms\n', '2020-01-16 10:44:40');
INSERT INTO `log` VALUES ('976', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 18.638 ms\n', '2020-01-16 11:01:29');
INSERT INTO `log` VALUES ('977', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 162.817 ms\n', '2020-01-16 11:17:10');
INSERT INTO `log` VALUES ('978', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 150.483 ms\n', '2020-01-16 11:17:55');
INSERT INTO `log` VALUES ('979', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 43.142 ms\n', '2020-01-16 11:21:15');
INSERT INTO `log` VALUES ('980', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 29.854 ms\n', '2020-01-16 11:22:47');
INSERT INTO `log` VALUES ('981', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 29.582 ms\n', '2020-01-16 11:24:01');
INSERT INTO `log` VALUES ('982', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 35.653 ms\n', '2020-01-16 11:24:31');
INSERT INTO `log` VALUES ('983', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1243 - 59.202 ms\n', '2020-01-16 11:25:31');
INSERT INTO `log` VALUES ('984', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 64.737 ms\n', '2020-01-16 11:25:43');
INSERT INTO `log` VALUES ('985', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 21.592 ms\n', '2020-01-16 11:31:00');
INSERT INTO `log` VALUES ('986', '::ffff:192.168.0.102 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=3 HTTP/1.1 200 88 - 70.079 ms\n', '2020-01-16 14:27:42');
INSERT INTO `log` VALUES ('987', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 30.757 ms\n', '2020-01-16 14:27:53');
INSERT INTO `log` VALUES ('988', '::ffff:192.168.0.102 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 38.697 ms\n', '2020-01-16 14:27:59');
INSERT INTO `log` VALUES ('989', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 22.603 ms\n', '2020-01-16 14:28:15');
INSERT INTO `log` VALUES ('990', '::ffff:192.168.0.118 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 8.157 ms\n', '2020-01-16 14:28:26');
INSERT INTO `log` VALUES ('991', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 63.339 ms\n', '2020-01-16 14:30:32');
INSERT INTO `log` VALUES ('992', '::ffff:192.168.0.118 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 3.667 ms\n', '2020-01-16 14:30:43');
INSERT INTO `log` VALUES ('993', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 31.724 ms\n', '2020-01-16 14:31:46');
INSERT INTO `log` VALUES ('994', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 9.375 ms\n', '2020-01-16 14:33:04');
INSERT INTO `log` VALUES ('995', '::ffff:192.168.0.118 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 15.958 ms\n', '2020-01-16 14:35:44');
INSERT INTO `log` VALUES ('996', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 59.128 ms\n', '2020-01-16 14:38:38');
INSERT INTO `log` VALUES ('997', '::ffff:192.168.0.102 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 21.686 ms\n', '2020-01-16 14:47:55');
INSERT INTO `log` VALUES ('998', '::ffff:192.168.42.151 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 25.456 ms\n', '2020-01-16 14:49:18');
INSERT INTO `log` VALUES ('999', '::ffff:192.168.42.151 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 31.304 ms\n', '2020-01-16 15:02:45');
INSERT INTO `log` VALUES ('1000', '::ffff:192.168.42.151 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 8.692 ms\n', '2020-01-16 15:03:33');
INSERT INTO `log` VALUES ('1001', '::ffff:192.168.42.151 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 88 - 87.283 ms\n', '2020-01-16 15:03:44');
INSERT INTO `log` VALUES ('1002', '::ffff:192.168.42.151 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 17.341 ms\n', '2020-01-16 15:04:01');
INSERT INTO `log` VALUES ('1003', '::ffff:192.168.42.151 - POST /wechat/login HTTP/1.1 200 309 - 273.930 ms\n', '2020-01-16 15:04:01');
INSERT INTO `log` VALUES ('1004', '::ffff:192.168.42.151 - POST /wechat/login HTTP/1.1 200 309 - 205.932 ms\n', '2020-01-16 15:04:04');
INSERT INTO `log` VALUES ('1005', '::ffff:192.168.42.151 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 19.666 ms\n', '2020-01-16 15:04:09');
INSERT INTO `log` VALUES ('1006', '::ffff:192.168.42.151 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 42.572 ms\n', '2020-01-16 15:04:33');
INSERT INTO `log` VALUES ('1007', '::ffff:192.168.42.151 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=1 HTTP/1.1 200 30 - 17.958 ms\n', '2020-01-16 15:04:35');
INSERT INTO `log` VALUES ('1008', '::ffff:192.168.42.151 - GET /index/updateVideoLike?videoLike=false&userId=3&videoId=1 HTTP/1.1 200 30 - 18.054 ms\n', '2020-01-16 15:04:38');
INSERT INTO `log` VALUES ('1009', '::ffff:192.168.42.151 - GET /index/updateVideoLike?videoLike=true&userId=3&videoId=2 HTTP/1.1 200 30 - 12.716 ms\n', '2020-01-16 15:04:40');
INSERT INTO `log` VALUES ('1010', '::ffff:192.168.42.151 - GET /index/updateVideoLike?videoLike=false&userId=3&videoId=3 HTTP/1.1 200 30 - 17.369 ms\n', '2020-01-16 15:04:42');
INSERT INTO `log` VALUES ('1011', '::ffff:192.168.42.183 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 24.710 ms\n', '2020-01-16 15:15:19');
INSERT INTO `log` VALUES ('1012', '::ffff:192.168.42.183 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 75.946 ms\n', '2020-01-16 15:15:57');
INSERT INTO `log` VALUES ('1013', '::ffff:192.168.42.129 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 19.558 ms\n', '2020-01-16 15:50:28');
INSERT INTO `log` VALUES ('1014', '::ffff:192.168.42.129 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=3 HTTP/1.1 200 88 - 27.435 ms\n', '2020-01-16 15:50:45');
INSERT INTO `log` VALUES ('1015', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=3 HTTP/1.1 200 30 - 10.974 ms\n', '2020-01-16 15:50:48');
INSERT INTO `log` VALUES ('1016', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=3 HTTP/1.1 200 30 - 8.550 ms\n', '2020-01-16 15:50:49');
INSERT INTO `log` VALUES ('1017', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=3 HTTP/1.1 200 30 - 5.002 ms\n', '2020-01-16 15:50:49');
INSERT INTO `log` VALUES ('1018', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 309 - 322.969 ms\n', '2020-01-16 15:50:51');
INSERT INTO `log` VALUES ('1019', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 309 - 282.328 ms\n', '2020-01-16 15:50:53');
INSERT INTO `log` VALUES ('1020', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 9.816 ms\n', '2020-01-16 15:50:53');
INSERT INTO `log` VALUES ('1021', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 21.006 ms\n', '2020-01-16 15:50:53');
INSERT INTO `log` VALUES ('1022', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 14.386 ms\n', '2020-01-16 15:50:53');
INSERT INTO `log` VALUES ('1023', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 309 - 221.249 ms\n', '2020-01-16 15:50:54');
INSERT INTO `log` VALUES ('1024', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 4.350 ms\n', '2020-01-16 15:50:54');
INSERT INTO `log` VALUES ('1025', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 3.656 ms\n', '2020-01-16 15:50:54');
INSERT INTO `log` VALUES ('1026', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 3.716 ms\n', '2020-01-16 15:50:54');
INSERT INTO `log` VALUES ('1027', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 309 - 216.813 ms\n', '2020-01-16 15:50:55');
INSERT INTO `log` VALUES ('1028', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 31.874 ms\n', '2020-01-16 15:50:56');
INSERT INTO `log` VALUES ('1029', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 28.407 ms\n', '2020-01-16 15:50:56');
INSERT INTO `log` VALUES ('1030', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 10.566 ms\n', '2020-01-16 15:51:48');
INSERT INTO `log` VALUES ('1031', '::ffff:192.168.42.129 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 24.573 ms\n', '2020-01-16 15:51:49');
INSERT INTO `log` VALUES ('1032', '::ffff:192.168.42.183 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 12.156 ms\n', '2020-01-16 15:52:57');
INSERT INTO `log` VALUES ('1033', '::ffff:192.168.42.183 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 42.637 ms\n', '2020-01-16 15:53:14');
INSERT INTO `log` VALUES ('1034', '::ffff:192.168.42.183 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 21.151 ms\n', '2020-01-16 15:53:46');
INSERT INTO `log` VALUES ('1035', '::ffff:192.168.42.183 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 9.538 ms\n', '2020-01-16 15:57:48');
INSERT INTO `log` VALUES ('1036', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 6.153 ms\n', '2020-01-16 16:01:22');
INSERT INTO `log` VALUES ('1037', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 10.851 ms\n', '2020-01-16 16:01:49');
INSERT INTO `log` VALUES ('1038', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 42.039 ms\n', '2020-01-16 16:02:08');
INSERT INTO `log` VALUES ('1039', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 36.484 ms\n', '2020-01-16 16:02:48');
INSERT INTO `log` VALUES ('1040', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 59 - 16.085 ms\n', '2020-01-16 16:03:36');
INSERT INTO `log` VALUES ('1041', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 59 - 11.977 ms\n', '2020-01-16 16:03:44');
INSERT INTO `log` VALUES ('1042', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.608 ms\n', '2020-01-16 16:03:52');
INSERT INTO `log` VALUES ('1043', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 46.429 ms\n', '2020-01-16 16:07:09');
INSERT INTO `log` VALUES ('1044', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 54.524 ms\n', '2020-01-16 16:08:24');
INSERT INTO `log` VALUES ('1045', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 31.284 ms\n', '2020-01-16 16:09:01');
INSERT INTO `log` VALUES ('1046', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 29.439 ms\n', '2020-01-16 16:09:12');
INSERT INTO `log` VALUES ('1047', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 43.976 ms\n', '2020-01-16 16:09:15');
INSERT INTO `log` VALUES ('1048', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 118.350 ms\n', '2020-01-16 16:10:27');
INSERT INTO `log` VALUES ('1049', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 53.225 ms\n', '2020-01-16 16:11:24');
INSERT INTO `log` VALUES ('1050', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 117.033 ms\n', '2020-01-16 16:13:44');
INSERT INTO `log` VALUES ('1051', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 36.009 ms\n', '2020-01-16 16:15:15');
INSERT INTO `log` VALUES ('1052', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 65.795 ms\n', '2020-01-16 16:17:54');
INSERT INTO `log` VALUES ('1053', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 45.943 ms\n', '2020-01-16 16:18:52');
INSERT INTO `log` VALUES ('1054', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 65.562 ms\n', '2020-01-16 16:25:54');
INSERT INTO `log` VALUES ('1055', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 39.062 ms\n', '2020-01-16 16:26:12');
INSERT INTO `log` VALUES ('1056', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 51.314 ms\n', '2020-01-16 16:28:12');
INSERT INTO `log` VALUES ('1057', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 34.858 ms\n', '2020-01-16 16:28:29');
INSERT INTO `log` VALUES ('1058', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 28.016 ms\n', '2020-01-16 16:31:10');
INSERT INTO `log` VALUES ('1059', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 26.218 ms\n', '2020-01-16 16:31:34');
INSERT INTO `log` VALUES ('1060', '::ffff:192.168.42.217 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 64.056 ms\n', '2020-01-16 16:33:05');
INSERT INTO `log` VALUES ('1061', '::ffff:192.168.42.129 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.202 ms\n', '2020-01-16 16:34:58');
INSERT INTO `log` VALUES ('1062', '::ffff:192.168.42.217 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 22.722 ms\n', '2020-01-16 16:36:21');
INSERT INTO `log` VALUES ('1063', '::ffff:192.168.42.217 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 40.036 ms\n', '2020-01-16 16:36:45');
INSERT INTO `log` VALUES ('1064', '::ffff:192.168.42.217 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 72.915 ms\n', '2020-01-16 16:38:38');
INSERT INTO `log` VALUES ('1065', '::ffff:192.168.42.217 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 61.968 ms\n', '2020-01-16 16:40:42');
INSERT INTO `log` VALUES ('1066', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 123.302 ms\n', '2020-01-17 11:06:10');
INSERT INTO `log` VALUES ('1067', '::ffff:192.168.42.129 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 12.199 ms\n', '2020-01-17 11:06:41');
INSERT INTO `log` VALUES ('1068', '::ffff:192.168.42.129 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 59 - 15.088 ms\n', '2020-01-17 11:07:00');
INSERT INTO `log` VALUES ('1069', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 59 - 9.859 ms\n', '2020-01-17 11:07:14');
INSERT INTO `log` VALUES ('1070', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 59 - 20.924 ms\n', '2020-01-17 11:07:15');
INSERT INTO `log` VALUES ('1071', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 59 - 14.296 ms\n', '2020-01-17 11:07:15');
INSERT INTO `log` VALUES ('1072', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 59 - 11.535 ms\n', '2020-01-17 11:07:15');
INSERT INTO `log` VALUES ('1073', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 59 - 12.323 ms\n', '2020-01-17 11:07:15');
INSERT INTO `log` VALUES ('1074', '::ffff:192.168.42.129 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 59 - 6.393 ms\n', '2020-01-17 11:07:16');
INSERT INTO `log` VALUES ('1075', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 59 - 12.422 ms\n', '2020-01-17 11:07:45');
INSERT INTO `log` VALUES ('1076', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 59 - 12.348 ms\n', '2020-01-17 11:07:45');
INSERT INTO `log` VALUES ('1077', '::ffff:192.168.42.129 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 15.882 ms\n', '2020-01-17 11:07:59');
INSERT INTO `log` VALUES ('1078', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 59 - 17.267 ms\n', '2020-01-17 11:08:39');
INSERT INTO `log` VALUES ('1079', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 59 - 19.279 ms\n', '2020-01-17 11:08:39');
INSERT INTO `log` VALUES ('1080', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 59 - 10.940 ms\n', '2020-01-17 11:08:39');
INSERT INTO `log` VALUES ('1081', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 36.536 ms\n', '2020-01-17 11:09:42');
INSERT INTO `log` VALUES ('1082', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 14.346 ms\n', '2020-01-17 11:09:48');
INSERT INTO `log` VALUES ('1083', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 44.799 ms\n', '2020-01-17 11:10:36');
INSERT INTO `log` VALUES ('1084', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 66.411 ms\n', '2020-01-17 11:15:40');
INSERT INTO `log` VALUES ('1085', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 327.832 ms\n', '2020-01-17 11:15:43');
INSERT INTO `log` VALUES ('1086', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 15.510 ms\n', '2020-01-17 11:15:55');
INSERT INTO `log` VALUES ('1087', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 11.233 ms\n', '2020-01-17 11:15:57');
INSERT INTO `log` VALUES ('1088', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 55.239 ms\n', '2020-01-17 11:16:09');
INSERT INTO `log` VALUES ('1089', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 38.779 ms\n', '2020-01-17 11:16:14');
INSERT INTO `log` VALUES ('1090', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 52.396 ms\n', '2020-01-17 11:16:20');
INSERT INTO `log` VALUES ('1091', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 56.464 ms\n', '2020-01-17 11:16:46');
INSERT INTO `log` VALUES ('1092', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 30.831 ms\n', '2020-01-17 11:17:15');
INSERT INTO `log` VALUES ('1093', '::ffff:192.168.42.129 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 5.018 ms\n', '2020-01-17 11:17:47');
INSERT INTO `log` VALUES ('1094', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 12.615 ms\n', '2020-01-17 11:17:51');
INSERT INTO `log` VALUES ('1095', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 3.648 ms\n', '2020-01-17 11:17:52');
INSERT INTO `log` VALUES ('1096', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 12.679 ms\n', '2020-01-17 11:17:52');
INSERT INTO `log` VALUES ('1097', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 9.229 ms\n', '2020-01-17 11:17:52');
INSERT INTO `log` VALUES ('1098', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 14.369 ms\n', '2020-01-17 11:17:53');
INSERT INTO `log` VALUES ('1099', '::ffff:192.168.42.129 - POST /wechat/update/userinfo HTTP/1.1 200 56 - 14.925 ms\n', '2020-01-17 11:17:55');
INSERT INTO `log` VALUES ('1100', '::ffff:192.168.42.129 - POST /wechat/update/userinfo HTTP/1.1 200 56 - 16.412 ms\n', '2020-01-17 11:17:56');
INSERT INTO `log` VALUES ('1101', '::ffff:192.168.42.129 - POST /wechat/update/userinfo HTTP/1.1 200 56 - 5.844 ms\n', '2020-01-17 11:17:57');
INSERT INTO `log` VALUES ('1102', '::ffff:192.168.42.129 - POST /wechat/update/userinfo HTTP/1.1 200 56 - 7.024 ms\n', '2020-01-17 11:17:58');
INSERT INTO `log` VALUES ('1103', '::ffff:192.168.42.129 - POST /wechat/update/userinfo HTTP/1.1 200 56 - 7.804 ms\n', '2020-01-17 11:17:58');
INSERT INTO `log` VALUES ('1104', '::ffff:192.168.42.129 - POST /wechat/update/userinfo HTTP/1.1 200 56 - 15.104 ms\n', '2020-01-17 11:17:59');
INSERT INTO `log` VALUES ('1105', '::ffff:192.168.42.129 - POST /wechat/update/userinfo HTTP/1.1 200 56 - 13.747 ms\n', '2020-01-17 11:18:00');
INSERT INTO `log` VALUES ('1106', '::ffff:192.168.42.129 - POST /wechat/update/userinfo HTTP/1.1 200 56 - 29.383 ms\n', '2020-01-17 11:18:00');
INSERT INTO `log` VALUES ('1107', '::ffff:192.168.42.129 - POST /wechat/update/userinfo HTTP/1.1 200 56 - 17.285 ms\n', '2020-01-17 11:18:02');
INSERT INTO `log` VALUES ('1108', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 13.104 ms\n', '2020-01-17 11:23:43');
INSERT INTO `log` VALUES ('1109', '::ffff:192.168.42.218 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 35.261 ms\n', '2020-01-17 11:23:46');
INSERT INTO `log` VALUES ('1110', '::ffff:192.168.42.129 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 13.019 ms\n', '2020-01-17 11:24:33');
INSERT INTO `log` VALUES ('1111', '::ffff:192.168.42.129 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 56 - 4.107 ms\n', '2020-01-17 11:24:42');
INSERT INTO `log` VALUES ('1112', '::ffff:192.168.42.129 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 56 - 12.300 ms\n', '2020-01-17 11:24:48');
INSERT INTO `log` VALUES ('1113', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 11.666 ms\n', '2020-01-17 11:24:54');
INSERT INTO `log` VALUES ('1114', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 12.913 ms\n', '2020-01-17 11:24:54');
INSERT INTO `log` VALUES ('1115', '::ffff:192.168.42.129 - POST /wechat/update/userinfo HTTP/1.1 200 56 - 9.941 ms\n', '2020-01-17 11:25:04');
INSERT INTO `log` VALUES ('1116', '::ffff:192.168.42.129 - POST /wechat/update/userinfo HTTP/1.1 200 56 - 14.679 ms\n', '2020-01-17 11:25:05');
INSERT INTO `log` VALUES ('1117', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 61.295 ms\n', '2020-01-17 11:28:25');
INSERT INTO `log` VALUES ('1118', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 21.511 ms\n', '2020-01-17 11:28:30');
INSERT INTO `log` VALUES ('1119', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 37.491 ms\n', '2020-01-17 11:30:54');
INSERT INTO `log` VALUES ('1120', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 17.593 ms\n', '2020-01-17 11:31:11');
INSERT INTO `log` VALUES ('1121', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 33.534 ms\n', '2020-01-17 11:36:33');
INSERT INTO `log` VALUES ('1122', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 19.966 ms\n', '2020-01-17 11:37:24');
INSERT INTO `log` VALUES ('1123', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 248.541 ms\n', '2020-01-17 11:37:26');
INSERT INTO `log` VALUES ('1124', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 41.081 ms\n', '2020-01-17 11:37:58');
INSERT INTO `log` VALUES ('1125', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 266.371 ms\n', '2020-01-17 11:38:02');
INSERT INTO `log` VALUES ('1126', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 13.354 ms\n', '2020-01-17 11:38:09');
INSERT INTO `log` VALUES ('1127', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 240.597 ms\n', '2020-01-17 11:38:10');
INSERT INTO `log` VALUES ('1128', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 13.801 ms\n', '2020-01-17 11:38:10');
INSERT INTO `log` VALUES ('1129', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 21.070 ms\n', '2020-01-17 11:38:15');
INSERT INTO `log` VALUES ('1130', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 61.248 ms\n', '2020-01-17 11:38:28');
INSERT INTO `log` VALUES ('1131', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 241.260 ms\n', '2020-01-17 11:38:29');
INSERT INTO `log` VALUES ('1132', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 58.800 ms\n', '2020-01-17 11:40:17');
INSERT INTO `log` VALUES ('1133', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 45.053 ms\n', '2020-01-17 11:42:06');
INSERT INTO `log` VALUES ('1134', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 29.386 ms\n', '2020-01-17 11:42:39');
INSERT INTO `log` VALUES ('1135', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 18.958 ms\n', '2020-01-17 11:43:02');
INSERT INTO `log` VALUES ('1136', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 302.816 ms\n', '2020-01-17 11:43:08');
INSERT INTO `log` VALUES ('1137', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 16.599 ms\n', '2020-01-17 11:43:19');
INSERT INTO `log` VALUES ('1138', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 256.410 ms\n', '2020-01-17 11:43:23');
INSERT INTO `log` VALUES ('1139', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 228.177 ms\n', '2020-01-17 11:43:32');
INSERT INTO `log` VALUES ('1140', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 10.294 ms\n', '2020-01-17 11:45:47');
INSERT INTO `log` VALUES ('1141', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 32.313 ms\n', '2020-01-17 11:48:20');
INSERT INTO `log` VALUES ('1142', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 69.632 ms\n', '2020-01-17 11:48:32');
INSERT INTO `log` VALUES ('1143', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 37.241 ms\n', '2020-01-17 11:48:45');
INSERT INTO `log` VALUES ('1144', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 34.118 ms\n', '2020-01-17 11:50:12');
INSERT INTO `log` VALUES ('1145', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 20.535 ms\n', '2020-01-17 11:50:21');
INSERT INTO `log` VALUES ('1146', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 263.361 ms\n', '2020-01-17 11:50:38');
INSERT INTO `log` VALUES ('1147', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 15.786 ms\n', '2020-01-17 11:50:38');
INSERT INTO `log` VALUES ('1148', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 87.406 ms\n', '2020-01-17 11:50:45');
INSERT INTO `log` VALUES ('1149', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 21.109 ms\n', '2020-01-17 11:51:35');
INSERT INTO `log` VALUES ('1150', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 44.075 ms\n', '2020-01-17 11:52:20');
INSERT INTO `log` VALUES ('1151', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 266.876 ms\n', '2020-01-17 11:52:31');
INSERT INTO `log` VALUES ('1152', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 15.533 ms\n', '2020-01-17 11:52:31');
INSERT INTO `log` VALUES ('1153', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 57.751 ms\n', '2020-01-17 11:52:35');
INSERT INTO `log` VALUES ('1154', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 21.741 ms\n', '2020-01-17 11:52:45');
INSERT INTO `log` VALUES ('1155', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 223.678 ms\n', '2020-01-17 11:52:58');
INSERT INTO `log` VALUES ('1156', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 16.359 ms\n', '2020-01-17 11:52:58');
INSERT INTO `log` VALUES ('1157', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 26.279 ms\n', '2020-01-17 11:53:08');
INSERT INTO `log` VALUES ('1158', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 12.265 ms\n', '2020-01-17 11:53:13');
INSERT INTO `log` VALUES ('1159', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 10.818 ms\n', '2020-01-17 11:56:58');
INSERT INTO `log` VALUES ('1160', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 8.947 ms\n', '2020-01-17 11:57:02');
INSERT INTO `log` VALUES ('1161', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 24.999 ms\n', '2020-01-17 11:57:10');
INSERT INTO `log` VALUES ('1162', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 24.491 ms\n', '2020-01-17 12:05:48');
INSERT INTO `log` VALUES ('1163', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 57.048 ms\n', '2020-01-17 12:06:21');
INSERT INTO `log` VALUES ('1164', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 262.730 ms\n', '2020-01-17 12:06:25');
INSERT INTO `log` VALUES ('1165', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 174 - 49.091 ms\n', '2020-01-17 12:06:25');
INSERT INTO `log` VALUES ('1166', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 31.528 ms\n', '2020-01-17 12:07:10');
INSERT INTO `log` VALUES ('1167', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 20.812 ms\n', '2020-01-17 12:07:41');
INSERT INTO `log` VALUES ('1168', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 296.076 ms\n', '2020-01-17 12:07:45');
INSERT INTO `log` VALUES ('1169', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 291.498 ms\n', '2020-01-17 12:08:04');
INSERT INTO `log` VALUES ('1170', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 12.510 ms\n', '2020-01-17 12:08:04');
INSERT INTO `log` VALUES ('1171', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 27.120 ms\n', '2020-01-17 12:08:09');
INSERT INTO `log` VALUES ('1172', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 250.369 ms\n', '2020-01-17 12:09:06');
INSERT INTO `log` VALUES ('1173', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 25.426 ms\n', '2020-01-17 12:09:06');
INSERT INTO `log` VALUES ('1174', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 28.768 ms\n', '2020-01-17 12:09:09');
INSERT INTO `log` VALUES ('1175', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 224.398 ms\n', '2020-01-17 12:09:10');
INSERT INTO `log` VALUES ('1176', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 15.468 ms\n', '2020-01-17 12:09:11');
INSERT INTO `log` VALUES ('1177', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 284.396 ms\n', '2020-01-17 12:09:15');
INSERT INTO `log` VALUES ('1178', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 14.979 ms\n', '2020-01-17 12:09:16');
INSERT INTO `log` VALUES ('1179', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 26.541 ms\n', '2020-01-17 12:09:47');
INSERT INTO `log` VALUES ('1180', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 32.711 ms\n', '2020-01-17 12:09:58');
INSERT INTO `log` VALUES ('1181', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 8.202 ms\n', '2020-01-17 12:10:53');
INSERT INTO `log` VALUES ('1182', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 25.216 ms\n', '2020-01-17 12:11:15');
INSERT INTO `log` VALUES ('1183', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 18.259 ms\n', '2020-01-17 12:11:24');
INSERT INTO `log` VALUES ('1184', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 266.986 ms\n', '2020-01-17 12:11:26');
INSERT INTO `log` VALUES ('1185', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 276.446 ms\n', '2020-01-17 12:11:33');
INSERT INTO `log` VALUES ('1186', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 15.035 ms\n', '2020-01-17 12:11:33');
INSERT INTO `log` VALUES ('1187', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 19.176 ms\n', '2020-01-17 12:11:48');
INSERT INTO `log` VALUES ('1188', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 17.963 ms\n', '2020-01-17 12:13:17');
INSERT INTO `log` VALUES ('1189', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 8.396 ms\n', '2020-01-17 12:13:54');
INSERT INTO `log` VALUES ('1190', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 17.966 ms\n', '2020-01-17 12:14:03');
INSERT INTO `log` VALUES ('1191', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 48.124 ms\n', '2020-01-17 12:14:49');
INSERT INTO `log` VALUES ('1192', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 129.221 ms\n', '2020-01-17 12:14:56');
INSERT INTO `log` VALUES ('1193', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 78.143 ms\n', '2020-01-17 12:15:22');
INSERT INTO `log` VALUES ('1194', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 296.472 ms\n', '2020-01-17 12:15:23');
INSERT INTO `log` VALUES ('1195', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 13.068 ms\n', '2020-01-17 12:16:24');
INSERT INTO `log` VALUES ('1196', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 10.632 ms\n', '2020-01-17 12:16:38');
INSERT INTO `log` VALUES ('1197', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 288.939 ms\n', '2020-01-17 12:16:39');
INSERT INTO `log` VALUES ('1198', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 22.426 ms\n', '2020-01-17 12:20:30');
INSERT INTO `log` VALUES ('1199', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 27.888 ms\n', '2020-01-17 12:20:39');
INSERT INTO `log` VALUES ('1200', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 23.337 ms\n', '2020-01-17 12:21:57');
INSERT INTO `log` VALUES ('1201', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 38.202 ms\n', '2020-01-17 12:22:04');
INSERT INTO `log` VALUES ('1202', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 211.290 ms\n', '2020-01-17 12:22:07');
INSERT INTO `log` VALUES ('1203', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 260.125 ms\n', '2020-01-17 12:22:22');
INSERT INTO `log` VALUES ('1204', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 16.558 ms\n', '2020-01-17 12:22:22');
INSERT INTO `log` VALUES ('1205', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 35.084 ms\n', '2020-01-17 12:22:53');
INSERT INTO `log` VALUES ('1206', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 72.023 ms\n', '2020-01-17 12:23:00');
INSERT INTO `log` VALUES ('1207', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 44.743 ms\n', '2020-01-17 12:23:15');
INSERT INTO `log` VALUES ('1208', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 12.749 ms\n', '2020-01-17 12:23:24');
INSERT INTO `log` VALUES ('1209', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 23.122 ms\n', '2020-01-17 12:23:31');
INSERT INTO `log` VALUES ('1210', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 32.361 ms\n', '2020-01-17 12:23:48');
INSERT INTO `log` VALUES ('1211', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 26.565 ms\n', '2020-01-17 12:24:24');
INSERT INTO `log` VALUES ('1212', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 263.411 ms\n', '2020-01-17 12:24:27');
INSERT INTO `log` VALUES ('1213', '::ffff:192.168.42.218 - POST /wechat/login HTTP/1.1 200 309 - 249.967 ms\n', '2020-01-17 12:24:32');
INSERT INTO `log` VALUES ('1214', '::ffff:192.168.42.218 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 77.489 ms\n', '2020-01-17 12:24:33');
INSERT INTO `log` VALUES ('1215', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 42.484 ms\n', '2020-01-17 12:24:37');
INSERT INTO `log` VALUES ('1216', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 34.819 ms\n', '2020-01-17 12:24:41');
INSERT INTO `log` VALUES ('1217', '::ffff:192.168.42.218 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 39.862 ms\n', '2020-01-17 12:24:43');
INSERT INTO `log` VALUES ('1218', '::ffff:192.168.42.218 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 50.745 ms\n', '2020-01-17 12:24:45');
INSERT INTO `log` VALUES ('1219', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 28.582 ms\n', '2020-01-17 12:24:52');
INSERT INTO `log` VALUES ('1220', '::ffff:192.168.42.129 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 4.529 ms\n', '2020-01-17 12:25:30');
INSERT INTO `log` VALUES ('1221', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 6.216 ms\n', '2020-01-17 12:25:50');
INSERT INTO `log` VALUES ('1222', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 6.028 ms\n', '2020-01-17 12:25:53');
INSERT INTO `log` VALUES ('1223', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 3.869 ms\n', '2020-01-17 12:25:56');
INSERT INTO `log` VALUES ('1224', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 3.658 ms\n', '2020-01-17 12:25:57');
INSERT INTO `log` VALUES ('1225', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 7.751 ms\n', '2020-01-17 12:25:57');
INSERT INTO `log` VALUES ('1226', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 9.547 ms\n', '2020-01-17 12:25:57');
INSERT INTO `log` VALUES ('1227', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 3.158 ms\n', '2020-01-17 12:25:58');
INSERT INTO `log` VALUES ('1228', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 30.128 ms\n', '2020-01-17 12:25:58');
INSERT INTO `log` VALUES ('1229', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 12.426 ms\n', '2020-01-17 12:25:58');
INSERT INTO `log` VALUES ('1230', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 5.608 ms\n', '2020-01-17 12:25:59');
INSERT INTO `log` VALUES ('1231', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 7.502 ms\n', '2020-01-17 12:25:59');
INSERT INTO `log` VALUES ('1232', '::ffff:192.168.42.129 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=2 HTTP/1.1 200 56 - 3.613 ms\n', '2020-01-17 12:26:02');
INSERT INTO `log` VALUES ('1233', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=2 HTTP/1.1 200 56 - 3.521 ms\n', '2020-01-17 12:26:08');
INSERT INTO `log` VALUES ('1234', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=2 HTTP/1.1 200 56 - 15.427 ms\n', '2020-01-17 12:26:08');
INSERT INTO `log` VALUES ('1235', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=2 HTTP/1.1 200 56 - 5.239 ms\n', '2020-01-17 12:26:09');
INSERT INTO `log` VALUES ('1236', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=2 HTTP/1.1 200 56 - 7.223 ms\n', '2020-01-17 12:26:09');
INSERT INTO `log` VALUES ('1237', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=2 HTTP/1.1 200 56 - 8.449 ms\n', '2020-01-17 12:26:09');
INSERT INTO `log` VALUES ('1238', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=2 HTTP/1.1 200 56 - 3.946 ms\n', '2020-01-17 12:26:09');
INSERT INTO `log` VALUES ('1239', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=2 HTTP/1.1 200 56 - 3.370 ms\n', '2020-01-17 12:26:10');
INSERT INTO `log` VALUES ('1240', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=false&userId=null&videoId=2 HTTP/1.1 200 56 - 3.553 ms\n', '2020-01-17 12:26:10');
INSERT INTO `log` VALUES ('1241', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 3.656 ms\n', '2020-01-17 12:26:14');
INSERT INTO `log` VALUES ('1242', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 3.872 ms\n', '2020-01-17 12:26:19');
INSERT INTO `log` VALUES ('1243', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 5.348 ms\n', '2020-01-17 12:26:19');
INSERT INTO `log` VALUES ('1244', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 4.434 ms\n', '2020-01-17 12:26:19');
INSERT INTO `log` VALUES ('1245', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 12.342 ms\n', '2020-01-17 12:26:20');
INSERT INTO `log` VALUES ('1246', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 5.394 ms\n', '2020-01-17 12:26:21');
INSERT INTO `log` VALUES ('1247', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 9.583 ms\n', '2020-01-17 12:26:21');
INSERT INTO `log` VALUES ('1248', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 4.323 ms\n', '2020-01-17 12:26:23');
INSERT INTO `log` VALUES ('1249', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 3.419 ms\n', '2020-01-17 12:26:23');
INSERT INTO `log` VALUES ('1250', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 6.226 ms\n', '2020-01-17 12:26:23');
INSERT INTO `log` VALUES ('1251', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 3.175 ms\n', '2020-01-17 12:26:23');
INSERT INTO `log` VALUES ('1252', '::ffff:192.168.42.218 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 58.313 ms\n', '2020-01-17 12:28:04');
INSERT INTO `log` VALUES ('1253', '::ffff:192.168.42.218 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 36.927 ms\n', '2020-01-17 12:28:27');
INSERT INTO `log` VALUES ('1254', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 19.619 ms\n', '2020-01-17 12:29:50');
INSERT INTO `log` VALUES ('1255', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 21.064 ms\n', '2020-01-17 12:29:54');
INSERT INTO `log` VALUES ('1256', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 9.571 ms\n', '2020-01-17 12:30:39');
INSERT INTO `log` VALUES ('1257', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 68.802 ms\n', '2020-01-17 12:30:41');
INSERT INTO `log` VALUES ('1258', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 18.945 ms\n', '2020-01-17 12:30:56');
INSERT INTO `log` VALUES ('1259', '::ffff:192.168.56.1 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=1 HTTP/1.1 200 30 - 4.729 ms\n', '2020-01-17 12:32:11');
INSERT INTO `log` VALUES ('1260', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 76.974 ms\n', '2020-01-17 12:35:04');
INSERT INTO `log` VALUES ('1261', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 41.720 ms\n', '2020-01-17 12:35:38');
INSERT INTO `log` VALUES ('1262', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 38.724 ms\n', '2020-01-17 13:02:15');
INSERT INTO `log` VALUES ('1263', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 41.526 ms\n', '2020-01-17 13:02:21');
INSERT INTO `log` VALUES ('1264', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 57.151 ms\n', '2020-01-17 13:02:32');
INSERT INTO `log` VALUES ('1265', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 43.396 ms\n', '2020-01-17 13:02:35');
INSERT INTO `log` VALUES ('1266', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 11.153 ms\n', '2020-01-17 13:02:47');
INSERT INTO `log` VALUES ('1267', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 32.783 ms\n', '2020-01-17 13:44:56');
INSERT INTO `log` VALUES ('1268', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 31.347 ms\n', '2020-01-17 13:53:42');
INSERT INTO `log` VALUES ('1269', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 34.383 ms\n', '2020-01-17 14:12:29');
INSERT INTO `log` VALUES ('1270', '::ffff:192.168.56.1 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 39.003 ms\n', '2020-01-17 14:13:29');
INSERT INTO `log` VALUES ('1271', '::ffff:192.168.42.116 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 74.871 ms\n', '2020-01-17 14:14:20');
INSERT INTO `log` VALUES ('1272', '::ffff:192.168.42.129 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 6.359 ms\n', '2020-01-17 14:15:16');
INSERT INTO `log` VALUES ('1273', '::ffff:192.168.42.116 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 20.040 ms\n', '2020-01-17 14:15:30');
INSERT INTO `log` VALUES ('1274', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 43.411 ms\n', '2020-01-17 14:15:58');
INSERT INTO `log` VALUES ('1275', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 19.806 ms\n', '2020-01-17 14:18:08');
INSERT INTO `log` VALUES ('1276', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 28.815 ms\n', '2020-01-17 14:18:57');
INSERT INTO `log` VALUES ('1277', '::ffff:192.168.56.1 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 21.646 ms\n', '2020-01-17 14:21:45');
INSERT INTO `log` VALUES ('1278', '::ffff:192.168.42.47 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 26.159 ms\n', '2020-01-17 14:24:41');
INSERT INTO `log` VALUES ('1279', '::ffff:192.168.42.129 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 5.304 ms\n', '2020-01-17 14:26:10');
INSERT INTO `log` VALUES ('1280', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 17.137 ms\n', '2020-01-17 14:27:59');
INSERT INTO `log` VALUES ('1281', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 16.621 ms\n', '2020-01-17 14:29:09');
INSERT INTO `log` VALUES ('1282', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 13.489 ms\n', '2020-01-17 14:30:14');
INSERT INTO `log` VALUES ('1283', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 37.781 ms\n', '2020-01-17 14:30:21');
INSERT INTO `log` VALUES ('1284', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 36.789 ms\n', '2020-01-17 14:30:52');
INSERT INTO `log` VALUES ('1285', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 29.561 ms\n', '2020-01-17 14:31:41');
INSERT INTO `log` VALUES ('1286', '::ffff:192.168.42.19 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 26.773 ms\n', '2020-01-17 14:33:05');
INSERT INTO `log` VALUES ('1287', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 246.264 ms\n', '2020-01-17 14:33:33');
INSERT INTO `log` VALUES ('1288', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 254.668 ms\n', '2020-01-17 14:33:36');
INSERT INTO `log` VALUES ('1289', '::ffff:192.168.42.19 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 20.084 ms\n', '2020-01-17 14:33:37');
INSERT INTO `log` VALUES ('1290', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 55.116 ms\n', '2020-01-17 14:33:39');
INSERT INTO `log` VALUES ('1291', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 17.269 ms\n', '2020-01-17 14:34:46');
INSERT INTO `log` VALUES ('1292', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 15.858 ms\n', '2020-01-17 14:34:52');
INSERT INTO `log` VALUES ('1293', '::ffff:192.168.42.19 - GET /index/addConcern?userId=3&concernId=1 HTTP/1.1 404 33 - 13.006 ms\n', '2020-01-17 14:34:53');
INSERT INTO `log` VALUES ('1294', '::ffff:192.168.42.19 - GET /index/addConcern?userId=3&concernId=1 HTTP/1.1 404 33 - 15.032 ms\n', '2020-01-17 14:38:31');
INSERT INTO `log` VALUES ('1295', '::ffff:192.168.42.19 - GET /index/addConcern?userId=3&concernId=1 HTTP/1.1 404 33 - 12.621 ms\n', '2020-01-17 14:38:33');
INSERT INTO `log` VALUES ('1296', '::ffff:192.168.42.19 - GET /index/addConcern?userId=3&concernId=1 HTTP/1.1 404 33 - 9.607 ms\n', '2020-01-17 14:38:35');
INSERT INTO `log` VALUES ('1297', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 49.027 ms\n', '2020-01-17 14:39:15');
INSERT INTO `log` VALUES ('1298', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 404 33 - 7.864 ms\n', '2020-01-17 14:39:23');
INSERT INTO `log` VALUES ('1299', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 404 33 - 12.459 ms\n', '2020-01-17 14:39:39');
INSERT INTO `log` VALUES ('1300', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 64.887 ms\n', '2020-01-17 14:41:35');
INSERT INTO `log` VALUES ('1301', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 62.430 ms\n', '2020-01-17 14:41:46');
INSERT INTO `log` VALUES ('1302', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 404 33 - 5.167 ms\n', '2020-01-17 14:41:48');
INSERT INTO `log` VALUES ('1303', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 63.990 ms\n', '2020-01-17 14:42:15');
INSERT INTO `log` VALUES ('1304', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 404 33 - 9.728 ms\n', '2020-01-17 14:42:17');
INSERT INTO `log` VALUES ('1305', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 94.391 ms\n', '2020-01-17 14:42:42');
INSERT INTO `log` VALUES ('1306', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 404 33 - 18.201 ms\n', '2020-01-17 14:42:45');
INSERT INTO `log` VALUES ('1307', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 58.473 ms\n', '2020-01-17 14:43:28');
INSERT INTO `log` VALUES ('1308', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 27.674 ms\n', '2020-01-17 14:43:35');
INSERT INTO `log` VALUES ('1309', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 404 33 - 7.881 ms\n', '2020-01-17 14:43:36');
INSERT INTO `log` VALUES ('1310', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 25.947 ms\n', '2020-01-17 14:44:30');
INSERT INTO `log` VALUES ('1311', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 48.518 ms\n', '2020-01-17 14:44:41');
INSERT INTO `log` VALUES ('1312', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 200 38 - 3.552 ms\n', '2020-01-17 14:44:43');
INSERT INTO `log` VALUES ('1313', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 294.485 ms\n', '2020-01-17 14:44:51');
INSERT INTO `log` VALUES ('1314', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 249.080 ms\n', '2020-01-17 14:44:54');
INSERT INTO `log` VALUES ('1315', '::ffff:192.168.42.19 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 19.589 ms\n', '2020-01-17 14:44:54');
INSERT INTO `log` VALUES ('1316', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 24.984 ms\n', '2020-01-17 14:44:57');
INSERT INTO `log` VALUES ('1317', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 404 33 - 6.489 ms\n', '2020-01-17 14:44:59');
INSERT INTO `log` VALUES ('1318', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 46.287 ms\n', '2020-01-17 14:46:41');
INSERT INTO `log` VALUES ('1319', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 30.317 ms\n', '2020-01-17 14:46:47');
INSERT INTO `log` VALUES ('1320', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 200 38 - 4.159 ms\n', '2020-01-17 14:46:48');
INSERT INTO `log` VALUES ('1321', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 262.867 ms\n', '2020-01-17 14:46:50');
INSERT INTO `log` VALUES ('1322', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 243.443 ms\n', '2020-01-17 14:46:54');
INSERT INTO `log` VALUES ('1323', '::ffff:192.168.42.19 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 16.661 ms\n', '2020-01-17 14:46:54');
INSERT INTO `log` VALUES ('1324', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 23.819 ms\n', '2020-01-17 14:46:56');
INSERT INTO `log` VALUES ('1325', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 59 - 68.268 ms\n', '2020-01-17 14:48:55');
INSERT INTO `log` VALUES ('1326', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 47.488 ms\n', '2020-01-17 14:49:05');
INSERT INTO `log` VALUES ('1327', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 200 38 - 4.137 ms\n', '2020-01-17 14:49:07');
INSERT INTO `log` VALUES ('1328', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 280.954 ms\n', '2020-01-17 14:49:10');
INSERT INTO `log` VALUES ('1329', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 220.461 ms\n', '2020-01-17 14:49:12');
INSERT INTO `log` VALUES ('1330', '::ffff:192.168.42.19 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 19.865 ms\n', '2020-01-17 14:49:12');
INSERT INTO `log` VALUES ('1331', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 227.408 ms\n', '2020-01-17 14:49:12');
INSERT INTO `log` VALUES ('1332', '::ffff:192.168.42.19 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 14.783 ms\n', '2020-01-17 14:49:13');
INSERT INTO `log` VALUES ('1333', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 21.297 ms\n', '2020-01-17 14:49:14');
INSERT INTO `log` VALUES ('1334', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 200 59 - 13.426 ms\n', '2020-01-17 14:50:00');
INSERT INTO `log` VALUES ('1335', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 292.944 ms\n', '2020-01-17 14:50:20');
INSERT INTO `log` VALUES ('1336', '::ffff:192.168.42.19 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 16.286 ms\n', '2020-01-17 14:50:20');
INSERT INTO `log` VALUES ('1337', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 283.758 ms\n', '2020-01-17 14:50:21');
INSERT INTO `log` VALUES ('1338', '::ffff:192.168.42.19 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 18.148 ms\n', '2020-01-17 14:50:21');
INSERT INTO `log` VALUES ('1339', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 14.490 ms\n', '2020-01-17 14:50:25');
INSERT INTO `log` VALUES ('1340', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 65.236 ms\n', '2020-01-17 14:51:02');
INSERT INTO `log` VALUES ('1341', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 200 38 - 3.899 ms\n', '2020-01-17 14:51:05');
INSERT INTO `log` VALUES ('1342', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 279.126 ms\n', '2020-01-17 14:51:08');
INSERT INTO `log` VALUES ('1343', '::ffff:192.168.42.19 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 18.411 ms\n', '2020-01-17 14:51:08');
INSERT INTO `log` VALUES ('1344', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 200 28 - 6.215 ms\n', '2020-01-17 14:51:11');
INSERT INTO `log` VALUES ('1345', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 278.456 ms\n', '2020-01-17 14:51:38');
INSERT INTO `log` VALUES ('1346', '::ffff:192.168.42.19 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 20.884 ms\n', '2020-01-17 14:51:39');
INSERT INTO `log` VALUES ('1347', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 214.675 ms\n', '2020-01-17 14:51:42');
INSERT INTO `log` VALUES ('1348', '::ffff:192.168.42.19 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 10.591 ms\n', '2020-01-17 14:51:42');
INSERT INTO `log` VALUES ('1349', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 43.138 ms\n', '2020-01-17 14:51:51');
INSERT INTO `log` VALUES ('1350', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 248.648 ms\n', '2020-01-17 14:51:54');
INSERT INTO `log` VALUES ('1351', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 309.824 ms\n', '2020-01-17 14:51:57');
INSERT INTO `log` VALUES ('1352', '::ffff:192.168.42.19 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 16.344 ms\n', '2020-01-17 14:51:58');
INSERT INTO `log` VALUES ('1353', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 39.786 ms\n', '2020-01-17 14:52:00');
INSERT INTO `log` VALUES ('1354', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 200 165 - 15.196 ms\n', '2020-01-17 14:52:02');
INSERT INTO `log` VALUES ('1355', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 45.222 ms\n', '2020-01-17 14:54:14');
INSERT INTO `log` VALUES ('1356', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 200 165 - 14.350 ms\n', '2020-01-17 14:54:16');
INSERT INTO `log` VALUES ('1357', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 58.599 ms\n', '2020-01-17 14:58:26');
INSERT INTO `log` VALUES ('1358', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 65.538 ms\n', '2020-01-17 14:58:31');
INSERT INTO `log` VALUES ('1359', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 200 38 - 3.659 ms\n', '2020-01-17 14:58:35');
INSERT INTO `log` VALUES ('1360', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 276.074 ms\n', '2020-01-17 14:58:38');
INSERT INTO `log` VALUES ('1361', '::ffff:192.168.42.19 - POST /wechat/login HTTP/1.1 200 309 - 248.348 ms\n', '2020-01-17 14:58:42');
INSERT INTO `log` VALUES ('1362', '::ffff:192.168.42.19 - POST /wechat/update/userinfo HTTP/1.1 200 300 - 43.795 ms\n', '2020-01-17 14:58:43');
INSERT INTO `log` VALUES ('1363', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 40.311 ms\n', '2020-01-17 14:58:45');
INSERT INTO `log` VALUES ('1364', '::ffff:192.168.42.19 - POST /index/addConcern HTTP/1.1 200 32 - 18.362 ms\n', '2020-01-17 14:58:47');
INSERT INTO `log` VALUES ('1365', '::ffff:192.168.42.129 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 4.203 ms\n', '2020-01-17 14:59:30');
INSERT INTO `log` VALUES ('1366', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=3 HTTP/1.1 200 56 - 3.587 ms\n', '2020-01-17 14:59:51');
INSERT INTO `log` VALUES ('1367', '::ffff:192.168.42.129 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=3 HTTP/1.1 200 56 - 4.937 ms\n', '2020-01-17 14:59:51');
INSERT INTO `log` VALUES ('1368', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 3.776 ms\n', '2020-01-17 14:59:54');
INSERT INTO `log` VALUES ('1369', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 3.594 ms\n', '2020-01-17 14:59:56');
INSERT INTO `log` VALUES ('1370', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 4.770 ms\n', '2020-01-17 14:59:57');
INSERT INTO `log` VALUES ('1371', '::ffff:192.168.42.129 - POST /wechat/login HTTP/1.1 200 56 - 16.493 ms\n', '2020-01-17 14:59:57');
INSERT INTO `log` VALUES ('1372', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 72.675 ms\n', '2020-01-17 15:00:30');
INSERT INTO `log` VALUES ('1373', '::ffff:192.168.42.129 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 9.393 ms\n', '2020-01-17 15:01:21');
INSERT INTO `log` VALUES ('1374', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=3 HTTP/1.1 200 56 - 5.299 ms\n', '2020-01-17 15:01:29');
INSERT INTO `log` VALUES ('1375', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=3 HTTP/1.1 200 56 - 3.994 ms\n', '2020-01-17 15:01:30');
INSERT INTO `log` VALUES ('1376', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=3 HTTP/1.1 200 56 - 3.982 ms\n', '2020-01-17 15:01:30');
INSERT INTO `log` VALUES ('1377', '::ffff:192.168.42.129 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=3 HTTP/1.1 200 56 - 3.594 ms\n', '2020-01-17 15:01:31');
INSERT INTO `log` VALUES ('1378', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=3 HTTP/1.1 200 56 - 4.160 ms\n', '2020-01-17 15:01:36');
INSERT INTO `log` VALUES ('1379', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=3 HTTP/1.1 200 56 - 4.540 ms\n', '2020-01-17 15:01:36');
INSERT INTO `log` VALUES ('1380', '::ffff:192.168.42.129 - GET /index/updateVideoLike?videoLike=true&userId=null&videoId=3 HTTP/1.1 200 56 - 7.191 ms\n', '2020-01-17 15:01:36');
INSERT INTO `log` VALUES ('1381', '::ffff:192.168.42.129 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=3 HTTP/1.1 200 56 - 10.977 ms\n', '2020-01-17 15:01:37');
INSERT INTO `log` VALUES ('1382', '::ffff:192.168.42.129 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 56 - 6.897 ms\n', '2020-01-17 15:04:53');
INSERT INTO `log` VALUES ('1383', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 36.206 ms\n', '2020-01-17 15:06:24');
INSERT INTO `log` VALUES ('1384', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 14.515 ms\n', '2020-01-17 15:06:33');
INSERT INTO `log` VALUES ('1385', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 16.182 ms\n', '2020-01-17 15:09:28');
INSERT INTO `log` VALUES ('1386', '::ffff:192.168.42.19 - GET /index/getvideo?pageNum=1&pageSize=10 HTTP/1.1 200 1240 - 27.754 ms\n', '2020-01-17 15:09:52');
INSERT INTO `log` VALUES ('1387', '::ffff:192.168.42.19 - GET /index/getCommentInfo?pageNum=1&pageSize=8&videoId=1 HTTP/1.1 200 1594 - 35.801 ms\n', '2020-01-17 15:10:57');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '登录', '用户登录', '/login');
INSERT INTO `permission` VALUES ('2', '微信授权登录', '微信授权登录', '/wechat/login');
INSERT INTO `permission` VALUES ('3', '更新用户信息', '更新用户信息', '/wechat/update/userinfo');
INSERT INTO `permission` VALUES ('4', '首页视屏接口', '首页视屏接口', '/index/getvideo');
INSERT INTO `permission` VALUES ('5', '首页评论分页', '首页评论分页', '/index/getCommentInfo');
INSERT INTO `permission` VALUES ('6', '首页评论组分页', '首页评论组分页', '/index/commentgroup/commentInfo');
INSERT INTO `permission` VALUES ('7', '点赞视屏', '点赞视屏', '/index/updateVideoLike');
INSERT INTO `permission` VALUES ('8', '加关注', '加关注', '/index/addConcern');

-- ----------------------------
-- Table structure for `permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('1', '1', '1');
INSERT INTO `permission_role` VALUES ('2', '2', '1');
INSERT INTO `permission_role` VALUES ('3', '3', '1');
INSERT INTO `permission_role` VALUES ('4', '4', '1');
INSERT INTO `permission_role` VALUES ('5', '1', '2');
INSERT INTO `permission_role` VALUES ('6', '2', '2');
INSERT INTO `permission_role` VALUES ('7', '3', '2');
INSERT INTO `permission_role` VALUES ('8', '4', '2');
INSERT INTO `permission_role` VALUES ('9', '1', '3');
INSERT INTO `permission_role` VALUES ('10', '2', '3');
INSERT INTO `permission_role` VALUES ('11', '3', '3');
INSERT INTO `permission_role` VALUES ('12', '1', '4');
INSERT INTO `permission_role` VALUES ('13', '2', '4');
INSERT INTO `permission_role` VALUES ('14', '3', '4');
INSERT INTO `permission_role` VALUES ('15', '4', '4');
INSERT INTO `permission_role` VALUES ('16', '1', '5');
INSERT INTO `permission_role` VALUES ('17', '2', '5');
INSERT INTO `permission_role` VALUES ('18', '3', '5');
INSERT INTO `permission_role` VALUES ('19', '4', '5');
INSERT INTO `permission_role` VALUES ('20', '1', '6');
INSERT INTO `permission_role` VALUES ('21', '2', '6');
INSERT INTO `permission_role` VALUES ('22', '3', '6');
INSERT INTO `permission_role` VALUES ('23', '4', '6');
INSERT INTO `permission_role` VALUES ('24', '1', '7');
INSERT INTO `permission_role` VALUES ('25', '2', '7');
INSERT INTO `permission_role` VALUES ('26', '3', '7');
INSERT INTO `permission_role` VALUES ('27', '4', '7');
INSERT INTO `permission_role` VALUES ('28', '1', '8');
INSERT INTO `permission_role` VALUES ('29', '2', '8');
INSERT INTO `permission_role` VALUES ('30', '3', '8');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '1');
INSERT INTO `role` VALUES ('2', '管理员', '1');
INSERT INTO `role` VALUES ('3', '用户', '1');
INSERT INTO `role` VALUES ('4', '游客', '1');

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', 'root', 'root', '1');
INSERT INTO `test` VALUES ('2', 'admin', 'admin', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(250) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(2) NOT NULL DEFAULT '1',
  `role_id` bigint(20) DEFAULT '3',
  `openid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` int(2) DEFAULT NULL,
  `avatar_url` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `my_id` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root', 'root', '18674801565', '1', '3', 'oyvfl5SSpqki2Su-PHRH6UUYxBBd', 'ABCDE2', null, 'https://app.wlkqzs.com/QQ%E6%88%AA%E5%9B%BE20191207100857.png', 'ABCDEF', null);
INSERT INTO `user` VALUES ('2', 'ABCD', null, 'null', '1', '3', 'oyvfl5SSpqki2Su-PHRH6UUYxBMr', 'ABCDEF', null, 'https://wx.qlogo.cn/mmopen/vi_32/OCicJC9EunhWxW9tGyt9UibSu8W0HJiadsn0qXoQdHKvbqwQZ3IOTFmBj00AQJSORiazVF2vzicKOPOxmfUH2gouCXg/132', 'ABCDE3', '3');
INSERT INTO `user` VALUES ('3', 'ABCDEF', null, 'null', '1', '3', 'oyvfl5SSpqki2Su-PHRH6UUYxBMg', 'ABCDE3', '0', 'https://wx.qlogo.cn/mmopen/vi_32/OCicJC9EunhWxW9tGyt9UibSu8W0HJiadsn0qXoQdHKvbqwQZ3IOTFmBj00AQJSORiazVF2vzicKOPOxmfUH2gouCXg/132', '16f934cf67156', null);
INSERT INTO `user` VALUES ('4', 'nasdn', 'ROOT', null, '1', '3', 'oyvfl5SSpqki2Su-PHRH6UUYxBM2', 'ASDASD', null, 'https://app.wlkqzs.com/15.jpg', 'sdasdasd', null);

-- ----------------------------
-- Table structure for `video`
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `src` varchar(3000) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `like` bigint(20) NOT NULL DEFAULT '0',
  `user_id` bigint(20) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `check` int(11) DEFAULT '0',
  `objectFit` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'contain',
  `state` int(2) DEFAULT '1',
  `flag` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1', 'https://dcloud-img.oss-cn-hangzhou.aliyuncs.com/guide/uniapp/%E7%AC%AC1%E8%AE%B2%EF%BC%88uni-app%E4%BA%A7%E5%93%81%E4%BB%8B%E7%BB%8D%EF%BC%89-%20DCloud%E5%AE%98%E6%96%B9%E8%A7%86%E9%A2%91%E6%95%99%E7%A8%8B@20181126.mp4', '为什么要选择uni-app？', '23', '1', '841', '1', 'contain', '1', '0');
INSERT INTO `video` VALUES ('2', 'http://baobab.kaiyanapp.com/api/v1/playUrl?vid=129764&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss', '广告有反转：危机感十足！一辆车都比你靠谱', '77', '1', '149', '0', 'contain', '1', '0');
INSERT INTO `video` VALUES ('3', 'http://baobab.kaiyanapp.com/api/v1/playUrl?vid=164016&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss', '无辣不欢，你没见过小龙虾的大场面', '23', '1', '1162', '1', 'contain', '1', '0');

-- ----------------------------
-- Table structure for `video_like`
-- ----------------------------
DROP TABLE IF EXISTS `video_like`;
CREATE TABLE `video_like` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `video_id` bigint(20) NOT NULL,
  `video_like` int(4) DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of video_like
-- ----------------------------
INSERT INTO `video_like` VALUES ('3', '3', '1', '0', '2020-01-04 00:00:00', null, '1');
INSERT INTO `video_like` VALUES ('4', '3', '2', '1', '2020-01-04 00:00:00', null, '1');
INSERT INTO `video_like` VALUES ('5', '3', '3', '0', '2020-01-04 00:00:00', null, '1');
