/*
Navicat MySQL Data Transfer

Source Server         : tt
Source Server Version : 50521
Source Host           : 192.168.4.173:3306
Source Database       : cs

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2018-02-10 09:43:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `name` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `leftCount` int(11) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('小炒肉', '1', '15.50', '辣的爽到爆！', '97', '2');
INSERT INTO `food` VALUES ('酸辣土豆丝', '2', '9.99', '好吃的很！', '96', '2');
INSERT INTO `food` VALUES ('油泼面', '3', '9.90', '爱吃不吃!', '97', '2');
INSERT INTO `food` VALUES ('泡馍', '4', '22.00', '土豪请随意！', '97', '2');

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
-- Table structure for orderfood
-- ----------------------------
DROP TABLE IF EXISTS `orderfood`;
CREATE TABLE `orderfood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_id` int(11) DEFAULT NULL,
  `food_number` int(11) DEFAULT NULL,
  `rr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderfood
-- ----------------------------
INSERT INTO `orderfood` VALUES ('1', '2', '2', '25');
INSERT INTO `orderfood` VALUES ('2', '3', '1', '25');
INSERT INTO `orderfood` VALUES ('3', '4', '1', '26');
INSERT INTO `orderfood` VALUES ('4', '1', '1', '26');
INSERT INTO `orderfood` VALUES ('5', '1', '1', '27');
INSERT INTO `orderfood` VALUES ('6', '2', '1', '27');
INSERT INTO `orderfood` VALUES ('7', '4', '1', '27');
INSERT INTO `orderfood` VALUES ('8', '3', '1', '27');

-- ----------------------------
-- Table structure for rechargerecord
-- ----------------------------
DROP TABLE IF EXISTS `rechargerecord`;
CREATE TABLE `rechargerecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `before_money` decimal(19,2) DEFAULT NULL,
  `end_money` decimal(19,2) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`user_id`),
  CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rechargerecord
-- ----------------------------
INSERT INTO `rechargerecord` VALUES ('11', '0.00', '50.00', '2018-02-08 16:15:11', '支付宝', '1000000001');
INSERT INTO `rechargerecord` VALUES ('12', '50.00', '100.00', '2018-02-08 16:15:22', '支付宝', '1000000001');
INSERT INTO `rechargerecord` VALUES ('13', '100.00', '400.00', '2018-02-08 16:15:40', '微信', '1000000001');
INSERT INTO `rechargerecord` VALUES ('14', '400.00', '500.00', '2018-02-08 16:28:39', '银行卡', '1000000001');
INSERT INTO `rechargerecord` VALUES ('15', '0.00', '50.00', '2018-02-08 16:29:45', '支付宝', '1000000002');
INSERT INTO `rechargerecord` VALUES ('25', '500.00', '470.12', '2018-02-09 14:31:46', '订餐', '1000000001');
INSERT INTO `rechargerecord` VALUES ('26', '470.12', '432.62', '2018-02-09 14:39:14', '订餐', '1000000001');
INSERT INTO `rechargerecord` VALUES ('27', '432.62', '375.23', '2018-02-09 14:41:02', '订餐', '1000000001');

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
  `money` decimal(19,2) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9l5en6oc0n83mdf145gralf06` (`identify`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of User
-- ----------------------------
INSERT INTO `User` VALUES ('1000000000', '超级管理员', '1', '男', null, null, '1', '3', null, null, null, '611111199601113333', null, '0');
INSERT INTO `User` VALUES ('1000000001', '学生A', '1', '男', '计算机一班', '大一', '1', '2', '2018-02-07 00:00:00', '2018-02-07 00:00:00', '2018-02-07 00:00:00', '611111111111666661', '375.23', '3');
INSERT INTO `User` VALUES ('1000000002', '学生B', '1', '男', '计算机一班', '大二', '1', '2', '2018-02-07 00:00:00', '2018-02-07 00:00:00', '2018-02-07 00:00:00', '611111111111666662', '50.00', '2');
INSERT INTO `User` VALUES ('1000000004', '管理员A', '1', '女', null, null, '1', '1', null, null, '2018-02-07 00:00:00', '611111199601111111', null, '0');
INSERT INTO `User` VALUES ('1000000005', '管理员B', '1', '男', null, null, '1', '1', null, null, '2018-02-07 13:42:17', '611111199601112222', null, '0');
