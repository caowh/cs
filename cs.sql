/*
Navicat MySQL Data Transfer

Source Server         : tt
Source Server Version : 50521
Source Host           : 192.168.4.173:3306
Source Database       : cs

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2018-02-01 18:15:19
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
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS `User`;
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
  `identify` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9l5en6oc0n83mdf145gralf06` (`identify`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of User
-- ----------------------------
INSERT INTO `User` VALUES ('1', '小三', 'test', '男', null, null, '0', '1', null, null, null, '611111199601111111');
INSERT INTO `User` VALUES ('2', '小四', 'test', '男', null, null, '0', '2', null, null, null, '611111199601112222');
INSERT INTO `User` VALUES ('3', '超级管理员', 'admin', '男', null, null, '0', '0', null, null, null, '611111199601113333');
