/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : myvideo

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2015-11-17 17:52:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ad`
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adimage` varchar(255) DEFAULT NULL,
  `adzhi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES ('1', 'dianying/20120830055950193.jpg', '11');
INSERT INTO `ad` VALUES ('2', 'dianying/20120830055950193.jpg', '22');
INSERT INTO `ad` VALUES ('3', 'dianying/20120830055950193.jpg', '33');
INSERT INTO `ad` VALUES ('4', 'dianying/20120830055950193.jpg', '44');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'lin', '123456', '1', '18094041592', '942158740@qq.com');

-- ----------------------------
-- Table structure for `area`
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `areaId` int(11) NOT NULL AUTO_INCREMENT,
  `areaName` varchar(255) NOT NULL,
  PRIMARY KEY (`areaId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', '内陆2');
INSERT INTO `area` VALUES ('2', '台湾');
INSERT INTO `area` VALUES ('3', '香港');
INSERT INTO `area` VALUES ('4', '日本');
INSERT INTO `area` VALUES ('5', '欧美');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comId` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `comSubtance` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `couId` int(11) DEFAULT NULL,
  `isdianzan` int(11) DEFAULT NULL,
  PRIMARY KEY (`comId`),
  KEY `FK38A5EE5F7D288A16` (`uid`),
  KEY `FK38A5EE5F972D00F` (`couId`),
  KEY `FK38A5EE5F972B207` (`comId`),
  CONSTRAINT `FK38A5EE5F7D288A16` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK38A5EE5F972B207` FOREIGN KEY (`couId`) REFERENCES `videocount` (`couId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '2015-11-16 16:29:41', '好看看', '1', '19', '1');
INSERT INTO `comment` VALUES ('13', '2015-11-13 10:50:16', '确实不好', '2', '19', '1');
INSERT INTO `comment` VALUES ('28', '2015-11-14 00:04:16', 'sb', '3', '19', null);
INSERT INTO `comment` VALUES ('29', '2015-11-14 00:05:00', 'heheheh', '3', '5', null);
INSERT INTO `comment` VALUES ('30', '2015-11-14 00:05:01', 'heheheh', '3', '5', null);
INSERT INTO `comment` VALUES ('31', '2015-11-14 00:16:03', null, '3', '19', '1');
INSERT INTO `comment` VALUES ('32', '2015-11-14 12:49:30', '提交评论', '1', '19', null);
INSERT INTO `comment` VALUES ('33', '2015-11-14 12:49:44', '不局的', '1', '19', null);

-- ----------------------------
-- Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `graId` int(11) NOT NULL AUTO_INCREMENT,
  `vidId` int(11) DEFAULT NULL,
  `graCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`graId`),
  KEY `FK5E0BFD7C4337C62` (`vidId`),
  CONSTRAINT `FK5E0BFD7C4337C62` FOREIGN KEY (`vidId`) REFERENCES `videoinfo` (`vidId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '1', '10');
INSERT INTO `grade` VALUES ('2', '2', '9');
INSERT INTO `grade` VALUES ('3', '3', '8');
INSERT INTO `grade` VALUES ('4', '4', '7');
INSERT INTO `grade` VALUES ('5', '5', '6');
INSERT INTO `grade` VALUES ('6', '4', '5');
INSERT INTO `grade` VALUES ('7', '3', '4');
INSERT INTO `grade` VALUES ('8', '2', '3');
INSERT INTO `grade` VALUES ('9', '1', '2');
INSERT INTO `grade` VALUES ('10', null, '1');

-- ----------------------------
-- Table structure for `maxtype`
-- ----------------------------
DROP TABLE IF EXISTS `maxtype`;
CREATE TABLE `maxtype` (
  `maxId` int(11) NOT NULL AUTO_INCREMENT,
  `maxName` varchar(255) NOT NULL,
  PRIMARY KEY (`maxId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maxtype
-- ----------------------------
INSERT INTO `maxtype` VALUES ('1', '电影1');
INSERT INTO `maxtype` VALUES ('2', '电视剧');
INSERT INTO `maxtype` VALUES ('3', '综艺节目');
INSERT INTO `maxtype` VALUES ('4', '动漫');
INSERT INTO `maxtype` VALUES ('5', '游戏');

-- ----------------------------
-- Table structure for `mintype`
-- ----------------------------
DROP TABLE IF EXISTS `mintype`;
CREATE TABLE `mintype` (
  `minId` int(11) NOT NULL AUTO_INCREMENT,
  `minName` varchar(255) NOT NULL,
  PRIMARY KEY (`minId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mintype
-- ----------------------------
INSERT INTO `mintype` VALUES ('1', '动作类');
INSERT INTO `mintype` VALUES ('2', '科幻类');
INSERT INTO `mintype` VALUES ('3', '爱情');
INSERT INTO `mintype` VALUES ('4', '喜剧');
INSERT INTO `mintype` VALUES ('5', '科幻');
INSERT INTO `mintype` VALUES ('6', '恐怖');
INSERT INTO `mintype` VALUES ('7', '搞笑');

-- ----------------------------
-- Table structure for `switchimage`
-- ----------------------------
DROP TABLE IF EXISTS `switchimage`;
CREATE TABLE `switchimage` (
  `sId` int(11) NOT NULL AUTO_INCREMENT,
  `sAddr` varchar(255) DEFAULT NULL,
  `stype` varchar(255) DEFAULT NULL,
  `vidName` varchar(255) DEFAULT NULL,
  `sText` varchar(255) DEFAULT NULL,
  `sUrl` varchar(255) DEFAULT NULL,
  `couId` int(11) DEFAULT NULL,
  PRIMARY KEY (`sId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of switchimage
-- ----------------------------
INSERT INTO `switchimage` VALUES ('1', 'switchimage/1.jpg', '电影', '蜘蛛侠1', '蜘蛛侠好好看、赶快下载！11', '', '1');
INSERT INTO `switchimage` VALUES ('2', 'switchimage/2.jpg', '电影', '蜘蛛侠2', '蜘蛛侠好好看、赶快下载！22', '', '2');
INSERT INTO `switchimage` VALUES ('3', 'switchimage/3.jpg', '电影', '蜘蛛侠3', '蜘蛛侠好好看、赶快下载！33', '', '3');
INSERT INTO `switchimage` VALUES ('4', 'switchimage/4.jpg', '电影', '蜘蛛侠4', '蜘蛛侠好好看、赶快下载！44', '', '4');
INSERT INTO `switchimage` VALUES ('5', 'switchimage/5.jpg', '电影', '蜘蛛侠5', '蜘蛛侠好好看、赶快下载！55', '', '5');
INSERT INTO `switchimage` VALUES ('6', 'switchimage/6.jpg', '电影', '蜘蛛侠6', '蜘蛛侠好好看、赶快下载！66', '', '6');
INSERT INTO `switchimage` VALUES ('7', 'switchimage/7.jpg', '电影', '蜘蛛侠7', '蜘蛛侠好好看、赶快下载！77', '', '7');
INSERT INTO `switchimage` VALUES ('8', 'switchimage/8.jpg', '电影', '蜘蛛侠8', '蜘蛛侠好好看、赶快下88', '', '8');
INSERT INTO `switchimage` VALUES ('9', 'switchimage/9.jpg', '电影', '蜘蛛侠9', '蜘蛛侠好好看、赶快下载！99', '', '9');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uName` varchar(255) DEFAULT NULL,
  `uPassword` varchar(255) DEFAULT NULL,
  `uNickName` varchar(255) DEFAULT NULL,
  `uSex` varchar(255) DEFAULT NULL,
  `uMail` varchar(255) DEFAULT NULL,
  `uBirthday` datetime DEFAULT NULL,
  `uQue` varchar(255) DEFAULT NULL,
  `uAns` varchar(255) DEFAULT NULL,
  `uAccumulate` int(11) NOT NULL,
  `uLive` int(11) NOT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '5hh', '1', '1', '1', '1@qq.com', '2015-11-09 19:42:40', '1', '1', '1', '1', '1', null);
INSERT INTO `user` VALUES ('2', '222dd', '2', '2', '2', '2@qq.com', '2015-11-16 19:45:16', '2', '2', '2', '2', '1', null);
INSERT INTO `user` VALUES ('3', '黄也得', '3', '3', '3', '3@qq.com', '2015-11-02 16:12:05', null, null, '3', '2', '1', null);

-- ----------------------------
-- Table structure for `userupload`
-- ----------------------------
DROP TABLE IF EXISTS `userupload`;
CREATE TABLE `userupload` (
  `uId` int(11) NOT NULL AUTO_INCREMENT,
  `comId` int(11) DEFAULT NULL,
  `uName` varchar(255) DEFAULT NULL,
  `uDuration` varchar(255) DEFAULT NULL,
  `uInfo` varchar(255) DEFAULT NULL,
  `uClick` varchar(255) DEFAULT NULL,
  `uURL` varchar(255) DEFAULT NULL,
  `uUpload` datetime DEFAULT NULL,
  `uImage` varchar(255) DEFAULT NULL,
  `uStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`uId`),
  KEY `FK98AFB58CD3CEDF12` (`comId`),
  CONSTRAINT `FK98AFB58CD3CEDF12` FOREIGN KEY (`comId`) REFERENCES `comment` (`comId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userupload
-- ----------------------------

-- ----------------------------
-- Table structure for `videocount`
-- ----------------------------
DROP TABLE IF EXISTS `videocount`;
CREATE TABLE `videocount` (
  `couId` int(11) NOT NULL AUTO_INCREMENT,
  `vidId` int(11) DEFAULT NULL,
  `couCount` int(11) DEFAULT NULL,
  `couClick` int(11) DEFAULT NULL,
  `couURL` varchar(255) DEFAULT NULL,
  `couDuration` varchar(255) DEFAULT NULL,
  `couUpload` datetime DEFAULT NULL,
  PRIMARY KEY (`couId`),
  KEY `FK9FC7D174C4337C62` (`vidId`),
  CONSTRAINT `FK9FC7D174C4337C62` FOREIGN KEY (`vidId`) REFERENCES `videoinfo` (`vidId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videocount
-- ----------------------------
INSERT INTO `videocount` VALUES ('1', '1', '1', '1', 'dianying/bd.mp4', '1', '2015-11-04 21:48:22');
INSERT INTO `videocount` VALUES ('2', '2', '1', '2', 'dianying/bd2.mp4', '1', '2015-11-10 21:50:57');
INSERT INTO `videocount` VALUES ('3', '3', '1', '3', 'dianying/bd.mp4', '1', '2015-11-16 21:51:16');
INSERT INTO `videocount` VALUES ('4', '4', '1', '4', 'dianying/bd2.mp4', '1', '2015-11-03 21:51:41');
INSERT INTO `videocount` VALUES ('5', '5', '1', '5', 'dianying/bd.mp4', '1', '2015-11-05 21:52:03');
INSERT INTO `videocount` VALUES ('6', '6', '1', '6', 'dianying/bd2.mp4', '1', '2015-11-02 21:52:16');
INSERT INTO `videocount` VALUES ('7', '7', '1', '7', 'dianying/bd.mp4', '1', '2015-11-04 21:52:33');
INSERT INTO `videocount` VALUES ('8', '8', '1', '8', 'dianying/bd2.mp4', '1', '2015-11-15 21:52:45');
INSERT INTO `videocount` VALUES ('9', '10', '1', '10', 'dianying/bd.mp4', '1', '2015-11-17 21:53:26');
INSERT INTO `videocount` VALUES ('11', '11', '1', '11', 'dianying/bd2.mp4', '1', '2015-11-16 21:54:59');
INSERT INTO `videocount` VALUES ('12', '11', '2', '12', 'dianying/bd.mp4', '1', '2015-11-10 21:55:22');
INSERT INTO `videocount` VALUES ('13', '11', '3', '13', 'dianying/bd2.mp4', '1', '2015-11-09 21:55:58');
INSERT INTO `videocount` VALUES ('14', '11', '4', '14', 'dianying/bd2.mp4', '1', '2015-11-10 21:56:15');
INSERT INTO `videocount` VALUES ('15', '11', '5', '13', 'dianying/bd.mp4', '1', '2015-11-18 15:12:45');
INSERT INTO `videocount` VALUES ('16', '11', '6', '12', 'dianying/bd2.mp4', '1', '2015-11-11 15:13:07');
INSERT INTO `videocount` VALUES ('17', '11', '7', '16', 'dianying/bd.mp4', '1', '2015-11-18 15:13:43');
INSERT INTO `videocount` VALUES ('18', '11', '8', '122', 'dianying/bd2.mp4', '1', '2015-11-10 15:14:06');
INSERT INTO `videocount` VALUES ('19', '9', '1', '9', 'dianying/bd2.mp4', '1', '2015-11-16 21:53:08');

-- ----------------------------
-- Table structure for `videoinfo`
-- ----------------------------
DROP TABLE IF EXISTS `videoinfo`;
CREATE TABLE `videoinfo` (
  `vidId` int(11) NOT NULL AUTO_INCREMENT,
  `vidMin` int(11) DEFAULT NULL,
  `vidMax` int(11) DEFAULT NULL,
  `vidArea` int(11) DEFAULT NULL,
  `vidName` varchar(255) DEFAULT NULL,
  `vidDirector` varchar(255) DEFAULT NULL,
  `vidStar` varchar(255) DEFAULT NULL,
  `vidjianjie` varchar(255) DEFAULT NULL,
  `vidYear` varchar(255) DEFAULT NULL,
  `vidInfo` longtext,
  `vidImage` varchar(150) DEFAULT NULL,
  `vidState` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vidId`),
  KEY `FK4F7CC3A980D95E89` (`vidMax`),
  KEY `FK4F7CC3A9C824A468` (`vidArea`),
  KEY `FK4F7CC3A9E66885B7` (`vidMin`),
  CONSTRAINT `FK4F7CC3A980D95E89` FOREIGN KEY (`vidMax`) REFERENCES `maxtype` (`maxId`),
  CONSTRAINT `FK4F7CC3A9C824A468` FOREIGN KEY (`vidArea`) REFERENCES `area` (`areaId`),
  CONSTRAINT `FK4F7CC3A9E66885B7` FOREIGN KEY (`vidMin`) REFERENCES `mintype` (`minId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videoinfo
-- ----------------------------
INSERT INTO `videoinfo` VALUES ('1', '6', '1', '1', '笔仙', '安兵基', '梅婷 / 郭京飞 / 吴超', '好好看', '2012', '略...', 'dianying/20120830055950193.jpg', '1');
INSERT INTO `videoinfo` VALUES ('2', '1', '1', '1', '搞定蜘蛛侠', '马克·韦布', '安德鲁·加菲尔德', '超凡蜘蛛侠', '2012', '超凡蜘蛛侠超凡蜘蛛侠超凡蜘蛛侠超凡蜘蛛侠超凡蜘蛛侠超凡蜘蛛侠', 'dianying/20120830055950193.jpg', '1');
INSERT INTO `videoinfo` VALUES ('3', '2', '1', '2', '搞定岳父大人', '李海蜀', '徐峥 / 许绍雄 / 林鹏', '搞定岳父大人', '2012', '搞定岳父大人搞定岳父大人搞定岳父大人搞定岳父大人', 'dianying/20120830055950193.jpg', '1');
INSERT INTO `videoinfo` VALUES ('4', '3', '1', '3', '宝马狂想曲', '李麒麟', '陈小春 / 戎祥 / 熊乃瑾', '宝马狂想曲宝马狂想曲宝马狂想曲', '2010', '宝马狂想曲宝马狂想曲宝马狂想曲', 'dianying/20120830055950193.jpg', '1');
INSERT INTO `videoinfo` VALUES ('5', '2', '1', '4', '搞定画皮2', '乌尔善', '周迅 / 赵薇 / 陈坤', '周迅 / 赵薇 / 陈坤', '2014', '周迅 / 赵薇 / 陈坤', 'dianying/20120830055950193.jpg', '1');
INSERT INTO `videoinfo` VALUES ('6', '3', '1', '5', '青春期3', '青春期3', '青春期3', '青春期3', '2014', '青春期3', 'dianying/20120830055950193.jpg', '1');
INSERT INTO `videoinfo` VALUES ('7', '6', '1', '4', '四大名捕', '四大名捕', '四大名捕', '四大名捕', '四大名捕', '四大名捕', 'dianying/20120830055950193.jpg', '1');
INSERT INTO `videoinfo` VALUES ('8', '2', '1', '5', '食人鱼搞定3DD', '食人鱼3DD', '食人鱼3DD', '食人鱼3DD', '食人鱼3DD', '食人鱼3DD', 'dianying/20120830055950193.jpg', '1');
INSERT INTO `videoinfo` VALUES ('9', '3', '1', '4', '甲午大海战', '甲午大海战', '甲午大海战', '甲午大海战', '甲午大海战', '甲午大海战', 'dianying/20120830055950193.jpg', '1');
INSERT INTO `videoinfo` VALUES ('10', '2', '1', '5', '邻家女优', '邻家女优', '邻家女优', '邻家女优', '邻家女优', '邻家女优', 'dianying/20120830055950193.jpg', '1');
INSERT INTO `videoinfo` VALUES ('11', '1', '2', '4', '轩辕剑', '轩辕剑', '轩辕剑', '轩辕剑', '轩辕剑', '轩辕剑', '2222', '3');
