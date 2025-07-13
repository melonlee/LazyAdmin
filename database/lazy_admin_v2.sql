-- LazyAdmin 2.0 数据库脚本
-- 创建数据库
CREATE DATABASE IF NOT EXISTS `lazy_admin` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `lazy_admin`;

-- 用户表
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `salt` varchar(50) DEFAULT NULL COMMENT '密码盐值',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态 0:禁用 1:启用',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`),
  UNIQUE KEY `uk_email` (`email`),
  KEY `idx_status` (`status`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- 角色表
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) NOT NULL COMMENT '角色名称',
  `role_code` varchar(50) NOT NULL COMMENT '角色编码',
  `description` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态 0:禁用 1:启用',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_role_code` (`role_code`),
  KEY `idx_status` (`status`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色表';

-- 权限表
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `permission_name` varchar(50) NOT NULL COMMENT '权限名称',
  `permission_code` varchar(100) NOT NULL COMMENT '权限编码',
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '权限类型 1:菜单 2:按钮',
  `parent_id` bigint DEFAULT '0' COMMENT '父权限ID',
  `url` varchar(255) DEFAULT NULL COMMENT '权限URL',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `description` varchar(200) DEFAULT NULL COMMENT '权限描述',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态 0:禁用 1:启用',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0:否 1:是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_permission_code` (`permission_code`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_type` (`type`),
  KEY `idx_status` (`status`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限表';

-- 用户角色关系表
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_role` (`user_id`,`role_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_role_id` (`role_id`),
  CONSTRAINT `fk_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_role_role` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户角色关系表';

-- 角色权限关系表
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `permission_id` bigint NOT NULL COMMENT '权限ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_role_permission` (`role_id`,`permission_id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_permission_id` (`permission_id`),
  CONSTRAINT `fk_role_permission_role` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_role_permission_permission` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色权限关系表';

-- 操作日志表
DROP TABLE IF EXISTS `t_operation_log`;
CREATE TABLE `t_operation_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) NOT NULL COMMENT '操作类型',
  `method` varchar(200) NOT NULL COMMENT '请求方法',
  `params` text COMMENT '请求参数',
  `result` text COMMENT '返回结果',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `location` varchar(255) DEFAULT NULL COMMENT '操作地点',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户代理',
  `execution_time` bigint DEFAULT NULL COMMENT '执行时间(毫秒)',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态 0:失败 1:成功',
  `error_msg` text COMMENT '错误信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_username` (`username`),
  KEY `idx_operation` (`operation`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志表';

-- 初始化数据
-- 超级管理员用户 (密码: admin123)
INSERT INTO `t_user` (`username`, `password`, `salt`, `email`, `real_name`, `status`, `create_by`) VALUES
('admin', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iKyLFh0KAkTcJNcXuF4fzNTFGGH2', 'defaultsalt', 'admin@lazyadmin.com', '超级管理员', 1, 'system');

-- 基础角色
INSERT INTO `t_role` (`role_name`, `role_code`, `description`, `status`, `sort`, `create_by`) VALUES
('超级管理员', 'SUPER_ADMIN', '超级管理员，拥有所有权限', 1, 1, 'system'),
('系统管理员', 'SYSTEM_ADMIN', '系统管理员，拥有系统管理权限', 1, 2, 'system'),
('普通用户', 'USER', '普通用户，基础权限', 1, 3, 'system');

-- 基础权限
INSERT INTO `t_permission` (`permission_name`, `permission_code`, `type`, `parent_id`, `url`, `icon`, `description`, `status`, `sort`, `create_by`) VALUES
('系统管理', 'system', 1, 0, '/system', 'setting', '系统管理菜单', 1, 1, 'system'),
('用户管理', 'user:list', 1, 1, '/system/user', 'user', '用户管理菜单', 1, 1, 'system'),
('用户查看', 'user:view', 2, 2, '', '', '用户查看权限', 1, 1, 'system'),
('用户新增', 'user:add', 2, 2, '', '', '用户新增权限', 1, 2, 'system'),
('用户编辑', 'user:edit', 2, 2, '', '', '用户编辑权限', 1, 3, 'system'),
('用户删除', 'user:delete', 2, 2, '', '', '用户删除权限', 1, 4, 'system'),
('角色管理', 'role:list', 1, 1, '/system/role', 'team', '角色管理菜单', 1, 2, 'system'),
('角色查看', 'role:view', 2, 7, '', '', '角色查看权限', 1, 1, 'system'),
('角色新增', 'role:add', 2, 7, '', '', '角色新增权限', 1, 2, 'system'),
('角色编辑', 'role:edit', 2, 7, '', '', '角色编辑权限', 1, 3, 'system'),
('角色删除', 'role:delete', 2, 7, '', '', '角色删除权限', 1, 4, 'system'),
('权限管理', 'permission:list', 1, 1, '/system/permission', 'lock', '权限管理菜单', 1, 3, 'system'),
('权限查看', 'permission:view', 2, 12, '', '', '权限查看权限', 1, 1, 'system'),
('权限新增', 'permission:add', 2, 12, '', '', '权限新增权限', 1, 2, 'system'),
('权限编辑', 'permission:edit', 2, 12, '', '', '权限编辑权限', 1, 3, 'system'),
('权限删除', 'permission:delete', 2, 12, '', '', '权限删除权限', 1, 4, 'system'),
('日志管理', 'log:list', 1, 1, '/system/log', 'file-text', '日志管理菜单', 1, 4, 'system'),
('日志查看', 'log:view', 2, 17, '', '', '日志查看权限', 1, 1, 'system'),
('日志删除', 'log:delete', 2, 17, '', '', '日志删除权限', 1, 2, 'system');

-- 用户角色关系
INSERT INTO `t_user_role` (`user_id`, `role_id`, `create_by`) VALUES
(1, 1, 'system');

-- 角色权限关系 (超级管理员拥有所有权限)
INSERT INTO `t_role_permission` (`role_id`, `permission_id`, `create_by`)
SELECT 1, id, 'system' FROM t_permission; 