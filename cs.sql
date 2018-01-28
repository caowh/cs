/*
Navicat MySQL Data Transfer

Source Server         : 11
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : cs

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-28 19:39:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `classes` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '0  正常\r\n1  挂失\r\n2  毕业离校\r\n',
  `admin` int(11) NOT NULL COMMENT '0    管理员\r\n1    学生',
  `enrollment_time` datetime DEFAULT NULL,
  `graduation_time` datetime DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'test', 'test', '男', null, null, '0', '0', null, null, null);
INSERT INTO `user` VALUES ('2', 'test', 'test', '男', null, null, '0', '0', null, null, null);
