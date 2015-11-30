/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50140
Source Host           : localhost:3306
Source Database       : myvideo

Target Server Type    : MYSQL
Target Server Version : 50140
File Encoding         : 65001

Date: 2015-11-25 13:51:20
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
INSERT INTO `ad` VALUES ('1', 'uploadimage/20120903011853260.gif', 'www.hao123.com');
INSERT INTO `ad` VALUES ('2', 'uploadimage/20120903011911122.gif', 'www.baidu.com');
INSERT INTO `ad` VALUES ('3', 'uploadimage/20120903011920618.gif', 'www.baidu.com');
INSERT INTO `ad` VALUES ('4', 'uploadimage/20120903011853260.gif', 'www.baidu.com');

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
INSERT INTO `admin` VALUES ('1', 'lin', '1', '1', '18094041592', '942158740@qq.com');

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
INSERT INTO `area` VALUES ('1', '内陆');
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
  `uld` int(11) DEFAULT NULL,
  PRIMARY KEY (`comId`),
  KEY `FK38A5EE5F7D288A16` (`uid`),
  KEY `FK38A5EE5F972D00F` (`couId`),
  KEY `FK38A5EE5F972B207` (`comId`),
  KEY `uld` (`uld`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`uld`) REFERENCES `userupload` (`uld`),
  CONSTRAINT `FK38A5EE5F7D288A16` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK38A5EE5F972B207` FOREIGN KEY (`couId`) REFERENCES `videocount` (`couId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

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
INSERT INTO `maxtype` VALUES ('1', '电影');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for `userupload`
-- ----------------------------
DROP TABLE IF EXISTS `userupload`;
CREATE TABLE `userupload` (
  `uld` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `click` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `upload` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`uld`),
  KEY `FK98AFB58CD3CEDF12` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videocount
-- ----------------------------
INSERT INTO `videocount` VALUES ('1', '1', '1', '0', 'uploadvideo/[T-ara]Good.Bye_bd.mp4', '120', '2015-11-04 21:48:22');
INSERT INTO `videocount` VALUES ('2', '2', '1', '0', 'uploadvideo/17suiqinge_bd.mp4', '120', '2015-11-10 21:50:57');
INSERT INTO `videocount` VALUES ('3', '3', '1', '0', 'uploadvideo/qingchukuaile.mp4', '120', '2015-11-16 21:51:16');
INSERT INTO `videocount` VALUES ('4', '4', '1', '1', 'uploadvideo/tiantangmoguai_bd.mp4', '120', '2015-11-03 21:51:41');
INSERT INTO `videocount` VALUES ('5', '5', '1', '0', 'uploadvideo/zaijian_bd.mp4', '120', '2015-11-05 21:52:03');
INSERT INTO `videocount` VALUES ('6', '6', '1', '0', 'uploadvideo/zhingjijiaoshi13_hd.mp4', '120', '2015-11-02 21:52:16');
INSERT INTO `videocount` VALUES ('7', '7', '1', '0', 'uploadvideo/zhingjijiaoshi12_hd.mp4', '120', '2015-11-04 21:52:33');
INSERT INTO `videocount` VALUES ('8', '8', '1', '0', 'uploadvideo/zhingjijiaoshi10_hd.mp4', '120', '2015-11-15 21:52:45');
INSERT INTO `videocount` VALUES ('9', '9', '1', '0', 'uploadvideo/[T-ara]Good.Bye_bd.mp4', '120', '2015-11-17 21:53:26');
INSERT INTO `videocount` VALUES ('10', '9', '1', '0', 'uploadvideo/[T-ara]Good.Bye_bd.mp4', '120', '2015-11-16 21:53:08');
INSERT INTO `videocount` VALUES ('11', '11', '1', '1', 'uploadvideo/zhingjijiaoshi01_hd.mp4', '45', '2015-11-25 12:52:05');
INSERT INTO `videocount` VALUES ('20', '11', '2', '0', 'uploadvideo/zhingjijiaoshi02_hd.mp4', '45', '2015-11-25 12:58:42');
INSERT INTO `videocount` VALUES ('21', '11', '3', '1', 'uploadvideo/zhingjijiaoshi03_hd.mp4', '45', '2015-11-25 12:58:54');
INSERT INTO `videocount` VALUES ('22', '11', '4', '0', 'uploadvideo/zhingjijiaoshi04_hd.mp4', '45', '2015-11-25 13:00:23');
INSERT INTO `videocount` VALUES ('23', '11', '5', '0', 'uploadvideo/zhingjijiaoshi05_hd.mp4', '45', '2015-11-25 13:00:39');
INSERT INTO `videocount` VALUES ('24', '11', '6', '0', 'uploadvideo/zhingjijiaoshi06_hd.mp4', '45', '2015-11-25 13:00:50');
INSERT INTO `videocount` VALUES ('25', '11', '7', '0', 'uploadvideo/zhingjijiaoshi07_hd.mp4', '45', '2015-11-25 13:01:08');
INSERT INTO `videocount` VALUES ('26', '11', '8', '0', 'uploadvideo/zhingjijiaoshi08_hd.mp4', '45', '2015-11-25 13:01:22');
INSERT INTO `videocount` VALUES ('27', '11', '9', '0', 'uploadvideo/zhingjijiaoshi09_hd.mp4', '45', '2015-11-25 13:01:22');
INSERT INTO `videocount` VALUES ('28', '12', '1', '0', 'uploadvideo/zhingjijiaoshi01_hd.mp4', '45', '2015-11-25 13:02:25');
INSERT INTO `videocount` VALUES ('29', '12', '2', '0', 'uploadvideo/zhingjijiaoshi02_hd.mp4', '45', '2015-11-25 13:02:38');
INSERT INTO `videocount` VALUES ('30', '12', '3', '0', 'uploadvideo/zhingjijiaoshi03_hd.mp4', '45', '2015-11-26 13:02:50');
INSERT INTO `videocount` VALUES ('31', '13', '1', '0', 'uploadvideo/zhingjijiaoshi01_hd.mp4', '45', '2015-11-25 13:03:02');
INSERT INTO `videocount` VALUES ('32', '13', '2', '0', 'uploadvideo/zhingjijiaoshi02_hd.mp4', '45', '2015-11-25 13:03:15');
INSERT INTO `videocount` VALUES ('33', '14', '3', '0', 'uploadvideo/zhingjijiaoshi03_hd.mp4', '45', '2015-11-25 13:03:31');
INSERT INTO `videocount` VALUES ('34', '15', '1', '0', 'uploadvideo/zhingjijiaoshi01_hd.mp4', '45', '2015-11-25 13:03:41');
INSERT INTO `videocount` VALUES ('35', '15', '2', '0', 'uploadvideo/zhingjijiaoshi02_hd.mp4', '45', '2015-11-25 13:03:55');
INSERT INTO `videocount` VALUES ('36', '16', '1', '0', 'uploadvideo/zhingjijiaoshi01_hd.mp4', '45', '2015-11-25 13:04:08');
INSERT INTO `videocount` VALUES ('37', '16', '2', '0', 'uploadvideo/zhingjijiaoshi02_hd.mp4', '45', '2015-11-25 13:04:26');
INSERT INTO `videocount` VALUES ('38', '17', '1', '0', 'uploadvideo/zhingjijiaoshi01_hd.mp4', '45', '2015-11-25 13:04:39');
INSERT INTO `videocount` VALUES ('39', '17', '2', '0', 'uploadvideo/zhingjijiaoshi02_hd.mp4', '45', '2015-11-25 13:04:54');
INSERT INTO `videocount` VALUES ('40', '18', '1', '0', 'uploadvideo/zhingjijiaoshi01_hd.mp4', '45', '2015-11-25 13:05:05');
INSERT INTO `videocount` VALUES ('41', '19', '1', '0', 'uploadvideo/zhingjijiaoshi01_hd.mp4', '45', '2015-11-25 13:05:18');
INSERT INTO `videocount` VALUES ('42', '19', '2', '0', 'uploadvideo/zhingjijiaoshi02_hd.mp4', '45', '2015-11-25 13:05:30');
INSERT INTO `videocount` VALUES ('43', '20', '1', '0', 'uploadvideo/zhingjijiaoshi01_hd.mp4', '45', '2015-11-25 13:05:48');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videoinfo
-- ----------------------------
INSERT INTO `videoinfo` VALUES ('1', '1', '1', '1', '笔仙', '安兵基', '梅婷 / 郭京飞 / 吴超', '好好看好好看好好看好好看好好看好好看', '2012', '略...', 'uploadimage/20120903092843452.jpg', '1');
INSERT INTO `videoinfo` VALUES ('2', '1', '1', '1', '蜘蛛侠', '马克·韦布', '安德鲁·加菲尔德', '超凡蜘蛛侠超凡蜘蛛侠超凡蜘蛛侠超凡蜘蛛侠', '2012', '超凡蜘蛛侠超凡蜘蛛侠超凡蜘蛛侠超凡蜘蛛侠超凡蜘蛛侠超凡蜘蛛侠', 'uploadimage/20120901110129349.jpg', '1');
INSERT INTO `videoinfo` VALUES ('3', '2', '1', '2', '岳父大人', '李海蜀', '徐峥 / 许绍雄 / 林鹏', '搞定岳父大人搞定岳父大人搞定岳父大人搞定岳父大人', '2012', '搞定岳父大人搞定岳父大人搞定岳父大人搞定岳父大人', 'uploadimage/20120902092024952.jpg', '1');
INSERT INTO `videoinfo` VALUES ('4', '3', '1', '3', '宝马狂想曲', '李麒麟', '陈小春 / 戎祥 / 熊乃瑾', '宝马狂想曲宝马狂想曲宝马狂想曲', '2010', '宝马狂想曲宝马狂想曲宝马狂想曲', 'uploadimage/20120903093037590.jpg', '1');
INSERT INTO `videoinfo` VALUES ('5', '2', '1', '4', '画皮2', '乌尔善', '周迅 / 赵薇 / 陈坤', '周迅 / 赵薇 / 陈坤', '2014', '周迅 / 赵薇 / 陈坤', 'uploadimage/20120903093432374.jpg', '1');
INSERT INTO `videoinfo` VALUES ('6', '3', '1', '5', '青春期3', '青春期3', '青春期3', '青春期3', '2014', '青春期3', 'uploadimage/20120903093649683.jpg', '1');
INSERT INTO `videoinfo` VALUES ('7', '6', '1', '4', '四大名捕', '四大名捕', ' 赵薇 ', '四大名捕四大名捕四大名捕四大名捕', '2014', '四大名捕', 'uploadimage/20120830055950193.jpg', '1');
INSERT INTO `videoinfo` VALUES ('8', '2', '1', '5', '食人鱼', '食人鱼', '食人鱼3D', '食人鱼3D', '2014', '食人鱼3D', 'uploadimage/20120903094139061.jpg', '1');
INSERT INTO `videoinfo` VALUES ('9', '3', '1', '4', '甲午大海战', '甲午大海战', '甲午大海战', '甲午大海战', '2014', '甲午大海战', 'uploadimage/20120902092834630.jpg', '1');
INSERT INTO `videoinfo` VALUES ('10', '1', '1', '5', '邻家', '邻家', '邻家', '邻家', '2014', '邻家女优', 'uploadimage/T-ara.jpg', '1');
INSERT INTO `videoinfo` VALUES ('11', '2', '2', '1', '终极教师', '终极教师', '终极教师', '终极教师', '2015', '终极教师', 'uploadimage/zhongjijiaoshi.jpg', '1');
INSERT INTO `videoinfo` VALUES ('12', '1', '2', '2', '超级教师3', '超级教师', '超级教师', '超级教师', '2015', '超级教师', 'uploadimage/zhongjijiaoshi.jpg', '1');
INSERT INTO `videoinfo` VALUES ('13', '2', '2', '3', '超级教师2', '超级教师2', '超级教师2', '超级教师2', '2015', '超级教师', 'uploadimage/zhongjijiaoshi.jpg', '1');
INSERT INTO `videoinfo` VALUES ('14', '3', '2', '4', '超级教师4', '超级教师4', '超级教师4', '超级教师4', '2015', '超级教师4', 'uploadimage/zhongjijiaoshi.jpg', '1');
INSERT INTO `videoinfo` VALUES ('15', '1', '2', '1', '超级教师5', '超级教师5', '超级教师5', '超级教师5', '2015', '超级教师5', 'uploadimage/zhongjijiaoshi.jpg', '1');
INSERT INTO `videoinfo` VALUES ('16', '2', '2', '2', '超级教师6', '超级教师6', '超级教师6', '超级教师6', '2015', '超级教师5', 'uploadimage/zhongjijiaoshi.jpg', '1');
INSERT INTO `videoinfo` VALUES ('17', '3', '2', '3', '超级教师7', '超级教师7', '超级教师7', '超级教师7', '2015', '超级教师7', 'uploadimage/zhongjijiaoshi.jpg', '1');
INSERT INTO `videoinfo` VALUES ('18', '4', '2', '4', '超级教师8', '超级教师8', '超级教师8', '超级教师8', '2015', '超级教师8', 'uploadimage/zhongjijiaoshi.jpg', '1');
INSERT INTO `videoinfo` VALUES ('19', '5', '2', '5', '超级教师9', '超级教师9', '超级教师9', '超级教师9', '2015', '超级教师9', 'uploadimage/zhongjijiaoshi.jpg', '1');
INSERT INTO `videoinfo` VALUES ('20', '6', '2', '3', '超级教师10', '超级教师10', '超级教师10', '超级教师10', '2015', '超级教师10', 'uploadimage/zhongjijiaoshi.jpg', '1');
