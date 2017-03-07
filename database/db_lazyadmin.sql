/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost
 Source Database       : db_lazyadmin

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : utf-8

 Date: 03/07/2017 22:20:30 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `salt` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_admin`
-- ----------------------------
BEGIN;
INSERT INTO `t_admin` VALUES ('1', 'a663a847079521db3a558517ed5bc1e1', '0eff1643c24b77b814c1d065987770fb', 'melon', '2017-02-26 11:09:24'), ('5', '0f515f5dba80f0e33a8a4e58d2140d34', '7040d0fda57cd3d5f20cf42aa60b6f02', 'sunny', '2017-02-26 11:09:24'), ('7', '4fd11f1d416335a04bdae924abc119d5', '1e358ffdc7f1d65d9ef42ed4bdd51c1b', 'admin', '2017-02-28 14:46:37');
COMMIT;

-- ----------------------------
--  Table structure for `t_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_admin_role`
-- ----------------------------
BEGIN;
INSERT INTO `t_admin_role` VALUES ('5', '4', '1'), ('14', '7', '1'), ('15', '1', '1'), ('16', '5', '6');
COMMIT;

-- ----------------------------
--  Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) COLLATE utf8_bin NOT NULL,
  `permission` varchar(20) COLLATE utf8_bin NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_permission`
-- ----------------------------
BEGIN;
INSERT INTO `t_permission` VALUES ('1', '查看管理员', 'admin:view', '2017-02-23 15:34:09'), ('5', '创建管理员', 'admin:create', '2017-02-26 10:00:39'), ('6', '编辑管理员', 'admin:modify', '2017-02-26 10:00:48'), ('7', '删除管理员', 'admin:delete', '2017-02-26 10:00:56'), ('8', '查看角色', 'role:view', '2017-02-26 10:01:09'), ('9', '创建角色', 'role:create', '2017-02-26 10:01:24'), ('10', '编辑角色', 'role:modify', '2017-02-26 10:01:33'), ('11', '删除角色', 'role:delete', '2017-02-26 10:01:47'), ('12', '查看权限', 'permission:view', '2017-02-26 10:01:59'), ('13', '创建权限', 'permission:create', '2017-02-26 10:02:09'), ('14', '编辑权限', 'permission:modify', '2017-02-26 10:02:18'), ('15', '删除权限', 'permission:delete', '2017-02-26 10:02:27'), ('16', '查看视频', 'video:view', '2017-02-26 10:02:35'), ('17', '创建视频', 'video:create', '2017-02-26 10:02:44'), ('18', '编辑视频', 'video:modify', '2017-02-26 10:02:55'), ('19', '删除视频', 'video:delete', '2017-02-26 10:03:12');
COMMIT;

-- ----------------------------
--  Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) COLLATE utf8_bin NOT NULL,
  `role` varchar(20) COLLATE utf8_bin NOT NULL,
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_role`
-- ----------------------------
BEGIN;
INSERT INTO `t_role` VALUES ('1', '超级管理员', 'admin', '2017-02-24 10:44:57'), ('6', '普通管理员', 'manager', '2017-02-26 11:08:49'), ('11', '视频内容管理员', 'videoManager', '2017-02-28 14:39:53');
COMMIT;

-- ----------------------------
--  Table structure for `t_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_role_permission`
-- ----------------------------
BEGIN;
INSERT INTO `t_role_permission` VALUES ('97', '1', '1'), ('98', '5', '1'), ('99', '6', '1'), ('100', '7', '1'), ('101', '8', '1'), ('102', '9', '1'), ('103', '10', '1'), ('104', '11', '1'), ('105', '12', '1'), ('106', '13', '1'), ('107', '14', '1'), ('108', '15', '1'), ('109', '16', '1'), ('110', '17', '1'), ('111', '18', '1'), ('112', '19', '1'), ('113', '8', '6'), ('114', '9', '6'), ('115', '10', '6'), ('116', '11', '6'), ('117', '12', '6'), ('118', '13', '6'), ('119', '14', '6'), ('120', '15', '6'), ('121', '16', '6'), ('122', '17', '6'), ('123', '18', '6'), ('124', '19', '6'), ('125', '16', '11'), ('126', '17', '11'), ('127', '18', '11'), ('128', '19', '11');
COMMIT;

-- ----------------------------
--  Table structure for `t_video`
-- ----------------------------
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_bin NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_video`
-- ----------------------------
BEGIN;
INSERT INTO `t_video` VALUES ('1', 'demo1', '2017-02-26 13:03:13', '视频1', 'http://7xrh7e.com1.z0.glb.clouddn.com/echohereweare.mp4'), ('18', '222', '2017-02-26 13:03:14', '视频1', 'http://7xrh7e.com1.z0.glb.clouddn.com/echohereweare.mp4'), ('20', '4444', '2017-02-26 13:03:17', '视频3', 'http://7xrh7e.com1.z0.glb.clouddn.com/echohereweare.mp4'), ('22', '6666', '2017-02-26 13:03:22', '视频4', 'http://7xrh7e.com1.z0.glb.clouddn.com/echohereweare.mp4');
COMMIT;

