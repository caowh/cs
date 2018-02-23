/*
MySQL Data Transfer
Source Host: localhost
Source Database: cs
Target Host: localhost
Target Database: cs
Date: 2018/2/23 ������ 14:18:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for borrowcurrent
-- ----------------------------
DROP TABLE IF EXISTS `borrowcurrent`;
CREATE TABLE `borrowcurrent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `br_date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for borrowhistory
-- ----------------------------
DROP TABLE IF EXISTS `borrowhistory`;
CREATE TABLE `borrowhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `back_date` datetime DEFAULT NULL,
  `book_id` int(11) NOT NULL,
  `borrow_date` datetime DEFAULT NULL,
  `cost` decimal(19,2) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

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
  `identify` varchar(255) DEFAULT NULL,
  `money` decimal(19,2) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9l5en6oc0n83mdf145gralf06` (`identify`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000006 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `books` VALUES ('1', '《西游记》是中国古代第一部浪漫主义章回体长篇神魔小说。现存明刊百回本《西游记》均无作者署名。清代学者吴玉搢等首先提出《西游记》作者是明代吴承恩[1]  。这部小说以“唐僧取经”这一历史事件为蓝本，通过作者的艺术加工，深刻地描绘了当时的社会现实。全书主要描写了孙悟空出世及大闹天宫后，遇见了唐僧、猪八戒和沙僧三人，西行取经，一路降妖伏魔，经历了九九八十一难，终于到达西天见到如来佛祖，最终五圣成真的故事。', '西游记');
INSERT INTO `books` VALUES ('2', '《红楼梦》，中国古典四大名著之首，清代作家曹雪芹创作的章回体长篇小说[1]  ，又名《石头记》《金玉缘》。此书分为120回“程本”和80回“脂本”两种版本系统。', '红楼梦');
INSERT INTO `books` VALUES ('3', '《三国演义》是中国古典四大名著之一，是中国第一部长篇章回体历史演义小说，全名为《三国志通俗演义》（又称《三国志演义》），作者是元末明初的著名小说家罗贯中。《三国志通俗演义》成书后有嘉靖壬午本等多个版本传于世，到了明末清初，毛宗岗对《三国演义》整顿回目、修正文辞、改换诗文。', '三国演义');
INSERT INTO `books` VALUES ('4', '《水浒传》，是中国四大名著之一，是一部描写宋江起义的长篇小说。明朝万历二十二年（1594）福建建阳余象斗双峰堂刊本《京本增补校正全像忠义水浒志传评林》[1]  题罗贯中编集，明万历四十二年（1614）袁无涯刊《忠义水浒全传》一百二十回本署名是“施耐庵集撰、罗贯中纂修”，与之相近的还有明万历三十年（1602）前后容与堂刻本《水浒传》署名是“施耐庵撰，罗贯中纂修”。', '水浒传');
INSERT INTO `borrowcurrent` VALUES ('4', '4', '2018-02-22 21:07:44', '1000000001');
INSERT INTO `borrowcurrent` VALUES ('13', '3', '2018-02-17 00:25:45', '1000000001');
INSERT INTO `borrowhistory` VALUES ('1', '2018-02-22 23:45:54', '1', '2018-02-22 21:07:44', '0.00', '1000000001');
INSERT INTO `borrowhistory` VALUES ('2', '2018-02-23 00:03:00', '2', '2017-12-01 21:07:44', '77.00', '1000000001');
INSERT INTO `borrowhistory` VALUES ('3', '2018-02-23 00:08:42', '3', '2018-02-22 21:07:44', '0.00', '1000000001');
INSERT INTO `borrowhistory` VALUES ('4', '2018-02-23 14:09:43', '1', '2018-02-23 14:09:27', '0.00', '1000000001');
INSERT INTO `borrowhistory` VALUES ('5', '2018-02-23 14:11:48', '1', '2018-02-08 22:50:03', '8.00', '1000000001');
INSERT INTO `food` VALUES ('小炒肉', '1', '15.50', '辣的爽到爆！', '97', '2');
INSERT INTO `food` VALUES ('酸辣土豆丝', '2', '9.99', '好吃的很！', '96', '2');
INSERT INTO `food` VALUES ('油泼面', '3', '9.90', '爱吃不吃!', '97', '2');
INSERT INTO `food` VALUES ('泡馍', '4', '22.00', '土豪请随意！', '87', '3');
INSERT INTO `orderfood` VALUES ('1', '2', '2', '25');
INSERT INTO `orderfood` VALUES ('2', '3', '1', '25');
INSERT INTO `orderfood` VALUES ('3', '4', '1', '26');
INSERT INTO `orderfood` VALUES ('4', '1', '1', '26');
INSERT INTO `orderfood` VALUES ('5', '1', '1', '27');
INSERT INTO `orderfood` VALUES ('6', '2', '1', '27');
INSERT INTO `orderfood` VALUES ('7', '4', '1', '27');
INSERT INTO `orderfood` VALUES ('8', '3', '1', '27');
INSERT INTO `orderfood` VALUES ('9', '4', '10', '29');
INSERT INTO `rechargerecord` VALUES ('11', '0.00', '50.00', '2018-02-08 16:15:11', '支付宝', '1000000001');
INSERT INTO `rechargerecord` VALUES ('12', '50.00', '100.00', '2018-02-08 16:15:22', '支付宝', '1000000001');
INSERT INTO `rechargerecord` VALUES ('13', '100.00', '400.00', '2018-02-08 16:15:40', '微信', '1000000001');
INSERT INTO `rechargerecord` VALUES ('14', '400.00', '500.00', '2018-02-08 16:28:39', '银行卡', '1000000001');
INSERT INTO `rechargerecord` VALUES ('15', '0.00', '50.00', '2018-02-08 16:29:45', '支付宝', '1000000002');
INSERT INTO `rechargerecord` VALUES ('25', '500.00', '470.12', '2018-02-09 14:31:46', '订餐', '1000000001');
INSERT INTO `rechargerecord` VALUES ('26', '470.12', '432.62', '2018-02-09 14:39:14', '订餐', '1000000001');
INSERT INTO `rechargerecord` VALUES ('27', '432.62', '375.23', '2018-02-09 14:41:02', '订餐', '1000000001');
INSERT INTO `rechargerecord` VALUES ('28', '375.23', '425.23', '2018-02-22 15:16:42', '支付宝', '1000000001');
INSERT INTO `rechargerecord` VALUES ('29', '425.23', '205.23', '2018-02-23 00:01:32', '订餐', '1000000001');
INSERT INTO `rechargerecord` VALUES ('30', '205.23', '128.23', '2018-02-23 00:03:00', '借书', '1000000001');
INSERT INTO `rechargerecord` VALUES ('31', '128.23', '120.23', '2018-02-23 14:11:48', '借书', '1000000001');
INSERT INTO `user` VALUES ('1000000000', '超级管理员', '1', '男', null, null, '1', '3', null, null, null, '611111199601113333', null, '0');
INSERT INTO `user` VALUES ('1000000001', '学生A', '1', '男', '计算机一班', '大一', '1', '2', '2018-02-07 00:00:00', '2018-02-07 00:00:00', '2018-02-07 00:00:00', '611111111111666661', '120.23', '7');
INSERT INTO `user` VALUES ('1000000002', '学生B', '1', '男', '计算机一班', '大二', '1', '2', '2018-02-07 00:00:00', '2018-02-07 00:00:00', '2018-02-07 00:00:00', '611111111111666662', '50.00', '2');
INSERT INTO `user` VALUES ('1000000004', '管理员A', '1', '女', null, null, '1', '1', null, null, '2018-02-07 00:00:00', '611111199601111111', null, '0');
INSERT INTO `user` VALUES ('1000000005', '管理员B', '1', '男', null, null, '1', '1', null, null, '2018-02-07 13:42:17', '611111199601112222', null, '0');
