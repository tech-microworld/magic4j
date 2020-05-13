SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `QRTZ_BLOB_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_CALENDARS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_CRON_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('scheduler', 'TASK_29', 'DEFAULT', '0/5 * * ? * * *', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('scheduler', 'TASK_30', 'DEFAULT', '1/10 * * ? * * *', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for `QRTZ_FIRED_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_JOB_DETAILS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('scheduler', 'TASK_29', 'DEFAULT', null, 'com.itgacl.magic4j.modules.schedule.bean.ScheduleJobBean', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455974014B7B22616C61726D456D61696C223A223239303630333637324071712E636F6D222C22617574686F72223A22E5ADA4E582B2E88B8DE78BBC222C226265616E4E616D65223A22746573745461736B222C2263726561746554696D65223A313538373131313139383735352C2263726561746555736572223A332C2263726F6E45787072657373696F6E223A22302F35202A202A203F202A202A202A222C2264656C657465466C6167223A302C226964223A32392C226A6F624E616D65223A22E6B58BE8AF95E4BBBBE58AA131222C226D6574686F644E616D65223A227465737431222C22706172616D73223A226D61676963346A2D6761636C2D786470222C2272656D61726B223A22E6B58BE8AF95E4BBBBE58AA1222C22737461747573223A302C2275706461746554696D65223A313538373131313139383735352C2275706461746555736572223A337D7800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('scheduler', 'TASK_30', 'DEFAULT', null, 'com.itgacl.magic4j.modules.schedule.bean.ScheduleJobBean', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400E07B226265616E4E616D65223A22746573745461736B222C2263726561746554696D65223A313538373131313631323634372C2263726561746555736572223A332C2263726F6E45787072657373696F6E223A22312F3130202A202A203F202A202A202A222C2264656C657465466C6167223A302C226964223A33302C226A6F624E616D65223A22E6B58BE8AF95E4BBBBE58AA132222C226D6574686F644E616D65223A227465737432222C22737461747573223A302C2275706461746554696D65223A313538373131313631323634382C2275706461746555736572223A337D7800);

-- ----------------------------
-- Table structure for `QRTZ_LOCKS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('scheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('scheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `QRTZ_PAUSED_TRIGGER_GRPS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_SCHEDULER_STATE`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('scheduler', 'DESKTOP-C3PQEI51589347634623', '1589348068211', '15000');

-- ----------------------------
-- Table structure for `QRTZ_SIMPLE_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_SIMPROP_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('scheduler', 'TASK_29', 'DEFAULT', 'TASK_29', 'DEFAULT', null, '1589081520000', '1589081515000', '5', 'PAUSED', 'CRON', '1587111198000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455974014B7B22616C61726D456D61696C223A223239303630333637324071712E636F6D222C22617574686F72223A22E5ADA4E582B2E88B8DE78BBC222C226265616E4E616D65223A22746573745461736B222C22636C6173734E616D65223A22636F6D2E69746761636C2E6D61676963346A2E6D6F64756C65732E7363686564756C652E7461736B2E546573745461736B222C2263726561746554696D65223A22323032302D30342D31372031363A31333A3139222C2263726F6E45787072657373696F6E223A22302F35202A202A203F202A202A202A222C226964223A32392C226A6F624E616D65223A22E6B58BE8AF95E4BBBBE58AA131222C226D6574686F644E616D65223A227465737431222C22706172616D73223A226D61676963346A2D6761636C2D786470222C2272656D61726B223A22E6B58BE8AF95E4BBBBE58AA1222C22737461747573223A307D7800);
INSERT INTO `QRTZ_TRIGGERS` VALUES ('scheduler', 'TASK_30', 'DEFAULT', 'TASK_30', 'DEFAULT', null, '1589081521000', '1589081511000', '5', 'PAUSED', 'CRON', '1587111612000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597401547B22616C61726D456D61696C223A223239303630333637324071712E636F6D222C22617574686F72223A22E5ADA4E582B2E88B8DE78BBC222C226265616E4E616D65223A22746573745461736B222C22636C6173734E616D65223A22636F6D2E69746761636C2E6D61676963346A2E6D6F64756C65732E7363686564756C652E7461736B2E546573745461736B222C2263726561746554696D65223A22323032302D30342D31372031363A32303A3133222C2263726F6E45787072657373696F6E223A22312F3130202A202A203F202A202A202A222C226964223A33302C226A6F624E616D65223A22E6B58BE8AF95E4BBBBE58AA132222C226D6574686F644E616D65223A227465737432222C22706172616D73223A22222C2272656D61726B223A22E6B58BE8AF95E4BBBBE58AA132EFBC8CE6AF8F3130E7A792E689A7E8A18CE4B880E6ACA1222C22737461747573223A317D7800);

-- ----------------------------
-- Table structure for `schedule_job`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `job_name` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `class_name` varchar(255) DEFAULT NULL COMMENT '调度任务类名',
  `bean_name` varchar(30) DEFAULT NULL COMMENT 'bean名称',
  `method_name` varchar(30) DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) DEFAULT NULL COMMENT '执行参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` int(1) DEFAULT '0' COMMENT '任务状态    0：正常    1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `author` varchar(50) DEFAULT NULL COMMENT '定时任务负责人',
  `alarm_email` varchar(255) DEFAULT NULL COMMENT '预警邮箱',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `delete_flag` int(1) DEFAULT '0' COMMENT '删除标识(0:正常，1:已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('29', '测试任务1', 'com.itgacl.magic4j.modules.schedule.task.TestTask', 'testTask', 'test1', 'magic4j-gacl-xdp', '0/5 * * ? * * *', '1', '测试任务', '孤傲苍狼', '290603672@qq.com', '2020-04-17 16:13:19', '3', '2020-05-10 11:31:59', '3', '0');
INSERT INTO `schedule_job` VALUES ('30', '测试任务2', 'com.itgacl.magic4j.modules.schedule.task.TestTask', 'testTask', 'test2', '', '1/10 * * ? * * *', '1', '测试任务2，每10秒执行一次', '孤傲苍狼', '290603672@qq.com', '2020-04-17 16:20:13', '3', '2020-05-10 11:31:59', '3', '0');
INSERT INTO `schedule_job` VALUES ('38', 'qq', null, 'qq', 'qq', null, '* * * ? * * *', '1', null, null, null, '2020-04-17 22:25:38', '3', '2020-04-17 22:25:38', '3', '1');
INSERT INTO `schedule_job` VALUES ('39', 'AA', null, 'AA', 'AA', null, '* * * ? * * 2020-2023', '1', null, null, null, '2020-04-17 22:26:04', '3', '2020-04-17 22:26:04', '3', '1');
INSERT INTO `schedule_job` VALUES ('40', '测试', null, 'test3', 'test3', null, '* * * 01,03 * ? *', '1', null, null, null, '2020-04-18 07:36:39', '3', '2020-04-18 07:36:39', '3', '1');
INSERT INTO `schedule_job` VALUES ('41', 'AA', null, 'BB', 'AC', null, '1-2 * * ? * * *', '1', null, null, null, '2020-04-18 07:51:43', '3', '2020-04-18 07:51:43', '3', '1');
INSERT INTO `schedule_job` VALUES ('42', 'GG', null, 'GG', 'GG', null, '* * * ? * * *', '1', null, null, null, '2020-04-18 07:53:38', '3', '2020-04-18 07:53:38', '3', '1');
INSERT INTO `schedule_job` VALUES ('43', 'GG', '', 'GG', 'GG', 'HH', '* * * ? * * *', '1', '', '', '', '2020-04-18 07:54:39', '3', '2020-04-18 08:02:55', '3', '1');
INSERT INTO `schedule_job` VALUES ('44', 'YY', null, 'YY', 'YY', null, '15,16 * * ? * * *', '1', null, null, null, '2020-04-18 08:04:53', '3', '2020-04-18 08:04:53', '3', '1');
INSERT INTO `schedule_job` VALUES ('45', 'YY个', null, 'HH', 'HH', null, '07,17 * * ? * * *', '1', null, null, null, '2020-04-18 08:10:01', '3', '2020-04-18 08:10:01', '3', '1');

-- ----------------------------
-- Table structure for `schedule_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `job_id` bigint(20) DEFAULT NULL COMMENT '任务ID',
  `job_name` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `bean_name` varchar(30) DEFAULT NULL COMMENT 'bean名称',
  `method_name` varchar(30) DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) DEFAULT NULL COMMENT '执行参数',
  `status` int(1) DEFAULT NULL COMMENT '任务执行结果    0：成功    1：失败',
  `error` varchar(1000) DEFAULT NULL COMMENT '错误信息',
  `times` int(11) DEFAULT NULL COMMENT '执行耗时',
  `server_ip` varchar(20) DEFAULT NULL COMMENT '执行定时任务的服务器IP',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=98473 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务执行日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_auth_resource`
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_resource`;
CREATE TABLE `sys_auth_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `controller_class_name` varchar(255) DEFAULT NULL COMMENT '控制器类名',
  `method_name` varchar(30) DEFAULT NULL COMMENT '方法名',
  `method_param` varchar(500) DEFAULT NULL COMMENT '方法参数(json字符串)',
  `request_url` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `request_types` varchar(10) DEFAULT NULL COMMENT '请求方式',
  `perm_flags` varchar(255) DEFAULT NULL COMMENT '访问权限标识',
  `group_name` varchar(50) DEFAULT NULL COMMENT '所属分组',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统API资源(API接口)详细信息表';

-- ----------------------------
-- Records of sys_auth_resource
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_cn_area`
-- ----------------------------
DROP TABLE IF EXISTS `sys_cn_area`;
CREATE TABLE `sys_cn_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `short_name` varchar(50) DEFAULT NULL COMMENT '简称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父ID',
  `parent_name` varchar(50) DEFAULT NULL COMMENT '父名称',
  `merger_name` varchar(255) DEFAULT NULL COMMENT '合并名称',
  `level` smallint(6) DEFAULT NULL COMMENT '级别',
  `zip_code` int(11) DEFAULT NULL COMMENT '邮政编码',
  `city_code` char(10) DEFAULT NULL COMMENT '城市编码',
  `pinyin` varchar(100) DEFAULT NULL COMMENT '拼音',
  `lng` decimal(10,7) DEFAULT NULL COMMENT '经度',
  `lat` decimal(10,7) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=900001 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='中国行政区域';

-- ----------------------------
-- Records of sys_cn_area
-- ----------------------------
INSERT INTO `sys_cn_area` VALUES ('100000', '中国', '中国', null, null, '中国', '0', null, '', 'China', '116.3683244', '39.9150850');
INSERT INTO `sys_cn_area` VALUES ('110000', '北京', '北京', '100000', null, '中国,北京', '1', null, '', 'Beijing', '116.4052850', '39.9049890');
INSERT INTO `sys_cn_area` VALUES ('110100', '北京市', '北京', '110000', null, '中国,北京,北京市', '2', '100000', '010', 'Beijing', '116.4052850', '39.9049890');
INSERT INTO `sys_cn_area` VALUES ('110101', '东城区', '东城', '110100', null, '中国,北京,北京市,东城区', '3', '100010', '010', 'Dongcheng', '116.4100500', '39.9315700');
INSERT INTO `sys_cn_area` VALUES ('110102', '西城区', '西城', '110100', null, '中国,北京,北京市,西城区', '3', '100032', '010', 'Xicheng', '116.3600300', '39.9305000');
INSERT INTO `sys_cn_area` VALUES ('110105', '朝阳区', '朝阳', '110100', null, '中国,北京,北京市,朝阳区', '3', '100020', '010', 'Chaoyang', '116.4854800', '39.9484000');
INSERT INTO `sys_cn_area` VALUES ('110106', '丰台区', '丰台', '110100', null, '中国,北京,北京市,丰台区', '3', '100071', '010', 'Fengtai', '116.2862500', '39.8585000');
INSERT INTO `sys_cn_area` VALUES ('110107', '石景山区', '石景山', '110100', null, '中国,北京,北京市,石景山区', '3', '100043', '010', 'Shijingshan', '116.2229000', '39.9056400');
INSERT INTO `sys_cn_area` VALUES ('110108', '海淀区', '海淀', '110100', null, '中国,北京,北京市,海淀区', '3', '100089', '010', 'Haidian', '116.2981200', '39.9593100');
INSERT INTO `sys_cn_area` VALUES ('110109', '门头沟区', '门头沟', '110100', null, '中国,北京,北京市,门头沟区', '3', '102300', '010', 'Mentougou', '116.1013700', '39.9404300');
INSERT INTO `sys_cn_area` VALUES ('110111', '房山区', '房山', '110100', null, '中国,北京,北京市,房山区', '3', '102488', '010', 'Fangshan', '116.1425700', '39.7478600');
INSERT INTO `sys_cn_area` VALUES ('110112', '通州区', '通州', '110100', null, '中国,北京,北京市,通州区', '3', '101149', '010', 'Tongzhou', '116.6571600', '39.9096600');
INSERT INTO `sys_cn_area` VALUES ('110113', '顺义区', '顺义', '110100', null, '中国,北京,北京市,顺义区', '3', '101300', '010', 'Shunyi', '116.6541700', '40.1302000');
INSERT INTO `sys_cn_area` VALUES ('110114', '昌平区', '昌平', '110100', null, '中国,北京,北京市,昌平区', '3', '102200', '010', 'Changping', '116.2312000', '40.2207200');
INSERT INTO `sys_cn_area` VALUES ('110115', '大兴区', '大兴', '110100', null, '中国,北京,北京市,大兴区', '3', '102600', '010', 'Daxing', '116.3414900', '39.7266800');
INSERT INTO `sys_cn_area` VALUES ('110116', '怀柔区', '怀柔', '110100', null, '中国,北京,北京市,怀柔区', '3', '101400', '010', 'Huairou', '116.6316800', '40.3160200');
INSERT INTO `sys_cn_area` VALUES ('110117', '平谷区', '平谷', '110100', null, '中国,北京,北京市,平谷区', '3', '101200', '010', 'Pinggu', '117.1213300', '40.1405600');
INSERT INTO `sys_cn_area` VALUES ('110228', '密云县', '密云', '110100', null, '中国,北京,北京市,密云县', '3', '101500', '010', 'Miyun', '116.8429500', '40.3761800');
INSERT INTO `sys_cn_area` VALUES ('110229', '延庆县', '延庆', '110100', null, '中国,北京,北京市,延庆县', '3', '102100', '010', 'Yanqing', '115.9749400', '40.4567200');
INSERT INTO `sys_cn_area` VALUES ('120000', '天津', '天津', '100000', null, '中国,天津', '1', null, '', 'Tianjin', '117.1901820', '39.1255960');
INSERT INTO `sys_cn_area` VALUES ('120100', '天津市', '天津', '120000', null, '中国,天津,天津市', '2', '300000', '022', 'Tianjin', '117.1901820', '39.1255960');
INSERT INTO `sys_cn_area` VALUES ('120101', '和平区', '和平', '120100', null, '中国,天津,天津市,和平区', '3', '300041', '022', 'Heping', '117.2145600', '39.1171800');
INSERT INTO `sys_cn_area` VALUES ('120102', '河东区', '河东', '120100', null, '中国,天津,天津市,河东区', '3', '300171', '022', 'Hedong', '117.2256200', '39.1231800');
INSERT INTO `sys_cn_area` VALUES ('120103', '河西区', '河西', '120100', null, '中国,天津,天津市,河西区', '3', '300202', '022', 'Hexi', '117.2232700', '39.1095900');
INSERT INTO `sys_cn_area` VALUES ('120104', '南开区', '南开', '120100', null, '中国,天津,天津市,南开区', '3', '300110', '022', 'Nankai', '117.1507400', '39.1382100');
INSERT INTO `sys_cn_area` VALUES ('120105', '河北区', '河北', '120100', null, '中国,天津,天津市,河北区', '3', '300143', '022', 'Hebei', '117.1969700', '39.1481600');
INSERT INTO `sys_cn_area` VALUES ('120106', '红桥区', '红桥', '120100', null, '中国,天津,天津市,红桥区', '3', '300131', '022', 'Hongqiao', '117.1514500', '39.1671500');
INSERT INTO `sys_cn_area` VALUES ('120110', '东丽区', '东丽', '120100', null, '中国,天津,天津市,东丽区', '3', '300300', '022', 'Dongli', '117.3143600', '39.0863000');
INSERT INTO `sys_cn_area` VALUES ('120111', '西青区', '西青', '120100', null, '中国,天津,天津市,西青区', '3', '300380', '022', 'Xiqing', '117.0092700', '39.1412300');
INSERT INTO `sys_cn_area` VALUES ('120112', '津南区', '津南', '120100', null, '中国,天津,天津市,津南区', '3', '300350', '022', 'Jinnan', '117.3853700', '38.9913900');
INSERT INTO `sys_cn_area` VALUES ('120113', '北辰区', '北辰', '120100', null, '中国,天津,天津市,北辰区', '3', '300400', '022', 'Beichen', '117.1321700', '39.2213100');
INSERT INTO `sys_cn_area` VALUES ('120114', '武清区', '武清', '120100', null, '中国,天津,天津市,武清区', '3', '301700', '022', 'Wuqing', '117.0444300', '39.3841500');
INSERT INTO `sys_cn_area` VALUES ('120115', '宝坻区', '宝坻', '120100', null, '中国,天津,天津市,宝坻区', '3', '301800', '022', 'Baodi', '117.3103000', '39.7176100');
INSERT INTO `sys_cn_area` VALUES ('120116', '滨海新区', '滨海新区', '120100', null, '中国,天津,天津市,滨海新区', '3', '300451', '022', 'Binhaixinqu', '117.7016200', '39.0266800');
INSERT INTO `sys_cn_area` VALUES ('120221', '宁河县', '宁河', '120100', null, '中国,天津,天津市,宁河县', '3', '301500', '022', 'Ninghe', '117.8255000', '39.3304800');
INSERT INTO `sys_cn_area` VALUES ('120223', '静海县', '静海', '120100', null, '中国,天津,天津市,静海县', '3', '301600', '022', 'Jinghai', '116.9743600', '38.9458200');
INSERT INTO `sys_cn_area` VALUES ('120225', '蓟县', '蓟县', '120100', null, '中国,天津,天津市,蓟县', '3', '301900', '022', 'Jixian', '117.4079900', '40.0456700');
INSERT INTO `sys_cn_area` VALUES ('130000', '河北省', '河北', '100000', null, '中国,河北省', '1', null, '', 'Hebei', '114.5024610', '38.0454740');
INSERT INTO `sys_cn_area` VALUES ('130100', '石家庄市', '石家庄', '130000', null, '中国,河北省,石家庄市', '2', '50011', '0311', 'Shijiazhuang', '114.5024610', '38.0454740');
INSERT INTO `sys_cn_area` VALUES ('130102', '长安区', '长安', '130100', null, '中国,河北省,石家庄市,长安区', '3', '50011', '0311', 'Chang\'an', '114.5390600', '38.0366500');
INSERT INTO `sys_cn_area` VALUES ('130104', '桥西区', '桥西', '130100', null, '中国,河北省,石家庄市,桥西区', '3', '50091', '0311', 'Qiaoxi', '114.4697700', '38.0322100');
INSERT INTO `sys_cn_area` VALUES ('130105', '新华区', '新华', '130100', null, '中国,河北省,石家庄市,新华区', '3', '50051', '0311', 'Xinhua', '114.4632600', '38.0508800');
INSERT INTO `sys_cn_area` VALUES ('130107', '井陉矿区', '井陉矿区', '130100', null, '中国,河北省,石家庄市,井陉矿区', '3', '50100', '0311', 'Jingxingkuangqu', '114.0651800', '38.0670500');
INSERT INTO `sys_cn_area` VALUES ('130108', '裕华区', '裕华', '130100', null, '中国,河北省,石家庄市,裕华区', '3', '50031', '0311', 'Yuhua', '114.5311500', '38.0060400');
INSERT INTO `sys_cn_area` VALUES ('130109', '藁城区', '藁城', '130100', null, '中国,河北省,石家庄市,藁城区', '3', '52160', '0311', 'Gaocheng', '114.8467100', '38.0216200');
INSERT INTO `sys_cn_area` VALUES ('130110', '鹿泉区', '鹿泉', '130100', null, '中国,河北省,石家庄市,鹿泉区', '3', '50200', '0311', 'Luquan', '114.3134700', '38.0878200');
INSERT INTO `sys_cn_area` VALUES ('130111', '栾城区', '栾城', '130100', null, '中国,河北省,石家庄市,栾城区', '3', '51430', '0311', 'Luancheng', '114.6483400', '37.9002200');
INSERT INTO `sys_cn_area` VALUES ('130121', '井陉县', '井陉', '130100', null, '中国,河北省,石家庄市,井陉县', '3', '50300', '0311', 'Jingxing', '114.1425700', '38.0368800');
INSERT INTO `sys_cn_area` VALUES ('130123', '正定县', '正定', '130100', null, '中国,河北省,石家庄市,正定县', '3', '50800', '0311', 'Zhengding', '114.5729600', '38.1444500');
INSERT INTO `sys_cn_area` VALUES ('130125', '行唐县', '行唐', '130100', null, '中国,河北省,石家庄市,行唐县', '3', '50600', '0311', 'Xingtang', '114.5531600', '38.4365400');
INSERT INTO `sys_cn_area` VALUES ('130126', '灵寿县', '灵寿', '130100', null, '中国,河北省,石家庄市,灵寿县', '3', '50500', '0311', 'Lingshou', '114.3825900', '38.3084500');
INSERT INTO `sys_cn_area` VALUES ('130127', '高邑县', '高邑', '130100', null, '中国,河北省,石家庄市,高邑县', '3', '51330', '0311', 'Gaoyi', '114.6114200', '37.6155600');
INSERT INTO `sys_cn_area` VALUES ('130128', '深泽县', '深泽', '130100', null, '中国,河北省,石家庄市,深泽县', '3', '52560', '0311', 'Shenze', '115.2035800', '38.1835300');
INSERT INTO `sys_cn_area` VALUES ('130129', '赞皇县', '赞皇', '130100', null, '中国,河北省,石家庄市,赞皇县', '3', '51230', '0311', 'Zanhuang', '114.3877500', '37.6613500');
INSERT INTO `sys_cn_area` VALUES ('130130', '无极县', '无极', '130100', null, '中国,河北省,石家庄市,无极县', '3', '52460', '0311', 'Wuji', '114.9750900', '38.1765300');
INSERT INTO `sys_cn_area` VALUES ('130131', '平山县', '平山', '130100', null, '中国,河北省,石家庄市,平山县', '3', '50400', '0311', 'Pingshan', '114.1860000', '38.2599400');
INSERT INTO `sys_cn_area` VALUES ('130132', '元氏县', '元氏', '130100', null, '中国,河北省,石家庄市,元氏县', '3', '51130', '0311', 'Yuanshi', '114.5253900', '37.7666800');
INSERT INTO `sys_cn_area` VALUES ('130133', '赵县', '赵县', '130100', null, '中国,河北省,石家庄市,赵县', '3', '51530', '0311', 'Zhaoxian', '114.7761200', '37.7562800');
INSERT INTO `sys_cn_area` VALUES ('130181', '辛集市', '辛集', '130100', null, '中国,河北省,石家庄市,辛集市', '3', '52360', '0311', 'Xinji', '115.2062600', '37.9407900');
INSERT INTO `sys_cn_area` VALUES ('130183', '晋州市', '晋州', '130100', null, '中国,河北省,石家庄市,晋州市', '3', '52260', '0311', 'Jinzhou', '115.0434800', '38.0313500');
INSERT INTO `sys_cn_area` VALUES ('130184', '新乐市', '新乐', '130100', null, '中国,河北省,石家庄市,新乐市', '3', '50700', '0311', 'Xinle', '114.6898500', '38.3441700');
INSERT INTO `sys_cn_area` VALUES ('130200', '唐山市', '唐山', '130000', null, '中国,河北省,唐山市', '2', '63000', '0315', 'Tangshan', '118.1753930', '39.6351130');
INSERT INTO `sys_cn_area` VALUES ('130202', '路南区', '路南', '130200', null, '中国,河北省,唐山市,路南区', '3', '63000', '0315', 'Lunan', '118.1543100', '39.6250500');
INSERT INTO `sys_cn_area` VALUES ('130203', '路北区', '路北', '130200', null, '中国,河北省,唐山市,路北区', '3', '63000', '0315', 'Lubei', '118.2007900', '39.6243600');
INSERT INTO `sys_cn_area` VALUES ('130204', '古冶区', '古冶', '130200', null, '中国,河北省,唐山市,古冶区', '3', '63100', '0315', 'Guye', '118.4580300', '39.7199300');
INSERT INTO `sys_cn_area` VALUES ('130205', '开平区', '开平', '130200', null, '中国,河北省,唐山市,开平区', '3', '63021', '0315', 'Kaiping', '118.2617100', '39.6712800');
INSERT INTO `sys_cn_area` VALUES ('130207', '丰南区', '丰南', '130200', null, '中国,河北省,唐山市,丰南区', '3', '63300', '0315', 'Fengnan', '118.1128200', '39.5648300');
INSERT INTO `sys_cn_area` VALUES ('130208', '丰润区', '丰润', '130200', null, '中国,河北省,唐山市,丰润区', '3', '64000', '0315', 'Fengrun', '118.1297600', '39.8244000');
INSERT INTO `sys_cn_area` VALUES ('130209', '曹妃甸区', '曹妃甸', '130200', null, '中国,河北省,唐山市,曹妃甸区', '3', '63200', '0315', 'Caofeidian', '118.4603790', '39.2730700');
INSERT INTO `sys_cn_area` VALUES ('130223', '滦县', '滦县', '130200', null, '中国,河北省,唐山市,滦县', '3', '63700', '0315', 'Luanxian', '118.7034600', '39.7405600');
INSERT INTO `sys_cn_area` VALUES ('130224', '滦南县', '滦南', '130200', null, '中国,河北省,唐山市,滦南县', '3', '63500', '0315', 'Luannan', '118.6741000', '39.5039000');
INSERT INTO `sys_cn_area` VALUES ('130225', '乐亭县', '乐亭', '130200', null, '中国,河北省,唐山市,乐亭县', '3', '63600', '0315', 'Laoting', '118.9125000', '39.4256100');
INSERT INTO `sys_cn_area` VALUES ('130227', '迁西县', '迁西', '130200', null, '中国,河北省,唐山市,迁西县', '3', '64300', '0315', 'Qianxi', '118.3161600', '40.1458700');
INSERT INTO `sys_cn_area` VALUES ('130229', '玉田县', '玉田', '130200', null, '中国,河北省,唐山市,玉田县', '3', '64100', '0315', 'Yutian', '117.7388000', '39.9004900');
INSERT INTO `sys_cn_area` VALUES ('130281', '遵化市', '遵化', '130200', null, '中国,河北省,唐山市,遵化市', '3', '64200', '0315', 'Zunhua', '117.9644400', '40.1874100');
INSERT INTO `sys_cn_area` VALUES ('130283', '迁安市', '迁安', '130200', null, '中国,河北省,唐山市,迁安市', '3', '64400', '0315', 'Qian\'an', '118.7006800', '39.9983300');
INSERT INTO `sys_cn_area` VALUES ('130300', '秦皇岛市', '秦皇岛', '130000', null, '中国,河北省,秦皇岛市', '2', '66000', '0335', 'Qinhuangdao', '119.5865790', '39.9425310');
INSERT INTO `sys_cn_area` VALUES ('130302', '海港区', '海港', '130300', null, '中国,河北省,秦皇岛市,海港区', '3', '66000', '0335', 'Haigang', '119.6104600', '39.9345000');
INSERT INTO `sys_cn_area` VALUES ('130303', '山海关区', '山海关', '130300', null, '中国,河北省,秦皇岛市,山海关区', '3', '66200', '0335', 'Shanhaiguan', '119.7756300', '39.9786900');
INSERT INTO `sys_cn_area` VALUES ('130304', '北戴河区', '北戴河', '130300', null, '中国,河北省,秦皇岛市,北戴河区', '3', '66100', '0335', 'Beidaihe', '119.4838800', '39.8340800');
INSERT INTO `sys_cn_area` VALUES ('130321', '青龙满族自治县', '青龙', '130300', null, '中国,河北省,秦皇岛市,青龙满族自治县', '3', '66500', '0335', 'Qinglong', '118.9524200', '40.4074300');
INSERT INTO `sys_cn_area` VALUES ('130322', '昌黎县', '昌黎', '130300', null, '中国,河北省,秦皇岛市,昌黎县', '3', '66600', '0335', 'Changli', '119.1659500', '39.7088400');
INSERT INTO `sys_cn_area` VALUES ('130323', '抚宁县', '抚宁', '130300', null, '中国,河北省,秦皇岛市,抚宁县', '3', '66300', '0335', 'Funing', '119.2448700', '39.8753800');
INSERT INTO `sys_cn_area` VALUES ('130324', '卢龙县', '卢龙', '130300', null, '中国,河北省,秦皇岛市,卢龙县', '3', '66400', '0335', 'Lulong', '118.8928800', '39.8917600');
INSERT INTO `sys_cn_area` VALUES ('130400', '邯郸市', '邯郸', '130000', null, '中国,河北省,邯郸市', '2', '56002', '0310', 'Handan', '114.4906860', '36.6122730');
INSERT INTO `sys_cn_area` VALUES ('130402', '邯山区', '邯山', '130400', null, '中国,河北省,邯郸市,邯山区', '3', '56001', '0310', 'Hanshan', '114.4837500', '36.6000600');
INSERT INTO `sys_cn_area` VALUES ('130403', '丛台区', '丛台', '130400', null, '中国,河北省,邯郸市,丛台区', '3', '56002', '0310', 'Congtai', '114.4934300', '36.6184700');
INSERT INTO `sys_cn_area` VALUES ('130404', '复兴区', '复兴', '130400', null, '中国,河北省,邯郸市,复兴区', '3', '56003', '0310', 'Fuxing', '114.4592800', '36.6113400');
INSERT INTO `sys_cn_area` VALUES ('130406', '峰峰矿区', '峰峰矿区', '130400', null, '中国,河北省,邯郸市,峰峰矿区', '3', '56200', '0310', 'Fengfengkuangqu', '114.2114800', '36.4193700');
INSERT INTO `sys_cn_area` VALUES ('130421', '邯郸县', '邯郸', '130400', null, '中国,河北省,邯郸市,邯郸县', '3', '56101', '0310', 'Handan', '114.5310300', '36.5938500');
INSERT INTO `sys_cn_area` VALUES ('130423', '临漳县', '临漳', '130400', null, '中国,河北省,邯郸市,临漳县', '3', '56600', '0310', 'Linzhang', '114.6195000', '36.3346100');
INSERT INTO `sys_cn_area` VALUES ('130424', '成安县', '成安', '130400', null, '中国,河北省,邯郸市,成安县', '3', '56700', '0310', 'Cheng\'an', '114.6699500', '36.4441100');
INSERT INTO `sys_cn_area` VALUES ('130425', '大名县', '大名', '130400', null, '中国,河北省,邯郸市,大名县', '3', '56900', '0310', 'Daming', '115.1536200', '36.2799400');
INSERT INTO `sys_cn_area` VALUES ('130426', '涉县', '涉县', '130400', null, '中国,河北省,邯郸市,涉县', '3', '56400', '0310', 'Shexian', '113.6918300', '36.5807200');
INSERT INTO `sys_cn_area` VALUES ('130427', '磁县', '磁县', '130400', null, '中国,河北省,邯郸市,磁县', '3', '56500', '0310', 'Cixian', '114.3738700', '36.3739200');
INSERT INTO `sys_cn_area` VALUES ('130428', '肥乡县', '肥乡', '130400', null, '中国,河北省,邯郸市,肥乡县', '3', '57550', '0310', 'Feixiang', '114.7999800', '36.5480700');
INSERT INTO `sys_cn_area` VALUES ('130429', '永年县', '永年', '130400', null, '中国,河北省,邯郸市,永年县', '3', '57150', '0310', 'Yongnian', '114.4892500', '36.7835600');
INSERT INTO `sys_cn_area` VALUES ('130430', '邱县', '邱县', '130400', null, '中国,河北省,邯郸市,邱县', '3', '57450', '0310', 'Qiuxian', '115.1740700', '36.8208200');
INSERT INTO `sys_cn_area` VALUES ('130431', '鸡泽县', '鸡泽', '130400', null, '中国,河北省,邯郸市,鸡泽县', '3', '57350', '0310', 'Jize', '114.8742000', '36.9237400');
INSERT INTO `sys_cn_area` VALUES ('130432', '广平县', '广平', '130400', null, '中国,河北省,邯郸市,广平县', '3', '57650', '0310', 'Guangping', '114.9465300', '36.4804600');
INSERT INTO `sys_cn_area` VALUES ('130433', '馆陶县', '馆陶', '130400', null, '中国,河北省,邯郸市,馆陶县', '3', '57750', '0310', 'Guantao', '115.2991300', '36.5371900');
INSERT INTO `sys_cn_area` VALUES ('130434', '魏县', '魏县', '130400', null, '中国,河北省,邯郸市,魏县', '3', '56800', '0310', 'Weixian', '114.9351800', '36.3617100');
INSERT INTO `sys_cn_area` VALUES ('130435', '曲周县', '曲周', '130400', null, '中国,河北省,邯郸市,曲周县', '3', '57250', '0310', 'Quzhou', '114.9519600', '36.7767100');
INSERT INTO `sys_cn_area` VALUES ('130481', '武安市', '武安', '130400', null, '中国,河北省,邯郸市,武安市', '3', '56300', '0310', 'Wu\'an', '114.2015300', '36.6928100');
INSERT INTO `sys_cn_area` VALUES ('130500', '邢台市', '邢台', '130000', null, '中国,河北省,邢台市', '2', '54001', '0319', 'Xingtai', '114.5088510', '37.0682000');
INSERT INTO `sys_cn_area` VALUES ('130502', '桥东区', '桥东', '130500', null, '中国,河北省,邢台市,桥东区', '3', '54001', '0319', 'Qiaodong', '114.5072500', '37.0680100');
INSERT INTO `sys_cn_area` VALUES ('130503', '桥西区', '桥西', '130500', null, '中国,河北省,邢台市,桥西区', '3', '54000', '0319', 'Qiaoxi', '114.4680300', '37.0598400');
INSERT INTO `sys_cn_area` VALUES ('130521', '邢台县', '邢台', '130500', null, '中国,河北省,邢台市,邢台县', '3', '54001', '0319', 'Xingtai', '114.5657500', '37.0456000');
INSERT INTO `sys_cn_area` VALUES ('130522', '临城县', '临城', '130500', null, '中国,河北省,邢台市,临城县', '3', '54300', '0319', 'Lincheng', '114.5038700', '37.4397700');
INSERT INTO `sys_cn_area` VALUES ('130523', '内丘县', '内丘', '130500', null, '中国,河北省,邢台市,内丘县', '3', '54200', '0319', 'Neiqiu', '114.5121200', '37.2867100');
INSERT INTO `sys_cn_area` VALUES ('130524', '柏乡县', '柏乡', '130500', null, '中国,河北省,邢台市,柏乡县', '3', '55450', '0319', 'Baixiang', '114.6933200', '37.4824200');
INSERT INTO `sys_cn_area` VALUES ('130525', '隆尧县', '隆尧', '130500', null, '中国,河北省,邢台市,隆尧县', '3', '55350', '0319', 'Longyao', '114.7761500', '37.3535100');
INSERT INTO `sys_cn_area` VALUES ('130526', '任县', '任县', '130500', null, '中国,河北省,邢台市,任县', '3', '55150', '0319', 'Renxian', '114.6842000', '37.1257500');
INSERT INTO `sys_cn_area` VALUES ('130527', '南和县', '南和', '130500', null, '中国,河北省,邢台市,南和县', '3', '54400', '0319', 'Nanhe', '114.6837100', '37.0048800');
INSERT INTO `sys_cn_area` VALUES ('130528', '宁晋县', '宁晋', '130500', null, '中国,河北省,邢台市,宁晋县', '3', '55550', '0319', 'Ningjin', '114.9211700', '37.6169600');
INSERT INTO `sys_cn_area` VALUES ('130529', '巨鹿县', '巨鹿', '130500', null, '中国,河北省,邢台市,巨鹿县', '3', '55250', '0319', 'Julu', '115.0352400', '37.2180100');
INSERT INTO `sys_cn_area` VALUES ('130530', '新河县', '新河', '130500', null, '中国,河北省,邢台市,新河县', '3', '55650', '0319', 'Xinhe', '115.2498700', '37.5271800');
INSERT INTO `sys_cn_area` VALUES ('130531', '广宗县', '广宗', '130500', null, '中国,河北省,邢台市,广宗县', '3', '54600', '0319', 'Guangzong', '115.1425400', '37.0746000');
INSERT INTO `sys_cn_area` VALUES ('130532', '平乡县', '平乡', '130500', null, '中国,河北省,邢台市,平乡县', '3', '54500', '0319', 'Pingxiang', '115.0300200', '37.0631700');
INSERT INTO `sys_cn_area` VALUES ('130533', '威县', '威县', '130500', null, '中国,河北省,邢台市,威县', '3', '54700', '0319', 'Weixian', '115.2637000', '36.9768000');
INSERT INTO `sys_cn_area` VALUES ('130534', '清河县', '清河', '130500', null, '中国,河北省,邢台市,清河县', '3', '54800', '0319', 'Qinghe', '115.6647900', '37.0712200');
INSERT INTO `sys_cn_area` VALUES ('130535', '临西县', '临西', '130500', null, '中国,河北省,邢台市,临西县', '3', '54900', '0319', 'Linxi', '115.5009700', '36.8707800');
INSERT INTO `sys_cn_area` VALUES ('130581', '南宫市', '南宫', '130500', null, '中国,河北省,邢台市,南宫市', '3', '55750', '0319', 'Nangong', '115.3906800', '37.3579900');
INSERT INTO `sys_cn_area` VALUES ('130582', '沙河市', '沙河', '130500', null, '中国,河北省,邢台市,沙河市', '3', '54100', '0319', 'Shahe', '114.4981000', '36.8577000');
INSERT INTO `sys_cn_area` VALUES ('130600', '保定市', '保定', '130000', null, '中国,河北省,保定市', '2', '71052', '0312', 'Baoding', '115.4823310', '38.8676570');
INSERT INTO `sys_cn_area` VALUES ('130602', '新市区', '新市', '130600', null, '中国,河北省,保定市,新市区', '3', '71051', '0312', 'Xinshi', '115.4587000', '38.8775100');
INSERT INTO `sys_cn_area` VALUES ('130603', '北市区', '北市', '130600', null, '中国,河北省,保定市,北市区', '3', '71000', '0312', 'Beishi', '115.4971500', '38.8832200');
INSERT INTO `sys_cn_area` VALUES ('130604', '南市区', '南市', '130600', null, '中国,河北省,保定市,南市区', '3', '71001', '0312', 'Nanshi', '115.5285900', '38.8545500');
INSERT INTO `sys_cn_area` VALUES ('130621', '满城县', '满城', '130600', null, '中国,河北省,保定市,满城县', '3', '72150', '0312', 'Mancheng', '115.3229600', '38.9497200');
INSERT INTO `sys_cn_area` VALUES ('130622', '清苑县', '清苑', '130600', null, '中国,河北省,保定市,清苑县', '3', '71100', '0312', 'Qingyuan', '115.4926700', '38.7670900');
INSERT INTO `sys_cn_area` VALUES ('130623', '涞水县', '涞水', '130600', null, '中国,河北省,保定市,涞水县', '3', '74100', '0312', 'Laishui', '115.7151700', '39.3940400');
INSERT INTO `sys_cn_area` VALUES ('130624', '阜平县', '阜平', '130600', null, '中国,河北省,保定市,阜平县', '3', '73200', '0312', 'Fuping', '114.1968300', '38.8476300');
INSERT INTO `sys_cn_area` VALUES ('130625', '徐水县', '徐水', '130600', null, '中国,河北省,保定市,徐水县', '3', '72550', '0312', 'Xushui', '115.6582900', '39.0209900');
INSERT INTO `sys_cn_area` VALUES ('130626', '定兴县', '定兴', '130600', null, '中国,河北省,保定市,定兴县', '3', '72650', '0312', 'Dingxing', '115.8078600', '39.2631200');
INSERT INTO `sys_cn_area` VALUES ('130627', '唐县', '唐县', '130600', null, '中国,河北省,保定市,唐县', '3', '72350', '0312', 'Tangxian', '114.9851600', '38.7451300');
INSERT INTO `sys_cn_area` VALUES ('130628', '高阳县', '高阳', '130600', null, '中国,河北省,保定市,高阳县', '3', '71500', '0312', 'Gaoyang', '115.7788000', '38.7000300');
INSERT INTO `sys_cn_area` VALUES ('130629', '容城县', '容城', '130600', null, '中国,河北省,保定市,容城县', '3', '71700', '0312', 'Rongcheng', '115.8715800', '39.0535000');
INSERT INTO `sys_cn_area` VALUES ('130630', '涞源县', '涞源', '130600', null, '中国,河北省,保定市,涞源县', '3', '74300', '0312', 'Laiyuan', '114.6912800', '39.3538800');
INSERT INTO `sys_cn_area` VALUES ('130631', '望都县', '望都', '130600', null, '中国,河北省,保定市,望都县', '3', '72450', '0312', 'Wangdu', '115.1567000', '38.7099600');
INSERT INTO `sys_cn_area` VALUES ('130632', '安新县', '安新', '130600', null, '中国,河北省,保定市,安新县', '3', '71600', '0312', 'Anxin', '115.9355700', '38.9353200');
INSERT INTO `sys_cn_area` VALUES ('130633', '易县', '易县', '130600', null, '中国,河北省,保定市,易县', '3', '74200', '0312', 'Yixian', '115.4981000', '39.3488500');
INSERT INTO `sys_cn_area` VALUES ('130634', '曲阳县', '曲阳', '130600', null, '中国,河北省,保定市,曲阳县', '3', '73100', '0312', 'Quyang', '114.7012300', '38.6215400');
INSERT INTO `sys_cn_area` VALUES ('130635', '蠡县', '蠡县', '130600', null, '中国,河北省,保定市,蠡县', '3', '71400', '0312', 'Lixian', '115.5771700', '38.4897400');
INSERT INTO `sys_cn_area` VALUES ('130636', '顺平县', '顺平', '130600', null, '中国,河北省,保定市,顺平县', '3', '72250', '0312', 'Shunping', '115.1347000', '38.8385400');
INSERT INTO `sys_cn_area` VALUES ('130637', '博野县', '博野', '130600', null, '中国,河北省,保定市,博野县', '3', '71300', '0312', 'Boye', '115.4703300', '38.4564000');
INSERT INTO `sys_cn_area` VALUES ('130638', '雄县', '雄县', '130600', null, '中国,河北省,保定市,雄县', '3', '71800', '0312', 'Xiongxian', '116.1087300', '38.9944200');
INSERT INTO `sys_cn_area` VALUES ('130681', '涿州市', '涿州', '130600', null, '中国,河北省,保定市,涿州市', '3', '72750', '0312', 'Zhuozhou', '115.9806200', '39.4862200');
INSERT INTO `sys_cn_area` VALUES ('130682', '定州市', '定州', '130600', null, '中国,河北省,保定市,定州市', '3', '73000', '0312', 'Dingzhou', '114.9902000', '38.5162300');
INSERT INTO `sys_cn_area` VALUES ('130683', '安国市', '安国', '130600', null, '中国,河北省,保定市,安国市', '3', '71200', '0312', 'Anguo', '115.3232100', '38.4139100');
INSERT INTO `sys_cn_area` VALUES ('130684', '高碑店市', '高碑店', '130600', null, '中国,河北省,保定市,高碑店市', '3', '74000', '0312', 'Gaobeidian', '115.8736800', '39.3265500');
INSERT INTO `sys_cn_area` VALUES ('130700', '张家口市', '张家口', '130000', null, '中国,河北省,张家口市', '2', '75000', '0313', 'Zhangjiakou', '114.8840910', '40.8119010');
INSERT INTO `sys_cn_area` VALUES ('130702', '桥东区', '桥东', '130700', null, '中国,河北省,张家口市,桥东区', '3', '75000', '0313', 'Qiaodong', '114.8943000', '40.7884400');
INSERT INTO `sys_cn_area` VALUES ('130703', '桥西区', '桥西', '130700', null, '中国,河北省,张家口市,桥西区', '3', '75061', '0313', 'Qiaoxi', '114.8696200', '40.8194500');
INSERT INTO `sys_cn_area` VALUES ('130705', '宣化区', '宣化', '130700', null, '中国,河北省,张家口市,宣化区', '3', '75100', '0313', 'Xuanhua', '115.0654300', '40.6095700');
INSERT INTO `sys_cn_area` VALUES ('130706', '下花园区', '下花园', '130700', null, '中国,河北省,张家口市,下花园区', '3', '75300', '0313', 'Xiahuayuan', '115.2874400', '40.5023600');
INSERT INTO `sys_cn_area` VALUES ('130721', '宣化县', '宣化', '130700', null, '中国,河北省,张家口市,宣化县', '3', '75100', '0313', 'Xuanhua', '115.1549700', '40.5661800');
INSERT INTO `sys_cn_area` VALUES ('130722', '张北县', '张北', '130700', null, '中国,河北省,张家口市,张北县', '3', '76450', '0313', 'Zhangbei', '114.7143200', '41.1597700');
INSERT INTO `sys_cn_area` VALUES ('130723', '康保县', '康保', '130700', null, '中国,河北省,张家口市,康保县', '3', '76650', '0313', 'Kangbao', '114.6003100', '41.8522500');
INSERT INTO `sys_cn_area` VALUES ('130724', '沽源县', '沽源', '130700', null, '中国,河北省,张家口市,沽源县', '3', '76550', '0313', 'Guyuan', '115.6885900', '41.6695900');
INSERT INTO `sys_cn_area` VALUES ('130725', '尚义县', '尚义', '130700', null, '中国,河北省,张家口市,尚义县', '3', '76750', '0313', 'Shangyi', '113.9713400', '41.0778200');
INSERT INTO `sys_cn_area` VALUES ('130726', '蔚县', '蔚县', '130700', null, '中国,河北省,张家口市,蔚县', '3', '75700', '0313', 'Yuxian', '114.5889200', '39.8406700');
INSERT INTO `sys_cn_area` VALUES ('130727', '阳原县', '阳原', '130700', null, '中国,河北省,张家口市,阳原县', '3', '75800', '0313', 'Yangyuan', '114.1505100', '40.1036100');
INSERT INTO `sys_cn_area` VALUES ('130728', '怀安县', '怀安', '130700', null, '中国,河北省,张家口市,怀安县', '3', '76150', '0313', 'Huai\'an', '114.3855900', '40.6742500');
INSERT INTO `sys_cn_area` VALUES ('130729', '万全县', '万全', '130700', null, '中国,河北省,张家口市,万全县', '3', '76250', '0313', 'Wanquan', '114.7405000', '40.7669400');
INSERT INTO `sys_cn_area` VALUES ('130730', '怀来县', '怀来', '130700', null, '中国,河北省,张家口市,怀来县', '3', '75400', '0313', 'Huailai', '115.5177300', '40.4153600');
INSERT INTO `sys_cn_area` VALUES ('130731', '涿鹿县', '涿鹿', '130700', null, '中国,河北省,张家口市,涿鹿县', '3', '75600', '0313', 'Zhuolu', '115.2240300', '40.3763600');
INSERT INTO `sys_cn_area` VALUES ('130732', '赤城县', '赤城', '130700', null, '中国,河北省,张家口市,赤城县', '3', '75500', '0313', 'Chicheng', '115.8318700', '40.9143800');
INSERT INTO `sys_cn_area` VALUES ('130733', '崇礼县', '崇礼', '130700', null, '中国,河北省,张家口市,崇礼县', '3', '76350', '0313', 'Chongli', '115.2799300', '40.9751900');
INSERT INTO `sys_cn_area` VALUES ('130800', '承德市', '承德', '130000', null, '中国,河北省,承德市', '2', '67000', '0314', 'Chengde', '117.9391520', '40.9762040');
INSERT INTO `sys_cn_area` VALUES ('130802', '双桥区', '双桥', '130800', null, '中国,河北省,承德市,双桥区', '3', '67000', '0314', 'Shuangqiao', '117.9432000', '40.9746600');
INSERT INTO `sys_cn_area` VALUES ('130803', '双滦区', '双滦', '130800', null, '中国,河北省,承德市,双滦区', '3', '67001', '0314', 'Shuangluan', '117.7448700', '40.9537500');
INSERT INTO `sys_cn_area` VALUES ('130804', '鹰手营子矿区', '鹰手营子矿区', '130800', null, '中国,河北省,承德市,鹰手营子矿区', '3', '67200', '0314', 'Yingshouyingzikuangqu', '117.6598500', '40.5474400');
INSERT INTO `sys_cn_area` VALUES ('130821', '承德县', '承德', '130800', null, '中国,河北省,承德市,承德县', '3', '67400', '0314', 'Chengde', '118.1763900', '40.7698500');
INSERT INTO `sys_cn_area` VALUES ('130822', '兴隆县', '兴隆', '130800', null, '中国,河北省,承德市,兴隆县', '3', '67300', '0314', 'Xinglong', '117.5007300', '40.4170900');
INSERT INTO `sys_cn_area` VALUES ('130823', '平泉县', '平泉', '130800', null, '中国,河北省,承德市,平泉县', '3', '67500', '0314', 'Pingquan', '118.7019600', '41.0183900');
INSERT INTO `sys_cn_area` VALUES ('130824', '滦平县', '滦平', '130800', null, '中国,河北省,承德市,滦平县', '3', '68250', '0314', 'Luanping', '117.3327600', '40.9414800');
INSERT INTO `sys_cn_area` VALUES ('130825', '隆化县', '隆化', '130800', null, '中国,河北省,承德市,隆化县', '3', '68150', '0314', 'Longhua', '117.7297000', '41.3141200');
INSERT INTO `sys_cn_area` VALUES ('130826', '丰宁满族自治县', '丰宁', '130800', null, '中国,河北省,承德市,丰宁满族自治县', '3', '68350', '0314', 'Fengning', '116.6492000', '41.2048100');
INSERT INTO `sys_cn_area` VALUES ('130827', '宽城满族自治县', '宽城', '130800', null, '中国,河北省,承德市,宽城满族自治县', '3', '67600', '0314', 'Kuancheng', '118.4917600', '40.6082900');
INSERT INTO `sys_cn_area` VALUES ('130828', '围场满族蒙古族自治县', '围场', '130800', null, '中国,河北省,承德市,围场满族蒙古族自治县', '3', '68450', '0314', 'Weichang', '117.7601000', '41.9436800');
INSERT INTO `sys_cn_area` VALUES ('130900', '沧州市', '沧州', '130000', null, '中国,河北省,沧州市', '2', '61001', '0317', 'Cangzhou', '116.8574610', '38.3105820');
INSERT INTO `sys_cn_area` VALUES ('130902', '新华区', '新华', '130900', null, '中国,河北省,沧州市,新华区', '3', '61000', '0317', 'Xinhua', '116.8664300', '38.3143800');
INSERT INTO `sys_cn_area` VALUES ('130903', '运河区', '运河', '130900', null, '中国,河北省,沧州市,运河区', '3', '61001', '0317', 'Yunhe', '116.8570600', '38.3135200');
INSERT INTO `sys_cn_area` VALUES ('130921', '沧县', '沧县', '130900', null, '中国,河北省,沧州市,沧县', '3', '61000', '0317', 'Cangxian', '116.8781700', '38.2936100');
INSERT INTO `sys_cn_area` VALUES ('130922', '青县', '青县', '130900', null, '中国,河北省,沧州市,青县', '3', '62650', '0317', 'Qingxian', '116.8031600', '38.5834500');
INSERT INTO `sys_cn_area` VALUES ('130923', '东光县', '东光', '130900', null, '中国,河北省,沧州市,东光县', '3', '61600', '0317', 'Dongguang', '116.5366800', '37.8857000');
INSERT INTO `sys_cn_area` VALUES ('130924', '海兴县', '海兴', '130900', null, '中国,河北省,沧州市,海兴县', '3', '61200', '0317', 'Haixing', '117.4975800', '38.1395800');
INSERT INTO `sys_cn_area` VALUES ('130925', '盐山县', '盐山', '130900', null, '中国,河北省,沧州市,盐山县', '3', '61300', '0317', 'Yanshan', '117.2309200', '38.0564700');
INSERT INTO `sys_cn_area` VALUES ('130926', '肃宁县', '肃宁', '130900', null, '中国,河北省,沧州市,肃宁县', '3', '62350', '0317', 'Suning', '115.8297100', '38.4227200');
INSERT INTO `sys_cn_area` VALUES ('130927', '南皮县', '南皮', '130900', null, '中国,河北省,沧州市,南皮县', '3', '61500', '0317', 'Nanpi', '116.7022400', '38.0410900');
INSERT INTO `sys_cn_area` VALUES ('130928', '吴桥县', '吴桥', '130900', null, '中国,河北省,沧州市,吴桥县', '3', '61800', '0317', 'Wuqiao', '116.3847000', '37.6254600');
INSERT INTO `sys_cn_area` VALUES ('130929', '献县', '献县', '130900', null, '中国,河北省,沧州市,献县', '3', '62250', '0317', 'Xianxian', '116.1269500', '38.1922800');
INSERT INTO `sys_cn_area` VALUES ('130930', '孟村回族自治县', '孟村', '130900', null, '中国,河北省,沧州市,孟村回族自治县', '3', '61400', '0317', 'Mengcun', '117.1041200', '38.0533800');
INSERT INTO `sys_cn_area` VALUES ('130981', '泊头市', '泊头', '130900', null, '中国,河北省,沧州市,泊头市', '3', '62150', '0317', 'Botou', '116.5782400', '38.0835900');
INSERT INTO `sys_cn_area` VALUES ('130982', '任丘市', '任丘', '130900', null, '中国,河北省,沧州市,任丘市', '3', '62550', '0317', 'Renqiu', '116.1033000', '38.7112400');
INSERT INTO `sys_cn_area` VALUES ('130983', '黄骅市', '黄骅', '130900', null, '中国,河北省,沧州市,黄骅市', '3', '61100', '0317', 'Huanghua', '117.3388300', '38.3706000');
INSERT INTO `sys_cn_area` VALUES ('130984', '河间市', '河间', '130900', null, '中国,河北省,沧州市,河间市', '3', '62450', '0317', 'Hejian', '116.0993000', '38.4454900');
INSERT INTO `sys_cn_area` VALUES ('131000', '廊坊市', '廊坊', '130000', null, '中国,河北省,廊坊市', '2', '65000', '0316', 'Langfang', '116.7138730', '39.5292440');
INSERT INTO `sys_cn_area` VALUES ('131002', '安次区', '安次', '131000', null, '中国,河北省,廊坊市,安次区', '3', '65000', '0316', 'Anci', '116.7030800', '39.5205700');
INSERT INTO `sys_cn_area` VALUES ('131003', '广阳区', '广阳', '131000', null, '中国,河北省,廊坊市,广阳区', '3', '65000', '0316', 'Guangyang', '116.7106900', '39.5227800');
INSERT INTO `sys_cn_area` VALUES ('131022', '固安县', '固安', '131000', null, '中国,河北省,廊坊市,固安县', '3', '65500', '0316', 'Gu\'an', '116.2991600', '39.4383300');
INSERT INTO `sys_cn_area` VALUES ('131023', '永清县', '永清', '131000', null, '中国,河北省,廊坊市,永清县', '3', '65600', '0316', 'Yongqing', '116.5009100', '39.3206900');
INSERT INTO `sys_cn_area` VALUES ('131024', '香河县', '香河', '131000', null, '中国,河北省,廊坊市,香河县', '3', '65400', '0316', 'Xianghe', '117.0063400', '39.7613300');
INSERT INTO `sys_cn_area` VALUES ('131025', '大城县', '大城', '131000', null, '中国,河北省,廊坊市,大城县', '3', '65900', '0316', 'Daicheng', '116.6535300', '38.7053400');
INSERT INTO `sys_cn_area` VALUES ('131026', '文安县', '文安', '131000', null, '中国,河北省,廊坊市,文安县', '3', '65800', '0316', 'Wen\'an', '116.4584600', '38.8732500');
INSERT INTO `sys_cn_area` VALUES ('131028', '大厂回族自治县', '大厂', '131000', null, '中国,河北省,廊坊市,大厂回族自治县', '3', '65300', '0316', 'Dachang', '116.9891600', '39.8864900');
INSERT INTO `sys_cn_area` VALUES ('131081', '霸州市', '霸州', '131000', null, '中国,河北省,廊坊市,霸州市', '3', '65700', '0316', 'Bazhou', '116.3915400', '39.1256900');
INSERT INTO `sys_cn_area` VALUES ('131082', '三河市', '三河', '131000', null, '中国,河北省,廊坊市,三河市', '3', '65200', '0316', 'Sanhe', '117.0722900', '39.9835800');
INSERT INTO `sys_cn_area` VALUES ('131100', '衡水市', '衡水', '130000', null, '中国,河北省,衡水市', '2', '53000', '0318', 'Hengshui', '115.6659930', '37.7350970');
INSERT INTO `sys_cn_area` VALUES ('131102', '桃城区', '桃城', '131100', null, '中国,河北省,衡水市,桃城区', '3', '53000', '0318', 'Taocheng', '115.6752900', '37.7349900');
INSERT INTO `sys_cn_area` VALUES ('131121', '枣强县', '枣强', '131100', null, '中国,河北省,衡水市,枣强县', '3', '53100', '0318', 'Zaoqiang', '115.7257600', '37.5102700');
INSERT INTO `sys_cn_area` VALUES ('131122', '武邑县', '武邑', '131100', null, '中国,河北省,衡水市,武邑县', '3', '53400', '0318', 'Wuyi', '115.8874800', '37.8018100');
INSERT INTO `sys_cn_area` VALUES ('131123', '武强县', '武强', '131100', null, '中国,河北省,衡水市,武强县', '3', '53300', '0318', 'Wuqiang', '115.9822600', '38.0413800');
INSERT INTO `sys_cn_area` VALUES ('131124', '饶阳县', '饶阳', '131100', null, '中国,河北省,衡水市,饶阳县', '3', '53900', '0318', 'Raoyang', '115.7255800', '38.2352900');
INSERT INTO `sys_cn_area` VALUES ('131125', '安平县', '安平', '131100', null, '中国,河北省,衡水市,安平县', '3', '53600', '0318', 'Anping', '115.5187600', '38.2338800');
INSERT INTO `sys_cn_area` VALUES ('131126', '故城县', '故城', '131100', null, '中国,河北省,衡水市,故城县', '3', '53800', '0318', 'Gucheng', '115.9707600', '37.3477300');
INSERT INTO `sys_cn_area` VALUES ('131127', '景县', '景县', '131100', null, '中国,河北省,衡水市,景县', '3', '53500', '0318', 'Jingxian', '116.2690400', '37.6926000');
INSERT INTO `sys_cn_area` VALUES ('131128', '阜城县', '阜城', '131100', null, '中国,河北省,衡水市,阜城县', '3', '53700', '0318', 'Fucheng', '116.1443100', '37.8688100');
INSERT INTO `sys_cn_area` VALUES ('131181', '冀州市', '冀州', '131100', null, '中国,河北省,衡水市,冀州市', '3', '53200', '0318', 'Jizhou', '115.5793400', '37.5508200');
INSERT INTO `sys_cn_area` VALUES ('131182', '深州市', '深州', '131100', null, '中国,河北省,衡水市,深州市', '3', '53800', '0318', 'Shenzhou', '115.5599300', '38.0010900');
INSERT INTO `sys_cn_area` VALUES ('140000', '山西省', '山西', '100000', null, '中国,山西省', '1', null, '', 'Shanxi', '112.5492480', '37.8570140');
INSERT INTO `sys_cn_area` VALUES ('140100', '太原市', '太原', '140000', null, '中国,山西省,太原市', '2', '30082', '0351', 'Taiyuan', '112.5492480', '37.8570140');
INSERT INTO `sys_cn_area` VALUES ('140105', '小店区', '小店', '140100', null, '中国,山西省,太原市,小店区', '3', '30032', '0351', 'Xiaodian', '112.5687800', '37.7356500');
INSERT INTO `sys_cn_area` VALUES ('140106', '迎泽区', '迎泽', '140100', null, '中国,山西省,太原市,迎泽区', '3', '30002', '0351', 'Yingze', '112.5633800', '37.8632600');
INSERT INTO `sys_cn_area` VALUES ('140107', '杏花岭区', '杏花岭', '140100', null, '中国,山西省,太原市,杏花岭区', '3', '30009', '0351', 'Xinghualing', '112.5623700', '37.8842900');
INSERT INTO `sys_cn_area` VALUES ('140108', '尖草坪区', '尖草坪', '140100', null, '中国,山西省,太原市,尖草坪区', '3', '30023', '0351', 'Jiancaoping', '112.4870900', '37.9419300');
INSERT INTO `sys_cn_area` VALUES ('140109', '万柏林区', '万柏林', '140100', null, '中国,山西省,太原市,万柏林区', '3', '30024', '0351', 'Wanbailin', '112.5155300', '37.8592300');
INSERT INTO `sys_cn_area` VALUES ('140110', '晋源区', '晋源', '140100', null, '中国,山西省,太原市,晋源区', '3', '30025', '0351', 'Jinyuan', '112.4798500', '37.7247900');
INSERT INTO `sys_cn_area` VALUES ('140121', '清徐县', '清徐', '140100', null, '中国,山西省,太原市,清徐县', '3', '30400', '0351', 'Qingxu', '112.3588800', '37.6075800');
INSERT INTO `sys_cn_area` VALUES ('140122', '阳曲县', '阳曲', '140100', null, '中国,山西省,太原市,阳曲县', '3', '30100', '0351', 'Yangqu', '112.6786100', '38.0598900');
INSERT INTO `sys_cn_area` VALUES ('140123', '娄烦县', '娄烦', '140100', null, '中国,山西省,太原市,娄烦县', '3', '30300', '0351', 'Loufan', '111.7947300', '38.0668900');
INSERT INTO `sys_cn_area` VALUES ('140181', '古交市', '古交', '140100', null, '中国,山西省,太原市,古交市', '3', '30200', '0351', 'Gujiao', '112.1691800', '37.9098300');
INSERT INTO `sys_cn_area` VALUES ('140200', '大同市', '大同', '140000', null, '中国,山西省,大同市', '2', '37008', '0352', 'Datong', '113.2952590', '40.0903100');
INSERT INTO `sys_cn_area` VALUES ('140202', '城区', '城区', '140200', null, '中国,山西省,大同市,城区', '3', '37008', '0352', 'Chengqu', '113.2980000', '40.0756600');
INSERT INTO `sys_cn_area` VALUES ('140203', '矿区', '矿区', '140200', null, '中国,山西省,大同市,矿区', '3', '37003', '0352', 'Kuangqu', '113.1772000', '40.0368500');
INSERT INTO `sys_cn_area` VALUES ('140211', '南郊区', '南郊', '140200', null, '中国,山西省,大同市,南郊区', '3', '37001', '0352', 'Nanjiao', '113.1494700', '40.0053900');
INSERT INTO `sys_cn_area` VALUES ('140212', '新荣区', '新荣', '140200', null, '中国,山西省,大同市,新荣区', '3', '37002', '0352', 'Xinrong', '113.1350400', '40.2561800');
INSERT INTO `sys_cn_area` VALUES ('140221', '阳高县', '阳高', '140200', null, '中国,山西省,大同市,阳高县', '3', '38100', '0352', 'Yanggao', '113.7501200', '40.3625600');
INSERT INTO `sys_cn_area` VALUES ('140222', '天镇县', '天镇', '140200', null, '中国,山西省,大同市,天镇县', '3', '38200', '0352', 'Tianzhen', '114.0931000', '40.4229900');
INSERT INTO `sys_cn_area` VALUES ('140223', '广灵县', '广灵', '140200', null, '中国,山西省,大同市,广灵县', '3', '37500', '0352', 'Guangling', '114.2820400', '39.7608200');
INSERT INTO `sys_cn_area` VALUES ('140224', '灵丘县', '灵丘', '140200', null, '中国,山西省,大同市,灵丘县', '3', '34400', '0352', 'Lingqiu', '114.2367200', '39.4404300');
INSERT INTO `sys_cn_area` VALUES ('140225', '浑源县', '浑源', '140200', null, '中国,山西省,大同市,浑源县', '3', '37400', '0352', 'Hunyuan', '113.6955200', '39.6996200');
INSERT INTO `sys_cn_area` VALUES ('140226', '左云县', '左云', '140200', null, '中国,山西省,大同市,左云县', '3', '37100', '0352', 'Zuoyun', '112.7026600', '40.0133600');
INSERT INTO `sys_cn_area` VALUES ('140227', '大同县', '大同', '140200', null, '中国,山西省,大同市,大同县', '3', '37300', '0352', 'Datong', '113.6121200', '40.0401200');
INSERT INTO `sys_cn_area` VALUES ('140300', '阳泉市', '阳泉', '140000', null, '中国,山西省,阳泉市', '2', '45000', '0353', 'Yangquan', '113.5832850', '37.8611880');
INSERT INTO `sys_cn_area` VALUES ('140302', '城区', '城区', '140300', null, '中国,山西省,阳泉市,城区', '3', '45000', '0353', 'Chengqu', '113.6006900', '37.8474000');
INSERT INTO `sys_cn_area` VALUES ('140303', '矿区', '矿区', '140300', null, '中国,山西省,阳泉市,矿区', '3', '45000', '0353', 'Kuangqu', '113.5567700', '37.8689500');
INSERT INTO `sys_cn_area` VALUES ('140311', '郊区', '郊区', '140300', null, '中国,山西省,阳泉市,郊区', '3', '45011', '0353', 'Jiaoqu', '113.5853900', '37.9413900');
INSERT INTO `sys_cn_area` VALUES ('140321', '平定县', '平定', '140300', null, '中国,山西省,阳泉市,平定县', '3', '45200', '0353', 'Pingding', '113.6578900', '37.7860100');
INSERT INTO `sys_cn_area` VALUES ('140322', '盂县', '盂县', '140300', null, '中国,山西省,阳泉市,盂县', '3', '45100', '0353', 'Yuxian', '113.4123500', '38.0857900');
INSERT INTO `sys_cn_area` VALUES ('140400', '长治市', '长治', '140000', null, '中国,山西省,长治市', '2', '46000', '0355', 'Changzhi', '113.1135560', '36.1911120');
INSERT INTO `sys_cn_area` VALUES ('140402', '城区', '城区', '140400', null, '中国,山西省,长治市,城区', '3', '46011', '0355', 'Chengqu', '113.1230800', '36.2035100');
INSERT INTO `sys_cn_area` VALUES ('140411', '郊区', '郊区', '140400', null, '中国,山西省,长治市,郊区', '3', '46011', '0355', 'Jiaoqu', '113.1265300', '36.1991800');
INSERT INTO `sys_cn_area` VALUES ('140421', '长治县', '长治', '140400', null, '中国,山西省,长治市,长治县', '3', '47100', '0355', 'Changzhi', '113.0479100', '36.0472200');
INSERT INTO `sys_cn_area` VALUES ('140423', '襄垣县', '襄垣', '140400', null, '中国,山西省,长治市,襄垣县', '3', '46200', '0355', 'Xiangyuan', '113.0515700', '36.5352700');
INSERT INTO `sys_cn_area` VALUES ('140424', '屯留县', '屯留', '140400', null, '中国,山西省,长治市,屯留县', '3', '46100', '0355', 'Tunliu', '112.8919600', '36.3157900');
INSERT INTO `sys_cn_area` VALUES ('140425', '平顺县', '平顺', '140400', null, '中国,山西省,长治市,平顺县', '3', '47400', '0355', 'Pingshun', '113.4360300', '36.2000500');
INSERT INTO `sys_cn_area` VALUES ('140426', '黎城县', '黎城', '140400', null, '中国,山西省,长治市,黎城县', '3', '47600', '0355', 'Licheng', '113.3876600', '36.5030100');
INSERT INTO `sys_cn_area` VALUES ('140427', '壶关县', '壶关', '140400', null, '中国,山西省,长治市,壶关县', '3', '47300', '0355', 'Huguan', '113.2070000', '36.1130100');
INSERT INTO `sys_cn_area` VALUES ('140428', '长子县', '长子', '140400', null, '中国,山西省,长治市,长子县', '3', '46600', '0355', 'Zhangzi', '112.8773100', '36.1212500');
INSERT INTO `sys_cn_area` VALUES ('140429', '武乡县', '武乡', '140400', null, '中国,山西省,长治市,武乡县', '3', '46300', '0355', 'Wuxiang', '112.8634300', '36.8368700');
INSERT INTO `sys_cn_area` VALUES ('140430', '沁县', '沁县', '140400', null, '中国,山西省,长治市,沁县', '3', '46400', '0355', 'Qinxian', '112.6986300', '36.7562800');
INSERT INTO `sys_cn_area` VALUES ('140431', '沁源县', '沁源', '140400', null, '中国,山西省,长治市,沁源县', '3', '46500', '0355', 'Qinyuan', '112.3375800', '36.5000800');
INSERT INTO `sys_cn_area` VALUES ('140481', '潞城市', '潞城', '140400', null, '中国,山西省,长治市,潞城市', '3', '47500', '0355', 'Lucheng', '113.2288800', '36.3341400');
INSERT INTO `sys_cn_area` VALUES ('140500', '晋城市', '晋城', '140000', null, '中国,山西省,晋城市', '2', '48000', '0356', 'Jincheng', '112.8512740', '35.4975530');
INSERT INTO `sys_cn_area` VALUES ('140502', '城区', '城区', '140500', null, '中国,山西省,晋城市,城区', '3', '48000', '0356', 'Chengqu', '112.8531900', '35.5017500');
INSERT INTO `sys_cn_area` VALUES ('140521', '沁水县', '沁水', '140500', null, '中国,山西省,晋城市,沁水县', '3', '48200', '0356', 'Qinshui', '112.1871000', '35.6910200');
INSERT INTO `sys_cn_area` VALUES ('140522', '阳城县', '阳城', '140500', null, '中国,山西省,晋城市,阳城县', '3', '48100', '0356', 'Yangcheng', '112.4148500', '35.4861400');
INSERT INTO `sys_cn_area` VALUES ('140524', '陵川县', '陵川', '140500', null, '中国,山西省,晋城市,陵川县', '3', '48300', '0356', 'Lingchuan', '113.2806000', '35.7753200');
INSERT INTO `sys_cn_area` VALUES ('140525', '泽州县', '泽州', '140500', null, '中国,山西省,晋城市,泽州县', '3', '48012', '0356', 'Zezhou', '112.8394700', '35.5078900');
INSERT INTO `sys_cn_area` VALUES ('140581', '高平市', '高平', '140500', null, '中国,山西省,晋城市,高平市', '3', '48400', '0356', 'Gaoping', '112.9228800', '35.7970500');
INSERT INTO `sys_cn_area` VALUES ('140600', '朔州市', '朔州', '140000', null, '中国,山西省,朔州市', '2', '38500', '0349', 'Shuozhou', '112.4333870', '39.3312610');
INSERT INTO `sys_cn_area` VALUES ('140602', '朔城区', '朔城', '140600', null, '中国,山西省,朔州市,朔城区', '3', '36000', '0349', 'Shuocheng', '112.4318900', '39.3198200');
INSERT INTO `sys_cn_area` VALUES ('140603', '平鲁区', '平鲁', '140600', null, '中国,山西省,朔州市,平鲁区', '3', '38600', '0349', 'Pinglu', '112.2883300', '39.5115500');
INSERT INTO `sys_cn_area` VALUES ('140621', '山阴县', '山阴', '140600', null, '中国,山西省,朔州市,山阴县', '3', '36900', '0349', 'Shanyin', '112.8166200', '39.5269700');
INSERT INTO `sys_cn_area` VALUES ('140622', '应县', '应县', '140600', null, '中国,山西省,朔州市,应县', '3', '37600', '0349', 'Yingxian', '113.1905200', '39.5527900');
INSERT INTO `sys_cn_area` VALUES ('140623', '右玉县', '右玉', '140600', null, '中国,山西省,朔州市,右玉县', '3', '37200', '0349', 'Youyu', '112.4690200', '39.9901100');
INSERT INTO `sys_cn_area` VALUES ('140624', '怀仁县', '怀仁', '140600', null, '中国,山西省,朔州市,怀仁县', '3', '38300', '0349', 'Huairen', '113.1000900', '39.8280600');
INSERT INTO `sys_cn_area` VALUES ('140700', '晋中市', '晋中', '140000', null, '中国,山西省,晋中市', '2', '30600', '0354', 'Jinzhong', '112.7364650', '37.6964950');
INSERT INTO `sys_cn_area` VALUES ('140702', '榆次区', '榆次', '140700', null, '中国,山西省,晋中市,榆次区', '3', '30600', '0354', 'Yuci', '112.7078800', '37.6978000');
INSERT INTO `sys_cn_area` VALUES ('140721', '榆社县', '榆社', '140700', null, '中国,山西省,晋中市,榆社县', '3', '31800', '0354', 'Yushe', '112.9755800', '37.0721000');
INSERT INTO `sys_cn_area` VALUES ('140722', '左权县', '左权', '140700', null, '中国,山西省,晋中市,左权县', '3', '32600', '0354', 'Zuoquan', '113.3791800', '37.0823500');
INSERT INTO `sys_cn_area` VALUES ('140723', '和顺县', '和顺', '140700', null, '中国,山西省,晋中市,和顺县', '3', '32700', '0354', 'Heshun', '113.5698800', '37.3296300');
INSERT INTO `sys_cn_area` VALUES ('140724', '昔阳县', '昔阳', '140700', null, '中国,山西省,晋中市,昔阳县', '3', '45300', '0354', 'Xiyang', '113.7051700', '37.6186300');
INSERT INTO `sys_cn_area` VALUES ('140725', '寿阳县', '寿阳', '140700', null, '中国,山西省,晋中市,寿阳县', '3', '45400', '0354', 'Shouyang', '113.1749500', '37.8889900');
INSERT INTO `sys_cn_area` VALUES ('140726', '太谷县', '太谷', '140700', null, '中国,山西省,晋中市,太谷县', '3', '30800', '0354', 'Taigu', '112.5524600', '37.4216100');
INSERT INTO `sys_cn_area` VALUES ('140727', '祁县', '祁县', '140700', null, '中国,山西省,晋中市,祁县', '3', '30900', '0354', 'Qixian', '112.3335800', '37.3579000');
INSERT INTO `sys_cn_area` VALUES ('140728', '平遥县', '平遥', '140700', null, '中国,山西省,晋中市,平遥县', '3', '31100', '0354', 'Pingyao', '112.1755300', '37.1892000');
INSERT INTO `sys_cn_area` VALUES ('140729', '灵石县', '灵石', '140700', null, '中国,山西省,晋中市,灵石县', '3', '31300', '0354', 'Lingshi', '111.7774000', '36.8481400');
INSERT INTO `sys_cn_area` VALUES ('140781', '介休市', '介休', '140700', null, '中国,山西省,晋中市,介休市', '3', '32000', '0354', 'Jiexiu', '111.9182400', '37.0277100');
INSERT INTO `sys_cn_area` VALUES ('140800', '运城市', '运城', '140000', null, '中国,山西省,运城市', '2', '44000', '0359', 'Yuncheng', '111.0039570', '35.0227780');
INSERT INTO `sys_cn_area` VALUES ('140802', '盐湖区', '盐湖', '140800', null, '中国,山西省,运城市,盐湖区', '3', '44000', '0359', 'Yanhu', '110.9982700', '35.0151000');
INSERT INTO `sys_cn_area` VALUES ('140821', '临猗县', '临猗', '140800', null, '中国,山西省,运城市,临猗县', '3', '44100', '0359', 'Linyi', '110.7743200', '35.1445500');
INSERT INTO `sys_cn_area` VALUES ('140822', '万荣县', '万荣', '140800', null, '中国,山西省,运城市,万荣县', '3', '44200', '0359', 'Wanrong', '110.8365700', '35.4155600');
INSERT INTO `sys_cn_area` VALUES ('140823', '闻喜县', '闻喜', '140800', null, '中国,山西省,运城市,闻喜县', '3', '43800', '0359', 'Wenxi', '111.2226500', '35.3555300');
INSERT INTO `sys_cn_area` VALUES ('140824', '稷山县', '稷山', '140800', null, '中国,山西省,运城市,稷山县', '3', '43200', '0359', 'Jishan', '110.9792400', '35.5999300');
INSERT INTO `sys_cn_area` VALUES ('140825', '新绛县', '新绛', '140800', null, '中国,山西省,运城市,新绛县', '3', '43100', '0359', 'Xinjiang', '111.2250900', '35.6156600');
INSERT INTO `sys_cn_area` VALUES ('140826', '绛县', '绛县', '140800', null, '中国,山西省,运城市,绛县', '3', '43600', '0359', 'Jiangxian', '111.5666800', '35.4909600');
INSERT INTO `sys_cn_area` VALUES ('140827', '垣曲县', '垣曲', '140800', null, '中国,山西省,运城市,垣曲县', '3', '43700', '0359', 'Yuanqu', '111.6716600', '35.2992300');
INSERT INTO `sys_cn_area` VALUES ('140828', '夏县', '夏县', '140800', null, '中国,山西省,运城市,夏县', '3', '44400', '0359', 'Xiaxian', '111.2196600', '35.1412100');
INSERT INTO `sys_cn_area` VALUES ('140829', '平陆县', '平陆', '140800', null, '中国,山西省,运城市,平陆县', '3', '44300', '0359', 'Pinglu', '111.2170400', '34.8377200');
INSERT INTO `sys_cn_area` VALUES ('140830', '芮城县', '芮城', '140800', null, '中国,山西省,运城市,芮城县', '3', '44600', '0359', 'Ruicheng', '110.6945500', '34.6938400');
INSERT INTO `sys_cn_area` VALUES ('140881', '永济市', '永济', '140800', null, '中国,山西省,运城市,永济市', '3', '44500', '0359', 'Yongji', '110.4453700', '34.8655600');
INSERT INTO `sys_cn_area` VALUES ('140882', '河津市', '河津', '140800', null, '中国,山西省,运城市,河津市', '3', '43300', '0359', 'Hejin', '110.7116000', '35.5947800');
INSERT INTO `sys_cn_area` VALUES ('140900', '忻州市', '忻州', '140000', null, '中国,山西省,忻州市', '2', '34000', '0350', 'Xinzhou', '112.7335380', '38.4176900');
INSERT INTO `sys_cn_area` VALUES ('140902', '忻府区', '忻府', '140900', null, '中国,山西省,忻州市,忻府区', '3', '34000', '0350', 'Xinfu', '112.7460300', '38.4041400');
INSERT INTO `sys_cn_area` VALUES ('140921', '定襄县', '定襄', '140900', null, '中国,山西省,忻州市,定襄县', '3', '35400', '0350', 'Dingxiang', '112.9573300', '38.4738700');
INSERT INTO `sys_cn_area` VALUES ('140922', '五台县', '五台', '140900', null, '中国,山西省,忻州市,五台县', '3', '35500', '0350', 'Wutai', '113.2525600', '38.7277400');
INSERT INTO `sys_cn_area` VALUES ('140923', '代县', '代县', '140900', null, '中国,山西省,忻州市,代县', '3', '34200', '0350', 'Daixian', '112.9591300', '39.0671700');
INSERT INTO `sys_cn_area` VALUES ('140924', '繁峙县', '繁峙', '140900', null, '中国,山西省,忻州市,繁峙县', '3', '34300', '0350', 'Fanshi', '113.2630300', '39.1888600');
INSERT INTO `sys_cn_area` VALUES ('140925', '宁武县', '宁武', '140900', null, '中国,山西省,忻州市,宁武县', '3', '36700', '0350', 'Ningwu', '112.3042300', '39.0021100');
INSERT INTO `sys_cn_area` VALUES ('140926', '静乐县', '静乐', '140900', null, '中国,山西省,忻州市,静乐县', '3', '35100', '0350', 'Jingle', '111.9415800', '38.3602000');
INSERT INTO `sys_cn_area` VALUES ('140927', '神池县', '神池', '140900', null, '中国,山西省,忻州市,神池县', '3', '36100', '0350', 'Shenchi', '112.2054100', '39.0900000');
INSERT INTO `sys_cn_area` VALUES ('140928', '五寨县', '五寨', '140900', null, '中国,山西省,忻州市,五寨县', '3', '36200', '0350', 'Wuzhai', '111.8489000', '38.9075700');
INSERT INTO `sys_cn_area` VALUES ('140929', '岢岚县', '岢岚', '140900', null, '中国,山西省,忻州市,岢岚县', '3', '36300', '0350', 'Kelan', '111.5738800', '38.7045200');
INSERT INTO `sys_cn_area` VALUES ('140930', '河曲县', '河曲', '140900', null, '中国,山西省,忻州市,河曲县', '3', '36500', '0350', 'Hequ', '111.1382100', '39.3843900');
INSERT INTO `sys_cn_area` VALUES ('140931', '保德县', '保德', '140900', null, '中国,山西省,忻州市,保德县', '3', '36600', '0350', 'Baode', '111.0865600', '39.0224800');
INSERT INTO `sys_cn_area` VALUES ('140932', '偏关县', '偏关', '140900', null, '中国,山西省,忻州市,偏关县', '3', '36400', '0350', 'Pianguan', '111.5086300', '39.4360900');
INSERT INTO `sys_cn_area` VALUES ('140981', '原平市', '原平', '140900', null, '中国,山西省,忻州市,原平市', '3', '34100', '0350', 'Yuanping', '112.7058400', '38.7318100');
INSERT INTO `sys_cn_area` VALUES ('141000', '临汾市', '临汾', '140000', null, '中国,山西省,临汾市', '2', '41000', '0357', 'Linfen', '111.5179730', '36.0841500');
INSERT INTO `sys_cn_area` VALUES ('141002', '尧都区', '尧都', '141000', null, '中国,山西省,临汾市,尧都区', '3', '41000', '0357', 'Yaodu', '111.5787000', '36.0829800');
INSERT INTO `sys_cn_area` VALUES ('141021', '曲沃县', '曲沃', '141000', null, '中国,山西省,临汾市,曲沃县', '3', '43400', '0357', 'Quwo', '111.4752500', '35.6411900');
INSERT INTO `sys_cn_area` VALUES ('141022', '翼城县', '翼城', '141000', null, '中国,山西省,临汾市,翼城县', '3', '43500', '0357', 'Yicheng', '111.7181000', '35.7388100');
INSERT INTO `sys_cn_area` VALUES ('141023', '襄汾县', '襄汾', '141000', null, '中国,山西省,临汾市,襄汾县', '3', '41500', '0357', 'Xiangfen', '111.4420400', '35.8771100');
INSERT INTO `sys_cn_area` VALUES ('141024', '洪洞县', '洪洞', '141000', null, '中国,山西省,临汾市,洪洞县', '3', '41600', '0357', 'Hongtong', '111.6750100', '36.2542500');
INSERT INTO `sys_cn_area` VALUES ('141025', '古县', '古县', '141000', null, '中国,山西省,临汾市,古县', '3', '42400', '0357', 'Guxian', '111.9204100', '36.2668800');
INSERT INTO `sys_cn_area` VALUES ('141026', '安泽县', '安泽', '141000', null, '中国,山西省,临汾市,安泽县', '3', '42500', '0357', 'Anze', '112.2498100', '36.1480300');
INSERT INTO `sys_cn_area` VALUES ('141027', '浮山县', '浮山', '141000', null, '中国,山西省,临汾市,浮山县', '3', '42600', '0357', 'Fushan', '111.8474400', '35.9685400');
INSERT INTO `sys_cn_area` VALUES ('141028', '吉县', '吉县', '141000', null, '中国,山西省,临汾市,吉县', '3', '42200', '0357', 'Jixian', '110.6814800', '36.0987300');
INSERT INTO `sys_cn_area` VALUES ('141029', '乡宁县', '乡宁', '141000', null, '中国,山西省,临汾市,乡宁县', '3', '42100', '0357', 'Xiangning', '110.8465200', '35.9707200');
INSERT INTO `sys_cn_area` VALUES ('141030', '大宁县', '大宁', '141000', null, '中国,山西省,临汾市,大宁县', '3', '42300', '0357', 'Daning', '110.7521600', '36.4662400');
INSERT INTO `sys_cn_area` VALUES ('141031', '隰县', '隰县', '141000', null, '中国,山西省,临汾市,隰县', '3', '41300', '0357', 'Xixian', '110.9388100', '36.6925800');
INSERT INTO `sys_cn_area` VALUES ('141032', '永和县', '永和', '141000', null, '中国,山西省,临汾市,永和县', '3', '41400', '0357', 'Yonghe', '110.6316800', '36.7584000');
INSERT INTO `sys_cn_area` VALUES ('141033', '蒲县', '蒲县', '141000', null, '中国,山西省,临汾市,蒲县', '3', '41200', '0357', 'Puxian', '111.0967400', '36.4124300');
INSERT INTO `sys_cn_area` VALUES ('141034', '汾西县', '汾西', '141000', null, '中国,山西省,临汾市,汾西县', '3', '31500', '0357', 'Fenxi', '111.5681100', '36.6506300');
INSERT INTO `sys_cn_area` VALUES ('141081', '侯马市', '侯马', '141000', null, '中国,山西省,临汾市,侯马市', '3', '43000', '0357', 'Houma', '111.3720700', '35.6190300');
INSERT INTO `sys_cn_area` VALUES ('141082', '霍州市', '霍州', '141000', null, '中国,山西省,临汾市,霍州市', '3', '31400', '0357', 'Huozhou', '111.7550000', '36.5638000');
INSERT INTO `sys_cn_area` VALUES ('141100', '吕梁市', '吕梁', '140000', null, '中国,山西省,吕梁市', '2', '33000', '0358', 'Lvliang', '111.1343350', '37.5243660');
INSERT INTO `sys_cn_area` VALUES ('141102', '离石区', '离石', '141100', null, '中国,山西省,吕梁市,离石区', '3', '33000', '0358', 'Lishi', '111.1505900', '37.5177000');
INSERT INTO `sys_cn_area` VALUES ('141121', '文水县', '文水', '141100', null, '中国,山西省,吕梁市,文水县', '3', '32100', '0358', 'Wenshui', '112.0282900', '37.4384100');
INSERT INTO `sys_cn_area` VALUES ('141122', '交城县', '交城', '141100', null, '中国,山西省,吕梁市,交城县', '3', '30500', '0358', 'Jiaocheng', '112.1585000', '37.5512000');
INSERT INTO `sys_cn_area` VALUES ('141123', '兴县', '兴县', '141100', null, '中国,山西省,吕梁市,兴县', '3', '33600', '0358', 'Xingxian', '111.1269200', '38.4632100');
INSERT INTO `sys_cn_area` VALUES ('141124', '临县', '临县', '141100', null, '中国,山西省,吕梁市,临县', '3', '33200', '0358', 'Linxian', '110.9928200', '37.9527100');
INSERT INTO `sys_cn_area` VALUES ('141125', '柳林县', '柳林', '141100', null, '中国,山西省,吕梁市,柳林县', '3', '33300', '0358', 'Liulin', '110.8892200', '37.4293200');
INSERT INTO `sys_cn_area` VALUES ('141126', '石楼县', '石楼', '141100', null, '中国,山西省,吕梁市,石楼县', '3', '32500', '0358', 'Shilou', '110.8352000', '36.9973100');
INSERT INTO `sys_cn_area` VALUES ('141127', '岚县', '岚县', '141100', null, '中国,山西省,吕梁市,岚县', '3', '33500', '0358', 'Lanxian', '111.6762700', '38.2787400');
INSERT INTO `sys_cn_area` VALUES ('141128', '方山县', '方山', '141100', null, '中国,山西省,吕梁市,方山县', '3', '33100', '0358', 'Fangshan', '111.2401100', '37.8897900');
INSERT INTO `sys_cn_area` VALUES ('141129', '中阳县', '中阳', '141100', null, '中国,山西省,吕梁市,中阳县', '3', '33400', '0358', 'Zhongyang', '111.1795000', '37.3571500');
INSERT INTO `sys_cn_area` VALUES ('141130', '交口县', '交口', '141100', null, '中国,山西省,吕梁市,交口县', '3', '32400', '0358', 'Jiaokou', '111.1810300', '36.9821300');
INSERT INTO `sys_cn_area` VALUES ('141181', '孝义市', '孝义', '141100', null, '中国,山西省,吕梁市,孝义市', '3', '32300', '0358', 'Xiaoyi', '111.7736200', '37.1441400');
INSERT INTO `sys_cn_area` VALUES ('141182', '汾阳市', '汾阳', '141100', null, '中国,山西省,吕梁市,汾阳市', '3', '32200', '0358', 'Fenyang', '111.7882000', '37.2660500');
INSERT INTO `sys_cn_area` VALUES ('150000', '内蒙古自治区', '内蒙古', '100000', null, '中国,内蒙古自治区', '1', null, '', 'Inner Mongolia', '111.6708010', '40.8183110');
INSERT INTO `sys_cn_area` VALUES ('150100', '呼和浩特市', '呼和浩特', '150000', null, '中国,内蒙古自治区,呼和浩特市', '2', '10000', '0471', 'Hohhot', '111.6708010', '40.8183110');
INSERT INTO `sys_cn_area` VALUES ('150102', '新城区', '新城', '150100', null, '中国,内蒙古自治区,呼和浩特市,新城区', '3', '10050', '0471', 'Xincheng', '111.6655400', '40.8582800');
INSERT INTO `sys_cn_area` VALUES ('150103', '回民区', '回民', '150100', null, '中国,内蒙古自治区,呼和浩特市,回民区', '3', '10030', '0471', 'Huimin', '111.6240200', '40.8082700');
INSERT INTO `sys_cn_area` VALUES ('150104', '玉泉区', '玉泉', '150100', null, '中国,内蒙古自治区,呼和浩特市,玉泉区', '3', '10020', '0471', 'Yuquan', '111.6745600', '40.7522700');
INSERT INTO `sys_cn_area` VALUES ('150105', '赛罕区', '赛罕', '150100', null, '中国,内蒙古自治区,呼和浩特市,赛罕区', '3', '10020', '0471', 'Saihan', '111.7022400', '40.7920700');
INSERT INTO `sys_cn_area` VALUES ('150121', '土默特左旗', '土默特左旗', '150100', null, '中国,内蒙古自治区,呼和浩特市,土默特左旗', '3', '10100', '0471', 'Tumotezuoqi', '111.1489800', '40.7222900');
INSERT INTO `sys_cn_area` VALUES ('150122', '托克托县', '托克托', '150100', null, '中国,内蒙古自治区,呼和浩特市,托克托县', '3', '10200', '0471', 'Tuoketuo', '111.1910100', '40.2749200');
INSERT INTO `sys_cn_area` VALUES ('150123', '和林格尔县', '和林格尔', '150100', null, '中国,内蒙古自治区,呼和浩特市,和林格尔县', '3', '11500', '0471', 'Helingeer', '111.8220500', '40.3789200');
INSERT INTO `sys_cn_area` VALUES ('150124', '清水河县', '清水河', '150100', null, '中国,内蒙古自治区,呼和浩特市,清水河县', '3', '11600', '0471', 'Qingshuihe', '111.6831600', '39.9097000');
INSERT INTO `sys_cn_area` VALUES ('150125', '武川县', '武川', '150100', null, '中国,内蒙古自治区,呼和浩特市,武川县', '3', '11700', '0471', 'Wuchuan', '111.4578500', '41.0928900');
INSERT INTO `sys_cn_area` VALUES ('150200', '包头市', '包头', '150000', null, '中国,内蒙古自治区,包头市', '2', '14025', '0472', 'Baotou', '109.8404050', '40.6581680');
INSERT INTO `sys_cn_area` VALUES ('150202', '东河区', '东河', '150200', null, '中国,内蒙古自治区,包头市,东河区', '3', '14040', '0472', 'Donghe', '110.0462000', '40.5823700');
INSERT INTO `sys_cn_area` VALUES ('150203', '昆都仑区', '昆都仑', '150200', null, '中国,内蒙古自治区,包头市,昆都仑区', '3', '14010', '0472', 'Kundulun', '109.8386200', '40.6417500');
INSERT INTO `sys_cn_area` VALUES ('150204', '青山区', '青山', '150200', null, '中国,内蒙古自治区,包头市,青山区', '3', '14030', '0472', 'Qingshan', '109.9013100', '40.6432900');
INSERT INTO `sys_cn_area` VALUES ('150205', '石拐区', '石拐', '150200', null, '中国,内蒙古自治区,包头市,石拐区', '3', '14070', '0472', 'Shiguai', '110.2732200', '40.6729700');
INSERT INTO `sys_cn_area` VALUES ('150206', '白云鄂博矿区', '白云鄂博矿区', '150200', null, '中国,内蒙古自治区,包头市,白云鄂博矿区', '3', '14080', '0472', 'Baiyunebokuangqu', '109.9736700', '41.7696800');
INSERT INTO `sys_cn_area` VALUES ('150207', '九原区', '九原', '150200', null, '中国,内蒙古自治区,包头市,九原区', '3', '14060', '0472', 'Jiuyuan', '109.9649600', '40.6055400');
INSERT INTO `sys_cn_area` VALUES ('150221', '土默特右旗', '土默特右旗', '150200', null, '中国,内蒙古自治区,包头市,土默特右旗', '3', '14100', '0472', 'Tumoteyouqi', '110.5241700', '40.5688000');
INSERT INTO `sys_cn_area` VALUES ('150222', '固阳县', '固阳', '150200', null, '中国,内蒙古自治区,包头市,固阳县', '3', '14200', '0472', 'Guyang', '110.0637200', '41.0185100');
INSERT INTO `sys_cn_area` VALUES ('150223', '达尔罕茂明安联合旗', '达茂旗', '150200', null, '中国,内蒙古自治区,包头市,达尔罕茂明安联合旗', '3', '14500', '0472', 'Damaoqi', '110.4325800', '41.6987500');
INSERT INTO `sys_cn_area` VALUES ('150300', '乌海市', '乌海', '150000', null, '中国,内蒙古自治区,乌海市', '2', '16000', '0473', 'Wuhai', '106.8255630', '39.6737340');
INSERT INTO `sys_cn_area` VALUES ('150302', '海勃湾区', '海勃湾', '150300', null, '中国,内蒙古自治区,乌海市,海勃湾区', '3', '16000', '0473', 'Haibowan', '106.8222000', '39.6695500');
INSERT INTO `sys_cn_area` VALUES ('150303', '海南区', '海南', '150300', null, '中国,内蒙古自治区,乌海市,海南区', '3', '16030', '0473', 'Hainan', '106.8865600', '39.4412800');
INSERT INTO `sys_cn_area` VALUES ('150304', '乌达区', '乌达', '150300', null, '中国,内蒙古自治区,乌海市,乌达区', '3', '16040', '0473', 'Wuda', '106.7272300', '39.5050000');
INSERT INTO `sys_cn_area` VALUES ('150400', '赤峰市', '赤峰', '150000', null, '中国,内蒙古自治区,赤峰市', '2', '24000', '0476', 'Chifeng', '118.9568060', '42.2753170');
INSERT INTO `sys_cn_area` VALUES ('150402', '红山区', '红山', '150400', null, '中国,内蒙古自治区,赤峰市,红山区', '3', '24020', '0476', 'Hongshan', '118.9575500', '42.2431200');
INSERT INTO `sys_cn_area` VALUES ('150403', '元宝山区', '元宝山', '150400', null, '中国,内蒙古自治区,赤峰市,元宝山区', '3', '24076', '0476', 'Yuanbaoshan', '119.2892100', '42.0400500');
INSERT INTO `sys_cn_area` VALUES ('150404', '松山区', '松山', '150400', null, '中国,内蒙古自治区,赤峰市,松山区', '3', '24005', '0476', 'Songshan', '118.9328000', '42.2861300');
INSERT INTO `sys_cn_area` VALUES ('150421', '阿鲁科尔沁旗', '阿鲁科尔沁旗', '150400', null, '中国,内蒙古自治区,赤峰市,阿鲁科尔沁旗', '3', '25550', '0476', 'Alukeerqinqi', '120.0652700', '43.8798800');
INSERT INTO `sys_cn_area` VALUES ('150422', '巴林左旗', '巴林左旗', '150400', null, '中国,内蒙古自治区,赤峰市,巴林左旗', '3', '25450', '0476', 'Balinzuoqi', '119.3801200', '43.9703100');
INSERT INTO `sys_cn_area` VALUES ('150423', '巴林右旗', '巴林右旗', '150400', null, '中国,内蒙古自治区,赤峰市,巴林右旗', '3', '25150', '0476', 'Balinyouqi', '118.6646100', '43.5338700');
INSERT INTO `sys_cn_area` VALUES ('150424', '林西县', '林西', '150400', null, '中国,内蒙古自治区,赤峰市,林西县', '3', '25250', '0476', 'Linxi', '118.0473300', '43.6116500');
INSERT INTO `sys_cn_area` VALUES ('150425', '克什克腾旗', '克什克腾旗', '150400', null, '中国,内蒙古自治区,赤峰市,克什克腾旗', '3', '25350', '0476', 'Keshiketengqi', '117.5456200', '43.2650100');
INSERT INTO `sys_cn_area` VALUES ('150426', '翁牛特旗', '翁牛特旗', '150400', null, '中国,内蒙古自治区,赤峰市,翁牛特旗', '3', '24500', '0476', 'Wengniuteqi', '119.0304200', '42.9314700');
INSERT INTO `sys_cn_area` VALUES ('150428', '喀喇沁旗', '喀喇沁旗', '150400', null, '中国,内蒙古自治区,赤峰市,喀喇沁旗', '3', '24400', '0476', 'Kalaqinqi', '118.7014400', '41.9291700');
INSERT INTO `sys_cn_area` VALUES ('150429', '宁城县', '宁城', '150400', null, '中国,内蒙古自治区,赤峰市,宁城县', '3', '24200', '0476', 'Ningcheng', '119.3437500', '41.5966100');
INSERT INTO `sys_cn_area` VALUES ('150430', '敖汉旗', '敖汉旗', '150400', null, '中国,内蒙古自治区,赤峰市,敖汉旗', '3', '24300', '0476', 'Aohanqi', '119.9216300', '42.2907100');
INSERT INTO `sys_cn_area` VALUES ('150500', '通辽市', '通辽', '150000', null, '中国,内蒙古自治区,通辽市', '2', '28000', '0475', 'Tongliao', '122.2631190', '43.6174290');
INSERT INTO `sys_cn_area` VALUES ('150502', '科尔沁区', '科尔沁', '150500', null, '中国,内蒙古自治区,通辽市,科尔沁区', '3', '28000', '0475', 'Keerqin', '122.2557300', '43.6225700');
INSERT INTO `sys_cn_area` VALUES ('150521', '科尔沁左翼中旗', '科尔沁左翼中旗', '150500', null, '中国,内蒙古自治区,通辽市,科尔沁左翼中旗', '3', '29300', '0475', 'Keerqinzuoyizhongqi', '123.3191200', '44.1301400');
INSERT INTO `sys_cn_area` VALUES ('150522', '科尔沁左翼后旗', '科尔沁左翼后旗', '150500', null, '中国,内蒙古自治区,通辽市,科尔沁左翼后旗', '3', '28100', '0475', 'Keerqinzuoyihouqi', '122.3574500', '42.9489700');
INSERT INTO `sys_cn_area` VALUES ('150523', '开鲁县', '开鲁', '150500', null, '中国,内蒙古自治区,通辽市,开鲁县', '3', '28400', '0475', 'Kailu', '121.3188400', '43.6000300');
INSERT INTO `sys_cn_area` VALUES ('150524', '库伦旗', '库伦旗', '150500', null, '中国,内蒙古自治区,通辽市,库伦旗', '3', '28200', '0475', 'Kulunqi', '121.7760000', '42.7299800');
INSERT INTO `sys_cn_area` VALUES ('150525', '奈曼旗', '奈曼旗', '150500', null, '中国,内蒙古自治区,通辽市,奈曼旗', '3', '28300', '0475', 'Naimanqi', '120.6634800', '42.8452700');
INSERT INTO `sys_cn_area` VALUES ('150526', '扎鲁特旗', '扎鲁特旗', '150500', null, '中国,内蒙古自治区,通辽市,扎鲁特旗', '3', '29100', '0475', 'Zhaluteqi', '120.9150700', '44.5559200');
INSERT INTO `sys_cn_area` VALUES ('150581', '霍林郭勒市', '霍林郭勒', '150500', null, '中国,内蒙古自治区,通辽市,霍林郭勒市', '3', '29200', '0475', 'Huolinguole', '119.6542900', '45.5345400');
INSERT INTO `sys_cn_area` VALUES ('150600', '鄂尔多斯市', '鄂尔多斯', '150000', null, '中国,内蒙古自治区,鄂尔多斯市', '2', '17004', '0477', 'Ordos', '109.9902900', '39.8171790');
INSERT INTO `sys_cn_area` VALUES ('150602', '东胜区', '东胜', '150600', null, '中国,内蒙古自治区,鄂尔多斯市,东胜区', '3', '17000', '0477', 'Dongsheng', '109.9628900', '39.8223600');
INSERT INTO `sys_cn_area` VALUES ('150621', '达拉特旗', '达拉特旗', '150600', null, '中国,内蒙古自治区,鄂尔多斯市,达拉特旗', '3', '14300', '0477', 'Dalateqi', '110.0331700', '40.4001000');
INSERT INTO `sys_cn_area` VALUES ('150622', '准格尔旗', '准格尔旗', '150600', null, '中国,内蒙古自治区,鄂尔多斯市,准格尔旗', '3', '17100', '0477', 'Zhungeerqi', '111.2364500', '39.8678300');
INSERT INTO `sys_cn_area` VALUES ('150623', '鄂托克前旗', '鄂托克前旗', '150600', null, '中国,内蒙古自治区,鄂尔多斯市,鄂托克前旗', '3', '16200', '0477', 'Etuokeqianqi', '107.4840300', '38.1839600');
INSERT INTO `sys_cn_area` VALUES ('150624', '鄂托克旗', '鄂托克旗', '150600', null, '中国,内蒙古自治区,鄂尔多斯市,鄂托克旗', '3', '16100', '0477', 'Etuokeqi', '107.9822600', '39.0945600');
INSERT INTO `sys_cn_area` VALUES ('150625', '杭锦旗', '杭锦旗', '150600', null, '中国,内蒙古自治区,鄂尔多斯市,杭锦旗', '3', '17400', '0477', 'Hangjinqi', '108.7293400', '39.8402300');
INSERT INTO `sys_cn_area` VALUES ('150626', '乌审旗', '乌审旗', '150600', null, '中国,内蒙古自治区,鄂尔多斯市,乌审旗', '3', '17300', '0477', 'Wushenqi', '108.8461000', '38.5909200');
INSERT INTO `sys_cn_area` VALUES ('150627', '伊金霍洛旗', '伊金霍洛旗', '150600', null, '中国,内蒙古自治区,鄂尔多斯市,伊金霍洛旗', '3', '17200', '0477', 'Yijinhuoluoqi', '109.7490800', '39.5739300');
INSERT INTO `sys_cn_area` VALUES ('150700', '呼伦贝尔市', '呼伦贝尔', '150000', null, '中国,内蒙古自治区,呼伦贝尔市', '2', '21008', '0470', 'Hulunber', '119.7581680', '49.2153330');
INSERT INTO `sys_cn_area` VALUES ('150702', '海拉尔区', '海拉尔', '150700', null, '中国,内蒙古自治区,呼伦贝尔市,海拉尔区', '3', '21000', '0470', 'Hailaer', '119.7364000', '49.2122000');
INSERT INTO `sys_cn_area` VALUES ('150703', '扎赉诺尔区', '扎赉诺尔', '150700', null, '中国,内蒙古自治区,呼伦贝尔市,扎赉诺尔区', '3', '21410', '0470', 'Zhalainuoer', '117.7927020', '49.4869430');
INSERT INTO `sys_cn_area` VALUES ('150721', '阿荣旗', '阿荣旗', '150700', null, '中国,内蒙古自治区,呼伦贝尔市,阿荣旗', '3', '162750', '0470', 'Arongqi', '123.4594100', '48.1258100');
INSERT INTO `sys_cn_area` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '莫旗', '150700', null, '中国,内蒙古自治区,呼伦贝尔市,莫力达瓦达斡尔族自治旗', '3', '162850', '0470', 'Moqi', '124.5149800', '48.4805500');
INSERT INTO `sys_cn_area` VALUES ('150723', '鄂伦春自治旗', '鄂伦春', '150700', null, '中国,内蒙古自治区,呼伦贝尔市,鄂伦春自治旗', '3', '165450', '0470', 'Elunchun', '123.7260400', '50.5977700');
INSERT INTO `sys_cn_area` VALUES ('150724', '鄂温克族自治旗', '鄂温', '150700', null, '中国,内蒙古自治区,呼伦贝尔市,鄂温克族自治旗', '3', '21100', '0470', 'Ewen', '119.7565000', '49.1428400');
INSERT INTO `sys_cn_area` VALUES ('150725', '陈巴尔虎旗', '陈巴尔虎旗', '150700', null, '中国,内蒙古自治区,呼伦贝尔市,陈巴尔虎旗', '3', '21500', '0470', 'Chenbaerhuqi', '119.4243400', '49.3268400');
INSERT INTO `sys_cn_area` VALUES ('150726', '新巴尔虎左旗', '新巴尔虎左旗', '150700', null, '中国,内蒙古自治区,呼伦贝尔市,新巴尔虎左旗', '3', '21200', '0470', 'Xinbaerhuzuoqi', '118.2698900', '48.2184200');
INSERT INTO `sys_cn_area` VALUES ('150727', '新巴尔虎右旗', '新巴尔虎右旗', '150700', null, '中国,内蒙古自治区,呼伦贝尔市,新巴尔虎右旗', '3', '21300', '0470', 'Xinbaerhuyouqi', '116.8236600', '48.6647300');
INSERT INTO `sys_cn_area` VALUES ('150781', '满洲里市', '满洲里', '150700', null, '中国,内蒙古自治区,呼伦贝尔市,满洲里市', '3', '21400', '0470', 'Manzhouli', '117.4794600', '49.5827200');
INSERT INTO `sys_cn_area` VALUES ('150782', '牙克石市', '牙克石', '150700', null, '中国,内蒙古自治区,呼伦贝尔市,牙克石市', '3', '22150', '0470', 'Yakeshi', '120.7117000', '49.2856000');
INSERT INTO `sys_cn_area` VALUES ('150783', '扎兰屯市', '扎兰屯', '150700', null, '中国,内蒙古自治区,呼伦贝尔市,扎兰屯市', '3', '162650', '0470', 'Zhalantun', '122.7375700', '48.0136300');
INSERT INTO `sys_cn_area` VALUES ('150784', '额尔古纳市', '额尔古纳', '150700', null, '中国,内蒙古自治区,呼伦贝尔市,额尔古纳市', '3', '22250', '0470', 'Eerguna', '120.1909400', '50.2424900');
INSERT INTO `sys_cn_area` VALUES ('150785', '根河市', '根河', '150700', null, '中国,内蒙古自治区,呼伦贝尔市,根河市', '3', '22350', '0470', 'Genhe', '121.5219700', '50.7799600');
INSERT INTO `sys_cn_area` VALUES ('150800', '巴彦淖尔市', '巴彦淖尔', '150000', null, '中国,内蒙古自治区,巴彦淖尔市', '2', '15001', '0478', 'Bayan Nur', '107.4169590', '40.7574020');
INSERT INTO `sys_cn_area` VALUES ('150802', '临河区', '临河', '150800', null, '中国,内蒙古自治区,巴彦淖尔市,临河区', '3', '15001', '0478', 'Linhe', '107.4266800', '40.7582700');
INSERT INTO `sys_cn_area` VALUES ('150821', '五原县', '五原', '150800', null, '中国,内蒙古自治区,巴彦淖尔市,五原县', '3', '15100', '0478', 'Wuyuan', '108.2691600', '41.0963100');
INSERT INTO `sys_cn_area` VALUES ('150822', '磴口县', '磴口', '150800', null, '中国,内蒙古自治区,巴彦淖尔市,磴口县', '3', '15200', '0478', 'Dengkou', '107.0093600', '40.3306200');
INSERT INTO `sys_cn_area` VALUES ('150823', '乌拉特前旗', '乌拉特前旗', '150800', null, '中国,内蒙古自治区,巴彦淖尔市,乌拉特前旗', '3', '14400', '0478', 'Wulateqianqi', '108.6521900', '40.7364900');
INSERT INTO `sys_cn_area` VALUES ('150824', '乌拉特中旗', '乌拉特中旗', '150800', null, '中国,内蒙古自治区,巴彦淖尔市,乌拉特中旗', '3', '15300', '0478', 'Wulatezhongqi', '108.5258700', '41.5678900');
INSERT INTO `sys_cn_area` VALUES ('150825', '乌拉特后旗', '乌拉特后旗', '150800', null, '中国,内蒙古自治区,巴彦淖尔市,乌拉特后旗', '3', '15500', '0478', 'Wulatehouqi', '106.9897100', '41.4315100');
INSERT INTO `sys_cn_area` VALUES ('150826', '杭锦后旗', '杭锦后旗', '150800', null, '中国,内蒙古自治区,巴彦淖尔市,杭锦后旗', '3', '15400', '0478', 'Hangjinhouqi', '107.1513300', '40.8862700');
INSERT INTO `sys_cn_area` VALUES ('150900', '乌兰察布市', '乌兰察布', '150000', null, '中国,内蒙古自治区,乌兰察布市', '2', '12000', '0474', 'Ulanqab', '113.1145430', '41.0341260');
INSERT INTO `sys_cn_area` VALUES ('150902', '集宁区', '集宁', '150900', null, '中国,内蒙古自治区,乌兰察布市,集宁区', '3', '12000', '0474', 'Jining', '113.1145200', '41.0353000');
INSERT INTO `sys_cn_area` VALUES ('150921', '卓资县', '卓资', '150900', null, '中国,内蒙古自治区,乌兰察布市,卓资县', '3', '12300', '0474', 'Zhuozi', '112.5775700', '40.8941400');
INSERT INTO `sys_cn_area` VALUES ('150922', '化德县', '化德', '150900', null, '中国,内蒙古自治区,乌兰察布市,化德县', '3', '13350', '0474', 'Huade', '114.0107100', '41.9043300');
INSERT INTO `sys_cn_area` VALUES ('150923', '商都县', '商都', '150900', null, '中国,内蒙古自治区,乌兰察布市,商都县', '3', '13450', '0474', 'Shangdu', '113.5777200', '41.5621300');
INSERT INTO `sys_cn_area` VALUES ('150924', '兴和县', '兴和', '150900', null, '中国,内蒙古自治区,乌兰察布市,兴和县', '3', '13650', '0474', 'Xinghe', '113.8339500', '40.8718600');
INSERT INTO `sys_cn_area` VALUES ('150925', '凉城县', '凉城', '150900', null, '中国,内蒙古自治区,乌兰察布市,凉城县', '3', '13750', '0474', 'Liangcheng', '112.4956900', '40.5334600');
INSERT INTO `sys_cn_area` VALUES ('150926', '察哈尔右翼前旗', '察右前旗', '150900', null, '中国,内蒙古自治区,乌兰察布市,察哈尔右翼前旗', '3', '12200', '0474', 'Chayouqianqi', '113.2213100', '40.7788000');
INSERT INTO `sys_cn_area` VALUES ('150927', '察哈尔右翼中旗', '察右中旗', '150900', null, '中国,内蒙古自治区,乌兰察布市,察哈尔右翼中旗', '3', '13550', '0474', 'Chayouzhongqi', '112.6353700', '41.2774200');
INSERT INTO `sys_cn_area` VALUES ('150928', '察哈尔右翼后旗', '察右后旗', '150900', null, '中国,内蒙古自治区,乌兰察布市,察哈尔右翼后旗', '3', '12400', '0474', 'Chayouhouqi', '113.1921600', '41.4355400');
INSERT INTO `sys_cn_area` VALUES ('150929', '四子王旗', '四子王旗', '150900', null, '中国,内蒙古自治区,乌兰察布市,四子王旗', '3', '11800', '0474', 'Siziwangqi', '111.7065400', '41.5331200');
INSERT INTO `sys_cn_area` VALUES ('150981', '丰镇市', '丰镇', '150900', null, '中国,内蒙古自治区,乌兰察布市,丰镇市', '3', '12100', '0474', 'Fengzhen', '113.1098300', '40.4369000');
INSERT INTO `sys_cn_area` VALUES ('152200', '兴安盟', '兴安盟', '150000', null, '中国,内蒙古自治区,兴安盟', '2', '137401', '0482', 'Hinggan', '122.0703170', '46.0762680');
INSERT INTO `sys_cn_area` VALUES ('152201', '乌兰浩特市', '乌兰浩特', '152200', null, '中国,内蒙古自治区,兴安盟,乌兰浩特市', '3', '137401', '0482', 'Wulanhaote', '122.0637800', '46.0623500');
INSERT INTO `sys_cn_area` VALUES ('152202', '阿尔山市', '阿尔山', '152200', null, '中国,内蒙古自治区,兴安盟,阿尔山市', '3', '137800', '0482', 'Aershan', '119.9431700', '47.1771600');
INSERT INTO `sys_cn_area` VALUES ('152221', '科尔沁右翼前旗', '科右前旗', '152200', null, '中国,内蒙古自治区,兴安盟,科尔沁右翼前旗', '3', '137423', '0482', 'Keyouqianqi', '121.9526900', '46.0795000');
INSERT INTO `sys_cn_area` VALUES ('152222', '科尔沁右翼中旗', '科右中旗', '152200', null, '中国,内蒙古自治区,兴安盟,科尔沁右翼中旗', '3', '29400', '0482', 'Keyouzhongqi', '121.4680700', '45.0560500');
INSERT INTO `sys_cn_area` VALUES ('152223', '扎赉特旗', '扎赉特旗', '152200', null, '中国,内蒙古自治区,兴安盟,扎赉特旗', '3', '137600', '0482', 'Zhalaiteqi', '122.9122900', '46.7267000');
INSERT INTO `sys_cn_area` VALUES ('152224', '突泉县', '突泉', '152200', null, '中国,内蒙古自治区,兴安盟,突泉县', '3', '137500', '0482', 'Tuquan', '121.5939600', '45.3818700');
INSERT INTO `sys_cn_area` VALUES ('152500', '锡林郭勒盟', '锡林郭勒盟', '150000', null, '中国,内蒙古自治区,锡林郭勒盟', '2', '26000', '0479', 'Xilin Gol', '116.0909960', '43.9440180');
INSERT INTO `sys_cn_area` VALUES ('152501', '二连浩特市', '二连浩特', '152500', null, '中国,内蒙古自治区,锡林郭勒盟,二连浩特市', '3', '11100', '0479', 'Erlianhaote', '111.9829700', '43.6530300');
INSERT INTO `sys_cn_area` VALUES ('152502', '锡林浩特市', '锡林浩特', '152500', null, '中国,内蒙古自治区,锡林郭勒盟,锡林浩特市', '3', '26021', '0479', 'Xilinhaote', '116.0860300', '43.9334100');
INSERT INTO `sys_cn_area` VALUES ('152522', '阿巴嘎旗', '阿巴嘎旗', '152500', null, '中国,内蒙古自治区,锡林郭勒盟,阿巴嘎旗', '3', '11400', '0479', 'Abagaqi', '114.9682600', '44.0217400');
INSERT INTO `sys_cn_area` VALUES ('152523', '苏尼特左旗', '苏尼特左旗', '152500', null, '中国,内蒙古自治区,锡林郭勒盟,苏尼特左旗', '3', '11300', '0479', 'Sunitezuoqi', '113.6506000', '43.8568700');
INSERT INTO `sys_cn_area` VALUES ('152524', '苏尼特右旗', '苏尼特右旗', '152500', null, '中国,内蒙古自治区,锡林郭勒盟,苏尼特右旗', '3', '11200', '0479', 'Suniteyouqi', '112.6574100', '42.7469000');
INSERT INTO `sys_cn_area` VALUES ('152525', '东乌珠穆沁旗', '东乌旗', '152500', null, '中国,内蒙古自治区,锡林郭勒盟,东乌珠穆沁旗', '3', '26300', '0479', 'Dongwuqi', '116.9729300', '45.5110800');
INSERT INTO `sys_cn_area` VALUES ('152526', '西乌珠穆沁旗', '西乌旗', '152500', null, '中国,内蒙古自治区,锡林郭勒盟,西乌珠穆沁旗', '3', '26200', '0479', 'Xiwuqi', '117.6098300', '44.5962300');
INSERT INTO `sys_cn_area` VALUES ('152527', '太仆寺旗', '太仆寺旗', '152500', null, '中国,内蒙古自治区,锡林郭勒盟,太仆寺旗', '3', '27000', '0479', 'Taipusiqi', '115.2830200', '41.8772700');
INSERT INTO `sys_cn_area` VALUES ('152528', '镶黄旗', '镶黄旗', '152500', null, '中国,内蒙古自治区,锡林郭勒盟,镶黄旗', '3', '13250', '0479', 'Xianghuangqi', '113.8447200', '42.2392700');
INSERT INTO `sys_cn_area` VALUES ('152529', '正镶白旗', '正镶白旗', '152500', null, '中国,内蒙古自治区,锡林郭勒盟,正镶白旗', '3', '13800', '0479', 'Zhengxiangbaiqi', '115.0006700', '42.3071200');
INSERT INTO `sys_cn_area` VALUES ('152530', '正蓝旗', '正蓝旗', '152500', null, '中国,内蒙古自治区,锡林郭勒盟,正蓝旗', '3', '27200', '0479', 'Zhenglanqi', '116.0036300', '42.2522900');
INSERT INTO `sys_cn_area` VALUES ('152531', '多伦县', '多伦', '152500', null, '中国,内蒙古自治区,锡林郭勒盟,多伦县', '3', '27300', '0479', 'Duolun', '116.4856500', '42.2030000');
INSERT INTO `sys_cn_area` VALUES ('152900', '阿拉善盟', '阿拉善盟', '150000', null, '中国,内蒙古自治区,阿拉善盟', '2', '750306', '0483', 'Alxa', '105.7064220', '38.8448140');
INSERT INTO `sys_cn_area` VALUES ('152921', '阿拉善左旗', '阿拉善左旗', '152900', null, '中国,内蒙古自治区,阿拉善盟,阿拉善左旗', '3', '750306', '0483', 'Alashanzuoqi', '105.6753200', '38.8293000');
INSERT INTO `sys_cn_area` VALUES ('152922', '阿拉善右旗', '阿拉善右旗', '152900', null, '中国,内蒙古自治区,阿拉善盟,阿拉善右旗', '3', '737300', '0483', 'Alashanyouqi', '101.6670500', '39.2153300');
INSERT INTO `sys_cn_area` VALUES ('152923', '额济纳旗', '额济纳旗', '152900', null, '中国,内蒙古自治区,阿拉善盟,额济纳旗', '3', '735400', '0483', 'Ejinaqi', '101.0688700', '41.9675500');
INSERT INTO `sys_cn_area` VALUES ('210000', '辽宁省', '辽宁', '100000', null, '中国,辽宁省', '1', null, '', 'Liaoning', '123.4290960', '41.7967670');
INSERT INTO `sys_cn_area` VALUES ('210100', '沈阳市', '沈阳', '210000', null, '中国,辽宁省,沈阳市', '2', '110013', '024', 'Shenyang', '123.4290960', '41.7967670');
INSERT INTO `sys_cn_area` VALUES ('210102', '和平区', '和平', '210100', null, '中国,辽宁省,沈阳市,和平区', '3', '110001', '024', 'Heping', '123.4204000', '41.7899700');
INSERT INTO `sys_cn_area` VALUES ('210103', '沈河区', '沈河', '210100', null, '中国,辽宁省,沈阳市,沈河区', '3', '110011', '024', 'Shenhe', '123.4587100', '41.7962500');
INSERT INTO `sys_cn_area` VALUES ('210104', '大东区', '大东', '210100', null, '中国,辽宁省,沈阳市,大东区', '3', '110041', '024', 'Dadong', '123.4699700', '41.8053900');
INSERT INTO `sys_cn_area` VALUES ('210105', '皇姑区', '皇姑', '210100', null, '中国,辽宁省,沈阳市,皇姑区', '3', '110031', '024', 'Huanggu', '123.4252700', '41.8203500');
INSERT INTO `sys_cn_area` VALUES ('210106', '铁西区', '铁西', '210100', null, '中国,辽宁省,沈阳市,铁西区', '3', '110021', '024', 'Tiexi', '123.3767500', '41.8026900');
INSERT INTO `sys_cn_area` VALUES ('210111', '苏家屯区', '苏家屯', '210100', null, '中国,辽宁省,沈阳市,苏家屯区', '3', '110101', '024', 'Sujiatun', '123.3440500', '41.6647500');
INSERT INTO `sys_cn_area` VALUES ('210112', '浑南区', '浑南', '210100', null, '中国,辽宁省,沈阳市,浑南区', '3', '110015', '024', 'Hunnan', '123.4577070', '41.7194500');
INSERT INTO `sys_cn_area` VALUES ('210113', '沈北新区', '沈北新区', '210100', null, '中国,辽宁省,沈阳市,沈北新区', '3', '110121', '024', 'Shenbeixinqu', '123.5265800', '42.0529700');
INSERT INTO `sys_cn_area` VALUES ('210114', '于洪区', '于洪', '210100', null, '中国,辽宁省,沈阳市,于洪区', '3', '110141', '024', 'Yuhong', '123.3080700', '41.7940000');
INSERT INTO `sys_cn_area` VALUES ('210122', '辽中县', '辽中', '210100', null, '中国,辽宁省,沈阳市,辽中县', '3', '110200', '024', 'Liaozhong', '122.7265900', '41.5130200');
INSERT INTO `sys_cn_area` VALUES ('210123', '康平县', '康平', '210100', null, '中国,辽宁省,沈阳市,康平县', '3', '110500', '024', 'Kangping', '123.3544600', '42.7508100');
INSERT INTO `sys_cn_area` VALUES ('210124', '法库县', '法库', '210100', null, '中国,辽宁省,沈阳市,法库县', '3', '110400', '024', 'Faku', '123.4121400', '42.5060800');
INSERT INTO `sys_cn_area` VALUES ('210181', '新民市', '新民', '210100', null, '中国,辽宁省,沈阳市,新民市', '3', '110300', '024', 'Xinmin', '122.8286700', '41.9984700');
INSERT INTO `sys_cn_area` VALUES ('210200', '大连市', '大连', '210000', null, '中国,辽宁省,大连市', '2', '116011', '0411', 'Dalian', '121.6186220', '38.9145900');
INSERT INTO `sys_cn_area` VALUES ('210202', '中山区', '中山', '210200', null, '中国,辽宁省,大连市,中山区', '3', '116001', '0411', 'Zhongshan', '121.6446500', '38.9185900');
INSERT INTO `sys_cn_area` VALUES ('210203', '西岗区', '西岗', '210200', null, '中国,辽宁省,大连市,西岗区', '3', '116011', '0411', 'Xigang', '121.6123800', '38.9146900');
INSERT INTO `sys_cn_area` VALUES ('210204', '沙河口区', '沙河口', '210200', null, '中国,辽宁省,大连市,沙河口区', '3', '116021', '0411', 'Shahekou', '121.5801700', '38.9053600');
INSERT INTO `sys_cn_area` VALUES ('210211', '甘井子区', '甘井子', '210200', null, '中国,辽宁省,大连市,甘井子区', '3', '116033', '0411', 'Ganjingzi', '121.5656700', '38.9501700');
INSERT INTO `sys_cn_area` VALUES ('210212', '旅顺口区', '旅顺口', '210200', null, '中国,辽宁省,大连市,旅顺口区', '3', '116041', '0411', 'Lvshunkou', '121.2620200', '38.8512500');
INSERT INTO `sys_cn_area` VALUES ('210213', '金州区', '金州', '210200', null, '中国,辽宁省,大连市,金州区', '3', '116100', '0411', 'Jinzhou', '121.7189300', '39.1004000');
INSERT INTO `sys_cn_area` VALUES ('210224', '长海县', '长海', '210200', null, '中国,辽宁省,大连市,长海县', '3', '116500', '0411', 'Changhai', '122.5885900', '39.2727400');
INSERT INTO `sys_cn_area` VALUES ('210281', '瓦房店市', '瓦房店', '210200', null, '中国,辽宁省,大连市,瓦房店市', '3', '116300', '0411', 'Wafangdian', '121.9810400', '39.6284300');
INSERT INTO `sys_cn_area` VALUES ('210282', '普兰店市', '普兰店', '210200', null, '中国,辽宁省,大连市,普兰店市', '3', '116200', '0411', 'Pulandian', '121.9631600', '39.3946500');
INSERT INTO `sys_cn_area` VALUES ('210283', '庄河市', '庄河', '210200', null, '中国,辽宁省,大连市,庄河市', '3', '116400', '0411', 'Zhuanghe', '122.9672500', '39.6881500');
INSERT INTO `sys_cn_area` VALUES ('210300', '鞍山市', '鞍山', '210000', null, '中国,辽宁省,鞍山市', '2', '114001', '0412', 'Anshan', '122.9956320', '41.1106260');
INSERT INTO `sys_cn_area` VALUES ('210302', '铁东区', '铁东', '210300', null, '中国,辽宁省,鞍山市,铁东区', '3', '114001', '0412', 'Tiedong', '122.9908500', '41.0897500');
INSERT INTO `sys_cn_area` VALUES ('210303', '铁西区', '铁西', '210300', null, '中国,辽宁省,鞍山市,铁西区', '3', '114013', '0413', 'Tiexi', '122.9696700', '41.1197700');
INSERT INTO `sys_cn_area` VALUES ('210304', '立山区', '立山', '210300', null, '中国,辽宁省,鞍山市,立山区', '3', '114031', '0414', 'Lishan', '123.0294800', '41.1500800');
INSERT INTO `sys_cn_area` VALUES ('210311', '千山区', '千山', '210300', null, '中国,辽宁省,鞍山市,千山区', '3', '114041', '0415', 'Qianshan', '122.9604800', '41.0750700');
INSERT INTO `sys_cn_area` VALUES ('210321', '台安县', '台安', '210300', null, '中国,辽宁省,鞍山市,台安县', '3', '114100', '0417', 'Tai\'an', '122.4358500', '41.4126500');
INSERT INTO `sys_cn_area` VALUES ('210323', '岫岩满族自治县', '岫岩', '210300', null, '中国,辽宁省,鞍山市,岫岩满族自治县', '3', '114300', '0418', 'Xiuyan', '123.2887500', '40.2799600');
INSERT INTO `sys_cn_area` VALUES ('210381', '海城市', '海城', '210300', null, '中国,辽宁省,鞍山市,海城市', '3', '114200', '0416', 'Haicheng', '122.6845700', '40.8814200');
INSERT INTO `sys_cn_area` VALUES ('210400', '抚顺市', '抚顺', '210000', null, '中国,辽宁省,抚顺市', '2', '113008', '024', 'Fushun', '123.9211090', '41.8759560');
INSERT INTO `sys_cn_area` VALUES ('210402', '新抚区', '新抚', '210400', null, '中国,辽宁省,抚顺市,新抚区', '3', '113008', '024', 'Xinfu', '123.9126400', '41.8620500');
INSERT INTO `sys_cn_area` VALUES ('210403', '东洲区', '东洲', '210400', null, '中国,辽宁省,抚顺市,东洲区', '3', '113003', '024', 'Dongzhou', '124.0375900', '41.8519000');
INSERT INTO `sys_cn_area` VALUES ('210404', '望花区', '望花', '210400', null, '中国,辽宁省,抚顺市,望花区', '3', '113001', '024', 'Wanghua', '123.7828300', '41.8553200');
INSERT INTO `sys_cn_area` VALUES ('210411', '顺城区', '顺城', '210400', null, '中国,辽宁省,抚顺市,顺城区', '3', '113006', '024', 'Shuncheng', '123.9450600', '41.8832100');
INSERT INTO `sys_cn_area` VALUES ('210421', '抚顺县', '抚顺', '210400', null, '中国,辽宁省,抚顺市,抚顺县', '3', '113006', '024', 'Fushun', '124.1775500', '41.7121700');
INSERT INTO `sys_cn_area` VALUES ('210422', '新宾满族自治县', '新宾', '210400', null, '中国,辽宁省,抚顺市,新宾满族自治县', '3', '113200', '024', 'Xinbin', '125.0404900', '41.7340900');
INSERT INTO `sys_cn_area` VALUES ('210423', '清原满族自治县', '清原', '210400', null, '中国,辽宁省,抚顺市,清原满族自治县', '3', '113300', '024', 'Qingyuan', '124.9280700', '42.1022100');
INSERT INTO `sys_cn_area` VALUES ('210500', '本溪市', '本溪', '210000', null, '中国,辽宁省,本溪市', '2', '117000', '0414', 'Benxi', '123.7705190', '41.2979090');
INSERT INTO `sys_cn_area` VALUES ('210502', '平山区', '平山', '210500', null, '中国,辽宁省,本溪市,平山区', '3', '117000', '0414', 'Pingshan', '123.7689200', '41.2997000');
INSERT INTO `sys_cn_area` VALUES ('210503', '溪湖区', '溪湖', '210500', null, '中国,辽宁省,本溪市,溪湖区', '3', '117002', '0414', 'Xihu', '123.7676400', '41.3292100');
INSERT INTO `sys_cn_area` VALUES ('210504', '明山区', '明山', '210500', null, '中国,辽宁省,本溪市,明山区', '3', '117021', '0414', 'Mingshan', '123.8174600', '41.3082700');
INSERT INTO `sys_cn_area` VALUES ('210505', '南芬区', '南芬', '210500', null, '中国,辽宁省,本溪市,南芬区', '3', '117014', '0414', 'Nanfen', '123.7452300', '41.1006000');
INSERT INTO `sys_cn_area` VALUES ('210521', '本溪满族自治县', '本溪', '210500', null, '中国,辽宁省,本溪市,本溪满族自治县', '3', '117100', '0414', 'Benxi', '124.1274100', '41.3005900');
INSERT INTO `sys_cn_area` VALUES ('210522', '桓仁满族自治县', '桓仁', '210500', null, '中国,辽宁省,本溪市,桓仁满族自治县', '3', '117200', '0414', 'Huanren', '125.3606200', '41.2679800');
INSERT INTO `sys_cn_area` VALUES ('210600', '丹东市', '丹东', '210000', null, '中国,辽宁省,丹东市', '2', '118000', '0415', 'Dandong', '124.3830440', '40.1242960');
INSERT INTO `sys_cn_area` VALUES ('210602', '元宝区', '元宝', '210600', null, '中国,辽宁省,丹东市,元宝区', '3', '118000', '0415', 'Yuanbao', '124.3957500', '40.1365100');
INSERT INTO `sys_cn_area` VALUES ('210603', '振兴区', '振兴', '210600', null, '中国,辽宁省,丹东市,振兴区', '3', '118002', '0415', 'Zhenxing', '124.3603500', '40.1048900');
INSERT INTO `sys_cn_area` VALUES ('210604', '振安区', '振安', '210600', null, '中国,辽宁省,丹东市,振安区', '3', '118001', '0415', 'Zhen\'an', '124.4281600', '40.1582600');
INSERT INTO `sys_cn_area` VALUES ('210624', '宽甸满族自治县', '宽甸', '210600', null, '中国,辽宁省,丹东市,宽甸满族自治县', '3', '118200', '0415', 'Kuandian', '124.7824700', '40.7318700');
INSERT INTO `sys_cn_area` VALUES ('210681', '东港市', '东港', '210600', null, '中国,辽宁省,丹东市,东港市', '3', '118300', '0415', 'Donggang', '124.1628700', '39.8625600');
INSERT INTO `sys_cn_area` VALUES ('210682', '凤城市', '凤城', '210600', null, '中国,辽宁省,丹东市,凤城市', '3', '118100', '0415', 'Fengcheng', '124.0667100', '40.4530200');
INSERT INTO `sys_cn_area` VALUES ('210700', '锦州市', '锦州', '210000', null, '中国,辽宁省,锦州市', '2', '121000', '0416', 'Jinzhou', '121.1357420', '41.1192690');
INSERT INTO `sys_cn_area` VALUES ('210702', '古塔区', '古塔', '210700', null, '中国,辽宁省,锦州市,古塔区', '3', '121001', '0416', 'Guta', '121.1283200', '41.1172500');
INSERT INTO `sys_cn_area` VALUES ('210703', '凌河区', '凌河', '210700', null, '中国,辽宁省,锦州市,凌河区', '3', '121000', '0416', 'Linghe', '121.1508900', '41.1149600');
INSERT INTO `sys_cn_area` VALUES ('210711', '太和区', '太和', '210700', null, '中国,辽宁省,锦州市,太和区', '3', '121011', '0416', 'Taihe', '121.1035400', '41.1092900');
INSERT INTO `sys_cn_area` VALUES ('210726', '黑山县', '黑山', '210700', null, '中国,辽宁省,锦州市,黑山县', '3', '121400', '0416', 'Heishan', '122.1208100', '41.6941700');
INSERT INTO `sys_cn_area` VALUES ('210727', '义县', '义县', '210700', null, '中国,辽宁省,锦州市,义县', '3', '121100', '0416', 'Yixian', '121.2403500', '41.5345800');
INSERT INTO `sys_cn_area` VALUES ('210781', '凌海市', '凌海', '210700', null, '中国,辽宁省,锦州市,凌海市', '3', '121200', '0416', 'Linghai', '121.3570500', '41.1737000');
INSERT INTO `sys_cn_area` VALUES ('210782', '北镇市', '北镇', '210700', null, '中国,辽宁省,锦州市,北镇市', '3', '121300', '0416', 'Beizhen', '121.7985800', '41.5953700');
INSERT INTO `sys_cn_area` VALUES ('210800', '营口市', '营口', '210000', null, '中国,辽宁省,营口市', '2', '115003', '0417', 'Yingkou', '122.2351510', '40.6674320');
INSERT INTO `sys_cn_area` VALUES ('210802', '站前区', '站前', '210800', null, '中国,辽宁省,营口市,站前区', '3', '115002', '0417', 'Zhanqian', '122.2589600', '40.6726600');
INSERT INTO `sys_cn_area` VALUES ('210803', '西市区', '西市', '210800', null, '中国,辽宁省,营口市,西市区', '3', '115004', '0417', 'Xishi', '122.2064100', '40.6664000');
INSERT INTO `sys_cn_area` VALUES ('210804', '鲅鱼圈区', '鲅鱼圈', '210800', null, '中国,辽宁省,营口市,鲅鱼圈区', '3', '115007', '0417', 'Bayuquan', '122.1326600', '40.2686500');
INSERT INTO `sys_cn_area` VALUES ('210811', '老边区', '老边', '210800', null, '中国,辽宁省,营口市,老边区', '3', '115005', '0417', 'Laobian', '122.3799600', '40.6803000');
INSERT INTO `sys_cn_area` VALUES ('210881', '盖州市', '盖州', '210800', null, '中国,辽宁省,营口市,盖州市', '3', '115200', '0417', 'Gaizhou', '122.3546400', '40.4044600');
INSERT INTO `sys_cn_area` VALUES ('210882', '大石桥市', '大石桥', '210800', null, '中国,辽宁省,营口市,大石桥市', '3', '115100', '0417', 'Dashiqiao', '122.5092700', '40.6456700');
INSERT INTO `sys_cn_area` VALUES ('210900', '阜新市', '阜新', '210000', null, '中国,辽宁省,阜新市', '2', '123000', '0418', 'Fuxin', '121.6489620', '42.0117960');
INSERT INTO `sys_cn_area` VALUES ('210902', '海州区', '海州', '210900', null, '中国,辽宁省,阜新市,海州区', '3', '123000', '0418', 'Haizhou', '121.6562600', '42.0133600');
INSERT INTO `sys_cn_area` VALUES ('210903', '新邱区', '新邱', '210900', null, '中国,辽宁省,阜新市,新邱区', '3', '123005', '0418', 'Xinqiu', '121.7925100', '42.0918100');
INSERT INTO `sys_cn_area` VALUES ('210904', '太平区', '太平', '210900', null, '中国,辽宁省,阜新市,太平区', '3', '123003', '0418', 'Taiping', '121.6786500', '42.0106500');
INSERT INTO `sys_cn_area` VALUES ('210905', '清河门区', '清河门', '210900', null, '中国,辽宁省,阜新市,清河门区', '3', '123006', '0418', 'Qinghemen', '121.4161000', '41.7830900');
INSERT INTO `sys_cn_area` VALUES ('210911', '细河区', '细河', '210900', null, '中国,辽宁省,阜新市,细河区', '3', '123000', '0418', 'Xihe', '121.6801300', '42.0253300');
INSERT INTO `sys_cn_area` VALUES ('210921', '阜新蒙古族自治县', '阜新', '210900', null, '中国,辽宁省,阜新市,阜新蒙古族自治县', '3', '123100', '0418', 'Fuxin', '121.7578700', '42.0651000');
INSERT INTO `sys_cn_area` VALUES ('210922', '彰武县', '彰武', '210900', null, '中国,辽宁省,阜新市,彰武县', '3', '123200', '0418', 'Zhangwu', '122.5402200', '42.3862500');
INSERT INTO `sys_cn_area` VALUES ('211000', '辽阳市', '辽阳', '210000', null, '中国,辽宁省,辽阳市', '2', '111000', '0419', 'Liaoyang', '123.1815200', '41.2694020');
INSERT INTO `sys_cn_area` VALUES ('211002', '白塔区', '白塔', '211000', null, '中国,辽宁省,辽阳市,白塔区', '3', '111000', '0419', 'Baita', '123.1747000', '41.2702500');
INSERT INTO `sys_cn_area` VALUES ('211003', '文圣区', '文圣', '211000', null, '中国,辽宁省,辽阳市,文圣区', '3', '111000', '0419', 'Wensheng', '123.1852100', '41.2626700');
INSERT INTO `sys_cn_area` VALUES ('211004', '宏伟区', '宏伟', '211000', null, '中国,辽宁省,辽阳市,宏伟区', '3', '111003', '0419', 'Hongwei', '123.1929000', '41.2185200');
INSERT INTO `sys_cn_area` VALUES ('211005', '弓长岭区', '弓长岭', '211000', null, '中国,辽宁省,辽阳市,弓长岭区', '3', '111008', '0419', 'Gongchangling', '123.4196300', '41.1518100');
INSERT INTO `sys_cn_area` VALUES ('211011', '太子河区', '太子河', '211000', null, '中国,辽宁省,辽阳市,太子河区', '3', '111000', '0419', 'Taizihe', '123.1818200', '41.2533700');
INSERT INTO `sys_cn_area` VALUES ('211021', '辽阳县', '辽阳', '211000', null, '中国,辽宁省,辽阳市,辽阳县', '3', '111200', '0419', 'Liaoyang', '123.1057400', '41.2054200');
INSERT INTO `sys_cn_area` VALUES ('211081', '灯塔市', '灯塔', '211000', null, '中国,辽宁省,辽阳市,灯塔市', '3', '111300', '0419', 'Dengta', '123.3392600', '41.4261200');
INSERT INTO `sys_cn_area` VALUES ('211100', '盘锦市', '盘锦', '210000', null, '中国,辽宁省,盘锦市', '2', '124010', '0427', 'Panjin', '122.0695700', '41.1244840');
INSERT INTO `sys_cn_area` VALUES ('211102', '双台子区', '双台子', '211100', null, '中国,辽宁省,盘锦市,双台子区', '3', '124000', '0427', 'Shuangtaizi', '122.0601100', '41.1906000');
INSERT INTO `sys_cn_area` VALUES ('211103', '兴隆台区', '兴隆台', '211100', null, '中国,辽宁省,盘锦市,兴隆台区', '3', '124010', '0427', 'Xinglongtai', '122.0752900', '41.1240200');
INSERT INTO `sys_cn_area` VALUES ('211121', '大洼县', '大洼', '211100', null, '中国,辽宁省,盘锦市,大洼县', '3', '124200', '0427', 'Dawa', '122.0823900', '41.0024400');
INSERT INTO `sys_cn_area` VALUES ('211122', '盘山县', '盘山', '211100', null, '中国,辽宁省,盘锦市,盘山县', '3', '124000', '0427', 'Panshan', '121.9977700', '41.2380500');
INSERT INTO `sys_cn_area` VALUES ('211200', '铁岭市', '铁岭', '210000', null, '中国,辽宁省,铁岭市', '2', '112000', '024', 'Tieling', '123.8442790', '42.2905850');
INSERT INTO `sys_cn_area` VALUES ('211202', '银州区', '银州', '211200', null, '中国,辽宁省,铁岭市,银州区', '3', '112000', '024', 'Yinzhou', '123.8573000', '42.2950700');
INSERT INTO `sys_cn_area` VALUES ('211204', '清河区', '清河', '211200', null, '中国,辽宁省,铁岭市,清河区', '3', '112003', '024', 'Qinghe', '124.1591100', '42.5467900');
INSERT INTO `sys_cn_area` VALUES ('211221', '铁岭县', '铁岭', '211200', null, '中国,辽宁省,铁岭市,铁岭县', '3', '112000', '024', 'Tieling', '123.7732500', '42.2249800');
INSERT INTO `sys_cn_area` VALUES ('211223', '西丰县', '西丰', '211200', null, '中国,辽宁省,铁岭市,西丰县', '3', '112400', '024', 'Xifeng', '124.7304000', '42.7375600');
INSERT INTO `sys_cn_area` VALUES ('211224', '昌图县', '昌图', '211200', null, '中国,辽宁省,铁岭市,昌图县', '3', '112500', '024', 'Changtu', '124.1120600', '42.7842800');
INSERT INTO `sys_cn_area` VALUES ('211281', '调兵山市', '调兵山', '211200', null, '中国,辽宁省,铁岭市,调兵山市', '3', '112700', '024', 'Diaobingshan', '123.5668900', '42.4675000');
INSERT INTO `sys_cn_area` VALUES ('211282', '开原市', '开原', '211200', null, '中国,辽宁省,铁岭市,开原市', '3', '112300', '024', 'Kaiyuan', '124.0394500', '42.5458500');
INSERT INTO `sys_cn_area` VALUES ('211300', '朝阳市', '朝阳', '210000', null, '中国,辽宁省,朝阳市', '2', '122000', '0421', 'Chaoyang', '120.4511760', '41.5767580');
INSERT INTO `sys_cn_area` VALUES ('211302', '双塔区', '双塔', '211300', null, '中国,辽宁省,朝阳市,双塔区', '3', '122000', '0421', 'Shuangta', '120.4538500', '41.5660000');
INSERT INTO `sys_cn_area` VALUES ('211303', '龙城区', '龙城', '211300', null, '中国,辽宁省,朝阳市,龙城区', '3', '122000', '0421', 'Longcheng', '120.4371900', '41.5926400');
INSERT INTO `sys_cn_area` VALUES ('211321', '朝阳县', '朝阳', '211300', null, '中国,辽宁省,朝阳市,朝阳县', '3', '122000', '0421', 'Chaoyang', '120.1740100', '41.4324000');
INSERT INTO `sys_cn_area` VALUES ('211322', '建平县', '建平', '211300', null, '中国,辽宁省,朝阳市,建平县', '3', '122400', '0421', 'Jianping', '119.6439200', '41.4031500');
INSERT INTO `sys_cn_area` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '喀喇沁左翼', '211300', null, '中国,辽宁省,朝阳市,喀喇沁左翼蒙古族自治县', '3', '122300', '0421', 'Kalaqinzuoyi', '119.7418500', '41.1280100');
INSERT INTO `sys_cn_area` VALUES ('211381', '北票市', '北票', '211300', null, '中国,辽宁省,朝阳市,北票市', '3', '122100', '0421', 'Beipiao', '120.7697700', '41.8019600');
INSERT INTO `sys_cn_area` VALUES ('211382', '凌源市', '凌源', '211300', null, '中国,辽宁省,朝阳市,凌源市', '3', '122500', '0421', 'Lingyuan', '119.4014800', '41.2455800');
INSERT INTO `sys_cn_area` VALUES ('211400', '葫芦岛市', '葫芦岛', '210000', null, '中国,辽宁省,葫芦岛市', '2', '125000', '0429', 'Huludao', '120.8563940', '40.7555720');
INSERT INTO `sys_cn_area` VALUES ('211402', '连山区', '连山', '211400', null, '中国,辽宁省,葫芦岛市,连山区', '3', '125001', '0429', 'Lianshan', '120.8639300', '40.7555400');
INSERT INTO `sys_cn_area` VALUES ('211403', '龙港区', '龙港', '211400', null, '中国,辽宁省,葫芦岛市,龙港区', '3', '125003', '0429', 'Longgang', '120.9486600', '40.7191900');
INSERT INTO `sys_cn_area` VALUES ('211404', '南票区', '南票', '211400', null, '中国,辽宁省,葫芦岛市,南票区', '3', '125027', '0429', 'Nanpiao', '120.7497800', '41.1070700');
INSERT INTO `sys_cn_area` VALUES ('211421', '绥中县', '绥中', '211400', null, '中国,辽宁省,葫芦岛市,绥中县', '3', '125200', '0429', 'Suizhong', '120.3445100', '40.3255200');
INSERT INTO `sys_cn_area` VALUES ('211422', '建昌县', '建昌', '211400', null, '中国,辽宁省,葫芦岛市,建昌县', '3', '125300', '0429', 'Jianchang', '119.8377000', '40.8244800');
INSERT INTO `sys_cn_area` VALUES ('211481', '兴城市', '兴城', '211400', null, '中国,辽宁省,葫芦岛市,兴城市', '3', '125100', '0429', 'Xingcheng', '120.7253700', '40.6149200');
INSERT INTO `sys_cn_area` VALUES ('211500', '金普新区', '金普新区', '210000', null, '中国,辽宁省,金普新区', '2', '116100', '0411', 'Jinpuxinqu', '121.7896270', '39.0554510');
INSERT INTO `sys_cn_area` VALUES ('211501', '金州新区', '金州新区', '211500', null, '中国,辽宁省,金普新区,金州新区', '3', '116100', '0411', 'Jinzhouxinqu', '121.7848210', '39.0522520');
INSERT INTO `sys_cn_area` VALUES ('211502', '普湾新区', '普湾新区', '211500', null, '中国,辽宁省,金普新区,普湾新区', '3', '116200', '0411', 'Puwanxinqu', '121.8128120', '39.3300930');
INSERT INTO `sys_cn_area` VALUES ('211503', '保税区', '保税区', '211500', null, '中国,辽宁省,金普新区,保税区', '3', '116100', '0411', 'Baoshuiqu', '121.9428900', '39.2246140');
INSERT INTO `sys_cn_area` VALUES ('220000', '吉林省', '吉林', '100000', null, '中国,吉林省', '1', null, '', 'Jilin', '125.3245000', '43.8868410');
INSERT INTO `sys_cn_area` VALUES ('220100', '长春市', '长春', '220000', null, '中国,吉林省,长春市', '2', '130022', '0431', 'Changchun', '125.3245000', '43.8868410');
INSERT INTO `sys_cn_area` VALUES ('220102', '南关区', '南关', '220100', null, '中国,吉林省,长春市,南关区', '3', '130022', '0431', 'Nanguan', '125.3503500', '43.8640100');
INSERT INTO `sys_cn_area` VALUES ('220103', '宽城区', '宽城', '220100', null, '中国,吉林省,长春市,宽城区', '3', '130051', '0431', 'Kuancheng', '125.3263500', '43.9018200');
INSERT INTO `sys_cn_area` VALUES ('220104', '朝阳区', '朝阳', '220100', null, '中国,吉林省,长春市,朝阳区', '3', '130012', '0431', 'Chaoyang', '125.2883000', '43.8333900');
INSERT INTO `sys_cn_area` VALUES ('220105', '二道区', '二道', '220100', null, '中国,吉林省,长春市,二道区', '3', '130031', '0431', 'Erdao', '125.3742900', '43.8650100');
INSERT INTO `sys_cn_area` VALUES ('220106', '绿园区', '绿园', '220100', null, '中国,吉林省,长春市,绿园区', '3', '130062', '0431', 'Lvyuan', '125.2558200', '43.8804500');
INSERT INTO `sys_cn_area` VALUES ('220112', '双阳区', '双阳', '220100', null, '中国,吉林省,长春市,双阳区', '3', '130600', '0431', 'Shuangyang', '125.6563100', '43.5280300');
INSERT INTO `sys_cn_area` VALUES ('220113', '九台区', '九台', '220100', null, '中国,吉林省,长春市,九台区', '3', '130500', '0431', 'Jiutai', '125.8395000', '44.1516300');
INSERT INTO `sys_cn_area` VALUES ('220122', '农安县', '农安', '220100', null, '中国,吉林省,长春市,农安县', '3', '130200', '0431', 'Nong\'an', '125.1848100', '44.4326500');
INSERT INTO `sys_cn_area` VALUES ('220182', '榆树市', '榆树', '220100', null, '中国,吉林省,长春市,榆树市', '3', '130400', '0431', 'Yushu', '126.5568800', '44.8252300');
INSERT INTO `sys_cn_area` VALUES ('220183', '德惠市', '德惠', '220100', null, '中国,吉林省,长春市,德惠市', '3', '130300', '0431', 'Dehui', '125.7053800', '44.5371900');
INSERT INTO `sys_cn_area` VALUES ('220200', '吉林市', '吉林', '220000', null, '中国,吉林省,吉林市', '2', '132011', '0432', 'Jilin', '126.5530200', '43.8435770');
INSERT INTO `sys_cn_area` VALUES ('220202', '昌邑区', '昌邑', '220200', null, '中国,吉林省,吉林市,昌邑区', '3', '132002', '0432', 'Changyi', '126.5742400', '43.8818300');
INSERT INTO `sys_cn_area` VALUES ('220203', '龙潭区', '龙潭', '220200', null, '中国,吉林省,吉林市,龙潭区', '3', '132021', '0432', 'Longtan', '126.5621300', '43.9105400');
INSERT INTO `sys_cn_area` VALUES ('220204', '船营区', '船营', '220200', null, '中国,吉林省,吉林市,船营区', '3', '132011', '0432', 'Chuanying', '126.5409600', '43.8334400');
INSERT INTO `sys_cn_area` VALUES ('220211', '丰满区', '丰满', '220200', null, '中国,吉林省,吉林市,丰满区', '3', '132013', '0432', 'Fengman', '126.5623700', '43.8223600');
INSERT INTO `sys_cn_area` VALUES ('220221', '永吉县', '永吉', '220200', null, '中国,吉林省,吉林市,永吉县', '3', '132200', '0432', 'Yongji', '126.4963000', '43.6719700');
INSERT INTO `sys_cn_area` VALUES ('220281', '蛟河市', '蛟河', '220200', null, '中国,吉林省,吉林市,蛟河市', '3', '132500', '0432', 'Jiaohe', '127.3442600', '43.7269600');
INSERT INTO `sys_cn_area` VALUES ('220282', '桦甸市', '桦甸', '220200', null, '中国,吉林省,吉林市,桦甸市', '3', '132400', '0432', 'Huadian', '126.7462400', '42.9720600');
INSERT INTO `sys_cn_area` VALUES ('220283', '舒兰市', '舒兰', '220200', null, '中国,吉林省,吉林市,舒兰市', '3', '132600', '0432', 'Shulan', '126.9653000', '44.4058200');
INSERT INTO `sys_cn_area` VALUES ('220284', '磐石市', '磐石', '220200', null, '中国,吉林省,吉林市,磐石市', '3', '132300', '0432', 'Panshi', '126.0625000', '42.9462800');
INSERT INTO `sys_cn_area` VALUES ('220300', '四平市', '四平', '220000', null, '中国,吉林省,四平市', '2', '136000', '0434', 'Siping', '124.3707850', '43.1703440');
INSERT INTO `sys_cn_area` VALUES ('220302', '铁西区', '铁西', '220300', null, '中国,吉林省,四平市,铁西区', '3', '136000', '0434', 'Tiexi', '124.3736900', '43.1745600');
INSERT INTO `sys_cn_area` VALUES ('220303', '铁东区', '铁东', '220300', null, '中国,吉林省,四平市,铁东区', '3', '136001', '0434', 'Tiedong', '124.4097600', '43.1624100');
INSERT INTO `sys_cn_area` VALUES ('220322', '梨树县', '梨树', '220300', null, '中国,吉林省,四平市,梨树县', '3', '136500', '0434', 'Lishu', '124.3356300', '43.3071700');
INSERT INTO `sys_cn_area` VALUES ('220323', '伊通满族自治县', '伊通', '220300', null, '中国,吉林省,四平市,伊通满族自治县', '3', '130700', '0434', 'Yitong', '125.3059600', '43.3443400');
INSERT INTO `sys_cn_area` VALUES ('220381', '公主岭市', '公主岭', '220300', null, '中国,吉林省,四平市,公主岭市', '3', '136100', '0434', 'Gongzhuling', '124.8226600', '43.5045300');
INSERT INTO `sys_cn_area` VALUES ('220382', '双辽市', '双辽', '220300', null, '中国,吉林省,四平市,双辽市', '3', '136400', '0434', 'Shuangliao', '123.5010600', '43.5209900');
INSERT INTO `sys_cn_area` VALUES ('220400', '辽源市', '辽源', '220000', null, '中国,吉林省,辽源市', '2', '136200', '0437', 'Liaoyuan', '125.1453490', '42.9026920');
INSERT INTO `sys_cn_area` VALUES ('220402', '龙山区', '龙山', '220400', null, '中国,吉林省,辽源市,龙山区', '3', '136200', '0437', 'Longshan', '125.1364100', '42.8971400');
INSERT INTO `sys_cn_area` VALUES ('220403', '西安区', '西安', '220400', null, '中国,吉林省,辽源市,西安区', '3', '136201', '0437', 'Xi\'an', '125.1490400', '42.9270000');
INSERT INTO `sys_cn_area` VALUES ('220421', '东丰县', '东丰', '220400', null, '中国,吉林省,辽源市,东丰县', '3', '136300', '0437', 'Dongfeng', '125.5324400', '42.6783000');
INSERT INTO `sys_cn_area` VALUES ('220422', '东辽县', '东辽', '220400', null, '中国,吉林省,辽源市,东辽县', '3', '136600', '0437', 'Dongliao', '124.9859600', '42.9249200');
INSERT INTO `sys_cn_area` VALUES ('220500', '通化市', '通化', '220000', null, '中国,吉林省,通化市', '2', '134001', '0435', 'Tonghua', '125.9365010', '41.7211770');
INSERT INTO `sys_cn_area` VALUES ('220502', '东昌区', '东昌', '220500', null, '中国,吉林省,通化市,东昌区', '3', '134001', '0435', 'Dongchang', '125.9551000', '41.7284900');
INSERT INTO `sys_cn_area` VALUES ('220503', '二道江区', '二道江', '220500', null, '中国,吉林省,通化市,二道江区', '3', '134003', '0435', 'Erdaojiang', '126.0425700', '41.7741000');
INSERT INTO `sys_cn_area` VALUES ('220521', '通化县', '通化', '220500', null, '中国,吉林省,通化市,通化县', '3', '134100', '0435', 'Tonghua', '125.7593600', '41.6792800');
INSERT INTO `sys_cn_area` VALUES ('220523', '辉南县', '辉南', '220500', null, '中国,吉林省,通化市,辉南县', '3', '135100', '0435', 'Huinan', '126.0468400', '42.6849700');
INSERT INTO `sys_cn_area` VALUES ('220524', '柳河县', '柳河', '220500', null, '中国,吉林省,通化市,柳河县', '3', '135300', '0435', 'Liuhe', '125.7447500', '42.2846800');
INSERT INTO `sys_cn_area` VALUES ('220581', '梅河口市', '梅河口', '220500', null, '中国,吉林省,通化市,梅河口市', '3', '135000', '0435', 'Meihekou', '125.7104100', '42.5382800');
INSERT INTO `sys_cn_area` VALUES ('220582', '集安市', '集安', '220500', null, '中国,吉林省,通化市,集安市', '3', '134200', '0435', 'Ji\'an', '126.1882900', '41.1226800');
INSERT INTO `sys_cn_area` VALUES ('220600', '白山市', '白山', '220000', null, '中国,吉林省,白山市', '2', '134300', '0439', 'Baishan', '126.4278390', '41.9425050');
INSERT INTO `sys_cn_area` VALUES ('220602', '浑江区', '浑江', '220600', null, '中国,吉林省,白山市,浑江区', '3', '134300', '0439', 'Hunjiang', '126.4223420', '41.9456560');
INSERT INTO `sys_cn_area` VALUES ('220605', '江源区', '江源', '220600', null, '中国,吉林省,白山市,江源区', '3', '134700', '0439', 'Jiangyuan', '126.5907900', '42.0566400');
INSERT INTO `sys_cn_area` VALUES ('220621', '抚松县', '抚松', '220600', null, '中国,吉林省,白山市,抚松县', '3', '134500', '0439', 'Fusong', '127.2803000', '42.3419800');
INSERT INTO `sys_cn_area` VALUES ('220622', '靖宇县', '靖宇', '220600', null, '中国,吉林省,白山市,靖宇县', '3', '135200', '0439', 'Jingyu', '126.8130800', '42.3886300');
INSERT INTO `sys_cn_area` VALUES ('220623', '长白朝鲜族自治县', '长白', '220600', null, '中国,吉林省,白山市,长白朝鲜族自治县', '3', '134400', '0439', 'Changbai', '128.2004700', '41.4199600');
INSERT INTO `sys_cn_area` VALUES ('220681', '临江市', '临江', '220600', null, '中国,吉林省,白山市,临江市', '3', '134600', '0439', 'Linjiang', '126.9175100', '41.8114200');
INSERT INTO `sys_cn_area` VALUES ('220700', '松原市', '松原', '220000', null, '中国,吉林省,松原市', '2', '138000', '0438', 'Songyuan', '124.8236080', '45.1182430');
INSERT INTO `sys_cn_area` VALUES ('220702', '宁江区', '宁江', '220700', null, '中国,吉林省,松原市,宁江区', '3', '138000', '0438', 'Ningjiang', '124.8168900', '45.1717500');
INSERT INTO `sys_cn_area` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '前郭尔罗斯', '220700', null, '中国,吉林省,松原市,前郭尔罗斯蒙古族自治县', '3', '138000', '0438', 'Qianguoerluosi', '124.8235100', '45.1172600');
INSERT INTO `sys_cn_area` VALUES ('220722', '长岭县', '长岭', '220700', null, '中国,吉林省,松原市,长岭县', '3', '131500', '0438', 'Changling', '123.9672500', '44.2758100');
INSERT INTO `sys_cn_area` VALUES ('220723', '乾安县', '乾安', '220700', null, '中国,吉林省,松原市,乾安县', '3', '131400', '0438', 'Qian\'an', '124.0273700', '45.0106800');
INSERT INTO `sys_cn_area` VALUES ('220781', '扶余市', '扶余', '220700', null, '中国,吉林省,松原市,扶余市', '3', '131200', '0438', 'Fuyu', '126.0427580', '44.9861990');
INSERT INTO `sys_cn_area` VALUES ('220800', '白城市', '白城', '220000', null, '中国,吉林省,白城市', '2', '137000', '0436', 'Baicheng', '122.8411140', '45.6190260');
INSERT INTO `sys_cn_area` VALUES ('220802', '洮北区', '洮北', '220800', null, '中国,吉林省,白城市,洮北区', '3', '137000', '0436', 'Taobei', '122.8510400', '45.6216700');
INSERT INTO `sys_cn_area` VALUES ('220821', '镇赉县', '镇赉', '220800', null, '中国,吉林省,白城市,镇赉县', '3', '137300', '0436', 'Zhenlai', '123.1992400', '45.8477900');
INSERT INTO `sys_cn_area` VALUES ('220822', '通榆县', '通榆', '220800', null, '中国,吉林省,白城市,通榆县', '3', '137200', '0436', 'Tongyu', '123.0876100', '44.8138800');
INSERT INTO `sys_cn_area` VALUES ('220881', '洮南市', '洮南', '220800', null, '中国,吉林省,白城市,洮南市', '3', '137100', '0436', 'Taonan', '122.7877200', '45.3350200');
INSERT INTO `sys_cn_area` VALUES ('220882', '大安市', '大安', '220800', null, '中国,吉林省,白城市,大安市', '3', '131300', '0436', 'Da\'an', '124.2951900', '45.5084600');
INSERT INTO `sys_cn_area` VALUES ('222400', '延边朝鲜族自治州', '延边', '220000', null, '中国,吉林省,延边朝鲜族自治州', '2', '133000', '0433', 'Yanbian', '129.5132280', '42.9048230');
INSERT INTO `sys_cn_area` VALUES ('222401', '延吉市', '延吉', '222400', null, '中国,吉林省,延边朝鲜族自治州,延吉市', '3', '133000', '0433', 'Yanji', '129.5135700', '42.9068200');
INSERT INTO `sys_cn_area` VALUES ('222402', '图们市', '图们', '222400', null, '中国,吉林省,延边朝鲜族自治州,图们市', '3', '133100', '0433', 'Tumen', '129.8438100', '42.9680100');
INSERT INTO `sys_cn_area` VALUES ('222403', '敦化市', '敦化', '222400', null, '中国,吉林省,延边朝鲜族自治州,敦化市', '3', '133700', '0433', 'Dunhua', '128.2324200', '43.3730400');
INSERT INTO `sys_cn_area` VALUES ('222404', '珲春市', '珲春', '222400', null, '中国,吉林省,延边朝鲜族自治州,珲春市', '3', '133300', '0433', 'Hunchun', '130.3657200', '42.8624200');
INSERT INTO `sys_cn_area` VALUES ('222405', '龙井市', '龙井', '222400', null, '中国,吉林省,延边朝鲜族自治州,龙井市', '3', '133400', '0433', 'Longjing', '129.4258400', '42.7680400');
INSERT INTO `sys_cn_area` VALUES ('222406', '和龙市', '和龙', '222400', null, '中国,吉林省,延边朝鲜族自治州,和龙市', '3', '133500', '0433', 'Helong', '129.0107700', '42.5464000');
INSERT INTO `sys_cn_area` VALUES ('222424', '汪清县', '汪清', '222400', null, '中国,吉林省,延边朝鲜族自治州,汪清县', '3', '133200', '0433', 'Wangqing', '129.7712100', '43.3127800');
INSERT INTO `sys_cn_area` VALUES ('222426', '安图县', '安图', '222400', null, '中国,吉林省,延边朝鲜族自治州,安图县', '3', '133600', '0433', 'Antu', '128.9062500', '43.1153300');
INSERT INTO `sys_cn_area` VALUES ('230000', '黑龙江省', '黑龙江', '100000', null, '中国,黑龙江省', '1', null, '', 'Heilongjiang', '126.6424640', '45.7569670');
INSERT INTO `sys_cn_area` VALUES ('230100', '哈尔滨市', '哈尔滨', '230000', null, '中国,黑龙江省,哈尔滨市', '2', '150010', '0451', 'Harbin', '126.6424640', '45.7569670');
INSERT INTO `sys_cn_area` VALUES ('230102', '道里区', '道里', '230100', null, '中国,黑龙江省,哈尔滨市,道里区', '3', '150010', '0451', 'Daoli', '126.6170500', '45.7558600');
INSERT INTO `sys_cn_area` VALUES ('230103', '南岗区', '南岗', '230100', null, '中国,黑龙江省,哈尔滨市,南岗区', '3', '150006', '0451', 'Nangang', '126.6685400', '45.7599600');
INSERT INTO `sys_cn_area` VALUES ('230104', '道外区', '道外', '230100', null, '中国,黑龙江省,哈尔滨市,道外区', '3', '150020', '0451', 'Daowai', '126.6493800', '45.7918700');
INSERT INTO `sys_cn_area` VALUES ('230108', '平房区', '平房', '230100', null, '中国,黑龙江省,哈尔滨市,平房区', '3', '150060', '0451', 'Pingfang', '126.6372900', '45.5977700');
INSERT INTO `sys_cn_area` VALUES ('230109', '松北区', '松北', '230100', null, '中国,黑龙江省,哈尔滨市,松北区', '3', '150028', '0451', 'Songbei', '126.5627600', '45.8083100');
INSERT INTO `sys_cn_area` VALUES ('230110', '香坊区', '香坊', '230100', null, '中国,黑龙江省,哈尔滨市,香坊区', '3', '150036', '0451', 'Xiangfang', '126.6796800', '45.7238300');
INSERT INTO `sys_cn_area` VALUES ('230111', '呼兰区', '呼兰', '230100', null, '中国,黑龙江省,哈尔滨市,呼兰区', '3', '150500', '0451', 'Hulan', '126.5879200', '45.8889500');
INSERT INTO `sys_cn_area` VALUES ('230112', '阿城区', '阿城', '230100', null, '中国,黑龙江省,哈尔滨市,阿城区', '3', '150300', '0451', 'A\'cheng', '126.9752500', '45.5414400');
INSERT INTO `sys_cn_area` VALUES ('230113', '双城区', '双城', '230100', null, '中国,黑龙江省,哈尔滨市,双城区', '3', '150100', '0451', 'Shuangcheng', '126.3087840', '45.3779420');
INSERT INTO `sys_cn_area` VALUES ('230123', '依兰县', '依兰', '230100', null, '中国,黑龙江省,哈尔滨市,依兰县', '3', '154800', '0451', 'Yilan', '129.5681700', '46.3247000');
INSERT INTO `sys_cn_area` VALUES ('230124', '方正县', '方正', '230100', null, '中国,黑龙江省,哈尔滨市,方正县', '3', '150800', '0451', 'Fangzheng', '128.8295200', '45.8516200');
INSERT INTO `sys_cn_area` VALUES ('230125', '宾县', '宾县', '230100', null, '中国,黑龙江省,哈尔滨市,宾县', '3', '150400', '0451', 'Binxian', '127.4867500', '45.7550400');
INSERT INTO `sys_cn_area` VALUES ('230126', '巴彦县', '巴彦', '230100', null, '中国,黑龙江省,哈尔滨市,巴彦县', '3', '151800', '0451', 'Bayan', '127.4079900', '46.0814800');
INSERT INTO `sys_cn_area` VALUES ('230127', '木兰县', '木兰', '230100', null, '中国,黑龙江省,哈尔滨市,木兰县', '3', '151900', '0451', 'Mulan', '128.0448000', '45.9494400');
INSERT INTO `sys_cn_area` VALUES ('230128', '通河县', '通河', '230100', null, '中国,黑龙江省,哈尔滨市,通河县', '3', '150900', '0451', 'Tonghe', '128.7460300', '45.9900700');
INSERT INTO `sys_cn_area` VALUES ('230129', '延寿县', '延寿', '230100', null, '中国,黑龙江省,哈尔滨市,延寿县', '3', '150700', '0451', 'Yanshou', '128.3341900', '45.4554000');
INSERT INTO `sys_cn_area` VALUES ('230183', '尚志市', '尚志', '230100', null, '中国,黑龙江省,哈尔滨市,尚志市', '3', '150600', '0451', 'Shangzhi', '127.9619100', '45.2173600');
INSERT INTO `sys_cn_area` VALUES ('230184', '五常市', '五常', '230100', null, '中国,黑龙江省,哈尔滨市,五常市', '3', '150200', '0451', 'Wuchang', '127.1675100', '44.9318400');
INSERT INTO `sys_cn_area` VALUES ('230200', '齐齐哈尔市', '齐齐哈尔', '230000', null, '中国,黑龙江省,齐齐哈尔市', '2', '161005', '0452', 'Qiqihar', '123.9534860', '47.3480790');
INSERT INTO `sys_cn_area` VALUES ('230202', '龙沙区', '龙沙', '230200', null, '中国,黑龙江省,齐齐哈尔市,龙沙区', '3', '161000', '0452', 'Longsha', '123.9575200', '47.3177600');
INSERT INTO `sys_cn_area` VALUES ('230203', '建华区', '建华', '230200', null, '中国,黑龙江省,齐齐哈尔市,建华区', '3', '161006', '0452', 'Jianhua', '124.0133000', '47.3671800');
INSERT INTO `sys_cn_area` VALUES ('230204', '铁锋区', '铁锋', '230200', null, '中国,黑龙江省,齐齐哈尔市,铁锋区', '3', '161000', '0452', 'Tiefeng', '123.9782100', '47.3407500');
INSERT INTO `sys_cn_area` VALUES ('230205', '昂昂溪区', '昂昂溪', '230200', null, '中国,黑龙江省,齐齐哈尔市,昂昂溪区', '3', '161031', '0452', 'Angangxi', '123.8222900', '47.1551300');
INSERT INTO `sys_cn_area` VALUES ('230206', '富拉尔基区', '富拉尔基', '230200', null, '中国,黑龙江省,齐齐哈尔市,富拉尔基区', '3', '161041', '0452', 'Fulaerji', '123.6291800', '47.2088400');
INSERT INTO `sys_cn_area` VALUES ('230207', '碾子山区', '碾子山', '230200', null, '中国,黑龙江省,齐齐哈尔市,碾子山区', '3', '161046', '0452', 'Nianzishan', '122.8818300', '47.5166200');
INSERT INTO `sys_cn_area` VALUES ('230208', '梅里斯达斡尔族区', '梅里斯', '230200', null, '中国,黑龙江省,齐齐哈尔市,梅里斯达斡尔族区', '3', '161021', '0452', 'Meilisi', '123.7527400', '47.3094600');
INSERT INTO `sys_cn_area` VALUES ('230221', '龙江县', '龙江', '230200', null, '中国,黑龙江省,齐齐哈尔市,龙江县', '3', '161100', '0452', 'Longjiang', '123.2053200', '47.3386800');
INSERT INTO `sys_cn_area` VALUES ('230223', '依安县', '依安', '230200', null, '中国,黑龙江省,齐齐哈尔市,依安县', '3', '161500', '0452', 'Yi\'an', '125.3089600', '47.8931000');
INSERT INTO `sys_cn_area` VALUES ('230224', '泰来县', '泰来', '230200', null, '中国,黑龙江省,齐齐哈尔市,泰来县', '3', '162400', '0452', 'Tailai', '123.4228500', '46.3938600');
INSERT INTO `sys_cn_area` VALUES ('230225', '甘南县', '甘南', '230200', null, '中国,黑龙江省,齐齐哈尔市,甘南县', '3', '162100', '0452', 'Gannan', '123.5031700', '47.9243700');
INSERT INTO `sys_cn_area` VALUES ('230227', '富裕县', '富裕', '230200', null, '中国,黑龙江省,齐齐哈尔市,富裕县', '3', '161200', '0452', 'Fuyu', '124.4745700', '47.7743100');
INSERT INTO `sys_cn_area` VALUES ('230229', '克山县', '克山', '230200', null, '中国,黑龙江省,齐齐哈尔市,克山县', '3', '161600', '0452', 'Keshan', '125.8739600', '48.0326500');
INSERT INTO `sys_cn_area` VALUES ('230230', '克东县', '克东', '230200', null, '中国,黑龙江省,齐齐哈尔市,克东县', '3', '164800', '0452', 'Kedong', '126.2491700', '48.0382800');
INSERT INTO `sys_cn_area` VALUES ('230231', '拜泉县', '拜泉', '230200', null, '中国,黑龙江省,齐齐哈尔市,拜泉县', '3', '164700', '0452', 'Baiquan', '126.0916700', '47.6081700');
INSERT INTO `sys_cn_area` VALUES ('230281', '讷河市', '讷河', '230200', null, '中国,黑龙江省,齐齐哈尔市,讷河市', '3', '161300', '0452', 'Nehe', '124.8771300', '48.4838800');
INSERT INTO `sys_cn_area` VALUES ('230300', '鸡西市', '鸡西', '230000', null, '中国,黑龙江省,鸡西市', '2', '158100', '0467', 'Jixi', '130.9759660', '45.3000460');
INSERT INTO `sys_cn_area` VALUES ('230302', '鸡冠区', '鸡冠', '230300', null, '中国,黑龙江省,鸡西市,鸡冠区', '3', '158100', '0467', 'Jiguan', '130.9813900', '45.3039600');
INSERT INTO `sys_cn_area` VALUES ('230303', '恒山区', '恒山', '230300', null, '中国,黑龙江省,鸡西市,恒山区', '3', '158130', '0467', 'Hengshan', '130.9049300', '45.2107100');
INSERT INTO `sys_cn_area` VALUES ('230304', '滴道区', '滴道', '230300', null, '中国,黑龙江省,鸡西市,滴道区', '3', '158150', '0467', 'Didao', '130.8484100', '45.3510900');
INSERT INTO `sys_cn_area` VALUES ('230305', '梨树区', '梨树', '230300', null, '中国,黑龙江省,鸡西市,梨树区', '3', '158160', '0467', 'Lishu', '130.6984800', '45.0903700');
INSERT INTO `sys_cn_area` VALUES ('230306', '城子河区', '城子河', '230300', null, '中国,黑龙江省,鸡西市,城子河区', '3', '158170', '0467', 'Chengzihe', '131.0113200', '45.3368900');
INSERT INTO `sys_cn_area` VALUES ('230307', '麻山区', '麻山', '230300', null, '中国,黑龙江省,鸡西市,麻山区', '3', '158180', '0467', 'Mashan', '130.4781100', '45.2120900');
INSERT INTO `sys_cn_area` VALUES ('230321', '鸡东县', '鸡东', '230300', null, '中国,黑龙江省,鸡西市,鸡东县', '3', '158200', '0467', 'Jidong', '131.1242300', '45.2602500');
INSERT INTO `sys_cn_area` VALUES ('230381', '虎林市', '虎林', '230300', null, '中国,黑龙江省,鸡西市,虎林市', '3', '158400', '0467', 'Hulin', '132.9367900', '45.7629100');
INSERT INTO `sys_cn_area` VALUES ('230382', '密山市', '密山', '230300', null, '中国,黑龙江省,鸡西市,密山市', '3', '158300', '0467', 'Mishan', '131.8462500', '45.5297000');
INSERT INTO `sys_cn_area` VALUES ('230400', '鹤岗市', '鹤岗', '230000', null, '中国,黑龙江省,鹤岗市', '2', '154100', '0468', 'Hegang', '130.2774870', '47.3320850');
INSERT INTO `sys_cn_area` VALUES ('230402', '向阳区', '向阳', '230400', null, '中国,黑龙江省,鹤岗市,向阳区', '3', '154100', '0468', 'Xiangyang', '130.2943000', '47.3424700');
INSERT INTO `sys_cn_area` VALUES ('230403', '工农区', '工农', '230400', null, '中国,黑龙江省,鹤岗市,工农区', '3', '154101', '0468', 'Gongnong', '130.2746800', '47.3186900');
INSERT INTO `sys_cn_area` VALUES ('230404', '南山区', '南山', '230400', null, '中国,黑龙江省,鹤岗市,南山区', '3', '154104', '0468', 'Nanshan', '130.2767600', '47.3140400');
INSERT INTO `sys_cn_area` VALUES ('230405', '兴安区', '兴安', '230400', null, '中国,黑龙江省,鹤岗市,兴安区', '3', '154102', '0468', 'Xing\'an', '130.2396500', '47.2526000');
INSERT INTO `sys_cn_area` VALUES ('230406', '东山区', '东山', '230400', null, '中国,黑龙江省,鹤岗市,东山区', '3', '154106', '0468', 'Dongshan', '130.3170600', '47.3385300');
INSERT INTO `sys_cn_area` VALUES ('230407', '兴山区', '兴山', '230400', null, '中国,黑龙江省,鹤岗市,兴山区', '3', '154105', '0468', 'Xingshan', '130.2927100', '47.3577600');
INSERT INTO `sys_cn_area` VALUES ('230421', '萝北县', '萝北', '230400', null, '中国,黑龙江省,鹤岗市,萝北县', '3', '154200', '0468', 'Luobei', '130.8334600', '47.5795900');
INSERT INTO `sys_cn_area` VALUES ('230422', '绥滨县', '绥滨', '230400', null, '中国,黑龙江省,鹤岗市,绥滨县', '3', '156200', '0468', 'Suibin', '131.8602900', '47.2903000');
INSERT INTO `sys_cn_area` VALUES ('230500', '双鸭山市', '双鸭山', '230000', null, '中国,黑龙江省,双鸭山市', '2', '155100', '0469', 'Shuangyashan', '131.1573040', '46.6434420');
INSERT INTO `sys_cn_area` VALUES ('230502', '尖山区', '尖山', '230500', null, '中国,黑龙江省,双鸭山市,尖山区', '3', '155100', '0469', 'Jianshan', '131.1584100', '46.6463500');
INSERT INTO `sys_cn_area` VALUES ('230503', '岭东区', '岭东', '230500', null, '中国,黑龙江省,双鸭山市,岭东区', '3', '155120', '0469', 'Lingdong', '131.1647300', '46.5904300');
INSERT INTO `sys_cn_area` VALUES ('230505', '四方台区', '四方台', '230500', null, '中国,黑龙江省,双鸭山市,四方台区', '3', '155130', '0469', 'Sifangtai', '131.3359300', '46.5949900');
INSERT INTO `sys_cn_area` VALUES ('230506', '宝山区', '宝山', '230500', null, '中国,黑龙江省,双鸭山市,宝山区', '3', '155131', '0469', 'Baoshan', '131.4016000', '46.5771800');
INSERT INTO `sys_cn_area` VALUES ('230521', '集贤县', '集贤', '230500', null, '中国,黑龙江省,双鸭山市,集贤县', '3', '155900', '0469', 'Jixian', '131.1405300', '46.7267800');
INSERT INTO `sys_cn_area` VALUES ('230522', '友谊县', '友谊', '230500', null, '中国,黑龙江省,双鸭山市,友谊县', '3', '155800', '0469', 'Youyi', '131.8078900', '46.7673900');
INSERT INTO `sys_cn_area` VALUES ('230523', '宝清县', '宝清', '230500', null, '中国,黑龙江省,双鸭山市,宝清县', '3', '155600', '0469', 'Baoqing', '132.1969500', '46.3271600');
INSERT INTO `sys_cn_area` VALUES ('230524', '饶河县', '饶河', '230500', null, '中国,黑龙江省,双鸭山市,饶河县', '3', '155700', '0469', 'Raohe', '134.0198600', '46.7989900');
INSERT INTO `sys_cn_area` VALUES ('230600', '大庆市', '大庆', '230000', null, '中国,黑龙江省,大庆市', '2', '163000', '0459', 'Daqing', '125.1127200', '46.5907340');
INSERT INTO `sys_cn_area` VALUES ('230602', '萨尔图区', '萨尔图', '230600', null, '中国,黑龙江省,大庆市,萨尔图区', '3', '163001', '0459', 'Saertu', '125.0879200', '46.5935900');
INSERT INTO `sys_cn_area` VALUES ('230603', '龙凤区', '龙凤', '230600', null, '中国,黑龙江省,大庆市,龙凤区', '3', '163711', '0459', 'Longfeng', '125.1165700', '46.5327300');
INSERT INTO `sys_cn_area` VALUES ('230604', '让胡路区', '让胡路', '230600', null, '中国,黑龙江省,大庆市,让胡路区', '3', '163712', '0459', 'Ranghulu', '124.8707500', '46.6522000');
INSERT INTO `sys_cn_area` VALUES ('230605', '红岗区', '红岗', '230600', null, '中国,黑龙江省,大庆市,红岗区', '3', '163511', '0459', 'Honggang', '124.8924800', '46.4012800');
INSERT INTO `sys_cn_area` VALUES ('230606', '大同区', '大同', '230600', null, '中国,黑龙江省,大庆市,大同区', '3', '163515', '0459', 'Datong', '124.8159100', '46.0329500');
INSERT INTO `sys_cn_area` VALUES ('230621', '肇州县', '肇州', '230600', null, '中国,黑龙江省,大庆市,肇州县', '3', '166400', '0459', 'Zhaozhou', '125.2705900', '45.7041400');
INSERT INTO `sys_cn_area` VALUES ('230622', '肇源县', '肇源', '230600', null, '中国,黑龙江省,大庆市,肇源县', '3', '166500', '0459', 'Zhaoyuan', '125.0845600', '45.5203200');
INSERT INTO `sys_cn_area` VALUES ('230623', '林甸县', '林甸', '230600', null, '中国,黑龙江省,大庆市,林甸县', '3', '166300', '0459', 'Lindian', '124.8756400', '47.1860100');
INSERT INTO `sys_cn_area` VALUES ('230624', '杜尔伯特蒙古族自治县', '杜尔伯特', '230600', null, '中国,黑龙江省,大庆市,杜尔伯特蒙古族自治县', '3', '166200', '0459', 'Duerbote', '124.4493700', '46.8650700');
INSERT INTO `sys_cn_area` VALUES ('230700', '伊春市', '伊春', '230000', null, '中国,黑龙江省,伊春市', '2', '153000', '0458', 'Yichun', '128.8993960', '47.7247750');
INSERT INTO `sys_cn_area` VALUES ('230702', '伊春区', '伊春', '230700', null, '中国,黑龙江省,伊春市,伊春区', '3', '153000', '0458', 'Yichun', '128.9075200', '47.7280000');
INSERT INTO `sys_cn_area` VALUES ('230703', '南岔区', '南岔', '230700', null, '中国,黑龙江省,伊春市,南岔区', '3', '153100', '0458', 'Nancha', '129.2836200', '47.1389700');
INSERT INTO `sys_cn_area` VALUES ('230704', '友好区', '友好', '230700', null, '中国,黑龙江省,伊春市,友好区', '3', '153031', '0458', 'Youhao', '128.8403900', '47.8537100');
INSERT INTO `sys_cn_area` VALUES ('230705', '西林区', '西林', '230700', null, '中国,黑龙江省,伊春市,西林区', '3', '153025', '0458', 'Xilin', '129.3120100', '47.4810300');
INSERT INTO `sys_cn_area` VALUES ('230706', '翠峦区', '翠峦', '230700', null, '中国,黑龙江省,伊春市,翠峦区', '3', '153013', '0458', 'Cuiluan', '128.6672900', '47.7250300');
INSERT INTO `sys_cn_area` VALUES ('230707', '新青区', '新青', '230700', null, '中国,黑龙江省,伊春市,新青区', '3', '153036', '0458', 'Xinqing', '129.5365300', '48.2906700');
INSERT INTO `sys_cn_area` VALUES ('230708', '美溪区', '美溪', '230700', null, '中国,黑龙江省,伊春市,美溪区', '3', '153021', '0458', 'Meixi', '129.1370800', '47.6351300');
INSERT INTO `sys_cn_area` VALUES ('230709', '金山屯区', '金山屯', '230700', null, '中国,黑龙江省,伊春市,金山屯区', '3', '153026', '0458', 'Jinshantun', '129.4376800', '47.4134900');
INSERT INTO `sys_cn_area` VALUES ('230710', '五营区', '五营', '230700', null, '中国,黑龙江省,伊春市,五营区', '3', '153033', '0458', 'Wuying', '129.2454500', '48.1079100');
INSERT INTO `sys_cn_area` VALUES ('230711', '乌马河区', '乌马河', '230700', null, '中国,黑龙江省,伊春市,乌马河区', '3', '153011', '0458', 'Wumahe', '128.7967200', '47.7280000');
INSERT INTO `sys_cn_area` VALUES ('230712', '汤旺河区', '汤旺河', '230700', null, '中国,黑龙江省,伊春市,汤旺河区', '3', '153037', '0458', 'Tangwanghe', '129.5722600', '48.4518200');
INSERT INTO `sys_cn_area` VALUES ('230713', '带岭区', '带岭', '230700', null, '中国,黑龙江省,伊春市,带岭区', '3', '153106', '0458', 'Dailing', '129.0235200', '47.0255300');
INSERT INTO `sys_cn_area` VALUES ('230714', '乌伊岭区', '乌伊岭', '230700', null, '中国,黑龙江省,伊春市,乌伊岭区', '3', '153038', '0458', 'Wuyiling', '129.4398100', '48.5960200');
INSERT INTO `sys_cn_area` VALUES ('230715', '红星区', '红星', '230700', null, '中国,黑龙江省,伊春市,红星区', '3', '153035', '0458', 'Hongxing', '129.3887000', '48.2394400');
INSERT INTO `sys_cn_area` VALUES ('230716', '上甘岭区', '上甘岭', '230700', null, '中国,黑龙江省,伊春市,上甘岭区', '3', '153032', '0458', 'Shangganling', '129.0244700', '47.9752200');
INSERT INTO `sys_cn_area` VALUES ('230722', '嘉荫县', '嘉荫', '230700', null, '中国,黑龙江省,伊春市,嘉荫县', '3', '153200', '0458', 'Jiayin', '130.3982500', '48.8917000');
INSERT INTO `sys_cn_area` VALUES ('230781', '铁力市', '铁力', '230700', null, '中国,黑龙江省,伊春市,铁力市', '3', '152500', '0458', 'Tieli', '128.0317000', '46.9857100');
INSERT INTO `sys_cn_area` VALUES ('230800', '佳木斯市', '佳木斯', '230000', null, '中国,黑龙江省,佳木斯市', '2', '154002', '0454', 'Jiamusi', '130.3616340', '46.8096060');
INSERT INTO `sys_cn_area` VALUES ('230803', '向阳区', '向阳', '230800', null, '中国,黑龙江省,佳木斯市,向阳区', '3', '154002', '0454', 'Xiangyang', '130.3651900', '46.8077800');
INSERT INTO `sys_cn_area` VALUES ('230804', '前进区', '前进', '230800', null, '中国,黑龙江省,佳木斯市,前进区', '3', '154002', '0454', 'Qianjin', '130.3749700', '46.8140100');
INSERT INTO `sys_cn_area` VALUES ('230805', '东风区', '东风', '230800', null, '中国,黑龙江省,佳木斯市,东风区', '3', '154005', '0454', 'Dongfeng', '130.4036600', '46.8225700');
INSERT INTO `sys_cn_area` VALUES ('230811', '郊区', '郊区', '230800', null, '中国,黑龙江省,佳木斯市,郊区', '3', '154004', '0454', 'Jiaoqu', '130.3273100', '46.8095800');
INSERT INTO `sys_cn_area` VALUES ('230822', '桦南县', '桦南', '230800', null, '中国,黑龙江省,佳木斯市,桦南县', '3', '154400', '0454', 'Huanan', '130.5536100', '46.2392100');
INSERT INTO `sys_cn_area` VALUES ('230826', '桦川县', '桦川', '230800', null, '中国,黑龙江省,佳木斯市,桦川县', '3', '154300', '0454', 'Huachuan', '130.7189300', '47.0229700');
INSERT INTO `sys_cn_area` VALUES ('230828', '汤原县', '汤原', '230800', null, '中国,黑龙江省,佳木斯市,汤原县', '3', '154700', '0454', 'Tangyuan', '129.9096600', '46.7275500');
INSERT INTO `sys_cn_area` VALUES ('230833', '抚远县', '抚远', '230800', null, '中国,黑龙江省,佳木斯市,抚远县', '3', '156500', '0454', 'Fuyuan', '134.2959500', '48.3679400');
INSERT INTO `sys_cn_area` VALUES ('230881', '同江市', '同江', '230800', null, '中国,黑龙江省,佳木斯市,同江市', '3', '156400', '0454', 'Tongjiang', '132.5109500', '47.6421100');
INSERT INTO `sys_cn_area` VALUES ('230882', '富锦市', '富锦', '230800', null, '中国,黑龙江省,佳木斯市,富锦市', '3', '156100', '0454', 'Fujin', '132.0370700', '47.2513200');
INSERT INTO `sys_cn_area` VALUES ('230900', '七台河市', '七台河', '230000', null, '中国,黑龙江省,七台河市', '2', '154600', '0464', 'Qitaihe', '131.0155840', '45.7712660');
INSERT INTO `sys_cn_area` VALUES ('230902', '新兴区', '新兴', '230900', null, '中国,黑龙江省,七台河市,新兴区', '3', '154604', '0464', 'Xinxing', '130.9321200', '45.8162400');
INSERT INTO `sys_cn_area` VALUES ('230903', '桃山区', '桃山', '230900', null, '中国,黑龙江省,七台河市,桃山区', '3', '154600', '0464', 'Taoshan', '131.0178600', '45.7678200');
INSERT INTO `sys_cn_area` VALUES ('230904', '茄子河区', '茄子河', '230900', null, '中国,黑龙江省,七台河市,茄子河区', '3', '154622', '0464', 'Qiezihe', '131.0680700', '45.7851900');
INSERT INTO `sys_cn_area` VALUES ('230921', '勃利县', '勃利', '230900', null, '中国,黑龙江省,七台河市,勃利县', '3', '154500', '0464', 'Boli', '130.5917900', '45.7550000');
INSERT INTO `sys_cn_area` VALUES ('231000', '牡丹江市', '牡丹江', '230000', null, '中国,黑龙江省,牡丹江市', '2', '157000', '0453', 'Mudanjiang', '129.6186020', '44.5829620');
INSERT INTO `sys_cn_area` VALUES ('231002', '东安区', '东安', '231000', null, '中国,黑龙江省,牡丹江市,东安区', '3', '157000', '0453', 'Dong\'an', '129.6266500', '44.5813300');
INSERT INTO `sys_cn_area` VALUES ('231003', '阳明区', '阳明', '231000', null, '中国,黑龙江省,牡丹江市,阳明区', '3', '157013', '0453', 'Yangming', '129.6354700', '44.5960300');
INSERT INTO `sys_cn_area` VALUES ('231004', '爱民区', '爱民', '231000', null, '中国,黑龙江省,牡丹江市,爱民区', '3', '157009', '0453', 'Aimin', '129.5907700', '44.5964800');
INSERT INTO `sys_cn_area` VALUES ('231005', '西安区', '西安', '231000', null, '中国,黑龙江省,牡丹江市,西安区', '3', '157000', '0453', 'Xi\'an', '129.6161600', '44.5776600');
INSERT INTO `sys_cn_area` VALUES ('231024', '东宁县', '东宁', '231000', null, '中国,黑龙江省,牡丹江市,东宁县', '3', '157200', '0453', 'Dongning', '131.1279300', '44.0661000');
INSERT INTO `sys_cn_area` VALUES ('231025', '林口县', '林口', '231000', null, '中国,黑龙江省,牡丹江市,林口县', '3', '157600', '0453', 'Linkou', '130.2839300', '45.2780900');
INSERT INTO `sys_cn_area` VALUES ('231081', '绥芬河市', '绥芬河', '231000', null, '中国,黑龙江省,牡丹江市,绥芬河市', '3', '157300', '0453', 'Suifenhe', '131.1513900', '44.4124900');
INSERT INTO `sys_cn_area` VALUES ('231083', '海林市', '海林', '231000', null, '中国,黑龙江省,牡丹江市,海林市', '3', '157100', '0453', 'Hailin', '129.3815600', '44.5900000');
INSERT INTO `sys_cn_area` VALUES ('231084', '宁安市', '宁安', '231000', null, '中国,黑龙江省,牡丹江市,宁安市', '3', '157400', '0453', 'Ning\'an', '129.4830300', '44.3401600');
INSERT INTO `sys_cn_area` VALUES ('231085', '穆棱市', '穆棱', '231000', null, '中国,黑龙江省,牡丹江市,穆棱市', '3', '157500', '0453', 'Muling', '130.5246500', '44.9190000');
INSERT INTO `sys_cn_area` VALUES ('231100', '黑河市', '黑河', '230000', null, '中国,黑龙江省,黑河市', '2', '164300', '0456', 'Heihe', '127.4990230', '50.2495850');
INSERT INTO `sys_cn_area` VALUES ('231102', '爱辉区', '爱辉', '231100', null, '中国,黑龙江省,黑河市,爱辉区', '3', '164300', '0456', 'Aihui', '127.5007400', '50.2520200');
INSERT INTO `sys_cn_area` VALUES ('231121', '嫩江县', '嫩江', '231100', null, '中国,黑龙江省,黑河市,嫩江县', '3', '161400', '0456', 'Nenjiang', '125.2260700', '49.1784400');
INSERT INTO `sys_cn_area` VALUES ('231123', '逊克县', '逊克', '231100', null, '中国,黑龙江省,黑河市,逊克县', '3', '164400', '0456', 'Xunke', '128.4788200', '49.5798300');
INSERT INTO `sys_cn_area` VALUES ('231124', '孙吴县', '孙吴', '231100', null, '中国,黑龙江省,黑河市,孙吴县', '3', '164200', '0456', 'Sunwu', '127.3359900', '49.4253900');
INSERT INTO `sys_cn_area` VALUES ('231181', '北安市', '北安', '231100', null, '中国,黑龙江省,黑河市,北安市', '3', '164000', '0456', 'Bei\'an', '126.4819300', '48.2387200');
INSERT INTO `sys_cn_area` VALUES ('231182', '五大连池市', '五大连池', '231100', null, '中国,黑龙江省,黑河市,五大连池市', '3', '164100', '0456', 'Wudalianchi', '126.2029400', '48.5150700');
INSERT INTO `sys_cn_area` VALUES ('231200', '绥化市', '绥化', '230000', null, '中国,黑龙江省,绥化市', '2', '152000', '0455', 'Suihua', '126.9929300', '46.6373930');
INSERT INTO `sys_cn_area` VALUES ('231202', '北林区', '北林', '231200', null, '中国,黑龙江省,绥化市,北林区', '3', '152000', '0455', 'Beilin', '126.9856400', '46.6373500');
INSERT INTO `sys_cn_area` VALUES ('231221', '望奎县', '望奎', '231200', null, '中国,黑龙江省,绥化市,望奎县', '3', '152100', '0455', 'Wangkui', '126.4818700', '46.8307900');
INSERT INTO `sys_cn_area` VALUES ('231222', '兰西县', '兰西', '231200', null, '中国,黑龙江省,绥化市,兰西县', '3', '151500', '0455', 'Lanxi', '126.2899400', '46.2525000');
INSERT INTO `sys_cn_area` VALUES ('231223', '青冈县', '青冈', '231200', null, '中国,黑龙江省,绥化市,青冈县', '3', '151600', '0455', 'Qinggang', '126.1132500', '46.6853400');
INSERT INTO `sys_cn_area` VALUES ('231224', '庆安县', '庆安', '231200', null, '中国,黑龙江省,绥化市,庆安县', '3', '152400', '0455', 'Qing\'an', '127.5075300', '46.8801600');
INSERT INTO `sys_cn_area` VALUES ('231225', '明水县', '明水', '231200', null, '中国,黑龙江省,绥化市,明水县', '3', '151700', '0455', 'Mingshui', '125.9059400', '47.1732700');
INSERT INTO `sys_cn_area` VALUES ('231226', '绥棱县', '绥棱', '231200', null, '中国,黑龙江省,绥化市,绥棱县', '3', '152200', '0455', 'Suileng', '127.1158400', '47.2426700');
INSERT INTO `sys_cn_area` VALUES ('231281', '安达市', '安达', '231200', null, '中国,黑龙江省,绥化市,安达市', '3', '151400', '0455', 'Anda', '125.3437500', '46.4177000');
INSERT INTO `sys_cn_area` VALUES ('231282', '肇东市', '肇东', '231200', null, '中国,黑龙江省,绥化市,肇东市', '3', '151100', '0455', 'Zhaodong', '125.9624300', '46.0513100');
INSERT INTO `sys_cn_area` VALUES ('231283', '海伦市', '海伦', '231200', null, '中国,黑龙江省,绥化市,海伦市', '3', '152300', '0455', 'Hailun', '126.9682000', '47.4609300');
INSERT INTO `sys_cn_area` VALUES ('232700', '大兴安岭地区', '大兴安岭', '230000', null, '中国,黑龙江省,大兴安岭地区', '2', '165000', '0457', 'DaXingAnLing', '124.7115260', '52.3352620');
INSERT INTO `sys_cn_area` VALUES ('232701', '加格达奇区', '加格达奇', '232700', null, '中国,黑龙江省,大兴安岭地区,加格达奇区', '3', '165000', '0457', 'Jiagedaqi', '124.3095400', '51.9814400');
INSERT INTO `sys_cn_area` VALUES ('232702', '新林区', '新林', '232700', null, '中国,黑龙江省,大兴安岭地区,新林区', '3', '165000', '0457', 'Xinlin', '124.3979830', '51.6734100');
INSERT INTO `sys_cn_area` VALUES ('232703', '松岭区', '松岭', '232700', null, '中国,黑龙江省,大兴安岭地区,松岭区', '3', '165000', '0457', 'Songling', '124.1897130', '51.9854530');
INSERT INTO `sys_cn_area` VALUES ('232704', '呼中区', '呼中', '232700', null, '中国,黑龙江省,大兴安岭地区,呼中区', '3', '165000', '0457', 'Huzhong', '123.6000900', '52.0334600');
INSERT INTO `sys_cn_area` VALUES ('232721', '呼玛县', '呼玛', '232700', null, '中国,黑龙江省,大兴安岭地区,呼玛县', '3', '165100', '0457', 'Huma', '126.6617400', '51.7311200');
INSERT INTO `sys_cn_area` VALUES ('232722', '塔河县', '塔河', '232700', null, '中国,黑龙江省,大兴安岭地区,塔河县', '3', '165200', '0457', 'Tahe', '124.7099900', '52.3343100');
INSERT INTO `sys_cn_area` VALUES ('232723', '漠河县', '漠河', '232700', null, '中国,黑龙江省,大兴安岭地区,漠河县', '3', '165300', '0457', 'Mohe', '122.5375900', '52.9700300');
INSERT INTO `sys_cn_area` VALUES ('310000', '上海', '上海', '100000', null, '中国,上海', '1', null, '', 'Shanghai', '121.4726440', '31.2317060');
INSERT INTO `sys_cn_area` VALUES ('310100', '上海市', '上海', '310000', null, '中国,上海,上海市', '2', '200000', '021', 'Shanghai', '121.4726440', '31.2317060');
INSERT INTO `sys_cn_area` VALUES ('310101', '黄浦区', '黄浦', '310100', null, '中国,上海,上海市,黄浦区', '3', '200001', '021', 'Huangpu', '121.4929500', '31.2233700');
INSERT INTO `sys_cn_area` VALUES ('310104', '徐汇区', '徐汇', '310100', null, '中国,上海,上海市,徐汇区', '3', '200030', '021', 'Xuhui', '121.4367600', '31.1883100');
INSERT INTO `sys_cn_area` VALUES ('310105', '长宁区', '长宁', '310100', null, '中国,上海,上海市,长宁区', '3', '200050', '021', 'Changning', '121.4246200', '31.2203600');
INSERT INTO `sys_cn_area` VALUES ('310106', '静安区', '静安', '310100', null, '中国,上海,上海市,静安区', '3', '200040', '021', 'Jing\'an', '121.4444000', '31.2288400');
INSERT INTO `sys_cn_area` VALUES ('310107', '普陀区', '普陀', '310100', null, '中国,上海,上海市,普陀区', '3', '200333', '021', 'Putuo', '121.3970300', '31.2495100');
INSERT INTO `sys_cn_area` VALUES ('310108', '闸北区', '闸北', '310100', null, '中国,上海,上海市,闸北区', '3', '200070', '021', 'Zhabei', '121.4463600', '31.2807500');
INSERT INTO `sys_cn_area` VALUES ('310109', '虹口区', '虹口', '310100', null, '中国,上海,上海市,虹口区', '3', '200086', '021', 'Hongkou', '121.4816200', '31.2778800');
INSERT INTO `sys_cn_area` VALUES ('310110', '杨浦区', '杨浦', '310100', null, '中国,上海,上海市,杨浦区', '3', '200082', '021', 'Yangpu', '121.5260000', '31.2595000');
INSERT INTO `sys_cn_area` VALUES ('310112', '闵行区', '闵行', '310100', null, '中国,上海,上海市,闵行区', '3', '201100', '021', 'Minhang', '121.3816200', '31.1124600');
INSERT INTO `sys_cn_area` VALUES ('310113', '宝山区', '宝山', '310100', null, '中国,上海,上海市,宝山区', '3', '201900', '021', 'Baoshan', '121.4891000', '31.4045000');
INSERT INTO `sys_cn_area` VALUES ('310114', '嘉定区', '嘉定', '310100', null, '中国,上海,上海市,嘉定区', '3', '201800', '021', 'Jiading', '121.2655000', '31.3747300');
INSERT INTO `sys_cn_area` VALUES ('310115', '浦东新区', '浦东', '310100', null, '中国,上海,上海市,浦东新区', '3', '200135', '021', 'Pudong', '121.5447000', '31.2224900');
INSERT INTO `sys_cn_area` VALUES ('310116', '金山区', '金山', '310100', null, '中国,上海,上海市,金山区', '3', '200540', '021', 'Jinshan', '121.3416400', '30.7416300');
INSERT INTO `sys_cn_area` VALUES ('310117', '松江区', '松江', '310100', null, '中国,上海,上海市,松江区', '3', '201600', '021', 'Songjiang', '121.2287900', '31.0322200');
INSERT INTO `sys_cn_area` VALUES ('310118', '青浦区', '青浦', '310100', null, '中国,上海,上海市,青浦区', '3', '201700', '021', 'Qingpu', '121.1241700', '31.1497400');
INSERT INTO `sys_cn_area` VALUES ('310120', '奉贤区', '奉贤', '310100', null, '中国,上海,上海市,奉贤区', '3', '201400', '021', 'Fengxian', '121.4741200', '30.9179000');
INSERT INTO `sys_cn_area` VALUES ('310230', '崇明县', '崇明', '310100', null, '中国,上海,上海市,崇明县', '3', '202150', '021', 'Chongming', '121.3975800', '31.6227800');
INSERT INTO `sys_cn_area` VALUES ('320000', '江苏省', '江苏', '100000', null, '中国,江苏省', '1', null, '', 'Jiangsu', '118.7674130', '32.0415440');
INSERT INTO `sys_cn_area` VALUES ('320100', '南京市', '南京', '320000', null, '中国,江苏省,南京市', '2', '210008', '025', 'Nanjing', '118.7674130', '32.0415440');
INSERT INTO `sys_cn_area` VALUES ('320102', '玄武区', '玄武', '320100', null, '中国,江苏省,南京市,玄武区', '3', '210018', '025', 'Xuanwu', '118.7977200', '32.0485600');
INSERT INTO `sys_cn_area` VALUES ('320104', '秦淮区', '秦淮', '320100', null, '中国,江苏省,南京市,秦淮区', '3', '210001', '025', 'Qinhuai', '118.7981500', '32.0111200');
INSERT INTO `sys_cn_area` VALUES ('320105', '建邺区', '建邺', '320100', null, '中国,江苏省,南京市,建邺区', '3', '210004', '025', 'Jianye', '118.7664100', '32.0309600');
INSERT INTO `sys_cn_area` VALUES ('320106', '鼓楼区', '鼓楼', '320100', null, '中国,江苏省,南京市,鼓楼区', '3', '210009', '025', 'Gulou', '118.7697400', '32.0663200');
INSERT INTO `sys_cn_area` VALUES ('320111', '浦口区', '浦口', '320100', null, '中国,江苏省,南京市,浦口区', '3', '211800', '025', 'Pukou', '118.6280200', '32.0588100');
INSERT INTO `sys_cn_area` VALUES ('320113', '栖霞区', '栖霞', '320100', null, '中国,江苏省,南京市,栖霞区', '3', '210046', '025', 'Qixia', '118.8806400', '32.1135200');
INSERT INTO `sys_cn_area` VALUES ('320114', '雨花台区', '雨花台', '320100', null, '中国,江苏省,南京市,雨花台区', '3', '210012', '025', 'Yuhuatai', '118.7799000', '31.9920200');
INSERT INTO `sys_cn_area` VALUES ('320115', '江宁区', '江宁', '320100', null, '中国,江苏省,南京市,江宁区', '3', '211100', '025', 'Jiangning', '118.8399000', '31.9526300');
INSERT INTO `sys_cn_area` VALUES ('320116', '六合区', '六合', '320100', null, '中国,江苏省,南京市,六合区', '3', '211500', '025', 'Luhe', '118.8413000', '32.3422200');
INSERT INTO `sys_cn_area` VALUES ('320117', '溧水区', '溧水', '320100', null, '中国,江苏省,南京市,溧水区', '3', '211200', '025', 'Lishui', '119.0287320', '31.6530610');
INSERT INTO `sys_cn_area` VALUES ('320118', '高淳区', '高淳', '320100', null, '中国,江苏省,南京市,高淳区', '3', '211300', '025', 'Gaochun', '118.8758900', '31.3271320');
INSERT INTO `sys_cn_area` VALUES ('320200', '无锡市', '无锡', '320000', null, '中国,江苏省,无锡市', '2', '214000', '0510', 'Wuxi', '120.3016630', '31.5747290');
INSERT INTO `sys_cn_area` VALUES ('320202', '崇安区', '崇安', '320200', null, '中国,江苏省,无锡市,崇安区', '3', '214001', '0510', 'Chong\'an', '120.2997500', '31.5800200');
INSERT INTO `sys_cn_area` VALUES ('320203', '南长区', '南长', '320200', null, '中国,江苏省,无锡市,南长区', '3', '214021', '0510', 'Nanchang', '120.3087300', '31.5635900');
INSERT INTO `sys_cn_area` VALUES ('320204', '北塘区', '北塘', '320200', null, '中国,江苏省,无锡市,北塘区', '3', '214044', '0510', 'Beitang', '120.2940500', '31.6059200');
INSERT INTO `sys_cn_area` VALUES ('320205', '锡山区', '锡山', '320200', null, '中国,江苏省,无锡市,锡山区', '3', '214101', '0510', 'Xishan', '120.3569900', '31.5886000');
INSERT INTO `sys_cn_area` VALUES ('320206', '惠山区', '惠山', '320200', null, '中国,江苏省,无锡市,惠山区', '3', '214174', '0510', 'Huishan', '120.2984900', '31.6808800');
INSERT INTO `sys_cn_area` VALUES ('320211', '滨湖区', '滨湖', '320200', null, '中国,江苏省,无锡市,滨湖区', '3', '214123', '0510', 'Binhu', '120.2946100', '31.5216200');
INSERT INTO `sys_cn_area` VALUES ('320281', '江阴市', '江阴', '320200', null, '中国,江苏省,无锡市,江阴市', '3', '214431', '0510', 'Jiangyin', '120.2853000', '31.9199600');
INSERT INTO `sys_cn_area` VALUES ('320282', '宜兴市', '宜兴', '320200', null, '中国,江苏省,无锡市,宜兴市', '3', '214200', '0510', 'Yixing', '119.8235700', '31.3397800');
INSERT INTO `sys_cn_area` VALUES ('320300', '徐州市', '徐州', '320000', null, '中国,江苏省,徐州市', '2', '221003', '0516', 'Xuzhou', '117.1848110', '34.2617920');
INSERT INTO `sys_cn_area` VALUES ('320302', '鼓楼区', '鼓楼', '320300', null, '中国,江苏省,徐州市,鼓楼区', '3', '221005', '0516', 'Gulou', '117.1855900', '34.2885100');
INSERT INTO `sys_cn_area` VALUES ('320303', '云龙区', '云龙', '320300', null, '中国,江苏省,徐州市,云龙区', '3', '221007', '0516', 'Yunlong', '117.2305300', '34.2489500');
INSERT INTO `sys_cn_area` VALUES ('320305', '贾汪区', '贾汪', '320300', null, '中国,江苏省,徐州市,贾汪区', '3', '221003', '0516', 'Jiawang', '117.4534600', '34.4426400');
INSERT INTO `sys_cn_area` VALUES ('320311', '泉山区', '泉山', '320300', null, '中国,江苏省,徐州市,泉山区', '3', '221006', '0516', 'Quanshan', '117.1937800', '34.2441800');
INSERT INTO `sys_cn_area` VALUES ('320312', '铜山区', '铜山', '320300', null, '中国,江苏省,徐州市,铜山区', '3', '221106', '0516', 'Tongshan', '117.1838940', '34.1928800');
INSERT INTO `sys_cn_area` VALUES ('320321', '丰县', '丰县', '320300', null, '中国,江苏省,徐州市,丰县', '3', '221700', '0516', 'Fengxian', '116.5995700', '34.6997200');
INSERT INTO `sys_cn_area` VALUES ('320322', '沛县', '沛县', '320300', null, '中国,江苏省,徐州市,沛县', '3', '221600', '0516', 'Peixian', '116.9374300', '34.7216300');
INSERT INTO `sys_cn_area` VALUES ('320324', '睢宁县', '睢宁', '320300', null, '中国,江苏省,徐州市,睢宁县', '3', '221200', '0516', 'Suining', '117.9410400', '33.9126900');
INSERT INTO `sys_cn_area` VALUES ('320381', '新沂市', '新沂', '320300', null, '中国,江苏省,徐州市,新沂市', '3', '221400', '0516', 'Xinyi', '118.3545200', '34.3694200');
INSERT INTO `sys_cn_area` VALUES ('320382', '邳州市', '邳州', '320300', null, '中国,江苏省,徐州市,邳州市', '3', '221300', '0516', 'Pizhou', '117.9585800', '34.3332900');
INSERT INTO `sys_cn_area` VALUES ('320400', '常州市', '常州', '320000', null, '中国,江苏省,常州市', '2', '213000', '0519', 'Changzhou', '119.9469730', '31.7727520');
INSERT INTO `sys_cn_area` VALUES ('320402', '天宁区', '天宁', '320400', null, '中国,江苏省,常州市,天宁区', '3', '213000', '0519', 'Tianning', '119.9513200', '31.7521100');
INSERT INTO `sys_cn_area` VALUES ('320404', '钟楼区', '钟楼', '320400', null, '中国,江苏省,常州市,钟楼区', '3', '213023', '0519', 'Zhonglou', '119.9017800', '31.8022100');
INSERT INTO `sys_cn_area` VALUES ('320405', '戚墅堰区', '戚墅堰', '320400', null, '中国,江苏省,常州市,戚墅堰区', '3', '213025', '0519', 'Qishuyan', '120.0610600', '31.7195600');
INSERT INTO `sys_cn_area` VALUES ('320411', '新北区', '新北', '320400', null, '中国,江苏省,常州市,新北区', '3', '213022', '0519', 'Xinbei', '119.9713100', '31.8304600');
INSERT INTO `sys_cn_area` VALUES ('320412', '武进区', '武进', '320400', null, '中国,江苏省,常州市,武进区', '3', '213100', '0519', 'Wujin', '119.9424400', '31.7008600');
INSERT INTO `sys_cn_area` VALUES ('320481', '溧阳市', '溧阳', '320400', null, '中国,江苏省,常州市,溧阳市', '3', '213300', '0519', 'Liyang', '119.4837000', '31.4153800');
INSERT INTO `sys_cn_area` VALUES ('320482', '金坛市', '金坛', '320400', null, '中国,江苏省,常州市,金坛市', '3', '213200', '0519', 'Jintan', '119.5775700', '31.7404300');
INSERT INTO `sys_cn_area` VALUES ('320500', '苏州市', '苏州', '320000', null, '中国,江苏省,苏州市', '2', '215002', '0512', 'Suzhou', '120.6195850', '31.2993790');
INSERT INTO `sys_cn_area` VALUES ('320505', '虎丘区', '虎丘', '320500', null, '中国,江苏省,苏州市,虎丘区', '3', '215004', '0512', 'Huqiu', '120.5734500', '31.2953000');
INSERT INTO `sys_cn_area` VALUES ('320506', '吴中区', '吴中', '320500', null, '中国,江苏省,苏州市,吴中区', '3', '215128', '0512', 'Wuzhong', '120.6321100', '31.2622600');
INSERT INTO `sys_cn_area` VALUES ('320507', '相城区', '相城', '320500', null, '中国,江苏省,苏州市,相城区', '3', '215131', '0512', 'Xiangcheng', '120.6423900', '31.3688900');
INSERT INTO `sys_cn_area` VALUES ('320508', '姑苏区', '姑苏', '320500', null, '中国,江苏省,苏州市,姑苏区', '3', '215031', '0512', 'Gusu', '120.6195850', '31.2993790');
INSERT INTO `sys_cn_area` VALUES ('320509', '吴江区', '吴江', '320500', null, '中国,江苏省,苏州市,吴江区', '3', '215200', '0512', 'Wujiang', '120.6383170', '31.1598150');
INSERT INTO `sys_cn_area` VALUES ('320581', '常熟市', '常熟', '320500', null, '中国,江苏省,苏州市,常熟市', '3', '215500', '0512', 'Changshu', '120.7522500', '31.6537400');
INSERT INTO `sys_cn_area` VALUES ('320582', '张家港市', '张家港', '320500', null, '中国,江苏省,苏州市,张家港市', '3', '215600', '0512', 'Zhangjiagang', '120.5553800', '31.8753200');
INSERT INTO `sys_cn_area` VALUES ('320583', '昆山市', '昆山', '320500', null, '中国,江苏省,苏州市,昆山市', '3', '215300', '0512', 'Kunshan', '120.9807400', '31.3846400');
INSERT INTO `sys_cn_area` VALUES ('320585', '太仓市', '太仓', '320500', null, '中国,江苏省,苏州市,太仓市', '3', '215400', '0512', 'Taicang', '121.1089100', '31.4497000');
INSERT INTO `sys_cn_area` VALUES ('320600', '南通市', '南通', '320000', null, '中国,江苏省,南通市', '2', '226001', '0513', 'Nantong', '120.8646080', '32.0162120');
INSERT INTO `sys_cn_area` VALUES ('320602', '崇川区', '崇川', '320600', null, '中国,江苏省,南通市,崇川区', '3', '226001', '0513', 'Chongchuan', '120.8573000', '32.0098000');
INSERT INTO `sys_cn_area` VALUES ('320611', '港闸区', '港闸', '320600', null, '中国,江苏省,南通市,港闸区', '3', '226001', '0513', 'Gangzha', '120.8177800', '32.0316300');
INSERT INTO `sys_cn_area` VALUES ('320612', '通州区', '通州', '320600', null, '中国,江苏省,南通市,通州区', '3', '226300', '0513', 'Tongzhou', '121.0729300', '32.0676000');
INSERT INTO `sys_cn_area` VALUES ('320621', '海安县', '海安', '320600', null, '中国,江苏省,南通市,海安县', '3', '226600', '0513', 'Hai\'an', '120.4585200', '32.5451400');
INSERT INTO `sys_cn_area` VALUES ('320623', '如东县', '如东', '320600', null, '中国,江苏省,南通市,如东县', '3', '226400', '0513', 'Rudong', '121.1894200', '32.3143900');
INSERT INTO `sys_cn_area` VALUES ('320681', '启东市', '启东', '320600', null, '中国,江苏省,南通市,启东市', '3', '226200', '0513', 'Qidong', '121.6598500', '31.8108300');
INSERT INTO `sys_cn_area` VALUES ('320682', '如皋市', '如皋', '320600', null, '中国,江苏省,南通市,如皋市', '3', '226500', '0513', 'Rugao', '120.5596900', '32.3759700');
INSERT INTO `sys_cn_area` VALUES ('320684', '海门市', '海门', '320600', null, '中国,江苏省,南通市,海门市', '3', '226100', '0513', 'Haimen', '121.1699500', '31.8942200');
INSERT INTO `sys_cn_area` VALUES ('320700', '连云港市', '连云港', '320000', null, '中国,江苏省,连云港市', '2', '222002', '0518', 'Lianyungang', '119.1788210', '34.6000180');
INSERT INTO `sys_cn_area` VALUES ('320703', '连云区', '连云', '320700', null, '中国,江苏省,连云港市,连云区', '3', '222042', '0518', 'Lianyun', '119.3730400', '34.7529300');
INSERT INTO `sys_cn_area` VALUES ('320706', '海州区', '海州', '320700', null, '中国,江苏省,连云港市,海州区', '3', '222003', '0518', 'Haizhou', '119.1312800', '34.5698600');
INSERT INTO `sys_cn_area` VALUES ('320707', '赣榆区', '赣榆', '320700', null, '中国,江苏省,连云港市,赣榆区', '3', '222100', '0518', 'Ganyu', '119.1287740', '34.8391540');
INSERT INTO `sys_cn_area` VALUES ('320722', '东海县', '东海', '320700', null, '中国,江苏省,连云港市,东海县', '3', '222300', '0518', 'Donghai', '118.7714500', '34.5421500');
INSERT INTO `sys_cn_area` VALUES ('320723', '灌云县', '灌云', '320700', null, '中国,江苏省,连云港市,灌云县', '3', '222200', '0518', 'Guanyun', '119.2392500', '34.2839100');
INSERT INTO `sys_cn_area` VALUES ('320724', '灌南县', '灌南', '320700', null, '中国,江苏省,连云港市,灌南县', '3', '222500', '0518', 'Guannan', '119.3563200', '34.0900000');
INSERT INTO `sys_cn_area` VALUES ('320800', '淮安市', '淮安', '320000', null, '中国,江苏省,淮安市', '2', '223001', '0517', 'Huai\'an', '119.0212650', '33.5975060');
INSERT INTO `sys_cn_area` VALUES ('320802', '清河区', '清河', '320800', null, '中国,江苏省,淮安市,清河区', '3', '223001', '0517', 'Qinghe', '119.0077800', '33.5994900');
INSERT INTO `sys_cn_area` VALUES ('320803', '淮安区', '淮安', '320800', null, '中国,江苏省,淮安市,淮安区', '3', '223200', '0517', 'Huai\'an', '119.0212650', '33.5975060');
INSERT INTO `sys_cn_area` VALUES ('320804', '淮阴区', '淮阴', '320800', null, '中国,江苏省,淮安市,淮阴区', '3', '223300', '0517', 'Huaiyin', '119.0348500', '33.6317100');
INSERT INTO `sys_cn_area` VALUES ('320811', '清浦区', '清浦', '320800', null, '中国,江苏省,淮安市,清浦区', '3', '223002', '0517', 'Qingpu', '119.0264800', '33.5523200');
INSERT INTO `sys_cn_area` VALUES ('320826', '涟水县', '涟水', '320800', null, '中国,江苏省,淮安市,涟水县', '3', '223400', '0517', 'Lianshui', '119.2608300', '33.7809400');
INSERT INTO `sys_cn_area` VALUES ('320829', '洪泽县', '洪泽', '320800', null, '中国,江苏省,淮安市,洪泽县', '3', '223100', '0517', 'Hongze', '118.8734400', '33.2942900');
INSERT INTO `sys_cn_area` VALUES ('320830', '盱眙县', '盱眙', '320800', null, '中国,江苏省,淮安市,盱眙县', '3', '211700', '0517', 'Xuyi', '118.5449500', '33.0108600');
INSERT INTO `sys_cn_area` VALUES ('320831', '金湖县', '金湖', '320800', null, '中国,江苏省,淮安市,金湖县', '3', '211600', '0517', 'Jinhu', '119.0230700', '33.0221900');
INSERT INTO `sys_cn_area` VALUES ('320900', '盐城市', '盐城', '320000', null, '中国,江苏省,盐城市', '2', '224005', '0515', 'Yancheng', '120.1399980', '33.3776310');
INSERT INTO `sys_cn_area` VALUES ('320902', '亭湖区', '亭湖', '320900', null, '中国,江苏省,盐城市,亭湖区', '3', '224005', '0515', 'Tinghu', '120.1658300', '33.3782500');
INSERT INTO `sys_cn_area` VALUES ('320903', '盐都区', '盐都', '320900', null, '中国,江苏省,盐城市,盐都区', '3', '224055', '0515', 'Yandu', '120.1544100', '33.3373000');
INSERT INTO `sys_cn_area` VALUES ('320921', '响水县', '响水', '320900', null, '中国,江苏省,盐城市,响水县', '3', '224600', '0515', 'Xiangshui', '119.5698500', '34.2051300');
INSERT INTO `sys_cn_area` VALUES ('320922', '滨海县', '滨海', '320900', null, '中国,江苏省,盐城市,滨海县', '3', '224500', '0515', 'Binhai', '119.8205800', '33.9897200');
INSERT INTO `sys_cn_area` VALUES ('320923', '阜宁县', '阜宁', '320900', null, '中国,江苏省,盐城市,阜宁县', '3', '224400', '0515', 'Funing', '119.8017500', '33.7822800');
INSERT INTO `sys_cn_area` VALUES ('320924', '射阳县', '射阳', '320900', null, '中国,江苏省,盐城市,射阳县', '3', '224300', '0515', 'Sheyang', '120.2604300', '33.7763600');
INSERT INTO `sys_cn_area` VALUES ('320925', '建湖县', '建湖', '320900', null, '中国,江苏省,盐城市,建湖县', '3', '224700', '0515', 'Jianhu', '119.7985200', '33.4724100');
INSERT INTO `sys_cn_area` VALUES ('320981', '东台市', '东台', '320900', null, '中国,江苏省,盐城市,东台市', '3', '224200', '0515', 'Dongtai', '120.3237600', '32.8507800');
INSERT INTO `sys_cn_area` VALUES ('320982', '大丰市', '大丰', '320900', null, '中国,江苏省,盐城市,大丰市', '3', '224100', '0515', 'Dafeng', '120.4659400', '33.1989300');
INSERT INTO `sys_cn_area` VALUES ('321000', '扬州市', '扬州', '320000', null, '中国,江苏省,扬州市', '2', '225002', '0514', 'Yangzhou', '119.4210030', '32.3931590');
INSERT INTO `sys_cn_area` VALUES ('321002', '广陵区', '广陵', '321000', null, '中国,江苏省,扬州市,广陵区', '3', '225002', '0514', 'Guangling', '119.4318600', '32.3947200');
INSERT INTO `sys_cn_area` VALUES ('321003', '邗江区', '邗江', '321000', null, '中国,江苏省,扬州市,邗江区', '3', '225002', '0514', 'Hanjiang', '119.3981600', '32.3765000');
INSERT INTO `sys_cn_area` VALUES ('321012', '江都区', '江都', '321000', null, '中国,江苏省,扬州市,江都区', '3', '225200', '0514', 'Jiangdu', '119.5674810', '32.4265640');
INSERT INTO `sys_cn_area` VALUES ('321023', '宝应县', '宝应', '321000', null, '中国,江苏省,扬州市,宝应县', '3', '225800', '0514', 'Baoying', '119.3121300', '33.2354900');
INSERT INTO `sys_cn_area` VALUES ('321081', '仪征市', '仪征', '321000', null, '中国,江苏省,扬州市,仪征市', '3', '211400', '0514', 'Yizheng', '119.1843200', '32.2719700');
INSERT INTO `sys_cn_area` VALUES ('321084', '高邮市', '高邮', '321000', null, '中国,江苏省,扬州市,高邮市', '3', '225600', '0514', 'Gaoyou', '119.4596500', '32.7813500');
INSERT INTO `sys_cn_area` VALUES ('321100', '镇江市', '镇江', '320000', null, '中国,江苏省,镇江市', '2', '212004', '0511', 'Zhenjiang', '119.4527530', '32.2044020');
INSERT INTO `sys_cn_area` VALUES ('321102', '京口区', '京口', '321100', null, '中国,江苏省,镇江市,京口区', '3', '212003', '0511', 'Jingkou', '119.4694700', '32.1980900');
INSERT INTO `sys_cn_area` VALUES ('321111', '润州区', '润州', '321100', null, '中国,江苏省,镇江市,润州区', '3', '212005', '0511', 'Runzhou', '119.4113400', '32.1952300');
INSERT INTO `sys_cn_area` VALUES ('321112', '丹徒区', '丹徒', '321100', null, '中国,江苏省,镇江市,丹徒区', '3', '212028', '0511', 'Dantu', '119.4338300', '32.1318300');
INSERT INTO `sys_cn_area` VALUES ('321181', '丹阳市', '丹阳', '321100', null, '中国,江苏省,镇江市,丹阳市', '3', '212300', '0511', 'Danyang', '119.5752500', '31.9912100');
INSERT INTO `sys_cn_area` VALUES ('321182', '扬中市', '扬中', '321100', null, '中国,江苏省,镇江市,扬中市', '3', '212200', '0511', 'Yangzhong', '119.7971800', '32.2363000');
INSERT INTO `sys_cn_area` VALUES ('321183', '句容市', '句容', '321100', null, '中国,江苏省,镇江市,句容市', '3', '212400', '0511', 'Jurong', '119.1648200', '31.9559100');
INSERT INTO `sys_cn_area` VALUES ('321200', '泰州市', '泰州', '320000', null, '中国,江苏省,泰州市', '2', '225300', '0523', 'Taizhou', '119.9151760', '32.4848820');
INSERT INTO `sys_cn_area` VALUES ('321202', '海陵区', '海陵', '321200', null, '中国,江苏省,泰州市,海陵区', '3', '225300', '0523', 'Hailing', '119.9194200', '32.4910100');
INSERT INTO `sys_cn_area` VALUES ('321203', '高港区', '高港', '321200', null, '中国,江苏省,泰州市,高港区', '3', '225321', '0523', 'Gaogang', '119.8808900', '32.3183300');
INSERT INTO `sys_cn_area` VALUES ('321204', '姜堰区', '姜堰', '321200', null, '中国,江苏省,泰州市,姜堰区', '3', '225500', '0523', 'Jiangyan', '120.1482080', '32.5084830');
INSERT INTO `sys_cn_area` VALUES ('321281', '兴化市', '兴化', '321200', null, '中国,江苏省,泰州市,兴化市', '3', '225700', '0523', 'Xinghua', '119.8523800', '32.9094400');
INSERT INTO `sys_cn_area` VALUES ('321282', '靖江市', '靖江', '321200', null, '中国,江苏省,泰州市,靖江市', '3', '214500', '0523', 'Jingjiang', '120.2729100', '32.0159500');
INSERT INTO `sys_cn_area` VALUES ('321283', '泰兴市', '泰兴', '321200', null, '中国,江苏省,泰州市,泰兴市', '3', '225400', '0523', 'Taixing', '120.0519400', '32.1718700');
INSERT INTO `sys_cn_area` VALUES ('321300', '宿迁市', '宿迁', '320000', null, '中国,江苏省,宿迁市', '2', '223800', '0527', 'Suqian', '118.2933280', '33.9451540');
INSERT INTO `sys_cn_area` VALUES ('321302', '宿城区', '宿城', '321300', null, '中国,江苏省,宿迁市,宿城区', '3', '223800', '0527', 'Sucheng', '118.2914100', '33.9421900');
INSERT INTO `sys_cn_area` VALUES ('321311', '宿豫区', '宿豫', '321300', null, '中国,江苏省,宿迁市,宿豫区', '3', '223800', '0527', 'Suyu', '118.3292200', '33.9467300');
INSERT INTO `sys_cn_area` VALUES ('321322', '沭阳县', '沭阳', '321300', null, '中国,江苏省,宿迁市,沭阳县', '3', '223600', '0527', 'Shuyang', '118.7687300', '34.1144600');
INSERT INTO `sys_cn_area` VALUES ('321323', '泗阳县', '泗阳', '321300', null, '中国,江苏省,宿迁市,泗阳县', '3', '223700', '0527', 'Siyang', '118.7033000', '33.7209600');
INSERT INTO `sys_cn_area` VALUES ('321324', '泗洪县', '泗洪', '321300', null, '中国,江苏省,宿迁市,泗洪县', '3', '223900', '0527', 'Sihong', '118.2171600', '33.4599600');
INSERT INTO `sys_cn_area` VALUES ('330000', '浙江省', '浙江', '100000', null, '中国,浙江省', '1', null, '', 'Zhejiang', '120.1535760', '30.2874590');
INSERT INTO `sys_cn_area` VALUES ('330100', '杭州市', '杭州', '330000', null, '中国,浙江省,杭州市', '2', '310026', '0571', 'Hangzhou', '120.1535760', '30.2874590');
INSERT INTO `sys_cn_area` VALUES ('330102', '上城区', '上城', '330100', null, '中国,浙江省,杭州市,上城区', '3', '310002', '0571', 'Shangcheng', '120.1692200', '30.2425500');
INSERT INTO `sys_cn_area` VALUES ('330103', '下城区', '下城', '330100', null, '中国,浙江省,杭州市,下城区', '3', '310006', '0571', 'Xiacheng', '120.1809600', '30.2815300');
INSERT INTO `sys_cn_area` VALUES ('330104', '江干区', '江干', '330100', null, '中国,浙江省,杭州市,江干区', '3', '310016', '0571', 'Jianggan', '120.2051700', '30.2572000');
INSERT INTO `sys_cn_area` VALUES ('330105', '拱墅区', '拱墅', '330100', null, '中国,浙江省,杭州市,拱墅区', '3', '310011', '0571', 'Gongshu', '120.1420900', '30.3196800');
INSERT INTO `sys_cn_area` VALUES ('330106', '西湖区', '西湖', '330100', null, '中国,浙江省,杭州市,西湖区', '3', '310013', '0571', 'Xihu', '120.1297900', '30.2594900');
INSERT INTO `sys_cn_area` VALUES ('330108', '滨江区', '滨江', '330100', null, '中国,浙江省,杭州市,滨江区', '3', '310051', '0571', 'Binjiang', '120.2119400', '30.2083500');
INSERT INTO `sys_cn_area` VALUES ('330109', '萧山区', '萧山', '330100', null, '中国,浙江省,杭州市,萧山区', '3', '311200', '0571', 'Xiaoshan', '120.2645200', '30.1850500');
INSERT INTO `sys_cn_area` VALUES ('330110', '余杭区', '余杭', '330100', null, '中国,浙江省,杭州市,余杭区', '3', '311100', '0571', 'Yuhang', '120.2998600', '30.4182900');
INSERT INTO `sys_cn_area` VALUES ('330122', '桐庐县', '桐庐', '330100', null, '中国,浙江省,杭州市,桐庐县', '3', '311500', '0571', 'Tonglu', '119.6885300', '29.7977900');
INSERT INTO `sys_cn_area` VALUES ('330127', '淳安县', '淳安', '330100', null, '中国,浙江省,杭州市,淳安县', '3', '311700', '0571', 'Chun\'an', '119.0425700', '29.6098800');
INSERT INTO `sys_cn_area` VALUES ('330182', '建德市', '建德', '330100', null, '中国,浙江省,杭州市,建德市', '3', '311600', '0571', 'Jiande', '119.2815800', '29.4760300');
INSERT INTO `sys_cn_area` VALUES ('330183', '富阳区', '富阳', '330100', null, '中国,浙江省,杭州市,富阳区', '3', '311400', '0571', 'Fuyang', '119.9604100', '30.0487800');
INSERT INTO `sys_cn_area` VALUES ('330185', '临安市', '临安', '330100', null, '中国,浙江省,杭州市,临安市', '3', '311300', '0571', 'Lin\'an', '119.7247300', '30.2344700');
INSERT INTO `sys_cn_area` VALUES ('330200', '宁波市', '宁波', '330000', null, '中国,浙江省,宁波市', '2', '315000', '0574', 'Ningbo', '121.5497920', '29.8683880');
INSERT INTO `sys_cn_area` VALUES ('330203', '海曙区', '海曙', '330200', null, '中国,浙江省,宁波市,海曙区', '3', '315000', '0574', 'Haishu', '121.5510600', '29.8597700');
INSERT INTO `sys_cn_area` VALUES ('330204', '江东区', '江东', '330200', null, '中国,浙江省,宁波市,江东区', '3', '315040', '0574', 'Jiangdong', '121.5702800', '29.8670100');
INSERT INTO `sys_cn_area` VALUES ('330205', '江北区', '江北', '330200', null, '中国,浙江省,宁波市,江北区', '3', '315020', '0574', 'Jiangbei', '121.5568100', '29.8877600');
INSERT INTO `sys_cn_area` VALUES ('330206', '北仑区', '北仑', '330200', null, '中国,浙江省,宁波市,北仑区', '3', '315800', '0574', 'Beilun', '121.8440800', '29.9006900');
INSERT INTO `sys_cn_area` VALUES ('330211', '镇海区', '镇海', '330200', null, '中国,浙江省,宁波市,镇海区', '3', '315200', '0574', 'Zhenhai', '121.7161500', '29.9489300');
INSERT INTO `sys_cn_area` VALUES ('330212', '鄞州区', '鄞州', '330200', null, '中国,浙江省,宁波市,鄞州区', '3', '315100', '0574', 'Yinzhou', '121.5475400', '29.8161400');
INSERT INTO `sys_cn_area` VALUES ('330225', '象山县', '象山', '330200', null, '中国,浙江省,宁波市,象山县', '3', '315700', '0574', 'Xiangshan', '121.8691700', '29.4775800');
INSERT INTO `sys_cn_area` VALUES ('330226', '宁海县', '宁海', '330200', null, '中国,浙江省,宁波市,宁海县', '3', '315600', '0574', 'Ninghai', '121.4307200', '29.2889000');
INSERT INTO `sys_cn_area` VALUES ('330281', '余姚市', '余姚', '330200', null, '中国,浙江省,宁波市,余姚市', '3', '315400', '0574', 'Yuyao', '121.1534100', '30.0386700');
INSERT INTO `sys_cn_area` VALUES ('330282', '慈溪市', '慈溪', '330200', null, '中国,浙江省,宁波市,慈溪市', '3', '315300', '0574', 'Cixi', '121.2664100', '30.1695900');
INSERT INTO `sys_cn_area` VALUES ('330283', '奉化市', '奉化', '330200', null, '中国,浙江省,宁波市,奉化市', '3', '315500', '0574', 'Fenghua', '121.4100300', '29.6553700');
INSERT INTO `sys_cn_area` VALUES ('330300', '温州市', '温州', '330000', null, '中国,浙江省,温州市', '2', '325000', '0577', 'Wenzhou', '120.6721110', '28.0005750');
INSERT INTO `sys_cn_area` VALUES ('330302', '鹿城区', '鹿城', '330300', null, '中国,浙江省,温州市,鹿城区', '3', '325000', '0577', 'Lucheng', '120.6550500', '28.0148900');
INSERT INTO `sys_cn_area` VALUES ('330303', '龙湾区', '龙湾', '330300', null, '中国,浙江省,温州市,龙湾区', '3', '325013', '0577', 'Longwan', '120.8305300', '27.9128400');
INSERT INTO `sys_cn_area` VALUES ('330304', '瓯海区', '瓯海', '330300', null, '中国,浙江省,温州市,瓯海区', '3', '325005', '0577', 'Ouhai', '120.6375100', '28.0071400');
INSERT INTO `sys_cn_area` VALUES ('330322', '洞头县', '洞头', '330300', null, '中国,浙江省,温州市,洞头县', '3', '325700', '0577', 'Dongtou', '121.1560600', '27.8363400');
INSERT INTO `sys_cn_area` VALUES ('330324', '永嘉县', '永嘉', '330300', null, '中国,浙江省,温州市,永嘉县', '3', '325100', '0577', 'Yongjia', '120.6931700', '28.1545600');
INSERT INTO `sys_cn_area` VALUES ('330326', '平阳县', '平阳', '330300', null, '中国,浙江省,温州市,平阳县', '3', '325400', '0577', 'Pingyang', '120.5650600', '27.6624500');
INSERT INTO `sys_cn_area` VALUES ('330327', '苍南县', '苍南', '330300', null, '中国,浙江省,温州市,苍南县', '3', '325800', '0577', 'Cangnan', '120.4260800', '27.5173900');
INSERT INTO `sys_cn_area` VALUES ('330328', '文成县', '文成', '330300', null, '中国,浙江省,温州市,文成县', '3', '325300', '0577', 'Wencheng', '120.0906300', '27.7867800');
INSERT INTO `sys_cn_area` VALUES ('330329', '泰顺县', '泰顺', '330300', null, '中国,浙江省,温州市,泰顺县', '3', '325500', '0577', 'Taishun', '119.7182000', '27.5569400');
INSERT INTO `sys_cn_area` VALUES ('330381', '瑞安市', '瑞安', '330300', null, '中国,浙江省,温州市,瑞安市', '3', '325200', '0577', 'Rui\'an', '120.6546600', '27.7804100');
INSERT INTO `sys_cn_area` VALUES ('330382', '乐清市', '乐清', '330300', null, '中国,浙江省,温州市,乐清市', '3', '325600', '0577', 'Yueqing', '120.9617000', '28.1240400');
INSERT INTO `sys_cn_area` VALUES ('330400', '嘉兴市', '嘉兴', '330000', null, '中国,浙江省,嘉兴市', '2', '314000', '0573', 'Jiaxing', '120.7508650', '30.7626530');
INSERT INTO `sys_cn_area` VALUES ('330402', '南湖区', '南湖', '330400', null, '中国,浙江省,嘉兴市,南湖区', '3', '314051', '0573', 'Nanhu', '120.7852400', '30.7486500');
INSERT INTO `sys_cn_area` VALUES ('330411', '秀洲区', '秀洲', '330400', null, '中国,浙江省,嘉兴市,秀洲区', '3', '314031', '0573', 'Xiuzhou', '120.7086700', '30.7645400');
INSERT INTO `sys_cn_area` VALUES ('330421', '嘉善县', '嘉善', '330400', null, '中国,浙江省,嘉兴市,嘉善县', '3', '314100', '0573', 'Jiashan', '120.9255900', '30.8299300');
INSERT INTO `sys_cn_area` VALUES ('330424', '海盐县', '海盐', '330400', null, '中国,浙江省,嘉兴市,海盐县', '3', '314300', '0573', 'Haiyan', '120.9457000', '30.5254700');
INSERT INTO `sys_cn_area` VALUES ('330481', '海宁市', '海宁', '330400', null, '中国,浙江省,嘉兴市,海宁市', '3', '314400', '0573', 'Haining', '120.6813000', '30.5097000');
INSERT INTO `sys_cn_area` VALUES ('330482', '平湖市', '平湖', '330400', null, '中国,浙江省,嘉兴市,平湖市', '3', '314200', '0573', 'Pinghu', '121.0216600', '30.6961800');
INSERT INTO `sys_cn_area` VALUES ('330483', '桐乡市', '桐乡', '330400', null, '中国,浙江省,嘉兴市,桐乡市', '3', '314500', '0573', 'Tongxiang', '120.5648500', '30.6302000');
INSERT INTO `sys_cn_area` VALUES ('330500', '湖州市', '湖州', '330000', null, '中国,浙江省,湖州市', '2', '313000', '0572', 'Huzhou', '120.1023980', '30.8671980');
INSERT INTO `sys_cn_area` VALUES ('330502', '吴兴区', '吴兴', '330500', null, '中国,浙江省,湖州市,吴兴区', '3', '313000', '0572', 'Wuxing', '120.1254800', '30.8575200');
INSERT INTO `sys_cn_area` VALUES ('330503', '南浔区', '南浔', '330500', null, '中国,浙江省,湖州市,南浔区', '3', '313009', '0572', 'Nanxun', '120.4203800', '30.8668600');
INSERT INTO `sys_cn_area` VALUES ('330521', '德清县', '德清', '330500', null, '中国,浙江省,湖州市,德清县', '3', '313200', '0572', 'Deqing', '119.9783600', '30.5336900');
INSERT INTO `sys_cn_area` VALUES ('330522', '长兴县', '长兴', '330500', null, '中国,浙江省,湖州市,长兴县', '3', '313100', '0572', 'Changxing', '119.9078300', '31.0060600');
INSERT INTO `sys_cn_area` VALUES ('330523', '安吉县', '安吉', '330500', null, '中国,浙江省,湖州市,安吉县', '3', '313300', '0572', 'Anji', '119.6815800', '30.6379800');
INSERT INTO `sys_cn_area` VALUES ('330600', '绍兴市', '绍兴', '330000', null, '中国,浙江省,绍兴市', '2', '312000', '0575', 'Shaoxing', '120.5821120', '29.9971170');
INSERT INTO `sys_cn_area` VALUES ('330602', '越城区', '越城', '330600', null, '中国,浙江省,绍兴市,越城区', '3', '312000', '0575', 'Yuecheng', '120.5819000', '29.9889500');
INSERT INTO `sys_cn_area` VALUES ('330603', '柯桥区', '柯桥', '330600', null, '中国,浙江省,绍兴市,柯桥区', '3', '312030', '0575', 'Keqiao ', '120.4927360', '30.0876300');
INSERT INTO `sys_cn_area` VALUES ('330604', '上虞区', '上虞', '330600', null, '中国,浙江省,绍兴市,上虞区', '3', '312300', '0575', 'Shangyu', '120.4760750', '30.0780380');
INSERT INTO `sys_cn_area` VALUES ('330624', '新昌县', '新昌', '330600', null, '中国,浙江省,绍兴市,新昌县', '3', '312500', '0575', 'Xinchang', '120.9043500', '29.4999100');
INSERT INTO `sys_cn_area` VALUES ('330681', '诸暨市', '诸暨', '330600', null, '中国,浙江省,绍兴市,诸暨市', '3', '311800', '0575', 'Zhuji', '120.2362900', '29.7135800');
INSERT INTO `sys_cn_area` VALUES ('330683', '嵊州市', '嵊州', '330600', null, '中国,浙江省,绍兴市,嵊州市', '3', '312400', '0575', 'Shengzhou', '120.8217400', '29.5885400');
INSERT INTO `sys_cn_area` VALUES ('330700', '金华市', '金华', '330000', null, '中国,浙江省,金华市', '2', '321000', '0579', 'Jinhua', '119.6495060', '29.0895240');
INSERT INTO `sys_cn_area` VALUES ('330702', '婺城区', '婺城', '330700', null, '中国,浙江省,金华市,婺城区', '3', '321000', '0579', 'Wucheng', '119.5713500', '29.0952100');
INSERT INTO `sys_cn_area` VALUES ('330703', '金东区', '金东', '330700', null, '中国,浙江省,金华市,金东区', '3', '321000', '0579', 'Jindong', '119.6930200', '29.0991000');
INSERT INTO `sys_cn_area` VALUES ('330723', '武义县', '武义', '330700', null, '中国,浙江省,金华市,武义县', '3', '321200', '0579', 'Wuyi', '119.8164000', '28.8933100');
INSERT INTO `sys_cn_area` VALUES ('330726', '浦江县', '浦江', '330700', null, '中国,浙江省,金华市,浦江县', '3', '322200', '0579', 'Pujiang', '119.8918100', '29.4535300');
INSERT INTO `sys_cn_area` VALUES ('330727', '磐安县', '磐安', '330700', null, '中国,浙江省,金华市,磐安县', '3', '322300', '0579', 'Pan\'an', '120.4502200', '29.0573300');
INSERT INTO `sys_cn_area` VALUES ('330781', '兰溪市', '兰溪', '330700', null, '中国,浙江省,金华市,兰溪市', '3', '321100', '0579', 'Lanxi', '119.4596500', '29.2084100');
INSERT INTO `sys_cn_area` VALUES ('330782', '义乌市', '义乌', '330700', null, '中国,浙江省,金华市,义乌市', '3', '322000', '0579', 'Yiwu', '120.0744000', '29.3055800');
INSERT INTO `sys_cn_area` VALUES ('330783', '东阳市', '东阳', '330700', null, '中国,浙江省,金华市,东阳市', '3', '322100', '0579', 'Dongyang', '120.2418500', '29.2894200');
INSERT INTO `sys_cn_area` VALUES ('330784', '永康市', '永康', '330700', null, '中国,浙江省,金华市,永康市', '3', '321300', '0579', 'Yongkang', '120.0472700', '28.8884400');
INSERT INTO `sys_cn_area` VALUES ('330800', '衢州市', '衢州', '330000', null, '中国,浙江省,衢州市', '2', '324002', '0570', 'Quzhou', '118.8726300', '28.9417080');
INSERT INTO `sys_cn_area` VALUES ('330802', '柯城区', '柯城', '330800', null, '中国,浙江省,衢州市,柯城区', '3', '324100', '0570', 'Kecheng', '118.8710900', '28.9685800');
INSERT INTO `sys_cn_area` VALUES ('330803', '衢江区', '衢江', '330800', null, '中国,浙江省,衢州市,衢江区', '3', '324022', '0570', 'Qujiang', '118.9598000', '28.9797700');
INSERT INTO `sys_cn_area` VALUES ('330822', '常山县', '常山', '330800', null, '中国,浙江省,衢州市,常山县', '3', '324200', '0570', 'Changshan', '118.5102500', '28.9019100');
INSERT INTO `sys_cn_area` VALUES ('330824', '开化县', '开化', '330800', null, '中国,浙江省,衢州市,开化县', '3', '324300', '0570', 'Kaihua', '118.4161600', '29.1378500');
INSERT INTO `sys_cn_area` VALUES ('330825', '龙游县', '龙游', '330800', null, '中国,浙江省,衢州市,龙游县', '3', '324400', '0570', 'Longyou', '119.1722100', '29.0282300');
INSERT INTO `sys_cn_area` VALUES ('330881', '江山市', '江山', '330800', null, '中国,浙江省,衢州市,江山市', '3', '324100', '0570', 'Jiangshan', '118.6267400', '28.7386000');
INSERT INTO `sys_cn_area` VALUES ('330900', '舟山市', '舟山', '330000', null, '中国,浙江省,舟山市', '2', '316000', '0580', 'Zhoushan', '122.1068630', '30.0160280');
INSERT INTO `sys_cn_area` VALUES ('330902', '定海区', '定海', '330900', null, '中国,浙江省,舟山市,定海区', '3', '316000', '0580', 'Dinghai', '122.1067700', '30.0198500');
INSERT INTO `sys_cn_area` VALUES ('330903', '普陀区', '普陀', '330900', null, '中国,浙江省,舟山市,普陀区', '3', '316100', '0580', 'Putuo', '122.3027800', '29.9490800');
INSERT INTO `sys_cn_area` VALUES ('330921', '岱山县', '岱山', '330900', null, '中国,浙江省,舟山市,岱山县', '3', '316200', '0580', 'Daishan', '122.2048600', '30.2438500');
INSERT INTO `sys_cn_area` VALUES ('330922', '嵊泗县', '嵊泗', '330900', null, '中国,浙江省,舟山市,嵊泗县', '3', '202450', '0580', 'Shengsi', '122.4512900', '30.7267800');
INSERT INTO `sys_cn_area` VALUES ('331000', '台州市', '台州', '330000', null, '中国,浙江省,台州市', '2', '318000', '0576', 'Taizhou', '121.4285990', '28.6613780');
INSERT INTO `sys_cn_area` VALUES ('331002', '椒江区', '椒江', '331000', null, '中国,浙江省,台州市,椒江区', '3', '318000', '0576', 'Jiaojiang', '121.4428700', '28.6730100');
INSERT INTO `sys_cn_area` VALUES ('331003', '黄岩区', '黄岩', '331000', null, '中国,浙江省,台州市,黄岩区', '3', '318020', '0576', 'Huangyan', '121.2589100', '28.6507700');
INSERT INTO `sys_cn_area` VALUES ('331004', '路桥区', '路桥', '331000', null, '中国,浙江省,台州市,路桥区', '3', '318050', '0576', 'Luqiao', '121.3738100', '28.5801600');
INSERT INTO `sys_cn_area` VALUES ('331021', '玉环县', '玉环', '331000', null, '中国,浙江省,台州市,玉环县', '3', '317600', '0576', 'Yuhuan', '121.2324200', '28.1363700');
INSERT INTO `sys_cn_area` VALUES ('331022', '三门县', '三门', '331000', null, '中国,浙江省,台州市,三门县', '3', '317100', '0576', 'Sanmen', '121.3937000', '29.1051000');
INSERT INTO `sys_cn_area` VALUES ('331023', '天台县', '天台', '331000', null, '中国,浙江省,台州市,天台县', '3', '317200', '0576', 'Tiantai', '121.0084800', '29.1429000');
INSERT INTO `sys_cn_area` VALUES ('331024', '仙居县', '仙居', '331000', null, '中国,浙江省,台州市,仙居县', '3', '317300', '0576', 'Xianju', '120.7287200', '28.8467200');
INSERT INTO `sys_cn_area` VALUES ('331081', '温岭市', '温岭', '331000', null, '中国,浙江省,台州市,温岭市', '3', '317500', '0576', 'Wenling', '121.3859500', '28.3717600');
INSERT INTO `sys_cn_area` VALUES ('331082', '临海市', '临海', '331000', null, '中国,浙江省,台州市,临海市', '3', '317000', '0576', 'Linhai', '121.1388500', '28.8560300');
INSERT INTO `sys_cn_area` VALUES ('331100', '丽水市', '丽水', '330000', null, '中国,浙江省,丽水市', '2', '323000', '0578', 'Lishui', '119.9217860', '28.4519930');
INSERT INTO `sys_cn_area` VALUES ('331102', '莲都区', '莲都', '331100', null, '中国,浙江省,丽水市,莲都区', '3', '323000', '0578', 'Liandu', '119.9127000', '28.4458300');
INSERT INTO `sys_cn_area` VALUES ('331121', '青田县', '青田', '331100', null, '中国,浙江省,丽水市,青田县', '3', '323900', '0578', 'Qingtian', '120.2902800', '28.1389700');
INSERT INTO `sys_cn_area` VALUES ('331122', '缙云县', '缙云', '331100', null, '中国,浙江省,丽水市,缙云县', '3', '321400', '0578', 'Jinyun', '120.0903600', '28.6594400');
INSERT INTO `sys_cn_area` VALUES ('331123', '遂昌县', '遂昌', '331100', null, '中国,浙江省,丽水市,遂昌县', '3', '323300', '0578', 'Suichang', '119.2760600', '28.5929100');
INSERT INTO `sys_cn_area` VALUES ('331124', '松阳县', '松阳', '331100', null, '中国,浙江省,丽水市,松阳县', '3', '323400', '0578', 'Songyang', '119.4819900', '28.4494000');
INSERT INTO `sys_cn_area` VALUES ('331125', '云和县', '云和', '331100', null, '中国,浙江省,丽水市,云和县', '3', '323600', '0578', 'Yunhe', '119.5728700', '28.1164300');
INSERT INTO `sys_cn_area` VALUES ('331126', '庆元县', '庆元', '331100', null, '中国,浙江省,丽水市,庆元县', '3', '323800', '0578', 'Qingyuan', '119.0625600', '27.6184200');
INSERT INTO `sys_cn_area` VALUES ('331127', '景宁畲族自治县', '景宁', '331100', null, '中国,浙江省,丽水市,景宁畲族自治县', '3', '323500', '0578', 'Jingning', '119.6383900', '27.9739300');
INSERT INTO `sys_cn_area` VALUES ('331181', '龙泉市', '龙泉', '331100', null, '中国,浙江省,丽水市,龙泉市', '3', '323700', '0578', 'Longquan', '119.1416300', '28.0743000');
INSERT INTO `sys_cn_area` VALUES ('331200', '舟山群岛新区', '舟山新区', '330000', null, '中国,浙江省,舟山群岛新区', '2', '316000', '0580', 'Zhoushan', '122.3176570', '29.8132420');
INSERT INTO `sys_cn_area` VALUES ('331201', '金塘岛', '金塘', '331200', null, '中国,浙江省,舟山群岛新区,金塘岛', '3', '316000', '0580', 'Jintang', '121.8933730', '30.0406410');
INSERT INTO `sys_cn_area` VALUES ('331202', '六横岛', '六横', '331200', null, '中国,浙江省,舟山群岛新区,六横岛', '3', '316000', '0580', 'Liuheng', '122.1426500', '29.6629380');
INSERT INTO `sys_cn_area` VALUES ('331203', '衢山岛', '衢山', '331200', null, '中国,浙江省,舟山群岛新区,衢山岛', '3', '316000', '0580', 'Qushan', '122.3584250', '30.4426420');
INSERT INTO `sys_cn_area` VALUES ('331204', '舟山本岛西北部', '舟山', '331200', null, '中国,浙江省,舟山群岛新区,舟山本岛西北部', '3', '316000', '0580', 'Zhoushan', '122.0306400', '30.1403770');
INSERT INTO `sys_cn_area` VALUES ('331205', '岱山岛西南部', '岱山', '331200', null, '中国,浙江省,舟山群岛新区,岱山岛西南部', '3', '316000', '0580', 'Daishan', '122.1801230', '30.2772690');
INSERT INTO `sys_cn_area` VALUES ('331206', '泗礁岛', '泗礁', '331200', null, '中国,浙江省,舟山群岛新区,泗礁岛', '3', '316000', '0580', 'Sijiao', '122.4580300', '30.7251120');
INSERT INTO `sys_cn_area` VALUES ('331207', '朱家尖岛', '朱家尖', '331200', null, '中国,浙江省,舟山群岛新区,朱家尖岛', '3', '316000', '0580', 'Zhujiajian', '122.3906360', '29.9163030');
INSERT INTO `sys_cn_area` VALUES ('331208', '洋山岛', '洋山', '331200', null, '中国,浙江省,舟山群岛新区,洋山岛', '3', '316000', '0580', 'Yangshan', '121.9958910', '30.0946370');
INSERT INTO `sys_cn_area` VALUES ('331209', '长涂岛', '长涂', '331200', null, '中国,浙江省,舟山群岛新区,长涂岛', '3', '316000', '0580', 'Changtu', '122.2846810', '30.2488800');
INSERT INTO `sys_cn_area` VALUES ('331210', '虾峙岛', '虾峙', '331200', null, '中国,浙江省,舟山群岛新区,虾峙岛', '3', '316000', '0580', 'Xiazhi', '122.2446860', '29.7529410');
INSERT INTO `sys_cn_area` VALUES ('340000', '安徽省', '安徽', '100000', null, '中国,安徽省', '1', null, '', 'Anhui', '117.2830420', '31.8611900');
INSERT INTO `sys_cn_area` VALUES ('340100', '合肥市', '合肥', '340000', null, '中国,安徽省,合肥市', '2', '230001', '0551', 'Hefei', '117.2830420', '31.8611900');
INSERT INTO `sys_cn_area` VALUES ('340102', '瑶海区', '瑶海', '340100', null, '中国,安徽省,合肥市,瑶海区', '3', '230011', '0551', 'Yaohai', '117.3094700', '31.8580900');
INSERT INTO `sys_cn_area` VALUES ('340103', '庐阳区', '庐阳', '340100', null, '中国,安徽省,合肥市,庐阳区', '3', '230001', '0551', 'Luyang', '117.2645200', '31.8787400');
INSERT INTO `sys_cn_area` VALUES ('340104', '蜀山区', '蜀山', '340100', null, '中国,安徽省,合肥市,蜀山区', '3', '230031', '0551', 'Shushan', '117.2610400', '31.8511700');
INSERT INTO `sys_cn_area` VALUES ('340111', '包河区', '包河', '340100', null, '中国,安徽省,合肥市,包河区', '3', '230041', '0551', 'Baohe', '117.3098400', '31.7950200');
INSERT INTO `sys_cn_area` VALUES ('340121', '长丰县', '长丰', '340100', null, '中国,安徽省,合肥市,长丰县', '3', '231100', '0551', 'Changfeng', '117.1654900', '32.4795900');
INSERT INTO `sys_cn_area` VALUES ('340122', '肥东县', '肥东', '340100', null, '中国,安徽省,合肥市,肥东县', '3', '231600', '0551', 'Feidong', '117.4712800', '31.8852500');
INSERT INTO `sys_cn_area` VALUES ('340123', '肥西县', '肥西', '340100', null, '中国,安徽省,合肥市,肥西县', '3', '231200', '0551', 'Feixi', '117.1684500', '31.7214300');
INSERT INTO `sys_cn_area` VALUES ('340124', '庐江县', '庐江', '340100', null, '中国,安徽省,合肥市,庐江县', '3', '231500', '0565', 'Lujiang', '117.2898440', '31.2514880');
INSERT INTO `sys_cn_area` VALUES ('340181', '巢湖市', '巢湖', '340100', null, '中国,安徽省,合肥市,巢湖市', '3', '238000', '0565', 'Chaohu', '117.8741550', '31.6005180');
INSERT INTO `sys_cn_area` VALUES ('340200', '芜湖市', '芜湖', '340000', null, '中国,安徽省,芜湖市', '2', '241000', '0551', 'Wuhu', '118.3764510', '31.3263190');
INSERT INTO `sys_cn_area` VALUES ('340202', '镜湖区', '镜湖', '340200', null, '中国,安徽省,芜湖市,镜湖区', '3', '241000', '0553', 'Jinghu', '118.3852500', '31.3403800');
INSERT INTO `sys_cn_area` VALUES ('340203', '弋江区', '弋江', '340200', null, '中国,安徽省,芜湖市,弋江区', '3', '241000', '0553', 'Yijiang', '118.3726500', '31.3117800');
INSERT INTO `sys_cn_area` VALUES ('340207', '鸠江区', '鸠江', '340200', null, '中国,安徽省,芜湖市,鸠江区', '3', '241000', '0553', 'Jiujiang', '118.3921500', '31.3692800');
INSERT INTO `sys_cn_area` VALUES ('340208', '三山区', '三山', '340200', null, '中国,安徽省,芜湖市,三山区', '3', '241000', '0553', 'Sanshan', '118.2250900', '31.2070300');
INSERT INTO `sys_cn_area` VALUES ('340221', '芜湖县', '芜湖', '340200', null, '中国,安徽省,芜湖市,芜湖县', '3', '241100', '0553', 'Wuhu', '118.5752500', '31.1347600');
INSERT INTO `sys_cn_area` VALUES ('340222', '繁昌县', '繁昌', '340200', null, '中国,安徽省,芜湖市,繁昌县', '3', '241200', '0553', 'Fanchang', '118.1998200', '31.0831900');
INSERT INTO `sys_cn_area` VALUES ('340223', '南陵县', '南陵', '340200', null, '中国,安徽省,芜湖市,南陵县', '3', '242400', '0553', 'Nanling', '118.3368800', '30.9196900');
INSERT INTO `sys_cn_area` VALUES ('340225', '无为县', '无为', '340200', null, '中国,安徽省,芜湖市,无为县', '3', '238300', '0565', 'Wuwei', '117.9114320', '31.3030750');
INSERT INTO `sys_cn_area` VALUES ('340300', '蚌埠市', '蚌埠', '340000', null, '中国,安徽省,蚌埠市', '2', '233000', '0552', 'Bengbu', '117.3623700', '32.9340370');
INSERT INTO `sys_cn_area` VALUES ('340302', '龙子湖区', '龙子湖', '340300', null, '中国,安徽省,蚌埠市,龙子湖区', '3', '233000', '0552', 'Longzihu', '117.3937900', '32.9430100');
INSERT INTO `sys_cn_area` VALUES ('340303', '蚌山区', '蚌山', '340300', null, '中国,安徽省,蚌埠市,蚌山区', '3', '233000', '0552', 'Bengshan', '117.3676700', '32.9441100');
INSERT INTO `sys_cn_area` VALUES ('340304', '禹会区', '禹会', '340300', null, '中国,安徽省,蚌埠市,禹会区', '3', '233010', '0552', 'Yuhui', '117.3531500', '32.9333600');
INSERT INTO `sys_cn_area` VALUES ('340311', '淮上区', '淮上', '340300', null, '中国,安徽省,蚌埠市,淮上区', '3', '233002', '0552', 'Huaishang', '117.3598300', '32.9642300');
INSERT INTO `sys_cn_area` VALUES ('340321', '怀远县', '怀远', '340300', null, '中国,安徽省,蚌埠市,怀远县', '3', '233400', '0552', 'Huaiyuan', '117.2050700', '32.9700700');
INSERT INTO `sys_cn_area` VALUES ('340322', '五河县', '五河', '340300', null, '中国,安徽省,蚌埠市,五河县', '3', '233300', '0552', 'Wuhe', '117.8914400', '33.1445700');
INSERT INTO `sys_cn_area` VALUES ('340323', '固镇县', '固镇', '340300', null, '中国,安徽省,蚌埠市,固镇县', '3', '233700', '0552', 'Guzhen', '117.3155800', '33.3180300');
INSERT INTO `sys_cn_area` VALUES ('340400', '淮南市', '淮南', '340000', null, '中国,安徽省,淮南市', '2', '232001', '0554', 'Huainan', '117.0254490', '32.6459470');
INSERT INTO `sys_cn_area` VALUES ('340402', '大通区', '大通', '340400', null, '中国,安徽省,淮南市,大通区', '3', '232033', '0554', 'Datong', '117.0525500', '32.6326500');
INSERT INTO `sys_cn_area` VALUES ('340403', '田家庵区', '田家庵', '340400', null, '中国,安徽省,淮南市,田家庵区', '3', '232000', '0554', 'Tianjiaan', '117.0173900', '32.6469700');
INSERT INTO `sys_cn_area` VALUES ('340404', '谢家集区', '谢家集', '340400', null, '中国,安徽省,淮南市,谢家集区', '3', '232052', '0554', 'Xiejiaji', '116.8637700', '32.5981800');
INSERT INTO `sys_cn_area` VALUES ('340405', '八公山区', '八公山', '340400', null, '中国,安徽省,淮南市,八公山区', '3', '232072', '0554', 'Bagongshan', '116.8369400', '32.6294100');
INSERT INTO `sys_cn_area` VALUES ('340406', '潘集区', '潘集', '340400', null, '中国,安徽省,淮南市,潘集区', '3', '232082', '0554', 'Panji', '116.8162200', '32.7828700');
INSERT INTO `sys_cn_area` VALUES ('340421', '凤台县', '凤台', '340400', null, '中国,安徽省,淮南市,凤台县', '3', '232100', '0554', 'Fengtai', '116.7156900', '32.7075200');
INSERT INTO `sys_cn_area` VALUES ('340500', '马鞍山市', '马鞍山', '340000', null, '中国,安徽省,马鞍山市', '2', '243001', '0555', 'Ma\'anshan', '118.5079060', '31.6893620');
INSERT INTO `sys_cn_area` VALUES ('340503', '花山区', '花山', '340500', null, '中国,安徽省,马鞍山市,花山区', '3', '243000', '0555', 'Huashan', '118.5123100', '31.7001000');
INSERT INTO `sys_cn_area` VALUES ('340504', '雨山区', '雨山', '340500', null, '中国,安徽省,马鞍山市,雨山区', '3', '243071', '0555', 'Yushan', '118.4986900', '31.6821900');
INSERT INTO `sys_cn_area` VALUES ('340506', '博望区', '博望', '340500', null, '中国,安徽省,马鞍山市,博望区', '3', '243131', '0555', 'Bowang', '118.8443870', '31.5618710');
INSERT INTO `sys_cn_area` VALUES ('340521', '当涂县', '当涂', '340500', null, '中国,安徽省,马鞍山市,当涂县', '3', '243100', '0555', 'Dangtu', '118.4978600', '31.5709800');
INSERT INTO `sys_cn_area` VALUES ('340522', '含山县', '含山', '340500', null, '中国,安徽省,马鞍山市,含山县', '3', '238100', '0555', 'Hanshan ', '118.1055450', '31.7277580');
INSERT INTO `sys_cn_area` VALUES ('340523', '和县', '和县', '340500', null, '中国,安徽省,马鞍山市,和县', '3', '238200', '0555', 'Hexian', '118.3514050', '31.7417940');
INSERT INTO `sys_cn_area` VALUES ('340600', '淮北市', '淮北', '340000', null, '中国,安徽省,淮北市', '2', '235000', '0561', 'Huaibei', '116.7946640', '33.9717070');
INSERT INTO `sys_cn_area` VALUES ('340602', '杜集区', '杜集', '340600', null, '中国,安徽省,淮北市,杜集区', '3', '235000', '0561', 'Duji', '116.8299800', '33.9936300');
INSERT INTO `sys_cn_area` VALUES ('340603', '相山区', '相山', '340600', null, '中国,安徽省,淮北市,相山区', '3', '235000', '0561', 'Xiangshan', '116.7946400', '33.9597900');
INSERT INTO `sys_cn_area` VALUES ('340604', '烈山区', '烈山', '340600', null, '中国,安徽省,淮北市,烈山区', '3', '235000', '0561', 'Lieshan', '116.8144800', '33.8935500');
INSERT INTO `sys_cn_area` VALUES ('340621', '濉溪县', '濉溪', '340600', null, '中国,安徽省,淮北市,濉溪县', '3', '235100', '0561', 'Suixi', '116.7678500', '33.9145500');
INSERT INTO `sys_cn_area` VALUES ('340700', '铜陵市', '铜陵', '340000', null, '中国,安徽省,铜陵市', '2', '244000', '0562', 'Tongling', '117.8165760', '30.9299350');
INSERT INTO `sys_cn_area` VALUES ('340702', '铜官山区', '铜官山', '340700', null, '中国,安徽省,铜陵市,铜官山区', '3', '244000', '0562', 'Tongguanshan', '117.8152500', '30.9342300');
INSERT INTO `sys_cn_area` VALUES ('340703', '狮子山区', '狮子山', '340700', null, '中国,安徽省,铜陵市,狮子山区', '3', '244000', '0562', 'Shizishan', '117.8917800', '30.9263100');
INSERT INTO `sys_cn_area` VALUES ('340711', '郊区', '郊区', '340700', null, '中国,安徽省,铜陵市,郊区', '3', '244000', '0562', 'Jiaoqu', '117.8086800', '30.9197600');
INSERT INTO `sys_cn_area` VALUES ('340721', '铜陵县', '铜陵', '340700', null, '中国,安徽省,铜陵市,铜陵县', '3', '244100', '0562', 'Tongling', '117.7911300', '30.9536500');
INSERT INTO `sys_cn_area` VALUES ('340800', '安庆市', '安庆', '340000', null, '中国,安徽省,安庆市', '2', '246001', '0556', 'Anqing', '117.0535710', '30.5248160');
INSERT INTO `sys_cn_area` VALUES ('340802', '迎江区', '迎江', '340800', null, '中国,安徽省,安庆市,迎江区', '3', '246001', '0556', 'Yingjiang', '117.0493000', '30.5042100');
INSERT INTO `sys_cn_area` VALUES ('340803', '大观区', '大观', '340800', null, '中国,安徽省,安庆市,大观区', '3', '246002', '0556', 'Daguan', '117.0342600', '30.5121600');
INSERT INTO `sys_cn_area` VALUES ('340811', '宜秀区', '宜秀', '340800', null, '中国,安徽省,安庆市,宜秀区', '3', '246003', '0556', 'Yixiu', '117.0612700', '30.5078300');
INSERT INTO `sys_cn_area` VALUES ('340822', '怀宁县', '怀宁', '340800', null, '中国,安徽省,安庆市,怀宁县', '3', '246100', '0556', 'Huaining', '116.8296800', '30.7337600');
INSERT INTO `sys_cn_area` VALUES ('340823', '枞阳县', '枞阳', '340800', null, '中国,安徽省,安庆市,枞阳县', '3', '246700', '0556', 'Zongyang', '117.2201500', '30.6995600');
INSERT INTO `sys_cn_area` VALUES ('340824', '潜山县', '潜山', '340800', null, '中国,安徽省,安庆市,潜山县', '3', '246300', '0556', 'Qianshan', '116.5757400', '30.6303700');
INSERT INTO `sys_cn_area` VALUES ('340825', '太湖县', '太湖', '340800', null, '中国,安徽省,安庆市,太湖县', '3', '246400', '0556', 'Taihu', '116.3088000', '30.4541000');
INSERT INTO `sys_cn_area` VALUES ('340826', '宿松县', '宿松', '340800', null, '中国,安徽省,安庆市,宿松县', '3', '246500', '0556', 'Susong', '116.1291500', '30.1536000');
INSERT INTO `sys_cn_area` VALUES ('340827', '望江县', '望江', '340800', null, '中国,安徽省,安庆市,望江县', '3', '246200', '0556', 'Wangjiang', '116.6881400', '30.1258500');
INSERT INTO `sys_cn_area` VALUES ('340828', '岳西县', '岳西', '340800', null, '中国,安徽省,安庆市,岳西县', '3', '246600', '0556', 'Yuexi', '116.3599500', '30.8498300');
INSERT INTO `sys_cn_area` VALUES ('340881', '桐城市', '桐城', '340800', null, '中国,安徽省,安庆市,桐城市', '3', '231400', '0556', 'Tongcheng', '116.9507100', '31.0521600');
INSERT INTO `sys_cn_area` VALUES ('341000', '黄山市', '黄山', '340000', null, '中国,安徽省,黄山市', '2', '245000', '0559', 'Huangshan', '118.3173250', '29.7092390');
INSERT INTO `sys_cn_area` VALUES ('341002', '屯溪区', '屯溪', '341000', null, '中国,安徽省,黄山市,屯溪区', '3', '245000', '0559', 'Tunxi', '118.3336800', '29.7113800');
INSERT INTO `sys_cn_area` VALUES ('341003', '黄山区', '黄山', '341000', null, '中国,安徽省,黄山市,黄山区', '3', '242700', '0559', 'Huangshan', '118.1416000', '30.2729000');
INSERT INTO `sys_cn_area` VALUES ('341004', '徽州区', '徽州', '341000', null, '中国,安徽省,黄山市,徽州区', '3', '245061', '0559', 'Huizhou', '118.3365400', '29.8278400');
INSERT INTO `sys_cn_area` VALUES ('341021', '歙县', '歙县', '341000', null, '中国,安徽省,黄山市,歙县', '3', '245200', '0559', 'Shexian', '118.4367600', '29.8674500');
INSERT INTO `sys_cn_area` VALUES ('341022', '休宁县', '休宁', '341000', null, '中国,安徽省,黄山市,休宁县', '3', '245400', '0559', 'Xiuning', '118.1813600', '29.7860700');
INSERT INTO `sys_cn_area` VALUES ('341023', '黟县', '黟县', '341000', null, '中国,安徽省,黄山市,黟县', '3', '245500', '0559', 'Yixian', '117.9413700', '29.9258800');
INSERT INTO `sys_cn_area` VALUES ('341024', '祁门县', '祁门', '341000', null, '中国,安徽省,黄山市,祁门县', '3', '245600', '0559', 'Qimen', '117.7184700', '29.8572300');
INSERT INTO `sys_cn_area` VALUES ('341100', '滁州市', '滁州', '340000', null, '中国,安徽省,滁州市', '2', '239000', '0550', 'Chuzhou', '118.3162640', '32.3036270');
INSERT INTO `sys_cn_area` VALUES ('341102', '琅琊区', '琅琊', '341100', null, '中国,安徽省,滁州市,琅琊区', '3', '239000', '0550', 'Langya', '118.3053800', '32.2952100');
INSERT INTO `sys_cn_area` VALUES ('341103', '南谯区', '南谯', '341100', null, '中国,安徽省,滁州市,南谯区', '3', '239000', '0550', 'Nanqiao', '118.3122200', '32.3186100');
INSERT INTO `sys_cn_area` VALUES ('341122', '来安县', '来安', '341100', null, '中国,安徽省,滁州市,来安县', '3', '239200', '0550', 'Lai\'an', '118.4343800', '32.4517600');
INSERT INTO `sys_cn_area` VALUES ('341124', '全椒县', '全椒', '341100', null, '中国,安徽省,滁州市,全椒县', '3', '239500', '0550', 'Quanjiao', '118.2729100', '32.0852400');
INSERT INTO `sys_cn_area` VALUES ('341125', '定远县', '定远', '341100', null, '中国,安徽省,滁州市,定远县', '3', '233200', '0550', 'Dingyuan', '117.6803500', '32.5248800');
INSERT INTO `sys_cn_area` VALUES ('341126', '凤阳县', '凤阳', '341100', null, '中国,安徽省,滁州市,凤阳县', '3', '233100', '0550', 'Fengyang', '117.5645400', '32.8650700');
INSERT INTO `sys_cn_area` VALUES ('341181', '天长市', '天长', '341100', null, '中国,安徽省,滁州市,天长市', '3', '239300', '0550', 'Tianchang', '118.9986800', '32.6912400');
INSERT INTO `sys_cn_area` VALUES ('341182', '明光市', '明光', '341100', null, '中国,安徽省,滁州市,明光市', '3', '239400', '0550', 'Mingguang', '117.9909300', '32.7781900');
INSERT INTO `sys_cn_area` VALUES ('341200', '阜阳市', '阜阳', '340000', null, '中国,安徽省,阜阳市', '2', '236033', '0558', 'Fuyang', '115.8197290', '32.8969690');
INSERT INTO `sys_cn_area` VALUES ('341202', '颍州区', '颍州', '341200', null, '中国,安徽省,阜阳市,颍州区', '3', '236001', '0558', 'Yingzhou', '115.8069400', '32.8834600');
INSERT INTO `sys_cn_area` VALUES ('341203', '颍东区', '颍东', '341200', null, '中国,安徽省,阜阳市,颍东区', '3', '236058', '0558', 'Yingdong', '115.8565900', '32.9129600');
INSERT INTO `sys_cn_area` VALUES ('341204', '颍泉区', '颍泉', '341200', null, '中国,安徽省,阜阳市,颍泉区', '3', '236045', '0558', 'Yingquan', '115.8071200', '32.9249000');
INSERT INTO `sys_cn_area` VALUES ('341221', '临泉县', '临泉', '341200', null, '中国,安徽省,阜阳市,临泉县', '3', '236400', '0558', 'Linquan', '115.2623200', '33.0675800');
INSERT INTO `sys_cn_area` VALUES ('341222', '太和县', '太和', '341200', null, '中国,安徽省,阜阳市,太和县', '3', '236600', '0558', 'Taihe', '115.6219100', '33.1602500');
INSERT INTO `sys_cn_area` VALUES ('341225', '阜南县', '阜南', '341200', null, '中国,安徽省,阜阳市,阜南县', '3', '236300', '0558', 'Funan', '115.5856300', '32.6355100');
INSERT INTO `sys_cn_area` VALUES ('341226', '颍上县', '颍上', '341200', null, '中国,安徽省,阜阳市,颍上县', '3', '236200', '0558', 'Yingshang', '116.2645800', '32.6299800');
INSERT INTO `sys_cn_area` VALUES ('341282', '界首市', '界首', '341200', null, '中国,安徽省,阜阳市,界首市', '3', '236500', '0558', 'Jieshou', '115.3744500', '33.2571400');
INSERT INTO `sys_cn_area` VALUES ('341300', '宿州市', '宿州', '340000', null, '中国,安徽省,宿州市', '2', '234000', '0557', 'Suzhou', '116.9840840', '33.6338910');
INSERT INTO `sys_cn_area` VALUES ('341302', '埇桥区', '埇桥', '341300', null, '中国,安徽省,宿州市,埇桥区', '3', '234000', '0557', 'Yongqiao', '116.9773100', '33.6405800');
INSERT INTO `sys_cn_area` VALUES ('341321', '砀山县', '砀山', '341300', null, '中国,安徽省,宿州市,砀山县', '3', '235300', '0557', 'Dangshan', '116.3536300', '34.4235600');
INSERT INTO `sys_cn_area` VALUES ('341322', '萧县', '萧县', '341300', null, '中国,安徽省,宿州市,萧县', '3', '235200', '0557', 'Xiaoxian', '116.9454600', '34.1879000');
INSERT INTO `sys_cn_area` VALUES ('341323', '灵璧县', '灵璧', '341300', null, '中国,安徽省,宿州市,灵璧县', '3', '234200', '0557', 'Lingbi', '117.5581300', '33.5433900');
INSERT INTO `sys_cn_area` VALUES ('341324', '泗县', '泗县', '341300', null, '中国,安徽省,宿州市,泗县', '3', '234300', '0557', 'Sixian', '117.9103300', '33.4829500');
INSERT INTO `sys_cn_area` VALUES ('341500', '六安市', '六安', '340000', null, '中国,安徽省,六安市', '2', '237000', '0564', 'Lu\'an', '116.5076760', '31.7528890');
INSERT INTO `sys_cn_area` VALUES ('341502', '金安区', '金安', '341500', null, '中国,安徽省,六安市,金安区', '3', '237005', '0564', 'Jin\'an', '116.5091200', '31.7557300');
INSERT INTO `sys_cn_area` VALUES ('341503', '裕安区', '裕安', '341500', null, '中国,安徽省,六安市,裕安区', '3', '237010', '0564', 'Yu\'an', '116.4798500', '31.7378700');
INSERT INTO `sys_cn_area` VALUES ('341521', '寿县', '寿县', '341500', null, '中国,安徽省,六安市,寿县', '3', '232200', '0564', 'Shouxian', '116.7846600', '32.5765300');
INSERT INTO `sys_cn_area` VALUES ('341522', '霍邱县', '霍邱', '341500', null, '中国,安徽省,六安市,霍邱县', '3', '237400', '0564', 'Huoqiu', '116.2779500', '32.3530000');
INSERT INTO `sys_cn_area` VALUES ('341523', '舒城县', '舒城', '341500', null, '中国,安徽省,六安市,舒城县', '3', '231300', '0564', 'Shucheng', '116.9449100', '31.4641300');
INSERT INTO `sys_cn_area` VALUES ('341524', '金寨县', '金寨', '341500', null, '中国,安徽省,六安市,金寨县', '3', '237300', '0564', 'Jinzhai', '115.9346300', '31.7351000');
INSERT INTO `sys_cn_area` VALUES ('341525', '霍山县', '霍山', '341500', null, '中国,安徽省,六安市,霍山县', '3', '237200', '0564', 'Huoshan', '116.3329100', '31.3929000');
INSERT INTO `sys_cn_area` VALUES ('341600', '亳州市', '亳州', '340000', null, '中国,安徽省,亳州市', '2', '236802', '0558', 'Bozhou', '115.7829390', '33.8693380');
INSERT INTO `sys_cn_area` VALUES ('341602', '谯城区', '谯城', '341600', null, '中国,安徽省,亳州市,谯城区', '3', '236800', '0558', 'Qiaocheng', '115.7794100', '33.8753200');
INSERT INTO `sys_cn_area` VALUES ('341621', '涡阳县', '涡阳', '341600', null, '中国,安徽省,亳州市,涡阳县', '3', '233600', '0558', 'Guoyang', '116.2168200', '33.5091100');
INSERT INTO `sys_cn_area` VALUES ('341622', '蒙城县', '蒙城', '341600', null, '中国,安徽省,亳州市,蒙城县', '3', '233500', '0558', 'Mengcheng', '116.5646000', '33.2647700');
INSERT INTO `sys_cn_area` VALUES ('341623', '利辛县', '利辛', '341600', null, '中国,安徽省,亳州市,利辛县', '3', '236700', '0558', 'Lixin', '116.2080000', '33.1419800');
INSERT INTO `sys_cn_area` VALUES ('341700', '池州市', '池州', '340000', null, '中国,安徽省,池州市', '2', '247100', '0566', 'Chizhou', '117.4891570', '30.6560370');
INSERT INTO `sys_cn_area` VALUES ('341702', '贵池区', '贵池', '341700', null, '中国,安徽省,池州市,贵池区', '3', '247100', '0566', 'Guichi', '117.4872200', '30.6528300');
INSERT INTO `sys_cn_area` VALUES ('341721', '东至县', '东至', '341700', null, '中国,安徽省,池州市,东至县', '3', '247200', '0566', 'Dongzhi', '117.0271900', '30.0969000');
INSERT INTO `sys_cn_area` VALUES ('341722', '石台县', '石台', '341700', null, '中国,安徽省,池州市,石台县', '3', '245100', '0566', 'Shitai', '117.4866600', '30.2104200');
INSERT INTO `sys_cn_area` VALUES ('341723', '青阳县', '青阳', '341700', null, '中国,安徽省,池州市,青阳县', '3', '242800', '0566', 'Qingyang', '117.8474400', '30.6393200');
INSERT INTO `sys_cn_area` VALUES ('341800', '宣城市', '宣城', '340000', null, '中国,安徽省,宣城市', '2', '242000', '0563', 'Xuancheng', '118.7579950', '30.9456670');
INSERT INTO `sys_cn_area` VALUES ('341802', '宣州区', '宣州', '341800', null, '中国,安徽省,宣城市,宣州区', '3', '242000', '0563', 'Xuanzhou', '118.7546200', '30.9443900');
INSERT INTO `sys_cn_area` VALUES ('341821', '郎溪县', '郎溪', '341800', null, '中国,安徽省,宣城市,郎溪县', '3', '242100', '0563', 'Langxi', '119.1792300', '31.1259900');
INSERT INTO `sys_cn_area` VALUES ('341822', '广德县', '广德', '341800', null, '中国,安徽省,宣城市,广德县', '3', '242200', '0563', 'Guangde', '119.4176900', '30.8937100');
INSERT INTO `sys_cn_area` VALUES ('341823', '泾县', '泾县', '341800', null, '中国,安徽省,宣城市,泾县', '3', '242500', '0563', 'Jingxian', '118.4196400', '30.6949800');
INSERT INTO `sys_cn_area` VALUES ('341824', '绩溪县', '绩溪', '341800', null, '中国,安徽省,宣城市,绩溪县', '3', '245300', '0563', 'Jixi', '118.5976500', '30.0706900');
INSERT INTO `sys_cn_area` VALUES ('341825', '旌德县', '旌德', '341800', null, '中国,安徽省,宣城市,旌德县', '3', '242600', '0563', 'Jingde', '118.5429900', '30.2889800');
INSERT INTO `sys_cn_area` VALUES ('341881', '宁国市', '宁国', '341800', null, '中国,安徽省,宣城市,宁国市', '3', '242300', '0563', 'Ningguo', '118.9834900', '30.6238000');
INSERT INTO `sys_cn_area` VALUES ('350000', '福建省', '福建', '100000', null, '中国,福建省', '1', null, '', 'Fujian', '119.3062390', '26.0753020');
INSERT INTO `sys_cn_area` VALUES ('350100', '福州市', '福州', '350000', null, '中国,福建省,福州市', '2', '350001', '0591', 'Fuzhou', '119.3062390', '26.0753020');
INSERT INTO `sys_cn_area` VALUES ('350102', '鼓楼区', '鼓楼', '350100', null, '中国,福建省,福州市,鼓楼区', '3', '350001', '0591', 'Gulou', '119.3038400', '26.0822500');
INSERT INTO `sys_cn_area` VALUES ('350103', '台江区', '台江', '350100', null, '中国,福建省,福州市,台江区', '3', '350004', '0591', 'Taijiang', '119.3089900', '26.0620400');
INSERT INTO `sys_cn_area` VALUES ('350104', '仓山区', '仓山', '350100', null, '中国,福建省,福州市,仓山区', '3', '350007', '0591', 'Cangshan', '119.3154300', '26.0433500');
INSERT INTO `sys_cn_area` VALUES ('350105', '马尾区', '马尾', '350100', null, '中国,福建省,福州市,马尾区', '3', '350015', '0591', 'Mawei', '119.4555000', '25.9894200');
INSERT INTO `sys_cn_area` VALUES ('350111', '晋安区', '晋安', '350100', null, '中国,福建省,福州市,晋安区', '3', '350011', '0591', 'Jin\'an', '119.3282800', '26.0818000');
INSERT INTO `sys_cn_area` VALUES ('350121', '闽侯县', '闽侯', '350100', null, '中国,福建省,福州市,闽侯县', '3', '350100', '0591', 'Minhou', '119.1338800', '26.1501400');
INSERT INTO `sys_cn_area` VALUES ('350122', '连江县', '连江', '350100', null, '中国,福建省,福州市,连江县', '3', '350500', '0591', 'Lianjiang', '119.5343300', '26.1946600');
INSERT INTO `sys_cn_area` VALUES ('350123', '罗源县', '罗源', '350100', null, '中国,福建省,福州市,罗源县', '3', '350600', '0591', 'Luoyuan', '119.5509000', '26.4875200');
INSERT INTO `sys_cn_area` VALUES ('350124', '闽清县', '闽清', '350100', null, '中国,福建省,福州市,闽清县', '3', '350800', '0591', 'Minqing', '118.8623000', '26.2190100');
INSERT INTO `sys_cn_area` VALUES ('350125', '永泰县', '永泰', '350100', null, '中国,福建省,福州市,永泰县', '3', '350700', '0591', 'Yongtai', '118.9360000', '25.8681600');
INSERT INTO `sys_cn_area` VALUES ('350128', '平潭县', '平潭', '350100', null, '中国,福建省,福州市,平潭县', '3', '350400', '0591', 'Pingtan', '119.7911970', '25.5036720');
INSERT INTO `sys_cn_area` VALUES ('350181', '福清市', '福清', '350100', null, '中国,福建省,福州市,福清市', '3', '350300', '0591', 'Fuqing', '119.3850700', '25.7208600');
INSERT INTO `sys_cn_area` VALUES ('350182', '长乐市', '长乐', '350100', null, '中国,福建省,福州市,长乐市', '3', '350200', '0591', 'Changle', '119.5231300', '25.9627600');
INSERT INTO `sys_cn_area` VALUES ('350200', '厦门市', '厦门', '350000', null, '中国,福建省,厦门市', '2', '361003', '0592', 'Xiamen', '118.1102200', '24.4904740');
INSERT INTO `sys_cn_area` VALUES ('350203', '思明区', '思明', '350200', null, '中国,福建省,厦门市,思明区', '3', '361001', '0592', 'Siming', '118.0823300', '24.4454300');
INSERT INTO `sys_cn_area` VALUES ('350205', '海沧区', '海沧', '350200', null, '中国,福建省,厦门市,海沧区', '3', '361026', '0592', 'Haicang', '118.0328900', '24.4846100');
INSERT INTO `sys_cn_area` VALUES ('350206', '湖里区', '湖里', '350200', null, '中国,福建省,厦门市,湖里区', '3', '361006', '0592', 'Huli', '118.1462100', '24.5125300');
INSERT INTO `sys_cn_area` VALUES ('350211', '集美区', '集美', '350200', null, '中国,福建省,厦门市,集美区', '3', '361021', '0592', 'Jimei', '118.0971900', '24.5758400');
INSERT INTO `sys_cn_area` VALUES ('350212', '同安区', '同安', '350200', null, '中国,福建省,厦门市,同安区', '3', '361100', '0592', 'Tong\'an', '118.1519700', '24.7230800');
INSERT INTO `sys_cn_area` VALUES ('350213', '翔安区', '翔安', '350200', null, '中国,福建省,厦门市,翔安区', '3', '361101', '0592', 'Xiang\'an', '118.2478300', '24.6186300');
INSERT INTO `sys_cn_area` VALUES ('350300', '莆田市', '莆田', '350000', null, '中国,福建省,莆田市', '2', '351100', '0594', 'Putian', '119.0075580', '25.4310110');
INSERT INTO `sys_cn_area` VALUES ('350302', '城厢区', '城厢', '350300', null, '中国,福建省,莆田市,城厢区', '3', '351100', '0594', 'Chengxiang', '118.9946200', '25.4187200');
INSERT INTO `sys_cn_area` VALUES ('350303', '涵江区', '涵江', '350300', null, '中国,福建省,莆田市,涵江区', '3', '351111', '0594', 'Hanjiang', '119.1162100', '25.4587600');
INSERT INTO `sys_cn_area` VALUES ('350304', '荔城区', '荔城', '350300', null, '中国,福建省,莆田市,荔城区', '3', '351100', '0594', 'Licheng', '119.0133900', '25.4336900');
INSERT INTO `sys_cn_area` VALUES ('350305', '秀屿区', '秀屿', '350300', null, '中国,福建省,莆田市,秀屿区', '3', '351152', '0594', 'Xiuyu', '119.1055300', '25.3183100');
INSERT INTO `sys_cn_area` VALUES ('350322', '仙游县', '仙游', '350300', null, '中国,福建省,莆田市,仙游县', '3', '351200', '0594', 'Xianyou', '118.6917700', '25.3621400');
INSERT INTO `sys_cn_area` VALUES ('350400', '三明市', '三明', '350000', null, '中国,福建省,三明市', '2', '365000', '0598', 'Sanming', '117.6350010', '26.2654440');
INSERT INTO `sys_cn_area` VALUES ('350402', '梅列区', '梅列', '350400', null, '中国,福建省,三明市,梅列区', '3', '365000', '0598', 'Meilie', '117.6458500', '26.2717100');
INSERT INTO `sys_cn_area` VALUES ('350403', '三元区', '三元', '350400', null, '中国,福建省,三明市,三元区', '3', '365001', '0598', 'Sanyuan', '117.6078800', '26.2337200');
INSERT INTO `sys_cn_area` VALUES ('350421', '明溪县', '明溪', '350400', null, '中国,福建省,三明市,明溪县', '3', '365200', '0598', 'Mingxi', '117.2049800', '26.3529400');
INSERT INTO `sys_cn_area` VALUES ('350423', '清流县', '清流', '350400', null, '中国,福建省,三明市,清流县', '3', '365300', '0598', 'Qingliu', '116.8146000', '26.1714400');
INSERT INTO `sys_cn_area` VALUES ('350424', '宁化县', '宁化', '350400', null, '中国,福建省,三明市,宁化县', '3', '365400', '0598', 'Ninghua', '116.6610100', '26.2587400');
INSERT INTO `sys_cn_area` VALUES ('350425', '大田县', '大田', '350400', null, '中国,福建省,三明市,大田县', '3', '366100', '0598', 'Datian', '117.8471000', '25.6926000');
INSERT INTO `sys_cn_area` VALUES ('350426', '尤溪县', '尤溪', '350400', null, '中国,福建省,三明市,尤溪县', '3', '365100', '0598', 'Youxi', '118.1904900', '26.1700200');
INSERT INTO `sys_cn_area` VALUES ('350427', '沙县', '沙县', '350400', null, '中国,福建省,三明市,沙县', '3', '365500', '0598', 'Shaxian', '117.7926600', '26.3961500');
INSERT INTO `sys_cn_area` VALUES ('350428', '将乐县', '将乐', '350400', null, '中国,福建省,三明市,将乐县', '3', '353300', '0598', 'Jiangle', '117.4731700', '26.7283700');
INSERT INTO `sys_cn_area` VALUES ('350429', '泰宁县', '泰宁', '350400', null, '中国,福建省,三明市,泰宁县', '3', '354400', '0598', 'Taining', '117.1757800', '26.9001000');
INSERT INTO `sys_cn_area` VALUES ('350430', '建宁县', '建宁', '350400', null, '中国,福建省,三明市,建宁县', '3', '354500', '0598', 'Jianning', '116.8460300', '26.8309100');
INSERT INTO `sys_cn_area` VALUES ('350481', '永安市', '永安', '350400', null, '中国,福建省,三明市,永安市', '3', '366000', '0598', 'Yong\'an', '117.3651700', '25.9413600');
INSERT INTO `sys_cn_area` VALUES ('350500', '泉州市', '泉州', '350000', null, '中国,福建省,泉州市', '2', '362000', '0595', 'Quanzhou', '118.5894210', '24.9088530');
INSERT INTO `sys_cn_area` VALUES ('350502', '鲤城区', '鲤城', '350500', null, '中国,福建省,泉州市,鲤城区', '3', '362000', '0595', 'Licheng', '118.5659100', '24.8874100');
INSERT INTO `sys_cn_area` VALUES ('350503', '丰泽区', '丰泽', '350500', null, '中国,福建省,泉州市,丰泽区', '3', '362000', '0595', 'Fengze', '118.6132800', '24.8911900');
INSERT INTO `sys_cn_area` VALUES ('350504', '洛江区', '洛江', '350500', null, '中国,福建省,泉州市,洛江区', '3', '362011', '0595', 'Luojiang', '118.6711100', '24.9398400');
INSERT INTO `sys_cn_area` VALUES ('350505', '泉港区', '泉港', '350500', null, '中国,福建省,泉州市,泉港区', '3', '362114', '0595', 'Quangang', '118.9158600', '25.1200500');
INSERT INTO `sys_cn_area` VALUES ('350521', '惠安县', '惠安', '350500', null, '中国,福建省,泉州市,惠安县', '3', '362100', '0595', 'Hui\'an', '118.7968700', '25.0305900');
INSERT INTO `sys_cn_area` VALUES ('350524', '安溪县', '安溪', '350500', null, '中国,福建省,泉州市,安溪县', '3', '362400', '0595', 'Anxi', '118.1871900', '25.0562700');
INSERT INTO `sys_cn_area` VALUES ('350525', '永春县', '永春', '350500', null, '中国,福建省,泉州市,永春县', '3', '362600', '0595', 'Yongchun', '118.2943700', '25.3218300');
INSERT INTO `sys_cn_area` VALUES ('350526', '德化县', '德化', '350500', null, '中国,福建省,泉州市,德化县', '3', '362500', '0595', 'Dehua', '118.2417600', '25.4922400');
INSERT INTO `sys_cn_area` VALUES ('350527', '金门县', '金门', '350500', null, '中国,福建省,泉州市,金门县', '3', null, '', 'Jinmen', '118.3226300', '24.4292200');
INSERT INTO `sys_cn_area` VALUES ('350581', '石狮市', '石狮', '350500', null, '中国,福建省,泉州市,石狮市', '3', '362700', '0595', 'Shishi', '118.6477900', '24.7324200');
INSERT INTO `sys_cn_area` VALUES ('350582', '晋江市', '晋江', '350500', null, '中国,福建省,泉州市,晋江市', '3', '362200', '0595', 'Jinjiang', '118.5519400', '24.7814100');
INSERT INTO `sys_cn_area` VALUES ('350583', '南安市', '南安', '350500', null, '中国,福建省,泉州市,南安市', '3', '362300', '0595', 'Nan\'an', '118.3858900', '24.9605500');
INSERT INTO `sys_cn_area` VALUES ('350600', '漳州市', '漳州', '350000', null, '中国,福建省,漳州市', '2', '363005', '0596', 'Zhangzhou', '117.6618010', '24.5108970');
INSERT INTO `sys_cn_area` VALUES ('350602', '芗城区', '芗城', '350600', null, '中国,福建省,漳州市,芗城区', '3', '363000', '0596', 'Xiangcheng', '117.6540200', '24.5108100');
INSERT INTO `sys_cn_area` VALUES ('350603', '龙文区', '龙文', '350600', null, '中国,福建省,漳州市,龙文区', '3', '363005', '0596', 'Longwen', '117.7097100', '24.5032300');
INSERT INTO `sys_cn_area` VALUES ('350622', '云霄县', '云霄', '350600', null, '中国,福建省,漳州市,云霄县', '3', '363300', '0596', 'Yunxiao', '117.3405100', '23.9553400');
INSERT INTO `sys_cn_area` VALUES ('350623', '漳浦县', '漳浦', '350600', null, '中国,福建省,漳州市,漳浦县', '3', '363200', '0596', 'Zhangpu', '117.6136700', '24.1170600');
INSERT INTO `sys_cn_area` VALUES ('350624', '诏安县', '诏安', '350600', null, '中国,福建省,漳州市,诏安县', '3', '363500', '0596', 'Zhao\'an', '117.1750100', '23.7114800');
INSERT INTO `sys_cn_area` VALUES ('350625', '长泰县', '长泰', '350600', null, '中国,福建省,漳州市,长泰县', '3', '363900', '0596', 'Changtai', '117.7592400', '24.6252600');
INSERT INTO `sys_cn_area` VALUES ('350626', '东山县', '东山', '350600', null, '中国,福建省,漳州市,东山县', '3', '363400', '0596', 'Dongshan', '117.4282200', '23.7010900');
INSERT INTO `sys_cn_area` VALUES ('350627', '南靖县', '南靖', '350600', null, '中国,福建省,漳州市,南靖县', '3', '363600', '0596', 'Nanjing', '117.3573600', '24.5144800');
INSERT INTO `sys_cn_area` VALUES ('350628', '平和县', '平和', '350600', null, '中国,福建省,漳州市,平和县', '3', '363700', '0596', 'Pinghe', '117.3124000', '24.3639500');
INSERT INTO `sys_cn_area` VALUES ('350629', '华安县', '华安', '350600', null, '中国,福建省,漳州市,华安县', '3', '363800', '0596', 'Hua\'an', '117.5407700', '25.0056300');
INSERT INTO `sys_cn_area` VALUES ('350681', '龙海市', '龙海', '350600', null, '中国,福建省,漳州市,龙海市', '3', '363100', '0596', 'Longhai', '117.8180200', '24.4465500');
INSERT INTO `sys_cn_area` VALUES ('350700', '南平市', '南平', '350000', null, '中国,福建省,南平市', '2', '353000', '0599', 'Nanping', '118.1784590', '26.6356270');
INSERT INTO `sys_cn_area` VALUES ('350702', '延平区', '延平', '350700', null, '中国,福建省,南平市,延平区', '3', '353000', '0600', 'Yanping', '118.1818900', '26.6374500');
INSERT INTO `sys_cn_area` VALUES ('350703', '建阳区', '建阳', '350700', null, '中国,福建省,南平市,建阳区', '3', '354200', '0599', 'Jianyang', '118.1226700', '27.3320670');
INSERT INTO `sys_cn_area` VALUES ('350721', '顺昌县', '顺昌', '350700', null, '中国,福建省,南平市,顺昌县', '3', '353200', '0605', 'Shunchang', '117.8103000', '26.7929800');
INSERT INTO `sys_cn_area` VALUES ('350722', '浦城县', '浦城', '350700', null, '中国,福建省,南平市,浦城县', '3', '353400', '0606', 'Pucheng', '118.5400700', '27.9188800');
INSERT INTO `sys_cn_area` VALUES ('350723', '光泽县', '光泽', '350700', null, '中国,福建省,南平市,光泽县', '3', '354100', '0607', 'Guangze', '117.3334600', '27.5423100');
INSERT INTO `sys_cn_area` VALUES ('350724', '松溪县', '松溪', '350700', null, '中国,福建省,南平市,松溪县', '3', '353500', '0608', 'Songxi', '118.7853300', '27.5262400');
INSERT INTO `sys_cn_area` VALUES ('350725', '政和县', '政和', '350700', null, '中国,福建省,南平市,政和县', '3', '353600', '0609', 'Zhenghe', '118.8557100', '27.3676900');
INSERT INTO `sys_cn_area` VALUES ('350781', '邵武市', '邵武', '350700', null, '中国,福建省,南平市,邵武市', '3', '354000', '0601', 'Shaowu', '117.4924000', '27.3403300');
INSERT INTO `sys_cn_area` VALUES ('350782', '武夷山市', '武夷山', '350700', null, '中国,福建省,南平市,武夷山市', '3', '354300', '0602', 'Wuyishan', '118.0366500', '27.7554300');
INSERT INTO `sys_cn_area` VALUES ('350783', '建瓯市', '建瓯', '350700', null, '中国,福建省,南平市,建瓯市', '3', '353100', '0603', 'Jianou', '118.2976600', '27.0230100');
INSERT INTO `sys_cn_area` VALUES ('350800', '龙岩市', '龙岩', '350000', null, '中国,福建省,龙岩市', '2', '364000', '0597', 'Longyan', '117.0297800', '25.0916030');
INSERT INTO `sys_cn_area` VALUES ('350802', '新罗区', '新罗', '350800', null, '中国,福建省,龙岩市,新罗区', '3', '364000', '0597', 'Xinluo', '117.0369300', '25.0983400');
INSERT INTO `sys_cn_area` VALUES ('350821', '长汀县', '长汀', '350800', null, '中国,福建省,龙岩市,长汀县', '3', '366300', '0597', 'Changting', '116.3588800', '25.8277300');
INSERT INTO `sys_cn_area` VALUES ('350822', '永定区', '永定', '350800', null, '中国,福建省,龙岩市,永定区', '3', '364100', '0597', 'Yongding', '116.7319900', '24.7230200');
INSERT INTO `sys_cn_area` VALUES ('350823', '上杭县', '上杭', '350800', null, '中国,福建省,龙岩市,上杭县', '3', '364200', '0597', 'Shanghang', '116.4202200', '25.0494300');
INSERT INTO `sys_cn_area` VALUES ('350824', '武平县', '武平', '350800', null, '中国,福建省,龙岩市,武平县', '3', '364300', '0597', 'Wuping', '116.1022900', '25.0924400');
INSERT INTO `sys_cn_area` VALUES ('350825', '连城县', '连城', '350800', null, '中国,福建省,龙岩市,连城县', '3', '366200', '0597', 'Liancheng', '116.7545400', '25.7103000');
INSERT INTO `sys_cn_area` VALUES ('350881', '漳平市', '漳平', '350800', null, '中国,福建省,龙岩市,漳平市', '3', '364400', '0597', 'Zhangping', '117.4199200', '25.2910900');
INSERT INTO `sys_cn_area` VALUES ('350900', '宁德市', '宁德', '350000', null, '中国,福建省,宁德市', '2', '352100', '0593', 'Ningde', '119.5270820', '26.6592400');
INSERT INTO `sys_cn_area` VALUES ('350902', '蕉城区', '蕉城', '350900', null, '中国,福建省,宁德市,蕉城区', '3', '352100', '0593', 'Jiaocheng', '119.5264300', '26.6604800');
INSERT INTO `sys_cn_area` VALUES ('350921', '霞浦县', '霞浦', '350900', null, '中国,福建省,宁德市,霞浦县', '3', '355100', '0593', 'Xiapu', '119.9989300', '26.8857800');
INSERT INTO `sys_cn_area` VALUES ('350922', '古田县', '古田', '350900', null, '中国,福建省,宁德市,古田县', '3', '352200', '0593', 'Gutian', '118.7468800', '26.5768200');
INSERT INTO `sys_cn_area` VALUES ('350923', '屏南县', '屏南', '350900', null, '中国,福建省,宁德市,屏南县', '3', '352300', '0593', 'Pingnan', '118.9886100', '26.9109900');
INSERT INTO `sys_cn_area` VALUES ('350924', '寿宁县', '寿宁', '350900', null, '中国,福建省,宁德市,寿宁县', '3', '355500', '0593', 'Shouning', '119.5039000', '27.4599600');
INSERT INTO `sys_cn_area` VALUES ('350925', '周宁县', '周宁', '350900', null, '中国,福建省,宁德市,周宁县', '3', '355400', '0593', 'Zhouning', '119.3383700', '27.1066400');
INSERT INTO `sys_cn_area` VALUES ('350926', '柘荣县', '柘荣', '350900', null, '中国,福建省,宁德市,柘荣县', '3', '355300', '0593', 'Zherong', '119.8997100', '27.2354300');
INSERT INTO `sys_cn_area` VALUES ('350981', '福安市', '福安', '350900', null, '中国,福建省,宁德市,福安市', '3', '355000', '0593', 'Fu\'an', '119.6495000', '27.0867300');
INSERT INTO `sys_cn_area` VALUES ('350982', '福鼎市', '福鼎', '350900', null, '中国,福建省,宁德市,福鼎市', '3', '355200', '0593', 'Fuding', '120.2166400', '27.3243000');
INSERT INTO `sys_cn_area` VALUES ('360000', '江西省', '江西', '100000', null, '中国,江西省', '1', null, '', 'Jiangxi', '115.8921510', '28.6764930');
INSERT INTO `sys_cn_area` VALUES ('360100', '南昌市', '南昌', '360000', null, '中国,江西省,南昌市', '2', '330008', '0791', 'Nanchang', '115.8921510', '28.6764930');
INSERT INTO `sys_cn_area` VALUES ('360102', '东湖区', '东湖', '360100', null, '中国,江西省,南昌市,东湖区', '3', '330006', '0791', 'Donghu', '115.8988000', '28.6850500');
INSERT INTO `sys_cn_area` VALUES ('360103', '西湖区', '西湖', '360100', null, '中国,江西省,南昌市,西湖区', '3', '330009', '0791', 'Xihu', '115.8772800', '28.6568800');
INSERT INTO `sys_cn_area` VALUES ('360104', '青云谱区', '青云谱', '360100', null, '中国,江西省,南昌市,青云谱区', '3', '330001', '0791', 'Qingyunpu', '115.9150000', '28.6319900');
INSERT INTO `sys_cn_area` VALUES ('360105', '湾里区', '湾里', '360100', null, '中国,江西省,南昌市,湾里区', '3', '330004', '0791', 'Wanli', '115.7310400', '28.7152900');
INSERT INTO `sys_cn_area` VALUES ('360111', '青山湖区', '青山湖', '360100', null, '中国,江西省,南昌市,青山湖区', '3', '330029', '0791', 'Qingshanhu', '115.9617000', '28.6820600');
INSERT INTO `sys_cn_area` VALUES ('360121', '南昌县', '南昌', '360100', null, '中国,江西省,南昌市,南昌县', '3', '330200', '0791', 'Nanchang', '115.9439300', '28.5455900');
INSERT INTO `sys_cn_area` VALUES ('360122', '新建县', '新建', '360100', null, '中国,江西省,南昌市,新建县', '3', '330100', '0791', 'Xinjian', '115.8154600', '28.6924800');
INSERT INTO `sys_cn_area` VALUES ('360123', '安义县', '安义', '360100', null, '中国,江西省,南昌市,安义县', '3', '330500', '0791', 'Anyi', '115.5487900', '28.8460200');
INSERT INTO `sys_cn_area` VALUES ('360124', '进贤县', '进贤', '360100', null, '中国,江西省,南昌市,进贤县', '3', '331700', '0791', 'Jinxian', '116.2408700', '28.3767900');
INSERT INTO `sys_cn_area` VALUES ('360200', '景德镇市', '景德镇', '360000', null, '中国,江西省,景德镇市', '2', '333000', '0798', 'Jingdezhen', '117.2146640', '29.2925600');
INSERT INTO `sys_cn_area` VALUES ('360202', '昌江区', '昌江', '360200', null, '中国,江西省,景德镇市,昌江区', '3', '333000', '0799', 'Changjiang', '117.1835900', '29.2732100');
INSERT INTO `sys_cn_area` VALUES ('360203', '珠山区', '珠山', '360200', null, '中国,江西省,景德镇市,珠山区', '3', '333000', '0800', 'Zhushan', '117.2023300', '29.3012700');
INSERT INTO `sys_cn_area` VALUES ('360222', '浮梁县', '浮梁', '360200', null, '中国,江西省,景德镇市,浮梁县', '3', '333400', '0802', 'Fuliang', '117.2151700', '29.3515600');
INSERT INTO `sys_cn_area` VALUES ('360281', '乐平市', '乐平', '360200', null, '中国,江西省,景德镇市,乐平市', '3', '333300', '0801', 'Leping', '117.1288700', '28.9629500');
INSERT INTO `sys_cn_area` VALUES ('360300', '萍乡市', '萍乡', '360000', null, '中国,江西省,萍乡市', '2', '337000', '0799', 'Pingxiang', '113.8521860', '27.6229460');
INSERT INTO `sys_cn_area` VALUES ('360302', '安源区', '安源', '360300', null, '中国,江西省,萍乡市,安源区', '3', '337000', '0800', 'Anyuan', '113.8913500', '27.6165300');
INSERT INTO `sys_cn_area` VALUES ('360313', '湘东区', '湘东', '360300', null, '中国,江西省,萍乡市,湘东区', '3', '337016', '0801', 'Xiangdong', '113.7329400', '27.6400700');
INSERT INTO `sys_cn_area` VALUES ('360321', '莲花县', '莲花', '360300', null, '中国,江西省,萍乡市,莲花县', '3', '337100', '0802', 'Lianhua', '113.9614200', '27.1286600');
INSERT INTO `sys_cn_area` VALUES ('360322', '上栗县', '上栗', '360300', null, '中国,江西省,萍乡市,上栗县', '3', '337009', '0803', 'Shangli', '113.7940300', '27.8746700');
INSERT INTO `sys_cn_area` VALUES ('360323', '芦溪县', '芦溪', '360300', null, '中国,江西省,萍乡市,芦溪县', '3', '337053', '0804', 'Luxi', '114.0295100', '27.6306300');
INSERT INTO `sys_cn_area` VALUES ('360400', '九江市', '九江', '360000', null, '中国,江西省,九江市', '2', '332000', '0792', 'Jiujiang', '115.9928110', '29.7120340');
INSERT INTO `sys_cn_area` VALUES ('360402', '庐山区', '庐山', '360400', null, '中国,江西省,九江市,庐山区', '3', '332005', '0792', 'Lushan', '115.9890400', '29.6717700');
INSERT INTO `sys_cn_area` VALUES ('360403', '浔阳区', '浔阳', '360400', null, '中国,江西省,九江市,浔阳区', '3', '332000', '0792', 'Xunyang', '115.9898600', '29.7278600');
INSERT INTO `sys_cn_area` VALUES ('360421', '九江县', '九江', '360400', null, '中国,江西省,九江市,九江县', '3', '332100', '0792', 'Jiujiang', '115.9112800', '29.6085200');
INSERT INTO `sys_cn_area` VALUES ('360423', '武宁县', '武宁', '360400', null, '中国,江西省,九江市,武宁县', '3', '332300', '0792', 'Wuning', '115.1006100', '29.2584000');
INSERT INTO `sys_cn_area` VALUES ('360424', '修水县', '修水', '360400', null, '中国,江西省,九江市,修水县', '3', '332400', '0792', 'Xiushui', '114.5468400', '29.0253900');
INSERT INTO `sys_cn_area` VALUES ('360425', '永修县', '永修', '360400', null, '中国,江西省,九江市,永修县', '3', '330300', '0792', 'Yongxiu', '115.8091100', '29.0209300');
INSERT INTO `sys_cn_area` VALUES ('360426', '德安县', '德安', '360400', null, '中国,江西省,九江市,德安县', '3', '330400', '0792', 'De\'an', '115.7560100', '29.3134100');
INSERT INTO `sys_cn_area` VALUES ('360427', '星子县', '星子', '360400', null, '中国,江西省,九江市,星子县', '3', '332800', '0792', 'Xingzi', '116.0449200', '29.4460800');
INSERT INTO `sys_cn_area` VALUES ('360428', '都昌县', '都昌', '360400', null, '中国,江西省,九江市,都昌县', '3', '332600', '0792', 'Duchang', '116.2040100', '29.2732700');
INSERT INTO `sys_cn_area` VALUES ('360429', '湖口县', '湖口', '360400', null, '中国,江西省,九江市,湖口县', '3', '332500', '0792', 'Hukou', '116.2185300', '29.7381800');
INSERT INTO `sys_cn_area` VALUES ('360430', '彭泽县', '彭泽', '360400', null, '中国,江西省,九江市,彭泽县', '3', '332700', '0792', 'Pengze', '116.5501100', '29.8958900');
INSERT INTO `sys_cn_area` VALUES ('360481', '瑞昌市', '瑞昌', '360400', null, '中国,江西省,九江市,瑞昌市', '3', '332200', '0792', 'Ruichang', '115.6670500', '29.6718300');
INSERT INTO `sys_cn_area` VALUES ('360482', '共青城市', '共青城', '360400', null, '中国,江西省,九江市,共青城市', '3', '332020', '0792', 'Gongqingcheng', '115.8019390', '29.2387850');
INSERT INTO `sys_cn_area` VALUES ('360500', '新余市', '新余', '360000', null, '中国,江西省,新余市', '2', '338025', '0790', 'Xinyu', '114.9308350', '27.8108340');
INSERT INTO `sys_cn_area` VALUES ('360502', '渝水区', '渝水', '360500', null, '中国,江西省,新余市,渝水区', '3', '338025', '0790', 'Yushui', '114.9440000', '27.8009800');
INSERT INTO `sys_cn_area` VALUES ('360521', '分宜县', '分宜', '360500', null, '中国,江西省,新余市,分宜县', '3', '336600', '0790', 'Fenyi', '114.6918900', '27.8147500');
INSERT INTO `sys_cn_area` VALUES ('360600', '鹰潭市', '鹰潭', '360000', null, '中国,江西省,鹰潭市', '2', '335000', '0701', 'Yingtan', '117.0338380', '28.2386380');
INSERT INTO `sys_cn_area` VALUES ('360602', '月湖区', '月湖', '360600', null, '中国,江西省,鹰潭市,月湖区', '3', '335000', '0701', 'Yuehu', '117.0373200', '28.2391300');
INSERT INTO `sys_cn_area` VALUES ('360622', '余江县', '余江', '360600', null, '中国,江西省,鹰潭市,余江县', '3', '335200', '0701', 'Yujiang', '116.8185100', '28.2103400');
INSERT INTO `sys_cn_area` VALUES ('360681', '贵溪市', '贵溪', '360600', null, '中国,江西省,鹰潭市,贵溪市', '3', '335400', '0701', 'Guixi', '117.2424600', '28.2926000');
INSERT INTO `sys_cn_area` VALUES ('360700', '赣州市', '赣州', '360000', null, '中国,江西省,赣州市', '2', '341000', '0797', 'Ganzhou', '114.9402780', '25.8509700');
INSERT INTO `sys_cn_area` VALUES ('360702', '章贡区', '章贡', '360700', null, '中国,江西省,赣州市,章贡区', '3', '341000', '0797', 'Zhanggong', '114.9428400', '25.8624000');
INSERT INTO `sys_cn_area` VALUES ('360703', '南康区', '南康', '360700', null, '中国,江西省,赣州市,南康区', '3', '341400', '0797', 'Nankang', '114.7569330', '25.6617210');
INSERT INTO `sys_cn_area` VALUES ('360721', '赣县', '赣县', '360700', null, '中国,江西省,赣州市,赣县', '3', '341100', '0797', 'Ganxian', '115.0117100', '25.8614900');
INSERT INTO `sys_cn_area` VALUES ('360722', '信丰县', '信丰', '360700', null, '中国,江西省,赣州市,信丰县', '3', '341600', '0797', 'Xinfeng', '114.9227900', '25.3861200');
INSERT INTO `sys_cn_area` VALUES ('360723', '大余县', '大余', '360700', null, '中国,江西省,赣州市,大余县', '3', '341500', '0797', 'Dayu', '114.3575700', '25.3956100');
INSERT INTO `sys_cn_area` VALUES ('360724', '上犹县', '上犹', '360700', null, '中国,江西省,赣州市,上犹县', '3', '341200', '0797', 'Shangyou', '114.5413800', '25.7956700');
INSERT INTO `sys_cn_area` VALUES ('360725', '崇义县', '崇义', '360700', null, '中国,江西省,赣州市,崇义县', '3', '341300', '0797', 'Chongyi', '114.3083500', '25.6818600');
INSERT INTO `sys_cn_area` VALUES ('360726', '安远县', '安远', '360700', null, '中国,江西省,赣州市,安远县', '3', '342100', '0797', 'Anyuan', '115.3948300', '25.1371000');
INSERT INTO `sys_cn_area` VALUES ('360727', '龙南县', '龙南', '360700', null, '中国,江西省,赣州市,龙南县', '3', '341700', '0797', 'Longnan', '114.7899400', '24.9108600');
INSERT INTO `sys_cn_area` VALUES ('360728', '定南县', '定南', '360700', null, '中国,江西省,赣州市,定南县', '3', '341900', '0797', 'Dingnan', '115.0271300', '24.7839500');
INSERT INTO `sys_cn_area` VALUES ('360729', '全南县', '全南', '360700', null, '中国,江西省,赣州市,全南县', '3', '341800', '0797', 'Quannan', '114.5292000', '24.7432400');
INSERT INTO `sys_cn_area` VALUES ('360730', '宁都县', '宁都', '360700', null, '中国,江西省,赣州市,宁都县', '3', '342800', '0797', 'Ningdu', '116.0156500', '26.4722700');
INSERT INTO `sys_cn_area` VALUES ('360731', '于都县', '于都', '360700', null, '中国,江西省,赣州市,于都县', '3', '342300', '0797', 'Yudu', '115.4141500', '25.9525700');
INSERT INTO `sys_cn_area` VALUES ('360732', '兴国县', '兴国', '360700', null, '中国,江西省,赣州市,兴国县', '3', '342400', '0797', 'Xingguo', '115.3630900', '26.3377600');
INSERT INTO `sys_cn_area` VALUES ('360733', '会昌县', '会昌', '360700', null, '中国,江西省,赣州市,会昌县', '3', '342600', '0797', 'Huichang', '115.7855500', '25.6006800');
INSERT INTO `sys_cn_area` VALUES ('360734', '寻乌县', '寻乌', '360700', null, '中国,江西省,赣州市,寻乌县', '3', '342200', '0797', 'Xunwu', '115.6485200', '24.9551300');
INSERT INTO `sys_cn_area` VALUES ('360735', '石城县', '石城', '360700', null, '中国,江西省,赣州市,石城县', '3', '342700', '0797', 'Shicheng', '116.3442000', '26.3261700');
INSERT INTO `sys_cn_area` VALUES ('360781', '瑞金市', '瑞金', '360700', null, '中国,江西省,赣州市,瑞金市', '3', '342500', '0797', 'Ruijin', '116.0270300', '25.8855700');
INSERT INTO `sys_cn_area` VALUES ('360800', '吉安市', '吉安', '360000', null, '中国,江西省,吉安市', '2', '343000', '0796', 'Ji\'an', '114.9863730', '27.1116990');
INSERT INTO `sys_cn_area` VALUES ('360802', '吉州区', '吉州', '360800', null, '中国,江西省,吉安市,吉州区', '3', '343000', '0796', 'Jizhou', '114.9759800', '27.1066900');
INSERT INTO `sys_cn_area` VALUES ('360803', '青原区', '青原', '360800', null, '中国,江西省,吉安市,青原区', '3', '343009', '0796', 'Qingyuan', '115.0174700', '27.1057700');
INSERT INTO `sys_cn_area` VALUES ('360821', '吉安县', '吉安', '360800', null, '中国,江西省,吉安市,吉安县', '3', '343100', '0796', 'Ji\'an', '114.9069500', '27.0404800');
INSERT INTO `sys_cn_area` VALUES ('360822', '吉水县', '吉水', '360800', null, '中国,江西省,吉安市,吉水县', '3', '331600', '0796', 'Jishui', '115.1343000', '27.2107100');
INSERT INTO `sys_cn_area` VALUES ('360823', '峡江县', '峡江', '360800', null, '中国,江西省,吉安市,峡江县', '3', '331409', '0796', 'Xiajiang', '115.3172300', '27.5760000');
INSERT INTO `sys_cn_area` VALUES ('360824', '新干县', '新干', '360800', null, '中国,江西省,吉安市,新干县', '3', '331300', '0796', 'Xingan', '115.3930600', '27.7409200');
INSERT INTO `sys_cn_area` VALUES ('360825', '永丰县', '永丰', '360800', null, '中国,江西省,吉安市,永丰县', '3', '331500', '0796', 'Yongfeng', '115.4423800', '27.3178500');
INSERT INTO `sys_cn_area` VALUES ('360826', '泰和县', '泰和', '360800', null, '中国,江西省,吉安市,泰和县', '3', '343700', '0796', 'Taihe', '114.9078900', '26.7911300');
INSERT INTO `sys_cn_area` VALUES ('360827', '遂川县', '遂川', '360800', null, '中国,江西省,吉安市,遂川县', '3', '343900', '0796', 'Suichuan', '114.5162900', '26.3259800');
INSERT INTO `sys_cn_area` VALUES ('360828', '万安县', '万安', '360800', null, '中国,江西省,吉安市,万安县', '3', '343800', '0796', 'Wan\'an', '114.7865900', '26.4593100');
INSERT INTO `sys_cn_area` VALUES ('360829', '安福县', '安福', '360800', null, '中国,江西省,吉安市,安福县', '3', '343200', '0796', 'Anfu', '114.6195600', '27.3927600');
INSERT INTO `sys_cn_area` VALUES ('360830', '永新县', '永新', '360800', null, '中国,江西省,吉安市,永新县', '3', '343400', '0796', 'Yongxin', '114.2424600', '26.9448800');
INSERT INTO `sys_cn_area` VALUES ('360881', '井冈山市', '井冈山', '360800', null, '中国,江西省,吉安市,井冈山市', '3', '343600', '0796', 'Jinggangshan', '114.2894900', '26.7480400');
INSERT INTO `sys_cn_area` VALUES ('360900', '宜春市', '宜春', '360000', null, '中国,江西省,宜春市', '2', '336000', '0795', 'Yichun', '114.3911360', '27.8043000');
INSERT INTO `sys_cn_area` VALUES ('360902', '袁州区', '袁州', '360900', null, '中国,江西省,宜春市,袁州区', '3', '336000', '0795', 'Yuanzhou', '114.3824600', '27.7964900');
INSERT INTO `sys_cn_area` VALUES ('360921', '奉新县', '奉新', '360900', null, '中国,江西省,宜春市,奉新县', '3', '330700', '0795', 'Fengxin', '115.4003600', '28.6879000');
INSERT INTO `sys_cn_area` VALUES ('360922', '万载县', '万载', '360900', null, '中国,江西省,宜春市,万载县', '3', '336100', '0795', 'Wanzai', '114.4458000', '28.1065600');
INSERT INTO `sys_cn_area` VALUES ('360923', '上高县', '上高', '360900', null, '中国,江西省,宜春市,上高县', '3', '336400', '0795', 'Shanggao', '114.9245900', '28.2342300');
INSERT INTO `sys_cn_area` VALUES ('360924', '宜丰县', '宜丰', '360900', null, '中国,江西省,宜春市,宜丰县', '3', '336300', '0795', 'Yifeng', '114.7803000', '28.3855500');
INSERT INTO `sys_cn_area` VALUES ('360925', '靖安县', '靖安', '360900', null, '中国,江西省,宜春市,靖安县', '3', '330600', '0795', 'Jing\'an', '115.3627900', '28.8616700');
INSERT INTO `sys_cn_area` VALUES ('360926', '铜鼓县', '铜鼓', '360900', null, '中国,江西省,宜春市,铜鼓县', '3', '336200', '0795', 'Tonggu', '114.3703600', '28.5231100');
INSERT INTO `sys_cn_area` VALUES ('360981', '丰城市', '丰城', '360900', null, '中国,江西省,宜春市,丰城市', '3', '331100', '0795', 'Fengcheng', '115.7711400', '28.1591800');
INSERT INTO `sys_cn_area` VALUES ('360982', '樟树市', '樟树', '360900', null, '中国,江西省,宜春市,樟树市', '3', '331200', '0795', 'Zhangshu', '115.5465000', '28.0533200');
INSERT INTO `sys_cn_area` VALUES ('360983', '高安市', '高安', '360900', null, '中国,江西省,宜春市,高安市', '3', '330800', '0795', 'Gao\'an', '115.3753000', '28.4178000');
INSERT INTO `sys_cn_area` VALUES ('361000', '抚州市', '抚州', '360000', null, '中国,江西省,抚州市', '2', '344000', '0794', 'Fuzhou', '116.3583510', '27.9838500');
INSERT INTO `sys_cn_area` VALUES ('361002', '临川区', '临川', '361000', null, '中国,江西省,抚州市,临川区', '3', '344000', '0794', 'Linchuan', '116.3591900', '27.9772100');
INSERT INTO `sys_cn_area` VALUES ('361021', '南城县', '南城', '361000', null, '中国,江西省,抚州市,南城县', '3', '344700', '0794', 'Nancheng', '116.6441900', '27.5538100');
INSERT INTO `sys_cn_area` VALUES ('361022', '黎川县', '黎川', '361000', null, '中国,江西省,抚州市,黎川县', '3', '344600', '0794', 'Lichuan', '116.9077100', '27.2823200');
INSERT INTO `sys_cn_area` VALUES ('361023', '南丰县', '南丰', '361000', null, '中国,江西省,抚州市,南丰县', '3', '344500', '0794', 'Nanfeng', '116.5256000', '27.2184200');
INSERT INTO `sys_cn_area` VALUES ('361024', '崇仁县', '崇仁', '361000', null, '中国,江西省,抚州市,崇仁县', '3', '344200', '0794', 'Chongren', '116.0602100', '27.7596200');
INSERT INTO `sys_cn_area` VALUES ('361025', '乐安县', '乐安', '361000', null, '中国,江西省,抚州市,乐安县', '3', '344300', '0794', 'Le\'an', '115.8310800', '27.4281200');
INSERT INTO `sys_cn_area` VALUES ('361026', '宜黄县', '宜黄', '361000', null, '中国,江西省,抚州市,宜黄县', '3', '344400', '0794', 'Yihuang', '116.2362600', '27.5548700');
INSERT INTO `sys_cn_area` VALUES ('361027', '金溪县', '金溪', '361000', null, '中国,江西省,抚州市,金溪县', '3', '344800', '0794', 'Jinxi', '116.7739200', '27.9075300');
INSERT INTO `sys_cn_area` VALUES ('361028', '资溪县', '资溪', '361000', null, '中国,江西省,抚州市,资溪县', '3', '335300', '0794', 'Zixi', '117.0693900', '27.7049300');
INSERT INTO `sys_cn_area` VALUES ('361029', '东乡县', '东乡', '361000', null, '中国,江西省,抚州市,东乡县', '3', '331800', '0794', 'Dongxiang', '116.5903900', '28.2361400');
INSERT INTO `sys_cn_area` VALUES ('361030', '广昌县', '广昌', '361000', null, '中国,江西省,抚州市,广昌县', '3', '344900', '0794', 'Guangchang', '116.3254700', '26.8341000');
INSERT INTO `sys_cn_area` VALUES ('361100', '上饶市', '上饶', '360000', null, '中国,江西省,上饶市', '2', '334000', '0793', 'Shangrao', '117.9711850', '28.4444200');
INSERT INTO `sys_cn_area` VALUES ('361102', '信州区', '信州', '361100', null, '中国,江西省,上饶市,信州区', '3', '334000', '0793', 'Xinzhou', '117.9668200', '28.4312100');
INSERT INTO `sys_cn_area` VALUES ('361121', '上饶县', '上饶', '361100', null, '中国,江西省,上饶市,上饶县', '3', '334100', '0793', 'Shangrao', '117.9088400', '28.4485600');
INSERT INTO `sys_cn_area` VALUES ('361122', '广丰县', '广丰', '361100', null, '中国,江西省,上饶市,广丰县', '3', '334600', '0793', 'Guangfeng', '118.1915800', '28.4376600');
INSERT INTO `sys_cn_area` VALUES ('361123', '玉山县', '玉山', '361100', null, '中国,江西省,上饶市,玉山县', '3', '334700', '0793', 'Yushan', '118.2446200', '28.6818000');
INSERT INTO `sys_cn_area` VALUES ('361124', '铅山县', '铅山', '361100', null, '中国,江西省,上饶市,铅山县', '3', '334500', '0793', 'Yanshan', '117.7099600', '28.3154900');
INSERT INTO `sys_cn_area` VALUES ('361125', '横峰县', '横峰', '361100', null, '中国,江西省,上饶市,横峰县', '3', '334300', '0793', 'Hengfeng', '117.5964000', '28.4071600');
INSERT INTO `sys_cn_area` VALUES ('361126', '弋阳县', '弋阳', '361100', null, '中国,江西省,上饶市,弋阳县', '3', '334400', '0793', 'Yiyang', '117.4592900', '28.3745100');
INSERT INTO `sys_cn_area` VALUES ('361127', '余干县', '余干', '361100', null, '中国,江西省,上饶市,余干县', '3', '335100', '0793', 'Yugan', '116.6955500', '28.7020600');
INSERT INTO `sys_cn_area` VALUES ('361128', '鄱阳县', '鄱阳', '361100', null, '中国,江西省,上饶市,鄱阳县', '3', '333100', '0793', 'Poyang', '116.6996700', '29.0118000');
INSERT INTO `sys_cn_area` VALUES ('361129', '万年县', '万年', '361100', null, '中国,江西省,上饶市,万年县', '3', '335500', '0793', 'Wannian', '117.0688400', '28.6953700');
INSERT INTO `sys_cn_area` VALUES ('361130', '婺源县', '婺源', '361100', null, '中国,江西省,上饶市,婺源县', '3', '333200', '0793', 'Wuyuan', '117.8610500', '29.2484100');
INSERT INTO `sys_cn_area` VALUES ('361181', '德兴市', '德兴', '361100', null, '中国,江西省,上饶市,德兴市', '3', '334200', '0793', 'Dexing', '117.5791900', '28.9473600');
INSERT INTO `sys_cn_area` VALUES ('370000', '山东省', '山东', '100000', null, '中国,山东省', '1', null, '', 'Shandong', '117.0009230', '36.6758070');
INSERT INTO `sys_cn_area` VALUES ('370100', '济南市', '济南', '370000', null, '中国,山东省,济南市', '2', '250001', '0531', 'Jinan', '117.0009230', '36.6758070');
INSERT INTO `sys_cn_area` VALUES ('370102', '历下区', '历下', '370100', null, '中国,山东省,济南市,历下区', '3', '250014', '0531', 'Lixia', '117.0768000', '36.6666100');
INSERT INTO `sys_cn_area` VALUES ('370103', '市中区', '市中区', '370100', null, '中国,山东省,济南市,市中区', '3', '250001', '0531', 'Shizhongqu', '116.9974100', '36.6510100');
INSERT INTO `sys_cn_area` VALUES ('370104', '槐荫区', '槐荫', '370100', null, '中国,山东省,济南市,槐荫区', '3', '250117', '0531', 'Huaiyin', '116.9007500', '36.6513600');
INSERT INTO `sys_cn_area` VALUES ('370105', '天桥区', '天桥', '370100', null, '中国,山东省,济南市,天桥区', '3', '250031', '0531', 'Tianqiao', '116.9874900', '36.6780100');
INSERT INTO `sys_cn_area` VALUES ('370112', '历城区', '历城', '370100', null, '中国,山东省,济南市,历城区', '3', '250100', '0531', 'Licheng', '117.0650900', '36.6799500');
INSERT INTO `sys_cn_area` VALUES ('370113', '长清区', '长清', '370100', null, '中国,山东省,济南市,长清区', '3', '250300', '0531', 'Changqing', '116.7519200', '36.5535200');
INSERT INTO `sys_cn_area` VALUES ('370124', '平阴县', '平阴', '370100', null, '中国,山东省,济南市,平阴县', '3', '250400', '0531', 'Pingyin', '116.4558700', '36.2895500');
INSERT INTO `sys_cn_area` VALUES ('370125', '济阳县', '济阳', '370100', null, '中国,山东省,济南市,济阳县', '3', '251400', '0531', 'Jiyang', '117.1732700', '36.9784500');
INSERT INTO `sys_cn_area` VALUES ('370126', '商河县', '商河', '370100', null, '中国,山东省,济南市,商河县', '3', '251600', '0531', 'Shanghe', '117.1572200', '37.3111900');
INSERT INTO `sys_cn_area` VALUES ('370181', '章丘市', '章丘', '370100', null, '中国,山东省,济南市,章丘市', '3', '250200', '0531', 'Zhangqiu', '117.5367700', '36.7139200');
INSERT INTO `sys_cn_area` VALUES ('370200', '青岛市', '青岛', '370000', null, '中国,山东省,青岛市', '2', '266001', '0532', 'Qingdao', '120.3695570', '36.0944060');
INSERT INTO `sys_cn_area` VALUES ('370202', '市南区', '市南', '370200', null, '中国,山东省,青岛市,市南区', '3', '266001', '0532', 'Shinan', '120.3877300', '36.0667100');
INSERT INTO `sys_cn_area` VALUES ('370203', '市北区', '市北', '370200', null, '中国,山东省,青岛市,市北区', '3', '266011', '0532', 'Shibei', '120.3746900', '36.0873400');
INSERT INTO `sys_cn_area` VALUES ('370211', '黄岛区', '黄岛', '370200', null, '中国,山东省,青岛市,黄岛区', '3', '266500', '0532', 'Huangdao', '120.1977500', '35.9606500');
INSERT INTO `sys_cn_area` VALUES ('370212', '崂山区', '崂山', '370200', null, '中国,山东省,青岛市,崂山区', '3', '266100', '0532', 'Laoshan', '120.4692300', '36.1071700');
INSERT INTO `sys_cn_area` VALUES ('370213', '李沧区', '李沧', '370200', null, '中国,山东省,青岛市,李沧区', '3', '266021', '0532', 'Licang', '120.4328600', '36.1450200');
INSERT INTO `sys_cn_area` VALUES ('370214', '城阳区', '城阳', '370200', null, '中国,山东省,青岛市,城阳区', '3', '266041', '0532', 'Chengyang', '120.3962100', '36.3073500');
INSERT INTO `sys_cn_area` VALUES ('370281', '胶州市', '胶州', '370200', null, '中国,山东省,青岛市,胶州市', '3', '266300', '0532', 'Jiaozhou', '120.0335000', '36.2644200');
INSERT INTO `sys_cn_area` VALUES ('370282', '即墨市', '即墨', '370200', null, '中国,山东省,青岛市,即墨市', '3', '266200', '0532', 'Jimo', '120.4469900', '36.3890700');
INSERT INTO `sys_cn_area` VALUES ('370283', '平度市', '平度', '370200', null, '中国,山东省,青岛市,平度市', '3', '266700', '0532', 'Pingdu', '119.9599600', '36.7868800');
INSERT INTO `sys_cn_area` VALUES ('370285', '莱西市', '莱西', '370200', null, '中国,山东省,青岛市,莱西市', '3', '266600', '0532', 'Laixi', '120.5177300', '36.8880400');
INSERT INTO `sys_cn_area` VALUES ('370286', '西海岸新区', '西海岸', '370200', null, '中国,山东省,青岛市,西海岸新区', '3', '266500', '0532', 'Xihai\'an', '120.1977500', '35.9606500');
INSERT INTO `sys_cn_area` VALUES ('370300', '淄博市', '淄博', '370000', null, '中国,山东省,淄博市', '2', '255039', '0533', 'Zibo', '118.0476480', '36.8149390');
INSERT INTO `sys_cn_area` VALUES ('370302', '淄川区', '淄川', '370300', null, '中国,山东省,淄博市,淄川区', '3', '255100', '0533', 'Zichuan', '117.9665500', '36.6433900');
INSERT INTO `sys_cn_area` VALUES ('370303', '张店区', '张店', '370300', null, '中国,山东省,淄博市,张店区', '3', '255022', '0533', 'Zhangdian', '118.0178800', '36.8067600');
INSERT INTO `sys_cn_area` VALUES ('370304', '博山区', '博山', '370300', null, '中国,山东省,淄博市,博山区', '3', '255200', '0533', 'Boshan', '117.8616600', '36.4946900');
INSERT INTO `sys_cn_area` VALUES ('370305', '临淄区', '临淄', '370300', null, '中国,山东省,淄博市,临淄区', '3', '255400', '0533', 'Linzi', '118.3096600', '36.8259000');
INSERT INTO `sys_cn_area` VALUES ('370306', '周村区', '周村', '370300', null, '中国,山东省,淄博市,周村区', '3', '255300', '0533', 'Zhoucun', '117.8696900', '36.8032200');
INSERT INTO `sys_cn_area` VALUES ('370321', '桓台县', '桓台', '370300', null, '中国,山东省,淄博市,桓台县', '3', '256400', '0533', 'Huantai', '118.0969800', '36.9603600');
INSERT INTO `sys_cn_area` VALUES ('370322', '高青县', '高青', '370300', null, '中国,山东省,淄博市,高青县', '3', '256300', '0533', 'Gaoqing', '117.8270800', '37.1719700');
INSERT INTO `sys_cn_area` VALUES ('370323', '沂源县', '沂源', '370300', null, '中国,山东省,淄博市,沂源县', '3', '256100', '0533', 'Yiyuan', '118.1710500', '36.1853600');
INSERT INTO `sys_cn_area` VALUES ('370400', '枣庄市', '枣庄', '370000', null, '中国,山东省,枣庄市', '2', '277101', '0632', 'Zaozhuang', '117.5579640', '34.8564240');
INSERT INTO `sys_cn_area` VALUES ('370402', '市中区', '市中区', '370400', null, '中国,山东省,枣庄市,市中区', '3', '277101', '0632', 'Shizhongqu', '117.5560300', '34.8639100');
INSERT INTO `sys_cn_area` VALUES ('370403', '薛城区', '薛城', '370400', null, '中国,山东省,枣庄市,薛城区', '3', '277000', '0632', 'Xuecheng', '117.2631800', '34.7949800');
INSERT INTO `sys_cn_area` VALUES ('370404', '峄城区', '峄城', '370400', null, '中国,山东省,枣庄市,峄城区', '3', '277300', '0632', 'Yicheng', '117.5905700', '34.7722500');
INSERT INTO `sys_cn_area` VALUES ('370405', '台儿庄区', '台儿庄', '370400', null, '中国,山东省,枣庄市,台儿庄区', '3', '277400', '0632', 'Taierzhuang', '117.7345200', '34.5636300');
INSERT INTO `sys_cn_area` VALUES ('370406', '山亭区', '山亭', '370400', null, '中国,山东省,枣庄市,山亭区', '3', '277200', '0632', 'Shanting', '117.4663000', '35.0954100');
INSERT INTO `sys_cn_area` VALUES ('370481', '滕州市', '滕州', '370400', null, '中国,山东省,枣庄市,滕州市', '3', '277500', '0632', 'Tengzhou', '117.1650000', '35.1053400');
INSERT INTO `sys_cn_area` VALUES ('370500', '东营市', '东营', '370000', null, '中国,山东省,东营市', '2', '257093', '0546', 'Dongying', '118.4963000', '37.4612660');
INSERT INTO `sys_cn_area` VALUES ('370502', '东营区', '东营', '370500', null, '中国,山东省,东营市,东营区', '3', '257029', '0546', 'Dongying', '118.5816000', '37.4487500');
INSERT INTO `sys_cn_area` VALUES ('370503', '河口区', '河口', '370500', null, '中国,山东省,东营市,河口区', '3', '257200', '0546', 'Hekou', '118.5249000', '37.8854100');
INSERT INTO `sys_cn_area` VALUES ('370521', '垦利县', '垦利', '370500', null, '中国,山东省,东营市,垦利县', '3', '257500', '0546', 'Kenli', '118.5481500', '37.5882500');
INSERT INTO `sys_cn_area` VALUES ('370522', '利津县', '利津', '370500', null, '中国,山东省,东营市,利津县', '3', '257400', '0546', 'Lijin', '118.2563700', '37.4915700');
INSERT INTO `sys_cn_area` VALUES ('370523', '广饶县', '广饶', '370500', null, '中国,山东省,东营市,广饶县', '3', '257300', '0546', 'Guangrao', '118.4070400', '37.0538100');
INSERT INTO `sys_cn_area` VALUES ('370600', '烟台市', '烟台', '370000', null, '中国,山东省,烟台市', '2', '264010', '0635', 'Yantai', '121.3913820', '37.5392970');
INSERT INTO `sys_cn_area` VALUES ('370602', '芝罘区', '芝罘', '370600', null, '中国,山东省,烟台市,芝罘区', '3', '264001', '0635', 'Zhifu', '121.4002300', '37.5406400');
INSERT INTO `sys_cn_area` VALUES ('370611', '福山区', '福山', '370600', null, '中国,山东省,烟台市,福山区', '3', '265500', '0635', 'Fushan', '121.2681200', '37.4984100');
INSERT INTO `sys_cn_area` VALUES ('370612', '牟平区', '牟平', '370600', null, '中国,山东省,烟台市,牟平区', '3', '264100', '0635', 'Muping', '121.6006700', '37.3884600');
INSERT INTO `sys_cn_area` VALUES ('370613', '莱山区', '莱山', '370600', null, '中国,山东省,烟台市,莱山区', '3', '264600', '0635', 'Laishan', '121.4451200', '37.5116500');
INSERT INTO `sys_cn_area` VALUES ('370634', '长岛县', '长岛', '370600', null, '中国,山东省,烟台市,长岛县', '3', '265800', '0635', 'Changdao', '120.7380000', '37.9175400');
INSERT INTO `sys_cn_area` VALUES ('370681', '龙口市', '龙口', '370600', null, '中国,山东省,烟台市,龙口市', '3', '265700', '0635', 'Longkou', '120.5063400', '37.6406400');
INSERT INTO `sys_cn_area` VALUES ('370682', '莱阳市', '莱阳', '370600', null, '中国,山东省,烟台市,莱阳市', '3', '265200', '0635', 'Laiyang', '120.7106600', '36.9801200');
INSERT INTO `sys_cn_area` VALUES ('370683', '莱州市', '莱州', '370600', null, '中国,山东省,烟台市,莱州市', '3', '261400', '0635', 'Laizhou', '119.9413700', '37.1780600');
INSERT INTO `sys_cn_area` VALUES ('370684', '蓬莱市', '蓬莱', '370600', null, '中国,山东省,烟台市,蓬莱市', '3', '265600', '0635', 'Penglai', '120.7598800', '37.8111900');
INSERT INTO `sys_cn_area` VALUES ('370685', '招远市', '招远', '370600', null, '中国,山东省,烟台市,招远市', '3', '265400', '0635', 'Zhaoyuan', '120.4048100', '37.3626900');
INSERT INTO `sys_cn_area` VALUES ('370686', '栖霞市', '栖霞', '370600', null, '中国,山东省,烟台市,栖霞市', '3', '265300', '0635', 'Qixia', '120.8502500', '37.3357100');
INSERT INTO `sys_cn_area` VALUES ('370687', '海阳市', '海阳', '370600', null, '中国,山东省,烟台市,海阳市', '3', '265100', '0635', 'Haiyang', '121.1597600', '36.7762200');
INSERT INTO `sys_cn_area` VALUES ('370700', '潍坊市', '潍坊', '370000', null, '中国,山东省,潍坊市', '2', '261041', '0536', 'Weifang', '119.1070780', '36.7092500');
INSERT INTO `sys_cn_area` VALUES ('370702', '潍城区', '潍城', '370700', null, '中国,山东省,潍坊市,潍城区', '3', '261021', '0536', 'Weicheng', '119.1058200', '36.7139000');
INSERT INTO `sys_cn_area` VALUES ('370703', '寒亭区', '寒亭', '370700', null, '中国,山东省,潍坊市,寒亭区', '3', '261100', '0536', 'Hanting', '119.2183200', '36.7750400');
INSERT INTO `sys_cn_area` VALUES ('370704', '坊子区', '坊子', '370700', null, '中国,山东省,潍坊市,坊子区', '3', '261200', '0536', 'Fangzi', '119.1647600', '36.6521800');
INSERT INTO `sys_cn_area` VALUES ('370705', '奎文区', '奎文', '370700', null, '中国,山东省,潍坊市,奎文区', '3', '261031', '0536', 'Kuiwen', '119.1253200', '36.7072300');
INSERT INTO `sys_cn_area` VALUES ('370724', '临朐县', '临朐', '370700', null, '中国,山东省,潍坊市,临朐县', '3', '262600', '0536', 'Linqu', '118.5440000', '36.5121600');
INSERT INTO `sys_cn_area` VALUES ('370725', '昌乐县', '昌乐', '370700', null, '中国,山东省,潍坊市,昌乐县', '3', '262400', '0536', 'Changle', '118.8301700', '36.7078000');
INSERT INTO `sys_cn_area` VALUES ('370781', '青州市', '青州', '370700', null, '中国,山东省,潍坊市,青州市', '3', '262500', '0536', 'Qingzhou', '118.4791500', '36.6850500');
INSERT INTO `sys_cn_area` VALUES ('370782', '诸城市', '诸城', '370700', null, '中国,山东省,潍坊市,诸城市', '3', '262200', '0536', 'Zhucheng', '119.4098800', '35.9966200');
INSERT INTO `sys_cn_area` VALUES ('370783', '寿光市', '寿光', '370700', null, '中国,山东省,潍坊市,寿光市', '3', '262700', '0536', 'Shouguang', '118.7404700', '36.8812800');
INSERT INTO `sys_cn_area` VALUES ('370784', '安丘市', '安丘', '370700', null, '中国,山东省,潍坊市,安丘市', '3', '262100', '0536', 'Anqiu', '119.2189000', '36.4784700');
INSERT INTO `sys_cn_area` VALUES ('370785', '高密市', '高密', '370700', null, '中国,山东省,潍坊市,高密市', '3', '261500', '0536', 'Gaomi', '119.7570100', '36.3839700');
INSERT INTO `sys_cn_area` VALUES ('370786', '昌邑市', '昌邑', '370700', null, '中国,山东省,潍坊市,昌邑市', '3', '261300', '0536', 'Changyi', '119.3976700', '36.8600800');
INSERT INTO `sys_cn_area` VALUES ('370800', '济宁市', '济宁', '370000', null, '中国,山东省,济宁市', '2', '272119', '0537', 'Jining', '116.5872450', '35.4153930');
INSERT INTO `sys_cn_area` VALUES ('370811', '任城区', '任城', '370800', null, '中国,山东省,济宁市,任城区', '3', '272113', '0537', 'Rencheng', '116.5950400', '35.4065900');
INSERT INTO `sys_cn_area` VALUES ('370812', '兖州区', '兖州', '370800', null, '中国,山东省,济宁市,兖州区', '3', '272000', '0537', 'Yanzhou ', '116.8265460', '35.5523050');
INSERT INTO `sys_cn_area` VALUES ('370826', '微山县', '微山', '370800', null, '中国,山东省,济宁市,微山县', '3', '277600', '0537', 'Weishan', '117.1287500', '34.8071200');
INSERT INTO `sys_cn_area` VALUES ('370827', '鱼台县', '鱼台', '370800', null, '中国,山东省,济宁市,鱼台县', '3', '272300', '0537', 'Yutai', '116.6476100', '34.9967400');
INSERT INTO `sys_cn_area` VALUES ('370828', '金乡县', '金乡', '370800', null, '中国,山东省,济宁市,金乡县', '3', '272200', '0537', 'Jinxiang', '116.3114600', '35.0650000');
INSERT INTO `sys_cn_area` VALUES ('370829', '嘉祥县', '嘉祥', '370800', null, '中国,山东省,济宁市,嘉祥县', '3', '272400', '0537', 'Jiaxiang', '116.3424900', '35.4083600');
INSERT INTO `sys_cn_area` VALUES ('370830', '汶上县', '汶上', '370800', null, '中国,山东省,济宁市,汶上县', '3', '272501', '0537', 'Wenshang', '116.4874200', '35.7329500');
INSERT INTO `sys_cn_area` VALUES ('370831', '泗水县', '泗水', '370800', null, '中国,山东省,济宁市,泗水县', '3', '273200', '0537', 'Sishui', '117.2794800', '35.6611300');
INSERT INTO `sys_cn_area` VALUES ('370832', '梁山县', '梁山', '370800', null, '中国,山东省,济宁市,梁山县', '3', '272600', '0537', 'Liangshan', '116.0968300', '35.8032200');
INSERT INTO `sys_cn_area` VALUES ('370881', '曲阜市', '曲阜', '370800', null, '中国,山东省,济宁市,曲阜市', '3', '273100', '0537', 'Qufu', '116.9864500', '35.5809100');
INSERT INTO `sys_cn_area` VALUES ('370883', '邹城市', '邹城', '370800', null, '中国,山东省,济宁市,邹城市', '3', '273500', '0537', 'Zoucheng', '116.9733500', '35.4053100');
INSERT INTO `sys_cn_area` VALUES ('370900', '泰安市', '泰安', '370000', null, '中国,山东省,泰安市', '2', '271000', '0538', 'Tai\'an', '117.1290630', '36.1949680');
INSERT INTO `sys_cn_area` VALUES ('370902', '泰山区', '泰山', '370900', null, '中国,山东省,泰安市,泰山区', '3', '271000', '0538', 'Taishan', '117.1344600', '36.1941100');
INSERT INTO `sys_cn_area` VALUES ('370911', '岱岳区', '岱岳', '370900', null, '中国,山东省,泰安市,岱岳区', '3', '271000', '0538', 'Daiyue', '117.0417400', '36.1875000');
INSERT INTO `sys_cn_area` VALUES ('370921', '宁阳县', '宁阳', '370900', null, '中国,山东省,泰安市,宁阳县', '3', '271400', '0538', 'Ningyang', '116.8054200', '35.7599000');
INSERT INTO `sys_cn_area` VALUES ('370923', '东平县', '东平', '370900', null, '中国,山东省,泰安市,东平县', '3', '271500', '0538', 'Dongping', '116.4711300', '35.9379200');
INSERT INTO `sys_cn_area` VALUES ('370982', '新泰市', '新泰', '370900', null, '中国,山东省,泰安市,新泰市', '3', '271200', '0538', 'Xintai', '117.7695900', '35.9088700');
INSERT INTO `sys_cn_area` VALUES ('370983', '肥城市', '肥城', '370900', null, '中国,山东省,泰安市,肥城市', '3', '271600', '0538', 'Feicheng', '116.7681500', '36.1824700');
INSERT INTO `sys_cn_area` VALUES ('371000', '威海市', '威海', '370000', null, '中国,山东省,威海市', '2', '264200', '0631', 'Weihai', '122.1163940', '37.5096910');
INSERT INTO `sys_cn_area` VALUES ('371002', '环翠区', '环翠', '371000', null, '中国,山东省,威海市,环翠区', '3', '264200', '0631', 'Huancui', '122.1234400', '37.5019900');
INSERT INTO `sys_cn_area` VALUES ('371003', '文登区', '文登', '371000', null, '中国,山东省,威海市,文登区', '3', '266440', '0631', 'Wendeng', '122.0571390', '37.1962110');
INSERT INTO `sys_cn_area` VALUES ('371082', '荣成市', '荣成', '371000', null, '中国,山东省,威海市,荣成市', '3', '264300', '0631', 'Rongcheng', '122.4877300', '37.1652000');
INSERT INTO `sys_cn_area` VALUES ('371083', '乳山市', '乳山', '371000', null, '中国,山东省,威海市,乳山市', '3', '264500', '0631', 'Rushan', '121.5381400', '36.9191800');
INSERT INTO `sys_cn_area` VALUES ('371100', '日照市', '日照', '370000', null, '中国,山东省,日照市', '2', '276800', '0633', 'Rizhao', '119.4612080', '35.4285880');
INSERT INTO `sys_cn_area` VALUES ('371102', '东港区', '东港', '371100', null, '中国,山东省,日照市,东港区', '3', '276800', '0633', 'Donggang', '119.4623700', '35.4254100');
INSERT INTO `sys_cn_area` VALUES ('371103', '岚山区', '岚山', '371100', null, '中国,山东省,日照市,岚山区', '3', '276808', '0633', 'Lanshan', '119.3188400', '35.1220300');
INSERT INTO `sys_cn_area` VALUES ('371121', '五莲县', '五莲', '371100', null, '中国,山东省,日照市,五莲县', '3', '262300', '0633', 'Wulian', '119.2070000', '35.7500400');
INSERT INTO `sys_cn_area` VALUES ('371122', '莒县', '莒县', '371100', null, '中国,山东省,日照市,莒县', '3', '276500', '0633', 'Juxian', '118.8378900', '35.5805400');
INSERT INTO `sys_cn_area` VALUES ('371200', '莱芜市', '莱芜', '370000', null, '中国,山东省,莱芜市', '2', '271100', '0634', 'Laiwu', '117.6777360', '36.2143970');
INSERT INTO `sys_cn_area` VALUES ('371202', '莱城区', '莱城', '371200', null, '中国,山东省,莱芜市,莱城区', '3', '271199', '0634', 'Laicheng', '117.6598600', '36.2032000');
INSERT INTO `sys_cn_area` VALUES ('371203', '钢城区', '钢城', '371200', null, '中国,山东省,莱芜市,钢城区', '3', '271100', '0634', 'Gangcheng', '117.8049000', '36.0631900');
INSERT INTO `sys_cn_area` VALUES ('371300', '临沂市', '临沂', '370000', null, '中国,山东省,临沂市', '2', '253000', '0539', 'Linyi', '118.3264430', '35.0652820');
INSERT INTO `sys_cn_area` VALUES ('371302', '兰山区', '兰山', '371300', null, '中国,山东省,临沂市,兰山区', '3', '276002', '0539', 'Lanshan', '118.3481700', '35.0687200');
INSERT INTO `sys_cn_area` VALUES ('371311', '罗庄区', '罗庄', '371300', null, '中国,山东省,临沂市,罗庄区', '3', '276022', '0539', 'Luozhuang', '118.2846600', '34.9962700');
INSERT INTO `sys_cn_area` VALUES ('371312', '河东区', '河东', '371300', null, '中国,山东省,临沂市,河东区', '3', '276034', '0539', 'Hedong', '118.4105500', '35.0880300');
INSERT INTO `sys_cn_area` VALUES ('371321', '沂南县', '沂南', '371300', null, '中国,山东省,临沂市,沂南县', '3', '276300', '0539', 'Yinan', '118.4706100', '35.5513100');
INSERT INTO `sys_cn_area` VALUES ('371322', '郯城县', '郯城', '371300', null, '中国,山东省,临沂市,郯城县', '3', '276100', '0539', 'Tancheng', '118.3671200', '34.6135400');
INSERT INTO `sys_cn_area` VALUES ('371323', '沂水县', '沂水', '371300', null, '中国,山东省,临沂市,沂水县', '3', '276400', '0539', 'Yishui', '118.6300900', '35.7873100');
INSERT INTO `sys_cn_area` VALUES ('371324', '兰陵县', '兰陵', '371300', null, '中国,山东省,临沂市,兰陵县', '3', '277700', '0539', 'Lanling', '117.8565920', '34.7383150');
INSERT INTO `sys_cn_area` VALUES ('371325', '费县', '费县', '371300', null, '中国,山东省,临沂市,费县', '3', '273400', '0539', 'Feixian', '117.9783600', '35.2656200');
INSERT INTO `sys_cn_area` VALUES ('371326', '平邑县', '平邑', '371300', null, '中国,山东省,临沂市,平邑县', '3', '273300', '0539', 'Pingyi', '117.6386700', '35.5057300');
INSERT INTO `sys_cn_area` VALUES ('371327', '莒南县', '莒南', '371300', null, '中国,山东省,临沂市,莒南县', '3', '276600', '0539', 'Junan', '118.8322700', '35.1753900');
INSERT INTO `sys_cn_area` VALUES ('371328', '蒙阴县', '蒙阴', '371300', null, '中国,山东省,临沂市,蒙阴县', '3', '276200', '0539', 'Mengyin', '117.9459200', '35.7099600');
INSERT INTO `sys_cn_area` VALUES ('371329', '临沭县', '临沭', '371300', null, '中国,山东省,临沂市,临沭县', '3', '276700', '0539', 'Linshu', '118.6526700', '34.9209100');
INSERT INTO `sys_cn_area` VALUES ('371400', '德州市', '德州', '370000', null, '中国,山东省,德州市', '2', '253000', '0534', 'Dezhou', '116.3074280', '37.4539680');
INSERT INTO `sys_cn_area` VALUES ('371402', '德城区', '德城', '371400', null, '中国,山东省,德州市,德城区', '3', '253012', '0534', 'Decheng', '116.2994300', '37.4512600');
INSERT INTO `sys_cn_area` VALUES ('371403', '陵城区', '陵城', '371400', null, '中国,山东省,德州市,陵城区', '3', '253500', '0534', 'Lingcheng', '116.5760100', '37.3357100');
INSERT INTO `sys_cn_area` VALUES ('371422', '宁津县', '宁津', '371400', null, '中国,山东省,德州市,宁津县', '3', '253400', '0534', 'Ningjin', '116.7970200', '37.6530100');
INSERT INTO `sys_cn_area` VALUES ('371423', '庆云县', '庆云', '371400', null, '中国,山东省,德州市,庆云县', '3', '253700', '0534', 'Qingyun', '117.3863500', '37.7761600');
INSERT INTO `sys_cn_area` VALUES ('371424', '临邑县', '临邑', '371400', null, '中国,山东省,德州市,临邑县', '3', '251500', '0534', 'Linyi', '116.8654700', '37.1905300');
INSERT INTO `sys_cn_area` VALUES ('371425', '齐河县', '齐河', '371400', null, '中国,山东省,德州市,齐河县', '3', '251100', '0534', 'Qihe', '116.7551500', '36.7953200');
INSERT INTO `sys_cn_area` VALUES ('371426', '平原县', '平原', '371400', null, '中国,山东省,德州市,平原县', '3', '253100', '0534', 'Pingyuan', '116.4343200', '37.1663200');
INSERT INTO `sys_cn_area` VALUES ('371427', '夏津县', '夏津', '371400', null, '中国,山东省,德州市,夏津县', '3', '253200', '0534', 'Xiajin', '116.0017000', '36.9485200');
INSERT INTO `sys_cn_area` VALUES ('371428', '武城县', '武城', '371400', null, '中国,山东省,德州市,武城县', '3', '253300', '0534', 'Wucheng', '116.0700900', '37.2140300');
INSERT INTO `sys_cn_area` VALUES ('371481', '乐陵市', '乐陵', '371400', null, '中国,山东省,德州市,乐陵市', '3', '253600', '0534', 'Leling', '117.2314100', '37.7316400');
INSERT INTO `sys_cn_area` VALUES ('371482', '禹城市', '禹城', '371400', null, '中国,山东省,德州市,禹城市', '3', '251200', '0534', 'Yucheng', '116.6430900', '36.9344400');
INSERT INTO `sys_cn_area` VALUES ('371500', '聊城市', '聊城', '370000', null, '中国,山东省,聊城市', '2', '252052', '0635', 'Liaocheng', '115.9803670', '36.4560130');
INSERT INTO `sys_cn_area` VALUES ('371502', '东昌府区', '东昌府', '371500', null, '中国,山东省,聊城市,东昌府区', '3', '252000', '0635', 'Dongchangfu', '115.9738300', '36.4445800');
INSERT INTO `sys_cn_area` VALUES ('371521', '阳谷县', '阳谷', '371500', null, '中国,山东省,聊城市,阳谷县', '3', '252300', '0635', 'Yanggu', '115.7912600', '36.1144400');
INSERT INTO `sys_cn_area` VALUES ('371522', '莘县', '莘县', '371500', null, '中国,山东省,聊城市,莘县', '3', '252400', '0635', 'Shenxian', '115.6697000', '36.2342300');
INSERT INTO `sys_cn_area` VALUES ('371523', '茌平县', '茌平', '371500', null, '中国,山东省,聊城市,茌平县', '3', '252100', '0635', 'Chiping', '116.2549100', '36.5796900');
INSERT INTO `sys_cn_area` VALUES ('371524', '东阿县', '东阿', '371500', null, '中国,山东省,聊城市,东阿县', '3', '252200', '0635', 'Dong\'e', '116.2501200', '36.3320900');
INSERT INTO `sys_cn_area` VALUES ('371525', '冠县', '冠县', '371500', null, '中国,山东省,聊城市,冠县', '3', '252500', '0635', 'Guanxian', '115.4419500', '36.4842900');
INSERT INTO `sys_cn_area` VALUES ('371526', '高唐县', '高唐', '371500', null, '中国,山东省,聊城市,高唐县', '3', '252800', '0635', 'Gaotang', '116.2317200', '36.8653500');
INSERT INTO `sys_cn_area` VALUES ('371581', '临清市', '临清', '371500', null, '中国,山东省,聊城市,临清市', '3', '252600', '0635', 'Linqing', '115.7062900', '36.8394500');
INSERT INTO `sys_cn_area` VALUES ('371600', '滨州市', '滨州', '370000', null, '中国,山东省,滨州市', '2', '256619', '0543', 'Binzhou', '118.0169740', '37.3835420');
INSERT INTO `sys_cn_area` VALUES ('371602', '滨城区', '滨城', '371600', null, '中国,山东省,滨州市,滨城区', '3', '256613', '0543', 'Bincheng', '118.0202600', '37.3852400');
INSERT INTO `sys_cn_area` VALUES ('371603', '沾化区', '沾化', '371600', null, '中国,山东省,滨州市,沾化区', '3', '256800', '0543', 'Zhanhua', '118.1321400', '37.6983200');
INSERT INTO `sys_cn_area` VALUES ('371621', '惠民县', '惠民', '371600', null, '中国,山东省,滨州市,惠民县', '3', '251700', '0543', 'Huimin', '117.5111300', '37.4901300');
INSERT INTO `sys_cn_area` VALUES ('371622', '阳信县', '阳信', '371600', null, '中国,山东省,滨州市,阳信县', '3', '251800', '0543', 'Yangxin', '117.5813900', '37.6419800');
INSERT INTO `sys_cn_area` VALUES ('371623', '无棣县', '无棣', '371600', null, '中国,山东省,滨州市,无棣县', '3', '251900', '0543', 'Wudi', '117.6139500', '37.7400900');
INSERT INTO `sys_cn_area` VALUES ('371625', '博兴县', '博兴', '371600', null, '中国,山东省,滨州市,博兴县', '3', '256500', '0543', 'Boxing', '118.1336000', '37.1431600');
INSERT INTO `sys_cn_area` VALUES ('371626', '邹平县', '邹平', '371600', null, '中国,山东省,滨州市,邹平县', '3', '256200', '0543', 'Zouping', '117.7430700', '36.8629500');
INSERT INTO `sys_cn_area` VALUES ('371627', '北海新区', '北海新区', '371600', null, '中国,山东省,滨州市,北海新区', '3', '256200', '0543', 'Beihaixinqu', '118.0169740', '37.3835420');
INSERT INTO `sys_cn_area` VALUES ('371700', '菏泽市', '菏泽', '370000', null, '中国,山东省,菏泽市', '2', '274020', '0530', 'Heze', '115.4693810', '35.2465310');
INSERT INTO `sys_cn_area` VALUES ('371702', '牡丹区', '牡丹', '371700', null, '中国,山东省,菏泽市,牡丹区', '3', '274009', '0530', 'Mudan', '115.4166200', '35.2509100');
INSERT INTO `sys_cn_area` VALUES ('371721', '曹县', '曹县', '371700', null, '中国,山东省,菏泽市,曹县', '3', '274400', '0530', 'Caoxian', '115.5422600', '34.8265900');
INSERT INTO `sys_cn_area` VALUES ('371722', '单县', '单县', '371700', null, '中国,山东省,菏泽市,单县', '3', '273700', '0530', 'Shanxian', '116.0870300', '34.7951400');
INSERT INTO `sys_cn_area` VALUES ('371723', '成武县', '成武', '371700', null, '中国,山东省,菏泽市,成武县', '3', '274200', '0530', 'Chengwu', '115.8897000', '34.9533200');
INSERT INTO `sys_cn_area` VALUES ('371724', '巨野县', '巨野', '371700', null, '中国,山东省,菏泽市,巨野县', '3', '274900', '0530', 'Juye', '116.0949700', '35.3978800');
INSERT INTO `sys_cn_area` VALUES ('371725', '郓城县', '郓城', '371700', null, '中国,山东省,菏泽市,郓城县', '3', '274700', '0530', 'Yuncheng', '115.9443900', '35.6004400');
INSERT INTO `sys_cn_area` VALUES ('371726', '鄄城县', '鄄城', '371700', null, '中国,山东省,菏泽市,鄄城县', '3', '274600', '0530', 'Juancheng', '115.5099700', '35.5641200');
INSERT INTO `sys_cn_area` VALUES ('371727', '定陶县', '定陶', '371700', null, '中国,山东省,菏泽市,定陶县', '3', '274100', '0530', 'Dingtao', '115.5728700', '35.0711800');
INSERT INTO `sys_cn_area` VALUES ('371728', '东明县', '东明', '371700', null, '中国,山东省,菏泽市,东明县', '3', '274500', '0530', 'Dongming', '115.0907900', '35.2890600');
INSERT INTO `sys_cn_area` VALUES ('410000', '河南省', '河南', '100000', null, '中国,河南省', '1', null, '', 'Henan', '113.6654120', '34.7579750');
INSERT INTO `sys_cn_area` VALUES ('410100', '郑州市', '郑州', '410000', null, '中国,河南省,郑州市', '2', '450000', '0371', 'Zhengzhou', '113.6654120', '34.7579750');
INSERT INTO `sys_cn_area` VALUES ('410102', '中原区', '中原', '410100', null, '中国,河南省,郑州市,中原区', '3', '450007', '0371', 'Zhongyuan', '113.6133300', '34.7482700');
INSERT INTO `sys_cn_area` VALUES ('410103', '二七区', '二七', '410100', null, '中国,河南省,郑州市,二七区', '3', '450052', '0371', 'Erqi', '113.6393100', '34.7233600');
INSERT INTO `sys_cn_area` VALUES ('410104', '管城回族区', '管城', '410100', null, '中国,河南省,郑州市,管城回族区', '3', '450000', '0371', 'Guancheng', '113.6773400', '34.7538300');
INSERT INTO `sys_cn_area` VALUES ('410105', '金水区', '金水', '410100', null, '中国,河南省,郑州市,金水区', '3', '450003', '0371', 'Jinshui', '113.6605700', '34.8002800');
INSERT INTO `sys_cn_area` VALUES ('410106', '上街区', '上街', '410100', null, '中国,河南省,郑州市,上街区', '3', '450041', '0371', 'Shangjie', '113.3089700', '34.8027600');
INSERT INTO `sys_cn_area` VALUES ('410108', '惠济区', '惠济', '410100', null, '中国,河南省,郑州市,惠济区', '3', '450053', '0371', 'Huiji', '113.6168800', '34.8673500');
INSERT INTO `sys_cn_area` VALUES ('410122', '中牟县', '中牟', '410100', null, '中国,河南省,郑州市,中牟县', '3', '451450', '0371', 'Zhongmu', '113.9761900', '34.7189900');
INSERT INTO `sys_cn_area` VALUES ('410181', '巩义市', '巩义', '410100', null, '中国,河南省,郑州市,巩义市', '3', '451200', '0371', 'Gongyi', '113.0220000', '34.7479400');
INSERT INTO `sys_cn_area` VALUES ('410182', '荥阳市', '荥阳', '410100', null, '中国,河南省,郑州市,荥阳市', '3', '450100', '0371', 'Xingyang', '113.3834500', '34.7875900');
INSERT INTO `sys_cn_area` VALUES ('410183', '新密市', '新密', '410100', null, '中国,河南省,郑州市,新密市', '3', '452300', '0371', 'Xinmi', '113.3869000', '34.5370400');
INSERT INTO `sys_cn_area` VALUES ('410184', '新郑市', '新郑', '410100', null, '中国,河南省,郑州市,新郑市', '3', '451100', '0371', 'Xinzheng', '113.7364500', '34.3955000');
INSERT INTO `sys_cn_area` VALUES ('410185', '登封市', '登封', '410100', null, '中国,河南省,郑州市,登封市', '3', '452470', '0371', 'Dengfeng', '113.0502300', '34.4534500');
INSERT INTO `sys_cn_area` VALUES ('410200', '开封市', '开封', '410000', null, '中国,河南省,开封市', '2', '475001', '0378', 'Kaifeng', '114.3414470', '34.7970490');
INSERT INTO `sys_cn_area` VALUES ('410202', '龙亭区', '龙亭', '410200', null, '中国,河南省,开封市,龙亭区', '3', '475100', '0378', 'Longting', '114.3548400', '34.7999500');
INSERT INTO `sys_cn_area` VALUES ('410203', '顺河回族区', '顺河', '410200', null, '中国,河南省,开封市,顺河回族区', '3', '475000', '0378', 'Shunhe', '114.3612300', '34.7958600');
INSERT INTO `sys_cn_area` VALUES ('410204', '鼓楼区', '鼓楼', '410200', null, '中国,河南省,开封市,鼓楼区', '3', '475000', '0378', 'Gulou', '114.3555900', '34.7951700');
INSERT INTO `sys_cn_area` VALUES ('410205', '禹王台区', '禹王台', '410200', null, '中国,河南省,开封市,禹王台区', '3', '475003', '0378', 'Yuwangtai', '114.3478700', '34.7769300');
INSERT INTO `sys_cn_area` VALUES ('410212', '祥符区', '祥符', '410200', null, '中国,河南省,开封市,祥符区', '3', '475100', '0378', 'Xiangfu', '114.4385900', '34.7587400');
INSERT INTO `sys_cn_area` VALUES ('410221', '杞县', '杞县', '410200', null, '中国,河南省,开封市,杞县', '3', '475200', '0378', 'Qixian', '114.7828000', '34.5503300');
INSERT INTO `sys_cn_area` VALUES ('410222', '通许县', '通许', '410200', null, '中国,河南省,开封市,通许县', '3', '475400', '0378', 'Tongxu', '114.4671600', '34.4752200');
INSERT INTO `sys_cn_area` VALUES ('410223', '尉氏县', '尉氏', '410200', null, '中国,河南省,开封市,尉氏县', '3', '475500', '0378', 'Weishi', '114.1928400', '34.4122300');
INSERT INTO `sys_cn_area` VALUES ('410225', '兰考县', '兰考', '410200', null, '中国,河南省,开封市,兰考县', '3', '475300', '0378', 'Lankao', '114.8196100', '34.8235000');
INSERT INTO `sys_cn_area` VALUES ('410300', '洛阳市', '洛阳', '410000', null, '中国,河南省,洛阳市', '2', '471000', '0379', 'Luoyang', '112.4344680', '34.6630410');
INSERT INTO `sys_cn_area` VALUES ('410302', '老城区', '老城', '410300', null, '中国,河南省,洛阳市,老城区', '3', '471002', '0379', 'Laocheng', '112.4690200', '34.6836400');
INSERT INTO `sys_cn_area` VALUES ('410303', '西工区', '西工', '410300', null, '中国,河南省,洛阳市,西工区', '3', '471000', '0379', 'Xigong', '112.4371000', '34.6700000');
INSERT INTO `sys_cn_area` VALUES ('410304', '瀍河回族区', '瀍河', '410300', null, '中国,河南省,洛阳市,瀍河回族区', '3', '471002', '0379', 'Chanhe', '112.5001800', '34.6798500');
INSERT INTO `sys_cn_area` VALUES ('410305', '涧西区', '涧西', '410300', null, '中国,河南省,洛阳市,涧西区', '3', '471003', '0379', 'Jianxi', '112.3958800', '34.6582300');
INSERT INTO `sys_cn_area` VALUES ('410306', '吉利区', '吉利', '410300', null, '中国,河南省,洛阳市,吉利区', '3', '471012', '0379', 'Jili', '112.5890500', '34.9008800');
INSERT INTO `sys_cn_area` VALUES ('410311', '洛龙区', '洛龙', '410300', null, '中国,河南省,洛阳市,洛龙区', '3', '471000', '0379', 'Luolong', '112.4641200', '34.6186600');
INSERT INTO `sys_cn_area` VALUES ('410322', '孟津县', '孟津', '410300', null, '中国,河南省,洛阳市,孟津县', '3', '471100', '0379', 'Mengjin', '112.4435100', '34.8260000');
INSERT INTO `sys_cn_area` VALUES ('410323', '新安县', '新安', '410300', null, '中国,河南省,洛阳市,新安县', '3', '471800', '0379', 'Xin\'an', '112.1323800', '34.7281400');
INSERT INTO `sys_cn_area` VALUES ('410324', '栾川县', '栾川', '410300', null, '中国,河南省,洛阳市,栾川县', '3', '471500', '0379', 'Luanchuan', '111.6177900', '33.7857600');
INSERT INTO `sys_cn_area` VALUES ('410325', '嵩县', '嵩县', '410300', null, '中国,河南省,洛阳市,嵩县', '3', '471400', '0379', 'Songxian', '112.0852600', '34.1346600');
INSERT INTO `sys_cn_area` VALUES ('410326', '汝阳县', '汝阳', '410300', null, '中国,河南省,洛阳市,汝阳县', '3', '471200', '0379', 'Ruyang', '112.4731400', '34.1538700');
INSERT INTO `sys_cn_area` VALUES ('410327', '宜阳县', '宜阳', '410300', null, '中国,河南省,洛阳市,宜阳县', '3', '471600', '0379', 'Yiyang', '112.1790700', '34.5152300');
INSERT INTO `sys_cn_area` VALUES ('410328', '洛宁县', '洛宁', '410300', null, '中国,河南省,洛阳市,洛宁县', '3', '471700', '0379', 'Luoning', '111.6508700', '34.3891300');
INSERT INTO `sys_cn_area` VALUES ('410329', '伊川县', '伊川', '410300', null, '中国,河南省,洛阳市,伊川县', '3', '471300', '0379', 'Yichuan', '112.4294700', '34.4220500');
INSERT INTO `sys_cn_area` VALUES ('410381', '偃师市', '偃师', '410300', null, '中国,河南省,洛阳市,偃师市', '3', '471900', '0379', 'Yanshi', '112.7922000', '34.7281000');
INSERT INTO `sys_cn_area` VALUES ('410400', '平顶山市', '平顶山', '410000', null, '中国,河南省,平顶山市', '2', '467000', '0375', 'Pingdingshan', '113.3077180', '33.7352410');
INSERT INTO `sys_cn_area` VALUES ('410402', '新华区', '新华', '410400', null, '中国,河南省,平顶山市,新华区', '3', '467002', '0375', 'Xinhua', '113.2940200', '33.7373000');
INSERT INTO `sys_cn_area` VALUES ('410403', '卫东区', '卫东', '410400', null, '中国,河南省,平顶山市,卫东区', '3', '467021', '0375', 'Weidong', '113.3351100', '33.7347200');
INSERT INTO `sys_cn_area` VALUES ('410404', '石龙区', '石龙', '410400', null, '中国,河南省,平顶山市,石龙区', '3', '467045', '0375', 'Shilong', '112.8987900', '33.8987800');
INSERT INTO `sys_cn_area` VALUES ('410411', '湛河区', '湛河', '410400', null, '中国,河南省,平顶山市,湛河区', '3', '467000', '0375', 'Zhanhe', '113.2925200', '33.7362000');
INSERT INTO `sys_cn_area` VALUES ('410421', '宝丰县', '宝丰', '410400', null, '中国,河南省,平顶山市,宝丰县', '3', '467400', '0375', 'Baofeng', '113.0549300', '33.8691600');
INSERT INTO `sys_cn_area` VALUES ('410422', '叶县', '叶县', '410400', null, '中国,河南省,平顶山市,叶县', '3', '467200', '0375', 'Yexian', '113.3510400', '33.6222500');
INSERT INTO `sys_cn_area` VALUES ('410423', '鲁山县', '鲁山', '410400', null, '中国,河南省,平顶山市,鲁山县', '3', '467300', '0375', 'Lushan', '112.9057000', '33.7387900');
INSERT INTO `sys_cn_area` VALUES ('410425', '郏县', '郏县', '410400', null, '中国,河南省,平顶山市,郏县', '3', '467100', '0375', 'Jiaxian', '113.2158800', '33.9707200');
INSERT INTO `sys_cn_area` VALUES ('410481', '舞钢市', '舞钢', '410400', null, '中国,河南省,平顶山市,舞钢市', '3', '462500', '0375', 'Wugang', '113.5241700', '33.2938000');
INSERT INTO `sys_cn_area` VALUES ('410482', '汝州市', '汝州', '410400', null, '中国,河南省,平顶山市,汝州市', '3', '467500', '0375', 'Ruzhou', '112.8430100', '34.1613500');
INSERT INTO `sys_cn_area` VALUES ('410500', '安阳市', '安阳', '410000', null, '中国,河南省,安阳市', '2', '455000', '0372', 'Anyang', '114.3524820', '36.1034420');
INSERT INTO `sys_cn_area` VALUES ('410502', '文峰区', '文峰', '410500', null, '中国,河南省,安阳市,文峰区', '3', '455000', '0372', 'Wenfeng', '114.3570800', '36.0904600');
INSERT INTO `sys_cn_area` VALUES ('410503', '北关区', '北关', '410500', null, '中国,河南省,安阳市,北关区', '3', '455001', '0372', 'Beiguan', '114.3573500', '36.1187200');
INSERT INTO `sys_cn_area` VALUES ('410505', '殷都区', '殷都', '410500', null, '中国,河南省,安阳市,殷都区', '3', '455004', '0372', 'Yindu', '114.3034000', '36.1099000');
INSERT INTO `sys_cn_area` VALUES ('410506', '龙安区', '龙安', '410500', null, '中国,河南省,安阳市,龙安区', '3', '455001', '0372', 'Long\'an', '114.3481400', '36.1190400');
INSERT INTO `sys_cn_area` VALUES ('410522', '安阳县', '安阳', '410500', null, '中国,河南省,安阳市,安阳县', '3', '455000', '0372', 'Anyang', '114.3660500', '36.0669500');
INSERT INTO `sys_cn_area` VALUES ('410523', '汤阴县', '汤阴', '410500', null, '中国,河南省,安阳市,汤阴县', '3', '456150', '0372', 'Tangyin', '114.3583900', '35.9215200');
INSERT INTO `sys_cn_area` VALUES ('410526', '滑县', '滑县', '410500', null, '中国,河南省,安阳市,滑县', '3', '456400', '0372', 'Huaxian', '114.5206600', '35.5807000');
INSERT INTO `sys_cn_area` VALUES ('410527', '内黄县', '内黄', '410500', null, '中国,河南省,安阳市,内黄县', '3', '456350', '0372', 'Neihuang', '114.9067300', '35.9526900');
INSERT INTO `sys_cn_area` VALUES ('410581', '林州市', '林州', '410500', null, '中国,河南省,安阳市,林州市', '3', '456550', '0372', 'Linzhou', '113.8155800', '36.0780400');
INSERT INTO `sys_cn_area` VALUES ('410600', '鹤壁市', '鹤壁', '410000', null, '中国,河南省,鹤壁市', '2', '458030', '0392', 'Hebi', '114.2954440', '35.7482360');
INSERT INTO `sys_cn_area` VALUES ('410602', '鹤山区', '鹤山', '410600', null, '中国,河南省,鹤壁市,鹤山区', '3', '458010', '0392', 'Heshan', '114.1633600', '35.9545800');
INSERT INTO `sys_cn_area` VALUES ('410603', '山城区', '山城', '410600', null, '中国,河南省,鹤壁市,山城区', '3', '458000', '0392', 'Shancheng', '114.1844300', '35.8977300');
INSERT INTO `sys_cn_area` VALUES ('410611', '淇滨区', '淇滨', '410600', null, '中国,河南省,鹤壁市,淇滨区', '3', '458000', '0392', 'Qibin', '114.2986700', '35.7412700');
INSERT INTO `sys_cn_area` VALUES ('410621', '浚县', '浚县', '410600', null, '中国,河南省,鹤壁市,浚县', '3', '456250', '0392', 'Xunxian', '114.5487900', '35.6708500');
INSERT INTO `sys_cn_area` VALUES ('410622', '淇县', '淇县', '410600', null, '中国,河南省,鹤壁市,淇县', '3', '456750', '0392', 'Qixian', '114.1976000', '35.6078200');
INSERT INTO `sys_cn_area` VALUES ('410700', '新乡市', '新乡', '410000', null, '中国,河南省,新乡市', '2', '453000', '0373', 'Xinxiang', '113.8839910', '35.3026160');
INSERT INTO `sys_cn_area` VALUES ('410702', '红旗区', '红旗', '410700', null, '中国,河南省,新乡市,红旗区', '3', '453000', '0373', 'Hongqi', '113.8752300', '35.3036700');
INSERT INTO `sys_cn_area` VALUES ('410703', '卫滨区', '卫滨', '410700', null, '中国,河南省,新乡市,卫滨区', '3', '453000', '0373', 'Weibin', '113.8657800', '35.3021100');
INSERT INTO `sys_cn_area` VALUES ('410704', '凤泉区', '凤泉', '410700', null, '中国,河南省,新乡市,凤泉区', '3', '453011', '0373', 'Fengquan', '113.9150700', '35.3839900');
INSERT INTO `sys_cn_area` VALUES ('410711', '牧野区', '牧野', '410700', null, '中国,河南省,新乡市,牧野区', '3', '453002', '0373', 'Muye', '113.9086000', '35.3149000');
INSERT INTO `sys_cn_area` VALUES ('410721', '新乡县', '新乡', '410700', null, '中国,河南省,新乡市,新乡县', '3', '453700', '0373', 'Xinxiang', '113.8051100', '35.1907500');
INSERT INTO `sys_cn_area` VALUES ('410724', '获嘉县', '获嘉', '410700', null, '中国,河南省,新乡市,获嘉县', '3', '453800', '0373', 'Huojia', '113.6615900', '35.2652100');
INSERT INTO `sys_cn_area` VALUES ('410725', '原阳县', '原阳', '410700', null, '中国,河南省,新乡市,原阳县', '3', '453500', '0373', 'Yuanyang', '113.9399400', '35.0656500');
INSERT INTO `sys_cn_area` VALUES ('410726', '延津县', '延津', '410700', null, '中国,河南省,新乡市,延津县', '3', '453200', '0373', 'Yanjin', '114.2026600', '35.1432700');
INSERT INTO `sys_cn_area` VALUES ('410727', '封丘县', '封丘', '410700', null, '中国,河南省,新乡市,封丘县', '3', '453300', '0373', 'Fengqiu', '114.4191500', '35.0416600');
INSERT INTO `sys_cn_area` VALUES ('410728', '长垣县', '长垣', '410700', null, '中国,河南省,新乡市,长垣县', '3', '453400', '0373', 'Changyuan', '114.6688200', '35.2004600');
INSERT INTO `sys_cn_area` VALUES ('410781', '卫辉市', '卫辉', '410700', null, '中国,河南省,新乡市,卫辉市', '3', '453100', '0373', 'Weihui', '114.0645400', '35.3984300');
INSERT INTO `sys_cn_area` VALUES ('410782', '辉县市', '辉县', '410700', null, '中国,河南省,新乡市,辉县市', '3', '453600', '0373', 'Huixian', '113.8067000', '35.4630700');
INSERT INTO `sys_cn_area` VALUES ('410800', '焦作市', '焦作', '410000', null, '中国,河南省,焦作市', '2', '454002', '0391', 'Jiaozuo', '113.2382660', '35.2390400');
INSERT INTO `sys_cn_area` VALUES ('410802', '解放区', '解放', '410800', null, '中国,河南省,焦作市,解放区', '3', '454000', '0391', 'Jiefang', '113.2293300', '35.2402300');
INSERT INTO `sys_cn_area` VALUES ('410803', '中站区', '中站', '410800', null, '中国,河南省,焦作市,中站区', '3', '454191', '0391', 'Zhongzhan', '113.1831500', '35.2366500');
INSERT INTO `sys_cn_area` VALUES ('410804', '马村区', '马村', '410800', null, '中国,河南省,焦作市,马村区', '3', '454171', '0391', 'Macun', '113.3187000', '35.2690800');
INSERT INTO `sys_cn_area` VALUES ('410811', '山阳区', '山阳', '410800', null, '中国,河南省,焦作市,山阳区', '3', '454002', '0391', 'Shanyang', '113.2546400', '35.2143600');
INSERT INTO `sys_cn_area` VALUES ('410821', '修武县', '修武', '410800', null, '中国,河南省,焦作市,修武县', '3', '454350', '0391', 'Xiuwu', '113.4477500', '35.2235700');
INSERT INTO `sys_cn_area` VALUES ('410822', '博爱县', '博爱', '410800', null, '中国,河南省,焦作市,博爱县', '3', '454450', '0391', 'Boai', '113.0669800', '35.1694300');
INSERT INTO `sys_cn_area` VALUES ('410823', '武陟县', '武陟', '410800', null, '中国,河南省,焦作市,武陟县', '3', '454950', '0391', 'Wuzhi', '113.3971800', '35.0950500');
INSERT INTO `sys_cn_area` VALUES ('410825', '温县', '温县', '410800', null, '中国,河南省,焦作市,温县', '3', '454850', '0391', 'Wenxian', '113.0806500', '34.9402200');
INSERT INTO `sys_cn_area` VALUES ('410882', '沁阳市', '沁阳', '410800', null, '中国,河南省,焦作市,沁阳市', '3', '454550', '0391', 'Qinyang', '112.9449400', '35.0893500');
INSERT INTO `sys_cn_area` VALUES ('410883', '孟州市', '孟州', '410800', null, '中国,河南省,焦作市,孟州市', '3', '454750', '0391', 'Mengzhou', '112.7913800', '34.9071000');
INSERT INTO `sys_cn_area` VALUES ('410900', '濮阳市', '濮阳', '410000', null, '中国,河南省,濮阳市', '2', '457000', '0393', 'Puyang', '115.0412990', '35.7682340');
INSERT INTO `sys_cn_area` VALUES ('410902', '华龙区', '华龙', '410900', null, '中国,河南省,濮阳市,华龙区', '3', '457001', '0393', 'Hualong', '115.0744600', '35.7773600');
INSERT INTO `sys_cn_area` VALUES ('410922', '清丰县', '清丰', '410900', null, '中国,河南省,濮阳市,清丰县', '3', '457300', '0393', 'Qingfeng', '115.1041500', '35.8850700');
INSERT INTO `sys_cn_area` VALUES ('410923', '南乐县', '南乐', '410900', null, '中国,河南省,濮阳市,南乐县', '3', '457400', '0393', 'Nanle', '115.2063900', '36.0768600');
INSERT INTO `sys_cn_area` VALUES ('410926', '范县', '范县', '410900', null, '中国,河南省,濮阳市,范县', '3', '457500', '0393', 'Fanxian', '115.5040500', '35.8517800');
INSERT INTO `sys_cn_area` VALUES ('410927', '台前县', '台前', '410900', null, '中国,河南省,濮阳市,台前县', '3', '457600', '0393', 'Taiqian', '115.8715800', '35.9692300');
INSERT INTO `sys_cn_area` VALUES ('410928', '濮阳县', '濮阳', '410900', null, '中国,河南省,濮阳市,濮阳县', '3', '457100', '0393', 'Puyang', '115.0305700', '35.7074500');
INSERT INTO `sys_cn_area` VALUES ('411000', '许昌市', '许昌', '410000', null, '中国,河南省,许昌市', '2', '461000', '0374', 'Xuchang', '113.8260630', '34.0229560');
INSERT INTO `sys_cn_area` VALUES ('411002', '魏都区', '魏都', '411000', null, '中国,河南省,许昌市,魏都区', '3', '461000', '0374', 'Weidu', '113.8227000', '34.0254400');
INSERT INTO `sys_cn_area` VALUES ('411023', '许昌县', '许昌', '411000', null, '中国,河南省,许昌市,许昌县', '3', '461100', '0374', 'Xuchang', '113.8470700', '34.0040600');
INSERT INTO `sys_cn_area` VALUES ('411024', '鄢陵县', '鄢陵', '411000', null, '中国,河南省,许昌市,鄢陵县', '3', '461200', '0374', 'Yanling', '114.1879500', '34.1031700');
INSERT INTO `sys_cn_area` VALUES ('411025', '襄城县', '襄城', '411000', null, '中国,河南省,许昌市,襄城县', '3', '461700', '0374', 'Xiangcheng', '113.4819600', '33.8492800');
INSERT INTO `sys_cn_area` VALUES ('411081', '禹州市', '禹州', '411000', null, '中国,河南省,许昌市,禹州市', '3', '461670', '0374', 'Yuzhou', '113.4880300', '34.1405400');
INSERT INTO `sys_cn_area` VALUES ('411082', '长葛市', '长葛', '411000', null, '中国,河南省,许昌市,长葛市', '3', '461500', '0374', 'Changge', '113.7732800', '34.2184600');
INSERT INTO `sys_cn_area` VALUES ('411100', '漯河市', '漯河', '410000', null, '中国,河南省,漯河市', '2', '462000', '0395', 'Luohe', '114.0264050', '33.5758550');
INSERT INTO `sys_cn_area` VALUES ('411102', '源汇区', '源汇', '411100', null, '中国,河南省,漯河市,源汇区', '3', '462000', '0395', 'Yuanhui', '114.0064700', '33.5562700');
INSERT INTO `sys_cn_area` VALUES ('411103', '郾城区', '郾城', '411100', null, '中国,河南省,漯河市,郾城区', '3', '462300', '0395', 'Yancheng', '114.0069400', '33.5872300');
INSERT INTO `sys_cn_area` VALUES ('411104', '召陵区', '召陵', '411100', null, '中国,河南省,漯河市,召陵区', '3', '462300', '0395', 'Zhaoling', '114.0939900', '33.5860100');
INSERT INTO `sys_cn_area` VALUES ('411121', '舞阳县', '舞阳', '411100', null, '中国,河南省,漯河市,舞阳县', '3', '462400', '0395', 'Wuyang', '113.5984800', '33.4324300');
INSERT INTO `sys_cn_area` VALUES ('411122', '临颍县', '临颍', '411100', null, '中国,河南省,漯河市,临颍县', '3', '462600', '0395', 'Linying', '113.9366100', '33.8112300');
INSERT INTO `sys_cn_area` VALUES ('411200', '三门峡市', '三门峡', '410000', null, '中国,河南省,三门峡市', '2', '472000', '0398', 'Sanmenxia', '111.1940990', '34.7773380');
INSERT INTO `sys_cn_area` VALUES ('411202', '湖滨区', '湖滨', '411200', null, '中国,河南省,三门峡市,湖滨区', '3', '472000', '0398', 'Hubin', '111.2000600', '34.7787200');
INSERT INTO `sys_cn_area` VALUES ('411221', '渑池县', '渑池', '411200', null, '中国,河南省,三门峡市,渑池县', '3', '472400', '0398', 'Mianchi', '111.7618400', '34.7672500');
INSERT INTO `sys_cn_area` VALUES ('411222', '陕县', '陕县', '411200', null, '中国,河南省,三门峡市,陕县', '3', '472100', '0398', 'Shanxian', '111.1033300', '34.7205200');
INSERT INTO `sys_cn_area` VALUES ('411224', '卢氏县', '卢氏', '411200', null, '中国,河南省,三门峡市,卢氏县', '3', '472200', '0398', 'Lushi', '111.0478200', '34.0543600');
INSERT INTO `sys_cn_area` VALUES ('411281', '义马市', '义马', '411200', null, '中国,河南省,三门峡市,义马市', '3', '472300', '0398', 'Yima', '111.8744500', '34.7472100');
INSERT INTO `sys_cn_area` VALUES ('411282', '灵宝市', '灵宝', '411200', null, '中国,河南省,三门峡市,灵宝市', '3', '472500', '0398', 'Lingbao', '110.8945000', '34.5168200');
INSERT INTO `sys_cn_area` VALUES ('411300', '南阳市', '南阳', '410000', null, '中国,河南省,南阳市', '2', '473002', '0377', 'Nanyang', '112.5409180', '32.9990820');
INSERT INTO `sys_cn_area` VALUES ('411302', '宛城区', '宛城', '411300', null, '中国,河南省,南阳市,宛城区', '3', '473001', '0377', 'Wancheng', '112.5395500', '33.0037800');
INSERT INTO `sys_cn_area` VALUES ('411303', '卧龙区', '卧龙', '411300', null, '中国,河南省,南阳市,卧龙区', '3', '473003', '0377', 'Wolong', '112.5347900', '32.9861500');
INSERT INTO `sys_cn_area` VALUES ('411321', '南召县', '南召', '411300', null, '中国,河南省,南阳市,南召县', '3', '474650', '0377', 'Nanzhao', '112.4319400', '33.4909800');
INSERT INTO `sys_cn_area` VALUES ('411322', '方城县', '方城', '411300', null, '中国,河南省,南阳市,方城县', '3', '473200', '0377', 'Fangcheng', '113.0126900', '33.2545300');
INSERT INTO `sys_cn_area` VALUES ('411323', '西峡县', '西峡', '411300', null, '中国,河南省,南阳市,西峡县', '3', '474550', '0377', 'Xixia', '111.4818700', '33.2977200');
INSERT INTO `sys_cn_area` VALUES ('411324', '镇平县', '镇平', '411300', null, '中国,河南省,南阳市,镇平县', '3', '474250', '0377', 'Zhenping', '112.2398000', '33.0362900');
INSERT INTO `sys_cn_area` VALUES ('411325', '内乡县', '内乡', '411300', null, '中国,河南省,南阳市,内乡县', '3', '474350', '0377', 'Neixiang', '111.8495700', '33.0467100');
INSERT INTO `sys_cn_area` VALUES ('411326', '淅川县', '淅川', '411300', null, '中国,河南省,南阳市,淅川县', '3', '474450', '0377', 'Xichuan', '111.4866300', '33.1370800');
INSERT INTO `sys_cn_area` VALUES ('411327', '社旗县', '社旗', '411300', null, '中国,河南省,南阳市,社旗县', '3', '473300', '0377', 'Sheqi', '112.9465600', '33.0550300');
INSERT INTO `sys_cn_area` VALUES ('411328', '唐河县', '唐河', '411300', null, '中国,河南省,南阳市,唐河县', '3', '473400', '0377', 'Tanghe', '112.8360900', '32.6945300');
INSERT INTO `sys_cn_area` VALUES ('411329', '新野县', '新野', '411300', null, '中国,河南省,南阳市,新野县', '3', '473500', '0377', 'Xinye', '112.3615100', '32.5169800');
INSERT INTO `sys_cn_area` VALUES ('411330', '桐柏县', '桐柏', '411300', null, '中国,河南省,南阳市,桐柏县', '3', '474750', '0377', 'Tongbai', '113.4288600', '32.3791700');
INSERT INTO `sys_cn_area` VALUES ('411381', '邓州市', '邓州', '411300', null, '中国,河南省,南阳市,邓州市', '3', '474150', '0377', 'Dengzhou', '112.0896000', '32.6857700');
INSERT INTO `sys_cn_area` VALUES ('411400', '商丘市', '商丘', '410000', null, '中国,河南省,商丘市', '2', '476000', '0370', 'Shangqiu', '115.6504970', '34.4370540');
INSERT INTO `sys_cn_area` VALUES ('411402', '梁园区', '梁园', '411400', null, '中国,河南省,商丘市,梁园区', '3', '476000', '0370', 'Liangyuan', '115.6448700', '34.4434100');
INSERT INTO `sys_cn_area` VALUES ('411403', '睢阳区', '睢阳', '411400', null, '中国,河南省,商丘市,睢阳区', '3', '476100', '0370', 'Suiyang', '115.6533800', '34.3880400');
INSERT INTO `sys_cn_area` VALUES ('411421', '民权县', '民权', '411400', null, '中国,河南省,商丘市,民权县', '3', '476800', '0370', 'Minquan', '115.1462100', '34.6493100');
INSERT INTO `sys_cn_area` VALUES ('411422', '睢县', '睢县', '411400', null, '中国,河南省,商丘市,睢县', '3', '476900', '0370', 'Suixian', '115.0716800', '34.4453900');
INSERT INTO `sys_cn_area` VALUES ('411423', '宁陵县', '宁陵', '411400', null, '中国,河南省,商丘市,宁陵县', '3', '476700', '0370', 'Ningling', '115.3051100', '34.4546300');
INSERT INTO `sys_cn_area` VALUES ('411424', '柘城县', '柘城', '411400', null, '中国,河南省,商丘市,柘城县', '3', '476200', '0370', 'Zhecheng', '115.3053800', '34.0911000');
INSERT INTO `sys_cn_area` VALUES ('411425', '虞城县', '虞城', '411400', null, '中国,河南省,商丘市,虞城县', '3', '476300', '0370', 'Yucheng', '115.8633700', '34.4018900');
INSERT INTO `sys_cn_area` VALUES ('411426', '夏邑县', '夏邑', '411400', null, '中国,河南省,商丘市,夏邑县', '3', '476400', '0370', 'Xiayi', '116.1334800', '34.2324200');
INSERT INTO `sys_cn_area` VALUES ('411481', '永城市', '永城', '411400', null, '中国,河南省,商丘市,永城市', '3', '476600', '0370', 'Yongcheng', '116.4494300', '33.9291100');
INSERT INTO `sys_cn_area` VALUES ('411500', '信阳市', '信阳', '410000', null, '中国,河南省,信阳市', '2', '464000', '0376', 'Xinyang', '114.0750310', '32.1232740');
INSERT INTO `sys_cn_area` VALUES ('411502', '浉河区', '浉河', '411500', null, '中国,河南省,信阳市,浉河区', '3', '464000', '0376', 'Shihe', '114.0587100', '32.1168000');
INSERT INTO `sys_cn_area` VALUES ('411503', '平桥区', '平桥', '411500', null, '中国,河南省,信阳市,平桥区', '3', '464100', '0376', 'Pingqiao', '114.1243500', '32.1009500');
INSERT INTO `sys_cn_area` VALUES ('411521', '罗山县', '罗山', '411500', null, '中国,河南省,信阳市,罗山县', '3', '464200', '0376', 'Luoshan', '114.5314000', '32.2027700');
INSERT INTO `sys_cn_area` VALUES ('411522', '光山县', '光山', '411500', null, '中国,河南省,信阳市,光山县', '3', '465450', '0376', 'Guangshan', '114.9187300', '32.0099200');
INSERT INTO `sys_cn_area` VALUES ('411523', '新县', '新县', '411500', null, '中国,河南省,信阳市,新县', '3', '465550', '0376', 'Xinxian', '114.8792400', '31.6438600');
INSERT INTO `sys_cn_area` VALUES ('411524', '商城县', '商城', '411500', null, '中国,河南省,信阳市,商城县', '3', '465350', '0376', 'Shangcheng', '115.4085600', '31.7998600');
INSERT INTO `sys_cn_area` VALUES ('411525', '固始县', '固始', '411500', null, '中国,河南省,信阳市,固始县', '3', '465250', '0376', 'Gushi', '115.6829800', '32.1801100');
INSERT INTO `sys_cn_area` VALUES ('411526', '潢川县', '潢川', '411500', null, '中国,河南省,信阳市,潢川县', '3', '465150', '0376', 'Huangchuan', '115.0469600', '32.1376300');
INSERT INTO `sys_cn_area` VALUES ('411527', '淮滨县', '淮滨', '411500', null, '中国,河南省,信阳市,淮滨县', '3', '464400', '0376', 'Huaibin', '115.4205000', '32.4661400');
INSERT INTO `sys_cn_area` VALUES ('411528', '息县', '息县', '411500', null, '中国,河南省,信阳市,息县', '3', '464300', '0376', 'Xixian', '114.7402000', '32.3427900');
INSERT INTO `sys_cn_area` VALUES ('411600', '周口市', '周口', '410000', null, '中国,河南省,周口市', '2', '466000', '0394', 'Zhoukou', '114.6496530', '33.6203570');
INSERT INTO `sys_cn_area` VALUES ('411602', '川汇区', '川汇', '411600', null, '中国,河南省,周口市,川汇区', '3', '466000', '0394', 'Chuanhui', '114.6420200', '33.6256000');
INSERT INTO `sys_cn_area` VALUES ('411621', '扶沟县', '扶沟', '411600', null, '中国,河南省,周口市,扶沟县', '3', '461300', '0394', 'Fugou', '114.3947700', '34.0599900');
INSERT INTO `sys_cn_area` VALUES ('411622', '西华县', '西华', '411600', null, '中国,河南省,周口市,西华县', '3', '466600', '0394', 'Xihua', '114.5227900', '33.7854800');
INSERT INTO `sys_cn_area` VALUES ('411623', '商水县', '商水', '411600', null, '中国,河南省,周口市,商水县', '3', '466100', '0394', 'Shangshui', '114.6060400', '33.5391200');
INSERT INTO `sys_cn_area` VALUES ('411624', '沈丘县', '沈丘', '411600', null, '中国,河南省,周口市,沈丘县', '3', '466300', '0394', 'Shenqiu', '115.0985100', '33.4093600');
INSERT INTO `sys_cn_area` VALUES ('411625', '郸城县', '郸城', '411600', null, '中国,河南省,周口市,郸城县', '3', '477150', '0394', 'Dancheng', '115.1771500', '33.6448500');
INSERT INTO `sys_cn_area` VALUES ('411626', '淮阳县', '淮阳', '411600', null, '中国,河南省,周口市,淮阳县', '3', '466700', '0394', 'Huaiyang', '114.8884800', '33.7321100');
INSERT INTO `sys_cn_area` VALUES ('411627', '太康县', '太康', '411600', null, '中国,河南省,周口市,太康县', '3', '461400', '0394', 'Taikang', '114.8377300', '34.0637600');
INSERT INTO `sys_cn_area` VALUES ('411628', '鹿邑县', '鹿邑', '411600', null, '中国,河南省,周口市,鹿邑县', '3', '477200', '0394', 'Luyi', '115.4855300', '33.8593100');
INSERT INTO `sys_cn_area` VALUES ('411681', '项城市', '项城', '411600', null, '中国,河南省,周口市,项城市', '3', '466200', '0394', 'Xiangcheng', '114.8755800', '33.4672000');
INSERT INTO `sys_cn_area` VALUES ('411700', '驻马店市', '驻马店', '410000', null, '中国,河南省,驻马店市', '2', '463000', '0396', 'Zhumadian', '114.0247360', '32.9801690');
INSERT INTO `sys_cn_area` VALUES ('411702', '驿城区', '驿城', '411700', null, '中国,河南省,驻马店市,驿城区', '3', '463000', '0396', 'Yicheng', '113.9937700', '32.9731600');
INSERT INTO `sys_cn_area` VALUES ('411721', '西平县', '西平', '411700', null, '中国,河南省,驻马店市,西平县', '3', '463900', '0396', 'Xiping', '114.0232200', '33.3845000');
INSERT INTO `sys_cn_area` VALUES ('411722', '上蔡县', '上蔡', '411700', null, '中国,河南省,驻马店市,上蔡县', '3', '463800', '0396', 'Shangcai', '114.2682500', '33.2682500');
INSERT INTO `sys_cn_area` VALUES ('411723', '平舆县', '平舆', '411700', null, '中国,河南省,驻马店市,平舆县', '3', '463400', '0396', 'Pingyu', '114.6355200', '32.9572700');
INSERT INTO `sys_cn_area` VALUES ('411724', '正阳县', '正阳', '411700', null, '中国,河南省,驻马店市,正阳县', '3', '463600', '0396', 'Zhengyang', '114.3895200', '32.6039000');
INSERT INTO `sys_cn_area` VALUES ('411725', '确山县', '确山', '411700', null, '中国,河南省,驻马店市,确山县', '3', '463200', '0396', 'Queshan', '114.0291700', '32.8028100');
INSERT INTO `sys_cn_area` VALUES ('411726', '泌阳县', '泌阳', '411700', null, '中国,河南省,驻马店市,泌阳县', '3', '463700', '0396', 'Biyang', '113.3268100', '32.7178100');
INSERT INTO `sys_cn_area` VALUES ('411727', '汝南县', '汝南', '411700', null, '中国,河南省,驻马店市,汝南县', '3', '463300', '0396', 'Runan', '114.3613800', '33.0046100');
INSERT INTO `sys_cn_area` VALUES ('411728', '遂平县', '遂平', '411700', null, '中国,河南省,驻马店市,遂平县', '3', '463100', '0396', 'Suiping', '114.0129700', '33.1457100');
INSERT INTO `sys_cn_area` VALUES ('411729', '新蔡县', '新蔡', '411700', null, '中国,河南省,驻马店市,新蔡县', '3', '463500', '0396', 'Xincai', '114.9819900', '32.7502000');
INSERT INTO `sys_cn_area` VALUES ('419000', '直辖县级', ' ', '410000', null, '中国,河南省,直辖县级', '2', null, '', '', '113.6654120', '34.7579750');
INSERT INTO `sys_cn_area` VALUES ('419001', '济源市', '济源', '419000', null, '中国,河南省,直辖县级,济源市', '3', '454650', '0391', 'Jiyuan', '112.5900470', '35.0903780');
INSERT INTO `sys_cn_area` VALUES ('420000', '湖北省', '湖北', '100000', null, '中国,湖北省', '1', null, '', 'Hubei', '114.2985720', '30.5843550');
INSERT INTO `sys_cn_area` VALUES ('420100', '武汉市', '武汉', '420000', null, '中国,湖北省,武汉市', '2', '430014', '', 'Wuhan', '114.2985720', '30.5843550');
INSERT INTO `sys_cn_area` VALUES ('420102', '江岸区', '江岸', '420100', null, '中国,湖北省,武汉市,江岸区', '3', '430014', '027', 'Jiang\'an', '114.3094300', '30.5998200');
INSERT INTO `sys_cn_area` VALUES ('420103', '江汉区', '江汉', '420100', null, '中国,湖北省,武汉市,江汉区', '3', '430021', '027', 'Jianghan', '114.2709300', '30.6014600');
INSERT INTO `sys_cn_area` VALUES ('420104', '硚口区', '硚口', '420100', null, '中国,湖北省,武汉市,硚口区', '3', '430033', '027', 'Qiaokou', '114.2642200', '30.5694500');
INSERT INTO `sys_cn_area` VALUES ('420105', '汉阳区', '汉阳', '420100', null, '中国,湖北省,武汉市,汉阳区', '3', '430050', '027', 'Hanyang', '114.2747800', '30.5491500');
INSERT INTO `sys_cn_area` VALUES ('420106', '武昌区', '武昌', '420100', null, '中国,湖北省,武汉市,武昌区', '3', '430061', '027', 'Wuchang', '114.3158900', '30.5538900');
INSERT INTO `sys_cn_area` VALUES ('420107', '青山区', '青山', '420100', null, '中国,湖北省,武汉市,青山区', '3', '430080', '027', 'Qingshan', '114.3911700', '30.6342700');
INSERT INTO `sys_cn_area` VALUES ('420111', '洪山区', '洪山', '420100', null, '中国,湖北省,武汉市,洪山区', '3', '430070', '027', 'Hongshan', '114.3437500', '30.4998900');
INSERT INTO `sys_cn_area` VALUES ('420112', '东西湖区', '东西湖', '420100', null, '中国,湖北省,武汉市,东西湖区', '3', '430040', '027', 'Dongxihu', '114.1370800', '30.6198900');
INSERT INTO `sys_cn_area` VALUES ('420113', '汉南区', '汉南', '420100', null, '中国,湖北省,武汉市,汉南区', '3', '430090', '027', 'Hannan', '114.0846200', '30.3087900');
INSERT INTO `sys_cn_area` VALUES ('420114', '蔡甸区', '蔡甸', '420100', null, '中国,湖北省,武汉市,蔡甸区', '3', '430100', '027', 'Caidian', '114.0292900', '30.5819700');
INSERT INTO `sys_cn_area` VALUES ('420115', '江夏区', '江夏', '420100', null, '中国,湖北省,武汉市,江夏区', '3', '430200', '027', 'Jiangxia', '114.3130100', '30.3465300');
INSERT INTO `sys_cn_area` VALUES ('420116', '黄陂区', '黄陂', '420100', null, '中国,湖北省,武汉市,黄陂区', '3', '432200', '027', 'Huangpi', '114.3751200', '30.8815100');
INSERT INTO `sys_cn_area` VALUES ('420117', '新洲区', '新洲', '420100', null, '中国,湖北省,武汉市,新洲区', '3', '431400', '027', 'Xinzhou', '114.8013600', '30.8414500');
INSERT INTO `sys_cn_area` VALUES ('420200', '黄石市', '黄石', '420000', null, '中国,湖北省,黄石市', '2', '435003', '0714', 'Huangshi', '115.0770480', '30.2200740');
INSERT INTO `sys_cn_area` VALUES ('420202', '黄石港区', '黄石港', '420200', null, '中国,湖北省,黄石市,黄石港区', '3', '435000', '0714', 'Huangshigang', '115.0660400', '30.2227900');
INSERT INTO `sys_cn_area` VALUES ('420203', '西塞山区', '西塞山', '420200', null, '中国,湖北省,黄石市,西塞山区', '3', '435001', '0714', 'Xisaishan', '115.1101600', '30.2048700');
INSERT INTO `sys_cn_area` VALUES ('420204', '下陆区', '下陆', '420200', null, '中国,湖北省,黄石市,下陆区', '3', '435005', '0714', 'Xialu', '114.9611200', '30.1736800');
INSERT INTO `sys_cn_area` VALUES ('420205', '铁山区', '铁山', '420200', null, '中国,湖北省,黄石市,铁山区', '3', '435006', '0714', 'Tieshan', '114.9010900', '30.2067800');
INSERT INTO `sys_cn_area` VALUES ('420222', '阳新县', '阳新', '420200', null, '中国,湖北省,黄石市,阳新县', '3', '435200', '0714', 'Yangxin', '115.2152700', '29.8303800');
INSERT INTO `sys_cn_area` VALUES ('420281', '大冶市', '大冶', '420200', null, '中国,湖北省,黄石市,大冶市', '3', '435100', '0714', 'Daye', '114.9717400', '30.0943800');
INSERT INTO `sys_cn_area` VALUES ('420300', '十堰市', '十堰', '420000', null, '中国,湖北省,十堰市', '2', '442000', '0719', 'Shiyan', '110.7852390', '32.6470170');
INSERT INTO `sys_cn_area` VALUES ('420302', '茅箭区', '茅箭', '420300', null, '中国,湖北省,十堰市,茅箭区', '3', '442012', '0719', 'Maojian', '110.8134100', '32.5915300');
INSERT INTO `sys_cn_area` VALUES ('420303', '张湾区', '张湾', '420300', null, '中国,湖北省,十堰市,张湾区', '3', '442001', '0719', 'Zhangwan', '110.7706700', '32.6519500');
INSERT INTO `sys_cn_area` VALUES ('420304', '郧阳区', '郧阳', '420300', null, '中国,湖北省,十堰市,郧阳区', '3', '442500', '0719', 'Yunyang', '110.8185400', '32.8359300');
INSERT INTO `sys_cn_area` VALUES ('420322', '郧西县', '郧西', '420300', null, '中国,湖北省,十堰市,郧西县', '3', '442600', '0719', 'Yunxi', '110.4255600', '32.9934900');
INSERT INTO `sys_cn_area` VALUES ('420323', '竹山县', '竹山', '420300', null, '中国,湖北省,十堰市,竹山县', '3', '442200', '0719', 'Zhushan', '110.2307100', '32.2253600');
INSERT INTO `sys_cn_area` VALUES ('420324', '竹溪县', '竹溪', '420300', null, '中国,湖北省,十堰市,竹溪县', '3', '442300', '0719', 'Zhuxi', '109.7179800', '32.3190100');
INSERT INTO `sys_cn_area` VALUES ('420325', '房县', '房县', '420300', null, '中国,湖北省,十堰市,房县', '3', '442100', '0719', 'Fangxian', '110.7438600', '32.0579400');
INSERT INTO `sys_cn_area` VALUES ('420381', '丹江口市', '丹江口', '420300', null, '中国,湖北省,十堰市,丹江口市', '3', '442700', '0719', 'Danjiangkou', '111.5152500', '32.5408500');
INSERT INTO `sys_cn_area` VALUES ('420500', '宜昌市', '宜昌', '420000', null, '中国,湖北省,宜昌市', '2', '443000', '0717', 'Yichang', '111.2908430', '30.7026360');
INSERT INTO `sys_cn_area` VALUES ('420502', '西陵区', '西陵', '420500', null, '中国,湖北省,宜昌市,西陵区', '3', '443000', '0717', 'Xiling', '111.2857300', '30.7107700');
INSERT INTO `sys_cn_area` VALUES ('420503', '伍家岗区', '伍家岗', '420500', null, '中国,湖北省,宜昌市,伍家岗区', '3', '443001', '0717', 'Wujiagang', '111.3609000', '30.6443400');
INSERT INTO `sys_cn_area` VALUES ('420504', '点军区', '点军', '420500', null, '中国,湖北省,宜昌市,点军区', '3', '443006', '0717', 'Dianjun', '111.2682800', '30.6934000');
INSERT INTO `sys_cn_area` VALUES ('420505', '猇亭区', '猇亭', '420500', null, '中国,湖北省,宜昌市,猇亭区', '3', '443007', '0717', 'Xiaoting', '111.4407900', '30.5266300');
INSERT INTO `sys_cn_area` VALUES ('420506', '夷陵区', '夷陵', '420500', null, '中国,湖北省,宜昌市,夷陵区', '3', '443100', '0717', 'Yiling', '111.3262000', '30.7688100');
INSERT INTO `sys_cn_area` VALUES ('420525', '远安县', '远安', '420500', null, '中国,湖北省,宜昌市,远安县', '3', '444200', '0717', 'Yuan\'an', '111.6416000', '31.0598900');
INSERT INTO `sys_cn_area` VALUES ('420526', '兴山县', '兴山', '420500', null, '中国,湖北省,宜昌市,兴山县', '3', '443711', '0717', 'Xingshan', '110.7495100', '31.3468600');
INSERT INTO `sys_cn_area` VALUES ('420527', '秭归县', '秭归', '420500', null, '中国,湖北省,宜昌市,秭归县', '3', '443600', '0717', 'Zigui', '110.9815600', '30.8270200');
INSERT INTO `sys_cn_area` VALUES ('420528', '长阳土家族自治县', '长阳', '420500', null, '中国,湖北省,宜昌市,长阳土家族自治县', '3', '443500', '0717', 'Changyang', '111.2010500', '30.4705200');
INSERT INTO `sys_cn_area` VALUES ('420529', '五峰土家族自治县', '五峰', '420500', null, '中国,湖北省,宜昌市,五峰土家族自治县', '3', '443413', '0717', 'Wufeng', '110.6748000', '30.1985600');
INSERT INTO `sys_cn_area` VALUES ('420581', '宜都市', '宜都', '420500', null, '中国,湖北省,宜昌市,宜都市', '3', '443300', '0717', 'Yidu', '111.4502500', '30.3780700');
INSERT INTO `sys_cn_area` VALUES ('420582', '当阳市', '当阳', '420500', null, '中国,湖北省,宜昌市,当阳市', '3', '444100', '0717', 'Dangyang', '111.7891200', '30.8208000');
INSERT INTO `sys_cn_area` VALUES ('420583', '枝江市', '枝江', '420500', null, '中国,湖北省,宜昌市,枝江市', '3', '443200', '0717', 'Zhijiang', '111.7685500', '30.4261200');
INSERT INTO `sys_cn_area` VALUES ('420600', '襄阳市', '襄阳', '420000', null, '中国,湖北省,襄阳市', '2', '441021', '0710', 'Xiangyang', '112.1441460', '32.0424260');
INSERT INTO `sys_cn_area` VALUES ('420602', '襄城区', '襄城', '420600', null, '中国,湖北省,襄阳市,襄城区', '3', '441021', '0710', 'Xiangcheng', '112.1337200', '32.0101700');
INSERT INTO `sys_cn_area` VALUES ('420606', '樊城区', '樊城', '420600', null, '中国,湖北省,襄阳市,樊城区', '3', '441001', '0710', 'Fancheng', '112.1354600', '32.0448200');
INSERT INTO `sys_cn_area` VALUES ('420607', '襄州区', '襄州', '420600', null, '中国,湖北省,襄阳市,襄州区', '3', '441100', '0710', 'Xiangzhou', '112.1503270', '32.0150880');
INSERT INTO `sys_cn_area` VALUES ('420624', '南漳县', '南漳', '420600', null, '中国,湖北省,襄阳市,南漳县', '3', '441500', '0710', 'Nanzhang', '111.8460300', '31.7765300');
INSERT INTO `sys_cn_area` VALUES ('420625', '谷城县', '谷城', '420600', null, '中国,湖北省,襄阳市,谷城县', '3', '441700', '0710', 'Gucheng', '111.6526700', '32.2637700');
INSERT INTO `sys_cn_area` VALUES ('420626', '保康县', '保康', '420600', null, '中国,湖北省,襄阳市,保康县', '3', '441600', '0710', 'Baokang', '111.2613800', '31.8787400');
INSERT INTO `sys_cn_area` VALUES ('420682', '老河口市', '老河口', '420600', null, '中国,湖北省,襄阳市,老河口市', '3', '441800', '0710', 'Laohekou', '111.6711700', '32.3847600');
INSERT INTO `sys_cn_area` VALUES ('420683', '枣阳市', '枣阳', '420600', null, '中国,湖北省,襄阳市,枣阳市', '3', '441200', '0710', 'Zaoyang', '112.7744400', '32.1314200');
INSERT INTO `sys_cn_area` VALUES ('420684', '宜城市', '宜城', '420600', null, '中国,湖北省,襄阳市,宜城市', '3', '441400', '0710', 'Yicheng', '112.2577200', '31.7197200');
INSERT INTO `sys_cn_area` VALUES ('420700', '鄂州市', '鄂州', '420000', null, '中国,湖北省,鄂州市', '2', '436000', '0711', 'Ezhou', '114.8905930', '30.3965360');
INSERT INTO `sys_cn_area` VALUES ('420702', '梁子湖区', '梁子湖', '420700', null, '中国,湖北省,鄂州市,梁子湖区', '3', '436064', '0711', 'Liangzihu', '114.6846300', '30.1000300');
INSERT INTO `sys_cn_area` VALUES ('420703', '华容区', '华容', '420700', null, '中国,湖北省,鄂州市,华容区', '3', '436030', '0711', 'Huarong', '114.7356800', '30.5332800');
INSERT INTO `sys_cn_area` VALUES ('420704', '鄂城区', '鄂城', '420700', null, '中国,湖北省,鄂州市,鄂城区', '3', '436000', '0711', 'Echeng', '114.8915800', '30.4002400');
INSERT INTO `sys_cn_area` VALUES ('420800', '荆门市', '荆门', '420000', null, '中国,湖北省,荆门市', '2', '448000', '0724', 'Jingmen', '112.2042510', '31.0354200');
INSERT INTO `sys_cn_area` VALUES ('420802', '东宝区', '东宝', '420800', null, '中国,湖北省,荆门市,东宝区', '3', '448004', '0724', 'Dongbao', '112.2014700', '31.0519200');
INSERT INTO `sys_cn_area` VALUES ('420804', '掇刀区', '掇刀', '420800', null, '中国,湖北省,荆门市,掇刀区', '3', '448124', '0724', 'Duodao', '112.2080000', '30.9731600');
INSERT INTO `sys_cn_area` VALUES ('420821', '京山县', '京山', '420800', null, '中国,湖北省,荆门市,京山县', '3', '431800', '0724', 'Jingshan', '113.1107400', '31.0224000');
INSERT INTO `sys_cn_area` VALUES ('420822', '沙洋县', '沙洋', '420800', null, '中国,湖北省,荆门市,沙洋县', '3', '448200', '0724', 'Shayang', '112.5885300', '30.7091600');
INSERT INTO `sys_cn_area` VALUES ('420881', '钟祥市', '钟祥', '420800', null, '中国,湖北省,荆门市,钟祥市', '3', '431900', '0724', 'Zhongxiang', '112.5893200', '31.1678000');
INSERT INTO `sys_cn_area` VALUES ('420900', '孝感市', '孝感', '420000', null, '中国,湖北省,孝感市', '2', '432100', '0712', 'Xiaogan', '113.9266550', '30.9264230');
INSERT INTO `sys_cn_area` VALUES ('420902', '孝南区', '孝南', '420900', null, '中国,湖北省,孝感市,孝南区', '3', '432100', '0712', 'Xiaonan', '113.9111100', '30.9168000');
INSERT INTO `sys_cn_area` VALUES ('420921', '孝昌县', '孝昌', '420900', null, '中国,湖北省,孝感市,孝昌县', '3', '432900', '0712', 'Xiaochang', '113.9979500', '31.2579900');
INSERT INTO `sys_cn_area` VALUES ('420922', '大悟县', '大悟', '420900', null, '中国,湖北省,孝感市,大悟县', '3', '432800', '0712', 'Dawu', '114.1256400', '31.5617600');
INSERT INTO `sys_cn_area` VALUES ('420923', '云梦县', '云梦', '420900', null, '中国,湖北省,孝感市,云梦县', '3', '432500', '0712', 'Yunmeng', '113.7528900', '31.0209300');
INSERT INTO `sys_cn_area` VALUES ('420981', '应城市', '应城', '420900', null, '中国,湖北省,孝感市,应城市', '3', '432400', '0712', 'Yingcheng', '113.5728700', '30.9283400');
INSERT INTO `sys_cn_area` VALUES ('420982', '安陆市', '安陆', '420900', null, '中国,湖北省,孝感市,安陆市', '3', '432600', '0712', 'Anlu', '113.6855700', '31.2569300');
INSERT INTO `sys_cn_area` VALUES ('420984', '汉川市', '汉川', '420900', null, '中国,湖北省,孝感市,汉川市', '3', '432300', '0712', 'Hanchuan', '113.8389800', '30.6611700');
INSERT INTO `sys_cn_area` VALUES ('421000', '荆州市', '荆州', '420000', null, '中国,湖北省,荆州市', '2', '434000', '0716', 'Jingzhou', '112.2381300', '30.3268570');
INSERT INTO `sys_cn_area` VALUES ('421002', '沙市区', '沙市', '421000', null, '中国,湖北省,荆州市,沙市区', '3', '434000', '0716', 'Shashi', '112.2554300', '30.3110700');
INSERT INTO `sys_cn_area` VALUES ('421003', '荆州区', '荆州', '421000', null, '中国,湖北省,荆州市,荆州区', '3', '434020', '0716', 'Jingzhou', '112.1900600', '30.3526400');
INSERT INTO `sys_cn_area` VALUES ('421022', '公安县', '公安', '421000', null, '中国,湖北省,荆州市,公安县', '3', '434300', '0716', 'Gong\'an', '112.2324200', '30.0590200');
INSERT INTO `sys_cn_area` VALUES ('421023', '监利县', '监利', '421000', null, '中国,湖北省,荆州市,监利县', '3', '433300', '0716', 'Jianli', '112.8946200', '29.8149400');
INSERT INTO `sys_cn_area` VALUES ('421024', '江陵县', '江陵', '421000', null, '中国,湖北省,荆州市,江陵县', '3', '434101', '0716', 'Jiangling', '112.4246800', '30.0417400');
INSERT INTO `sys_cn_area` VALUES ('421081', '石首市', '石首', '421000', null, '中国,湖北省,荆州市,石首市', '3', '434400', '0716', 'Shishou', '112.4263600', '29.7212700');
INSERT INTO `sys_cn_area` VALUES ('421083', '洪湖市', '洪湖', '421000', null, '中国,湖北省,荆州市,洪湖市', '3', '433200', '0716', 'Honghu', '113.4759800', '29.8270000');
INSERT INTO `sys_cn_area` VALUES ('421087', '松滋市', '松滋', '421000', null, '中国,湖北省,荆州市,松滋市', '3', '434200', '0716', 'Songzi', '111.7673900', '30.1696500');
INSERT INTO `sys_cn_area` VALUES ('421100', '黄冈市', '黄冈', '420000', null, '中国,湖北省,黄冈市', '2', '438000', '0713', 'Huanggang', '114.8793650', '30.4477110');
INSERT INTO `sys_cn_area` VALUES ('421102', '黄州区', '黄州', '421100', null, '中国,湖北省,黄冈市,黄州区', '3', '438000', '0713', 'Huangzhou', '114.8800800', '30.4343600');
INSERT INTO `sys_cn_area` VALUES ('421121', '团风县', '团风', '421100', null, '中国,湖北省,黄冈市,团风县', '3', '438800', '0713', 'Tuanfeng', '114.8722800', '30.6435900');
INSERT INTO `sys_cn_area` VALUES ('421122', '红安县', '红安', '421100', null, '中国,湖北省,黄冈市,红安县', '3', '438401', '0713', 'Hong\'an', '114.6224000', '31.2866800');
INSERT INTO `sys_cn_area` VALUES ('421123', '罗田县', '罗田', '421100', null, '中国,湖北省,黄冈市,罗田县', '3', '438600', '0713', 'Luotian', '115.3997100', '30.7825500');
INSERT INTO `sys_cn_area` VALUES ('421124', '英山县', '英山', '421100', null, '中国,湖北省,黄冈市,英山县', '3', '438700', '0713', 'Yingshan', '115.6814200', '30.7351600');
INSERT INTO `sys_cn_area` VALUES ('421125', '浠水县', '浠水', '421100', null, '中国,湖北省,黄冈市,浠水县', '3', '438200', '0713', 'Xishui', '115.2691300', '30.4526500');
INSERT INTO `sys_cn_area` VALUES ('421126', '蕲春县', '蕲春', '421100', null, '中国,湖北省,黄冈市,蕲春县', '3', '435300', '0713', 'Qichun', '115.4361500', '30.2261300');
INSERT INTO `sys_cn_area` VALUES ('421127', '黄梅县', '黄梅', '421100', null, '中国,湖北省,黄冈市,黄梅县', '3', '435500', '0713', 'Huangmei', '115.9442700', '30.0703300');
INSERT INTO `sys_cn_area` VALUES ('421181', '麻城市', '麻城', '421100', null, '中国,湖北省,黄冈市,麻城市', '3', '438300', '0713', 'Macheng', '115.0098800', '31.1722800');
INSERT INTO `sys_cn_area` VALUES ('421182', '武穴市', '武穴', '421100', null, '中国,湖北省,黄冈市,武穴市', '3', '435400', '0713', 'Wuxue', '115.5597500', '29.8444600');
INSERT INTO `sys_cn_area` VALUES ('421200', '咸宁市', '咸宁', '420000', null, '中国,湖北省,咸宁市', '2', '437000', '0715', 'Xianning', '114.3289630', '29.8327980');
INSERT INTO `sys_cn_area` VALUES ('421202', '咸安区', '咸安', '421200', null, '中国,湖北省,咸宁市,咸安区', '3', '437000', '0715', 'Xian\'an', '114.2987200', '29.8529000');
INSERT INTO `sys_cn_area` VALUES ('421221', '嘉鱼县', '嘉鱼', '421200', null, '中国,湖北省,咸宁市,嘉鱼县', '3', '437200', '0715', 'Jiayu', '113.9392700', '29.9705400');
INSERT INTO `sys_cn_area` VALUES ('421222', '通城县', '通城', '421200', null, '中国,湖北省,咸宁市,通城县', '3', '437400', '0715', 'Tongcheng', '113.8158200', '29.2456800');
INSERT INTO `sys_cn_area` VALUES ('421223', '崇阳县', '崇阳', '421200', null, '中国,湖北省,咸宁市,崇阳县', '3', '437500', '0715', 'Chongyang', '114.0398200', '29.5556400');
INSERT INTO `sys_cn_area` VALUES ('421224', '通山县', '通山', '421200', null, '中国,湖北省,咸宁市,通山县', '3', '437600', '0715', 'Tongshan', '114.4823900', '29.6063000');
INSERT INTO `sys_cn_area` VALUES ('421281', '赤壁市', '赤壁', '421200', null, '中国,湖北省,咸宁市,赤壁市', '3', '437300', '0715', 'Chibi', '113.9003900', '29.7245400');
INSERT INTO `sys_cn_area` VALUES ('421300', '随州市', '随州', '420000', null, '中国,湖北省,随州市', '2', '441300', '0722', 'Suizhou', '113.3737700', '31.7174970');
INSERT INTO `sys_cn_area` VALUES ('421303', '曾都区', '曾都', '421300', null, '中国,湖北省,随州市,曾都区', '3', '441300', '0722', 'Zengdu', '113.3712800', '31.7161400');
INSERT INTO `sys_cn_area` VALUES ('421321', '随县', '随县', '421300', null, '中国,湖北省,随州市,随县', '3', '441309', '0722', 'Suixian', '113.8266300', '31.6179000');
INSERT INTO `sys_cn_area` VALUES ('421381', '广水市', '广水', '421300', null, '中国,湖北省,随州市,广水市', '3', '432700', '0722', 'Guangshui', '113.8266300', '31.6179000');
INSERT INTO `sys_cn_area` VALUES ('422800', '恩施土家族苗族自治州', '恩施', '420000', null, '中国,湖北省,恩施土家族苗族自治州', '2', '445000', '0718', 'Enshi', '109.4869900', '30.2831140');
INSERT INTO `sys_cn_area` VALUES ('422801', '恩施市', '恩施', '422800', null, '中国,湖北省,恩施土家族苗族自治州,恩施市', '3', '445000', '0718', 'Enshi', '109.4794200', '30.2950200');
INSERT INTO `sys_cn_area` VALUES ('422802', '利川市', '利川', '422800', null, '中国,湖北省,恩施土家族苗族自治州,利川市', '3', '445400', '0718', 'Lichuan', '108.9359100', '30.2911700');
INSERT INTO `sys_cn_area` VALUES ('422822', '建始县', '建始', '422800', null, '中国,湖北省,恩施土家族苗族自治州,建始县', '3', '445300', '0718', 'Jianshi', '109.7220700', '30.6020900');
INSERT INTO `sys_cn_area` VALUES ('422823', '巴东县', '巴东', '422800', null, '中国,湖北省,恩施土家族苗族自治州,巴东县', '3', '444300', '0718', 'Badong', '110.3406600', '31.0423300');
INSERT INTO `sys_cn_area` VALUES ('422825', '宣恩县', '宣恩', '422800', null, '中国,湖北省,恩施土家族苗族自治州,宣恩县', '3', '445500', '0718', 'Xuanen', '109.4917900', '29.9871400');
INSERT INTO `sys_cn_area` VALUES ('422826', '咸丰县', '咸丰', '422800', null, '中国,湖北省,恩施土家族苗族自治州,咸丰县', '3', '445600', '0718', 'Xianfeng', '109.1520000', '29.6798300');
INSERT INTO `sys_cn_area` VALUES ('422827', '来凤县', '来凤', '422800', null, '中国,湖北省,恩施土家族苗族自治州,来凤县', '3', '445700', '0718', 'Laifeng', '109.4071600', '29.4937300');
INSERT INTO `sys_cn_area` VALUES ('422828', '鹤峰县', '鹤峰', '422800', null, '中国,湖北省,恩施土家族苗族自治州,鹤峰县', '3', '445800', '0718', 'Hefeng', '110.0309100', '29.8907200');
INSERT INTO `sys_cn_area` VALUES ('429000', '直辖县级', ' ', '420000', null, '中国,湖北省,直辖县级', '2', null, '', '', '114.2985720', '30.5843550');
INSERT INTO `sys_cn_area` VALUES ('429004', '仙桃市', '仙桃', '429000', null, '中国,湖北省,直辖县级,仙桃市', '3', '433000', '0728', 'Xiantao', '113.4539740', '30.3649530');
INSERT INTO `sys_cn_area` VALUES ('429005', '潜江市', '潜江', '429000', null, '中国,湖北省,直辖县级,潜江市', '3', '433100', '0728', 'Qianjiang', '112.8968660', '30.4212150');
INSERT INTO `sys_cn_area` VALUES ('429006', '天门市', '天门', '429000', null, '中国,湖北省,直辖县级,天门市', '3', '431700', '0728', 'Tianmen', '113.1658620', '30.6530610');
INSERT INTO `sys_cn_area` VALUES ('429021', '神农架林区', '神农架', '429000', null, '中国,湖北省,直辖县级,神农架林区', '3', '442400', '0719', 'Shennongjia', '110.6715250', '31.7444490');
INSERT INTO `sys_cn_area` VALUES ('430000', '湖南省', '湖南', '100000', null, '中国,湖南省', '1', null, '', 'Hunan', '112.9822790', '28.1940900');
INSERT INTO `sys_cn_area` VALUES ('430100', '长沙市', '长沙', '430000', null, '中国,湖南省,长沙市', '2', '410005', '0731', 'Changsha', '112.9822790', '28.1940900');
INSERT INTO `sys_cn_area` VALUES ('430102', '芙蓉区', '芙蓉', '430100', null, '中国,湖南省,长沙市,芙蓉区', '3', '410011', '0731', 'Furong', '113.0317600', '28.1844000');
INSERT INTO `sys_cn_area` VALUES ('430103', '天心区', '天心', '430100', null, '中国,湖南省,长沙市,天心区', '3', '410004', '0731', 'Tianxin', '112.9899100', '28.1127000');
INSERT INTO `sys_cn_area` VALUES ('430104', '岳麓区', '岳麓', '430100', null, '中国,湖南省,长沙市,岳麓区', '3', '410013', '0731', 'Yuelu', '112.9313300', '28.2351000');
INSERT INTO `sys_cn_area` VALUES ('430105', '开福区', '开福', '430100', null, '中国,湖南省,长沙市,开福区', '3', '410008', '0731', 'Kaifu', '112.9862300', '28.2558500');
INSERT INTO `sys_cn_area` VALUES ('430111', '雨花区', '雨花', '430100', null, '中国,湖南省,长沙市,雨花区', '3', '410011', '0731', 'Yuhua', '113.0356700', '28.1354100');
INSERT INTO `sys_cn_area` VALUES ('430112', '望城区', '望城', '430100', null, '中国,湖南省,长沙市,望城区', '3', '410200', '0731', 'Wangcheng', '112.8195490', '28.3474580');
INSERT INTO `sys_cn_area` VALUES ('430121', '长沙县', '长沙', '430100', null, '中国,湖南省,长沙市,长沙县', '3', '410100', '0731', 'Changsha', '113.0807100', '28.2459500');
INSERT INTO `sys_cn_area` VALUES ('430124', '宁乡县', '宁乡', '430100', null, '中国,湖南省,长沙市,宁乡县', '3', '410600', '0731', 'Ningxiang', '112.5574900', '28.2535800');
INSERT INTO `sys_cn_area` VALUES ('430181', '浏阳市', '浏阳', '430100', null, '中国,湖南省,长沙市,浏阳市', '3', '410300', '0731', 'Liuyang', '113.6431200', '28.1637500');
INSERT INTO `sys_cn_area` VALUES ('430200', '株洲市', '株洲', '430000', null, '中国,湖南省,株洲市', '2', '412000', '0731', 'Zhuzhou', '113.1517370', '27.8358060');
INSERT INTO `sys_cn_area` VALUES ('430202', '荷塘区', '荷塘', '430200', null, '中国,湖南省,株洲市,荷塘区', '3', '412000', '0731', 'Hetang', '113.1731500', '27.8556900');
INSERT INTO `sys_cn_area` VALUES ('430203', '芦淞区', '芦淞', '430200', null, '中国,湖南省,株洲市,芦淞区', '3', '412000', '0731', 'Lusong', '113.1556200', '27.7852500');
INSERT INTO `sys_cn_area` VALUES ('430204', '石峰区', '石峰', '430200', null, '中国,湖南省,株洲市,石峰区', '3', '412005', '0731', 'Shifeng', '113.1177600', '27.8755200');
INSERT INTO `sys_cn_area` VALUES ('430211', '天元区', '天元', '430200', null, '中国,湖南省,株洲市,天元区', '3', '412007', '0731', 'Tianyuan', '113.1233500', '27.8310300');
INSERT INTO `sys_cn_area` VALUES ('430221', '株洲县', '株洲', '430200', null, '中国,湖南省,株洲市,株洲县', '3', '412100', '0731', 'Zhuzhou', '113.1442800', '27.6982600');
INSERT INTO `sys_cn_area` VALUES ('430223', '攸县', '攸县', '430200', null, '中国,湖南省,株洲市,攸县', '3', '412300', '0731', 'Youxian', '113.3436500', '27.0035200');
INSERT INTO `sys_cn_area` VALUES ('430224', '茶陵县', '茶陵', '430200', null, '中国,湖南省,株洲市,茶陵县', '3', '412400', '0731', 'Chaling', '113.5436400', '26.7915000');
INSERT INTO `sys_cn_area` VALUES ('430225', '炎陵县', '炎陵', '430200', null, '中国,湖南省,株洲市,炎陵县', '3', '412500', '0731', 'Yanling', '113.7716300', '26.4881800');
INSERT INTO `sys_cn_area` VALUES ('430281', '醴陵市', '醴陵', '430200', null, '中国,湖南省,株洲市,醴陵市', '3', '412200', '0731', 'Liling', '113.4970400', '27.6461500');
INSERT INTO `sys_cn_area` VALUES ('430300', '湘潭市', '湘潭', '430000', null, '中国,湖南省,湘潭市', '2', '411100', '0731', 'Xiangtan', '112.9250830', '27.8467250');
INSERT INTO `sys_cn_area` VALUES ('430302', '雨湖区', '雨湖', '430300', null, '中国,湖南省,湘潭市,雨湖区', '3', '411100', '0731', 'Yuhu', '112.9039900', '27.8685900');
INSERT INTO `sys_cn_area` VALUES ('430304', '岳塘区', '岳塘', '430300', null, '中国,湖南省,湘潭市,岳塘区', '3', '411101', '0731', 'Yuetang', '112.9606000', '27.8578400');
INSERT INTO `sys_cn_area` VALUES ('430321', '湘潭县', '湘潭', '430300', null, '中国,湖南省,湘潭市,湘潭县', '3', '411228', '0731', 'Xiangtan', '112.9508000', '27.7789300');
INSERT INTO `sys_cn_area` VALUES ('430381', '湘乡市', '湘乡', '430300', null, '中国,湖南省,湘潭市,湘乡市', '3', '411400', '0731', 'Xiangxiang', '112.5351200', '27.7354300');
INSERT INTO `sys_cn_area` VALUES ('430382', '韶山市', '韶山', '430300', null, '中国,湖南省,湘潭市,韶山市', '3', '411300', '0731', 'Shaoshan', '112.5265500', '27.9150300');
INSERT INTO `sys_cn_area` VALUES ('430400', '衡阳市', '衡阳', '430000', null, '中国,湖南省,衡阳市', '2', '421001', '0734', 'Hengyang', '112.6076930', '26.9003580');
INSERT INTO `sys_cn_area` VALUES ('430405', '珠晖区', '珠晖', '430400', null, '中国,湖南省,衡阳市,珠晖区', '3', '421002', '0734', 'Zhuhui', '112.6205400', '26.8936100');
INSERT INTO `sys_cn_area` VALUES ('430406', '雁峰区', '雁峰', '430400', null, '中国,湖南省,衡阳市,雁峰区', '3', '421001', '0734', 'Yanfeng', '112.6165400', '26.8886600');
INSERT INTO `sys_cn_area` VALUES ('430407', '石鼓区', '石鼓', '430400', null, '中国,湖南省,衡阳市,石鼓区', '3', '421005', '0734', 'Shigu', '112.6106900', '26.9023200');
INSERT INTO `sys_cn_area` VALUES ('430408', '蒸湘区', '蒸湘', '430400', null, '中国,湖南省,衡阳市,蒸湘区', '3', '421001', '0734', 'Zhengxiang', '112.6033000', '26.8965100');
INSERT INTO `sys_cn_area` VALUES ('430412', '南岳区', '南岳', '430400', null, '中国,湖南省,衡阳市,南岳区', '3', '421900', '0734', 'Nanyue', '112.7384000', '27.2326200');
INSERT INTO `sys_cn_area` VALUES ('430421', '衡阳县', '衡阳', '430400', null, '中国,湖南省,衡阳市,衡阳县', '3', '421200', '0734', 'Hengyang', '112.3708800', '26.9706000');
INSERT INTO `sys_cn_area` VALUES ('430422', '衡南县', '衡南', '430400', null, '中国,湖南省,衡阳市,衡南县', '3', '421131', '0734', 'Hengnan', '112.6778800', '26.7382800');
INSERT INTO `sys_cn_area` VALUES ('430423', '衡山县', '衡山', '430400', null, '中国,湖南省,衡阳市,衡山县', '3', '421300', '0734', 'Hengshan', '112.8677600', '27.2313400');
INSERT INTO `sys_cn_area` VALUES ('430424', '衡东县', '衡东', '430400', null, '中国,湖南省,衡阳市,衡东县', '3', '421400', '0734', 'Hengdong', '112.9483300', '27.0809300');
INSERT INTO `sys_cn_area` VALUES ('430426', '祁东县', '祁东', '430400', null, '中国,湖南省,衡阳市,祁东县', '3', '421600', '0734', 'Qidong', '112.0903900', '26.7996400');
INSERT INTO `sys_cn_area` VALUES ('430481', '耒阳市', '耒阳', '430400', null, '中国,湖南省,衡阳市,耒阳市', '3', '421800', '0734', 'Leiyang', '112.8599800', '26.4213200');
INSERT INTO `sys_cn_area` VALUES ('430482', '常宁市', '常宁', '430400', null, '中国,湖南省,衡阳市,常宁市', '3', '421500', '0734', 'Changning', '112.4009000', '26.4069200');
INSERT INTO `sys_cn_area` VALUES ('430500', '邵阳市', '邵阳', '430000', null, '中国,湖南省,邵阳市', '2', '422000', '0739', 'Shaoyang', '111.4692300', '27.2378420');
INSERT INTO `sys_cn_area` VALUES ('430502', '双清区', '双清', '430500', null, '中国,湖南省,邵阳市,双清区', '3', '422001', '0739', 'Shuangqing', '111.4971500', '27.2329100');
INSERT INTO `sys_cn_area` VALUES ('430503', '大祥区', '大祥', '430500', null, '中国,湖南省,邵阳市,大祥区', '3', '422000', '0739', 'Daxiang', '111.4541200', '27.2333200');
INSERT INTO `sys_cn_area` VALUES ('430511', '北塔区', '北塔', '430500', null, '中国,湖南省,邵阳市,北塔区', '3', '422007', '0739', 'Beita', '111.4521900', '27.2464800');
INSERT INTO `sys_cn_area` VALUES ('430521', '邵东县', '邵东', '430500', null, '中国,湖南省,邵阳市,邵东县', '3', '422800', '0739', 'Shaodong', '111.7444100', '27.2584000');
INSERT INTO `sys_cn_area` VALUES ('430522', '新邵县', '新邵', '430500', null, '中国,湖南省,邵阳市,新邵县', '3', '422900', '0739', 'Xinshao', '111.4606600', '27.3216900');
INSERT INTO `sys_cn_area` VALUES ('430523', '邵阳县', '邵阳', '430500', null, '中国,湖南省,邵阳市,邵阳县', '3', '422100', '0739', 'Shaoyang', '111.2745900', '26.9914300');
INSERT INTO `sys_cn_area` VALUES ('430524', '隆回县', '隆回', '430500', null, '中国,湖南省,邵阳市,隆回县', '3', '422200', '0739', 'Longhui', '111.0321600', '27.1093700');
INSERT INTO `sys_cn_area` VALUES ('430525', '洞口县', '洞口', '430500', null, '中国,湖南省,邵阳市,洞口县', '3', '422300', '0739', 'Dongkou', '110.5738800', '27.0546200');
INSERT INTO `sys_cn_area` VALUES ('430527', '绥宁县', '绥宁', '430500', null, '中国,湖南省,邵阳市,绥宁县', '3', '422600', '0739', 'Suining', '110.1557600', '26.5863600');
INSERT INTO `sys_cn_area` VALUES ('430528', '新宁县', '新宁', '430500', null, '中国,湖南省,邵阳市,新宁县', '3', '422700', '0739', 'Xinning', '110.8513100', '26.4293600');
INSERT INTO `sys_cn_area` VALUES ('430529', '城步苗族自治县', '城步', '430500', null, '中国,湖南省,邵阳市,城步苗族自治县', '3', '422500', '0739', 'Chengbu', '110.3222000', '26.3904800');
INSERT INTO `sys_cn_area` VALUES ('430581', '武冈市', '武冈', '430500', null, '中国,湖南省,邵阳市,武冈市', '3', '422400', '0739', 'Wugang', '110.6328100', '26.7281700');
INSERT INTO `sys_cn_area` VALUES ('430600', '岳阳市', '岳阳', '430000', null, '中国,湖南省,岳阳市', '2', '414000', '0730', 'Yueyang', '113.1328550', '29.3702900');
INSERT INTO `sys_cn_area` VALUES ('430602', '岳阳楼区', '岳阳楼', '430600', null, '中国,湖南省,岳阳市,岳阳楼区', '3', '414000', '0730', 'Yueyanglou', '113.1294200', '29.3719000');
INSERT INTO `sys_cn_area` VALUES ('430603', '云溪区', '云溪', '430600', null, '中国,湖南省,岳阳市,云溪区', '3', '414009', '0730', 'Yunxi', '113.2771300', '29.4735700');
INSERT INTO `sys_cn_area` VALUES ('430611', '君山区', '君山', '430600', null, '中国,湖南省,岳阳市,君山区', '3', '414005', '0730', 'Junshan', '113.0043900', '29.4594100');
INSERT INTO `sys_cn_area` VALUES ('430621', '岳阳县', '岳阳', '430600', null, '中国,湖南省,岳阳市,岳阳县', '3', '414100', '0730', 'Yueyang', '113.1198700', '29.1431400');
INSERT INTO `sys_cn_area` VALUES ('430623', '华容县', '华容', '430600', null, '中国,湖南省,岳阳市,华容县', '3', '414200', '0730', 'Huarong', '112.5408900', '29.5301900');
INSERT INTO `sys_cn_area` VALUES ('430624', '湘阴县', '湘阴', '430600', null, '中国,湖南省,岳阳市,湘阴县', '3', '414600', '0730', 'Xiangyin', '112.9091100', '28.6892200');
INSERT INTO `sys_cn_area` VALUES ('430626', '平江县', '平江', '430600', null, '中国,湖南省,岳阳市,平江县', '3', '414500', '0730', 'Pingjiang', '113.5810500', '28.7066400');
INSERT INTO `sys_cn_area` VALUES ('430681', '汨罗市', '汨罗', '430600', null, '中国,湖南省,岳阳市,汨罗市', '3', '414400', '0730', 'Miluo', '113.0670700', '28.8063100');
INSERT INTO `sys_cn_area` VALUES ('430682', '临湘市', '临湘', '430600', null, '中国,湖南省,岳阳市,临湘市', '3', '414300', '0730', 'Linxiang', '113.4501000', '29.4770100');
INSERT INTO `sys_cn_area` VALUES ('430700', '常德市', '常德', '430000', null, '中国,湖南省,常德市', '2', '415000', '0736', 'Changde', '111.6913470', '29.0402250');
INSERT INTO `sys_cn_area` VALUES ('430702', '武陵区', '武陵', '430700', null, '中国,湖南省,常德市,武陵区', '3', '415000', '0736', 'Wuling', '111.6979100', '29.0287600');
INSERT INTO `sys_cn_area` VALUES ('430703', '鼎城区', '鼎城', '430700', null, '中国,湖南省,常德市,鼎城区', '3', '415101', '0736', 'Dingcheng', '111.6807800', '29.0185900');
INSERT INTO `sys_cn_area` VALUES ('430721', '安乡县', '安乡', '430700', null, '中国,湖南省,常德市,安乡县', '3', '415600', '0736', 'Anxiang', '112.1673200', '29.4132600');
INSERT INTO `sys_cn_area` VALUES ('430722', '汉寿县', '汉寿', '430700', null, '中国,湖南省,常德市,汉寿县', '3', '415900', '0736', 'Hanshou', '111.9669100', '28.9029900');
INSERT INTO `sys_cn_area` VALUES ('430723', '澧县', '澧县', '430700', null, '中国,湖南省,常德市,澧县', '3', '415500', '0736', 'Lixian', '111.7586600', '29.6331700');
INSERT INTO `sys_cn_area` VALUES ('430724', '临澧县', '临澧', '430700', null, '中国,湖南省,常德市,临澧县', '3', '415200', '0736', 'Linli', '111.6516100', '29.4416300');
INSERT INTO `sys_cn_area` VALUES ('430725', '桃源县', '桃源', '430700', null, '中国,湖南省,常德市,桃源县', '3', '415700', '0736', 'Taoyuan', '111.4889200', '28.9047400');
INSERT INTO `sys_cn_area` VALUES ('430726', '石门县', '石门', '430700', null, '中国,湖南省,常德市,石门县', '3', '415300', '0736', 'Shimen', '111.3796600', '29.5842400');
INSERT INTO `sys_cn_area` VALUES ('430781', '津市市', '津市', '430700', null, '中国,湖南省,常德市,津市市', '3', '415400', '0736', 'Jinshi', '111.8775600', '29.6056300');
INSERT INTO `sys_cn_area` VALUES ('430800', '张家界市', '张家界', '430000', null, '中国,湖南省,张家界市', '2', '427000', '0744', 'Zhangjiajie', '110.4799210', '29.1274010');
INSERT INTO `sys_cn_area` VALUES ('430802', '永定区', '永定', '430800', null, '中国,湖南省,张家界市,永定区', '3', '427000', '0744', 'Yongding', '110.4746400', '29.1338700');
INSERT INTO `sys_cn_area` VALUES ('430811', '武陵源区', '武陵源', '430800', null, '中国,湖南省,张家界市,武陵源区', '3', '427400', '0744', 'Wulingyuan', '110.5502600', '29.3457400');
INSERT INTO `sys_cn_area` VALUES ('430821', '慈利县', '慈利', '430800', null, '中国,湖南省,张家界市,慈利县', '3', '427200', '0744', 'Cili', '111.1394600', '29.4298900');
INSERT INTO `sys_cn_area` VALUES ('430822', '桑植县', '桑植', '430800', null, '中国,湖南省,张家界市,桑植县', '3', '427100', '0744', 'Sangzhi', '110.1630800', '29.3981500');
INSERT INTO `sys_cn_area` VALUES ('430900', '益阳市', '益阳', '430000', null, '中国,湖南省,益阳市', '2', '413000', '0737', 'Yiyang', '112.3550420', '28.5700660');
INSERT INTO `sys_cn_area` VALUES ('430902', '资阳区', '资阳', '430900', null, '中国,湖南省,益阳市,资阳区', '3', '413001', '0737', 'Ziyang', '112.3244700', '28.5909500');
INSERT INTO `sys_cn_area` VALUES ('430903', '赫山区', '赫山', '430900', null, '中国,湖南省,益阳市,赫山区', '3', '413002', '0737', 'Heshan', '112.3726500', '28.5742500');
INSERT INTO `sys_cn_area` VALUES ('430921', '南县', '南县', '430900', null, '中国,湖南省,益阳市,南县', '3', '413200', '0737', 'Nanxian', '112.3963000', '29.3615900');
INSERT INTO `sys_cn_area` VALUES ('430922', '桃江县', '桃江', '430900', null, '中国,湖南省,益阳市,桃江县', '3', '413400', '0737', 'Taojiang', '112.1557000', '28.5181400');
INSERT INTO `sys_cn_area` VALUES ('430923', '安化县', '安化', '430900', null, '中国,湖南省,益阳市,安化县', '3', '413500', '0737', 'Anhua', '111.2129800', '28.3742400');
INSERT INTO `sys_cn_area` VALUES ('430981', '沅江市', '沅江', '430900', null, '中国,湖南省,益阳市,沅江市', '3', '413100', '0737', 'Yuanjiang', '112.3542700', '28.8440300');
INSERT INTO `sys_cn_area` VALUES ('431000', '郴州市', '郴州', '430000', null, '中国,湖南省,郴州市', '2', '423000', '0735', 'Chenzhou', '113.0320670', '25.7935890');
INSERT INTO `sys_cn_area` VALUES ('431002', '北湖区', '北湖', '431000', null, '中国,湖南省,郴州市,北湖区', '3', '423000', '0735', 'Beihu', '113.0110300', '25.7840500');
INSERT INTO `sys_cn_area` VALUES ('431003', '苏仙区', '苏仙', '431000', null, '中国,湖南省,郴州市,苏仙区', '3', '423000', '0735', 'Suxian', '113.0422600', '25.8004500');
INSERT INTO `sys_cn_area` VALUES ('431021', '桂阳县', '桂阳', '431000', null, '中国,湖南省,郴州市,桂阳县', '3', '424400', '0735', 'Guiyang', '112.7336400', '25.7540600');
INSERT INTO `sys_cn_area` VALUES ('431022', '宜章县', '宜章', '431000', null, '中国,湖南省,郴州市,宜章县', '3', '424200', '0735', 'Yizhang', '112.9514700', '25.3993100');
INSERT INTO `sys_cn_area` VALUES ('431023', '永兴县', '永兴', '431000', null, '中国,湖南省,郴州市,永兴县', '3', '423300', '0735', 'Yongxing', '113.1124200', '26.1264600');
INSERT INTO `sys_cn_area` VALUES ('431024', '嘉禾县', '嘉禾', '431000', null, '中国,湖南省,郴州市,嘉禾县', '3', '424500', '0735', 'Jiahe', '112.3693500', '25.5879500');
INSERT INTO `sys_cn_area` VALUES ('431025', '临武县', '临武', '431000', null, '中国,湖南省,郴州市,临武县', '3', '424300', '0735', 'Linwu', '112.5636900', '25.2760200');
INSERT INTO `sys_cn_area` VALUES ('431026', '汝城县', '汝城', '431000', null, '中国,湖南省,郴州市,汝城县', '3', '424100', '0735', 'Rucheng', '113.6858200', '25.5520400');
INSERT INTO `sys_cn_area` VALUES ('431027', '桂东县', '桂东', '431000', null, '中国,湖南省,郴州市,桂东县', '3', '423500', '0735', 'Guidong', '113.9468000', '26.0798700');
INSERT INTO `sys_cn_area` VALUES ('431028', '安仁县', '安仁', '431000', null, '中国,湖南省,郴州市,安仁县', '3', '423600', '0735', 'Anren', '113.2694400', '26.7093100');
INSERT INTO `sys_cn_area` VALUES ('431081', '资兴市', '资兴', '431000', null, '中国,湖南省,郴州市,资兴市', '3', '423400', '0735', 'Zixing', '113.2372400', '25.9766800');
INSERT INTO `sys_cn_area` VALUES ('431100', '永州市', '永州', '430000', null, '中国,湖南省,永州市', '2', '425000', '0746', 'Yongzhou', '111.6080190', '26.4345160');
INSERT INTO `sys_cn_area` VALUES ('431102', '零陵区', '零陵', '431100', null, '中国,湖南省,永州市,零陵区', '3', '425100', '0746', 'Lingling', '111.6210300', '26.2210900');
INSERT INTO `sys_cn_area` VALUES ('431103', '冷水滩区', '冷水滩', '431100', null, '中国,湖南省,永州市,冷水滩区', '3', '425100', '0746', 'Lengshuitan', '111.5921400', '26.4610700');
INSERT INTO `sys_cn_area` VALUES ('431121', '祁阳县', '祁阳', '431100', null, '中国,湖南省,永州市,祁阳县', '3', '426100', '0746', 'Qiyang', '111.8401100', '26.5800900');
INSERT INTO `sys_cn_area` VALUES ('431122', '东安县', '东安', '431100', null, '中国,湖南省,永州市,东安县', '3', '425900', '0746', 'Dong\'an', '111.3164000', '26.3920200');
INSERT INTO `sys_cn_area` VALUES ('431123', '双牌县', '双牌', '431100', null, '中国,湖南省,永州市,双牌县', '3', '425200', '0746', 'Shuangpai', '111.6592700', '25.9598800');
INSERT INTO `sys_cn_area` VALUES ('431124', '道县', '道县', '431100', null, '中国,湖南省,永州市,道县', '3', '425300', '0746', 'Daoxian', '111.6019500', '25.5276600');
INSERT INTO `sys_cn_area` VALUES ('431125', '江永县', '江永', '431100', null, '中国,湖南省,永州市,江永县', '3', '425400', '0746', 'Jiangyong', '111.3408200', '25.2723300');
INSERT INTO `sys_cn_area` VALUES ('431126', '宁远县', '宁远', '431100', null, '中国,湖南省,永州市,宁远县', '3', '425600', '0746', 'Ningyuan', '111.9462500', '25.5691300');
INSERT INTO `sys_cn_area` VALUES ('431127', '蓝山县', '蓝山', '431100', null, '中国,湖南省,永州市,蓝山县', '3', '425800', '0746', 'Lanshan', '112.1936300', '25.3679400');
INSERT INTO `sys_cn_area` VALUES ('431128', '新田县', '新田', '431100', null, '中国,湖南省,永州市,新田县', '3', '425700', '0746', 'Xintian', '112.2210300', '25.9095000');
INSERT INTO `sys_cn_area` VALUES ('431129', '江华瑶族自治县', '江华', '431100', null, '中国,湖南省,永州市,江华瑶族自治县', '3', '425500', '0746', 'Jianghua', '111.5884700', '25.1845000');
INSERT INTO `sys_cn_area` VALUES ('431200', '怀化市', '怀化', '430000', null, '中国,湖南省,怀化市', '2', '418000', '0745', 'Huaihua', '109.9782400', '27.5500820');
INSERT INTO `sys_cn_area` VALUES ('431202', '鹤城区', '鹤城', '431200', null, '中国,湖南省,怀化市,鹤城区', '3', '418000', '0745', 'Hecheng', '109.9650900', '27.5494200');
INSERT INTO `sys_cn_area` VALUES ('431221', '中方县', '中方', '431200', null, '中国,湖南省,怀化市,中方县', '3', '418005', '0745', 'Zhongfang', '109.9449700', '27.4398800');
INSERT INTO `sys_cn_area` VALUES ('431222', '沅陵县', '沅陵', '431200', null, '中国,湖南省,怀化市,沅陵县', '3', '419600', '0745', 'Yuanling', '110.3963300', '28.4554800');
INSERT INTO `sys_cn_area` VALUES ('431223', '辰溪县', '辰溪', '431200', null, '中国,湖南省,怀化市,辰溪县', '3', '419500', '0745', 'Chenxi', '110.1894200', '28.0040600');
INSERT INTO `sys_cn_area` VALUES ('431224', '溆浦县', '溆浦', '431200', null, '中国,湖南省,怀化市,溆浦县', '3', '419300', '0745', 'Xupu', '110.5938400', '27.9083600');
INSERT INTO `sys_cn_area` VALUES ('431225', '会同县', '会同', '431200', null, '中国,湖南省,怀化市,会同县', '3', '418300', '0745', 'Huitong', '109.7356800', '26.8871600');
INSERT INTO `sys_cn_area` VALUES ('431226', '麻阳苗族自治县', '麻阳', '431200', null, '中国,湖南省,怀化市,麻阳苗族自治县', '3', '419400', '0745', 'Mayang', '109.8019400', '27.8660000');
INSERT INTO `sys_cn_area` VALUES ('431227', '新晃侗族自治县', '新晃', '431200', null, '中国,湖南省,怀化市,新晃侗族自治县', '3', '419200', '0745', 'Xinhuang', '109.1716600', '27.3593700');
INSERT INTO `sys_cn_area` VALUES ('431228', '芷江侗族自治县', '芷江', '431200', null, '中国,湖南省,怀化市,芷江侗族自治县', '3', '419100', '0745', 'Zhijiang', '109.6849000', '27.4429700');
INSERT INTO `sys_cn_area` VALUES ('431229', '靖州苗族侗族自治县', '靖州', '431200', null, '中国,湖南省,怀化市,靖州苗族侗族自治县', '3', '418400', '0745', 'Jingzhou', '109.6982100', '26.5765100');
INSERT INTO `sys_cn_area` VALUES ('431230', '通道侗族自治县', '通道', '431200', null, '中国,湖南省,怀化市,通道侗族自治县', '3', '418500', '0745', 'Tongdao', '109.7851500', '26.1571000');
INSERT INTO `sys_cn_area` VALUES ('431281', '洪江市', '洪江', '431200', null, '中国,湖南省,怀化市,洪江市', '3', '418100', '0745', 'Hongjiang', '109.8365100', '27.2092200');
INSERT INTO `sys_cn_area` VALUES ('431300', '娄底市', '娄底', '430000', null, '中国,湖南省,娄底市', '2', '417000', '0738', 'Loudi', '112.0084970', '27.7281360');
INSERT INTO `sys_cn_area` VALUES ('431302', '娄星区', '娄星', '431300', null, '中国,湖南省,娄底市,娄星区', '3', '417000', '0738', 'Louxing', '112.0019300', '27.7299200');
INSERT INTO `sys_cn_area` VALUES ('431321', '双峰县', '双峰', '431300', null, '中国,湖南省,娄底市,双峰县', '3', '417700', '0738', 'Shuangfeng', '112.1992100', '27.4541800');
INSERT INTO `sys_cn_area` VALUES ('431322', '新化县', '新化', '431300', null, '中国,湖南省,娄底市,新化县', '3', '417600', '0738', 'Xinhua', '111.3273900', '27.7266000');
INSERT INTO `sys_cn_area` VALUES ('431381', '冷水江市', '冷水江', '431300', null, '中国,湖南省,娄底市,冷水江市', '3', '417500', '0738', 'Lengshuijiang', '111.4355400', '27.6814700');
INSERT INTO `sys_cn_area` VALUES ('431382', '涟源市', '涟源', '431300', null, '中国,湖南省,娄底市,涟源市', '3', '417100', '0738', 'Lianyuan', '111.6723300', '27.6883100');
INSERT INTO `sys_cn_area` VALUES ('433100', '湘西土家族苗族自治州', '湘西', '430000', null, '中国,湖南省,湘西土家族苗族自治州', '2', '416000', '0743', 'Xiangxi', '109.7397350', '28.3142960');
INSERT INTO `sys_cn_area` VALUES ('433101', '吉首市', '吉首', '433100', null, '中国,湖南省,湘西土家族苗族自治州,吉首市', '3', '416000', '0743', 'Jishou', '109.6979900', '28.2624700');
INSERT INTO `sys_cn_area` VALUES ('433122', '泸溪县', '泸溪', '433100', null, '中国,湖南省,湘西土家族苗族自治州,泸溪县', '3', '416100', '0743', 'Luxi', '110.2168200', '28.2205000');
INSERT INTO `sys_cn_area` VALUES ('433123', '凤凰县', '凤凰', '433100', null, '中国,湖南省,湘西土家族苗族自治州,凤凰县', '3', '416200', '0743', 'Fenghuang', '109.6015600', '27.9482200');
INSERT INTO `sys_cn_area` VALUES ('433124', '花垣县', '花垣', '433100', null, '中国,湖南省,湘西土家族苗族自治州,花垣县', '3', '416400', '0743', 'Huayuan', '109.4821700', '28.5721000');
INSERT INTO `sys_cn_area` VALUES ('433125', '保靖县', '保靖', '433100', null, '中国,湖南省,湘西土家族苗族自治州,保靖县', '3', '416500', '0743', 'Baojing', '109.6604900', '28.6999700');
INSERT INTO `sys_cn_area` VALUES ('433126', '古丈县', '古丈', '433100', null, '中国,湖南省,湘西土家族苗族自治州,古丈县', '3', '416300', '0743', 'Guzhang', '109.9481200', '28.6194400');
INSERT INTO `sys_cn_area` VALUES ('433127', '永顺县', '永顺', '433100', null, '中国,湖南省,湘西土家族苗族自治州,永顺县', '3', '416700', '0743', 'Yongshun', '109.8526600', '29.0010300');
INSERT INTO `sys_cn_area` VALUES ('433130', '龙山县', '龙山', '433100', null, '中国,湖南省,湘西土家族苗族自治州,龙山县', '3', '416800', '0743', 'Longshan', '109.4432000', '29.4569300');
INSERT INTO `sys_cn_area` VALUES ('440000', '广东省', '广东', '100000', null, '中国,广东省', '1', null, '', 'Guangdong', '113.2806370', '23.1251780');
INSERT INTO `sys_cn_area` VALUES ('440100', '广州市', '广州', '440000', null, '中国,广东省,广州市', '2', '510032', '020', 'Guangzhou', '113.2806370', '23.1251780');
INSERT INTO `sys_cn_area` VALUES ('440103', '荔湾区', '荔湾', '440100', null, '中国,广东省,广州市,荔湾区', '3', '510170', '020', 'Liwan', '113.2442000', '23.1259200');
INSERT INTO `sys_cn_area` VALUES ('440104', '越秀区', '越秀', '440100', null, '中国,广东省,广州市,越秀区', '3', '510030', '020', 'Yuexiu', '113.2668300', '23.1289700');
INSERT INTO `sys_cn_area` VALUES ('440105', '海珠区', '海珠', '440100', null, '中国,广东省,广州市,海珠区', '3', '510300', '020', 'Haizhu', '113.2619700', '23.1037900');
INSERT INTO `sys_cn_area` VALUES ('440106', '天河区', '天河', '440100', null, '中国,广东省,广州市,天河区', '3', '510665', '020', 'Tianhe', '113.3611200', '23.1246700');
INSERT INTO `sys_cn_area` VALUES ('440111', '白云区', '白云', '440100', null, '中国,广东省,广州市,白云区', '3', '510405', '020', 'Baiyun', '113.2730700', '23.1578700');
INSERT INTO `sys_cn_area` VALUES ('440112', '黄埔区', '黄埔', '440100', null, '中国,广东省,广州市,黄埔区', '3', '510700', '020', 'Huangpu', '113.4589500', '23.1064200');
INSERT INTO `sys_cn_area` VALUES ('440113', '番禺区', '番禺', '440100', null, '中国,广东省,广州市,番禺区', '3', '511400', '020', 'Panyu', '113.3839700', '22.9359900');
INSERT INTO `sys_cn_area` VALUES ('440114', '花都区', '花都', '440100', null, '中国,广东省,广州市,花都区', '3', '510800', '020', 'Huadu', '113.2203300', '23.4035800');
INSERT INTO `sys_cn_area` VALUES ('440115', '南沙区', '南沙', '440100', null, '中国,广东省,广州市,南沙区', '3', '511458', '020', 'Nansha', '113.6084500', '22.7714400');
INSERT INTO `sys_cn_area` VALUES ('440117', '从化区', '从化', '440100', null, '中国,广东省,广州市,从化区', '3', '510900', '020', 'Conghua', '113.5873860', '23.5452830');
INSERT INTO `sys_cn_area` VALUES ('440118', '增城区', '增城', '440100', null, '中国,广东省,广州市,增城区', '3', '511300', '020', 'Zengcheng', '113.8295790', '23.2904970');
INSERT INTO `sys_cn_area` VALUES ('440200', '韶关市', '韶关', '440000', null, '中国,广东省,韶关市', '2', '512002', '0751', 'Shaoguan', '113.5915440', '24.8013220');
INSERT INTO `sys_cn_area` VALUES ('440203', '武江区', '武江', '440200', null, '中国,广东省,韶关市,武江区', '3', '512026', '0751', 'Wujiang', '113.5876700', '24.7926400');
INSERT INTO `sys_cn_area` VALUES ('440204', '浈江区', '浈江', '440200', null, '中国,广东省,韶关市,浈江区', '3', '512023', '0751', 'Zhenjiang', '113.6110900', '24.8043800');
INSERT INTO `sys_cn_area` VALUES ('440205', '曲江区', '曲江', '440200', null, '中国,广东省,韶关市,曲江区', '3', '512101', '0751', 'Qujiang', '113.6016500', '24.6791500');
INSERT INTO `sys_cn_area` VALUES ('440222', '始兴县', '始兴', '440200', null, '中国,广东省,韶关市,始兴县', '3', '512500', '0751', 'Shixing', '114.0679900', '24.9475900');
INSERT INTO `sys_cn_area` VALUES ('440224', '仁化县', '仁化', '440200', null, '中国,广东省,韶关市,仁化县', '3', '512300', '0751', 'Renhua', '113.7473700', '25.0874200');
INSERT INTO `sys_cn_area` VALUES ('440229', '翁源县', '翁源', '440200', null, '中国,广东省,韶关市,翁源县', '3', '512600', '0751', 'Wengyuan', '114.1338500', '24.3495000');
INSERT INTO `sys_cn_area` VALUES ('440232', '乳源瑶族自治县', '乳源', '440200', null, '中国,广东省,韶关市,乳源瑶族自治县', '3', '512700', '0751', 'Ruyuan', '113.2773400', '24.7780300');
INSERT INTO `sys_cn_area` VALUES ('440233', '新丰县', '新丰', '440200', null, '中国,广东省,韶关市,新丰县', '3', '511100', '0751', 'Xinfeng', '114.2078800', '24.0592400');
INSERT INTO `sys_cn_area` VALUES ('440281', '乐昌市', '乐昌', '440200', null, '中国,广东省,韶关市,乐昌市', '3', '512200', '0751', 'Lechang', '113.3565300', '25.1279900');
INSERT INTO `sys_cn_area` VALUES ('440282', '南雄市', '南雄', '440200', null, '中国,广东省,韶关市,南雄市', '3', '512400', '0751', 'Nanxiong', '114.3096600', '25.1170600');
INSERT INTO `sys_cn_area` VALUES ('440300', '深圳市', '深圳', '440000', null, '中国,广东省,深圳市', '2', '518035', '0755', 'Shenzhen', '114.0859470', '22.5470000');
INSERT INTO `sys_cn_area` VALUES ('440303', '罗湖区', '罗湖', '440300', null, '中国,广东省,深圳市,罗湖区', '3', '518021', '0755', 'Luohu', '114.1311600', '22.5483600');
INSERT INTO `sys_cn_area` VALUES ('440304', '福田区', '福田', '440300', null, '中国,广东省,深圳市,福田区', '3', '518048', '0755', 'Futian', '114.0557100', '22.5224500');
INSERT INTO `sys_cn_area` VALUES ('440305', '南山区', '南山', '440300', null, '中国,广东省,深圳市,南山区', '3', '518051', '0755', 'Nanshan', '113.9302900', '22.5329100');
INSERT INTO `sys_cn_area` VALUES ('440306', '宝安区', '宝安', '440300', null, '中国,广东省,深圳市,宝安区', '3', '518101', '0755', 'Bao\'an', '113.8831100', '22.5537100');
INSERT INTO `sys_cn_area` VALUES ('440307', '龙岗区', '龙岗', '440300', null, '中国,广东省,深圳市,龙岗区', '3', '518172', '0755', 'Longgang', '114.2477100', '22.7198600');
INSERT INTO `sys_cn_area` VALUES ('440308', '盐田区', '盐田', '440300', null, '中国,广东省,深圳市,盐田区', '3', '518081', '0755', 'Yantian', '114.2373300', '22.5578000');
INSERT INTO `sys_cn_area` VALUES ('440309', '光明新区', '光明新区', '440300', null, '中国,广东省,深圳市,光明新区', '3', '518100', '0755', 'Guangmingxinqu', '113.8960260', '22.7772920');
INSERT INTO `sys_cn_area` VALUES ('440310', '坪山新区', '坪山新区', '440300', null, '中国,广东省,深圳市,坪山新区', '3', '518000', '0755', 'Pingshanxinqu', '114.3463700', '22.6905290');
INSERT INTO `sys_cn_area` VALUES ('440311', '大鹏新区', '大鹏新区', '440300', null, '中国,广东省,深圳市,大鹏新区', '3', '518000', '0755', 'Dapengxinqu', '114.4799010', '22.5878620');
INSERT INTO `sys_cn_area` VALUES ('440312', '龙华新区', '龙华新区', '440300', null, '中国,广东省,深圳市,龙华新区', '3', '518100', '0755', 'Longhuaxinqu', '114.0365850', '22.6869500');
INSERT INTO `sys_cn_area` VALUES ('440400', '珠海市', '珠海', '440000', null, '中国,广东省,珠海市', '2', '519000', '0756', 'Zhuhai', '113.5527240', '22.2558990');
INSERT INTO `sys_cn_area` VALUES ('440402', '香洲区', '香洲', '440400', null, '中国,广东省,珠海市,香洲区', '3', '519000', '0756', 'Xiangzhou', '113.5435000', '22.2665400');
INSERT INTO `sys_cn_area` VALUES ('440403', '斗门区', '斗门', '440400', null, '中国,广东省,珠海市,斗门区', '3', '519110', '0756', 'Doumen', '113.2964400', '22.2089800');
INSERT INTO `sys_cn_area` VALUES ('440404', '金湾区', '金湾', '440400', null, '中国,广东省,珠海市,金湾区', '3', '519040', '0756', 'Jinwan', '113.3636100', '22.1469100');
INSERT INTO `sys_cn_area` VALUES ('440500', '汕头市', '汕头', '440000', null, '中国,广东省,汕头市', '2', '515041', '0754', 'Shantou', '116.7084630', '23.3710200');
INSERT INTO `sys_cn_area` VALUES ('440507', '龙湖区', '龙湖', '440500', null, '中国,广东省,汕头市,龙湖区', '3', '515041', '0754', 'Longhu', '116.7164100', '23.3716600');
INSERT INTO `sys_cn_area` VALUES ('440511', '金平区', '金平', '440500', null, '中国,广东省,汕头市,金平区', '3', '515041', '0754', 'Jinping', '116.7036400', '23.3663700');
INSERT INTO `sys_cn_area` VALUES ('440512', '濠江区', '濠江', '440500', null, '中国,广东省,汕头市,濠江区', '3', '515071', '0754', 'Haojiang', '116.7265900', '23.2858800');
INSERT INTO `sys_cn_area` VALUES ('440513', '潮阳区', '潮阳', '440500', null, '中国,广东省,汕头市,潮阳区', '3', '515100', '0754', 'Chaoyang', '116.6015000', '23.2648500');
INSERT INTO `sys_cn_area` VALUES ('440514', '潮南区', '潮南', '440500', null, '中国,广东省,汕头市,潮南区', '3', '515144', '0754', 'Chaonan', '116.4318800', '23.2500000');
INSERT INTO `sys_cn_area` VALUES ('440515', '澄海区', '澄海', '440500', null, '中国,广东省,汕头市,澄海区', '3', '515800', '0754', 'Chenghai', '116.7558900', '23.4672800');
INSERT INTO `sys_cn_area` VALUES ('440523', '南澳县', '南澳', '440500', null, '中国,广东省,汕头市,南澳县', '3', '515900', '0754', 'Nanao', '117.0188900', '23.4223000');
INSERT INTO `sys_cn_area` VALUES ('440600', '佛山市', '佛山', '440000', null, '中国,广东省,佛山市', '2', '528000', '0757', 'Foshan', '113.1227170', '23.0287620');
INSERT INTO `sys_cn_area` VALUES ('440604', '禅城区', '禅城', '440600', null, '中国,广东省,佛山市,禅城区', '3', '528000', '0757', 'Chancheng', '113.1228000', '23.0084200');
INSERT INTO `sys_cn_area` VALUES ('440605', '南海区', '南海', '440600', null, '中国,广东省,佛山市,南海区', '3', '528251', '0757', 'Nanhai', '113.1429900', '23.0287700');
INSERT INTO `sys_cn_area` VALUES ('440606', '顺德区', '顺德', '440600', null, '中国,广东省,佛山市,顺德区', '3', '528300', '0757', 'Shunde', '113.2939400', '22.8045200');
INSERT INTO `sys_cn_area` VALUES ('440607', '三水区', '三水', '440600', null, '中国,广东省,佛山市,三水区', '3', '528133', '0757', 'Sanshui', '112.8970300', '23.1556400');
INSERT INTO `sys_cn_area` VALUES ('440608', '高明区', '高明', '440600', null, '中国,广东省,佛山市,高明区', '3', '528500', '0757', 'Gaoming', '112.8925400', '22.9002200');
INSERT INTO `sys_cn_area` VALUES ('440700', '江门市', '江门', '440000', null, '中国,广东省,江门市', '2', '529000', '0750', 'Jiangmen', '113.0949420', '22.5904310');
INSERT INTO `sys_cn_area` VALUES ('440703', '蓬江区', '蓬江', '440700', null, '中国,广东省,江门市,蓬江区', '3', '529000', '0750', 'Pengjiang', '113.0784900', '22.5951500');
INSERT INTO `sys_cn_area` VALUES ('440704', '江海区', '江海', '440700', null, '中国,广东省,江门市,江海区', '3', '529040', '0750', 'Jianghai', '113.1109900', '22.5602400');
INSERT INTO `sys_cn_area` VALUES ('440705', '新会区', '新会', '440700', null, '中国,广东省,江门市,新会区', '3', '529100', '0750', 'Xinhui', '113.0322500', '22.4587600');
INSERT INTO `sys_cn_area` VALUES ('440781', '台山市', '台山', '440700', null, '中国,广东省,江门市,台山市', '3', '529200', '0750', 'Taishan', '112.7938200', '22.2515000');
INSERT INTO `sys_cn_area` VALUES ('440783', '开平市', '开平', '440700', null, '中国,广东省,江门市,开平市', '3', '529337', '0750', 'Kaiping', '112.6984200', '22.3762200');
INSERT INTO `sys_cn_area` VALUES ('440784', '鹤山市', '鹤山', '440700', null, '中国,广东省,江门市,鹤山市', '3', '529700', '0750', 'Heshan', '112.9642900', '22.7652300');
INSERT INTO `sys_cn_area` VALUES ('440785', '恩平市', '恩平', '440700', null, '中国,广东省,江门市,恩平市', '3', '529400', '0750', 'Enping', '112.3049600', '22.1828800');
INSERT INTO `sys_cn_area` VALUES ('440800', '湛江市', '湛江', '440000', null, '中国,广东省,湛江市', '2', '524047', '0759', 'Zhanjiang', '110.4055290', '21.1953380');
INSERT INTO `sys_cn_area` VALUES ('440802', '赤坎区', '赤坎', '440800', null, '中国,广东省,湛江市,赤坎区', '3', '524033', '0759', 'Chikan', '110.3659200', '21.2660600');
INSERT INTO `sys_cn_area` VALUES ('440803', '霞山区', '霞山', '440800', null, '中国,广东省,湛江市,霞山区', '3', '524011', '0759', 'Xiashan', '110.3982200', '21.1918100');
INSERT INTO `sys_cn_area` VALUES ('440804', '坡头区', '坡头', '440800', null, '中国,广东省,湛江市,坡头区', '3', '524057', '0759', 'Potou', '110.4553300', '21.2447200');
INSERT INTO `sys_cn_area` VALUES ('440811', '麻章区', '麻章', '440800', null, '中国,广东省,湛江市,麻章区', '3', '524094', '0759', 'Mazhang', '110.3342000', '21.2633300');
INSERT INTO `sys_cn_area` VALUES ('440823', '遂溪县', '遂溪', '440800', null, '中国,广东省,湛江市,遂溪县', '3', '524300', '0759', 'Suixi', '110.2500300', '21.3772100');
INSERT INTO `sys_cn_area` VALUES ('440825', '徐闻县', '徐闻', '440800', null, '中国,广东省,湛江市,徐闻县', '3', '524100', '0759', 'Xuwen', '110.1737900', '20.3281200');
INSERT INTO `sys_cn_area` VALUES ('440881', '廉江市', '廉江', '440800', null, '中国,广东省,湛江市,廉江市', '3', '524400', '0759', 'Lianjiang', '110.2844200', '21.6091700');
INSERT INTO `sys_cn_area` VALUES ('440882', '雷州市', '雷州', '440800', null, '中国,广东省,湛江市,雷州市', '3', '524200', '0759', 'Leizhou', '110.1009200', '20.9142800');
INSERT INTO `sys_cn_area` VALUES ('440883', '吴川市', '吴川', '440800', null, '中国,广东省,湛江市,吴川市', '3', '524500', '0759', 'Wuchuan', '110.7770300', '21.4458400');
INSERT INTO `sys_cn_area` VALUES ('440900', '茂名市', '茂名', '440000', null, '中国,广东省,茂名市', '2', '525000', '0668', 'Maoming', '110.9192290', '21.6597510');
INSERT INTO `sys_cn_area` VALUES ('440902', '茂南区', '茂南', '440900', null, '中国,广东省,茂名市,茂南区', '3', '525000', '0668', 'Maonan', '110.9187000', '21.6410300');
INSERT INTO `sys_cn_area` VALUES ('440904', '电白区', '电白', '440900', null, '中国,广东省,茂名市,电白区', '3', '525400', '0668', 'Dianbai', '111.0072640', '21.5072190');
INSERT INTO `sys_cn_area` VALUES ('440981', '高州市', '高州', '440900', null, '中国,广东省,茂名市,高州市', '3', '525200', '0668', 'Gaozhou', '110.8551900', '21.9205700');
INSERT INTO `sys_cn_area` VALUES ('440982', '化州市', '化州', '440900', null, '中国,广东省,茂名市,化州市', '3', '525100', '0668', 'Huazhou', '110.6394900', '21.6639400');
INSERT INTO `sys_cn_area` VALUES ('440983', '信宜市', '信宜', '440900', null, '中国,广东省,茂名市,信宜市', '3', '525300', '0668', 'Xinyi', '110.9464700', '22.3535100');
INSERT INTO `sys_cn_area` VALUES ('441200', '肇庆市', '肇庆', '440000', null, '中国,广东省,肇庆市', '2', '526040', '0758', 'Zhaoqing', '112.4725290', '23.0515460');
INSERT INTO `sys_cn_area` VALUES ('441202', '端州区', '端州', '441200', null, '中国,广东省,肇庆市,端州区', '3', '526060', '0758', 'Duanzhou', '112.4849500', '23.0519000');
INSERT INTO `sys_cn_area` VALUES ('441203', '鼎湖区', '鼎湖', '441200', null, '中国,广东省,肇庆市,鼎湖区', '3', '526070', '0758', 'Dinghu', '112.5664300', '23.1584600');
INSERT INTO `sys_cn_area` VALUES ('441223', '广宁县', '广宁', '441200', null, '中国,广东省,肇庆市,广宁县', '3', '526300', '0758', 'Guangning', '112.4406400', '23.6346000');
INSERT INTO `sys_cn_area` VALUES ('441224', '怀集县', '怀集', '441200', null, '中国,广东省,肇庆市,怀集县', '3', '526400', '0758', 'Huaiji', '112.1839600', '23.9091800');
INSERT INTO `sys_cn_area` VALUES ('441225', '封开县', '封开', '441200', null, '中国,广东省,肇庆市,封开县', '3', '526500', '0758', 'Fengkai', '111.5033200', '23.4357100');
INSERT INTO `sys_cn_area` VALUES ('441226', '德庆县', '德庆', '441200', null, '中国,广东省,肇庆市,德庆县', '3', '526600', '0758', 'Deqing', '111.7855500', '23.1437100');
INSERT INTO `sys_cn_area` VALUES ('441283', '高要市', '高要', '441200', null, '中国,广东省,肇庆市,高要市', '3', '526100', '0758', 'Gaoyao', '112.4583400', '23.0257700');
INSERT INTO `sys_cn_area` VALUES ('441284', '四会市', '四会', '441200', null, '中国,广东省,肇庆市,四会市', '3', '526200', '0758', 'Sihui', '112.7341600', '23.3268600');
INSERT INTO `sys_cn_area` VALUES ('441300', '惠州市', '惠州', '440000', null, '中国,广东省,惠州市', '2', '516000', '0752', 'Huizhou', '114.4125990', '23.0794040');
INSERT INTO `sys_cn_area` VALUES ('441302', '惠城区', '惠城', '441300', null, '中国,广东省,惠州市,惠城区', '3', '516008', '0752', 'Huicheng', '114.3828000', '23.0837700');
INSERT INTO `sys_cn_area` VALUES ('441303', '惠阳区', '惠阳', '441300', null, '中国,广东省,惠州市,惠阳区', '3', '516211', '0752', 'Huiyang', '114.4563900', '22.7884500');
INSERT INTO `sys_cn_area` VALUES ('441322', '博罗县', '博罗', '441300', null, '中国,广东省,惠州市,博罗县', '3', '516100', '0752', 'Boluo', '114.2896400', '23.1730700');
INSERT INTO `sys_cn_area` VALUES ('441323', '惠东县', '惠东', '441300', null, '中国,广东省,惠州市,惠东县', '3', '516300', '0752', 'Huidong', '114.7200900', '22.9848400');
INSERT INTO `sys_cn_area` VALUES ('441324', '龙门县', '龙门', '441300', null, '中国,广东省,惠州市,龙门县', '3', '516800', '0752', 'Longmen', '114.2547900', '23.7275800');
INSERT INTO `sys_cn_area` VALUES ('441400', '梅州市', '梅州', '440000', null, '中国,广东省,梅州市', '2', '514021', '0753', 'Meizhou', '116.1175820', '24.2991120');
INSERT INTO `sys_cn_area` VALUES ('441402', '梅江区', '梅江', '441400', null, '中国,广东省,梅州市,梅江区', '3', '514000', '0753', 'Meijiang', '116.1166300', '24.3106200');
INSERT INTO `sys_cn_area` VALUES ('441403', '梅县区', '梅县', '441400', null, '中国,广东省,梅州市,梅县区', '3', '514787', '0753', 'Meixian', '116.0977530', '24.2867390');
INSERT INTO `sys_cn_area` VALUES ('441422', '大埔县', '大埔', '441400', null, '中国,广东省,梅州市,大埔县', '3', '514200', '0753', 'Dabu', '116.6966200', '24.3532500');
INSERT INTO `sys_cn_area` VALUES ('441423', '丰顺县', '丰顺', '441400', null, '中国,广东省,梅州市,丰顺县', '3', '514300', '0753', 'Fengshun', '116.1821900', '23.7409400');
INSERT INTO `sys_cn_area` VALUES ('441424', '五华县', '五华', '441400', null, '中国,广东省,梅州市,五华县', '3', '514400', '0753', 'Wuhua', '115.7789300', '23.9241700');
INSERT INTO `sys_cn_area` VALUES ('441426', '平远县', '平远', '441400', null, '中国,广东省,梅州市,平远县', '3', '514600', '0753', 'Pingyuan', '115.8955600', '24.5711600');
INSERT INTO `sys_cn_area` VALUES ('441427', '蕉岭县', '蕉岭', '441400', null, '中国,广东省,梅州市,蕉岭县', '3', '514100', '0753', 'Jiaoling', '116.1708900', '24.6573200');
INSERT INTO `sys_cn_area` VALUES ('441481', '兴宁市', '兴宁', '441400', null, '中国,广东省,梅州市,兴宁市', '3', '514500', '0753', 'Xingning', '115.7314100', '24.1400100');
INSERT INTO `sys_cn_area` VALUES ('441500', '汕尾市', '汕尾', '440000', null, '中国,广东省,汕尾市', '2', '516600', '0660', 'Shanwei', '115.3642380', '22.7744850');
INSERT INTO `sys_cn_area` VALUES ('441502', '城区', '城区', '441500', null, '中国,广东省,汕尾市,城区', '3', '516600', '0660', 'Chengqu', '115.3650300', '22.7789000');
INSERT INTO `sys_cn_area` VALUES ('441521', '海丰县', '海丰', '441500', null, '中国,广东省,汕尾市,海丰县', '3', '516400', '0660', 'Haifeng', '115.3233600', '22.9665300');
INSERT INTO `sys_cn_area` VALUES ('441523', '陆河县', '陆河', '441500', null, '中国,广东省,汕尾市,陆河县', '3', '516700', '0660', 'Luhe', '115.6559700', '23.3036500');
INSERT INTO `sys_cn_area` VALUES ('441581', '陆丰市', '陆丰', '441500', null, '中国,广东省,汕尾市,陆丰市', '3', '516500', '0660', 'Lufeng', '115.6481300', '22.9433500');
INSERT INTO `sys_cn_area` VALUES ('441600', '河源市', '河源', '440000', null, '中国,广东省,河源市', '2', '517000', '0762', 'Heyuan', '114.6978020', '23.7462660');
INSERT INTO `sys_cn_area` VALUES ('441602', '源城区', '源城', '441600', null, '中国,广东省,河源市,源城区', '3', '517000', '0762', 'Yuancheng', '114.7024200', '23.7341000');
INSERT INTO `sys_cn_area` VALUES ('441621', '紫金县', '紫金', '441600', null, '中国,广东省,河源市,紫金县', '3', '517400', '0762', 'Zijin', '115.1836500', '23.6386700');
INSERT INTO `sys_cn_area` VALUES ('441622', '龙川县', '龙川', '441600', null, '中国,广东省,河源市,龙川县', '3', '517300', '0762', 'Longchuan', '115.2602500', '24.1014200');
INSERT INTO `sys_cn_area` VALUES ('441623', '连平县', '连平', '441600', null, '中国,广东省,河源市,连平县', '3', '517100', '0762', 'Lianping', '114.4902600', '24.3715600');
INSERT INTO `sys_cn_area` VALUES ('441624', '和平县', '和平', '441600', null, '中国,广东省,河源市,和平县', '3', '517200', '0762', 'Heping', '114.9384100', '24.4431900');
INSERT INTO `sys_cn_area` VALUES ('441625', '东源县', '东源', '441600', null, '中国,广东省,河源市,东源县', '3', '517583', '0762', 'Dongyuan', '114.7463300', '23.7883500');
INSERT INTO `sys_cn_area` VALUES ('441700', '阳江市', '阳江', '440000', null, '中国,广东省,阳江市', '2', '529500', '0662', 'Yangjiang', '111.9751070', '21.8592220');
INSERT INTO `sys_cn_area` VALUES ('441702', '江城区', '江城', '441700', null, '中国,广东省,阳江市,江城区', '3', '529500', '0662', 'Jiangcheng', '111.9548800', '21.8619300');
INSERT INTO `sys_cn_area` VALUES ('441704', '阳东区', '阳东', '441700', null, '中国,广东省,阳江市,阳东区', '3', '529900', '0662', 'Yangdong', '112.0146700', '21.8739800');
INSERT INTO `sys_cn_area` VALUES ('441721', '阳西县', '阳西', '441700', null, '中国,广东省,阳江市,阳西县', '3', '529800', '0662', 'Yangxi', '111.6178500', '21.7523400');
INSERT INTO `sys_cn_area` VALUES ('441781', '阳春市', '阳春', '441700', null, '中国,广东省,阳江市,阳春市', '3', '529600', '0662', 'Yangchun', '111.7885400', '22.1723200');
INSERT INTO `sys_cn_area` VALUES ('441800', '清远市', '清远', '440000', null, '中国,广东省,清远市', '2', '511500', '0763', 'Qingyuan', '113.0367790', '23.7041880');
INSERT INTO `sys_cn_area` VALUES ('441802', '清城区', '清城', '441800', null, '中国,广东省,清远市,清城区', '3', '511515', '0763', 'Qingcheng', '113.0626500', '23.6978400');
INSERT INTO `sys_cn_area` VALUES ('441803', '清新区', '清新', '441800', null, '中国,广东省,清远市,清新区', '3', '511810', '0763', 'Qingxin', '113.0152030', '23.7369490');
INSERT INTO `sys_cn_area` VALUES ('441821', '佛冈县', '佛冈', '441800', null, '中国,广东省,清远市,佛冈县', '3', '511600', '0763', 'Fogang', '113.5328600', '23.8723100');
INSERT INTO `sys_cn_area` VALUES ('441823', '阳山县', '阳山', '441800', null, '中国,广东省,清远市,阳山县', '3', '513100', '0763', 'Yangshan', '112.6412900', '24.4651600');
INSERT INTO `sys_cn_area` VALUES ('441825', '连山壮族瑶族自治县', '连山', '441800', null, '中国,广东省,清远市,连山壮族瑶族自治县', '3', '513200', '0763', 'Lianshan', '112.0802000', '24.5680700');
INSERT INTO `sys_cn_area` VALUES ('441826', '连南瑶族自治县', '连南', '441800', null, '中国,广东省,清远市,连南瑶族自治县', '3', '513300', '0763', 'Liannan', '112.2884200', '24.7172600');
INSERT INTO `sys_cn_area` VALUES ('441881', '英德市', '英德', '441800', null, '中国,广东省,清远市,英德市', '3', '513000', '0763', 'Yingde', '113.4150000', '24.1857100');
INSERT INTO `sys_cn_area` VALUES ('441882', '连州市', '连州', '441800', null, '中国,广东省,清远市,连州市', '3', '513400', '0763', 'Lianzhou', '112.3815300', '24.7791300');
INSERT INTO `sys_cn_area` VALUES ('441900', '东莞市', '东莞', '440000', null, '中国,广东省,东莞市', '2', '523888', '0769', 'Dongguan', '113.7602340', '23.0488840');
INSERT INTO `sys_cn_area` VALUES ('441901', '莞城区', '莞城', '441900', null, '中国,广东省,东莞市,莞城区', '3', '523128', '0769', 'Guancheng', '113.7510430', '23.0534120');
INSERT INTO `sys_cn_area` VALUES ('441902', '南城区', '南城', '441900', null, '中国,广东省,东莞市,南城区', '3', '523617', '0769', 'Nancheng', '113.7521250', '23.0201800');
INSERT INTO `sys_cn_area` VALUES ('441904', '万江区', '万江', '441900', null, '中国,广东省,东莞市,万江区', '3', '523039', '0769', 'Wanjiang', '113.7390530', '23.0438420');
INSERT INTO `sys_cn_area` VALUES ('441905', '石碣镇', '石碣', '441900', null, '中国,广东省,东莞市,石碣镇', '3', '523290', '0769', 'Shijie', '113.8021700', '23.0989900');
INSERT INTO `sys_cn_area` VALUES ('441906', '石龙镇', '石龙', '441900', null, '中国,广东省,东莞市,石龙镇', '3', '523326', '0769', 'Shilong', '113.8763810', '23.1074440');
INSERT INTO `sys_cn_area` VALUES ('441907', '茶山镇', '茶山', '441900', null, '中国,广东省,东莞市,茶山镇', '3', '523380', '0769', 'Chashan', '113.8835260', '23.0623750');
INSERT INTO `sys_cn_area` VALUES ('441908', '石排镇', '石排', '441900', null, '中国,广东省,东莞市,石排镇', '3', '523346', '0769', 'Shipai', '113.9198590', '23.0863000');
INSERT INTO `sys_cn_area` VALUES ('441909', '企石镇', '企石', '441900', null, '中国,广东省,东莞市,企石镇', '3', '523507', '0769', 'Qishi', '114.0132330', '23.0660440');
INSERT INTO `sys_cn_area` VALUES ('441910', '横沥镇', '横沥', '441900', null, '中国,广东省,东莞市,横沥镇', '3', '523471', '0769', 'Hengli', '113.9574360', '23.0257320');
INSERT INTO `sys_cn_area` VALUES ('441911', '桥头镇', '桥头', '441900', null, '中国,广东省,东莞市,桥头镇', '3', '523520', '0769', 'Qiaotou', '114.0138500', '22.9397270');
INSERT INTO `sys_cn_area` VALUES ('441912', '谢岗镇', '谢岗', '441900', null, '中国,广东省,东莞市,谢岗镇', '3', '523592', '0769', 'Xiegang', '114.1413960', '22.9596640');
INSERT INTO `sys_cn_area` VALUES ('441913', '东坑镇', '东坑', '441900', null, '中国,广东省,东莞市,东坑镇', '3', '523451', '0769', 'Dongkeng', '113.9398350', '22.9928040');
INSERT INTO `sys_cn_area` VALUES ('441914', '常平镇', '常平', '441900', null, '中国,广东省,东莞市,常平镇', '3', '523560', '0769', 'Changping', '114.0296270', '23.0161160');
INSERT INTO `sys_cn_area` VALUES ('441915', '寮步镇', '寮步', '441900', null, '中国,广东省,东莞市,寮步镇', '3', '523411', '0769', 'Liaobu', '113.8847450', '22.9917380');
INSERT INTO `sys_cn_area` VALUES ('441916', '大朗镇', '大朗', '441900', null, '中国,广东省,东莞市,大朗镇', '3', '523770', '0769', 'Dalang', '113.9271000', '22.9657480');
INSERT INTO `sys_cn_area` VALUES ('441917', '麻涌镇', '麻涌', '441900', null, '中国,广东省,东莞市,麻涌镇', '3', '523143', '0769', 'Machong', '113.5461770', '23.0453150');
INSERT INTO `sys_cn_area` VALUES ('441918', '中堂镇', '中堂', '441900', null, '中国,广东省,东莞市,中堂镇', '3', '523233', '0769', 'Zhongtang', '113.6544220', '23.0901640');
INSERT INTO `sys_cn_area` VALUES ('441919', '高埗镇', '高埗', '441900', null, '中国,广东省,东莞市,高埗镇', '3', '523282', '0769', 'Gaobu', '113.7359170', '23.0684150');
INSERT INTO `sys_cn_area` VALUES ('441920', '樟木头镇', '樟木头', '441900', null, '中国,广东省,东莞市,樟木头镇', '3', '523619', '0769', 'Zhangmutou', '114.0662980', '22.9566820');
INSERT INTO `sys_cn_area` VALUES ('441921', '大岭山镇', '大岭山', '441900', null, '中国,广东省,东莞市,大岭山镇', '3', '523835', '0769', 'Dalingshan', '113.7829550', '22.8853660');
INSERT INTO `sys_cn_area` VALUES ('441922', '望牛墩镇', '望牛墩', '441900', null, '中国,广东省,东莞市,望牛墩镇', '3', '523203', '0769', 'Wangniudun', '113.6588470', '23.0550180');
INSERT INTO `sys_cn_area` VALUES ('441923', '黄江镇', '黄江', '441900', null, '中国,广东省,东莞市,黄江镇', '3', '523755', '0769', 'Huangjiang', '113.9926350', '22.8775360');
INSERT INTO `sys_cn_area` VALUES ('441924', '洪梅镇', '洪梅', '441900', null, '中国,广东省,东莞市,洪梅镇', '3', '523163', '0769', 'Hongmei', '113.6130810', '22.9926750');
INSERT INTO `sys_cn_area` VALUES ('441925', '清溪镇', '清溪', '441900', null, '中国,广东省,东莞市,清溪镇', '3', '523660', '0769', 'Qingxi', '114.1557960', '22.8444560');
INSERT INTO `sys_cn_area` VALUES ('441926', '沙田镇', '沙田', '441900', null, '中国,广东省,东莞市,沙田镇', '3', '523988', '0769', 'Shatian', '113.7602340', '23.0488840');
INSERT INTO `sys_cn_area` VALUES ('441927', '道滘镇', '道滘', '441900', null, '中国,广东省,东莞市,道滘镇', '3', '523171', '0769', 'Daojiao', '113.7602340', '23.0488840');
INSERT INTO `sys_cn_area` VALUES ('441928', '塘厦镇', '塘厦', '441900', null, '中国,广东省,东莞市,塘厦镇', '3', '523713', '0769', 'Tangxia', '114.1076500', '22.8228620');
INSERT INTO `sys_cn_area` VALUES ('441929', '虎门镇', '虎门', '441900', null, '中国,广东省,东莞市,虎门镇', '3', '523932', '0769', 'Humen', '113.7111800', '22.8261500');
INSERT INTO `sys_cn_area` VALUES ('441930', '厚街镇', '厚街', '441900', null, '中国,广东省,东莞市,厚街镇', '3', '523960', '0769', 'Houjie', '113.6730100', '22.9408150');
INSERT INTO `sys_cn_area` VALUES ('441931', '凤岗镇', '凤岗', '441900', null, '中国,广东省,东莞市,凤岗镇', '3', '523690', '0769', 'Fenggang', '114.1411940', '22.7445980');
INSERT INTO `sys_cn_area` VALUES ('441932', '长安镇', '长安', '441900', null, '中国,广东省,东莞市,长安镇', '3', '523850', '0769', 'Chang\'an', '113.8039390', '22.8166440');
INSERT INTO `sys_cn_area` VALUES ('442000', '中山市', '中山', '440000', null, '中国,广东省,中山市', '2', '528403', '0760', 'Zhongshan', '113.3823910', '22.5211130');
INSERT INTO `sys_cn_area` VALUES ('442001', '石岐区', '石岐', '442000', null, '中国,广东省,中山市,石岐区', '3', '528400', '0760', 'Shiqi', '113.3788350', '22.5252200');
INSERT INTO `sys_cn_area` VALUES ('442004', '南区', '南区', '442000', null, '中国,广东省,中山市,南区', '3', '528400', '0760', 'Nanqu', '113.3558960', '22.4865680');
INSERT INTO `sys_cn_area` VALUES ('442005', '五桂山区', '五桂山', '442000', null, '中国,广东省,中山市,五桂山区', '3', '528458', '0760', 'Wuguishan', '113.4107900', '22.5196800');
INSERT INTO `sys_cn_area` VALUES ('442006', '火炬开发区', '火炬', '442000', null, '中国,广东省,中山市,火炬开发区', '3', '528437', '0760', 'Huoju', '113.4805230', '22.5660820');
INSERT INTO `sys_cn_area` VALUES ('442007', '黄圃镇', '黄圃', '442000', null, '中国,广东省,中山市,黄圃镇', '3', '528429', '0760', 'Huangpu', '113.3423590', '22.7151160');
INSERT INTO `sys_cn_area` VALUES ('442008', '南头镇', '南头', '442000', null, '中国,广东省,中山市,南头镇', '3', '528421', '0760', 'Nantou', '113.2963580', '22.7139070');
INSERT INTO `sys_cn_area` VALUES ('442009', '东凤镇', '东凤', '442000', null, '中国,广东省,中山市,东凤镇', '3', '528425', '0760', 'Dongfeng', '113.2611400', '22.6877500');
INSERT INTO `sys_cn_area` VALUES ('442010', '阜沙镇', '阜沙', '442000', null, '中国,广东省,中山市,阜沙镇', '3', '528434', '0760', 'Fusha', '113.3530240', '22.6663640');
INSERT INTO `sys_cn_area` VALUES ('442011', '小榄镇', '小榄', '442000', null, '中国,广东省,中山市,小榄镇', '3', '528415', '0760', 'Xiaolan', '113.2442350', '22.6669510');
INSERT INTO `sys_cn_area` VALUES ('442012', '东升镇', '东升', '442000', null, '中国,广东省,中山市,东升镇', '3', '528400', '0760', 'Dongsheng', '113.2962980', '22.6140030');
INSERT INTO `sys_cn_area` VALUES ('442013', '古镇镇', '古镇', '442000', null, '中国,广东省,中山市,古镇镇', '3', '528422', '0760', 'Guzhen', '113.1797450', '22.6110190');
INSERT INTO `sys_cn_area` VALUES ('442014', '横栏镇', '横栏', '442000', null, '中国,广东省,中山市,横栏镇', '3', '528478', '0760', 'Henglan', '113.2658450', '22.5232020');
INSERT INTO `sys_cn_area` VALUES ('442015', '三角镇', '三角', '442000', null, '中国,广东省,中山市,三角镇', '3', '528422', '0760', 'Sanjiao', '113.4236240', '22.6770330');
INSERT INTO `sys_cn_area` VALUES ('442016', '民众镇', '民众', '442000', null, '中国,广东省,中山市,民众镇', '3', '528441', '0760', 'Minzhong', '113.4860250', '22.6234680');
INSERT INTO `sys_cn_area` VALUES ('442017', '南朗镇', '南朗', '442000', null, '中国,广东省,中山市,南朗镇', '3', '528454', '0760', 'Nanlang', '113.5339390', '22.4923780');
INSERT INTO `sys_cn_area` VALUES ('442018', '港口镇', '港口', '442000', null, '中国,广东省,中山市,港口镇', '3', '528447', '0760', 'Gangkou', '113.3823910', '22.5211130');
INSERT INTO `sys_cn_area` VALUES ('442019', '大涌镇', '大涌', '442000', null, '中国,广东省,中山市,大涌镇', '3', '528476', '0760', 'Dayong', '113.2917080', '22.4677120');
INSERT INTO `sys_cn_area` VALUES ('442020', '沙溪镇', '沙溪', '442000', null, '中国,广东省,中山市,沙溪镇', '3', '528471', '0760', 'Shaxi', '113.3283690', '22.5263250');
INSERT INTO `sys_cn_area` VALUES ('442021', '三乡镇', '三乡', '442000', null, '中国,广东省,中山市,三乡镇', '3', '528463', '0760', 'Sanxiang', '113.4334000', '22.3524940');
INSERT INTO `sys_cn_area` VALUES ('442022', '板芙镇', '板芙', '442000', null, '中国,广东省,中山市,板芙镇', '3', '528459', '0760', 'Banfu', '113.3203460', '22.4156740');
INSERT INTO `sys_cn_area` VALUES ('442023', '神湾镇', '神湾', '442000', null, '中国,广东省,中山市,神湾镇', '3', '528462', '0760', 'Shenwan', '113.3593870', '22.3124760');
INSERT INTO `sys_cn_area` VALUES ('442024', '坦洲镇', '坦洲', '442000', null, '中国,广东省,中山市,坦洲镇', '3', '528467', '0760', 'Tanzhou', '113.4856770', '22.2612690');
INSERT INTO `sys_cn_area` VALUES ('445100', '潮州市', '潮州', '440000', null, '中国,广东省,潮州市', '2', '521000', '0768', 'Chaozhou', '116.6323010', '23.6617010');
INSERT INTO `sys_cn_area` VALUES ('445102', '湘桥区', '湘桥', '445100', null, '中国,广东省,潮州市,湘桥区', '3', '521000', '0768', 'Xiangqiao', '116.6280500', '23.6745100');
INSERT INTO `sys_cn_area` VALUES ('445103', '潮安区', '潮安', '445100', null, '中国,广东省,潮州市,潮安区', '3', '515638', '0768', 'Chao\'an', '116.5928950', '23.6436560');
INSERT INTO `sys_cn_area` VALUES ('445122', '饶平县', '饶平', '445100', null, '中国,广东省,潮州市,饶平县', '3', '515700', '0768', 'Raoping', '117.0069200', '23.6699400');
INSERT INTO `sys_cn_area` VALUES ('445200', '揭阳市', '揭阳', '440000', null, '中国,广东省,揭阳市', '2', '522000', '0633', 'Jieyang', '116.3557330', '23.5437780');
INSERT INTO `sys_cn_area` VALUES ('445202', '榕城区', '榕城', '445200', null, '中国,广东省,揭阳市,榕城区', '3', '522000', '0633', 'Rongcheng', '116.3671000', '23.5250800');
INSERT INTO `sys_cn_area` VALUES ('445203', '揭东区', '揭东', '445200', null, '中国,广东省,揭阳市,揭东区', '3', '515500', '0633', 'Jiedong', '116.4129470', '23.5698870');
INSERT INTO `sys_cn_area` VALUES ('445222', '揭西县', '揭西', '445200', null, '中国,广东省,揭阳市,揭西县', '3', '515400', '0633', 'Jiexi', '115.8388300', '23.4271400');
INSERT INTO `sys_cn_area` VALUES ('445224', '惠来县', '惠来', '445200', null, '中国,广东省,揭阳市,惠来县', '3', '515200', '0633', 'Huilai', '116.2959900', '23.0328900');
INSERT INTO `sys_cn_area` VALUES ('445281', '普宁市', '普宁', '445200', null, '中国,广东省,揭阳市,普宁市', '3', '515300', '0633', 'Puning', '116.1656400', '23.2973200');
INSERT INTO `sys_cn_area` VALUES ('445300', '云浮市', '云浮', '440000', null, '中国,广东省,云浮市', '2', '527300', '0766', 'Yunfu', '112.0444390', '22.9298010');
INSERT INTO `sys_cn_area` VALUES ('445302', '云城区', '云城', '445300', null, '中国,广东省,云浮市,云城区', '3', '527300', '0766', 'Yuncheng', '112.0390800', '22.9299600');
INSERT INTO `sys_cn_area` VALUES ('445303', '云安区', '云安', '445300', null, '中国,广东省,云浮市,云安区', '3', '527500', '0766', 'Yun\'an', '112.0093600', '23.0777900');
INSERT INTO `sys_cn_area` VALUES ('445321', '新兴县', '新兴', '445300', null, '中国,广东省,云浮市,新兴县', '3', '527400', '0766', 'Xinxing', '112.2301900', '22.6973400');
INSERT INTO `sys_cn_area` VALUES ('445322', '郁南县', '郁南', '445300', null, '中国,广东省,云浮市,郁南县', '3', '527100', '0766', 'Yunan', '111.5338700', '23.2330700');
INSERT INTO `sys_cn_area` VALUES ('445381', '罗定市', '罗定', '445300', null, '中国,广东省,云浮市,罗定市', '3', '527200', '0766', 'Luoding', '111.5697900', '22.7696700');
INSERT INTO `sys_cn_area` VALUES ('450000', '广西壮族自治区', '广西', '100000', null, '中国,广西壮族自治区', '1', null, '', 'Guangxi', '108.3200040', '22.8240200');
INSERT INTO `sys_cn_area` VALUES ('450100', '南宁市', '南宁', '450000', null, '中国,广西壮族自治区,南宁市', '2', '530028', '0771', 'Nanning', '108.3200040', '22.8240200');
INSERT INTO `sys_cn_area` VALUES ('450102', '兴宁区', '兴宁', '450100', null, '中国,广西壮族自治区,南宁市,兴宁区', '3', '530023', '0771', 'Xingning', '108.3669400', '22.8535500');
INSERT INTO `sys_cn_area` VALUES ('450103', '青秀区', '青秀', '450100', null, '中国,广西壮族自治区,南宁市,青秀区', '3', '530213', '0771', 'Qingxiu', '108.4954500', '22.7851100');
INSERT INTO `sys_cn_area` VALUES ('450105', '江南区', '江南', '450100', null, '中国,广西壮族自治区,南宁市,江南区', '3', '530031', '0771', 'Jiangnan', '108.2732500', '22.7812700');
INSERT INTO `sys_cn_area` VALUES ('450107', '西乡塘区', '西乡塘', '450100', null, '中国,广西壮族自治区,南宁市,西乡塘区', '3', '530001', '0771', 'Xixiangtang', '108.3134700', '22.8338600');
INSERT INTO `sys_cn_area` VALUES ('450108', '良庆区', '良庆', '450100', null, '中国,广西壮族自治区,南宁市,良庆区', '3', '530219', '0771', 'Liangqing', '108.4128400', '22.7491400');
INSERT INTO `sys_cn_area` VALUES ('450109', '邕宁区', '邕宁', '450100', null, '中国,广西壮族自治区,南宁市,邕宁区', '3', '530200', '0771', 'Yongning', '108.4868400', '22.7562800');
INSERT INTO `sys_cn_area` VALUES ('450122', '武鸣县', '武鸣', '450100', null, '中国,广西壮族自治区,南宁市,武鸣县', '3', '530100', '0771', 'Wuming', '108.2771900', '23.1564300');
INSERT INTO `sys_cn_area` VALUES ('450123', '隆安县', '隆安', '450100', null, '中国,广西壮族自治区,南宁市,隆安县', '3', '532700', '0771', 'Long\'an', '107.6919200', '23.1733600');
INSERT INTO `sys_cn_area` VALUES ('450124', '马山县', '马山', '450100', null, '中国,广西壮族自治区,南宁市,马山县', '3', '530600', '0771', 'Mashan', '108.1769700', '23.7093100');
INSERT INTO `sys_cn_area` VALUES ('450125', '上林县', '上林', '450100', null, '中国,广西壮族自治区,南宁市,上林县', '3', '530500', '0771', 'Shanglin', '108.6052200', '23.4320000');
INSERT INTO `sys_cn_area` VALUES ('450126', '宾阳县', '宾阳', '450100', null, '中国,广西壮族自治区,南宁市,宾阳县', '3', '530400', '0771', 'Binyang', '108.8118500', '23.2196000');
INSERT INTO `sys_cn_area` VALUES ('450127', '横县', '横县', '450100', null, '中国,广西壮族自治区,南宁市,横县', '3', '530300', '0771', 'Hengxian', '109.2660800', '22.6844800');
INSERT INTO `sys_cn_area` VALUES ('450128', '埌东新区', '埌东', '450100', null, '中国,广西壮族自治区,南宁市,埌东新区', '3', '530000', '0771', 'Langdong', '108.4190940', '22.8129760');
INSERT INTO `sys_cn_area` VALUES ('450200', '柳州市', '柳州', '450000', null, '中国,广西壮族自治区,柳州市', '2', '545001', '0772', 'Liuzhou', '109.4117030', '24.3146170');
INSERT INTO `sys_cn_area` VALUES ('450202', '城中区', '城中', '450200', null, '中国,广西壮族自治区,柳州市,城中区', '3', '545001', '0772', 'Chengzhong', '109.4108200', '24.3154300');
INSERT INTO `sys_cn_area` VALUES ('450203', '鱼峰区', '鱼峰', '450200', null, '中国,广西壮族自治区,柳州市,鱼峰区', '3', '545005', '0772', 'Yufeng', '109.4533000', '24.3186800');
INSERT INTO `sys_cn_area` VALUES ('450204', '柳南区', '柳南', '450200', null, '中国,广西壮族自治区,柳州市,柳南区', '3', '545007', '0772', 'Liunan', '109.3854800', '24.3359900');
INSERT INTO `sys_cn_area` VALUES ('450205', '柳北区', '柳北', '450200', null, '中国,广西壮族自治区,柳州市,柳北区', '3', '545002', '0772', 'Liubei', '109.4020200', '24.3626700');
INSERT INTO `sys_cn_area` VALUES ('450221', '柳江县', '柳江', '450200', null, '中国,广西壮族自治区,柳州市,柳江县', '3', '545100', '0772', 'Liujiang', '109.3327300', '24.2559600');
INSERT INTO `sys_cn_area` VALUES ('450222', '柳城县', '柳城', '450200', null, '中国,广西壮族自治区,柳州市,柳城县', '3', '545200', '0772', 'Liucheng', '109.2387700', '24.6495100');
INSERT INTO `sys_cn_area` VALUES ('450223', '鹿寨县', '鹿寨', '450200', null, '中国,广西壮族自治区,柳州市,鹿寨县', '3', '545600', '0772', 'Luzhai', '109.7517700', '24.4730600');
INSERT INTO `sys_cn_area` VALUES ('450224', '融安县', '融安', '450200', null, '中国,广西壮族自治区,柳州市,融安县', '3', '545400', '0772', 'Rong\'an', '109.3976100', '25.2246500');
INSERT INTO `sys_cn_area` VALUES ('450225', '融水苗族自治县', '融水', '450200', null, '中国,广西壮族自治区,柳州市,融水苗族自治县', '3', '545300', '0772', 'Rongshui', '109.2563400', '25.0662800');
INSERT INTO `sys_cn_area` VALUES ('450226', '三江侗族自治县', '三江', '450200', null, '中国,广西壮族自治区,柳州市,三江侗族自治县', '3', '545500', '0772', 'Sanjiang', '109.6044600', '25.7842800');
INSERT INTO `sys_cn_area` VALUES ('450227', '柳东新区', '柳东', '450200', null, '中国,广西壮族自治区,柳州市,柳东新区', '3', '545000', '0772', 'Liudong', '109.4370530', '24.3292040');
INSERT INTO `sys_cn_area` VALUES ('450300', '桂林市', '桂林', '450000', null, '中国,广西壮族自治区,桂林市', '2', '541100', '0773', 'Guilin', '110.2991210', '25.2742150');
INSERT INTO `sys_cn_area` VALUES ('450302', '秀峰区', '秀峰', '450300', null, '中国,广西壮族自治区,桂林市,秀峰区', '3', '541001', '0773', 'Xiufeng', '110.2891500', '25.2824900');
INSERT INTO `sys_cn_area` VALUES ('450303', '叠彩区', '叠彩', '450300', null, '中国,广西壮族自治区,桂林市,叠彩区', '3', '541001', '0773', 'Diecai', '110.3019500', '25.3138100');
INSERT INTO `sys_cn_area` VALUES ('450304', '象山区', '象山', '450300', null, '中国,广西壮族自治区,桂林市,象山区', '3', '541002', '0773', 'Xiangshan', '110.2810800', '25.2616800');
INSERT INTO `sys_cn_area` VALUES ('450305', '七星区', '七星', '450300', null, '中国,广西壮族自治区,桂林市,七星区', '3', '541004', '0773', 'Qixing', '110.3179300', '25.2525000');
INSERT INTO `sys_cn_area` VALUES ('450311', '雁山区', '雁山', '450300', null, '中国,广西壮族自治区,桂林市,雁山区', '3', '541006', '0773', 'Yanshan', '110.3091100', '25.0603800');
INSERT INTO `sys_cn_area` VALUES ('450312', '临桂区', '临桂', '450300', null, '中国,广西壮族自治区,桂林市,临桂区', '3', '541100', '0773', 'Lingui', '110.2054870', '25.2462570');
INSERT INTO `sys_cn_area` VALUES ('450321', '阳朔县', '阳朔', '450300', null, '中国,广西壮族自治区,桂林市,阳朔县', '3', '541900', '0773', 'Yangshuo', '110.4947500', '24.7757900');
INSERT INTO `sys_cn_area` VALUES ('450323', '灵川县', '灵川', '450300', null, '中国,广西壮族自治区,桂林市,灵川县', '3', '541200', '0773', 'Lingchuan', '110.3294900', '25.4129200');
INSERT INTO `sys_cn_area` VALUES ('450324', '全州县', '全州', '450300', null, '中国,广西壮族自治区,桂林市,全州县', '3', '541503', '0773', 'Quanzhou', '111.0721100', '25.9279900');
INSERT INTO `sys_cn_area` VALUES ('450325', '兴安县', '兴安', '450300', null, '中国,广西壮族自治区,桂林市,兴安县', '3', '541300', '0773', 'Xing\'an', '110.6714400', '25.6116700');
INSERT INTO `sys_cn_area` VALUES ('450326', '永福县', '永福', '450300', null, '中国,广西壮族自治区,桂林市,永福县', '3', '541800', '0773', 'Yongfu', '109.9833300', '24.9800400');
INSERT INTO `sys_cn_area` VALUES ('450327', '灌阳县', '灌阳', '450300', null, '中国,广西壮族自治区,桂林市,灌阳县', '3', '541600', '0773', 'Guanyang', '111.1595400', '25.4880300');
INSERT INTO `sys_cn_area` VALUES ('450328', '龙胜各族自治县', '龙胜', '450300', null, '中国,广西壮族自治区,桂林市,龙胜各族自治县', '3', '541700', '0773', 'Longsheng', '110.0122600', '25.7961400');
INSERT INTO `sys_cn_area` VALUES ('450329', '资源县', '资源', '450300', null, '中国,广西壮族自治区,桂林市,资源县', '3', '541400', '0773', 'Ziyuan', '110.6525500', '26.0423700');
INSERT INTO `sys_cn_area` VALUES ('450330', '平乐县', '平乐', '450300', null, '中国,广西壮族自治区,桂林市,平乐县', '3', '542400', '0773', 'Pingle', '110.6417500', '24.6324200');
INSERT INTO `sys_cn_area` VALUES ('450331', '荔浦县', '荔浦', '450300', null, '中国,广西壮族自治区,桂林市,荔浦县', '3', '546600', '0773', 'Lipu', '110.3971000', '24.4958900');
INSERT INTO `sys_cn_area` VALUES ('450332', '恭城瑶族自治县', '恭城', '450300', null, '中国,广西壮族自治区,桂林市,恭城瑶族自治县', '3', '542500', '0773', 'Gongcheng', '110.8303500', '24.8328600');
INSERT INTO `sys_cn_area` VALUES ('450400', '梧州市', '梧州', '450000', null, '中国,广西壮族自治区,梧州市', '2', '543002', '0774', 'Wuzhou', '111.3162290', '23.4723090');
INSERT INTO `sys_cn_area` VALUES ('450403', '万秀区', '万秀', '450400', null, '中国,广西壮族自治区,梧州市,万秀区', '3', '543000', '0774', 'Wanxiu', '111.3205200', '23.4729800');
INSERT INTO `sys_cn_area` VALUES ('450405', '长洲区', '长洲', '450400', null, '中国,广西壮族自治区,梧州市,长洲区', '3', '543003', '0774', 'Changzhou', '111.2749400', '23.4857300');
INSERT INTO `sys_cn_area` VALUES ('450406', '龙圩区', '龙圩', '450400', null, '中国,广西壮族自治区,梧州市,龙圩区', '3', '543002', '0774', 'Longxu', '111.3162290', '23.4723090');
INSERT INTO `sys_cn_area` VALUES ('450421', '苍梧县', '苍梧', '450400', null, '中国,广西壮族自治区,梧州市,苍梧县', '3', '543100', '0774', 'Cangwu', '111.2453300', '23.4204900');
INSERT INTO `sys_cn_area` VALUES ('450422', '藤县', '藤县', '450400', null, '中国,广西壮族自治区,梧州市,藤县', '3', '543300', '0774', 'Tengxian', '110.9141800', '23.3760500');
INSERT INTO `sys_cn_area` VALUES ('450423', '蒙山县', '蒙山', '450400', null, '中国,广西壮族自治区,梧州市,蒙山县', '3', '546700', '0774', 'Mengshan', '110.5222100', '24.2016800');
INSERT INTO `sys_cn_area` VALUES ('450481', '岑溪市', '岑溪', '450400', null, '中国,广西壮族自治区,梧州市,岑溪市', '3', '543200', '0774', 'Cenxi', '110.9959400', '22.9191000');
INSERT INTO `sys_cn_area` VALUES ('450500', '北海市', '北海', '450000', null, '中国,广西壮族自治区,北海市', '2', '536000', '0779', 'Beihai', '109.1192540', '21.4733430');
INSERT INTO `sys_cn_area` VALUES ('450502', '海城区', '海城', '450500', null, '中国,广西壮族自治区,北海市,海城区', '3', '536000', '0779', 'Haicheng', '109.1174400', '21.4750100');
INSERT INTO `sys_cn_area` VALUES ('450503', '银海区', '银海', '450500', null, '中国,广西壮族自治区,北海市,银海区', '3', '536000', '0779', 'Yinhai', '109.1302900', '21.4783000');
INSERT INTO `sys_cn_area` VALUES ('450512', '铁山港区', '铁山港', '450500', null, '中国,广西壮族自治区,北海市,铁山港区', '3', '536017', '0779', 'Tieshangang', '109.4557800', '21.5966100');
INSERT INTO `sys_cn_area` VALUES ('450521', '合浦县', '合浦', '450500', null, '中国,广西壮族自治区,北海市,合浦县', '3', '536100', '0779', 'Hepu', '109.2006800', '21.6660100');
INSERT INTO `sys_cn_area` VALUES ('450600', '防城港市', '防城港', '450000', null, '中国,广西壮族自治区,防城港市', '2', '538001', '0770', 'Fangchenggang', '108.3454780', '21.6146310');
INSERT INTO `sys_cn_area` VALUES ('450602', '港口区', '港口', '450600', null, '中国,广西壮族自治区,防城港市,港口区', '3', '538001', '0770', 'Gangkou', '108.3802200', '21.6434200');
INSERT INTO `sys_cn_area` VALUES ('450603', '防城区', '防城', '450600', null, '中国,广西壮族自治区,防城港市,防城区', '3', '538021', '0770', 'Fangcheng', '108.3572600', '21.7646400');
INSERT INTO `sys_cn_area` VALUES ('450621', '上思县', '上思', '450600', null, '中国,广西壮族自治区,防城港市,上思县', '3', '535500', '0770', 'Shangsi', '107.9823000', '22.1495700');
INSERT INTO `sys_cn_area` VALUES ('450681', '东兴市', '东兴', '450600', null, '中国,广西壮族自治区,防城港市,东兴市', '3', '538100', '0770', 'Dongxing', '107.9720400', '21.5471300');
INSERT INTO `sys_cn_area` VALUES ('450700', '钦州市', '钦州', '450000', null, '中国,广西壮族自治区,钦州市', '2', '535099', '0777', 'Qinzhou', '108.6241750', '21.9671270');
INSERT INTO `sys_cn_area` VALUES ('450702', '钦南区', '钦南', '450700', null, '中国,广西壮族自治区,钦州市,钦南区', '3', '535099', '0777', 'Qinnan', '108.6177500', '21.9513700');
INSERT INTO `sys_cn_area` VALUES ('450703', '钦北区', '钦北', '450700', null, '中国,广西壮族自治区,钦州市,钦北区', '3', '535099', '0777', 'Qinbei', '108.6303700', '21.9512700');
INSERT INTO `sys_cn_area` VALUES ('450721', '灵山县', '灵山', '450700', null, '中国,广西壮族自治区,钦州市,灵山县', '3', '535099', '0777', 'Lingshan', '109.2915300', '22.4165000');
INSERT INTO `sys_cn_area` VALUES ('450722', '浦北县', '浦北', '450700', null, '中国,广西壮族自治区,钦州市,浦北县', '3', '535099', '0777', 'Pubei', '109.5557200', '22.2688800');
INSERT INTO `sys_cn_area` VALUES ('450800', '贵港市', '贵港', '450000', null, '中国,广西壮族自治区,贵港市', '2', '537100', '0775', 'Guigang', '109.6021460', '23.0936000');
INSERT INTO `sys_cn_area` VALUES ('450802', '港北区', '港北', '450800', null, '中国,广西壮族自治区,贵港市,港北区', '3', '537100', '0775', 'Gangbei', '109.5722400', '23.1115300');
INSERT INTO `sys_cn_area` VALUES ('450803', '港南区', '港南', '450800', null, '中国,广西壮族自治区,贵港市,港南区', '3', '537100', '0775', 'Gangnan', '109.6061700', '23.0722600');
INSERT INTO `sys_cn_area` VALUES ('450804', '覃塘区', '覃塘', '450800', null, '中国,广西壮族自治区,贵港市,覃塘区', '3', '537121', '0775', 'Qintang', '109.4429300', '23.1267700');
INSERT INTO `sys_cn_area` VALUES ('450821', '平南县', '平南', '450800', null, '中国,广西壮族自治区,贵港市,平南县', '3', '537300', '0775', 'Pingnan', '110.3906200', '23.5420100');
INSERT INTO `sys_cn_area` VALUES ('450881', '桂平市', '桂平', '450800', null, '中国,广西壮族自治区,贵港市,桂平市', '3', '537200', '0775', 'Guiping', '110.0810500', '23.3933900');
INSERT INTO `sys_cn_area` VALUES ('450900', '玉林市', '玉林', '450000', null, '中国,广西壮族自治区,玉林市', '2', '537000', '0775', 'Yulin', '110.1543930', '22.6313600');
INSERT INTO `sys_cn_area` VALUES ('450902', '玉州区', '玉州', '450900', null, '中国,广西壮族自治区,玉林市,玉州区', '3', '537000', '0775', 'Yuzhou', '110.1511400', '22.6281000');
INSERT INTO `sys_cn_area` VALUES ('450903', '福绵区', '福绵', '450900', null, '中国,广西壮族自治区,玉林市,福绵区', '3', '537023', '0775', 'Fumian', '110.0648160', '22.5830570');
INSERT INTO `sys_cn_area` VALUES ('450904', '玉东新区', '玉东', '450900', null, '中国,广西壮族自治区,玉林市,玉东新区', '3', '537000', '0775', 'Yudong', '110.1543930', '22.6313600');
INSERT INTO `sys_cn_area` VALUES ('450921', '容县', '容县', '450900', null, '中国,广西壮族自治区,玉林市,容县', '3', '537500', '0775', 'Rongxian', '110.5559300', '22.8570100');
INSERT INTO `sys_cn_area` VALUES ('450922', '陆川县', '陆川', '450900', null, '中国,广西壮族自治区,玉林市,陆川县', '3', '537700', '0775', 'Luchuan', '110.2641300', '22.3245400');
INSERT INTO `sys_cn_area` VALUES ('450923', '博白县', '博白', '450900', null, '中国,广西壮族自治区,玉林市,博白县', '3', '537600', '0775', 'Bobai', '109.9774400', '22.2728600');
INSERT INTO `sys_cn_area` VALUES ('450924', '兴业县', '兴业', '450900', null, '中国,广西壮族自治区,玉林市,兴业县', '3', '537800', '0775', 'Xingye', '109.8761200', '22.7423700');
INSERT INTO `sys_cn_area` VALUES ('450981', '北流市', '北流', '450900', null, '中国,广西壮族自治区,玉林市,北流市', '3', '537400', '0775', 'Beiliu', '110.3530200', '22.7081700');
INSERT INTO `sys_cn_area` VALUES ('451000', '百色市', '百色', '450000', null, '中国,广西壮族自治区,百色市', '2', '533000', '0776', 'Baise', '106.6162850', '23.8977420');
INSERT INTO `sys_cn_area` VALUES ('451002', '右江区', '右江', '451000', null, '中国,广西壮族自治区,百色市,右江区', '3', '533000', '0776', 'Youjiang', '106.6176400', '23.9009000');
INSERT INTO `sys_cn_area` VALUES ('451021', '田阳县', '田阳', '451000', null, '中国,广西壮族自治区,百色市,田阳县', '3', '533600', '0776', 'Tianyang', '106.9155800', '23.7353500');
INSERT INTO `sys_cn_area` VALUES ('451022', '田东县', '田东', '451000', null, '中国,广西壮族自治区,百色市,田东县', '3', '531500', '0776', 'Tiandong', '107.1243200', '23.6000300');
INSERT INTO `sys_cn_area` VALUES ('451023', '平果县', '平果', '451000', null, '中国,广西壮族自治区,百色市,平果县', '3', '531400', '0776', 'Pingguo', '107.5904500', '23.3296900');
INSERT INTO `sys_cn_area` VALUES ('451024', '德保县', '德保', '451000', null, '中国,广西壮族自治区,百色市,德保县', '3', '533700', '0776', 'Debao', '106.6191700', '23.3251500');
INSERT INTO `sys_cn_area` VALUES ('451025', '靖西县', '靖西', '451000', null, '中国,广西壮族自治区,百色市,靖西县', '3', '533800', '0776', 'Jingxi', '106.4176600', '23.1342500');
INSERT INTO `sys_cn_area` VALUES ('451026', '那坡县', '那坡', '451000', null, '中国,广西壮族自治区,百色市,那坡县', '3', '533900', '0776', 'Napo', '105.8419100', '23.4064900');
INSERT INTO `sys_cn_area` VALUES ('451027', '凌云县', '凌云', '451000', null, '中国,广西壮族自治区,百色市,凌云县', '3', '533100', '0776', 'Lingyun', '106.5615500', '24.3474700');
INSERT INTO `sys_cn_area` VALUES ('451028', '乐业县', '乐业', '451000', null, '中国,广西壮族自治区,百色市,乐业县', '3', '533200', '0776', 'Leye', '106.5612400', '24.7829500');
INSERT INTO `sys_cn_area` VALUES ('451029', '田林县', '田林', '451000', null, '中国,广西壮族自治区,百色市,田林县', '3', '533300', '0776', 'Tianlin', '106.2288200', '24.2920700');
INSERT INTO `sys_cn_area` VALUES ('451030', '西林县', '西林', '451000', null, '中国,广西壮族自治区,百色市,西林县', '3', '533500', '0776', 'Xilin', '105.0972200', '24.4896600');
INSERT INTO `sys_cn_area` VALUES ('451031', '隆林各族自治县', '隆林', '451000', null, '中国,广西壮族自治区,百色市,隆林各族自治县', '3', '533400', '0776', 'Longlin', '105.3429500', '24.7703600');
INSERT INTO `sys_cn_area` VALUES ('451100', '贺州市', '贺州', '450000', null, '中国,广西壮族自治区,贺州市', '2', '542800', '0774', 'Hezhou', '111.5520560', '24.4141410');
INSERT INTO `sys_cn_area` VALUES ('451102', '八步区', '八步', '451100', null, '中国,广西壮族自治区,贺州市,八步区', '3', '542800', '0774', 'Babu', '111.5522500', '24.4117900');
INSERT INTO `sys_cn_area` VALUES ('451121', '昭平县', '昭平', '451100', null, '中国,广西壮族自治区,贺州市,昭平县', '3', '546800', '0774', 'Zhaoping', '110.8108200', '24.1701000');
INSERT INTO `sys_cn_area` VALUES ('451122', '钟山县', '钟山', '451100', null, '中国,广西壮族自治区,贺州市,钟山县', '3', '542600', '0774', 'Zhongshan', '111.3045900', '24.5248200');
INSERT INTO `sys_cn_area` VALUES ('451123', '富川瑶族自治县', '富川', '451100', null, '中国,广西壮族自治区,贺州市,富川瑶族自治县', '3', '542700', '0774', 'Fuchuan', '111.2776700', '24.8143100');
INSERT INTO `sys_cn_area` VALUES ('451124', '平桂管理区', '平桂', '451100', null, '中国,广西壮族自治区,贺州市,平桂管理区', '3', '542800', '0774', 'Pingui', '111.4856510', '24.4580410');
INSERT INTO `sys_cn_area` VALUES ('451200', '河池市', '河池', '450000', null, '中国,广西壮族自治区,河池市', '2', '547000', '0778', 'Hechi', '108.0621050', '24.6958990');
INSERT INTO `sys_cn_area` VALUES ('451202', '金城江区', '金城江', '451200', null, '中国,广西壮族自治区,河池市,金城江区', '3', '547000', '0779', 'Jinchengjiang', '108.0372700', '24.6897000');
INSERT INTO `sys_cn_area` VALUES ('451221', '南丹县', '南丹', '451200', null, '中国,广西壮族自治区,河池市,南丹县', '3', '547200', '0781', 'Nandan', '107.5456200', '24.9776000');
INSERT INTO `sys_cn_area` VALUES ('451222', '天峨县', '天峨', '451200', null, '中国,广西壮族自治区,河池市,天峨县', '3', '547300', '0782', 'Tiane', '107.1720500', '24.9959300');
INSERT INTO `sys_cn_area` VALUES ('451223', '凤山县', '凤山', '451200', null, '中国,广西壮族自治区,河池市,凤山县', '3', '547600', '0783', 'Fengshan', '107.0489200', '24.5421500');
INSERT INTO `sys_cn_area` VALUES ('451224', '东兰县', '东兰', '451200', null, '中国,广西壮族自治区,河池市,东兰县', '3', '547400', '0784', 'Donglan', '107.3752700', '24.5105300');
INSERT INTO `sys_cn_area` VALUES ('451225', '罗城仫佬族自治县', '罗城', '451200', null, '中国,广西壮族自治区,河池市,罗城仫佬族自治县', '3', '546400', '0785', 'Luocheng', '108.9077700', '24.7792300');
INSERT INTO `sys_cn_area` VALUES ('451226', '环江毛南族自治县', '环江', '451200', null, '中国,广西壮族自治区,河池市,环江毛南族自治县', '3', '547100', '0786', 'Huanjiang', '108.2605500', '24.8291600');
INSERT INTO `sys_cn_area` VALUES ('451227', '巴马瑶族自治县', '巴马', '451200', null, '中国,广西壮族自治区,河池市,巴马瑶族自治县', '3', '547500', '0787', 'Bama', '107.2530800', '24.1413500');
INSERT INTO `sys_cn_area` VALUES ('451228', '都安瑶族自治县', '都安', '451200', null, '中国,广西壮族自治区,河池市,都安瑶族自治县', '3', '530700', '0788', 'Du\'an', '108.1011600', '23.9324500');
INSERT INTO `sys_cn_area` VALUES ('451229', '大化瑶族自治县', '大化', '451200', null, '中国,广西壮族自治区,河池市,大化瑶族自治县', '3', '530800', '0789', 'Dahua', '107.9985000', '23.7448700');
INSERT INTO `sys_cn_area` VALUES ('451281', '宜州市', '宜州', '451200', null, '中国,广西壮族自治区,河池市,宜州市', '3', '546300', '0780', 'Yizhou', '108.6530400', '24.4939100');
INSERT INTO `sys_cn_area` VALUES ('451300', '来宾市', '来宾', '450000', null, '中国,广西壮族自治区,来宾市', '2', '546100', '0772', 'Laibin', '109.2297720', '23.7337660');
INSERT INTO `sys_cn_area` VALUES ('451302', '兴宾区', '兴宾', '451300', null, '中国,广西壮族自治区,来宾市,兴宾区', '3', '546100', '0772', 'Xingbin', '109.2347100', '23.7273100');
INSERT INTO `sys_cn_area` VALUES ('451321', '忻城县', '忻城', '451300', null, '中国,广西壮族自治区,来宾市,忻城县', '3', '546200', '0772', 'Xincheng', '108.6635700', '24.0686200');
INSERT INTO `sys_cn_area` VALUES ('451322', '象州县', '象州', '451300', null, '中国,广西壮族自治区,来宾市,象州县', '3', '545800', '0772', 'Xiangzhou', '109.6994000', '23.9735500');
INSERT INTO `sys_cn_area` VALUES ('451323', '武宣县', '武宣', '451300', null, '中国,广西壮族自治区,来宾市,武宣县', '3', '545900', '0772', 'Wuxuan', '109.6628400', '23.5947400');
INSERT INTO `sys_cn_area` VALUES ('451324', '金秀瑶族自治县', '金秀', '451300', null, '中国,广西壮族自治区,来宾市,金秀瑶族自治县', '3', '545799', '0772', 'Jinxiu', '110.1907900', '24.1292900');
INSERT INTO `sys_cn_area` VALUES ('451381', '合山市', '合山', '451300', null, '中国,广西壮族自治区,来宾市,合山市', '3', '546500', '0772', 'Heshan', '108.8858600', '23.8061900');
INSERT INTO `sys_cn_area` VALUES ('451400', '崇左市', '崇左', '450000', null, '中国,广西壮族自治区,崇左市', '2', '532299', '0771', 'Chongzuo', '107.3539260', '22.4041080');
INSERT INTO `sys_cn_area` VALUES ('451402', '江州区', '江州', '451400', null, '中国,广西壮族自治区,崇左市,江州区', '3', '532299', '0771', 'Jiangzhou', '107.3474700', '22.4113500');
INSERT INTO `sys_cn_area` VALUES ('451421', '扶绥县', '扶绥', '451400', null, '中国,广西壮族自治区,崇左市,扶绥县', '3', '532199', '0771', 'Fusui', '107.9040500', '22.6341300');
INSERT INTO `sys_cn_area` VALUES ('451422', '宁明县', '宁明', '451400', null, '中国,广西壮族自治区,崇左市,宁明县', '3', '532599', '0771', 'Ningming', '107.0729900', '22.1365500');
INSERT INTO `sys_cn_area` VALUES ('451423', '龙州县', '龙州', '451400', null, '中国,广西壮族自治区,崇左市,龙州县', '3', '532499', '0771', 'Longzhou', '106.8541500', '22.3393700');
INSERT INTO `sys_cn_area` VALUES ('451424', '大新县', '大新', '451400', null, '中国,广西壮族自治区,崇左市,大新县', '3', '532399', '0771', 'Daxin', '107.1982100', '22.8341200');
INSERT INTO `sys_cn_area` VALUES ('451425', '天等县', '天等', '451400', null, '中国,广西壮族自治区,崇左市,天等县', '3', '532899', '0771', 'Tiandeng', '107.1399800', '23.0770000');
INSERT INTO `sys_cn_area` VALUES ('451481', '凭祥市', '凭祥', '451400', null, '中国,广西壮族自治区,崇左市,凭祥市', '3', '532699', '0771', 'Pingxiang', '106.7553400', '22.1057300');
INSERT INTO `sys_cn_area` VALUES ('460000', '海南省', '海南', '100000', null, '中国,海南省', '1', null, '', 'Hainan', '110.3311900', '20.0319710');
INSERT INTO `sys_cn_area` VALUES ('460100', '海口市', '海口', '460000', null, '中国,海南省,海口市', '2', '570000', '0898', 'Haikou', '110.3311900', '20.0319710');
INSERT INTO `sys_cn_area` VALUES ('460105', '秀英区', '秀英', '460100', null, '中国,海南省,海口市,秀英区', '3', '570311', '0898', 'Xiuying', '110.2934500', '20.0075200');
INSERT INTO `sys_cn_area` VALUES ('460106', '龙华区', '龙华', '460100', null, '中国,海南省,海口市,龙华区', '3', '570145', '0898', 'Longhua', '110.3019400', '20.0286600');
INSERT INTO `sys_cn_area` VALUES ('460107', '琼山区', '琼山', '460100', null, '中国,海南省,海口市,琼山区', '3', '571100', '0898', 'Qiongshan', '110.3541800', '20.0032100');
INSERT INTO `sys_cn_area` VALUES ('460108', '美兰区', '美兰', '460100', null, '中国,海南省,海口市,美兰区', '3', '570203', '0898', 'Meilan', '110.3690800', '20.0286400');
INSERT INTO `sys_cn_area` VALUES ('460200', '三亚市', '三亚', '460000', null, '中国,海南省,三亚市', '2', '572000', '0898', 'Sanya', '109.5082680', '18.2478720');
INSERT INTO `sys_cn_area` VALUES ('460202', '海棠区', '海棠', '460200', null, '中国,海南省,三亚市,海棠区', '3', '572000', '0898', 'Haitang', '109.5082680', '18.2478720');
INSERT INTO `sys_cn_area` VALUES ('460203', '吉阳区', '吉阳', '460200', null, '中国,海南省,三亚市,吉阳区', '3', '572000', '0898', 'Jiyang', '109.5082680', '18.2478720');
INSERT INTO `sys_cn_area` VALUES ('460204', '天涯区', '天涯', '460200', null, '中国,海南省,三亚市,天涯区', '3', '572000', '0898', 'Tianya', '109.5082680', '18.2478720');
INSERT INTO `sys_cn_area` VALUES ('460205', '崖州区', '崖州', '460200', null, '中国,海南省,三亚市,崖州区', '3', '572000', '0898', 'Yazhou', '109.5082680', '18.2478720');
INSERT INTO `sys_cn_area` VALUES ('460300', '三沙市', '三沙', '460000', null, '中国,海南省,三沙市', '2', '573199', '0898', 'Sansha', '112.3488200', '16.8310390');
INSERT INTO `sys_cn_area` VALUES ('460321', '西沙群岛', '西沙', '460300', null, '中国,海南省,三沙市,西沙群岛', '3', '572000', '0898', 'Xisha Islands', '112.0255280', '16.3313420');
INSERT INTO `sys_cn_area` VALUES ('460322', '南沙群岛', '南沙', '460300', null, '中国,海南省,三沙市,南沙群岛', '3', '573100', '0898', 'Nansha Islands', '116.7499980', '11.4718880');
INSERT INTO `sys_cn_area` VALUES ('460323', '中沙群岛', '中沙', '460300', null, '中国,海南省,三沙市,中沙群岛', '3', '573100', '0898', 'Zhongsha Islands', '117.7400710', '15.1128560');
INSERT INTO `sys_cn_area` VALUES ('469000', '直辖县级', ' ', '460000', null, '中国,海南省,直辖县级', '2', null, '', '', '109.5034790', '18.7399060');
INSERT INTO `sys_cn_area` VALUES ('469001', '五指山市', '五指山', '469000', null, '中国,海南省,直辖县级,五指山市', '3', '572200', '0898', 'Wuzhishan', '109.5166620', '18.7769210');
INSERT INTO `sys_cn_area` VALUES ('469002', '琼海市', '琼海', '469000', null, '中国,海南省,直辖县级,琼海市', '3', '571400', '0898', 'Qionghai', '110.4667850', '19.2460110');
INSERT INTO `sys_cn_area` VALUES ('469003', '儋州市', '儋州', '469000', null, '中国,海南省,直辖县级,儋州市', '3', '571700', '0898', 'Danzhou', '109.5767820', '19.5174860');
INSERT INTO `sys_cn_area` VALUES ('469005', '文昌市', '文昌', '469000', null, '中国,海南省,直辖县级,文昌市', '3', '571339', '0898', 'Wenchang', '110.7539750', '19.6129860');
INSERT INTO `sys_cn_area` VALUES ('469006', '万宁市', '万宁', '469000', null, '中国,海南省,直辖县级,万宁市', '3', '571500', '0898', 'Wanning', '110.3887930', '18.7962160');
INSERT INTO `sys_cn_area` VALUES ('469007', '东方市', '东方', '469000', null, '中国,海南省,直辖县级,东方市', '3', '572600', '0898', 'Dongfang', '108.6537890', '19.1019800');
INSERT INTO `sys_cn_area` VALUES ('469021', '定安县', '定安', '469000', null, '中国,海南省,直辖县级,定安县', '3', '571200', '0898', 'Ding\'an', '110.3239590', '19.6992110');
INSERT INTO `sys_cn_area` VALUES ('469022', '屯昌县', '屯昌', '469000', null, '中国,海南省,直辖县级,屯昌县', '3', '571600', '0898', 'Tunchang', '110.1027730', '19.3629160');
INSERT INTO `sys_cn_area` VALUES ('469023', '澄迈县', '澄迈', '469000', null, '中国,海南省,直辖县级,澄迈县', '3', '571900', '0898', 'Chengmai', '110.0071470', '19.7370950');
INSERT INTO `sys_cn_area` VALUES ('469024', '临高县', '临高', '469000', null, '中国,海南省,直辖县级,临高县', '3', '571800', '0898', 'Lingao', '109.6876970', '19.9082930');
INSERT INTO `sys_cn_area` VALUES ('469025', '白沙黎族自治县', '白沙', '469000', null, '中国,海南省,直辖县级,白沙黎族自治县', '3', '572800', '0898', 'Baisha', '109.4526060', '19.2245840');
INSERT INTO `sys_cn_area` VALUES ('469026', '昌江黎族自治县', '昌江', '469000', null, '中国,海南省,直辖县级,昌江黎族自治县', '3', '572700', '0898', 'Changjiang', '109.0533510', '19.2609680');
INSERT INTO `sys_cn_area` VALUES ('469027', '乐东黎族自治县', '乐东', '469000', null, '中国,海南省,直辖县级,乐东黎族自治县', '3', '572500', '0898', 'Ledong', '109.1754440', '18.7475800');
INSERT INTO `sys_cn_area` VALUES ('469028', '陵水黎族自治县', '陵水', '469000', null, '中国,海南省,直辖县级,陵水黎族自治县', '3', '572400', '0898', 'Lingshui', '110.0372180', '18.5050060');
INSERT INTO `sys_cn_area` VALUES ('469029', '保亭黎族苗族自治县', '保亭', '469000', null, '中国,海南省,直辖县级,保亭黎族苗族自治县', '3', '572300', '0898', 'Baoting', '109.7024500', '18.6363710');
INSERT INTO `sys_cn_area` VALUES ('469030', '琼中黎族苗族自治县', '琼中', '469000', null, '中国,海南省,直辖县级,琼中黎族苗族自治县', '3', '572900', '0898', 'Qiongzhong', '109.8399960', '19.0355700');
INSERT INTO `sys_cn_area` VALUES ('500000', '重庆', '重庆', '100000', null, '中国,重庆', '1', null, '', 'Chongqing', '106.5049620', '29.5331550');
INSERT INTO `sys_cn_area` VALUES ('500100', '重庆市', '重庆', '500000', null, '中国,重庆,重庆市', '2', '400000', '023', 'Chongqing', '106.5049620', '29.5331550');
INSERT INTO `sys_cn_area` VALUES ('500101', '万州区', '万州', '500100', null, '中国,重庆,重庆市,万州区', '3', '404000', '023', 'Wanzhou', '108.4086900', '30.8078800');
INSERT INTO `sys_cn_area` VALUES ('500102', '涪陵区', '涪陵', '500100', null, '中国,重庆,重庆市,涪陵区', '3', '408000', '023', 'Fuling', '107.3900700', '29.7029200');
INSERT INTO `sys_cn_area` VALUES ('500103', '渝中区', '渝中', '500100', null, '中国,重庆,重庆市,渝中区', '3', '400010', '023', 'Yuzhong', '106.5690100', '29.5527900');
INSERT INTO `sys_cn_area` VALUES ('500104', '大渡口区', '大渡口', '500100', null, '中国,重庆,重庆市,大渡口区', '3', '400080', '023', 'Dadukou', '106.4826200', '29.4844700');
INSERT INTO `sys_cn_area` VALUES ('500105', '江北区', '江北', '500100', null, '中国,重庆,重庆市,江北区', '3', '400020', '023', 'Jiangbei', '106.5743400', '29.6065800');
INSERT INTO `sys_cn_area` VALUES ('500106', '沙坪坝区', '沙坪坝', '500100', null, '中国,重庆,重庆市,沙坪坝区', '3', '400030', '023', 'Shapingba', '106.4575200', '29.5411300');
INSERT INTO `sys_cn_area` VALUES ('500107', '九龙坡区', '九龙坡', '500100', null, '中国,重庆,重庆市,九龙坡区', '3', '400050', '023', 'Jiulongpo', '106.5110700', '29.5019700');
INSERT INTO `sys_cn_area` VALUES ('500108', '南岸区', '南岸', '500100', null, '中国,重庆,重庆市,南岸区', '3', '400064', '023', 'Nan\'an', '106.5634700', '29.5231100');
INSERT INTO `sys_cn_area` VALUES ('500109', '北碚区', '北碚', '500100', null, '中国,重庆,重庆市,北碚区', '3', '400700', '023', 'Beibei', '106.3961400', '29.8057400');
INSERT INTO `sys_cn_area` VALUES ('500110', '綦江区', '綦江', '500100', null, '中国,重庆,重庆市,綦江区', '3', '400800', '023', 'Qijiang', '106.9267790', '28.9606560');
INSERT INTO `sys_cn_area` VALUES ('500111', '大足区', '大足', '500100', null, '中国,重庆,重庆市,大足区', '3', '400900', '023', 'Dazu', '105.7681210', '29.4840250');
INSERT INTO `sys_cn_area` VALUES ('500112', '渝北区', '渝北', '500100', null, '中国,重庆,重庆市,渝北区', '3', '401120', '023', 'Yubei', '106.6307000', '29.7182000');
INSERT INTO `sys_cn_area` VALUES ('500113', '巴南区', '巴南', '500100', null, '中国,重庆,重庆市,巴南区', '3', '401320', '023', 'Banan', '106.5236500', '29.3831100');
INSERT INTO `sys_cn_area` VALUES ('500114', '黔江区', '黔江', '500100', null, '中国,重庆,重庆市,黔江区', '3', '409700', '023', 'Qianjiang', '108.7709000', '29.5332000');
INSERT INTO `sys_cn_area` VALUES ('500115', '长寿区', '长寿', '500100', null, '中国,重庆,重庆市,长寿区', '3', '401220', '023', 'Changshou', '107.0816600', '29.8535900');
INSERT INTO `sys_cn_area` VALUES ('500116', '江津区', '江津', '500100', null, '中国,重庆,重庆市,江津区', '3', '402260', '023', 'Jiangjin', '106.2591200', '29.2900800');
INSERT INTO `sys_cn_area` VALUES ('500117', '合川区', '合川', '500100', null, '中国,重庆,重庆市,合川区', '3', '401520', '023', 'Hechuan', '106.2763300', '29.9722700');
INSERT INTO `sys_cn_area` VALUES ('500118', '永川区', '永川', '500100', null, '中国,重庆,重庆市,永川区', '3', '402160', '023', 'Yongchuan', '105.9270000', '29.3559300');
INSERT INTO `sys_cn_area` VALUES ('500119', '南川区', '南川', '500100', null, '中国,重庆,重庆市,南川区', '3', '408400', '023', 'Nanchuan', '107.0993600', '29.1575100');
INSERT INTO `sys_cn_area` VALUES ('500120', '璧山区', '璧山', '500100', null, '中国,重庆,重庆市,璧山区', '3', '402760', '023', 'Bishan', '106.2311260', '29.5935810');
INSERT INTO `sys_cn_area` VALUES ('500151', '铜梁区', '铜梁', '500100', null, '中国,重庆,重庆市,铜梁区', '3', '402560', '023', 'Tongliang', '106.0549480', '29.8399440');
INSERT INTO `sys_cn_area` VALUES ('500223', '潼南县', '潼南', '500100', null, '中国,重庆,重庆市,潼南县', '3', '402660', '023', 'Tongnan', '105.8400500', '30.1912000');
INSERT INTO `sys_cn_area` VALUES ('500226', '荣昌县', '荣昌', '500100', null, '中国,重庆,重庆市,荣昌县', '3', '402460', '023', 'Rongchang', '105.5944200', '29.4048800');
INSERT INTO `sys_cn_area` VALUES ('500228', '梁平县', '梁平', '500100', null, '中国,重庆,重庆市,梁平县', '3', '405200', '023', 'Liangping', '107.7999800', '30.6754500');
INSERT INTO `sys_cn_area` VALUES ('500229', '城口县', '城口', '500100', null, '中国,重庆,重庆市,城口县', '3', '405900', '023', 'Chengkou', '108.6651300', '31.9480100');
INSERT INTO `sys_cn_area` VALUES ('500230', '丰都县', '丰都', '500100', null, '中国,重庆,重庆市,丰都县', '3', '408200', '023', 'Fengdu', '107.7309800', '29.8634800');
INSERT INTO `sys_cn_area` VALUES ('500231', '垫江县', '垫江', '500100', null, '中国,重庆,重庆市,垫江县', '3', '408300', '023', 'Dianjiang', '107.3544600', '30.3335900');
INSERT INTO `sys_cn_area` VALUES ('500232', '武隆县', '武隆', '500100', null, '中国,重庆,重庆市,武隆县', '3', '408500', '023', 'Wulong', '107.7601000', '29.3254800');
INSERT INTO `sys_cn_area` VALUES ('500233', '忠县', '忠县', '500100', null, '中国,重庆,重庆市,忠县', '3', '404300', '023', 'Zhongxian', '108.0368900', '30.2889800');
INSERT INTO `sys_cn_area` VALUES ('500234', '开县', '开县', '500100', null, '中国,重庆,重庆市,开县', '3', '405400', '023', 'Kaixian', '108.3930600', '31.1609500');
INSERT INTO `sys_cn_area` VALUES ('500235', '云阳县', '云阳', '500100', null, '中国,重庆,重庆市,云阳县', '3', '404500', '023', 'Yunyang', '108.6972600', '30.9306200');
INSERT INTO `sys_cn_area` VALUES ('500236', '奉节县', '奉节', '500100', null, '中国,重庆,重庆市,奉节县', '3', '404600', '023', 'Fengjie', '109.4647800', '31.0182500');
INSERT INTO `sys_cn_area` VALUES ('500237', '巫山县', '巫山', '500100', null, '中国,重庆,重庆市,巫山县', '3', '404700', '023', 'Wushan', '109.8781400', '31.0745800');
INSERT INTO `sys_cn_area` VALUES ('500238', '巫溪县', '巫溪', '500100', null, '中国,重庆,重庆市,巫溪县', '3', '405800', '023', 'Wuxi', '109.6312800', '31.3975600');
INSERT INTO `sys_cn_area` VALUES ('500240', '石柱土家族自治县', '石柱', '500100', null, '中国,重庆,重庆市,石柱土家族自治县', '3', '409100', '023', 'Shizhu', '108.1138900', '30.0005400');
INSERT INTO `sys_cn_area` VALUES ('500241', '秀山土家族苗族自治县', '秀山', '500100', null, '中国,重庆,重庆市,秀山土家族苗族自治县', '3', '409900', '023', 'Xiushan', '108.9886100', '28.4506200');
INSERT INTO `sys_cn_area` VALUES ('500242', '酉阳土家族苗族自治县', '酉阳', '500100', null, '中国,重庆,重庆市,酉阳土家族苗族自治县', '3', '409800', '023', 'Youyang', '108.7721200', '28.8446000');
INSERT INTO `sys_cn_area` VALUES ('500243', '彭水苗族土家族自治县', '彭水', '500100', null, '中国,重庆,重庆市,彭水苗族土家族自治县', '3', '409600', '023', 'Pengshui', '108.1663800', '29.2951600');
INSERT INTO `sys_cn_area` VALUES ('500300', '两江新区', '两江新区', '500000', null, '中国,重庆,两江新区', '2', '400000', '023', 'Liangjiangxinqu', '106.4633440', '29.7291530');
INSERT INTO `sys_cn_area` VALUES ('500301', '北部新区', '北部新区', '500300', null, '中国,重庆,两江新区,北部新区', '3', '400000', '023', 'Beibuxinqu', '106.4888410', '29.6670620');
INSERT INTO `sys_cn_area` VALUES ('500302', '保税港区', '保税港区', '500300', null, '中国,重庆,两江新区,保税港区', '3', '400000', '023', 'Baoshuigangqu', '106.6381840', '29.7163110');
INSERT INTO `sys_cn_area` VALUES ('500303', '工业园区', '工业园区', '500300', null, '中国,重庆,两江新区,工业园区', '3', '400000', '023', 'Gongyeyuanqu', '106.6264340', '29.5555400');
INSERT INTO `sys_cn_area` VALUES ('510000', '四川省', '四川', '100000', null, '中国,四川省', '1', null, '', 'Sichuan', '104.0657350', '30.6594620');
INSERT INTO `sys_cn_area` VALUES ('510100', '成都市', '成都', '510000', null, '中国,四川省,成都市', '2', '610015', '028', 'Chengdu', '104.0657350', '30.6594620');
INSERT INTO `sys_cn_area` VALUES ('510104', '锦江区', '锦江', '510100', null, '中国,四川省,成都市,锦江区', '3', '610021', '028', 'Jinjiang', '104.0834700', '30.6561400');
INSERT INTO `sys_cn_area` VALUES ('510105', '青羊区', '青羊', '510100', null, '中国,四川省,成都市,青羊区', '3', '610031', '028', 'Qingyang', '104.0615100', '30.6738700');
INSERT INTO `sys_cn_area` VALUES ('510106', '金牛区', '金牛', '510100', null, '中国,四川省,成都市,金牛区', '3', '610036', '028', 'Jinniu', '104.0511400', '30.6912600');
INSERT INTO `sys_cn_area` VALUES ('510107', '武侯区', '武侯', '510100', null, '中国,四川省,成都市,武侯区', '3', '610041', '028', 'Wuhou', '104.0430300', '30.6423500');
INSERT INTO `sys_cn_area` VALUES ('510108', '成华区', '成华', '510100', null, '中国,四川省,成都市,成华区', '3', '610066', '028', 'Chenghua', '104.1019300', '30.6599300');
INSERT INTO `sys_cn_area` VALUES ('510112', '龙泉驿区', '龙泉驿', '510100', null, '中国,四川省,成都市,龙泉驿区', '3', '610100', '028', 'Longquanyi', '104.2746200', '30.5565800');
INSERT INTO `sys_cn_area` VALUES ('510113', '青白江区', '青白江', '510100', null, '中国,四川省,成都市,青白江区', '3', '610300', '028', 'Qingbaijiang', '104.2510000', '30.8784100');
INSERT INTO `sys_cn_area` VALUES ('510114', '新都区', '新都', '510100', null, '中国,四川省,成都市,新都区', '3', '610500', '028', 'Xindu', '104.1592100', '30.8231400');
INSERT INTO `sys_cn_area` VALUES ('510115', '温江区', '温江', '510100', null, '中国,四川省,成都市,温江区', '3', '611130', '028', 'Wenjiang', '103.8488100', '30.6844400');
INSERT INTO `sys_cn_area` VALUES ('510121', '金堂县', '金堂', '510100', null, '中国,四川省,成都市,金堂县', '3', '610400', '028', 'Jintang', '104.4119500', '30.8619500');
INSERT INTO `sys_cn_area` VALUES ('510122', '双流县', '双流', '510100', null, '中国,四川省,成都市,双流县', '3', '610200', '028', 'Shuangliu', '103.9237300', '30.5744400');
INSERT INTO `sys_cn_area` VALUES ('510124', '郫县', '郫县', '510100', null, '中国,四川省,成都市,郫县', '3', '611730', '028', 'Pixian', '103.8871700', '30.8105400');
INSERT INTO `sys_cn_area` VALUES ('510129', '大邑县', '大邑', '510100', null, '中国,四川省,成都市,大邑县', '3', '611330', '028', 'Dayi', '103.5207500', '30.5873800');
INSERT INTO `sys_cn_area` VALUES ('510131', '蒲江县', '蒲江', '510100', null, '中国,四川省,成都市,蒲江县', '3', '611630', '028', 'Pujiang', '103.5061600', '30.1966700');
INSERT INTO `sys_cn_area` VALUES ('510132', '新津县', '新津', '510100', null, '中国,四川省,成都市,新津县', '3', '611430', '028', 'Xinjin', '103.8114000', '30.4098300');
INSERT INTO `sys_cn_area` VALUES ('510181', '都江堰市', '都江堰', '510100', null, '中国,四川省,成都市,都江堰市', '3', '611830', '028', 'Dujiangyan', '103.6194100', '30.9982500');
INSERT INTO `sys_cn_area` VALUES ('510182', '彭州市', '彭州', '510100', null, '中国,四川省,成都市,彭州市', '3', '611930', '028', 'Pengzhou', '103.9580000', '30.9901100');
INSERT INTO `sys_cn_area` VALUES ('510183', '邛崃市', '邛崃', '510100', null, '中国,四川省,成都市,邛崃市', '3', '611530', '028', 'Qionglai', '103.4628300', '30.4148900');
INSERT INTO `sys_cn_area` VALUES ('510184', '崇州市', '崇州', '510100', null, '中国,四川省,成都市,崇州市', '3', '611230', '028', 'Chongzhou', '103.6728500', '30.6301400');
INSERT INTO `sys_cn_area` VALUES ('510300', '自贡市', '自贡', '510000', null, '中国,四川省,自贡市', '2', '643000', '0813', 'Zigong', '104.7734470', '29.3527650');
INSERT INTO `sys_cn_area` VALUES ('510302', '自流井区', '自流井', '510300', null, '中国,四川省,自贡市,自流井区', '3', '643000', '0813', 'Ziliujing', '104.7771900', '29.3374500');
INSERT INTO `sys_cn_area` VALUES ('510303', '贡井区', '贡井', '510300', null, '中国,四川省,自贡市,贡井区', '3', '643020', '0813', 'Gongjing', '104.7153600', '29.3457600');
INSERT INTO `sys_cn_area` VALUES ('510304', '大安区', '大安', '510300', null, '中国,四川省,自贡市,大安区', '3', '643010', '0813', 'Da\'an', '104.7738300', '29.3636400');
INSERT INTO `sys_cn_area` VALUES ('510311', '沿滩区', '沿滩', '510300', null, '中国,四川省,自贡市,沿滩区', '3', '643030', '0813', 'Yantan', '104.8801200', '29.2661100');
INSERT INTO `sys_cn_area` VALUES ('510321', '荣县', '荣县', '510300', null, '中国,四川省,自贡市,荣县', '3', '643100', '0813', 'Rongxian', '104.4176000', '29.4444500');
INSERT INTO `sys_cn_area` VALUES ('510322', '富顺县', '富顺', '510300', null, '中国,四川省,自贡市,富顺县', '3', '643200', '0813', 'Fushun', '104.9749100', '29.1812300');
INSERT INTO `sys_cn_area` VALUES ('510400', '攀枝花市', '攀枝花', '510000', null, '中国,四川省,攀枝花市', '2', '617000', '0812', 'Panzhihua', '101.7160070', '26.5804460');
INSERT INTO `sys_cn_area` VALUES ('510402', '东区', '东区', '510400', null, '中国,四川省,攀枝花市,东区', '3', '617067', '0812', 'Dongqu', '101.7052000', '26.5467700');
INSERT INTO `sys_cn_area` VALUES ('510403', '西区', '西区', '510400', null, '中国,四川省,攀枝花市,西区', '3', '617068', '0812', 'Xiqu', '101.6305800', '26.5975300');
INSERT INTO `sys_cn_area` VALUES ('510411', '仁和区', '仁和', '510400', null, '中国,四川省,攀枝花市,仁和区', '3', '617061', '0812', 'Renhe', '101.7381200', '26.4984100');
INSERT INTO `sys_cn_area` VALUES ('510421', '米易县', '米易', '510400', null, '中国,四川省,攀枝花市,米易县', '3', '617200', '0812', 'Miyi', '102.1113200', '26.8871800');
INSERT INTO `sys_cn_area` VALUES ('510422', '盐边县', '盐边', '510400', null, '中国,四川省,攀枝花市,盐边县', '3', '617100', '0812', 'Yanbian', '101.8544600', '26.6884700');
INSERT INTO `sys_cn_area` VALUES ('510500', '泸州市', '泸州', '510000', null, '中国,四川省,泸州市', '2', '646000', '0830', 'Luzhou', '105.4433480', '28.8891380');
INSERT INTO `sys_cn_area` VALUES ('510502', '江阳区', '江阳', '510500', null, '中国,四川省,泸州市,江阳区', '3', '646000', '0830', 'Jiangyang', '105.4533600', '28.8893400');
INSERT INTO `sys_cn_area` VALUES ('510503', '纳溪区', '纳溪', '510500', null, '中国,四川省,泸州市,纳溪区', '3', '646300', '0830', 'Naxi', '105.3725500', '28.7734300');
INSERT INTO `sys_cn_area` VALUES ('510504', '龙马潭区', '龙马潭', '510500', null, '中国,四川省,泸州市,龙马潭区', '3', '646000', '0830', 'Longmatan', '105.4377400', '28.9130800');
INSERT INTO `sys_cn_area` VALUES ('510521', '泸县', '泸县', '510500', null, '中国,四川省,泸州市,泸县', '3', '646106', '0830', 'Luxian', '105.3819200', '29.1504100');
INSERT INTO `sys_cn_area` VALUES ('510522', '合江县', '合江', '510500', null, '中国,四川省,泸州市,合江县', '3', '646200', '0830', 'Hejiang', '105.8352000', '28.8100500');
INSERT INTO `sys_cn_area` VALUES ('510524', '叙永县', '叙永', '510500', null, '中国,四川省,泸州市,叙永县', '3', '646400', '0830', 'Xuyong', '105.4447300', '28.1558600');
INSERT INTO `sys_cn_area` VALUES ('510525', '古蔺县', '古蔺', '510500', null, '中国,四川省,泸州市,古蔺县', '3', '646500', '0830', 'Gulin', '105.8134700', '28.0386700');
INSERT INTO `sys_cn_area` VALUES ('510600', '德阳市', '德阳', '510000', null, '中国,四川省,德阳市', '2', '618000', '0838', 'Deyang', '104.3986510', '31.1279910');
INSERT INTO `sys_cn_area` VALUES ('510603', '旌阳区', '旌阳', '510600', null, '中国,四川省,德阳市,旌阳区', '3', '618000', '0838', 'Jingyang', '104.3936700', '31.1390600');
INSERT INTO `sys_cn_area` VALUES ('510623', '中江县', '中江', '510600', null, '中国,四川省,德阳市,中江县', '3', '618100', '0838', 'Zhongjiang', '104.6786100', '31.0329700');
INSERT INTO `sys_cn_area` VALUES ('510626', '罗江县', '罗江', '510600', null, '中国,四川省,德阳市,罗江县', '3', '618500', '0838', 'Luojiang', '104.5102500', '31.3166500');
INSERT INTO `sys_cn_area` VALUES ('510681', '广汉市', '广汉', '510600', null, '中国,四川省,德阳市,广汉市', '3', '618300', '0838', 'Guanghan', '104.2823400', '30.9768600');
INSERT INTO `sys_cn_area` VALUES ('510682', '什邡市', '什邡', '510600', null, '中国,四川省,德阳市,什邡市', '3', '618400', '0838', 'Shifang', '104.1675400', '31.1264000');
INSERT INTO `sys_cn_area` VALUES ('510683', '绵竹市', '绵竹', '510600', null, '中国,四川省,德阳市,绵竹市', '3', '618200', '0838', 'Mianzhu', '104.2207600', '31.3377200');
INSERT INTO `sys_cn_area` VALUES ('510700', '绵阳市', '绵阳', '510000', null, '中国,四川省,绵阳市', '2', '621000', '0816', 'Mianyang', '104.7417220', '31.4640200');
INSERT INTO `sys_cn_area` VALUES ('510703', '涪城区', '涪城', '510700', null, '中国,四川省,绵阳市,涪城区', '3', '621000', '0816', 'Fucheng', '104.7571900', '31.4552200');
INSERT INTO `sys_cn_area` VALUES ('510704', '游仙区', '游仙', '510700', null, '中国,四川省,绵阳市,游仙区', '3', '621022', '0816', 'Youxian', '104.7709200', '31.4657400');
INSERT INTO `sys_cn_area` VALUES ('510722', '三台县', '三台', '510700', null, '中国,四川省,绵阳市,三台县', '3', '621100', '0816', 'Santai', '105.0907900', '31.0917900');
INSERT INTO `sys_cn_area` VALUES ('510723', '盐亭县', '盐亭', '510700', null, '中国,四川省,绵阳市,盐亭县', '3', '621600', '0816', 'Yanting', '105.3898000', '31.2217600');
INSERT INTO `sys_cn_area` VALUES ('510724', '安县', '安县', '510700', null, '中国,四川省,绵阳市,安县', '3', '622650', '0816', 'Anxian', '104.5673800', '31.5348700');
INSERT INTO `sys_cn_area` VALUES ('510725', '梓潼县', '梓潼', '510700', null, '中国,四川省,绵阳市,梓潼县', '3', '622150', '0816', 'Zitong', '105.1618300', '31.6359000');
INSERT INTO `sys_cn_area` VALUES ('510726', '北川羌族自治县', '北川', '510700', null, '中国,四川省,绵阳市,北川羌族自治县', '3', '622750', '0816', 'Beichuan', '104.4640800', '31.8328600');
INSERT INTO `sys_cn_area` VALUES ('510727', '平武县', '平武', '510700', null, '中国,四川省,绵阳市,平武县', '3', '622550', '0816', 'Pingwu', '104.5286200', '32.4079100');
INSERT INTO `sys_cn_area` VALUES ('510781', '江油市', '江油', '510700', null, '中国,四川省,绵阳市,江油市', '3', '621700', '0816', 'Jiangyou', '104.7453900', '31.7777500');
INSERT INTO `sys_cn_area` VALUES ('510800', '广元市', '广元', '510000', null, '中国,四川省,广元市', '2', '628000', '0839', 'Guangyuan', '105.8297570', '32.4336680');
INSERT INTO `sys_cn_area` VALUES ('510802', '利州区', '利州', '510800', null, '中国,四川省,广元市,利州区', '3', '628017', '0839', 'Lizhou', '105.8261940', '32.4322760');
INSERT INTO `sys_cn_area` VALUES ('510811', '昭化区', '昭化', '510800', null, '中国,四川省,广元市,昭化区', '3', '628017', '0839', 'Zhaohua', '105.6404910', '32.3865180');
INSERT INTO `sys_cn_area` VALUES ('510812', '朝天区', '朝天', '510800', null, '中国,四川省,广元市,朝天区', '3', '628017', '0839', 'Chaotian', '105.8927300', '32.6439800');
INSERT INTO `sys_cn_area` VALUES ('510821', '旺苍县', '旺苍', '510800', null, '中国,四川省,广元市,旺苍县', '3', '628200', '0839', 'Wangcang', '106.2902200', '32.2284500');
INSERT INTO `sys_cn_area` VALUES ('510822', '青川县', '青川', '510800', null, '中国,四川省,广元市,青川县', '3', '628100', '0839', 'Qingchuan', '105.2391000', '32.5856300');
INSERT INTO `sys_cn_area` VALUES ('510823', '剑阁县', '剑阁', '510800', null, '中国,四川省,广元市,剑阁县', '3', '628300', '0839', 'Jiange', '105.5252000', '32.2884500');
INSERT INTO `sys_cn_area` VALUES ('510824', '苍溪县', '苍溪', '510800', null, '中国,四川省,广元市,苍溪县', '3', '628400', '0839', 'Cangxi', '105.9360000', '31.7320900');
INSERT INTO `sys_cn_area` VALUES ('510900', '遂宁市', '遂宁', '510000', null, '中国,四川省,遂宁市', '2', '629000', '0825', 'Suining', '105.5713310', '30.5133110');
INSERT INTO `sys_cn_area` VALUES ('510903', '船山区', '船山', '510900', null, '中国,四川省,遂宁市,船山区', '3', '629000', '0825', 'Chuanshan', '105.5809000', '30.4999100');
INSERT INTO `sys_cn_area` VALUES ('510904', '安居区', '安居', '510900', null, '中国,四川省,遂宁市,安居区', '3', '629000', '0825', 'Anju', '105.4640200', '30.3577800');
INSERT INTO `sys_cn_area` VALUES ('510921', '蓬溪县', '蓬溪', '510900', null, '中国,四川省,遂宁市,蓬溪县', '3', '629100', '0825', 'Pengxi', '105.7075200', '30.7577500');
INSERT INTO `sys_cn_area` VALUES ('510922', '射洪县', '射洪', '510900', null, '中国,四川省,遂宁市,射洪县', '3', '629200', '0825', 'Shehong', '105.3892200', '30.8720300');
INSERT INTO `sys_cn_area` VALUES ('510923', '大英县', '大英', '510900', null, '中国,四川省,遂宁市,大英县', '3', '629300', '0825', 'Daying', '105.2434600', '30.5943400');
INSERT INTO `sys_cn_area` VALUES ('511000', '内江市', '内江', '510000', null, '中国,四川省,内江市', '2', '641000', '0832', 'Neijiang', '105.0661380', '29.5870800');
INSERT INTO `sys_cn_area` VALUES ('511002', '市中区', '市中区', '511000', null, '中国,四川省,内江市,市中区', '3', '641000', '0832', 'Shizhongqu', '105.0679000', '29.5870900');
INSERT INTO `sys_cn_area` VALUES ('511011', '东兴区', '东兴', '511000', null, '中国,四川省,内江市,东兴区', '3', '641100', '0832', 'Dongxing', '105.0755400', '29.5927800');
INSERT INTO `sys_cn_area` VALUES ('511024', '威远县', '威远', '511000', null, '中国,四川省,内江市,威远县', '3', '642450', '0832', 'Weiyuan', '104.6695500', '29.5282300');
INSERT INTO `sys_cn_area` VALUES ('511025', '资中县', '资中', '511000', null, '中国,四川省,内江市,资中县', '3', '641200', '0832', 'Zizhong', '104.8520500', '29.7640900');
INSERT INTO `sys_cn_area` VALUES ('511028', '隆昌县', '隆昌', '511000', null, '中国,四川省,内江市,隆昌县', '3', '642150', '0832', 'Longchang', '105.2873800', '29.3393700');
INSERT INTO `sys_cn_area` VALUES ('511100', '乐山市', '乐山', '510000', null, '中国,四川省,乐山市', '2', '614000', '0833', 'Leshan', '103.7612630', '29.5820240');
INSERT INTO `sys_cn_area` VALUES ('511102', '市中区', '市中区', '511100', null, '中国,四川省,乐山市,市中区', '3', '614000', '0833', 'Shizhongqu', '103.7615900', '29.5554300');
INSERT INTO `sys_cn_area` VALUES ('511111', '沙湾区', '沙湾', '511100', null, '中国,四川省,乐山市,沙湾区', '3', '614900', '0833', 'Shawan', '103.5487300', '29.4119400');
INSERT INTO `sys_cn_area` VALUES ('511112', '五通桥区', '五通桥', '511100', null, '中国,四川省,乐山市,五通桥区', '3', '614800', '0833', 'Wutongqiao', '103.8234500', '29.4034400');
INSERT INTO `sys_cn_area` VALUES ('511113', '金口河区', '金口河', '511100', null, '中国,四川省,乐山市,金口河区', '3', '614700', '0833', 'Jinkouhe', '103.0785800', '29.2457800');
INSERT INTO `sys_cn_area` VALUES ('511123', '犍为县', '犍为', '511100', null, '中国,四川省,乐山市,犍为县', '3', '614400', '0833', 'Qianwei', '103.9498900', '29.2097300');
INSERT INTO `sys_cn_area` VALUES ('511124', '井研县', '井研', '511100', null, '中国,四川省,乐山市,井研县', '3', '613100', '0833', 'Jingyan', '104.0701900', '29.6522800');
INSERT INTO `sys_cn_area` VALUES ('511126', '夹江县', '夹江', '511100', null, '中国,四川省,乐山市,夹江县', '3', '614100', '0833', 'Jiajiang', '103.5719900', '29.7386800');
INSERT INTO `sys_cn_area` VALUES ('511129', '沐川县', '沐川', '511100', null, '中国,四川省,乐山市,沐川县', '3', '614500', '0833', 'Muchuan', '103.9035300', '28.9564600');
INSERT INTO `sys_cn_area` VALUES ('511132', '峨边彝族自治县', '峨边', '511100', null, '中国,四川省,乐山市,峨边彝族自治县', '3', '614300', '0833', 'Ebian', '103.2633900', '29.2300400');
INSERT INTO `sys_cn_area` VALUES ('511133', '马边彝族自治县', '马边', '511100', null, '中国,四川省,乐山市,马边彝族自治县', '3', '614600', '0833', 'Mabian', '103.5461700', '28.8359300');
INSERT INTO `sys_cn_area` VALUES ('511181', '峨眉山市', '峨眉山', '511100', null, '中国,四川省,乐山市,峨眉山市', '3', '614200', '0833', 'Emeishan', '103.4844000', '29.6011700');
INSERT INTO `sys_cn_area` VALUES ('511300', '南充市', '南充', '510000', null, '中国,四川省,南充市', '2', '637000', '0817', 'Nanchong', '106.0829740', '30.7952810');
INSERT INTO `sys_cn_area` VALUES ('511302', '顺庆区', '顺庆', '511300', null, '中国,四川省,南充市,顺庆区', '3', '637000', '0817', 'Shunqing', '106.0921600', '30.7964200');
INSERT INTO `sys_cn_area` VALUES ('511303', '高坪区', '高坪', '511300', null, '中国,四川省,南充市,高坪区', '3', '637100', '0817', 'Gaoping', '106.1189400', '30.7816200');
INSERT INTO `sys_cn_area` VALUES ('511304', '嘉陵区', '嘉陵', '511300', null, '中国,四川省,南充市,嘉陵区', '3', '637100', '0817', 'Jialing', '106.0714100', '30.7584800');
INSERT INTO `sys_cn_area` VALUES ('511321', '南部县', '南部', '511300', null, '中国,四川省,南充市,南部县', '3', '637300', '0817', 'Nanbu', '106.0673800', '31.3545100');
INSERT INTO `sys_cn_area` VALUES ('511322', '营山县', '营山', '511300', null, '中国,四川省,南充市,营山县', '3', '637700', '0817', 'Yingshan', '106.5663700', '31.0774700');
INSERT INTO `sys_cn_area` VALUES ('511323', '蓬安县', '蓬安', '511300', null, '中国,四川省,南充市,蓬安县', '3', '637800', '0817', 'Peng\'an', '106.4126200', '31.0296400');
INSERT INTO `sys_cn_area` VALUES ('511324', '仪陇县', '仪陇', '511300', null, '中国,四川省,南充市,仪陇县', '3', '637600', '0817', 'Yilong', '106.2997400', '31.2762800');
INSERT INTO `sys_cn_area` VALUES ('511325', '西充县', '西充', '511300', null, '中国,四川省,南充市,西充县', '3', '637200', '0817', 'Xichong', '105.8999600', '30.9969000');
INSERT INTO `sys_cn_area` VALUES ('511381', '阆中市', '阆中', '511300', null, '中国,四川省,南充市,阆中市', '3', '637400', '0817', 'Langzhong', '106.0049400', '31.5583200');
INSERT INTO `sys_cn_area` VALUES ('511400', '眉山市', '眉山', '510000', null, '中国,四川省,眉山市', '2', '620020', '028', 'Meishan', '103.8317880', '30.0483180');
INSERT INTO `sys_cn_area` VALUES ('511402', '东坡区', '东坡', '511400', null, '中国,四川省,眉山市,东坡区', '3', '620010', '028', 'Dongpo', '103.8320000', '30.0421900');
INSERT INTO `sys_cn_area` VALUES ('511403', '彭山区', '彭山', '511400', null, '中国,四川省,眉山市,彭山区', '3', '620860', '028', 'Pengshan', '103.8726800', '30.1928300');
INSERT INTO `sys_cn_area` VALUES ('511421', '仁寿县', '仁寿', '511400', null, '中国,四川省,眉山市,仁寿县', '3', '620500', '028', 'Renshou', '104.1341200', '29.9959900');
INSERT INTO `sys_cn_area` VALUES ('511423', '洪雅县', '洪雅', '511400', null, '中国,四川省,眉山市,洪雅县', '3', '620360', '028', 'Hongya', '103.3731300', '29.9066100');
INSERT INTO `sys_cn_area` VALUES ('511424', '丹棱县', '丹棱', '511400', null, '中国,四川省,眉山市,丹棱县', '3', '620200', '028', 'Danling', '103.5133900', '30.0156200');
INSERT INTO `sys_cn_area` VALUES ('511425', '青神县', '青神', '511400', null, '中国,四川省,眉山市,青神县', '3', '620460', '028', 'Qingshen', '103.8477100', '29.8323500');
INSERT INTO `sys_cn_area` VALUES ('511500', '宜宾市', '宜宾', '510000', null, '中国,四川省,宜宾市', '2', '644000', '0831', 'Yibin', '104.6308250', '28.7601890');
INSERT INTO `sys_cn_area` VALUES ('511502', '翠屏区', '翠屏', '511500', null, '中国,四川省,宜宾市,翠屏区', '3', '644000', '0831', 'Cuiping', '104.6197800', '28.7656600');
INSERT INTO `sys_cn_area` VALUES ('511503', '南溪区', '南溪', '511500', null, '中国,四川省,宜宾市,南溪区', '3', '644100', '0831', 'Nanxi', '104.9811330', '28.8398060');
INSERT INTO `sys_cn_area` VALUES ('511521', '宜宾县', '宜宾', '511500', null, '中国,四川省,宜宾市,宜宾县', '3', '644600', '0831', 'Yibin', '104.5331400', '28.6899600');
INSERT INTO `sys_cn_area` VALUES ('511523', '江安县', '江安', '511500', null, '中国,四川省,宜宾市,江安县', '3', '644200', '0831', 'Jiang\'an', '105.0668300', '28.7238500');
INSERT INTO `sys_cn_area` VALUES ('511524', '长宁县', '长宁', '511500', null, '中国,四川省,宜宾市,长宁县', '3', '644300', '0831', 'Changning', '104.9252000', '28.5777700');
INSERT INTO `sys_cn_area` VALUES ('511525', '高县', '高县', '511500', null, '中国,四川省,宜宾市,高县', '3', '645150', '0831', 'Gaoxian', '104.5175400', '28.4361900');
INSERT INTO `sys_cn_area` VALUES ('511526', '珙县', '珙县', '511500', null, '中国,四川省,宜宾市,珙县', '3', '644500', '0831', 'Gongxian', '104.7139800', '28.4451200');
INSERT INTO `sys_cn_area` VALUES ('511527', '筠连县', '筠连', '511500', null, '中国,四川省,宜宾市,筠连县', '3', '645250', '0831', 'Junlian', '104.5121700', '28.1649500');
INSERT INTO `sys_cn_area` VALUES ('511528', '兴文县', '兴文', '511500', null, '中国,四川省,宜宾市,兴文县', '3', '644400', '0831', 'Xingwen', '105.2367500', '28.3044000');
INSERT INTO `sys_cn_area` VALUES ('511529', '屏山县', '屏山', '511500', null, '中国,四川省,宜宾市,屏山县', '3', '645350', '0831', 'Pingshan', '104.1629300', '28.6436900');
INSERT INTO `sys_cn_area` VALUES ('511600', '广安市', '广安', '510000', null, '中国,四川省,广安市', '2', '638000', '0826', 'Guang\'an', '106.6333690', '30.4563980');
INSERT INTO `sys_cn_area` VALUES ('511602', '广安区', '广安', '511600', null, '中国,四川省,广安市,广安区', '3', '638000', '0826', 'Guang\'an', '106.6416300', '30.4738900');
INSERT INTO `sys_cn_area` VALUES ('511603', '前锋区', '前锋', '511600', null, '中国,四川省,广安市,前锋区', '3', '638019', '0826', 'Qianfeng', '106.8935370', '30.4945720');
INSERT INTO `sys_cn_area` VALUES ('511621', '岳池县', '岳池', '511600', null, '中国,四川省,广安市,岳池县', '3', '638300', '0826', 'Yuechi', '106.4407900', '30.5391800');
INSERT INTO `sys_cn_area` VALUES ('511622', '武胜县', '武胜', '511600', null, '中国,四川省,广安市,武胜县', '3', '638400', '0826', 'Wusheng', '106.2959200', '30.3493200');
INSERT INTO `sys_cn_area` VALUES ('511623', '邻水县', '邻水', '511600', null, '中国,四川省,广安市,邻水县', '3', '638500', '0826', 'Linshui', '106.9296800', '30.3344900');
INSERT INTO `sys_cn_area` VALUES ('511681', '华蓥市', '华蓥', '511600', null, '中国,四川省,广安市,华蓥市', '3', '638600', '0826', 'Huaying', '106.7846600', '30.3900700');
INSERT INTO `sys_cn_area` VALUES ('511700', '达州市', '达州', '510000', null, '中国,四川省,达州市', '2', '635000', '0818', 'Dazhou', '107.5022620', '31.2094840');
INSERT INTO `sys_cn_area` VALUES ('511702', '通川区', '通川', '511700', null, '中国,四川省,达州市,通川区', '3', '635000', '0818', 'Tongchuan', '107.5045600', '31.2146900');
INSERT INTO `sys_cn_area` VALUES ('511703', '达川区', '达川', '511700', null, '中国,四川省,达州市,达川区', '3', '635000', '0818', 'Dachuan', '107.5022620', '31.2094840');
INSERT INTO `sys_cn_area` VALUES ('511722', '宣汉县', '宣汉', '511700', null, '中国,四川省,达州市,宣汉县', '3', '636150', '0818', 'Xuanhan', '107.7277500', '31.3551600');
INSERT INTO `sys_cn_area` VALUES ('511723', '开江县', '开江', '511700', null, '中国,四川省,达州市,开江县', '3', '636250', '0818', 'Kaijiang', '107.8688900', '31.0841000');
INSERT INTO `sys_cn_area` VALUES ('511724', '大竹县', '大竹', '511700', null, '中国,四川省,达州市,大竹县', '3', '635100', '0818', 'Dazhu', '107.2085500', '30.7414700');
INSERT INTO `sys_cn_area` VALUES ('511725', '渠县', '渠县', '511700', null, '中国,四川省,达州市,渠县', '3', '635200', '0818', 'Quxian', '106.9738100', '30.8376000');
INSERT INTO `sys_cn_area` VALUES ('511781', '万源市', '万源', '511700', null, '中国,四川省,达州市,万源市', '3', '636350', '0818', 'Wanyuan', '108.0359800', '32.0809100');
INSERT INTO `sys_cn_area` VALUES ('511800', '雅安市', '雅安', '510000', null, '中国,四川省,雅安市', '2', '625000', '0835', 'Ya\'an', '103.0010330', '29.9877220');
INSERT INTO `sys_cn_area` VALUES ('511802', '雨城区', '雨城', '511800', null, '中国,四川省,雅安市,雨城区', '3', '625000', '0835', 'Yucheng', '103.0330500', '30.0053100');
INSERT INTO `sys_cn_area` VALUES ('511803', '名山区', '名山', '511800', null, '中国,四川省,雅安市,名山区', '3', '625100', '0835', 'Mingshan', '103.1122140', '30.0847180');
INSERT INTO `sys_cn_area` VALUES ('511822', '荥经县', '荥经', '511800', null, '中国,四川省,雅安市,荥经县', '3', '625200', '0835', 'Yingjing', '102.8465200', '29.7940200');
INSERT INTO `sys_cn_area` VALUES ('511823', '汉源县', '汉源', '511800', null, '中国,四川省,雅安市,汉源县', '3', '625300', '0835', 'Hanyuan', '102.6784000', '29.3516800');
INSERT INTO `sys_cn_area` VALUES ('511824', '石棉县', '石棉', '511800', null, '中国,四川省,雅安市,石棉县', '3', '625400', '0835', 'Shimian', '102.3594300', '29.2279600');
INSERT INTO `sys_cn_area` VALUES ('511825', '天全县', '天全', '511800', null, '中国,四川省,雅安市,天全县', '3', '625500', '0835', 'Tianquan', '102.7590600', '30.0675400');
INSERT INTO `sys_cn_area` VALUES ('511826', '芦山县', '芦山', '511800', null, '中国,四川省,雅安市,芦山县', '3', '625600', '0835', 'Lushan', '102.9279100', '30.1436900');
INSERT INTO `sys_cn_area` VALUES ('511827', '宝兴县', '宝兴', '511800', null, '中国,四川省,雅安市,宝兴县', '3', '625700', '0835', 'Baoxing', '102.8155500', '30.3683600');
INSERT INTO `sys_cn_area` VALUES ('511900', '巴中市', '巴中', '510000', null, '中国,四川省,巴中市', '2', '636000', '0827', 'Bazhong', '106.7536690', '31.8588090');
INSERT INTO `sys_cn_area` VALUES ('511902', '巴州区', '巴州', '511900', null, '中国,四川省,巴中市,巴州区', '3', '636001', '0827', 'Bazhou', '106.7688900', '31.8512500');
INSERT INTO `sys_cn_area` VALUES ('511903', '恩阳区', '恩阳', '511900', null, '中国,四川省,巴中市,恩阳区', '3', '636064', '0827', 'Enyang', '106.7536690', '31.8588090');
INSERT INTO `sys_cn_area` VALUES ('511921', '通江县', '通江', '511900', null, '中国,四川省,巴中市,通江县', '3', '636700', '0827', 'Tongjiang', '107.2439800', '31.9129400');
INSERT INTO `sys_cn_area` VALUES ('511922', '南江县', '南江', '511900', null, '中国,四川省,巴中市,南江县', '3', '636600', '0827', 'Nanjiang', '106.8416400', '32.3533500');
INSERT INTO `sys_cn_area` VALUES ('511923', '平昌县', '平昌', '511900', null, '中国,四川省,巴中市,平昌县', '3', '636400', '0827', 'Pingchang', '107.1042400', '31.5594000');
INSERT INTO `sys_cn_area` VALUES ('512000', '资阳市', '资阳', '510000', null, '中国,四川省,资阳市', '2', '641300', '028', 'Ziyang', '104.6419170', '30.1222110');
INSERT INTO `sys_cn_area` VALUES ('512002', '雁江区', '雁江', '512000', null, '中国,四川省,资阳市,雁江区', '3', '641300', '028', 'Yanjiang', '104.6521600', '30.1152500');
INSERT INTO `sys_cn_area` VALUES ('512021', '安岳县', '安岳', '512000', null, '中国,四川省,资阳市,安岳县', '3', '642350', '028', 'Anyue', '105.3363000', '30.0978600');
INSERT INTO `sys_cn_area` VALUES ('512022', '乐至县', '乐至', '512000', null, '中国,四川省,资阳市,乐至县', '3', '641500', '028', 'Lezhi', '105.0320700', '30.2722700');
INSERT INTO `sys_cn_area` VALUES ('512081', '简阳市', '简阳', '512000', null, '中国,四川省,资阳市,简阳市', '3', '641400', '028', 'Jianyang', '104.5486400', '30.3904000');
INSERT INTO `sys_cn_area` VALUES ('513200', '阿坝藏族羌族自治州', '阿坝', '510000', null, '中国,四川省,阿坝藏族羌族自治州', '2', '624000', '0837', 'Aba', '102.2213740', '31.8997920');
INSERT INTO `sys_cn_area` VALUES ('513221', '汶川县', '汶川', '513200', null, '中国,四川省,阿坝藏族羌族自治州,汶川县', '3', '623000', '0837', 'Wenchuan', '103.5907900', '31.4732600');
INSERT INTO `sys_cn_area` VALUES ('513222', '理县', '理县', '513200', null, '中国,四川省,阿坝藏族羌族自治州,理县', '3', '623100', '0837', 'Lixian', '103.1717500', '31.4360300');
INSERT INTO `sys_cn_area` VALUES ('513223', '茂县', '茂县', '513200', null, '中国,四川省,阿坝藏族羌族自治州,茂县', '3', '623200', '0837', 'Maoxian', '103.8537200', '31.6820000');
INSERT INTO `sys_cn_area` VALUES ('513224', '松潘县', '松潘', '513200', null, '中国,四川省,阿坝藏族羌族自治州,松潘县', '3', '623300', '0837', 'Songpan', '103.5992400', '32.6387100');
INSERT INTO `sys_cn_area` VALUES ('513225', '九寨沟县', '九寨沟', '513200', null, '中国,四川省,阿坝藏族羌族自治州,九寨沟县', '3', '623400', '0837', 'Jiuzhaigou', '104.2367200', '33.2631800');
INSERT INTO `sys_cn_area` VALUES ('513226', '金川县', '金川', '513200', null, '中国,四川省,阿坝藏族羌族自治州,金川县', '3', '624100', '0837', 'Jinchuan', '102.0655500', '31.4762300');
INSERT INTO `sys_cn_area` VALUES ('513227', '小金县', '小金', '513200', null, '中国,四川省,阿坝藏族羌族自治州,小金县', '3', '624200', '0837', 'Xiaojin', '102.3649900', '30.9993400');
INSERT INTO `sys_cn_area` VALUES ('513228', '黑水县', '黑水', '513200', null, '中国,四川省,阿坝藏族羌族自治州,黑水县', '3', '623500', '0837', 'Heishui', '102.9917600', '32.0618400');
INSERT INTO `sys_cn_area` VALUES ('513229', '马尔康县', '马尔康', '513200', null, '中国,四川省,阿坝藏族羌族自治州,马尔康县', '3', '624000', '0837', 'Maerkang', '102.2062500', '31.9058400');
INSERT INTO `sys_cn_area` VALUES ('513230', '壤塘县', '壤塘', '513200', null, '中国,四川省,阿坝藏族羌族自治州,壤塘县', '3', '624300', '0837', 'Rangtang', '100.9783000', '32.2657800');
INSERT INTO `sys_cn_area` VALUES ('513231', '阿坝县', '阿坝', '513200', null, '中国,四川省,阿坝藏族羌族自治州,阿坝县', '3', '624600', '0837', 'Aba', '101.7063200', '32.9030100');
INSERT INTO `sys_cn_area` VALUES ('513232', '若尔盖县', '若尔盖', '513200', null, '中国,四川省,阿坝藏族羌族自治州,若尔盖县', '3', '624500', '0837', 'Ruoergai', '102.9598000', '33.5743200');
INSERT INTO `sys_cn_area` VALUES ('513233', '红原县', '红原', '513200', null, '中国,四川省,阿坝藏族羌族自治州,红原县', '3', '624400', '0837', 'Hongyuan', '102.5452500', '32.7898900');
INSERT INTO `sys_cn_area` VALUES ('513300', '甘孜藏族自治州', '甘孜', '510000', null, '中国,四川省,甘孜藏族自治州', '2', '626000', '0836', 'Garze', '101.9638150', '30.0506630');
INSERT INTO `sys_cn_area` VALUES ('513321', '康定县', '康定', '513300', null, '中国,四川省,甘孜藏族自治州,康定县', '3', '626000', '0836', 'Kangding', '101.9648700', '30.0553200');
INSERT INTO `sys_cn_area` VALUES ('513322', '泸定县', '泸定', '513300', null, '中国,四川省,甘孜藏族自治州,泸定县', '3', '626100', '0836', 'Luding', '102.2350700', '29.9147500');
INSERT INTO `sys_cn_area` VALUES ('513323', '丹巴县', '丹巴', '513300', null, '中国,四川省,甘孜藏族自治州,丹巴县', '3', '626300', '0836', 'Danba', '101.8842400', '30.8765600');
INSERT INTO `sys_cn_area` VALUES ('513324', '九龙县', '九龙', '513300', null, '中国,四川省,甘孜藏族自治州,九龙县', '3', '626200', '0836', 'Jiulong', '101.5084800', '29.0009100');
INSERT INTO `sys_cn_area` VALUES ('513325', '雅江县', '雅江', '513300', null, '中国,四川省,甘孜藏族自治州,雅江县', '3', '627450', '0836', 'Yajiang', '101.0149200', '30.0328100');
INSERT INTO `sys_cn_area` VALUES ('513326', '道孚县', '道孚', '513300', null, '中国,四川省,甘孜藏族自治州,道孚县', '3', '626400', '0836', 'Daofu', '101.1255400', '30.9804600');
INSERT INTO `sys_cn_area` VALUES ('513327', '炉霍县', '炉霍', '513300', null, '中国,四川省,甘孜藏族自治州,炉霍县', '3', '626500', '0836', 'Luhuo', '100.6768100', '31.3917000');
INSERT INTO `sys_cn_area` VALUES ('513328', '甘孜县', '甘孜', '513300', null, '中国,四川省,甘孜藏族自治州,甘孜县', '3', '626700', '0836', 'Ganzi', '99.9930700', '31.6267200');
INSERT INTO `sys_cn_area` VALUES ('513329', '新龙县', '新龙', '513300', null, '中国,四川省,甘孜藏族自治州,新龙县', '3', '626800', '0836', 'Xinlong', '100.3125000', '30.9406700');
INSERT INTO `sys_cn_area` VALUES ('513330', '德格县', '德格', '513300', null, '中国,四川省,甘孜藏族自治州,德格县', '3', '627250', '0836', 'Dege', '98.5807800', '31.8061500');
INSERT INTO `sys_cn_area` VALUES ('513331', '白玉县', '白玉', '513300', null, '中国,四川省,甘孜藏族自治州,白玉县', '3', '627150', '0836', 'Baiyu', '98.8256800', '31.2090200');
INSERT INTO `sys_cn_area` VALUES ('513332', '石渠县', '石渠', '513300', null, '中国,四川省,甘孜藏族自治州,石渠县', '3', '627350', '0836', 'Shiqu', '98.1015600', '32.9788400');
INSERT INTO `sys_cn_area` VALUES ('513333', '色达县', '色达', '513300', null, '中国,四川省,甘孜藏族自治州,色达县', '3', '626600', '0836', 'Seda', '100.3322400', '32.2683900');
INSERT INTO `sys_cn_area` VALUES ('513334', '理塘县', '理塘', '513300', null, '中国,四川省,甘孜藏族自治州,理塘县', '3', '627550', '0836', 'Litang', '100.2700500', '29.9967400');
INSERT INTO `sys_cn_area` VALUES ('513335', '巴塘县', '巴塘', '513300', null, '中国,四川省,甘孜藏族自治州,巴塘县', '3', '627650', '0836', 'Batang', '99.1040900', '30.0042300');
INSERT INTO `sys_cn_area` VALUES ('513336', '乡城县', '乡城', '513300', null, '中国,四川省,甘孜藏族自治州,乡城县', '3', '627850', '0836', 'Xiangcheng', '99.7994300', '28.9355400');
INSERT INTO `sys_cn_area` VALUES ('513337', '稻城县', '稻城', '513300', null, '中国,四川省,甘孜藏族自治州,稻城县', '3', '627750', '0836', 'Daocheng', '100.2980900', '29.0379000');
INSERT INTO `sys_cn_area` VALUES ('513338', '得荣县', '得荣', '513300', null, '中国,四川省,甘孜藏族自治州,得荣县', '3', '627950', '0836', 'Derong', '99.2862800', '28.7129700');
INSERT INTO `sys_cn_area` VALUES ('513400', '凉山彝族自治州', '凉山', '510000', null, '中国,四川省,凉山彝族自治州', '2', '615000', '0834', 'Liangshan', '102.2587460', '27.8867620');
INSERT INTO `sys_cn_area` VALUES ('513401', '西昌市', '西昌', '513400', null, '中国,四川省,凉山彝族自治州,西昌市', '3', '615000', '0835', 'Xichang', '102.2641300', '27.8952400');
INSERT INTO `sys_cn_area` VALUES ('513422', '木里藏族自治县', '木里', '513400', null, '中国,四川省,凉山彝族自治州,木里藏族自治县', '3', '615800', '0851', 'Muli', '101.2796000', '27.9287500');
INSERT INTO `sys_cn_area` VALUES ('513423', '盐源县', '盐源', '513400', null, '中国,四川省,凉山彝族自治州,盐源县', '3', '615700', '0836', 'Yanyuan', '101.5097000', '27.4217700');
INSERT INTO `sys_cn_area` VALUES ('513424', '德昌县', '德昌', '513400', null, '中国,四川省,凉山彝族自治州,德昌县', '3', '615500', '0837', 'Dechang', '102.1801700', '27.4048200');
INSERT INTO `sys_cn_area` VALUES ('513425', '会理县', '会理', '513400', null, '中国,四川省,凉山彝族自治州,会理县', '3', '615100', '0838', 'Huili', '102.2453900', '26.6562700');
INSERT INTO `sys_cn_area` VALUES ('513426', '会东县', '会东', '513400', null, '中国,四川省,凉山彝族自治州,会东县', '3', '615200', '0839', 'Huidong', '102.5781500', '26.6342900');
INSERT INTO `sys_cn_area` VALUES ('513427', '宁南县', '宁南', '513400', null, '中国,四川省,凉山彝族自治州,宁南县', '3', '615400', '0840', 'Ningnan', '102.7611600', '27.0656700');
INSERT INTO `sys_cn_area` VALUES ('513428', '普格县', '普格', '513400', null, '中国,四川省,凉山彝族自治州,普格县', '3', '615300', '0841', 'Puge', '102.5405500', '27.3748500');
INSERT INTO `sys_cn_area` VALUES ('513429', '布拖县', '布拖', '513400', null, '中国,四川省,凉山彝族自治州,布拖县', '3', '616350', '0842', 'Butuo', '102.8123400', '27.7079000');
INSERT INTO `sys_cn_area` VALUES ('513430', '金阳县', '金阳', '513400', null, '中国,四川省,凉山彝族自治州,金阳县', '3', '616250', '0843', 'Jinyang', '103.2477400', '27.6969800');
INSERT INTO `sys_cn_area` VALUES ('513431', '昭觉县', '昭觉', '513400', null, '中国,四川省,凉山彝族自治州,昭觉县', '3', '616150', '0844', 'Zhaojue', '102.8466100', '28.0115500');
INSERT INTO `sys_cn_area` VALUES ('513432', '喜德县', '喜德', '513400', null, '中国,四川省,凉山彝族自治州,喜德县', '3', '616750', '0845', 'Xide', '102.4133600', '28.3073900');
INSERT INTO `sys_cn_area` VALUES ('513433', '冕宁县', '冕宁', '513400', null, '中国,四川省,凉山彝族自治州,冕宁县', '3', '615600', '0846', 'Mianning', '102.1710800', '28.5516100');
INSERT INTO `sys_cn_area` VALUES ('513434', '越西县', '越西', '513400', null, '中国,四川省,凉山彝族自治州,越西县', '3', '616650', '0847', 'Yuexi', '102.5079000', '28.6413300');
INSERT INTO `sys_cn_area` VALUES ('513435', '甘洛县', '甘洛', '513400', null, '中国,四川省,凉山彝族自治州,甘洛县', '3', '616850', '0848', 'Ganluo', '102.7715400', '28.9662400');
INSERT INTO `sys_cn_area` VALUES ('513436', '美姑县', '美姑', '513400', null, '中国,四川省,凉山彝族自治州,美姑县', '3', '616450', '0849', 'Meigu', '103.1311600', '28.3259600');
INSERT INTO `sys_cn_area` VALUES ('513437', '雷波县', '雷波', '513400', null, '中国,四川省,凉山彝族自治州,雷波县', '3', '616550', '0850', 'Leibo', '103.5728700', '28.2640700');
INSERT INTO `sys_cn_area` VALUES ('520000', '贵州省', '贵州', '100000', null, '中国,贵州省', '1', null, '', 'Guizhou', '106.7134780', '26.5783430');
INSERT INTO `sys_cn_area` VALUES ('520100', '贵阳市', '贵阳', '520000', null, '中国,贵州省,贵阳市', '2', '550001', '0851', 'Guiyang', '106.7134780', '26.5783430');
INSERT INTO `sys_cn_area` VALUES ('520102', '南明区', '南明', '520100', null, '中国,贵州省,贵阳市,南明区', '3', '550001', '0851', 'Nanming', '106.7145000', '26.5681900');
INSERT INTO `sys_cn_area` VALUES ('520103', '云岩区', '云岩', '520100', null, '中国,贵州省,贵阳市,云岩区', '3', '550001', '0851', 'Yunyan', '106.7248500', '26.6048400');
INSERT INTO `sys_cn_area` VALUES ('520111', '花溪区', '花溪', '520100', null, '中国,贵州省,贵阳市,花溪区', '3', '550025', '0851', 'Huaxi', '106.6768800', '26.4334300');
INSERT INTO `sys_cn_area` VALUES ('520112', '乌当区', '乌当', '520100', null, '中国,贵州省,贵阳市,乌当区', '3', '550018', '0851', 'Wudang', '106.7521000', '26.6302000');
INSERT INTO `sys_cn_area` VALUES ('520113', '白云区', '白云', '520100', null, '中国,贵州省,贵阳市,白云区', '3', '550014', '0851', 'Baiyun', '106.6308800', '26.6828400');
INSERT INTO `sys_cn_area` VALUES ('520115', '观山湖区', '观山湖', '520100', null, '中国,贵州省,贵阳市,观山湖区', '3', '550009', '0851', 'Guanshanhu', '106.6254420', '26.6182090');
INSERT INTO `sys_cn_area` VALUES ('520121', '开阳县', '开阳', '520100', null, '中国,贵州省,贵阳市,开阳县', '3', '550300', '0851', 'Kaiyang', '106.9692000', '27.0553300');
INSERT INTO `sys_cn_area` VALUES ('520122', '息烽县', '息烽', '520100', null, '中国,贵州省,贵阳市,息烽县', '3', '551100', '0851', 'Xifeng', '106.7380000', '27.0934600');
INSERT INTO `sys_cn_area` VALUES ('520123', '修文县', '修文', '520100', null, '中国,贵州省,贵阳市,修文县', '3', '550200', '0851', 'Xiuwen', '106.5948700', '26.8378300');
INSERT INTO `sys_cn_area` VALUES ('520181', '清镇市', '清镇', '520100', null, '中国,贵州省,贵阳市,清镇市', '3', '551400', '0851', 'Qingzhen', '106.4686200', '26.5526100');
INSERT INTO `sys_cn_area` VALUES ('520200', '六盘水市', '六盘水', '520000', null, '中国,贵州省,六盘水市', '2', '553400', '0858', 'Liupanshui', '104.8467430', '26.5846430');
INSERT INTO `sys_cn_area` VALUES ('520201', '钟山区', '钟山', '520200', null, '中国,贵州省,六盘水市,钟山区', '3', '553000', '0858', 'Zhongshan', '104.8784800', '26.5769900');
INSERT INTO `sys_cn_area` VALUES ('520203', '六枝特区', '六枝', '520200', null, '中国,贵州省,六盘水市,六枝特区', '3', '553400', '0858', 'Liuzhi', '105.4806200', '26.2011700');
INSERT INTO `sys_cn_area` VALUES ('520221', '水城县', '水城', '520200', null, '中国,贵州省,六盘水市,水城县', '3', '553000', '0858', 'Shuicheng', '104.9576400', '26.5478500');
INSERT INTO `sys_cn_area` VALUES ('520222', '盘县', '盘县', '520200', null, '中国,贵州省,六盘水市,盘县', '3', '561601', '0858', 'Panxian', '104.4706100', '25.7136000');
INSERT INTO `sys_cn_area` VALUES ('520300', '遵义市', '遵义', '520000', null, '中国,贵州省,遵义市', '2', '563000', '0852', 'Zunyi', '106.9372650', '27.7066260');
INSERT INTO `sys_cn_area` VALUES ('520302', '红花岗区', '红花岗', '520300', null, '中国,贵州省,遵义市,红花岗区', '3', '563000', '0852', 'Honghuagang', '106.8940400', '27.6447100');
INSERT INTO `sys_cn_area` VALUES ('520303', '汇川区', '汇川', '520300', null, '中国,贵州省,遵义市,汇川区', '3', '563000', '0852', 'Huichuan', '106.9393000', '27.7062500');
INSERT INTO `sys_cn_area` VALUES ('520321', '遵义县', '遵义', '520300', null, '中国,贵州省,遵义市,遵义县', '3', '563100', '0852', 'Zunyi', '106.8333100', '27.5377200');
INSERT INTO `sys_cn_area` VALUES ('520322', '桐梓县', '桐梓', '520300', null, '中国,贵州省,遵义市,桐梓县', '3', '563200', '0852', 'Tongzi', '106.8256800', '28.1380600');
INSERT INTO `sys_cn_area` VALUES ('520323', '绥阳县', '绥阳', '520300', null, '中国,贵州省,遵义市,绥阳县', '3', '563300', '0852', 'Suiyang', '107.1906400', '27.9470200');
INSERT INTO `sys_cn_area` VALUES ('520324', '正安县', '正安', '520300', null, '中国,贵州省,遵义市,正安县', '3', '563400', '0852', 'Zheng\'an', '107.4435700', '28.5512000');
INSERT INTO `sys_cn_area` VALUES ('520325', '道真仡佬族苗族自治县', '道真', '520300', null, '中国,贵州省,遵义市,道真仡佬族苗族自治县', '3', '563500', '0852', 'Daozhen', '107.6115200', '28.8640000');
INSERT INTO `sys_cn_area` VALUES ('520326', '务川仡佬族苗族自治县', '务川', '520300', null, '中国,贵州省,遵义市,务川仡佬族苗族自治县', '3', '564300', '0852', 'Wuchuan', '107.8893500', '28.5222700');
INSERT INTO `sys_cn_area` VALUES ('520327', '凤冈县', '凤冈', '520300', null, '中国,贵州省,遵义市,凤冈县', '3', '564200', '0852', 'Fenggang', '107.7168200', '27.9546100');
INSERT INTO `sys_cn_area` VALUES ('520328', '湄潭县', '湄潭', '520300', null, '中国,贵州省,遵义市,湄潭县', '3', '564100', '0852', 'Meitan', '107.4877900', '27.7667600');
INSERT INTO `sys_cn_area` VALUES ('520329', '余庆县', '余庆', '520300', null, '中国,贵州省,遵义市,余庆县', '3', '564400', '0852', 'Yuqing', '107.8882100', '27.2253200');
INSERT INTO `sys_cn_area` VALUES ('520330', '习水县', '习水', '520300', null, '中国,贵州省,遵义市,习水县', '3', '564600', '0852', 'Xishui', '106.2126700', '28.3197600');
INSERT INTO `sys_cn_area` VALUES ('520381', '赤水市', '赤水', '520300', null, '中国,贵州省,遵义市,赤水市', '3', '564700', '0852', 'Chishui', '105.6984500', '28.5892100');
INSERT INTO `sys_cn_area` VALUES ('520382', '仁怀市', '仁怀', '520300', null, '中国,贵州省,遵义市,仁怀市', '3', '564500', '0852', 'Renhuai', '106.4015200', '27.7923100');
INSERT INTO `sys_cn_area` VALUES ('520400', '安顺市', '安顺', '520000', null, '中国,贵州省,安顺市', '2', '561000', '0853', 'Anshun', '105.9321880', '26.2455440');
INSERT INTO `sys_cn_area` VALUES ('520402', '西秀区', '西秀', '520400', null, '中国,贵州省,安顺市,西秀区', '3', '561000', '0853', 'Xixiu', '105.9658500', '26.2449100');
INSERT INTO `sys_cn_area` VALUES ('520421', '平坝区', '平坝', '520400', null, '中国,贵州省,安顺市,平坝区', '3', '561100', '0853', 'Pingba', '106.2568300', '26.4054300');
INSERT INTO `sys_cn_area` VALUES ('520422', '普定县', '普定', '520400', null, '中国,贵州省,安顺市,普定县', '3', '562100', '0853', 'Puding', '105.7428500', '26.3014100');
INSERT INTO `sys_cn_area` VALUES ('520423', '镇宁布依族苗族自治县', '镇宁', '520400', null, '中国,贵州省,安顺市,镇宁布依族苗族自治县', '3', '561200', '0853', 'Zhenning', '105.7651300', '26.0553300');
INSERT INTO `sys_cn_area` VALUES ('520424', '关岭布依族苗族自治县', '关岭', '520400', null, '中国,贵州省,安顺市,关岭布依族苗族自治县', '3', '561300', '0853', 'Guanling', '105.6188300', '25.9424800');
INSERT INTO `sys_cn_area` VALUES ('520425', '紫云苗族布依族自治县', '紫云', '520400', null, '中国,贵州省,安顺市,紫云苗族布依族自治县', '3', '550800', '0853', 'Ziyun', '106.0836400', '25.7525800');
INSERT INTO `sys_cn_area` VALUES ('520500', '毕节市', '毕节', '520000', null, '中国,贵州省,毕节市', '2', '551700', '0857', 'Bijie', '105.2850100', '27.3016930');
INSERT INTO `sys_cn_area` VALUES ('520502', '七星关区', '七星关', '520500', null, '中国,贵州省,毕节市,七星关区', '3', '551700', '0857', 'Qixingguan', '104.9497000', '27.1535560');
INSERT INTO `sys_cn_area` VALUES ('520521', '大方县', '大方', '520500', null, '中国,贵州省,毕节市,大方县', '3', '551600', '0857', 'Dafang', '105.6092540', '27.1435210');
INSERT INTO `sys_cn_area` VALUES ('520522', '黔西县', '黔西', '520500', null, '中国,贵州省,毕节市,黔西县', '3', '551500', '0857', 'Qianxi', '106.0382990', '27.0249230');
INSERT INTO `sys_cn_area` VALUES ('520523', '金沙县', '金沙', '520500', null, '中国,贵州省,毕节市,金沙县', '3', '551800', '0857', 'Jinsha', '106.2221030', '27.4596930');
INSERT INTO `sys_cn_area` VALUES ('520524', '织金县', '织金', '520500', null, '中国,贵州省,毕节市,织金县', '3', '552100', '0857', 'Zhijin', '105.7689970', '26.6684970');
INSERT INTO `sys_cn_area` VALUES ('520525', '纳雍县', '纳雍', '520500', null, '中国,贵州省,毕节市,纳雍县', '3', '553300', '0857', 'Nayong', '105.3753220', '26.7698750');
INSERT INTO `sys_cn_area` VALUES ('520526', '威宁彝族回族苗族自治县', '威宁', '520500', null, '中国,贵州省,毕节市,威宁彝族回族苗族自治县', '3', '553100', '0857', 'Weining', '104.2865230', '26.8590990');
INSERT INTO `sys_cn_area` VALUES ('520527', '赫章县', '赫章', '520500', null, '中国,贵州省,毕节市,赫章县', '3', '553200', '0857', 'Hezhang', '104.7264380', '27.1192430');
INSERT INTO `sys_cn_area` VALUES ('520600', '铜仁市', '铜仁', '520000', null, '中国,贵州省,铜仁市', '2', '554300', '0856', 'Tongren', '109.1915550', '27.7183460');
INSERT INTO `sys_cn_area` VALUES ('520602', '碧江区', '碧江', '520600', null, '中国,贵州省,铜仁市,碧江区', '3', '554300', '0856', 'Bijiang', '109.1915550', '27.7183460');
INSERT INTO `sys_cn_area` VALUES ('520603', '万山区', '万山', '520600', null, '中国,贵州省,铜仁市,万山区', '3', '554200', '0856', 'Wanshan', '109.2119900', '27.5190300');
INSERT INTO `sys_cn_area` VALUES ('520621', '江口县', '江口', '520600', null, '中国,贵州省,铜仁市,江口县', '3', '554400', '0856', 'Jiangkou', '108.8484270', '27.6919040');
INSERT INTO `sys_cn_area` VALUES ('520622', '玉屏侗族自治县', '玉屏', '520600', null, '中国,贵州省,铜仁市,玉屏侗族自治县', '3', '554004', '0856', 'Yuping', '108.9178820', '27.2380240');
INSERT INTO `sys_cn_area` VALUES ('520623', '石阡县', '石阡', '520600', null, '中国,贵州省,铜仁市,石阡县', '3', '555100', '0856', 'Shiqian', '108.2298540', '27.5193860');
INSERT INTO `sys_cn_area` VALUES ('520624', '思南县', '思南', '520600', null, '中国,贵州省,铜仁市,思南县', '3', '565100', '0856', 'Sinan', '108.2558270', '27.9413310');
INSERT INTO `sys_cn_area` VALUES ('520625', '印江土家族苗族自治县', '印江', '520600', null, '中国,贵州省,铜仁市,印江土家族苗族自治县', '3', '555200', '0856', 'Yinjiang', '108.4055170', '27.9979760');
INSERT INTO `sys_cn_area` VALUES ('520626', '德江县', '德江', '520600', null, '中国,贵州省,铜仁市,德江县', '3', '565200', '0856', 'Dejiang', '108.1173170', '28.2609400');
INSERT INTO `sys_cn_area` VALUES ('520627', '沿河土家族自治县', '沿河', '520600', null, '中国,贵州省,铜仁市,沿河土家族自治县', '3', '565300', '0856', 'Yuanhe', '108.4957460', '28.5604870');
INSERT INTO `sys_cn_area` VALUES ('520628', '松桃苗族自治县', '松桃', '520600', null, '中国,贵州省,铜仁市,松桃苗族自治县', '3', '554100', '0856', 'Songtao', '109.2026270', '28.1654190');
INSERT INTO `sys_cn_area` VALUES ('522300', '黔西南布依族苗族自治州', '黔西南', '520000', null, '中国,贵州省,黔西南布依族苗族自治州', '2', '562400', '0859', 'Qianxinan', '104.8979710', '25.0881200');
INSERT INTO `sys_cn_area` VALUES ('522301', '兴义市 ', '兴义', '522300', null, '中国,贵州省,黔西南布依族苗族自治州,兴义市 ', '3', '562400', '0859', 'Xingyi', '104.8954800', '25.0920500');
INSERT INTO `sys_cn_area` VALUES ('522322', '兴仁县', '兴仁', '522300', null, '中国,贵州省,黔西南布依族苗族自治州,兴仁县', '3', '562300', '0859', 'Xingren', '105.1865200', '25.4328200');
INSERT INTO `sys_cn_area` VALUES ('522323', '普安县', '普安', '522300', null, '中国,贵州省,黔西南布依族苗族自治州,普安县', '3', '561500', '0859', 'Pu\'an', '104.9552900', '25.7860300');
INSERT INTO `sys_cn_area` VALUES ('522324', '晴隆县', '晴隆', '522300', null, '中国,贵州省,黔西南布依族苗族自治州,晴隆县', '3', '561400', '0859', 'Qinglong', '105.2192000', '25.8352200');
INSERT INTO `sys_cn_area` VALUES ('522325', '贞丰县', '贞丰', '522300', null, '中国,贵州省,黔西南布依族苗族自治州,贞丰县', '3', '562200', '0859', 'Zhenfeng', '105.6545400', '25.3846400');
INSERT INTO `sys_cn_area` VALUES ('522326', '望谟县', '望谟', '522300', null, '中国,贵州省,黔西南布依族苗族自治州,望谟县', '3', '552300', '0859', 'Wangmo', '106.0995700', '25.1782200');
INSERT INTO `sys_cn_area` VALUES ('522327', '册亨县', '册亨', '522300', null, '中国,贵州省,黔西南布依族苗族自治州,册亨县', '3', '552200', '0859', 'Ceheng', '105.8124000', '24.9837600');
INSERT INTO `sys_cn_area` VALUES ('522328', '安龙县', '安龙', '522300', null, '中国,贵州省,黔西南布依族苗族自治州,安龙县', '3', '552400', '0859', 'Anlong', '105.4426800', '25.0981800');
INSERT INTO `sys_cn_area` VALUES ('522600', '黔东南苗族侗族自治州', '黔东南', '520000', null, '中国,贵州省,黔东南苗族侗族自治州', '2', '556000', '0855', 'Qiandongnan', '107.9774880', '26.5833520');
INSERT INTO `sys_cn_area` VALUES ('522601', '凯里市', '凯里', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,凯里市', '3', '556000', '0855', 'Kaili', '107.9813200', '26.5668900');
INSERT INTO `sys_cn_area` VALUES ('522622', '黄平县', '黄平', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,黄平县', '3', '556100', '0855', 'Huangping', '107.9017900', '26.8957300');
INSERT INTO `sys_cn_area` VALUES ('522623', '施秉县', '施秉', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,施秉县', '3', '556200', '0855', 'Shibing', '108.1259700', '27.0349500');
INSERT INTO `sys_cn_area` VALUES ('522624', '三穗县', '三穗', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,三穗县', '3', '556500', '0855', 'Sansui', '108.6713200', '26.9476500');
INSERT INTO `sys_cn_area` VALUES ('522625', '镇远县', '镇远', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,镇远县', '3', '557700', '0855', 'Zhenyuan', '108.4272100', '27.0493300');
INSERT INTO `sys_cn_area` VALUES ('522626', '岑巩县', '岑巩', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,岑巩县', '3', '557800', '0855', 'Cengong', '108.8188400', '27.1753900');
INSERT INTO `sys_cn_area` VALUES ('522627', '天柱县', '天柱', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,天柱县', '3', '556600', '0855', 'Tianzhu', '109.2071800', '26.9078100');
INSERT INTO `sys_cn_area` VALUES ('522628', '锦屏县', '锦屏', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,锦屏县', '3', '556700', '0855', 'Jinping', '109.1998200', '26.6763500');
INSERT INTO `sys_cn_area` VALUES ('522629', '剑河县', '剑河', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,剑河县', '3', '556400', '0855', 'Jianhe', '108.5913000', '26.6525000');
INSERT INTO `sys_cn_area` VALUES ('522630', '台江县', '台江', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,台江县', '3', '556300', '0855', 'Taijiang', '108.3181400', '26.6691600');
INSERT INTO `sys_cn_area` VALUES ('522631', '黎平县', '黎平', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,黎平县', '3', '557300', '0855', 'Liping', '109.1360700', '26.2311400');
INSERT INTO `sys_cn_area` VALUES ('522632', '榕江县', '榕江', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,榕江县', '3', '557200', '0855', 'Rongjiang', '108.5207200', '25.9242100');
INSERT INTO `sys_cn_area` VALUES ('522633', '从江县', '从江', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,从江县', '3', '557400', '0855', 'Congjiang', '108.9052700', '25.7541500');
INSERT INTO `sys_cn_area` VALUES ('522634', '雷山县', '雷山', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,雷山县', '3', '557100', '0855', 'Leishan', '108.0774500', '26.3838500');
INSERT INTO `sys_cn_area` VALUES ('522635', '麻江县', '麻江', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,麻江县', '3', '557600', '0855', 'Majiang', '107.5915500', '26.4923500');
INSERT INTO `sys_cn_area` VALUES ('522636', '丹寨县', '丹寨', '522600', null, '中国,贵州省,黔东南苗族侗族自治州,丹寨县', '3', '557500', '0855', 'Danzhai', '107.7971800', '26.1981600');
INSERT INTO `sys_cn_area` VALUES ('522700', '黔南布依族苗族自治州', '黔南', '520000', null, '中国,贵州省,黔南布依族苗族自治州', '2', '558000', '0854', 'Qiannan', '107.5171560', '26.2582190');
INSERT INTO `sys_cn_area` VALUES ('522701', '都匀市', '都匀', '522700', null, '中国,贵州省,黔南布依族苗族自治州,都匀市', '3', '558000', '0854', 'Duyun', '107.5187200', '26.2594000');
INSERT INTO `sys_cn_area` VALUES ('522702', '福泉市', '福泉', '522700', null, '中国,贵州省,黔南布依族苗族自治州,福泉市', '3', '550500', '0854', 'Fuquan', '107.5171500', '26.6798900');
INSERT INTO `sys_cn_area` VALUES ('522722', '荔波县', '荔波', '522700', null, '中国,贵州省,黔南布依族苗族自治州,荔波县', '3', '558400', '0854', 'Libo', '107.8859200', '25.4139000');
INSERT INTO `sys_cn_area` VALUES ('522723', '贵定县', '贵定', '522700', null, '中国,贵州省,黔南布依族苗族自治州,贵定县', '3', '551300', '0854', 'Guiding', '107.2365400', '26.5781200');
INSERT INTO `sys_cn_area` VALUES ('522725', '瓮安县', '瓮安', '522700', null, '中国,贵州省,黔南布依族苗族自治州,瓮安县', '3', '550400', '0854', 'Weng\'an', '107.4757000', '27.0681300');
INSERT INTO `sys_cn_area` VALUES ('522726', '独山县', '独山', '522700', null, '中国,贵州省,黔南布依族苗族自治州,独山县', '3', '558200', '0854', 'Dushan', '107.5410100', '25.8245000');
INSERT INTO `sys_cn_area` VALUES ('522727', '平塘县', '平塘', '522700', null, '中国,贵州省,黔南布依族苗族自治州,平塘县', '3', '558300', '0854', 'Pingtang', '107.3242800', '25.8329400');
INSERT INTO `sys_cn_area` VALUES ('522728', '罗甸县', '罗甸', '522700', null, '中国,贵州省,黔南布依族苗族自治州,罗甸县', '3', '550100', '0854', 'Luodian', '106.7518600', '25.4258600');
INSERT INTO `sys_cn_area` VALUES ('522729', '长顺县', '长顺', '522700', null, '中国,贵州省,黔南布依族苗族自治州,长顺县', '3', '550700', '0854', 'Changshun', '106.4521700', '26.0229900');
INSERT INTO `sys_cn_area` VALUES ('522730', '龙里县', '龙里', '522700', null, '中国,贵州省,黔南布依族苗族自治州,龙里县', '3', '551200', '0854', 'Longli', '106.9766200', '26.4507600');
INSERT INTO `sys_cn_area` VALUES ('522731', '惠水县', '惠水', '522700', null, '中国,贵州省,黔南布依族苗族自治州,惠水县', '3', '550600', '0854', 'Huishui', '106.6591100', '26.1338900');
INSERT INTO `sys_cn_area` VALUES ('522732', '三都水族自治县', '三都', '522700', null, '中国,贵州省,黔南布依族苗族自治州,三都水族自治县', '3', '558100', '0854', 'Sandu', '107.8746400', '25.9856200');
INSERT INTO `sys_cn_area` VALUES ('530000', '云南省', '云南', '100000', null, '中国,云南省', '1', null, '', 'Yunnan', '102.7122510', '25.0406090');
INSERT INTO `sys_cn_area` VALUES ('530100', '昆明市', '昆明', '530000', null, '中国,云南省,昆明市', '2', '650500', '0871', 'Kunming', '102.7122510', '25.0406090');
INSERT INTO `sys_cn_area` VALUES ('530102', '五华区', '五华', '530100', null, '中国,云南省,昆明市,五华区', '3', '650021', '0871', 'Wuhua', '102.7078600', '25.0352100');
INSERT INTO `sys_cn_area` VALUES ('530103', '盘龙区', '盘龙', '530100', null, '中国,云南省,昆明市,盘龙区', '3', '650051', '0871', 'Panlong', '102.7199400', '25.0405300');
INSERT INTO `sys_cn_area` VALUES ('530111', '官渡区', '官渡', '530100', null, '中国,云南省,昆明市,官渡区', '3', '650200', '0871', 'Guandu', '102.7436200', '25.0149700');
INSERT INTO `sys_cn_area` VALUES ('530112', '西山区', '西山', '530100', null, '中国,云南省,昆明市,西山区', '3', '650118', '0871', 'Xishan', '102.6646400', '25.0379600');
INSERT INTO `sys_cn_area` VALUES ('530113', '东川区', '东川', '530100', null, '中国,云南省,昆明市,东川区', '3', '654100', '0871', 'Dongchuan', '103.1883200', '26.0830000');
INSERT INTO `sys_cn_area` VALUES ('530114', '呈贡区', '呈贡', '530100', null, '中国,云南省,昆明市,呈贡区', '3', '650500', '0871', 'Chenggong', '102.8013820', '24.8892750');
INSERT INTO `sys_cn_area` VALUES ('530122', '晋宁县', '晋宁', '530100', null, '中国,云南省,昆明市,晋宁县', '3', '650600', '0871', 'Jinning', '102.5939300', '24.6665000');
INSERT INTO `sys_cn_area` VALUES ('530124', '富民县', '富民', '530100', null, '中国,云南省,昆明市,富民县', '3', '650400', '0871', 'Fumin', '102.4985000', '25.2211900');
INSERT INTO `sys_cn_area` VALUES ('530125', '宜良县', '宜良', '530100', null, '中国,云南省,昆明市,宜良县', '3', '652100', '0871', 'Yiliang', '103.1411700', '24.9170500');
INSERT INTO `sys_cn_area` VALUES ('530126', '石林彝族自治县', '石林', '530100', null, '中国,云南省,昆明市,石林彝族自治县', '3', '652200', '0871', 'Shilin', '103.2714800', '24.7589700');
INSERT INTO `sys_cn_area` VALUES ('530127', '嵩明县', '嵩明', '530100', null, '中国,云南省,昆明市,嵩明县', '3', '651700', '0871', 'Songming', '103.0372900', '25.3398600');
INSERT INTO `sys_cn_area` VALUES ('530128', '禄劝彝族苗族自治县', '禄劝', '530100', null, '中国,云南省,昆明市,禄劝彝族苗族自治县', '3', '651500', '0871', 'Luquan', '102.4671000', '25.5538700');
INSERT INTO `sys_cn_area` VALUES ('530129', '寻甸回族彝族自治县 ', '寻甸', '530100', null, '中国,云南省,昆明市,寻甸回族彝族自治县 ', '3', '655200', '0871', 'Xundian', '103.2557000', '25.5596100');
INSERT INTO `sys_cn_area` VALUES ('530181', '安宁市', '安宁', '530100', null, '中国,云南省,昆明市,安宁市', '3', '650300', '0871', 'Anning', '102.4697200', '24.9165200');
INSERT INTO `sys_cn_area` VALUES ('530300', '曲靖市', '曲靖', '530000', null, '中国,云南省,曲靖市', '2', '655000', '0874', 'Qujing', '103.7978510', '25.5015570');
INSERT INTO `sys_cn_area` VALUES ('530302', '麒麟区', '麒麟', '530300', null, '中国,云南省,曲靖市,麒麟区', '3', '655000', '0874', 'Qilin', '103.8050400', '25.4951500');
INSERT INTO `sys_cn_area` VALUES ('530321', '马龙县', '马龙', '530300', null, '中国,云南省,曲靖市,马龙县', '3', '655100', '0874', 'Malong', '103.5787300', '25.4252100');
INSERT INTO `sys_cn_area` VALUES ('530322', '陆良县', '陆良', '530300', null, '中国,云南省,曲靖市,陆良县', '3', '655600', '0874', 'Luliang', '103.6665000', '25.0233500');
INSERT INTO `sys_cn_area` VALUES ('530323', '师宗县', '师宗', '530300', null, '中国,云南省,曲靖市,师宗县', '3', '655700', '0874', 'Shizong', '103.9908400', '24.8282200');
INSERT INTO `sys_cn_area` VALUES ('530324', '罗平县', '罗平', '530300', null, '中国,云南省,曲靖市,罗平县', '3', '655800', '0874', 'Luoping', '104.3085900', '24.8844400');
INSERT INTO `sys_cn_area` VALUES ('530325', '富源县', '富源', '530300', null, '中国,云南省,曲靖市,富源县', '3', '655500', '0874', 'Fuyuan', '104.2538700', '25.6658700');
INSERT INTO `sys_cn_area` VALUES ('530326', '会泽县', '会泽', '530300', null, '中国,云南省,曲靖市,会泽县', '3', '654200', '0874', 'Huize', '103.3001700', '26.4107600');
INSERT INTO `sys_cn_area` VALUES ('530328', '沾益县', '沾益', '530300', null, '中国,云南省,曲靖市,沾益县', '3', '655331', '0874', 'Zhanyi', '103.8213500', '25.6071500');
INSERT INTO `sys_cn_area` VALUES ('530381', '宣威市', '宣威', '530300', null, '中国,云南省,曲靖市,宣威市', '3', '655400', '0874', 'Xuanwei', '104.1040900', '26.2173000');
INSERT INTO `sys_cn_area` VALUES ('530400', '玉溪市', '玉溪', '530000', null, '中国,云南省,玉溪市', '2', '653100', '0877', 'Yuxi', '102.5439070', '24.3504610');
INSERT INTO `sys_cn_area` VALUES ('530402', '红塔区', '红塔', '530400', null, '中国,云南省,玉溪市,红塔区', '3', '653100', '0877', 'Hongta', '102.5449000', '24.3541100');
INSERT INTO `sys_cn_area` VALUES ('530421', '江川县', '江川', '530400', null, '中国,云南省,玉溪市,江川县', '3', '652600', '0877', 'Jiangchuan', '102.7541200', '24.2886300');
INSERT INTO `sys_cn_area` VALUES ('530422', '澄江县', '澄江', '530400', null, '中国,云南省,玉溪市,澄江县', '3', '652500', '0877', 'Chengjiang', '102.9081700', '24.6737600');
INSERT INTO `sys_cn_area` VALUES ('530423', '通海县', '通海', '530400', null, '中国,云南省,玉溪市,通海县', '3', '652700', '0877', 'Tonghai', '102.7664100', '24.1136200');
INSERT INTO `sys_cn_area` VALUES ('530424', '华宁县', '华宁', '530400', null, '中国,云南省,玉溪市,华宁县', '3', '652800', '0877', 'Huaning', '102.9283100', '24.1926000');
INSERT INTO `sys_cn_area` VALUES ('530425', '易门县', '易门', '530400', null, '中国,云南省,玉溪市,易门县', '3', '651100', '0877', 'Yimen', '102.1635400', '24.6712200');
INSERT INTO `sys_cn_area` VALUES ('530426', '峨山彝族自治县', '峨山', '530400', null, '中国,云南省,玉溪市,峨山彝族自治县', '3', '653200', '0877', 'Eshan', '102.4057600', '24.1690400');
INSERT INTO `sys_cn_area` VALUES ('530427', '新平彝族傣族自治县', '新平', '530400', null, '中国,云南省,玉溪市,新平彝族傣族自治县', '3', '653400', '0877', 'Xinping', '101.9889500', '24.0688600');
INSERT INTO `sys_cn_area` VALUES ('530428', '元江哈尼族彝族傣族自治县', '元江', '530400', null, '中国,云南省,玉溪市,元江哈尼族彝族傣族自治县', '3', '653300', '0877', 'Yuanjiang', '101.9981200', '23.5965500');
INSERT INTO `sys_cn_area` VALUES ('530500', '保山市', '保山', '530000', null, '中国,云南省,保山市', '2', '678000', '0875', 'Baoshan', '99.1671330', '25.1118020');
INSERT INTO `sys_cn_area` VALUES ('530502', '隆阳区', '隆阳', '530500', null, '中国,云南省,保山市,隆阳区', '3', '678000', '0875', 'Longyang', '99.1633400', '25.1116300');
INSERT INTO `sys_cn_area` VALUES ('530521', '施甸县', '施甸', '530500', null, '中国,云南省,保山市,施甸县', '3', '678200', '0875', 'Shidian', '99.1876800', '24.7241800');
INSERT INTO `sys_cn_area` VALUES ('530522', '腾冲县', '腾冲', '530500', null, '中国,云南省,保山市,腾冲县', '3', '679100', '0875', 'Tengchong', '98.4941400', '25.0253900');
INSERT INTO `sys_cn_area` VALUES ('530523', '龙陵县', '龙陵', '530500', null, '中国,云南省,保山市,龙陵县', '3', '678300', '0875', 'Longling', '98.6902400', '24.5874600');
INSERT INTO `sys_cn_area` VALUES ('530524', '昌宁县', '昌宁', '530500', null, '中国,云南省,保山市,昌宁县', '3', '678100', '0875', 'Changning', '99.6036000', '24.8276300');
INSERT INTO `sys_cn_area` VALUES ('530600', '昭通市', '昭通', '530000', null, '中国,云南省,昭通市', '2', '657000', '0870', 'Zhaotong', '103.7172160', '27.3369990');
INSERT INTO `sys_cn_area` VALUES ('530602', '昭阳区', '昭阳', '530600', null, '中国,云南省,昭通市,昭阳区', '3', '657000', '0870', 'Zhaoyang', '103.7065400', '27.3199800');
INSERT INTO `sys_cn_area` VALUES ('530621', '鲁甸县', '鲁甸', '530600', null, '中国,云南省,昭通市,鲁甸县', '3', '657100', '0870', 'Ludian', '103.5472100', '27.1923800');
INSERT INTO `sys_cn_area` VALUES ('530622', '巧家县', '巧家', '530600', null, '中国,云南省,昭通市,巧家县', '3', '654600', '0870', 'Qiaojia', '102.9241600', '26.9123700');
INSERT INTO `sys_cn_area` VALUES ('530623', '盐津县', '盐津', '530600', null, '中国,云南省,昭通市,盐津县', '3', '657500', '0870', 'Yanjin', '104.2346100', '28.1085600');
INSERT INTO `sys_cn_area` VALUES ('530624', '大关县', '大关', '530600', null, '中国,云南省,昭通市,大关县', '3', '657400', '0870', 'Daguan', '103.8925400', '27.7488000');
INSERT INTO `sys_cn_area` VALUES ('530625', '永善县', '永善', '530600', null, '中国,云南省,昭通市,永善县', '3', '657300', '0870', 'Yongshan', '103.6350400', '28.2279000');
INSERT INTO `sys_cn_area` VALUES ('530626', '绥江县', '绥江', '530600', null, '中国,云南省,昭通市,绥江县', '3', '657700', '0870', 'Suijiang', '103.9493700', '28.5966100');
INSERT INTO `sys_cn_area` VALUES ('530627', '镇雄县', '镇雄', '530600', null, '中国,云南省,昭通市,镇雄县', '3', '657200', '0870', 'Zhenxiong', '104.8725800', '27.4398100');
INSERT INTO `sys_cn_area` VALUES ('530628', '彝良县', '彝良', '530600', null, '中国,云南省,昭通市,彝良县', '3', '657600', '0870', 'Yiliang', '104.0498300', '27.6280900');
INSERT INTO `sys_cn_area` VALUES ('530629', '威信县', '威信', '530600', null, '中国,云南省,昭通市,威信县', '3', '657900', '0870', 'Weixin', '105.0475400', '27.8406500');
INSERT INTO `sys_cn_area` VALUES ('530630', '水富县', '水富', '530600', null, '中国,云南省,昭通市,水富县', '3', '657800', '0870', 'Shuifu', '104.4158000', '28.6298600');
INSERT INTO `sys_cn_area` VALUES ('530700', '丽江市', '丽江', '530000', null, '中国,云南省,丽江市', '2', '674100', '0888', 'Lijiang', '100.2330260', '26.8721080');
INSERT INTO `sys_cn_area` VALUES ('530702', '古城区', '古城', '530700', null, '中国,云南省,丽江市,古城区', '3', '674100', '0888', 'Gucheng', '100.2257000', '26.8769700');
INSERT INTO `sys_cn_area` VALUES ('530721', '玉龙纳西族自治县', '玉龙', '530700', null, '中国,云南省,丽江市,玉龙纳西族自治县', '3', '674100', '0888', 'Yulong', '100.2369000', '26.8214900');
INSERT INTO `sys_cn_area` VALUES ('530722', '永胜县', '永胜', '530700', null, '中国,云南省,丽江市,永胜县', '3', '674200', '0888', 'Yongsheng', '100.7466700', '26.6859100');
INSERT INTO `sys_cn_area` VALUES ('530723', '华坪县', '华坪', '530700', null, '中国,云南省,丽江市,华坪县', '3', '674800', '0888', 'Huaping', '101.2656200', '26.6296700');
INSERT INTO `sys_cn_area` VALUES ('530724', '宁蒗彝族自治县', '宁蒗', '530700', null, '中国,云南省,丽江市,宁蒗彝族自治县', '3', '674300', '0888', 'Ninglang', '100.8507000', '27.2817900');
INSERT INTO `sys_cn_area` VALUES ('530800', '普洱市', '普洱', '530000', null, '中国,云南省,普洱市', '2', '665000', '0879', 'Pu\'er', '100.9723440', '22.7773210');
INSERT INTO `sys_cn_area` VALUES ('530802', '思茅区', '思茅', '530800', null, '中国,云南省,普洱市,思茅区', '3', '665000', '0879', 'Simao', '100.9771600', '22.7869100');
INSERT INTO `sys_cn_area` VALUES ('530821', '宁洱哈尼族彝族自治县', '宁洱', '530800', null, '中国,云南省,普洱市,宁洱哈尼族彝族自治县', '3', '665100', '0879', 'Ninger', '101.0465300', '23.0634100');
INSERT INTO `sys_cn_area` VALUES ('530822', '墨江哈尼族自治县', '墨江', '530800', null, '中国,云南省,普洱市,墨江哈尼族自治县', '3', '654800', '0879', 'Mojiang', '101.6917100', '23.4321400');
INSERT INTO `sys_cn_area` VALUES ('530823', '景东彝族自治县', '景东', '530800', null, '中国,云南省,普洱市,景东彝族自治县', '3', '676200', '0879', 'Jingdong', '100.8359900', '24.4479100');
INSERT INTO `sys_cn_area` VALUES ('530824', '景谷傣族彝族自治县', '景谷', '530800', null, '中国,云南省,普洱市,景谷傣族彝族自治县', '3', '666400', '0879', 'Jinggu', '100.7025100', '23.4970500');
INSERT INTO `sys_cn_area` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '镇沅', '530800', null, '中国,云南省,普洱市,镇沅彝族哈尼族拉祜族自治县', '3', '666500', '0879', 'Zhenyuan', '101.1067500', '24.0055700');
INSERT INTO `sys_cn_area` VALUES ('530826', '江城哈尼族彝族自治县', '江城', '530800', null, '中国,云南省,普洱市,江城哈尼族彝族自治县', '3', '665900', '0879', 'Jiangcheng', '101.8578800', '22.5842400');
INSERT INTO `sys_cn_area` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '孟连', '530800', null, '中国,云南省,普洱市,孟连傣族拉祜族佤族自治县', '3', '665800', '0879', 'Menglian', '99.5842400', '22.3292200');
INSERT INTO `sys_cn_area` VALUES ('530828', '澜沧拉祜族自治县', '澜沧', '530800', null, '中国,云南省,普洱市,澜沧拉祜族自治县', '3', '665600', '0879', 'Lancang', '99.9359100', '22.5547400');
INSERT INTO `sys_cn_area` VALUES ('530829', '西盟佤族自治县', '西盟', '530800', null, '中国,云南省,普洱市,西盟佤族自治县', '3', '665700', '0879', 'Ximeng', '99.5986900', '22.6477400');
INSERT INTO `sys_cn_area` VALUES ('530900', '临沧市', '临沧', '530000', null, '中国,云南省,临沧市', '2', '677000', '0883', 'Lincang', '100.0869700', '23.8865670');
INSERT INTO `sys_cn_area` VALUES ('530902', '临翔区', '临翔', '530900', null, '中国,云南省,临沧市,临翔区', '3', '677000', '0883', 'Linxiang', '100.0824200', '23.8949700');
INSERT INTO `sys_cn_area` VALUES ('530921', '凤庆县', '凤庆', '530900', null, '中国,云南省,临沧市,凤庆县', '3', '675900', '0883', 'Fengqing', '99.9283700', '24.5803400');
INSERT INTO `sys_cn_area` VALUES ('530922', '云县', '云县', '530900', null, '中国,云南省,临沧市,云县', '3', '675800', '0883', 'Yunxian', '100.1280800', '24.4467500');
INSERT INTO `sys_cn_area` VALUES ('530923', '永德县', '永德', '530900', null, '中国,云南省,临沧市,永德县', '3', '677600', '0883', 'Yongde', '99.2532600', '24.0276000');
INSERT INTO `sys_cn_area` VALUES ('530924', '镇康县', '镇康', '530900', null, '中国,云南省,临沧市,镇康县', '3', '677704', '0883', 'Zhenkang', '98.8255000', '23.7624100');
INSERT INTO `sys_cn_area` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '双江', '530900', null, '中国,云南省,临沧市,双江拉祜族佤族布朗族傣族自治县', '3', '677300', '0883', 'Shuangjiang', '99.8276900', '23.4734900');
INSERT INTO `sys_cn_area` VALUES ('530926', '耿马傣族佤族自治县', '耿马', '530900', null, '中国,云南省,临沧市,耿马傣族佤族自治县', '3', '677500', '0883', 'Gengma', '99.3978500', '23.5377600');
INSERT INTO `sys_cn_area` VALUES ('530927', '沧源佤族自治县', '沧源', '530900', null, '中国,云南省,临沧市,沧源佤族自治县', '3', '677400', '0883', 'Cangyuan', '99.2454500', '23.1482100');
INSERT INTO `sys_cn_area` VALUES ('532300', '楚雄彝族自治州', '楚雄', '530000', null, '中国,云南省,楚雄彝族自治州', '2', '675000', '0878', 'Chuxiong', '101.5460460', '25.0419880');
INSERT INTO `sys_cn_area` VALUES ('532301', '楚雄市', '楚雄', '532300', null, '中国,云南省,楚雄彝族自治州,楚雄市', '3', '675000', '0878', 'Chuxiong', '101.5461500', '25.0329000');
INSERT INTO `sys_cn_area` VALUES ('532322', '双柏县', '双柏', '532300', null, '中国,云南省,楚雄彝族自治州,双柏县', '3', '675100', '0878', 'Shuangbai', '101.6420500', '24.6888200');
INSERT INTO `sys_cn_area` VALUES ('532323', '牟定县', '牟定', '532300', null, '中国,云南省,楚雄彝族自治州,牟定县', '3', '675500', '0878', 'Mouding', '101.5400000', '25.3155100');
INSERT INTO `sys_cn_area` VALUES ('532324', '南华县', '南华', '532300', null, '中国,云南省,楚雄彝族自治州,南华县', '3', '675200', '0878', 'Nanhua', '101.2731300', '25.1929300');
INSERT INTO `sys_cn_area` VALUES ('532325', '姚安县', '姚安', '532300', null, '中国,云南省,楚雄彝族自治州,姚安县', '3', '675300', '0878', 'Yao\'an', '101.2427900', '25.5046700');
INSERT INTO `sys_cn_area` VALUES ('532326', '大姚县', '大姚', '532300', null, '中国,云南省,楚雄彝族自治州,大姚县', '3', '675400', '0878', 'Dayao', '101.3239700', '25.7221800');
INSERT INTO `sys_cn_area` VALUES ('532327', '永仁县', '永仁', '532300', null, '中国,云南省,楚雄彝族自治州,永仁县', '3', '651400', '0878', 'Yongren', '101.6716000', '26.0579400');
INSERT INTO `sys_cn_area` VALUES ('532328', '元谋县', '元谋', '532300', null, '中国,云南省,楚雄彝族自治州,元谋县', '3', '651300', '0878', 'Yuanmou', '101.8772800', '25.7043800');
INSERT INTO `sys_cn_area` VALUES ('532329', '武定县', '武定', '532300', null, '中国,云南省,楚雄彝族自治州,武定县', '3', '651600', '0878', 'Wuding', '102.4038000', '25.5295000');
INSERT INTO `sys_cn_area` VALUES ('532331', '禄丰县', '禄丰', '532300', null, '中国,云南省,楚雄彝族自治州,禄丰县', '3', '651200', '0878', 'Lufeng', '102.0779700', '25.1481500');
INSERT INTO `sys_cn_area` VALUES ('532500', '红河哈尼族彝族自治州', '红河', '530000', null, '中国,云南省,红河哈尼族彝族自治州', '2', '661400', '0873', 'Honghe', '103.3841820', '23.3667750');
INSERT INTO `sys_cn_area` VALUES ('532501', '个旧市', '个旧', '532500', null, '中国,云南省,红河哈尼族彝族自治州,个旧市', '3', '661000', '0873', 'Gejiu', '103.1596600', '23.3589400');
INSERT INTO `sys_cn_area` VALUES ('532502', '开远市', '开远', '532500', null, '中国,云南省,红河哈尼族彝族自治州,开远市', '3', '661600', '0873', 'Kaiyuan', '103.2698600', '23.7101200');
INSERT INTO `sys_cn_area` VALUES ('532503', '蒙自市', '蒙自', '532500', null, '中国,云南省,红河哈尼族彝族自治州,蒙自市', '3', '661101', '0873', 'Mengzi', '103.3850050', '23.3668430');
INSERT INTO `sys_cn_area` VALUES ('532504', '弥勒市', '弥勒', '532500', null, '中国,云南省,红河哈尼族彝族自治州,弥勒市', '3', '652300', '0873', 'Mile ', '103.4369880', '24.4083700');
INSERT INTO `sys_cn_area` VALUES ('532523', '屏边苗族自治县', '屏边', '532500', null, '中国,云南省,红河哈尼族彝族自治州,屏边苗族自治县', '3', '661200', '0873', 'Pingbian', '103.6855400', '22.9842500');
INSERT INTO `sys_cn_area` VALUES ('532524', '建水县', '建水', '532500', null, '中国,云南省,红河哈尼族彝族自治州,建水县', '3', '654300', '0873', 'Jianshui', '102.8265600', '23.6347200');
INSERT INTO `sys_cn_area` VALUES ('532525', '石屏县', '石屏', '532500', null, '中国,云南省,红河哈尼族彝族自治州,石屏县', '3', '662200', '0873', 'Shiping', '102.4940800', '23.7144100');
INSERT INTO `sys_cn_area` VALUES ('532527', '泸西县', '泸西', '532500', null, '中国,云南省,红河哈尼族彝族自治州,泸西县', '3', '652400', '0873', 'Luxi', '103.7637300', '24.5285400');
INSERT INTO `sys_cn_area` VALUES ('532528', '元阳县', '元阳', '532500', null, '中国,云南省,红河哈尼族彝族自治州,元阳县', '3', '662400', '0873', 'Yuanyang', '102.8326100', '23.2228100');
INSERT INTO `sys_cn_area` VALUES ('532529', '红河县', '红河县', '532500', null, '中国,云南省,红河哈尼族彝族自治州,红河县', '3', '654400', '0873', 'Honghexian', '102.4205900', '23.3676700');
INSERT INTO `sys_cn_area` VALUES ('532530', '金平苗族瑶族傣族自治县', '金平', '532500', null, '中国,云南省,红河哈尼族彝族自治州,金平苗族瑶族傣族自治县', '3', '661500', '0873', 'Jinping', '103.2265100', '22.7795900');
INSERT INTO `sys_cn_area` VALUES ('532531', '绿春县', '绿春', '532500', null, '中国,云南省,红河哈尼族彝族自治州,绿春县', '3', '662500', '0873', 'Lvchun', '102.3967200', '22.9937100');
INSERT INTO `sys_cn_area` VALUES ('532532', '河口瑶族自治县', '河口', '532500', null, '中国,云南省,红河哈尼族彝族自治州,河口瑶族自治县', '3', '661300', '0873', 'Hekou', '103.9393600', '22.5292900');
INSERT INTO `sys_cn_area` VALUES ('532600', '文山壮族苗族自治州', '文山', '530000', null, '中国,云南省,文山壮族苗族自治州', '2', '663000', '0876', 'Wenshan', '104.2440100', '23.3695100');
INSERT INTO `sys_cn_area` VALUES ('532601', '文山市', '文山', '532600', null, '中国,云南省,文山壮族苗族自治州,文山市', '3', '663000', '0876', 'Wenshan', '104.2442770', '23.3692160');
INSERT INTO `sys_cn_area` VALUES ('532622', '砚山县', '砚山', '532600', null, '中国,云南省,文山壮族苗族自治州,砚山县', '3', '663100', '0876', 'Yanshan', '104.3330600', '23.6072300');
INSERT INTO `sys_cn_area` VALUES ('532623', '西畴县', '西畴', '532600', null, '中国,云南省,文山壮族苗族自治州,西畴县', '3', '663500', '0876', 'Xichou', '104.6741900', '23.4394100');
INSERT INTO `sys_cn_area` VALUES ('532624', '麻栗坡县', '麻栗坡', '532600', null, '中国,云南省,文山壮族苗族自治州,麻栗坡县', '3', '663600', '0876', 'Malipo', '104.7013200', '23.1202800');
INSERT INTO `sys_cn_area` VALUES ('532625', '马关县', '马关', '532600', null, '中国,云南省,文山壮族苗族自治州,马关县', '3', '663700', '0876', 'Maguan', '104.3951400', '23.0129300');
INSERT INTO `sys_cn_area` VALUES ('532626', '丘北县', '丘北', '532600', null, '中国,云南省,文山壮族苗族自治州,丘北县', '3', '663200', '0876', 'Qiubei', '104.1925600', '24.0395700');
INSERT INTO `sys_cn_area` VALUES ('532627', '广南县', '广南', '532600', null, '中国,云南省,文山壮族苗族自治州,广南县', '3', '663300', '0876', 'Guangnan', '105.0551100', '24.0464000');
INSERT INTO `sys_cn_area` VALUES ('532628', '富宁县', '富宁', '532600', null, '中国,云南省,文山壮族苗族自治州,富宁县', '3', '663400', '0876', 'Funing', '105.6308500', '23.6253600');
INSERT INTO `sys_cn_area` VALUES ('532800', '西双版纳傣族自治州', '西双版纳', '530000', null, '中国,云南省,西双版纳傣族自治州', '2', '666100', '0691', 'Xishuangbanna', '100.7979410', '22.0017240');
INSERT INTO `sys_cn_area` VALUES ('532801', '景洪市', '景洪', '532800', null, '中国,云南省,西双版纳傣族自治州,景洪市', '3', '666100', '0691', 'Jinghong', '100.7997700', '22.0107100');
INSERT INTO `sys_cn_area` VALUES ('532822', '勐海县', '勐海', '532800', null, '中国,云南省,西双版纳傣族自治州,勐海县', '3', '666200', '0691', 'Menghai', '100.4493100', '21.9617500');
INSERT INTO `sys_cn_area` VALUES ('532823', '勐腊县', '勐腊', '532800', null, '中国,云南省,西双版纳傣族自治州,勐腊县', '3', '666300', '0691', 'Mengla', '101.5648800', '21.4816200');
INSERT INTO `sys_cn_area` VALUES ('532900', '大理白族自治州', '大理', '530000', null, '中国,云南省,大理白族自治州', '2', '671000', '0872', 'Dali', '100.2400370', '25.5927650');
INSERT INTO `sys_cn_area` VALUES ('532901', '大理市', '大理', '532900', null, '中国,云南省,大理白族自治州,大理市', '3', '671000', '0872', 'Dali', '100.2299800', '25.5915700');
INSERT INTO `sys_cn_area` VALUES ('532922', '漾濞彝族自治县', '漾濞', '532900', null, '中国,云南省,大理白族自治州,漾濞彝族自治县', '3', '672500', '0872', 'Yangbi', '99.9547400', '25.6652000');
INSERT INTO `sys_cn_area` VALUES ('532923', '祥云县', '祥云', '532900', null, '中国,云南省,大理白族自治州,祥云县', '3', '672100', '0872', 'Xiangyun', '100.5576100', '25.4734200');
INSERT INTO `sys_cn_area` VALUES ('532924', '宾川县', '宾川', '532900', null, '中国,云南省,大理白族自治州,宾川县', '3', '671600', '0872', 'Binchuan', '100.5766600', '25.8314400');
INSERT INTO `sys_cn_area` VALUES ('532925', '弥渡县', '弥渡', '532900', null, '中国,云南省,大理白族自治州,弥渡县', '3', '675600', '0872', 'Midu', '100.4907500', '25.3417900');
INSERT INTO `sys_cn_area` VALUES ('532926', '南涧彝族自治县', '南涧', '532900', null, '中国,云南省,大理白族自治州,南涧彝族自治县', '3', '675700', '0872', 'Nanjian', '100.5096400', '25.0434900');
INSERT INTO `sys_cn_area` VALUES ('532927', '巍山彝族回族自治县', '巍山', '532900', null, '中国,云南省,大理白族自治州,巍山彝族回族自治县', '3', '672400', '0872', 'Weishan', '100.3061200', '25.2319700');
INSERT INTO `sys_cn_area` VALUES ('532928', '永平县', '永平', '532900', null, '中国,云南省,大理白族自治州,永平县', '3', '672600', '0872', 'Yongping', '99.5409500', '25.4645100');
INSERT INTO `sys_cn_area` VALUES ('532929', '云龙县', '云龙', '532900', null, '中国,云南省,大理白族自治州,云龙县', '3', '672700', '0872', 'Yunlong', '99.3725500', '25.8850500');
INSERT INTO `sys_cn_area` VALUES ('532930', '洱源县', '洱源', '532900', null, '中国,云南省,大理白族自治州,洱源县', '3', '671200', '0872', 'Eryuan', '99.9490300', '26.1082900');
INSERT INTO `sys_cn_area` VALUES ('532931', '剑川县', '剑川', '532900', null, '中国,云南省,大理白族自治州,剑川县', '3', '671300', '0872', 'Jianchuan', '99.9054500', '26.5368800');
INSERT INTO `sys_cn_area` VALUES ('532932', '鹤庆县', '鹤庆', '532900', null, '中国,云南省,大理白族自治州,鹤庆县', '3', '671500', '0872', 'Heqing', '100.1769700', '26.5579800');
INSERT INTO `sys_cn_area` VALUES ('533100', '德宏傣族景颇族自治州', '德宏', '530000', null, '中国,云南省,德宏傣族景颇族自治州', '2', '678400', '0692', 'Dehong', '98.5783630', '24.4366940');
INSERT INTO `sys_cn_area` VALUES ('533102', '瑞丽市', '瑞丽', '533100', null, '中国,云南省,德宏傣族景颇族自治州,瑞丽市', '3', '678600', '0692', 'Ruili', '97.8518300', '24.0127700');
INSERT INTO `sys_cn_area` VALUES ('533103', '芒市', '芒市', '533100', null, '中国,云南省,德宏傣族景颇族自治州,芒市', '3', '678400', '0692', 'Mangshi', '98.5886410', '24.4337350');
INSERT INTO `sys_cn_area` VALUES ('533122', '梁河县', '梁河', '533100', null, '中国,云南省,德宏傣族景颇族自治州,梁河县', '3', '679200', '0692', 'Lianghe', '98.2970500', '24.8065800');
INSERT INTO `sys_cn_area` VALUES ('533123', '盈江县', '盈江', '533100', null, '中国,云南省,德宏傣族景颇族自治州,盈江县', '3', '679300', '0692', 'Yingjiang', '97.9317900', '24.7057900');
INSERT INTO `sys_cn_area` VALUES ('533124', '陇川县', '陇川', '533100', null, '中国,云南省,德宏傣族景颇族自治州,陇川县', '3', '678700', '0692', 'Longchuan', '97.7919900', '24.1830200');
INSERT INTO `sys_cn_area` VALUES ('533300', '怒江傈僳族自治州', '怒江', '530000', null, '中国,云南省,怒江傈僳族自治州', '2', '673100', '0886', 'Nujiang', '98.8543040', '25.8509490');
INSERT INTO `sys_cn_area` VALUES ('533321', '泸水县', '泸水', '533300', null, '中国,云南省,怒江傈僳族自治州,泸水县', '3', '673100', '0886', 'Lushui', '98.8553400', '25.8377200');
INSERT INTO `sys_cn_area` VALUES ('533323', '福贡县', '福贡', '533300', null, '中国,云南省,怒江傈僳族自治州,福贡县', '3', '673400', '0886', 'Fugong', '98.8696900', '26.9036600');
INSERT INTO `sys_cn_area` VALUES ('533324', '贡山独龙族怒族自治县', '贡山', '533300', null, '中国,云南省,怒江傈僳族自治州,贡山独龙族怒族自治县', '3', '673500', '0886', 'Gongshan', '98.6658300', '27.7408800');
INSERT INTO `sys_cn_area` VALUES ('533325', '兰坪白族普米族自治县', '兰坪', '533300', null, '中国,云南省,怒江傈僳族自治州,兰坪白族普米族自治县', '3', '671400', '0886', 'Lanping', '99.4189100', '26.4525100');
INSERT INTO `sys_cn_area` VALUES ('533400', '迪庆藏族自治州', '迪庆', '530000', null, '中国,云南省,迪庆藏族自治州', '2', '674400', '0887', 'Deqen', '99.7064630', '27.8268530');
INSERT INTO `sys_cn_area` VALUES ('533421', '香格里拉市', '香格里拉', '533400', null, '中国,云南省,迪庆藏族自治州,香格里拉市', '3', '674400', '0887', 'Xianggelila', '99.7060100', '27.8230800');
INSERT INTO `sys_cn_area` VALUES ('533422', '德钦县', '德钦', '533400', null, '中国,云南省,迪庆藏族自治州,德钦县', '3', '674500', '0887', 'Deqin', '98.9108200', '28.4863000');
INSERT INTO `sys_cn_area` VALUES ('533423', '维西傈僳族自治县', '维西', '533400', null, '中国,云南省,迪庆藏族自治州,维西傈僳族自治县', '3', '674600', '0887', 'Weixi', '99.2840200', '27.1793000');
INSERT INTO `sys_cn_area` VALUES ('540000', '西藏自治区', '西藏', '100000', null, '中国,西藏自治区', '1', null, '', 'Tibet', '91.1322120', '29.6603610');
INSERT INTO `sys_cn_area` VALUES ('540100', '拉萨市', '拉萨', '540000', null, '中国,西藏自治区,拉萨市', '2', '850000', '0891', 'Lhasa', '91.1322120', '29.6603610');
INSERT INTO `sys_cn_area` VALUES ('540102', '城关区', '城关', '540100', null, '中国,西藏自治区,拉萨市,城关区', '3', '850000', '0891', 'Chengguan', '91.1385900', '29.6531200');
INSERT INTO `sys_cn_area` VALUES ('540121', '林周县', '林周', '540100', null, '中国,西藏自治区,拉萨市,林周县', '3', '851600', '0891', 'Linzhou', '91.2586000', '29.8944500');
INSERT INTO `sys_cn_area` VALUES ('540122', '当雄县', '当雄', '540100', null, '中国,西藏自治区,拉萨市,当雄县', '3', '851500', '0891', 'Dangxiong', '91.1007600', '30.4830900');
INSERT INTO `sys_cn_area` VALUES ('540123', '尼木县', '尼木', '540100', null, '中国,西藏自治区,拉萨市,尼木县', '3', '851300', '0891', 'Nimu', '90.1637800', '29.4335300');
INSERT INTO `sys_cn_area` VALUES ('540124', '曲水县', '曲水', '540100', null, '中国,西藏自治区,拉萨市,曲水县', '3', '850600', '0891', 'Qushui', '90.7318700', '29.3563600');
INSERT INTO `sys_cn_area` VALUES ('540125', '堆龙德庆县', '堆龙德庆', '540100', null, '中国,西藏自治区,拉萨市,堆龙德庆县', '3', '851400', '0891', 'Duilongdeqing', '91.0003300', '29.6500200');
INSERT INTO `sys_cn_area` VALUES ('540126', '达孜县', '达孜', '540100', null, '中国,西藏自治区,拉萨市,达孜县', '3', '850100', '0891', 'Dazi', '91.3575700', '29.6722000');
INSERT INTO `sys_cn_area` VALUES ('540127', '墨竹工卡县', '墨竹工卡', '540100', null, '中国,西藏自治区,拉萨市,墨竹工卡县', '3', '850200', '0891', 'Mozhugongka', '91.7281400', '29.8361400');
INSERT INTO `sys_cn_area` VALUES ('540200', '日喀则市', '日喀则', '540000', null, '中国,西藏自治区,日喀则市', '2', '857000', '0892', 'Rikaze', '88.8848740', '29.2637920');
INSERT INTO `sys_cn_area` VALUES ('540202', '桑珠孜区', '桑珠孜', '540200', null, '中国,西藏自治区,日喀则市,桑珠孜区', '3', '857000', '0892', 'Sangzhuzi', '88.8803670', '29.2695650');
INSERT INTO `sys_cn_area` VALUES ('540221', '南木林县', '南木林', '540200', null, '中国,西藏自治区,日喀则市,南木林县', '3', '857100', '0892', 'Nanmulin', '89.0968600', '29.6820600');
INSERT INTO `sys_cn_area` VALUES ('540222', '江孜县', '江孜', '540200', null, '中国,西藏自治区,日喀则市,江孜县', '3', '857400', '0892', 'Jiangzi', '89.6026300', '28.9174400');
INSERT INTO `sys_cn_area` VALUES ('540223', '定日县', '定日', '540200', null, '中国,西藏自治区,日喀则市,定日县', '3', '858200', '0892', 'Dingri', '87.1217600', '28.6612900');
INSERT INTO `sys_cn_area` VALUES ('540224', '萨迦县', '萨迦', '540200', null, '中国,西藏自治区,日喀则市,萨迦县', '3', '857800', '0892', 'Sajia', '88.0219100', '28.9029900');
INSERT INTO `sys_cn_area` VALUES ('540225', '拉孜县', '拉孜', '540200', null, '中国,西藏自治区,日喀则市,拉孜县', '3', '858100', '0892', 'Lazi', '87.6341200', '29.0850000');
INSERT INTO `sys_cn_area` VALUES ('540226', '昂仁县', '昂仁', '540200', null, '中国,西藏自治区,日喀则市,昂仁县', '3', '858500', '0892', 'Angren', '87.2385800', '29.2949600');
INSERT INTO `sys_cn_area` VALUES ('540227', '谢通门县', '谢通门', '540200', null, '中国,西藏自治区,日喀则市,谢通门县', '3', '858900', '0892', 'Xietongmen', '88.2624200', '29.4333700');
INSERT INTO `sys_cn_area` VALUES ('540228', '白朗县', '白朗', '540200', null, '中国,西藏自治区,日喀则市,白朗县', '3', '857300', '0892', 'Bailang', '89.2620500', '29.1055300');
INSERT INTO `sys_cn_area` VALUES ('540229', '仁布县', '仁布', '540200', null, '中国,西藏自治区,日喀则市,仁布县', '3', '857200', '0892', 'Renbu', '89.8422800', '29.2301000');
INSERT INTO `sys_cn_area` VALUES ('540230', '康马县', '康马', '540200', null, '中国,西藏自治区,日喀则市,康马县', '3', '857500', '0892', 'Kangma', '89.6852700', '28.5567000');
INSERT INTO `sys_cn_area` VALUES ('540231', '定结县', '定结', '540200', null, '中国,西藏自治区,日喀则市,定结县', '3', '857900', '0892', 'Dingjie', '87.7725500', '28.3640300');
INSERT INTO `sys_cn_area` VALUES ('540232', '仲巴县', '仲巴', '540200', null, '中国,西藏自治区,日喀则市,仲巴县', '3', '858800', '0892', 'Zhongba', '84.0295100', '29.7659500');
INSERT INTO `sys_cn_area` VALUES ('540233', '亚东县', '亚东', '540200', null, '中国,西藏自治区,日喀则市,亚东县', '3', '857600', '0892', 'Yadong', '88.9080200', '27.4839000');
INSERT INTO `sys_cn_area` VALUES ('540234', '吉隆县', '吉隆', '540200', null, '中国,西藏自治区,日喀则市,吉隆县', '3', '858700', '0892', 'Jilong', '85.2984600', '28.8538200');
INSERT INTO `sys_cn_area` VALUES ('540235', '聂拉木县', '聂拉木', '540200', null, '中国,西藏自治区,日喀则市,聂拉木县', '3', '858300', '0892', 'Nielamu', '85.9799800', '28.1564500');
INSERT INTO `sys_cn_area` VALUES ('540236', '萨嘎县', '萨嘎', '540200', null, '中国,西藏自治区,日喀则市,萨嘎县', '3', '857800', '0892', 'Saga', '85.2341300', '29.3293600');
INSERT INTO `sys_cn_area` VALUES ('540237', '岗巴县', '岗巴', '540200', null, '中国,西藏自治区,日喀则市,岗巴县', '3', '857700', '0892', 'Gangba', '88.5206900', '28.2750400');
INSERT INTO `sys_cn_area` VALUES ('540300', '昌都市', '昌都', '540000', null, '中国,西藏自治区,昌都市', '2', '854000', '0895', 'Qamdo', '97.1784520', '31.1368750');
INSERT INTO `sys_cn_area` VALUES ('540302', '卡若区', '昌都', '540300', null, '中国,西藏自治区,昌都市,卡若区', '3', '854000', '0895', 'Karuo', '97.1804300', '31.1385000');
INSERT INTO `sys_cn_area` VALUES ('540321', '江达县', '江达', '540300', null, '中国,西藏自治区,昌都市,江达县', '3', '854100', '0895', 'Jiangda', '98.2186500', '31.5034300');
INSERT INTO `sys_cn_area` VALUES ('540322', '贡觉县', '贡觉', '540300', null, '中国,西藏自治区,昌都市,贡觉县', '3', '854200', '0895', 'Gongjue', '98.2716300', '30.8594100');
INSERT INTO `sys_cn_area` VALUES ('540323', '类乌齐县', '类乌齐', '540300', null, '中国,西藏自治区,昌都市,类乌齐县', '3', '855600', '0895', 'Leiwuqi', '96.6001500', '31.2120700');
INSERT INTO `sys_cn_area` VALUES ('540324', '丁青县', '丁青', '540300', null, '中国,西藏自治区,昌都市,丁青县', '3', '855700', '0895', 'Dingqing', '95.5936200', '31.4162100');
INSERT INTO `sys_cn_area` VALUES ('540325', '察雅县', '察雅', '540300', null, '中国,西藏自治区,昌都市,察雅县', '3', '854300', '0895', 'Chaya', '97.5652100', '30.6533600');
INSERT INTO `sys_cn_area` VALUES ('540326', '八宿县', '八宿', '540300', null, '中国,西藏自治区,昌都市,八宿县', '3', '854600', '0895', 'Basu', '96.9176000', '30.0534600');
INSERT INTO `sys_cn_area` VALUES ('540327', '左贡县', '左贡', '540300', null, '中国,西藏自治区,昌都市,左贡县', '3', '854400', '0895', 'Zuogong', '97.8442900', '29.6710800');
INSERT INTO `sys_cn_area` VALUES ('540328', '芒康县', '芒康', '540300', null, '中国,西藏自治区,昌都市,芒康县', '3', '854500', '0895', 'Mangkang', '98.5937800', '29.6794600');
INSERT INTO `sys_cn_area` VALUES ('540329', '洛隆县', '洛隆', '540300', null, '中国,西藏自治区,昌都市,洛隆县', '3', '855400', '0895', 'Luolong', '95.8264400', '30.7404900');
INSERT INTO `sys_cn_area` VALUES ('540330', '边坝县', '边坝', '540300', null, '中国,西藏自治区,昌都市,边坝县', '3', '855500', '0895', 'Bianba', '94.7068700', '30.9343400');
INSERT INTO `sys_cn_area` VALUES ('542200', '山南地区', '山南', '540000', null, '中国,西藏自治区,山南地区', '2', '856000', '0893', 'Shannan', '91.7665290', '29.2360230');
INSERT INTO `sys_cn_area` VALUES ('542221', '乃东县', '乃东', '542200', null, '中国,西藏自治区,山南地区,乃东县', '3', '856100', '0893', 'Naidong', '91.7615300', '29.2249000');
INSERT INTO `sys_cn_area` VALUES ('542222', '扎囊县', '扎囊', '542200', null, '中国,西藏自治区,山南地区,扎囊县', '3', '850800', '0893', 'Zhanang', '91.3328800', '29.2399000');
INSERT INTO `sys_cn_area` VALUES ('542223', '贡嘎县', '贡嘎', '542200', null, '中国,西藏自治区,山南地区,贡嘎县', '3', '850700', '0893', 'Gongga', '90.9886700', '29.2940800');
INSERT INTO `sys_cn_area` VALUES ('542224', '桑日县', '桑日', '542200', null, '中国,西藏自治区,山南地区,桑日县', '3', '856200', '0893', 'Sangri', '92.0200500', '29.2664300');
INSERT INTO `sys_cn_area` VALUES ('542225', '琼结县', '琼结', '542200', null, '中国,西藏自治区,山南地区,琼结县', '3', '856800', '0893', 'Qiongjie', '91.6809300', '29.0263200');
INSERT INTO `sys_cn_area` VALUES ('542226', '曲松县', '曲松', '542200', null, '中国,西藏自治区,山南地区,曲松县', '3', '856300', '0893', 'Qusong', '92.2026300', '29.0641200');
INSERT INTO `sys_cn_area` VALUES ('542227', '措美县', '措美', '542200', null, '中国,西藏自治区,山南地区,措美县', '3', '856900', '0893', 'Cuomei', '91.4323700', '28.4379400');
INSERT INTO `sys_cn_area` VALUES ('542228', '洛扎县', '洛扎', '542200', null, '中国,西藏自治区,山南地区,洛扎县', '3', '856600', '0893', 'Luozha', '90.8603500', '28.3872000');
INSERT INTO `sys_cn_area` VALUES ('542229', '加查县', '加查', '542200', null, '中国,西藏自治区,山南地区,加查县', '3', '856400', '0893', 'Jiacha', '92.5770200', '29.1397300');
INSERT INTO `sys_cn_area` VALUES ('542231', '隆子县', '隆子', '542200', null, '中国,西藏自治区,山南地区,隆子县', '3', '856600', '0893', 'Longzi', '92.4614800', '28.4079700');
INSERT INTO `sys_cn_area` VALUES ('542232', '错那县', '错那', '542200', null, '中国,西藏自治区,山南地区,错那县', '3', '856700', '0893', 'Cuona', '91.9575200', '27.9922400');
INSERT INTO `sys_cn_area` VALUES ('542233', '浪卡子县', '浪卡子', '542200', null, '中国,西藏自治区,山南地区,浪卡子县', '3', '851100', '0893', 'Langkazi', '90.4000200', '28.9694800');
INSERT INTO `sys_cn_area` VALUES ('542400', '那曲地区', '那曲', '540000', null, '中国,西藏自治区,那曲地区', '2', '852000', '0896', 'Nagqu', '92.0602140', '31.4760040');
INSERT INTO `sys_cn_area` VALUES ('542421', '那曲县', '那曲', '542400', null, '中国,西藏自治区,那曲地区,那曲县', '3', '852000', '0896', 'Naqu', '92.0535000', '31.4696400');
INSERT INTO `sys_cn_area` VALUES ('542422', '嘉黎县', '嘉黎', '542400', null, '中国,西藏自治区,那曲地区,嘉黎县', '3', '852400', '0896', 'Jiali', '93.2498700', '30.6423300');
INSERT INTO `sys_cn_area` VALUES ('542423', '比如县', '比如', '542400', null, '中国,西藏自治区,那曲地区,比如县', '3', '852300', '0896', 'Biru', '93.6868500', '31.4779000');
INSERT INTO `sys_cn_area` VALUES ('542424', '聂荣县', '聂荣', '542400', null, '中国,西藏自治区,那曲地区,聂荣县', '3', '853500', '0896', 'Nierong', '92.2957400', '32.1119300');
INSERT INTO `sys_cn_area` VALUES ('542425', '安多县', '安多', '542400', null, '中国,西藏自治区,那曲地区,安多县', '3', '853400', '0896', 'Anduo', '91.6795000', '32.2612500');
INSERT INTO `sys_cn_area` VALUES ('542426', '申扎县', '申扎', '542400', null, '中国,西藏自治区,那曲地区,申扎县', '3', '853100', '0896', 'Shenzha', '88.7077600', '30.9299500');
INSERT INTO `sys_cn_area` VALUES ('542427', '索县', '索县', '542400', null, '中国,西藏自治区,那曲地区,索县', '3', '852200', '0896', 'Suoxian', '93.7829500', '31.8842700');
INSERT INTO `sys_cn_area` VALUES ('542428', '班戈县', '班戈', '542400', null, '中国,西藏自治区,那曲地区,班戈县', '3', '852500', '0896', 'Bange', '90.0190700', '31.3614900');
INSERT INTO `sys_cn_area` VALUES ('542429', '巴青县', '巴青', '542400', null, '中国,西藏自治区,那曲地区,巴青县', '3', '852100', '0896', 'Baqing', '94.0531600', '31.9183300');
INSERT INTO `sys_cn_area` VALUES ('542430', '尼玛县', '尼玛', '542400', null, '中国,西藏自治区,那曲地区,尼玛县', '3', '852600', '0896', 'Nima', '87.2525600', '31.7965400');
INSERT INTO `sys_cn_area` VALUES ('542431', '双湖县', '双湖', '542400', null, '中国,西藏自治区,那曲地区,双湖县', '3', '852600', '0896', 'Shuanghu', '88.8377760', '33.1890320');
INSERT INTO `sys_cn_area` VALUES ('542500', '阿里地区', '阿里', '540000', null, '中国,西藏自治区,阿里地区', '2', '859000', '0897', 'Ngari', '80.1054980', '32.5031870');
INSERT INTO `sys_cn_area` VALUES ('542521', '普兰县', '普兰', '542500', null, '中国,西藏自治区,阿里地区,普兰县', '3', '859500', '0897', 'Pulan', '81.1770000', '30.3000200');
INSERT INTO `sys_cn_area` VALUES ('542522', '札达县', '札达', '542500', null, '中国,西藏自治区,阿里地区,札达县', '3', '859600', '0897', 'Zhada', '79.8025500', '31.4834500');
INSERT INTO `sys_cn_area` VALUES ('542523', '噶尔县', '噶尔', '542500', null, '中国,西藏自治区,阿里地区,噶尔县', '3', '859400', '0897', 'Gaer', '80.0957900', '32.5002400');
INSERT INTO `sys_cn_area` VALUES ('542524', '日土县', '日土', '542500', null, '中国,西藏自治区,阿里地区,日土县', '3', '859700', '0897', 'Ritu', '79.7131000', '33.3874100');
INSERT INTO `sys_cn_area` VALUES ('542525', '革吉县', '革吉', '542500', null, '中国,西藏自治区,阿里地区,革吉县', '3', '859100', '0897', 'Geji', '81.1510000', '32.3964000');
INSERT INTO `sys_cn_area` VALUES ('542526', '改则县', '改则', '542500', null, '中国,西藏自治区,阿里地区,改则县', '3', '859200', '0897', 'Gaize', '84.0629500', '32.3044600');
INSERT INTO `sys_cn_area` VALUES ('542527', '措勤县', '措勤', '542500', null, '中国,西藏自治区,阿里地区,措勤县', '3', '859300', '0897', 'Cuoqin', '85.1661600', '31.0209500');
INSERT INTO `sys_cn_area` VALUES ('542600', '林芝地区', '林芝', '540000', null, '中国,西藏自治区,林芝地区', '2', '850400', '0894', 'Nyingchi', '94.3623480', '29.6546930');
INSERT INTO `sys_cn_area` VALUES ('542621', '林芝县', '林芝', '542600', null, '中国,西藏自治区,林芝地区,林芝县', '3', '850400', '0894', 'Linzhi', '94.4839100', '29.5756200');
INSERT INTO `sys_cn_area` VALUES ('542622', '工布江达县', '工布江达', '542600', null, '中国,西藏自治区,林芝地区,工布江达县', '3', '850300', '0894', 'Gongbujiangda', '93.2452000', '29.8857600');
INSERT INTO `sys_cn_area` VALUES ('542623', '米林县', '米林', '542600', null, '中国,西藏自治区,林芝地区,米林县', '3', '850500', '0894', 'Milin', '94.2131600', '29.2153500');
INSERT INTO `sys_cn_area` VALUES ('542624', '墨脱县', '墨脱', '542600', null, '中国,西藏自治区,林芝地区,墨脱县', '3', '855300', '0894', 'Motuo', '95.3316000', '29.3269800');
INSERT INTO `sys_cn_area` VALUES ('542625', '波密县', '波密', '542600', null, '中国,西藏自治区,林芝地区,波密县', '3', '855200', '0894', 'Bomi', '95.7709600', '29.8590700');
INSERT INTO `sys_cn_area` VALUES ('542626', '察隅县', '察隅', '542600', null, '中国,西藏自治区,林芝地区,察隅县', '3', '855100', '0894', 'Chayu', '97.4667900', '28.6618000');
INSERT INTO `sys_cn_area` VALUES ('542627', '朗县', '朗县', '542600', null, '中国,西藏自治区,林芝地区,朗县', '3', '856500', '0894', 'Langxian', '93.0754000', '29.0454900');
INSERT INTO `sys_cn_area` VALUES ('610000', '陕西省', '陕西', '100000', null, '中国,陕西省', '1', null, '', 'Shaanxi', '108.9480240', '34.2631610');
INSERT INTO `sys_cn_area` VALUES ('610100', '西安市', '西安', '610000', null, '中国,陕西省,西安市', '2', '710003', '029', 'Xi\'an', '108.9480240', '34.2631610');
INSERT INTO `sys_cn_area` VALUES ('610102', '新城区', '新城', '610100', null, '中国,陕西省,西安市,新城区', '3', '710004', '029', 'Xincheng', '108.9608000', '34.2664100');
INSERT INTO `sys_cn_area` VALUES ('610103', '碑林区', '碑林', '610100', null, '中国,陕西省,西安市,碑林区', '3', '710001', '029', 'Beilin', '108.9342600', '34.2304000');
INSERT INTO `sys_cn_area` VALUES ('610104', '莲湖区', '莲湖', '610100', null, '中国,陕西省,西安市,莲湖区', '3', '710003', '029', 'Lianhu', '108.9401000', '34.2670900');
INSERT INTO `sys_cn_area` VALUES ('610111', '灞桥区', '灞桥', '610100', null, '中国,陕西省,西安市,灞桥区', '3', '710038', '029', 'Baqiao', '109.0645100', '34.2726400');
INSERT INTO `sys_cn_area` VALUES ('610112', '未央区', '未央', '610100', null, '中国,陕西省,西安市,未央区', '3', '710014', '029', 'Weiyang', '108.9468300', '34.2929600');
INSERT INTO `sys_cn_area` VALUES ('610113', '雁塔区', '雁塔', '610100', null, '中国,陕西省,西安市,雁塔区', '3', '710061', '029', 'Yanta', '108.9486600', '34.2224500');
INSERT INTO `sys_cn_area` VALUES ('610114', '阎良区', '阎良', '610100', null, '中国,陕西省,西安市,阎良区', '3', '710087', '029', 'Yanliang', '109.2261600', '34.6622100');
INSERT INTO `sys_cn_area` VALUES ('610115', '临潼区', '临潼', '610100', null, '中国,陕西省,西安市,临潼区', '3', '710600', '029', 'Lintong', '109.2141700', '34.3666500');
INSERT INTO `sys_cn_area` VALUES ('610116', '长安区', '长安', '610100', null, '中国,陕西省,西安市,长安区', '3', '710100', '029', 'Chang\'an', '108.9458600', '34.1555900');
INSERT INTO `sys_cn_area` VALUES ('610122', '蓝田县', '蓝田', '610100', null, '中国,陕西省,西安市,蓝田县', '3', '710500', '029', 'Lantian', '109.3233900', '34.1512800');
INSERT INTO `sys_cn_area` VALUES ('610124', '周至县', '周至', '610100', null, '中国,陕西省,西安市,周至县', '3', '710400', '029', 'Zhouzhi', '108.2220700', '34.1633700');
INSERT INTO `sys_cn_area` VALUES ('610125', '户县', '户县', '610100', null, '中国,陕西省,西安市,户县', '3', '710300', '029', 'Huxian', '108.6051300', '34.1085600');
INSERT INTO `sys_cn_area` VALUES ('610126', '高陵区', '高陵', '610100', null, '中国,陕西省,西安市,高陵区', '3', '710200', '029', 'Gaoling', '109.0881600', '34.5348300');
INSERT INTO `sys_cn_area` VALUES ('610200', '铜川市', '铜川', '610000', null, '中国,陕西省,铜川市', '2', '727100', '0919', 'Tongchuan', '108.9631220', '34.9089200');
INSERT INTO `sys_cn_area` VALUES ('610202', '王益区', '王益', '610200', null, '中国,陕西省,铜川市,王益区', '3', '727000', '0919', 'Wangyi', '109.0756400', '35.0689600');
INSERT INTO `sys_cn_area` VALUES ('610203', '印台区', '印台', '610200', null, '中国,陕西省,铜川市,印台区', '3', '727007', '0919', 'Yintai', '109.1020800', '35.1169000');
INSERT INTO `sys_cn_area` VALUES ('610204', '耀州区', '耀州', '610200', null, '中国,陕西省,铜川市,耀州区', '3', '727100', '0919', 'Yaozhou', '108.9855600', '34.9130800');
INSERT INTO `sys_cn_area` VALUES ('610222', '宜君县', '宜君', '610200', null, '中国,陕西省,铜川市,宜君县', '3', '727200', '0919', 'Yijun', '109.1181300', '35.4010800');
INSERT INTO `sys_cn_area` VALUES ('610300', '宝鸡市', '宝鸡', '610000', null, '中国,陕西省,宝鸡市', '2', '721000', '0917', 'Baoji', '107.1448700', '34.3693150');
INSERT INTO `sys_cn_area` VALUES ('610302', '渭滨区', '渭滨', '610300', null, '中国,陕西省,宝鸡市,渭滨区', '3', '721000', '0917', 'Weibin', '107.1499100', '34.3711600');
INSERT INTO `sys_cn_area` VALUES ('610303', '金台区', '金台', '610300', null, '中国,陕西省,宝鸡市,金台区', '3', '721000', '0917', 'Jintai', '107.1469100', '34.3761200');
INSERT INTO `sys_cn_area` VALUES ('610304', '陈仓区', '陈仓', '610300', null, '中国,陕西省,宝鸡市,陈仓区', '3', '721300', '0917', 'Chencang', '107.3874200', '34.3545100');
INSERT INTO `sys_cn_area` VALUES ('610322', '凤翔县', '凤翔', '610300', null, '中国,陕西省,宝鸡市,凤翔县', '3', '721400', '0917', 'Fengxiang', '107.3964500', '34.5232100');
INSERT INTO `sys_cn_area` VALUES ('610323', '岐山县', '岐山', '610300', null, '中国,陕西省,宝鸡市,岐山县', '3', '722400', '0917', 'Qishan', '107.6217300', '34.4437800');
INSERT INTO `sys_cn_area` VALUES ('610324', '扶风县', '扶风', '610300', null, '中国,陕西省,宝鸡市,扶风县', '3', '722200', '0917', 'Fufeng', '107.9001700', '34.3752400');
INSERT INTO `sys_cn_area` VALUES ('610326', '眉县', '眉县', '610300', null, '中国,陕西省,宝鸡市,眉县', '3', '722300', '0917', 'Meixian', '107.7507900', '34.2756900');
INSERT INTO `sys_cn_area` VALUES ('610327', '陇县', '陇县', '610300', null, '中国,陕西省,宝鸡市,陇县', '3', '721200', '0917', 'Longxian', '106.8594600', '34.8940400');
INSERT INTO `sys_cn_area` VALUES ('610328', '千阳县', '千阳', '610300', null, '中国,陕西省,宝鸡市,千阳县', '3', '721100', '0917', 'Qianyang', '107.1304300', '34.6421900');
INSERT INTO `sys_cn_area` VALUES ('610329', '麟游县', '麟游', '610300', null, '中国,陕西省,宝鸡市,麟游县', '3', '721500', '0917', 'Linyou', '107.7962300', '34.6784400');
INSERT INTO `sys_cn_area` VALUES ('610330', '凤县', '凤县', '610300', null, '中国,陕西省,宝鸡市,凤县', '3', '721700', '0917', 'Fengxian', '106.5235600', '33.9117200');
INSERT INTO `sys_cn_area` VALUES ('610331', '太白县', '太白', '610300', null, '中国,陕西省,宝鸡市,太白县', '3', '721600', '0917', 'Taibai', '107.3164600', '34.0620700');
INSERT INTO `sys_cn_area` VALUES ('610400', '咸阳市', '咸阳', '610000', null, '中国,陕西省,咸阳市', '2', '712000', '029', 'Xianyang', '108.7051170', '34.3334390');
INSERT INTO `sys_cn_area` VALUES ('610402', '秦都区', '秦都', '610400', null, '中国,陕西省,咸阳市,秦都区', '3', '712000', '029', 'Qindu', '108.7149300', '34.3380400');
INSERT INTO `sys_cn_area` VALUES ('610403', '杨陵区', '杨陵', '610400', null, '中国,陕西省,咸阳市,杨陵区', '3', '712100', '029', 'Yangling', '108.0834810', '34.2704340');
INSERT INTO `sys_cn_area` VALUES ('610404', '渭城区', '渭城', '610400', null, '中国,陕西省,咸阳市,渭城区', '3', '712000', '029', 'Weicheng', '108.7222700', '34.3319800');
INSERT INTO `sys_cn_area` VALUES ('610422', '三原县', '三原', '610400', null, '中国,陕西省,咸阳市,三原县', '3', '713800', '029', 'Sanyuan', '108.9319400', '34.6155600');
INSERT INTO `sys_cn_area` VALUES ('610423', '泾阳县', '泾阳', '610400', null, '中国,陕西省,咸阳市,泾阳县', '3', '713700', '029', 'Jingyang', '108.8425900', '34.5270500');
INSERT INTO `sys_cn_area` VALUES ('610424', '乾县', '乾县', '610400', null, '中国,陕西省,咸阳市,乾县', '3', '713300', '029', 'Qianxian', '108.2423100', '34.5294600');
INSERT INTO `sys_cn_area` VALUES ('610425', '礼泉县', '礼泉', '610400', null, '中国,陕西省,咸阳市,礼泉县', '3', '713200', '029', 'Liquan', '108.4263000', '34.4845500');
INSERT INTO `sys_cn_area` VALUES ('610426', '永寿县', '永寿', '610400', null, '中国,陕西省,咸阳市,永寿县', '3', '713400', '029', 'Yongshou', '108.1447400', '34.6908100');
INSERT INTO `sys_cn_area` VALUES ('610427', '彬县', '彬县', '610400', null, '中国,陕西省,咸阳市,彬县', '3', '713500', '029', 'Binxian', '108.0846800', '35.0342000');
INSERT INTO `sys_cn_area` VALUES ('610428', '长武县', '长武', '610400', null, '中国,陕西省,咸阳市,长武县', '3', '713600', '029', 'Changwu', '107.7951000', '35.2067000');
INSERT INTO `sys_cn_area` VALUES ('610429', '旬邑县', '旬邑', '610400', null, '中国,陕西省,咸阳市,旬邑县', '3', '711300', '029', 'Xunyi', '108.3341000', '35.1133800');
INSERT INTO `sys_cn_area` VALUES ('610430', '淳化县', '淳化', '610400', null, '中国,陕西省,咸阳市,淳化县', '3', '711200', '029', 'Chunhua', '108.5802600', '34.7988600');
INSERT INTO `sys_cn_area` VALUES ('610431', '武功县', '武功', '610400', null, '中国,陕西省,咸阳市,武功县', '3', '712200', '029', 'Wugong', '108.2043400', '34.2600300');
INSERT INTO `sys_cn_area` VALUES ('610481', '兴平市', '兴平', '610400', null, '中国,陕西省,咸阳市,兴平市', '3', '713100', '029', 'Xingping', '108.4905700', '34.2978500');
INSERT INTO `sys_cn_area` VALUES ('610500', '渭南市', '渭南', '610000', null, '中国,陕西省,渭南市', '2', '714000', '0913', 'Weinan', '109.5028820', '34.4993810');
INSERT INTO `sys_cn_area` VALUES ('610502', '临渭区', '临渭', '610500', null, '中国,陕西省,渭南市,临渭区', '3', '714000', '0913', 'Linwei', '109.4929600', '34.4982200');
INSERT INTO `sys_cn_area` VALUES ('610521', '华县', '华县', '610500', null, '中国,陕西省,渭南市,华县', '3', '714100', '0913', 'Huaxian', '109.7718500', '34.5125500');
INSERT INTO `sys_cn_area` VALUES ('610522', '潼关县', '潼关', '610500', null, '中国,陕西省,渭南市,潼关县', '3', '714300', '0913', 'Tongguan', '110.2436200', '34.5428400');
INSERT INTO `sys_cn_area` VALUES ('610523', '大荔县', '大荔', '610500', null, '中国,陕西省,渭南市,大荔县', '3', '715100', '0913', 'Dali', '109.9421600', '34.7956500');
INSERT INTO `sys_cn_area` VALUES ('610524', '合阳县', '合阳', '610500', null, '中国,陕西省,渭南市,合阳县', '3', '715300', '0913', 'Heyang', '110.1486200', '35.2380500');
INSERT INTO `sys_cn_area` VALUES ('610525', '澄城县', '澄城', '610500', null, '中国,陕西省,渭南市,澄城县', '3', '715200', '0913', 'Chengcheng', '109.9344400', '35.1839600');
INSERT INTO `sys_cn_area` VALUES ('610526', '蒲城县', '蒲城', '610500', null, '中国,陕西省,渭南市,蒲城县', '3', '715500', '0913', 'Pucheng', '109.5903000', '34.9568000');
INSERT INTO `sys_cn_area` VALUES ('610527', '白水县', '白水', '610500', null, '中国,陕西省,渭南市,白水县', '3', '715600', '0913', 'Baishui', '109.5928600', '35.1786300');
INSERT INTO `sys_cn_area` VALUES ('610528', '富平县', '富平', '610500', null, '中国,陕西省,渭南市,富平县', '3', '711700', '0913', 'Fuping', '109.1802000', '34.7510900');
INSERT INTO `sys_cn_area` VALUES ('610581', '韩城市', '韩城', '610500', null, '中国,陕西省,渭南市,韩城市', '3', '715400', '0913', 'Hancheng', '110.4423800', '35.4792600');
INSERT INTO `sys_cn_area` VALUES ('610582', '华阴市', '华阴', '610500', null, '中国,陕西省,渭南市,华阴市', '3', '714200', '0913', 'Huayin', '110.0875200', '34.5660800');
INSERT INTO `sys_cn_area` VALUES ('610600', '延安市', '延安', '610000', null, '中国,陕西省,延安市', '2', '716000', '0911', 'Yan\'an', '109.4908100', '36.5965370');
INSERT INTO `sys_cn_area` VALUES ('610602', '宝塔区', '宝塔', '610600', null, '中国,陕西省,延安市,宝塔区', '3', '716000', '0911', 'Baota', '109.4933600', '36.5915400');
INSERT INTO `sys_cn_area` VALUES ('610621', '延长县', '延长', '610600', null, '中国,陕西省,延安市,延长县', '3', '717100', '0911', 'Yanchang', '110.0108300', '36.5790400');
INSERT INTO `sys_cn_area` VALUES ('610622', '延川县', '延川', '610600', null, '中国,陕西省,延安市,延川县', '3', '717200', '0911', 'Yanchuan', '110.1941500', '36.8781700');
INSERT INTO `sys_cn_area` VALUES ('610623', '子长县', '子长', '610600', null, '中国,陕西省,延安市,子长县', '3', '717300', '0911', 'Zichang', '109.6753200', '37.1425300');
INSERT INTO `sys_cn_area` VALUES ('610624', '安塞县', '安塞', '610600', null, '中国,陕西省,延安市,安塞县', '3', '717400', '0911', 'Ansai', '109.3270800', '36.8650700');
INSERT INTO `sys_cn_area` VALUES ('610625', '志丹县', '志丹', '610600', null, '中国,陕西省,延安市,志丹县', '3', '717500', '0911', 'Zhidan', '108.7681500', '36.8217700');
INSERT INTO `sys_cn_area` VALUES ('610626', '吴起县', '吴起', '610600', null, '中国,陕西省,延安市,吴起县', '3', '717600', '0911', 'Wuqi', '108.1761100', '36.9278500');
INSERT INTO `sys_cn_area` VALUES ('610627', '甘泉县', '甘泉', '610600', null, '中国,陕西省,延安市,甘泉县', '3', '716100', '0911', 'Ganquan', '109.3501200', '36.2775400');
INSERT INTO `sys_cn_area` VALUES ('610628', '富县', '富县', '610600', null, '中国,陕西省,延安市,富县', '3', '727500', '0911', 'Fuxian', '109.3792700', '35.9880300');
INSERT INTO `sys_cn_area` VALUES ('610629', '洛川县', '洛川', '610600', null, '中国,陕西省,延安市,洛川县', '3', '727400', '0911', 'Luochuan', '109.4328600', '35.7607600');
INSERT INTO `sys_cn_area` VALUES ('610630', '宜川县', '宜川', '610600', null, '中国,陕西省,延安市,宜川县', '3', '716200', '0911', 'Yichuan', '110.1719600', '36.0473200');
INSERT INTO `sys_cn_area` VALUES ('610631', '黄龙县', '黄龙', '610600', null, '中国,陕西省,延安市,黄龙县', '3', '715700', '0911', 'Huanglong', '109.8425900', '35.5834900');
INSERT INTO `sys_cn_area` VALUES ('610632', '黄陵县', '黄陵', '610600', null, '中国,陕西省,延安市,黄陵县', '3', '727300', '0911', 'Huangling', '109.2633300', '35.5835700');
INSERT INTO `sys_cn_area` VALUES ('610700', '汉中市', '汉中', '610000', null, '中国,陕西省,汉中市', '2', '723000', '0916', 'Hanzhong', '107.0286210', '33.0776680');
INSERT INTO `sys_cn_area` VALUES ('610702', '汉台区', '汉台', '610700', null, '中国,陕西省,汉中市,汉台区', '3', '723000', '0916', 'Hantai', '107.0318700', '33.0677400');
INSERT INTO `sys_cn_area` VALUES ('610721', '南郑县', '南郑', '610700', null, '中国,陕西省,汉中市,南郑县', '3', '723100', '0916', 'Nanzheng', '106.9402400', '33.0029900');
INSERT INTO `sys_cn_area` VALUES ('610722', '城固县', '城固', '610700', null, '中国,陕西省,汉中市,城固县', '3', '723200', '0916', 'Chenggu', '107.3336700', '33.1566100');
INSERT INTO `sys_cn_area` VALUES ('610723', '洋县', '洋县', '610700', null, '中国,陕西省,汉中市,洋县', '3', '723300', '0916', 'Yangxian', '107.5467200', '33.2210200');
INSERT INTO `sys_cn_area` VALUES ('610724', '西乡县', '西乡', '610700', null, '中国,陕西省,汉中市,西乡县', '3', '723500', '0916', 'Xixiang', '107.7686700', '32.9841100');
INSERT INTO `sys_cn_area` VALUES ('610725', '勉县', '勉县', '610700', null, '中国,陕西省,汉中市,勉县', '3', '724200', '0916', 'Mianxian', '106.6758400', '33.1527300');
INSERT INTO `sys_cn_area` VALUES ('610726', '宁强县', '宁强', '610700', null, '中国,陕西省,汉中市,宁强县', '3', '724400', '0916', 'Ningqiang', '106.2595800', '32.8288100');
INSERT INTO `sys_cn_area` VALUES ('610727', '略阳县', '略阳', '610700', null, '中国,陕西省,汉中市,略阳县', '3', '724300', '0916', 'Lueyang', '106.1539900', '33.3300900');
INSERT INTO `sys_cn_area` VALUES ('610728', '镇巴县', '镇巴', '610700', null, '中国,陕西省,汉中市,镇巴县', '3', '723600', '0916', 'Zhenba', '107.8964800', '32.5348700');
INSERT INTO `sys_cn_area` VALUES ('610729', '留坝县', '留坝', '610700', null, '中国,陕西省,汉中市,留坝县', '3', '724100', '0916', 'Liuba', '106.9223300', '33.6160600');
INSERT INTO `sys_cn_area` VALUES ('610730', '佛坪县', '佛坪', '610700', null, '中国,陕西省,汉中市,佛坪县', '3', '723400', '0916', 'Foping', '107.9897400', '33.5249600');
INSERT INTO `sys_cn_area` VALUES ('610800', '榆林市', '榆林', '610000', null, '中国,陕西省,榆林市', '2', '719000', '0912', 'Yulin', '109.7411930', '38.2901620');
INSERT INTO `sys_cn_area` VALUES ('610802', '榆阳区', '榆阳', '610800', null, '中国,陕西省,榆林市,榆阳区', '3', '719000', '0912', 'Yuyang', '109.7347300', '38.2784300');
INSERT INTO `sys_cn_area` VALUES ('610821', '神木县', '神木', '610800', null, '中国,陕西省,榆林市,神木县', '3', '719300', '0912', 'Shenmu', '110.4989000', '38.8423400');
INSERT INTO `sys_cn_area` VALUES ('610822', '府谷县', '府谷', '610800', null, '中国,陕西省,榆林市,府谷县', '3', '719400', '0912', 'Fugu', '111.0672300', '39.0280500');
INSERT INTO `sys_cn_area` VALUES ('610823', '横山县', '横山', '610800', null, '中国,陕西省,榆林市,横山县', '3', '719100', '0912', 'Hengshan', '109.2956800', '37.9580000');
INSERT INTO `sys_cn_area` VALUES ('610824', '靖边县', '靖边', '610800', null, '中国,陕西省,榆林市,靖边县', '3', '718500', '0912', 'Jingbian', '108.7941200', '37.5993800');
INSERT INTO `sys_cn_area` VALUES ('610825', '定边县', '定边', '610800', null, '中国,陕西省,榆林市,定边县', '3', '718600', '0912', 'Dingbian', '107.5979300', '37.5903700');
INSERT INTO `sys_cn_area` VALUES ('610826', '绥德县', '绥德', '610800', null, '中国,陕西省,榆林市,绥德县', '3', '718000', '0912', 'Suide', '110.2612600', '37.4977800');
INSERT INTO `sys_cn_area` VALUES ('610827', '米脂县', '米脂', '610800', null, '中国,陕西省,榆林市,米脂县', '3', '718100', '0912', 'Mizhi', '110.1841700', '37.7552900');
INSERT INTO `sys_cn_area` VALUES ('610828', '佳县', '佳县', '610800', null, '中国,陕西省,榆林市,佳县', '3', '719200', '0912', 'Jiaxian', '110.4936200', '38.0224800');
INSERT INTO `sys_cn_area` VALUES ('610829', '吴堡县', '吴堡', '610800', null, '中国,陕西省,榆林市,吴堡县', '3', '718200', '0912', 'Wubu', '110.7453300', '37.4570900');
INSERT INTO `sys_cn_area` VALUES ('610830', '清涧县', '清涧', '610800', null, '中国,陕西省,榆林市,清涧县', '3', '718300', '0912', 'Qingjian', '110.1217300', '37.0885400');
INSERT INTO `sys_cn_area` VALUES ('610831', '子洲县', '子洲', '610800', null, '中国,陕西省,榆林市,子洲县', '3', '718400', '0912', 'Zizhou', '110.0348800', '37.6123800');
INSERT INTO `sys_cn_area` VALUES ('610900', '安康市', '安康', '610000', null, '中国,陕西省,安康市', '2', '725000', '0915', 'Ankang', '109.0292730', '32.6903000');
INSERT INTO `sys_cn_area` VALUES ('610902', '汉滨区', '汉滨', '610900', null, '中国,陕西省,安康市,汉滨区', '3', '725000', '0915', 'Hanbin', '109.0268300', '32.6951700');
INSERT INTO `sys_cn_area` VALUES ('610921', '汉阴县', '汉阴', '610900', null, '中国,陕西省,安康市,汉阴县', '3', '725100', '0915', 'Hanyin', '108.5109800', '32.8912900');
INSERT INTO `sys_cn_area` VALUES ('610922', '石泉县', '石泉', '610900', null, '中国,陕西省,安康市,石泉县', '3', '725200', '0915', 'Shiquan', '108.2475500', '33.0397100');
INSERT INTO `sys_cn_area` VALUES ('610923', '宁陕县', '宁陕', '610900', null, '中国,陕西省,安康市,宁陕县', '3', '711600', '0915', 'Ningshan', '108.3151500', '33.3172600');
INSERT INTO `sys_cn_area` VALUES ('610924', '紫阳县', '紫阳', '610900', null, '中国,陕西省,安康市,紫阳县', '3', '725300', '0915', 'Ziyang', '108.5368000', '32.5211500');
INSERT INTO `sys_cn_area` VALUES ('610925', '岚皋县', '岚皋', '610900', null, '中国,陕西省,安康市,岚皋县', '3', '725400', '0915', 'Langao', '108.9028900', '32.3079400');
INSERT INTO `sys_cn_area` VALUES ('610926', '平利县', '平利', '610900', null, '中国,陕西省,安康市,平利县', '3', '725500', '0915', 'Pingli', '109.3577500', '32.3911100');
INSERT INTO `sys_cn_area` VALUES ('610927', '镇坪县', '镇坪', '610900', null, '中国,陕西省,安康市,镇坪县', '3', '725600', '0915', 'Zhenping', '109.5245600', '31.8833000');
INSERT INTO `sys_cn_area` VALUES ('610928', '旬阳县', '旬阳', '610900', null, '中国,陕西省,安康市,旬阳县', '3', '725700', '0915', 'Xunyang', '109.3619000', '32.8320700');
INSERT INTO `sys_cn_area` VALUES ('610929', '白河县', '白河', '610900', null, '中国,陕西省,安康市,白河县', '3', '725800', '0915', 'Baihe', '110.1131500', '32.8095500');
INSERT INTO `sys_cn_area` VALUES ('611000', '商洛市', '商洛', '610000', null, '中国,陕西省,商洛市', '2', '726000', '0914', 'Shangluo', '109.9397760', '33.8683190');
INSERT INTO `sys_cn_area` VALUES ('611002', '商州区', '商州', '611000', null, '中国,陕西省,商洛市,商州区', '3', '726000', '0914', 'Shangzhou', '109.9412600', '33.8627000');
INSERT INTO `sys_cn_area` VALUES ('611021', '洛南县', '洛南', '611000', null, '中国,陕西省,商洛市,洛南县', '3', '726100', '0914', 'Luonan', '110.1464500', '34.0899400');
INSERT INTO `sys_cn_area` VALUES ('611022', '丹凤县', '丹凤', '611000', null, '中国,陕西省,商洛市,丹凤县', '3', '726200', '0914', 'Danfeng', '110.3348600', '33.6946800');
INSERT INTO `sys_cn_area` VALUES ('611023', '商南县', '商南', '611000', null, '中国,陕西省,商洛市,商南县', '3', '726300', '0914', 'Shangnan', '110.8837500', '33.5258100');
INSERT INTO `sys_cn_area` VALUES ('611024', '山阳县', '山阳', '611000', null, '中国,陕西省,商洛市,山阳县', '3', '726400', '0914', 'Shanyang', '109.8878400', '33.5293100');
INSERT INTO `sys_cn_area` VALUES ('611025', '镇安县', '镇安', '611000', null, '中国,陕西省,商洛市,镇安县', '3', '711500', '0914', 'Zhen\'an', '109.1537400', '33.4236600');
INSERT INTO `sys_cn_area` VALUES ('611026', '柞水县', '柞水', '611000', null, '中国,陕西省,商洛市,柞水县', '3', '711400', '0914', 'Zhashui', '109.1110500', '33.6831000');
INSERT INTO `sys_cn_area` VALUES ('611100', '西咸新区', '西咸', '610000', null, '中国,陕西省,西咸新区', '2', '712000', '029', 'Xixian', '108.8106540', '34.3071440');
INSERT INTO `sys_cn_area` VALUES ('611101', '空港新城', '空港', '611100', null, '中国,陕西省,西咸新区,空港新城', '3', '461000', '0374', 'Konggang', '108.7605290', '34.4408940');
INSERT INTO `sys_cn_area` VALUES ('611102', '沣东新城', '沣东', '611100', null, '中国,陕西省,西咸新区,沣东新城', '3', '710000', '029', 'Fengdong', '108.8298800', '34.2674310');
INSERT INTO `sys_cn_area` VALUES ('611103', '秦汉新城', '秦汉', '611100', null, '中国,陕西省,西咸新区,秦汉新城', '3', '712000', '029', 'Qinhan', '108.8381200', '34.3865130');
INSERT INTO `sys_cn_area` VALUES ('611104', '沣西新城', '沣西', '611100', null, '中国,陕西省,西咸新区,沣西新城', '3', '710000', '029', 'Fengxi', '108.7121500', '34.1904530');
INSERT INTO `sys_cn_area` VALUES ('611105', '泾河新城', '泾河', '611100', null, '中国,陕西省,西咸新区,泾河新城', '3', '713700', '029', 'Jinghe', '109.0496030', '34.4605870');
INSERT INTO `sys_cn_area` VALUES ('620000', '甘肃省', '甘肃', '100000', null, '中国,甘肃省', '1', null, '', 'Gansu', '103.8235570', '36.0580390');
INSERT INTO `sys_cn_area` VALUES ('620100', '兰州市', '兰州', '620000', null, '中国,甘肃省,兰州市', '2', '730030', '0931', 'Lanzhou', '103.8235570', '36.0580390');
INSERT INTO `sys_cn_area` VALUES ('620102', '城关区', '城关', '620100', null, '中国,甘肃省,兰州市,城关区', '3', '730030', '0931', 'Chengguan', '103.8252000', '36.0572500');
INSERT INTO `sys_cn_area` VALUES ('620103', '七里河区', '七里河', '620100', null, '中国,甘肃省,兰州市,七里河区', '3', '730050', '0931', 'Qilihe', '103.7856400', '36.0658500');
INSERT INTO `sys_cn_area` VALUES ('620104', '西固区', '西固', '620100', null, '中国,甘肃省,兰州市,西固区', '3', '730060', '0931', 'Xigu', '103.6281100', '36.0885800');
INSERT INTO `sys_cn_area` VALUES ('620105', '安宁区', '安宁', '620100', null, '中国,甘肃省,兰州市,安宁区', '3', '730070', '0931', 'Anning', '103.7189000', '36.1038400');
INSERT INTO `sys_cn_area` VALUES ('620111', '红古区', '红古', '620100', null, '中国,甘肃省,兰州市,红古区', '3', '730084', '0931', 'Honggu', '102.8595500', '36.3453700');
INSERT INTO `sys_cn_area` VALUES ('620121', '永登县', '永登', '620100', null, '中国,甘肃省,兰州市,永登县', '3', '730300', '0931', 'Yongdeng', '103.2605500', '36.7352200');
INSERT INTO `sys_cn_area` VALUES ('620122', '皋兰县', '皋兰', '620100', null, '中国,甘肃省,兰州市,皋兰县', '3', '730200', '0931', 'Gaolan', '103.9450600', '36.3321500');
INSERT INTO `sys_cn_area` VALUES ('620123', '榆中县', '榆中', '620100', null, '中国,甘肃省,兰州市,榆中县', '3', '730100', '0931', 'Yuzhong', '104.1145000', '35.8441500');
INSERT INTO `sys_cn_area` VALUES ('620200', '嘉峪关市', '嘉峪关', '620000', null, '中国,甘肃省,嘉峪关市', '2', '735100', '0937', 'Jiayuguan', '98.2773040', '39.7865290');
INSERT INTO `sys_cn_area` VALUES ('620201', '雄关区', '雄关', '620200', null, '中国,甘肃省,嘉峪关市,雄关区', '3', '735100', '0937', 'Xiongguan', '98.2773980', '39.7792500');
INSERT INTO `sys_cn_area` VALUES ('620202', '长城区', '长城', '620200', null, '中国,甘肃省,嘉峪关市,长城区', '3', '735106', '0937', 'Changcheng', '98.2735230', '39.7874310');
INSERT INTO `sys_cn_area` VALUES ('620203', '镜铁区', '镜铁', '620200', null, '中国,甘肃省,嘉峪关市,镜铁区', '3', '735100', '0937', 'Jingtie', '98.2773040', '39.7865290');
INSERT INTO `sys_cn_area` VALUES ('620300', '金昌市', '金昌', '620000', null, '中国,甘肃省,金昌市', '2', '737100', '0935', 'Jinchang', '102.1878880', '38.5142380');
INSERT INTO `sys_cn_area` VALUES ('620302', '金川区', '金川', '620300', null, '中国,甘肃省,金昌市,金川区', '3', '737100', '0935', 'Jinchuan', '102.1937600', '38.5210100');
INSERT INTO `sys_cn_area` VALUES ('620321', '永昌县', '永昌', '620300', null, '中国,甘肃省,金昌市,永昌县', '3', '737200', '0935', 'Yongchang', '101.9722200', '38.2471100');
INSERT INTO `sys_cn_area` VALUES ('620400', '白银市', '白银', '620000', null, '中国,甘肃省,白银市', '2', '730900', '0943', 'Baiyin', '104.1736060', '36.5456800');
INSERT INTO `sys_cn_area` VALUES ('620402', '白银区', '白银', '620400', null, '中国,甘肃省,白银市,白银区', '3', '730900', '0943', 'Baiyin', '104.1735500', '36.5441100');
INSERT INTO `sys_cn_area` VALUES ('620403', '平川区', '平川', '620400', null, '中国,甘肃省,白银市,平川区', '3', '730913', '0943', 'Pingchuan', '104.8249800', '36.7277000');
INSERT INTO `sys_cn_area` VALUES ('620421', '靖远县', '靖远', '620400', null, '中国,甘肃省,白银市,靖远县', '3', '730600', '0943', 'Jingyuan', '104.6832500', '36.5660200');
INSERT INTO `sys_cn_area` VALUES ('620422', '会宁县', '会宁', '620400', null, '中国,甘肃省,白银市,会宁县', '3', '730700', '0943', 'Huining', '105.0529700', '35.6962600');
INSERT INTO `sys_cn_area` VALUES ('620423', '景泰县', '景泰', '620400', null, '中国,甘肃省,白银市,景泰县', '3', '730400', '0943', 'Jingtai', '104.0629500', '37.1835900');
INSERT INTO `sys_cn_area` VALUES ('620500', '天水市', '天水', '620000', null, '中国,甘肃省,天水市', '2', '741000', '0938', 'Tianshui', '105.7249980', '34.5785290');
INSERT INTO `sys_cn_area` VALUES ('620502', '秦州区', '秦州', '620500', null, '中国,甘肃省,天水市,秦州区', '3', '741000', '0938', 'Qinzhou', '105.7242100', '34.5808900');
INSERT INTO `sys_cn_area` VALUES ('620503', '麦积区', '麦积', '620500', null, '中国,甘肃省,天水市,麦积区', '3', '741020', '0938', 'Maiji', '105.8901300', '34.5706900');
INSERT INTO `sys_cn_area` VALUES ('620521', '清水县', '清水', '620500', null, '中国,甘肃省,天水市,清水县', '3', '741400', '0938', 'Qingshui', '106.1367100', '34.7503200');
INSERT INTO `sys_cn_area` VALUES ('620522', '秦安县', '秦安', '620500', null, '中国,甘肃省,天水市,秦安县', '3', '741600', '0938', 'Qin\'an', '105.6695500', '34.8589400');
INSERT INTO `sys_cn_area` VALUES ('620523', '甘谷县', '甘谷', '620500', null, '中国,甘肃省,天水市,甘谷县', '3', '741200', '0938', 'Gangu', '105.3329100', '34.7366500');
INSERT INTO `sys_cn_area` VALUES ('620524', '武山县', '武山', '620500', null, '中国,甘肃省,天水市,武山县', '3', '741300', '0938', 'Wushan', '104.8838200', '34.7212300');
INSERT INTO `sys_cn_area` VALUES ('620525', '张家川回族自治县', '张家川', '620500', null, '中国,甘肃省,天水市,张家川回族自治县', '3', '741500', '0938', 'Zhangjiachuan', '106.2158200', '34.9958200');
INSERT INTO `sys_cn_area` VALUES ('620600', '武威市', '武威', '620000', null, '中国,甘肃省,武威市', '2', '733000', '0935', 'Wuwei', '102.6346970', '37.9299960');
INSERT INTO `sys_cn_area` VALUES ('620602', '凉州区', '凉州', '620600', null, '中国,甘肃省,武威市,凉州区', '3', '733000', '0935', 'Liangzhou', '102.6420300', '37.9283200');
INSERT INTO `sys_cn_area` VALUES ('620621', '民勤县', '民勤', '620600', null, '中国,甘肃省,武威市,民勤县', '3', '733300', '0935', 'Minqin', '103.0901100', '38.6248700');
INSERT INTO `sys_cn_area` VALUES ('620622', '古浪县', '古浪', '620600', null, '中国,甘肃省,武威市,古浪县', '3', '733100', '0935', 'Gulang', '102.8915400', '37.4650800');
INSERT INTO `sys_cn_area` VALUES ('620623', '天祝藏族自治县', '天祝', '620600', null, '中国,甘肃省,武威市,天祝藏族自治县', '3', '733200', '0935', 'Tianzhu', '103.1361000', '36.9771500');
INSERT INTO `sys_cn_area` VALUES ('620700', '张掖市', '张掖', '620000', null, '中国,甘肃省,张掖市', '2', '734000', '0936', 'Zhangye', '100.4554720', '38.9328970');
INSERT INTO `sys_cn_area` VALUES ('620702', '甘州区', '甘州', '620700', null, '中国,甘肃省,张掖市,甘州区', '3', '734000', '0936', 'Ganzhou', '100.4527000', '38.9294700');
INSERT INTO `sys_cn_area` VALUES ('620721', '肃南裕固族自治县', '肃南', '620700', null, '中国,甘肃省,张掖市,肃南裕固族自治县', '3', '734400', '0936', 'Sunan', '99.6140700', '38.8377600');
INSERT INTO `sys_cn_area` VALUES ('620722', '民乐县', '民乐', '620700', null, '中国,甘肃省,张掖市,民乐县', '3', '734500', '0936', 'Minle', '100.8109100', '38.4347900');
INSERT INTO `sys_cn_area` VALUES ('620723', '临泽县', '临泽', '620700', null, '中国,甘肃省,张掖市,临泽县', '3', '734200', '0936', 'Linze', '100.1644500', '39.1525200');
INSERT INTO `sys_cn_area` VALUES ('620724', '高台县', '高台', '620700', null, '中国,甘肃省,张掖市,高台县', '3', '734300', '0936', 'Gaotai', '99.8191800', '39.3782900');
INSERT INTO `sys_cn_area` VALUES ('620725', '山丹县', '山丹', '620700', null, '中国,甘肃省,张掖市,山丹县', '3', '734100', '0936', 'Shandan', '101.0935900', '38.7846800');
INSERT INTO `sys_cn_area` VALUES ('620800', '平凉市', '平凉', '620000', null, '中国,甘肃省,平凉市', '2', '744000', '0933', 'Pingliang', '106.6846910', '35.5427900');
INSERT INTO `sys_cn_area` VALUES ('620802', '崆峒区', '崆峒', '620800', null, '中国,甘肃省,平凉市,崆峒区', '3', '744000', '0933', 'Kongtong', '106.6748300', '35.5426200');
INSERT INTO `sys_cn_area` VALUES ('620821', '泾川县', '泾川', '620800', null, '中国,甘肃省,平凉市,泾川县', '3', '744300', '0933', 'Jingchuan', '107.3658100', '35.3322300');
INSERT INTO `sys_cn_area` VALUES ('620822', '灵台县', '灵台', '620800', null, '中国,甘肃省,平凉市,灵台县', '3', '744400', '0933', 'Lingtai', '107.6174000', '35.0676800');
INSERT INTO `sys_cn_area` VALUES ('620823', '崇信县', '崇信', '620800', null, '中国,甘肃省,平凉市,崇信县', '3', '744200', '0933', 'Chongxin', '107.0373800', '35.3034400');
INSERT INTO `sys_cn_area` VALUES ('620824', '华亭县', '华亭', '620800', null, '中国,甘肃省,平凉市,华亭县', '3', '744100', '0933', 'Huating', '106.6546300', '35.2183000');
INSERT INTO `sys_cn_area` VALUES ('620825', '庄浪县', '庄浪', '620800', null, '中国,甘肃省,平凉市,庄浪县', '3', '744600', '0933', 'Zhuanglang', '106.0366200', '35.2023500');
INSERT INTO `sys_cn_area` VALUES ('620826', '静宁县', '静宁', '620800', null, '中国,甘肃省,平凉市,静宁县', '3', '743400', '0933', 'Jingning', '105.7272300', '35.5199100');
INSERT INTO `sys_cn_area` VALUES ('620900', '酒泉市', '酒泉', '620000', null, '中国,甘肃省,酒泉市', '2', '735000', '0937', 'Jiuquan', '98.5107950', '39.7440230');
INSERT INTO `sys_cn_area` VALUES ('620902', '肃州区', '肃州', '620900', null, '中国,甘肃省,酒泉市,肃州区', '3', '735000', '0937', 'Suzhou', '98.5077500', '39.7450600');
INSERT INTO `sys_cn_area` VALUES ('620921', '金塔县', '金塔', '620900', null, '中国,甘肃省,酒泉市,金塔县', '3', '735300', '0937', 'Jinta', '98.9000200', '39.9773300');
INSERT INTO `sys_cn_area` VALUES ('620922', '瓜州县', '瓜州', '620900', null, '中国,甘肃省,酒泉市,瓜州县', '3', '736100', '0937', 'Guazhou', '95.7827100', '40.5154800');
INSERT INTO `sys_cn_area` VALUES ('620923', '肃北蒙古族自治县', '肃北', '620900', null, '中国,甘肃省,酒泉市,肃北蒙古族自治县', '3', '736300', '0937', 'Subei', '94.8764900', '39.5121400');
INSERT INTO `sys_cn_area` VALUES ('620924', '阿克塞哈萨克族自治县', '阿克塞', '620900', null, '中国,甘肃省,酒泉市,阿克塞哈萨克族自治县', '3', '736400', '0937', 'Akesai', '94.3409700', '39.6343500');
INSERT INTO `sys_cn_area` VALUES ('620981', '玉门市', '玉门', '620900', null, '中国,甘肃省,酒泉市,玉门市', '3', '735200', '0937', 'Yumen', '97.0453800', '40.2917200');
INSERT INTO `sys_cn_area` VALUES ('620982', '敦煌市', '敦煌', '620900', null, '中国,甘肃省,酒泉市,敦煌市', '3', '736200', '0937', 'Dunhuang', '94.6615900', '40.1421100');
INSERT INTO `sys_cn_area` VALUES ('621000', '庆阳市', '庆阳', '620000', null, '中国,甘肃省,庆阳市', '2', '745000', '0934', 'Qingyang', '107.6383720', '35.7342180');
INSERT INTO `sys_cn_area` VALUES ('621002', '西峰区', '西峰', '621000', null, '中国,甘肃省,庆阳市,西峰区', '3', '745000', '0934', 'Xifeng', '107.6510700', '35.7306500');
INSERT INTO `sys_cn_area` VALUES ('621021', '庆城县', '庆城', '621000', null, '中国,甘肃省,庆阳市,庆城县', '3', '745100', '0934', 'Qingcheng', '107.8827200', '36.0150700');
INSERT INTO `sys_cn_area` VALUES ('621022', '环县', '环县', '621000', null, '中国,甘肃省,庆阳市,环县', '3', '745700', '0934', 'Huanxian', '107.3083500', '36.5684600');
INSERT INTO `sys_cn_area` VALUES ('621023', '华池县', '华池', '621000', null, '中国,甘肃省,庆阳市,华池县', '3', '745600', '0934', 'Huachi', '107.9891000', '36.4610800');
INSERT INTO `sys_cn_area` VALUES ('621024', '合水县', '合水', '621000', null, '中国,甘肃省,庆阳市,合水县', '3', '745400', '0934', 'Heshui', '108.0203200', '35.8191100');
INSERT INTO `sys_cn_area` VALUES ('621025', '正宁县', '正宁', '621000', null, '中国,甘肃省,庆阳市,正宁县', '3', '745300', '0934', 'Zhengning', '108.3600700', '35.4917400');
INSERT INTO `sys_cn_area` VALUES ('621026', '宁县', '宁县', '621000', null, '中国,甘肃省,庆阳市,宁县', '3', '745200', '0934', 'Ningxian', '107.9251700', '35.5016400');
INSERT INTO `sys_cn_area` VALUES ('621027', '镇原县', '镇原', '621000', null, '中国,甘肃省,庆阳市,镇原县', '3', '744500', '0934', 'Zhenyuan', '107.1990000', '35.6771200');
INSERT INTO `sys_cn_area` VALUES ('621100', '定西市', '定西', '620000', null, '中国,甘肃省,定西市', '2', '743000', '0932', 'Dingxi', '104.6262940', '35.5795780');
INSERT INTO `sys_cn_area` VALUES ('621102', '安定区', '安定', '621100', null, '中国,甘肃省,定西市,安定区', '3', '743000', '0932', 'Anding', '104.6106000', '35.5806600');
INSERT INTO `sys_cn_area` VALUES ('621121', '通渭县', '通渭', '621100', null, '中国,甘肃省,定西市,通渭县', '3', '743300', '0932', 'Tongwei', '105.2422400', '35.2110100');
INSERT INTO `sys_cn_area` VALUES ('621122', '陇西县', '陇西', '621100', null, '中国,甘肃省,定西市,陇西县', '3', '748100', '0932', 'Longxi', '104.6344600', '35.0023800');
INSERT INTO `sys_cn_area` VALUES ('621123', '渭源县', '渭源', '621100', null, '中国,甘肃省,定西市,渭源县', '3', '748200', '0932', 'Weiyuan', '104.2143500', '35.1364900');
INSERT INTO `sys_cn_area` VALUES ('621124', '临洮县', '临洮', '621100', null, '中国,甘肃省,定西市,临洮县', '3', '730500', '0932', 'Lintao', '103.8619600', '35.3751000');
INSERT INTO `sys_cn_area` VALUES ('621125', '漳县', '漳县', '621100', null, '中国,甘肃省,定西市,漳县', '3', '748300', '0932', 'Zhangxian', '104.4670400', '34.8497700');
INSERT INTO `sys_cn_area` VALUES ('621126', '岷县', '岷县', '621100', null, '中国,甘肃省,定西市,岷县', '3', '748400', '0932', 'Minxian', '104.0377200', '34.4344400');
INSERT INTO `sys_cn_area` VALUES ('621200', '陇南市', '陇南', '620000', null, '中国,甘肃省,陇南市', '2', '746000', '0939', 'Longnan', '104.9293790', '33.3885980');
INSERT INTO `sys_cn_area` VALUES ('621202', '武都区', '武都', '621200', null, '中国,甘肃省,陇南市,武都区', '3', '746000', '0939', 'Wudu', '104.9265200', '33.3923900');
INSERT INTO `sys_cn_area` VALUES ('621221', '成县', '成县', '621200', null, '中国,甘肃省,陇南市,成县', '3', '742500', '0939', 'Chengxian', '105.7258600', '33.7392500');
INSERT INTO `sys_cn_area` VALUES ('621222', '文县', '文县', '621200', null, '中国,甘肃省,陇南市,文县', '3', '746400', '0939', 'Wenxian', '104.6836200', '32.9433700');
INSERT INTO `sys_cn_area` VALUES ('621223', '宕昌县', '宕昌', '621200', null, '中国,甘肃省,陇南市,宕昌县', '3', '748500', '0939', 'Dangchang', '104.3934900', '34.0473200');
INSERT INTO `sys_cn_area` VALUES ('621224', '康县', '康县', '621200', null, '中国,甘肃省,陇南市,康县', '3', '746500', '0939', 'Kangxian', '105.6071100', '33.3291200');
INSERT INTO `sys_cn_area` VALUES ('621225', '西和县', '西和', '621200', null, '中国,甘肃省,陇南市,西和县', '3', '742100', '0939', 'Xihe', '105.3009900', '34.0143200');
INSERT INTO `sys_cn_area` VALUES ('621226', '礼县', '礼县', '621200', null, '中国,甘肃省,陇南市,礼县', '3', '742200', '0939', 'Lixian', '105.1778500', '34.1893500');
INSERT INTO `sys_cn_area` VALUES ('621227', '徽县', '徽县', '621200', null, '中国,甘肃省,陇南市,徽县', '3', '742300', '0939', 'Huixian', '106.0852900', '33.7689800');
INSERT INTO `sys_cn_area` VALUES ('621228', '两当县', '两当', '621200', null, '中国,甘肃省,陇南市,两当县', '3', '742400', '0939', 'Liangdang', '106.3048400', '33.9096000');
INSERT INTO `sys_cn_area` VALUES ('622900', '临夏回族自治州', '临夏', '620000', null, '中国,甘肃省,临夏回族自治州', '2', '731100', '0930', 'Linxia', '103.2120060', '35.5994460');
INSERT INTO `sys_cn_area` VALUES ('622901', '临夏市', '临夏', '622900', null, '中国,甘肃省,临夏回族自治州,临夏市', '3', '731100', '0930', 'Linxia', '103.2100000', '35.5991600');
INSERT INTO `sys_cn_area` VALUES ('622921', '临夏县', '临夏', '622900', null, '中国,甘肃省,临夏回族自治州,临夏县', '3', '731800', '0930', 'Linxia', '102.9938000', '35.4951900');
INSERT INTO `sys_cn_area` VALUES ('622922', '康乐县', '康乐', '622900', null, '中国,甘肃省,临夏回族自治州,康乐县', '3', '731500', '0930', 'Kangle', '103.7109300', '35.3721900');
INSERT INTO `sys_cn_area` VALUES ('622923', '永靖县', '永靖', '622900', null, '中国,甘肃省,临夏回族自治州,永靖县', '3', '731600', '0930', 'Yongjing', '103.3204300', '35.9383500');
INSERT INTO `sys_cn_area` VALUES ('622924', '广河县', '广河', '622900', null, '中国,甘肃省,临夏回族自治州,广河县', '3', '731300', '0930', 'Guanghe', '103.5693300', '35.4809700');
INSERT INTO `sys_cn_area` VALUES ('622925', '和政县', '和政', '622900', null, '中国,甘肃省,临夏回族自治州,和政县', '3', '731200', '0930', 'Hezheng', '103.3493600', '35.4259200');
INSERT INTO `sys_cn_area` VALUES ('622926', '东乡族自治县', '东乡族', '622900', null, '中国,甘肃省,临夏回族自治州,东乡族自治县', '3', '731400', '0930', 'Dongxiangzu', '103.3947700', '35.6647100');
INSERT INTO `sys_cn_area` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '积石山', '622900', null, '中国,甘肃省,临夏回族自治州,积石山保安族东乡族撒拉族自治县', '3', '731700', '0930', 'Jishishan', '102.8737400', '35.7182000');
INSERT INTO `sys_cn_area` VALUES ('623000', '甘南藏族自治州', '甘南', '620000', null, '中国,甘肃省,甘南藏族自治州', '2', '747000', '0941', 'Gannan', '102.9110080', '34.9863540');
INSERT INTO `sys_cn_area` VALUES ('623001', '合作市', '合作', '623000', null, '中国,甘肃省,甘南藏族自治州,合作市', '3', '747000', '0941', 'Hezuo', '102.9108200', '35.0001600');
INSERT INTO `sys_cn_area` VALUES ('623021', '临潭县', '临潭', '623000', null, '中国,甘肃省,甘南藏族自治州,临潭县', '3', '747500', '0941', 'Lintan', '103.3528700', '34.6951500');
INSERT INTO `sys_cn_area` VALUES ('623022', '卓尼县', '卓尼', '623000', null, '中国,甘肃省,甘南藏族自治州,卓尼县', '3', '747600', '0941', 'Zhuoni', '103.5081100', '34.5891900');
INSERT INTO `sys_cn_area` VALUES ('623023', '舟曲县', '舟曲', '623000', null, '中国,甘肃省,甘南藏族自治州,舟曲县', '3', '746300', '0941', 'Zhouqu', '104.3715500', '33.7846800');
INSERT INTO `sys_cn_area` VALUES ('623024', '迭部县', '迭部', '623000', null, '中国,甘肃省,甘南藏族自治州,迭部县', '3', '747400', '0941', 'Diebu', '103.2227400', '34.0562300');
INSERT INTO `sys_cn_area` VALUES ('623025', '玛曲县', '玛曲', '623000', null, '中国,甘肃省,甘南藏族自治州,玛曲县', '3', '747300', '0941', 'Maqu', '102.0754000', '33.9970000');
INSERT INTO `sys_cn_area` VALUES ('623026', '碌曲县', '碌曲', '623000', null, '中国,甘肃省,甘南藏族自治州,碌曲县', '3', '747200', '0941', 'Luqu', '102.4917600', '34.5887200');
INSERT INTO `sys_cn_area` VALUES ('623027', '夏河县', '夏河', '623000', null, '中国,甘肃省,甘南藏族自治州,夏河县', '3', '747100', '0941', 'Xiahe', '102.5221500', '35.2048700');
INSERT INTO `sys_cn_area` VALUES ('630000', '青海省', '青海', '100000', null, '中国,青海省', '1', null, '', 'Qinghai', '101.7789160', '36.6231780');
INSERT INTO `sys_cn_area` VALUES ('630100', '西宁市', '西宁', '630000', null, '中国,青海省,西宁市', '2', '810000', '0971', 'Xining', '101.7789160', '36.6231780');
INSERT INTO `sys_cn_area` VALUES ('630102', '城东区', '城东', '630100', null, '中国,青海省,西宁市,城东区', '3', '810007', '0971', 'Chengdong', '101.8037300', '36.5996900');
INSERT INTO `sys_cn_area` VALUES ('630103', '城中区', '城中', '630100', null, '中国,青海省,西宁市,城中区', '3', '810000', '0971', 'Chengzhong', '101.7839400', '36.6227900');
INSERT INTO `sys_cn_area` VALUES ('630104', '城西区', '城西', '630100', null, '中国,青海省,西宁市,城西区', '3', '810001', '0971', 'Chengxi', '101.7658800', '36.6282800');
INSERT INTO `sys_cn_area` VALUES ('630105', '城北区', '城北', '630100', null, '中国,青海省,西宁市,城北区', '3', '810003', '0971', 'Chengbei', '101.7662000', '36.6501400');
INSERT INTO `sys_cn_area` VALUES ('630121', '大通回族土族自治县', '大通', '630100', null, '中国,青海省,西宁市,大通回族土族自治县', '3', '810100', '0971', 'Datong', '101.7023600', '36.9348900');
INSERT INTO `sys_cn_area` VALUES ('630122', '湟中县', '湟中', '630100', null, '中国,青海省,西宁市,湟中县', '3', '811600', '0971', 'Huangzhong', '101.5715900', '36.5008300');
INSERT INTO `sys_cn_area` VALUES ('630123', '湟源县', '湟源', '630100', null, '中国,青海省,西宁市,湟源县', '3', '812100', '0971', 'Huangyuan', '101.2564300', '36.6824300');
INSERT INTO `sys_cn_area` VALUES ('630200', '海东市', '海东', '630000', null, '中国,青海省,海东市', '2', '810700', '0972', 'Haidong', '102.1032700', '36.5029160');
INSERT INTO `sys_cn_area` VALUES ('630202', '乐都区', '乐都', '630200', null, '中国,青海省,海东市,乐都区', '3', '810700', '0972', 'Ledu', '102.4024310', '36.4802910');
INSERT INTO `sys_cn_area` VALUES ('630221', '平安县', '平安', '630200', null, '中国,青海省,海东市,平安县', '3', '810600', '0972', 'Ping\'an', '102.1042950', '36.5027140');
INSERT INTO `sys_cn_area` VALUES ('630222', '民和回族土族自治县', '民和', '630200', null, '中国,青海省,海东市,民和回族土族自治县', '3', '810800', '0972', 'Minhe', '102.8042090', '36.3294510');
INSERT INTO `sys_cn_area` VALUES ('630223', '互助土族自治县', '互助', '630200', null, '中国,青海省,海东市,互助土族自治县', '3', '810500', '0972', 'Huzhu', '101.9567340', '36.8399400');
INSERT INTO `sys_cn_area` VALUES ('630224', '化隆回族自治县', '化隆', '630200', null, '中国,青海省,海东市,化隆回族自治县', '3', '810900', '0972', 'Hualong', '102.2623290', '36.0983220');
INSERT INTO `sys_cn_area` VALUES ('630225', '循化撒拉族自治县', '循化', '630200', null, '中国,青海省,海东市,循化撒拉族自治县', '3', '811100', '0972', 'Xunhua', '102.4865340', '35.8472470');
INSERT INTO `sys_cn_area` VALUES ('632200', '海北藏族自治州', '海北', '630000', null, '中国,青海省,海北藏族自治州', '2', '812200', '0970', 'Haibei', '100.9010590', '36.9594350');
INSERT INTO `sys_cn_area` VALUES ('632221', '门源回族自治县', '门源', '632200', null, '中国,青海省,海北藏族自治州,门源回族自治县', '3', '810300', '0970', 'Menyuan', '101.6222800', '37.3761100');
INSERT INTO `sys_cn_area` VALUES ('632222', '祁连县', '祁连', '632200', null, '中国,青海省,海北藏族自治州,祁连县', '3', '810400', '0970', 'Qilian', '100.2461800', '38.1790100');
INSERT INTO `sys_cn_area` VALUES ('632223', '海晏县', '海晏', '632200', null, '中国,青海省,海北藏族自治州,海晏县', '3', '812200', '0970', 'Haiyan', '100.9927000', '36.8990200');
INSERT INTO `sys_cn_area` VALUES ('632224', '刚察县', '刚察', '632200', null, '中国,青海省,海北藏族自治州,刚察县', '3', '812300', '0970', 'Gangcha', '100.1467500', '37.3216100');
INSERT INTO `sys_cn_area` VALUES ('632300', '黄南藏族自治州', '黄南', '630000', null, '中国,青海省,黄南藏族自治州', '2', '811300', '0973', 'Huangnan', '102.0199880', '35.5177440');
INSERT INTO `sys_cn_area` VALUES ('632321', '同仁县', '同仁', '632300', null, '中国,青海省,黄南藏族自治州,同仁县', '3', '811300', '0973', 'Tongren', '102.0184000', '35.5160300');
INSERT INTO `sys_cn_area` VALUES ('632322', '尖扎县', '尖扎', '632300', null, '中国,青海省,黄南藏族自治州,尖扎县', '3', '811200', '0973', 'Jianzha', '102.0341100', '35.9394700');
INSERT INTO `sys_cn_area` VALUES ('632323', '泽库县', '泽库', '632300', null, '中国,青海省,黄南藏族自治州,泽库县', '3', '811400', '0973', 'Zeku', '101.4644400', '35.0351900');
INSERT INTO `sys_cn_area` VALUES ('632324', '河南蒙古族自治县', '河南', '632300', null, '中国,青海省,黄南藏族自治州,河南蒙古族自治县', '3', '811500', '0973', 'Henan', '101.6086400', '34.7347600');
INSERT INTO `sys_cn_area` VALUES ('632500', '海南藏族自治州', '海南', '630000', null, '中国,青海省,海南藏族自治州', '2', '813000', '0974', 'Hainan', '100.6195420', '36.2803530');
INSERT INTO `sys_cn_area` VALUES ('632521', '共和县', '共和', '632500', null, '中国,青海省,海南藏族自治州,共和县', '3', '813000', '0974', 'Gonghe', '100.6200300', '36.2841000');
INSERT INTO `sys_cn_area` VALUES ('632522', '同德县', '同德', '632500', null, '中国,青海省,海南藏族自治州,同德县', '3', '813200', '0974', 'Tongde', '100.5715900', '35.2548800');
INSERT INTO `sys_cn_area` VALUES ('632523', '贵德县', '贵德', '632500', null, '中国,青海省,海南藏族自治州,贵德县', '3', '811700', '0974', 'Guide', '101.4320000', '36.0440000');
INSERT INTO `sys_cn_area` VALUES ('632524', '兴海县', '兴海', '632500', null, '中国,青海省,海南藏族自治州,兴海县', '3', '813300', '0974', 'Xinghai', '99.9884600', '35.5903100');
INSERT INTO `sys_cn_area` VALUES ('632525', '贵南县', '贵南', '632500', null, '中国,青海省,海南藏族自治州,贵南县', '3', '813100', '0974', 'Guinan', '100.7471600', '35.5866700');
INSERT INTO `sys_cn_area` VALUES ('632600', '果洛藏族自治州', '果洛', '630000', null, '中国,青海省,果洛藏族自治州', '2', '814000', '0975', 'Golog', '100.2421430', '34.4736000');
INSERT INTO `sys_cn_area` VALUES ('632621', '玛沁县', '玛沁', '632600', null, '中国,青海省,果洛藏族自治州,玛沁县', '3', '814000', '0975', 'Maqin', '100.2390100', '34.4774600');
INSERT INTO `sys_cn_area` VALUES ('632622', '班玛县', '班玛', '632600', null, '中国,青海省,果洛藏族自治州,班玛县', '3', '814300', '0975', 'Banma', '100.7374500', '32.9325300');
INSERT INTO `sys_cn_area` VALUES ('632623', '甘德县', '甘德', '632600', null, '中国,青海省,果洛藏族自治州,甘德县', '3', '814100', '0975', 'Gande', '99.9024600', '33.9683800');
INSERT INTO `sys_cn_area` VALUES ('632624', '达日县', '达日', '632600', null, '中国,青海省,果洛藏族自治州,达日县', '3', '814200', '0975', 'Dari', '99.6517900', '33.7519300');
INSERT INTO `sys_cn_area` VALUES ('632625', '久治县', '久治', '632600', null, '中国,青海省,果洛藏族自治州,久治县', '3', '624700', '0975', 'Jiuzhi', '101.4834200', '33.4298900');
INSERT INTO `sys_cn_area` VALUES ('632626', '玛多县', '玛多', '632600', null, '中国,青海省,果洛藏族自治州,玛多县', '3', '813500', '0975', 'Maduo', '98.2099600', '34.9156700');
INSERT INTO `sys_cn_area` VALUES ('632700', '玉树藏族自治州', '玉树', '630000', null, '中国,青海省,玉树藏族自治州', '2', '815000', '0976', 'Yushu', '97.0085220', '33.0040490');
INSERT INTO `sys_cn_area` VALUES ('632701', '玉树市', '玉树', '632700', null, '中国,青海省,玉树藏族自治州,玉树市', '3', '815000', '0976', 'Yushu', '97.0087620', '33.0039300');
INSERT INTO `sys_cn_area` VALUES ('632722', '杂多县', '杂多', '632700', null, '中国,青海省,玉树藏族自治州,杂多县', '3', '815300', '0976', 'Zaduo', '95.2986400', '32.8931800');
INSERT INTO `sys_cn_area` VALUES ('632723', '称多县', '称多', '632700', null, '中国,青海省,玉树藏族自治州,称多县', '3', '815100', '0976', 'Chenduo', '97.1078800', '33.3689900');
INSERT INTO `sys_cn_area` VALUES ('632724', '治多县', '治多', '632700', null, '中国,青海省,玉树藏族自治州,治多县', '3', '815400', '0976', 'Zhiduo', '95.6157200', '33.8528000');
INSERT INTO `sys_cn_area` VALUES ('632725', '囊谦县', '囊谦', '632700', null, '中国,青海省,玉树藏族自治州,囊谦县', '3', '815200', '0976', 'Nangqian', '96.4775300', '32.2035900');
INSERT INTO `sys_cn_area` VALUES ('632726', '曲麻莱县', '曲麻莱', '632700', null, '中国,青海省,玉树藏族自治州,曲麻莱县', '3', '815500', '0976', 'Qumalai', '95.7975700', '34.1260900');
INSERT INTO `sys_cn_area` VALUES ('632800', '海西蒙古族藏族自治州', '海西', '630000', null, '中国,青海省,海西蒙古族藏族自治州', '2', '817000', '0977', 'Haixi', '97.3707850', '37.3746630');
INSERT INTO `sys_cn_area` VALUES ('632801', '格尔木市', '格尔木', '632800', null, '中国,青海省,海西蒙古族藏族自治州,格尔木市', '3', '816000', '0977', 'Geermu', '94.9032900', '36.4023600');
INSERT INTO `sys_cn_area` VALUES ('632802', '德令哈市', '德令哈', '632800', null, '中国,青海省,海西蒙古族藏族自治州,德令哈市', '3', '817000', '0977', 'Delingha', '97.3608400', '37.3694600');
INSERT INTO `sys_cn_area` VALUES ('632821', '乌兰县', '乌兰', '632800', null, '中国,青海省,海西蒙古族藏族自治州,乌兰县', '3', '817100', '0977', 'Wulan', '98.4819600', '36.9347100');
INSERT INTO `sys_cn_area` VALUES ('632822', '都兰县', '都兰', '632800', null, '中国,青海省,海西蒙古族藏族自治州,都兰县', '3', '816100', '0977', 'Dulan', '98.0922800', '36.3013500');
INSERT INTO `sys_cn_area` VALUES ('632823', '天峻县', '天峻', '632800', null, '中国,青海省,海西蒙古族藏族自治州,天峻县', '3', '817200', '0977', 'Tianjun', '99.0245300', '37.3032600');
INSERT INTO `sys_cn_area` VALUES ('640000', '宁夏回族自治区', '宁夏', '100000', null, '中国,宁夏回族自治区', '1', null, '', 'Ningxia', '106.2781790', '38.4663700');
INSERT INTO `sys_cn_area` VALUES ('640100', '银川市', '银川', '640000', null, '中国,宁夏回族自治区,银川市', '2', '750004', '0951', 'Yinchuan', '106.2781790', '38.4663700');
INSERT INTO `sys_cn_area` VALUES ('640104', '兴庆区', '兴庆', '640100', null, '中国,宁夏回族自治区,银川市,兴庆区', '3', '750001', '0951', 'Xingqing', '106.2887200', '38.4739200');
INSERT INTO `sys_cn_area` VALUES ('640105', '西夏区', '西夏', '640100', null, '中国,宁夏回族自治区,银川市,西夏区', '3', '750021', '0951', 'Xixia', '106.1502300', '38.4913700');
INSERT INTO `sys_cn_area` VALUES ('640106', '金凤区', '金凤', '640100', null, '中国,宁夏回族自治区,银川市,金凤区', '3', '750011', '0951', 'Jinfeng', '106.2426100', '38.4729400');
INSERT INTO `sys_cn_area` VALUES ('640121', '永宁县', '永宁', '640100', null, '中国,宁夏回族自治区,银川市,永宁县', '3', '750100', '0951', 'Yongning', '106.2517000', '38.2755900');
INSERT INTO `sys_cn_area` VALUES ('640122', '贺兰县', '贺兰', '640100', null, '中国,宁夏回族自治区,银川市,贺兰县', '3', '750200', '0951', 'Helan', '106.3498200', '38.5544000');
INSERT INTO `sys_cn_area` VALUES ('640181', '灵武市', '灵武', '640100', null, '中国,宁夏回族自治区,银川市,灵武市', '3', '750004', '0951', 'Lingwu', '106.3399900', '38.1026600');
INSERT INTO `sys_cn_area` VALUES ('640200', '石嘴山市', '石嘴山', '640000', null, '中国,宁夏回族自治区,石嘴山市', '2', '753000', '0952', 'Shizuishan', '106.3761730', '39.0133300');
INSERT INTO `sys_cn_area` VALUES ('640202', '大武口区', '大武口', '640200', null, '中国,宁夏回族自治区,石嘴山市,大武口区', '3', '753000', '0952', 'Dawukou', '106.3771700', '39.0122600');
INSERT INTO `sys_cn_area` VALUES ('640205', '惠农区', '惠农', '640200', null, '中国,宁夏回族自治区,石嘴山市,惠农区', '3', '753600', '0952', 'Huinong', '106.7114500', '39.1319300');
INSERT INTO `sys_cn_area` VALUES ('640221', '平罗县', '平罗', '640200', null, '中国,宁夏回族自治区,石嘴山市,平罗县', '3', '753400', '0952', 'Pingluo', '106.5453800', '38.9042900');
INSERT INTO `sys_cn_area` VALUES ('640300', '吴忠市', '吴忠', '640000', null, '中国,宁夏回族自治区,吴忠市', '2', '751100', '0953', 'Wuzhong', '106.1994090', '37.9861650');
INSERT INTO `sys_cn_area` VALUES ('640302', '利通区', '利通', '640300', null, '中国,宁夏回族自治区,吴忠市,利通区', '3', '751100', '0953', 'Litong', '106.2031100', '37.9851200');
INSERT INTO `sys_cn_area` VALUES ('640303', '红寺堡区', '红寺堡', '640300', null, '中国,宁夏回族自治区,吴忠市,红寺堡区', '3', '751900', '0953', 'Hongsibao', '106.1982200', '37.9974700');
INSERT INTO `sys_cn_area` VALUES ('640323', '盐池县', '盐池', '640300', null, '中国,宁夏回族自治区,吴忠市,盐池县', '3', '751500', '0953', 'Yanchi', '107.4070700', '37.7833000');
INSERT INTO `sys_cn_area` VALUES ('640324', '同心县', '同心', '640300', null, '中国,宁夏回族自治区,吴忠市,同心县', '3', '751300', '0953', 'Tongxin', '105.9141800', '36.9811600');
INSERT INTO `sys_cn_area` VALUES ('640381', '青铜峡市', '青铜峡', '640300', null, '中国,宁夏回族自治区,吴忠市,青铜峡市', '3', '751600', '0953', 'Qingtongxia', '106.0748900', '38.0200400');
INSERT INTO `sys_cn_area` VALUES ('640400', '固原市', '固原', '640000', null, '中国,宁夏回族自治区,固原市', '2', '756000', '0954', 'Guyuan', '106.2852410', '36.0045610');
INSERT INTO `sys_cn_area` VALUES ('640402', '原州区', '原州', '640400', null, '中国,宁夏回族自治区,固原市,原州区', '3', '756000', '0954', 'Yuanzhou', '106.2877800', '36.0037400');
INSERT INTO `sys_cn_area` VALUES ('640422', '西吉县', '西吉', '640400', null, '中国,宁夏回族自治区,固原市,西吉县', '3', '756200', '0954', 'Xiji', '105.7310700', '35.9661600');
INSERT INTO `sys_cn_area` VALUES ('640423', '隆德县', '隆德', '640400', null, '中国,宁夏回族自治区,固原市,隆德县', '3', '756300', '0954', 'Longde', '106.1242600', '35.6171800');
INSERT INTO `sys_cn_area` VALUES ('640424', '泾源县', '泾源', '640400', null, '中国,宁夏回族自治区,固原市,泾源县', '3', '756400', '0954', 'Jingyuan', '106.3390200', '35.4907200');
INSERT INTO `sys_cn_area` VALUES ('640425', '彭阳县', '彭阳', '640400', null, '中国,宁夏回族自治区,固原市,彭阳县', '3', '756500', '0954', 'Pengyang', '106.6446200', '35.8507600');
INSERT INTO `sys_cn_area` VALUES ('640500', '中卫市', '中卫', '640000', null, '中国,宁夏回族自治区,中卫市', '2', '751700', '0955', 'Zhongwei', '105.1895680', '37.5149510');
INSERT INTO `sys_cn_area` VALUES ('640502', '沙坡头区', '沙坡头', '640500', null, '中国,宁夏回族自治区,中卫市,沙坡头区', '3', '755000', '0955', 'Shapotou', '105.1896200', '37.5104400');
INSERT INTO `sys_cn_area` VALUES ('640521', '中宁县', '中宁', '640500', null, '中国,宁夏回族自治区,中卫市,中宁县', '3', '751200', '0955', 'Zhongning', '105.6851500', '37.4914900');
INSERT INTO `sys_cn_area` VALUES ('640522', '海原县', '海原', '640500', null, '中国,宁夏回族自治区,中卫市,海原县', '3', '751800', '0955', 'Haiyuan', '105.6471200', '36.5649800');
INSERT INTO `sys_cn_area` VALUES ('650000', '新疆维吾尔自治区', '新疆', '100000', null, '中国,新疆维吾尔自治区', '1', null, '', 'Xinjiang', '87.6177330', '43.7928180');
INSERT INTO `sys_cn_area` VALUES ('650100', '乌鲁木齐市', '乌鲁木齐', '650000', null, '中国,新疆维吾尔自治区,乌鲁木齐市', '2', '830002', '0991', 'Urumqi', '87.6177330', '43.7928180');
INSERT INTO `sys_cn_area` VALUES ('650102', '天山区', '天山', '650100', null, '中国,新疆维吾尔自治区,乌鲁木齐市,天山区', '3', '830002', '0991', 'Tianshan', '87.6316700', '43.7943900');
INSERT INTO `sys_cn_area` VALUES ('650103', '沙依巴克区', '沙依巴克', '650100', null, '中国,新疆维吾尔自治区,乌鲁木齐市,沙依巴克区', '3', '830000', '0991', 'Shayibake', '87.5978800', '43.8011800');
INSERT INTO `sys_cn_area` VALUES ('650104', '新市区', '新市', '650100', null, '中国,新疆维吾尔自治区,乌鲁木齐市,新市区', '3', '830011', '0991', 'Xinshi', '87.5740600', '43.8434800');
INSERT INTO `sys_cn_area` VALUES ('650105', '水磨沟区', '水磨沟', '650100', null, '中国,新疆维吾尔自治区,乌鲁木齐市,水磨沟区', '3', '830017', '0991', 'Shuimogou', '87.6424900', '43.8324700');
INSERT INTO `sys_cn_area` VALUES ('650106', '头屯河区', '头屯河', '650100', null, '中国,新疆维吾尔自治区,乌鲁木齐市,头屯河区', '3', '830022', '0991', 'Toutunhe', '87.2913800', '43.8548700');
INSERT INTO `sys_cn_area` VALUES ('650107', '达坂城区', '达坂城', '650100', null, '中国,新疆维吾尔自治区,乌鲁木齐市,达坂城区', '3', '830039', '0991', 'Dabancheng', '88.3069700', '43.3579700');
INSERT INTO `sys_cn_area` VALUES ('650109', '米东区', '米东', '650100', null, '中国,新疆维吾尔自治区,乌鲁木齐市,米东区', '3', '830019', '0991', 'Midong', '87.6858300', '43.9473900');
INSERT INTO `sys_cn_area` VALUES ('650121', '乌鲁木齐县', '乌鲁木齐', '650100', null, '中国,新疆维吾尔自治区,乌鲁木齐市,乌鲁木齐县', '3', '830063', '0991', 'Wulumuqi', '87.4093900', '43.4712500');
INSERT INTO `sys_cn_area` VALUES ('650200', '克拉玛依市', '克拉玛依', '650000', null, '中国,新疆维吾尔自治区,克拉玛依市', '2', '834000', '0990', 'Karamay', '84.8739460', '45.5958860');
INSERT INTO `sys_cn_area` VALUES ('650202', '独山子区', '独山子', '650200', null, '中国,新疆维吾尔自治区,克拉玛依市,独山子区', '3', '834021', '0992', 'Dushanzi', '84.8867100', '44.3286700');
INSERT INTO `sys_cn_area` VALUES ('650203', '克拉玛依区', '克拉玛依', '650200', null, '中国,新疆维吾尔自治区,克拉玛依市,克拉玛依区', '3', '834000', '0990', 'Kelamayi', '84.8622500', '45.5908900');
INSERT INTO `sys_cn_area` VALUES ('650204', '白碱滩区', '白碱滩', '650200', null, '中国,新疆维吾尔自治区,克拉玛依市,白碱滩区', '3', '834008', '0990', 'Baijiantan', '85.1324400', '45.6876800');
INSERT INTO `sys_cn_area` VALUES ('650205', '乌尔禾区', '乌尔禾', '650200', null, '中国,新疆维吾尔自治区,克拉玛依市,乌尔禾区', '3', '834012', '0990', 'Wuerhe', '85.6914300', '46.0900600');
INSERT INTO `sys_cn_area` VALUES ('652100', '吐鲁番地区', '吐鲁番', '650000', null, '中国,新疆维吾尔自治区,吐鲁番地区', '2', '838000', '0995', 'Turpan', '89.1840780', '42.9476130');
INSERT INTO `sys_cn_area` VALUES ('652101', '吐鲁番市', '吐鲁番', '652100', null, '中国,新疆维吾尔自治区,吐鲁番地区,吐鲁番市', '3', '838000', '0995', 'Tulufan', '89.1857900', '42.9350500');
INSERT INTO `sys_cn_area` VALUES ('652122', '鄯善县', '鄯善', '652100', null, '中国,新疆维吾尔自治区,吐鲁番地区,鄯善县', '3', '838200', '0995', 'Shanshan', '90.2140200', '42.8635000');
INSERT INTO `sys_cn_area` VALUES ('652123', '托克逊县', '托克逊', '652100', null, '中国,新疆维吾尔自治区,吐鲁番地区,托克逊县', '3', '838100', '0995', 'Tuokexun', '88.6582300', '42.7923100');
INSERT INTO `sys_cn_area` VALUES ('652200', '哈密地区', '哈密', '650000', null, '中国,新疆维吾尔自治区,哈密地区', '2', '839000', '0902', 'Hami', '93.5131600', '42.8332480');
INSERT INTO `sys_cn_area` VALUES ('652201', '哈密市', '哈密', '652200', null, '中国,新疆维吾尔自治区,哈密地区,哈密市', '3', '839000', '0902', 'Hami', '93.5145200', '42.8269900');
INSERT INTO `sys_cn_area` VALUES ('652222', '巴里坤哈萨克自治县', '巴里坤', '652200', null, '中国,新疆维吾尔自治区,哈密地区,巴里坤哈萨克自治县', '3', '839200', '0902', 'Balikun', '93.0123600', '43.5999300');
INSERT INTO `sys_cn_area` VALUES ('652223', '伊吾县', '伊吾', '652200', null, '中国,新疆维吾尔自治区,哈密地区,伊吾县', '3', '839300', '0902', 'Yiwu', '94.6940300', '43.2537000');
INSERT INTO `sys_cn_area` VALUES ('652300', '昌吉回族自治州', '昌吉', '650000', null, '中国,新疆维吾尔自治区,昌吉回族自治州', '2', '831100', '0994', 'Changji', '87.3040120', '44.0145770');
INSERT INTO `sys_cn_area` VALUES ('652301', '昌吉市', '昌吉', '652300', null, '中国,新疆维吾尔自治区,昌吉回族自治州,昌吉市', '3', '831100', '0994', 'Changji', '87.3024900', '44.0126700');
INSERT INTO `sys_cn_area` VALUES ('652302', '阜康市', '阜康', '652300', null, '中国,新疆维吾尔自治区,昌吉回族自治州,阜康市', '3', '831500', '0994', 'Fukang', '87.9852900', '44.1584000');
INSERT INTO `sys_cn_area` VALUES ('652323', '呼图壁县', '呼图壁', '652300', null, '中国,新疆维吾尔自治区,昌吉回族自治州,呼图壁县', '3', '831200', '0994', 'Hutubi', '86.8989200', '44.1897700');
INSERT INTO `sys_cn_area` VALUES ('652324', '玛纳斯县', '玛纳斯', '652300', null, '中国,新疆维吾尔自治区,昌吉回族自治州,玛纳斯县', '3', '832200', '0994', 'Manasi', '86.2145000', '44.3043800');
INSERT INTO `sys_cn_area` VALUES ('652325', '奇台县', '奇台', '652300', null, '中国,新疆维吾尔自治区,昌吉回族自治州,奇台县', '3', '831800', '0994', 'Qitai', '89.5932000', '44.0222100');
INSERT INTO `sys_cn_area` VALUES ('652327', '吉木萨尔县', '吉木萨尔', '652300', null, '中国,新疆维吾尔自治区,昌吉回族自治州,吉木萨尔县', '3', '831700', '0994', 'Jimusaer', '89.1807800', '44.0004800');
INSERT INTO `sys_cn_area` VALUES ('652328', '木垒哈萨克自治县', '木垒', '652300', null, '中国,新疆维吾尔自治区,昌吉回族自治州,木垒哈萨克自治县', '3', '831900', '0994', 'Mulei', '90.2889700', '43.8350800');
INSERT INTO `sys_cn_area` VALUES ('652700', '博尔塔拉蒙古自治州', '博尔塔拉', '650000', null, '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州', '2', '833400', '0909', 'Bortala', '82.0747780', '44.9032580');
INSERT INTO `sys_cn_area` VALUES ('652701', '博乐市', '博乐', '652700', null, '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,博乐市', '3', '833400', '0909', 'Bole', '82.0713000', '44.9005200');
INSERT INTO `sys_cn_area` VALUES ('652702', '阿拉山口市', '阿拉山口', '652700', null, '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,阿拉山口市', '3', '833400', '0909', 'Alashankou', '82.5677210', '45.1706160');
INSERT INTO `sys_cn_area` VALUES ('652722', '精河县', '精河', '652700', null, '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,精河县', '3', '833300', '0909', 'Jinghe', '82.8941900', '44.6077400');
INSERT INTO `sys_cn_area` VALUES ('652723', '温泉县', '温泉', '652700', null, '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,温泉县', '3', '833500', '0909', 'Wenquan', '81.0313400', '44.9737300');
INSERT INTO `sys_cn_area` VALUES ('652800', '巴音郭楞蒙古自治州', '巴音郭楞', '650000', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州', '2', '841000', '0996', 'Bayingol', '86.1509690', '41.7685520');
INSERT INTO `sys_cn_area` VALUES ('652801', '库尔勒市', '库尔勒', '652800', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,库尔勒市', '3', '841000', '0996', 'Kuerle', '86.1552800', '41.7660200');
INSERT INTO `sys_cn_area` VALUES ('652822', '轮台县', '轮台', '652800', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,轮台县', '3', '841600', '0996', 'Luntai', '84.2610100', '41.7764200');
INSERT INTO `sys_cn_area` VALUES ('652823', '尉犁县', '尉犁', '652800', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,尉犁县', '3', '841500', '0996', 'Yuli', '86.2590300', '41.3363200');
INSERT INTO `sys_cn_area` VALUES ('652824', '若羌县', '若羌', '652800', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,若羌县', '3', '841800', '0996', 'Ruoqiang', '88.1681200', '39.0179000');
INSERT INTO `sys_cn_area` VALUES ('652825', '且末县', '且末', '652800', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,且末县', '3', '841900', '0996', 'Qiemo', '85.5297500', '38.1453400');
INSERT INTO `sys_cn_area` VALUES ('652826', '焉耆回族自治县', '焉耆', '652800', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,焉耆回族自治县', '3', '841100', '0996', 'Yanqi', '86.5744000', '42.0590000');
INSERT INTO `sys_cn_area` VALUES ('652827', '和静县', '和静', '652800', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,和静县', '3', '841300', '0996', 'Hejing', '86.3961100', '42.3183800');
INSERT INTO `sys_cn_area` VALUES ('652828', '和硕县', '和硕', '652800', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,和硕县', '3', '841200', '0996', 'Heshuo', '86.8639200', '42.2681400');
INSERT INTO `sys_cn_area` VALUES ('652829', '博湖县', '博湖', '652800', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,博湖县', '3', '841400', '0996', 'Bohu', '86.6333300', '41.9801400');
INSERT INTO `sys_cn_area` VALUES ('652900', '阿克苏地区', '阿克苏', '650000', null, '中国,新疆维吾尔自治区,阿克苏地区', '2', '843000', '0997', 'Aksu', '80.2650680', '41.1707120');
INSERT INTO `sys_cn_area` VALUES ('652901', '阿克苏市', '阿克苏', '652900', null, '中国,新疆维吾尔自治区,阿克苏地区,阿克苏市', '3', '843000', '0997', 'Akesu', '80.2633800', '41.1675400');
INSERT INTO `sys_cn_area` VALUES ('652922', '温宿县', '温宿', '652900', null, '中国,新疆维吾尔自治区,阿克苏地区,温宿县', '3', '843100', '0997', 'Wensu', '80.2417300', '41.2767900');
INSERT INTO `sys_cn_area` VALUES ('652923', '库车县', '库车', '652900', null, '中国,新疆维吾尔自治区,阿克苏地区,库车县', '3', '842000', '0997', 'Kuche', '82.9620900', '41.7179300');
INSERT INTO `sys_cn_area` VALUES ('652924', '沙雅县', '沙雅', '652900', null, '中国,新疆维吾尔自治区,阿克苏地区,沙雅县', '3', '842200', '0997', 'Shaya', '82.7813100', '41.2249700');
INSERT INTO `sys_cn_area` VALUES ('652925', '新和县', '新和', '652900', null, '中国,新疆维吾尔自治区,阿克苏地区,新和县', '3', '842100', '0997', 'Xinhe', '82.6105300', '41.5496400');
INSERT INTO `sys_cn_area` VALUES ('652926', '拜城县', '拜城', '652900', null, '中国,新疆维吾尔自治区,阿克苏地区,拜城县', '3', '842300', '0997', 'Baicheng', '81.8756400', '41.7980100');
INSERT INTO `sys_cn_area` VALUES ('652927', '乌什县', '乌什', '652900', null, '中国,新疆维吾尔自治区,阿克苏地区,乌什县', '3', '843400', '0997', 'Wushi', '79.2293700', '41.2156900');
INSERT INTO `sys_cn_area` VALUES ('652928', '阿瓦提县', '阿瓦提', '652900', null, '中国,新疆维吾尔自治区,阿克苏地区,阿瓦提县', '3', '843200', '0997', 'Awati', '80.3833600', '40.6392600');
INSERT INTO `sys_cn_area` VALUES ('652929', '柯坪县', '柯坪', '652900', null, '中国,新疆维吾尔自治区,阿克苏地区,柯坪县', '3', '843600', '0997', 'Keping', '79.0475100', '40.5058500');
INSERT INTO `sys_cn_area` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '克孜勒苏', '650000', null, '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州', '2', '845350', '0908', 'Kizilsu', '76.1728250', '39.7134310');
INSERT INTO `sys_cn_area` VALUES ('653001', '阿图什市', '阿图什', '653000', null, '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿图什市', '3', '845350', '0908', 'Atushi', '76.1682700', '39.7161500');
INSERT INTO `sys_cn_area` VALUES ('653022', '阿克陶县', '阿克陶', '653000', null, '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿克陶县', '3', '845550', '0908', 'Aketao', '75.9469200', '39.1489200');
INSERT INTO `sys_cn_area` VALUES ('653023', '阿合奇县', '阿合奇', '653000', null, '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿合奇县', '3', '843500', '0997', 'Aheqi', '78.4484800', '40.9394700');
INSERT INTO `sys_cn_area` VALUES ('653024', '乌恰县', '乌恰', '653000', null, '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,乌恰县', '3', '845450', '0908', 'Wuqia', '75.2583900', '39.7198400');
INSERT INTO `sys_cn_area` VALUES ('653100', '喀什地区', '喀什', '650000', null, '中国,新疆维吾尔自治区,喀什地区', '2', '844000', '0998', 'Kashgar', '75.9891380', '39.4676640');
INSERT INTO `sys_cn_area` VALUES ('653101', '喀什市', '喀什', '653100', null, '中国,新疆维吾尔自治区,喀什地区,喀什市', '3', '844000', '0998', 'Kashi', '75.9937900', '39.4676800');
INSERT INTO `sys_cn_area` VALUES ('653121', '疏附县', '疏附', '653100', null, '中国,新疆维吾尔自治区,喀什地区,疏附县', '3', '844100', '0998', 'Shufu', '75.8602900', '39.3753400');
INSERT INTO `sys_cn_area` VALUES ('653122', '疏勒县', '疏勒', '653100', null, '中国,新疆维吾尔自治区,喀什地区,疏勒县', '3', '844200', '0998', 'Shule', '76.0539800', '39.4062500');
INSERT INTO `sys_cn_area` VALUES ('653123', '英吉沙县', '英吉沙', '653100', null, '中国,新疆维吾尔自治区,喀什地区,英吉沙县', '3', '844500', '0998', 'Yingjisha', '76.1756500', '38.9296800');
INSERT INTO `sys_cn_area` VALUES ('653124', '泽普县', '泽普', '653100', null, '中国,新疆维吾尔自治区,喀什地区,泽普县', '3', '844800', '0998', 'Zepu', '77.2714500', '38.1893500');
INSERT INTO `sys_cn_area` VALUES ('653125', '莎车县', '莎车', '653100', null, '中国,新疆维吾尔自治区,喀什地区,莎车县', '3', '844700', '0998', 'Shache', '77.2431600', '38.4160100');
INSERT INTO `sys_cn_area` VALUES ('653126', '叶城县', '叶城', '653100', null, '中国,新疆维吾尔自治区,喀什地区,叶城县', '3', '844900', '0998', 'Yecheng', '77.4165900', '37.8832400');
INSERT INTO `sys_cn_area` VALUES ('653127', '麦盖提县', '麦盖提', '653100', null, '中国,新疆维吾尔自治区,喀什地区,麦盖提县', '3', '844600', '0998', 'Maigaiti', '77.6422400', '38.8966200');
INSERT INTO `sys_cn_area` VALUES ('653128', '岳普湖县', '岳普湖', '653100', null, '中国,新疆维吾尔自治区,喀什地区,岳普湖县', '3', '844400', '0998', 'Yuepuhu', '76.7723300', '39.2356100');
INSERT INTO `sys_cn_area` VALUES ('653129', '伽师县', '伽师', '653100', null, '中国,新疆维吾尔自治区,喀什地区,伽师县', '3', '844300', '0998', 'Jiashi', '76.7237200', '39.4880100');
INSERT INTO `sys_cn_area` VALUES ('653130', '巴楚县', '巴楚', '653100', null, '中国,新疆维吾尔自治区,喀什地区,巴楚县', '3', '843800', '0998', 'Bachu', '78.5488800', '39.7855000');
INSERT INTO `sys_cn_area` VALUES ('653131', '塔什库尔干塔吉克自治县', '塔什库尔干塔吉克', '653100', null, '中国,新疆维吾尔自治区,喀什地区,塔什库尔干塔吉克自治县', '3', '845250', '0998', 'Tashikuergantajike', '75.2319600', '37.7789300');
INSERT INTO `sys_cn_area` VALUES ('653200', '和田地区', '和田', '650000', null, '中国,新疆维吾尔自治区,和田地区', '2', '848000', '0903', 'Hotan', '79.9253300', '37.1106870');
INSERT INTO `sys_cn_area` VALUES ('653201', '和田市', '和田市', '653200', null, '中国,新疆维吾尔自治区,和田地区,和田市', '3', '848000', '0903', 'Hetianshi', '79.9135300', '37.1121400');
INSERT INTO `sys_cn_area` VALUES ('653221', '和田县', '和田县', '653200', null, '中国,新疆维吾尔自治区,和田地区,和田县', '3', '848000', '0903', 'Hetianxian', '79.8287400', '37.0892200');
INSERT INTO `sys_cn_area` VALUES ('653222', '墨玉县', '墨玉', '653200', null, '中国,新疆维吾尔自治区,和田地区,墨玉县', '3', '848100', '0903', 'Moyu', '79.7403500', '37.2724800');
INSERT INTO `sys_cn_area` VALUES ('653223', '皮山县', '皮山', '653200', null, '中国,新疆维吾尔自治区,和田地区,皮山县', '3', '845150', '0903', 'Pishan', '78.2812500', '37.6200700');
INSERT INTO `sys_cn_area` VALUES ('653224', '洛浦县', '洛浦', '653200', null, '中国,新疆维吾尔自治区,和田地区,洛浦县', '3', '848200', '0903', 'Luopu', '80.1853600', '37.0736400');
INSERT INTO `sys_cn_area` VALUES ('653225', '策勒县', '策勒', '653200', null, '中国,新疆维吾尔自治区,和田地区,策勒县', '3', '848300', '0903', 'Cele', '80.8099900', '36.9984300');
INSERT INTO `sys_cn_area` VALUES ('653226', '于田县', '于田', '653200', null, '中国,新疆维吾尔自治区,和田地区,于田县', '3', '848400', '0903', 'Yutian', '81.6671700', '36.8540000');
INSERT INTO `sys_cn_area` VALUES ('653227', '民丰县', '民丰', '653200', null, '中国,新疆维吾尔自治区,和田地区,民丰县', '3', '848500', '0903', 'Minfeng', '82.6844400', '37.0657700');
INSERT INTO `sys_cn_area` VALUES ('654000', '伊犁哈萨克自治州', '伊犁', '650000', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州', '2', '835100', '0999', 'Ili', '81.3179460', '43.9218600');
INSERT INTO `sys_cn_area` VALUES ('654002', '伊宁市', '伊宁', '654000', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,伊宁市', '3', '835000', '0999', 'Yining', '81.3293200', '43.9129400');
INSERT INTO `sys_cn_area` VALUES ('654003', '奎屯市', '奎屯', '654000', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,奎屯市', '3', '833200', '0992', 'Kuitun', '84.9022800', '44.4250000');
INSERT INTO `sys_cn_area` VALUES ('654004', '霍尔果斯市', '霍尔果斯', '654000', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,霍尔果斯市', '3', '835221', '0999', 'Huoerguosi', '80.4181890', '44.2057780');
INSERT INTO `sys_cn_area` VALUES ('654021', '伊宁县', '伊宁', '654000', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,伊宁县', '3', '835100', '0999', 'Yining', '81.5276400', '43.9786300');
INSERT INTO `sys_cn_area` VALUES ('654022', '察布查尔锡伯自治县', '察布查尔锡伯', '654000', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,察布查尔锡伯自治县', '3', '835300', '0999', 'Chabuchaerxibo', '81.1495600', '43.8402300');
INSERT INTO `sys_cn_area` VALUES ('654023', '霍城县', '霍城', '654000', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,霍城县', '3', '835200', '0999', 'Huocheng', '80.8782600', '44.0533000');
INSERT INTO `sys_cn_area` VALUES ('654024', '巩留县', '巩留', '654000', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,巩留县', '3', '835400', '0999', 'Gongliu', '82.2285100', '43.4842900');
INSERT INTO `sys_cn_area` VALUES ('654025', '新源县', '新源', '654000', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,新源县', '3', '835800', '0999', 'Xinyuan', '83.2609500', '43.4284000');
INSERT INTO `sys_cn_area` VALUES ('654026', '昭苏县', '昭苏', '654000', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,昭苏县', '3', '835600', '0999', 'Zhaosu', '81.1307000', '43.1582800');
INSERT INTO `sys_cn_area` VALUES ('654027', '特克斯县', '特克斯', '654000', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,特克斯县', '3', '835500', '0999', 'Tekesi', '81.8400500', '43.2193800');
INSERT INTO `sys_cn_area` VALUES ('654028', '尼勒克县', '尼勒克', '654000', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,尼勒克县', '3', '835700', '0999', 'Nileke', '82.5118400', '43.7990100');
INSERT INTO `sys_cn_area` VALUES ('654200', '塔城地区', '塔城', '650000', null, '中国,新疆维吾尔自治区,塔城地区', '2', '834700', '0901', 'Qoqek', '82.9857320', '46.7463010');
INSERT INTO `sys_cn_area` VALUES ('654201', '塔城市', '塔城', '654200', null, '中国,新疆维吾尔自治区,塔城地区,塔城市', '3', '834700', '0901', 'Tacheng', '82.9789200', '46.7485200');
INSERT INTO `sys_cn_area` VALUES ('654202', '乌苏市', '乌苏', '654200', null, '中国,新疆维吾尔自治区,塔城地区,乌苏市', '3', '833000', '0992', 'Wusu', '84.6825800', '44.4372900');
INSERT INTO `sys_cn_area` VALUES ('654221', '额敏县', '额敏', '654200', null, '中国,新疆维吾尔自治区,塔城地区,额敏县', '3', '834600', '0901', 'Emin', '83.6287200', '46.5284000');
INSERT INTO `sys_cn_area` VALUES ('654223', '沙湾县', '沙湾', '654200', null, '中国,新疆维吾尔自治区,塔城地区,沙湾县', '3', '832100', '0993', 'Shawan', '85.6193200', '44.3314400');
INSERT INTO `sys_cn_area` VALUES ('654224', '托里县', '托里', '654200', null, '中国,新疆维吾尔自治区,塔城地区,托里县', '3', '834500', '0901', 'Tuoli', '83.6059200', '45.9362300');
INSERT INTO `sys_cn_area` VALUES ('654225', '裕民县', '裕民', '654200', null, '中国,新疆维吾尔自治区,塔城地区,裕民县', '3', '834800', '0901', 'Yumin', '82.9900200', '46.2037700');
INSERT INTO `sys_cn_area` VALUES ('654226', '和布克赛尔蒙古自治县', '和布克赛尔', '654200', null, '中国,新疆维吾尔自治区,塔城地区,和布克赛尔蒙古自治县', '3', '834400', '0990', 'Hebukesaier', '85.7266200', '46.7936200');
INSERT INTO `sys_cn_area` VALUES ('654300', '阿勒泰地区', '阿勒泰', '650000', null, '中国,新疆维吾尔自治区,阿勒泰地区', '2', '836500', '0906', 'Altay', '88.1396300', '47.8483930');
INSERT INTO `sys_cn_area` VALUES ('654301', '阿勒泰市', '阿勒泰', '654300', null, '中国,新疆维吾尔自治区,阿勒泰地区,阿勒泰市', '3', '836500', '0906', 'Aletai', '88.1391300', '47.8317000');
INSERT INTO `sys_cn_area` VALUES ('654321', '布尔津县', '布尔津', '654300', null, '中国,新疆维吾尔自治区,阿勒泰地区,布尔津县', '3', '836600', '0906', 'Buerjin', '86.8575100', '47.7006200');
INSERT INTO `sys_cn_area` VALUES ('654322', '富蕴县', '富蕴', '654300', null, '中国,新疆维吾尔自治区,阿勒泰地区,富蕴县', '3', '836100', '0906', 'Fuyun', '89.5267900', '46.9944400');
INSERT INTO `sys_cn_area` VALUES ('654323', '福海县', '福海', '654300', null, '中国,新疆维吾尔自治区,阿勒泰地区,福海县', '3', '836400', '0906', 'Fuhai', '87.4950800', '47.1106500');
INSERT INTO `sys_cn_area` VALUES ('654324', '哈巴河县', '哈巴河', '654300', null, '中国,新疆维吾尔自治区,阿勒泰地区,哈巴河县', '3', '836700', '0906', 'Habahe', '86.4209200', '48.0604600');
INSERT INTO `sys_cn_area` VALUES ('654325', '青河县', '青河', '654300', null, '中国,新疆维吾尔自治区,阿勒泰地区,青河县', '3', '836200', '0906', 'Qinghe', '90.3830500', '46.6738200');
INSERT INTO `sys_cn_area` VALUES ('654326', '吉木乃县', '吉木乃', '654300', null, '中国,新疆维吾尔自治区,阿勒泰地区,吉木乃县', '3', '836800', '0906', 'Jimunai', '85.8781400', '47.4335900');
INSERT INTO `sys_cn_area` VALUES ('659000', '直辖县级', ' ', '650000', null, '中国,新疆维吾尔自治区,直辖县级', '2', null, '', '', '91.1322120', '29.6603610');
INSERT INTO `sys_cn_area` VALUES ('659001', '石河子市', '石河子', '659000', null, '中国,新疆维吾尔自治区,直辖县级,石河子市', '3', '832000', '0993', 'Shihezi', '86.0410750', '44.3058860');
INSERT INTO `sys_cn_area` VALUES ('659002', '阿拉尔市', '阿拉尔', '659000', null, '中国,新疆维吾尔自治区,直辖县级,阿拉尔市', '3', '843300', '0997', 'Aral', '81.2858840', '40.5419140');
INSERT INTO `sys_cn_area` VALUES ('659003', '图木舒克市', '图木舒克', '659000', null, '中国,新疆维吾尔自治区,直辖县级,图木舒克市', '3', '843806', '0998', 'Tumxuk', '79.0779780', '39.8673160');
INSERT INTO `sys_cn_area` VALUES ('659004', '五家渠市', '五家渠', '659000', null, '中国,新疆维吾尔自治区,直辖县级,五家渠市', '3', '831300', '0994', 'Wujiaqu', '87.5268840', '44.1674010');
INSERT INTO `sys_cn_area` VALUES ('659005', '北屯市', '北屯', '659000', null, '中国,新疆维吾尔自治区,直辖县级,北屯市', '3', '836000', '0906', 'Beitun', '87.8084560', '47.3623080');
INSERT INTO `sys_cn_area` VALUES ('659006', '铁门关市', '铁门关', '659000', null, '中国,新疆维吾尔自治区,直辖县级,铁门关市', '3', '836000', '0906', 'Tiemenguan', '86.1946870', '41.8110070');
INSERT INTO `sys_cn_area` VALUES ('659007', '双河市', '双河', '659000', null, '中国,新疆维吾尔自治区,直辖县级,双河市', '3', '833408', '0909', 'Shuanghe', '91.1322120', '29.6603610');
INSERT INTO `sys_cn_area` VALUES ('710000', '台湾', '台湾', '100000', null, '中国,台湾', '1', null, '', 'Taiwan', '121.5090620', '25.0443320');
INSERT INTO `sys_cn_area` VALUES ('710100', '台北市', '台北', '710000', null, '中国,台湾,台北市', '2', '1', '02', 'Taipei', '121.5651700', '25.0377980');
INSERT INTO `sys_cn_area` VALUES ('710101', '松山区', '松山', '710100', null, '中国,台湾,台北市,松山区', '3', '105', '02', 'Songshan', '121.5772060', '25.0496980');
INSERT INTO `sys_cn_area` VALUES ('710102', '信义区', '信义', '710100', null, '中国,台湾,台北市,信义区', '3', '110', '02', 'Xinyi', '121.7513810', '25.1294070');
INSERT INTO `sys_cn_area` VALUES ('710103', '大安区', '大安', '710100', null, '中国,台湾,台北市,大安区', '3', '106', '02', 'Da\'an', '121.5346480', '25.0264060');
INSERT INTO `sys_cn_area` VALUES ('710104', '中山区', '中山', '710100', null, '中国,台湾,台北市,中山区', '3', '104', '02', 'Zhongshan', '121.5334680', '25.0643610');
INSERT INTO `sys_cn_area` VALUES ('710105', '中正区', '中正', '710100', null, '中国,台湾,台北市,中正区', '3', '100', '02', 'Zhongzheng', '121.5182670', '25.0323610');
INSERT INTO `sys_cn_area` VALUES ('710106', '大同区', '大同', '710100', null, '中国,台湾,台北市,大同区', '3', '103', '02', 'Datong', '121.5155140', '25.0659860');
INSERT INTO `sys_cn_area` VALUES ('710107', '万华区', '万华', '710100', null, '中国,台湾,台北市,万华区', '3', '108', '02', 'Wanhua', '121.4993320', '25.0319330');
INSERT INTO `sys_cn_area` VALUES ('710108', '文山区', '文山', '710100', null, '中国,台湾,台北市,文山区', '3', '116', '02', 'Wenshan', '121.5704580', '24.9897860');
INSERT INTO `sys_cn_area` VALUES ('710109', '南港区', '南港', '710100', null, '中国,台湾,台北市,南港区', '3', '115', '02', 'Nangang', '121.6068580', '25.0546560');
INSERT INTO `sys_cn_area` VALUES ('710110', '内湖区', '内湖', '710100', null, '中国,台湾,台北市,内湖区', '3', '114', '02', 'Nahu', '121.5889980', '25.0696640');
INSERT INTO `sys_cn_area` VALUES ('710111', '士林区', '士林', '710100', null, '中国,台湾,台北市,士林区', '3', '111', '02', 'Shilin', '121.5198740', '25.0928220');
INSERT INTO `sys_cn_area` VALUES ('710112', '北投区', '北投', '710100', null, '中国,台湾,台北市,北投区', '3', '112', '02', 'Beitou', '121.5013790', '25.1324190');
INSERT INTO `sys_cn_area` VALUES ('710200', '高雄市', '高雄', '710000', null, '中国,台湾,高雄市', '2', '8', '07', 'Kaohsiung', '120.3119220', '22.6208560');
INSERT INTO `sys_cn_area` VALUES ('710201', '盐埕区', '盐埕', '710200', null, '中国,台湾,高雄市,盐埕区', '3', '803', '07', 'Yancheng', '120.2867950', '22.6246660');
INSERT INTO `sys_cn_area` VALUES ('710202', '鼓山区', '鼓山', '710200', null, '中国,台湾,高雄市,鼓山区', '3', '804', '07', 'Gushan', '120.2811540', '22.6367970');
INSERT INTO `sys_cn_area` VALUES ('710203', '左营区', '左营', '710200', null, '中国,台湾,高雄市,左营区', '3', '813', '07', 'Zuoying', '120.2949580', '22.6901240');
INSERT INTO `sys_cn_area` VALUES ('710204', '楠梓区', '楠梓', '710200', null, '中国,台湾,高雄市,楠梓区', '3', '811', '07', 'Nanzi', '120.3263140', '22.7284010');
INSERT INTO `sys_cn_area` VALUES ('710205', '三民区', '三民', '710200', null, '中国,台湾,高雄市,三民区', '3', '807', '07', 'Sanmin', '120.2996220', '22.6476950');
INSERT INTO `sys_cn_area` VALUES ('710206', '新兴区', '新兴', '710200', null, '中国,台湾,高雄市,新兴区', '3', '800', '07', 'Xinxing', '120.3095350', '22.6311470');
INSERT INTO `sys_cn_area` VALUES ('710207', '前金区', '前金', '710200', null, '中国,台湾,高雄市,前金区', '3', '801', '07', 'Qianjin', '120.2941590', '22.6274210');
INSERT INTO `sys_cn_area` VALUES ('710208', '苓雅区', '苓雅', '710200', null, '中国,台湾,高雄市,苓雅区', '3', '802', '07', 'Lingya', '120.3123470', '22.6217700');
INSERT INTO `sys_cn_area` VALUES ('710209', '前镇区', '前镇', '710200', null, '中国,台湾,高雄市,前镇区', '3', '806', '07', 'Qianzhen', '120.3185830', '22.5864250');
INSERT INTO `sys_cn_area` VALUES ('710210', '旗津区', '旗津', '710200', null, '中国,台湾,高雄市,旗津区', '3', '805', '07', 'Qijin', '120.2844290', '22.5905650');
INSERT INTO `sys_cn_area` VALUES ('710211', '小港区', '小港', '710200', null, '中国,台湾,高雄市,小港区', '3', '812', '07', 'Xiaogang', '120.3379700', '22.5653540');
INSERT INTO `sys_cn_area` VALUES ('710212', '凤山区', '凤山', '710200', null, '中国,台湾,高雄市,凤山区', '3', '830', '07', 'Fengshan', '120.3568920', '22.6269450');
INSERT INTO `sys_cn_area` VALUES ('710213', '林园区', '林园', '710200', null, '中国,台湾,高雄市,林园区', '3', '832', '07', 'Linyuan', '120.3959770', '22.5014900');
INSERT INTO `sys_cn_area` VALUES ('710214', '大寮区', '大寮', '710200', null, '中国,台湾,高雄市,大寮区', '3', '831', '07', 'Daliao', '120.3954220', '22.6053860');
INSERT INTO `sys_cn_area` VALUES ('710215', '大树区', '大树', '710200', null, '中国,台湾,高雄市,大树区', '3', '840', '07', 'Dashu', '120.4330950', '22.6933940');
INSERT INTO `sys_cn_area` VALUES ('710216', '大社区', '大社', '710200', null, '中国,台湾,高雄市,大社区', '3', '815', '07', 'Dashe', '120.3466350', '22.7299660');
INSERT INTO `sys_cn_area` VALUES ('710217', '仁武区', '仁武', '710200', null, '中国,台湾,高雄市,仁武区', '3', '814', '07', 'Renwu', '120.3477790', '22.7019010');
INSERT INTO `sys_cn_area` VALUES ('710218', '鸟松区', '鸟松', '710200', null, '中国,台湾,高雄市,鸟松区', '3', '833', '07', 'Niaosong', '120.3644020', '22.6593400');
INSERT INTO `sys_cn_area` VALUES ('710219', '冈山区', '冈山', '710200', null, '中国,台湾,高雄市,冈山区', '3', '820', '07', 'Gangshan', '120.2958200', '22.7967620');
INSERT INTO `sys_cn_area` VALUES ('710220', '桥头区', '桥头', '710200', null, '中国,台湾,高雄市,桥头区', '3', '825', '07', 'Qiaotou', '120.3057410', '22.7575010');
INSERT INTO `sys_cn_area` VALUES ('710221', '燕巢区', '燕巢', '710200', null, '中国,台湾,高雄市,燕巢区', '3', '824', '07', 'Yanchao', '120.3619560', '22.7933700');
INSERT INTO `sys_cn_area` VALUES ('710222', '田寮区', '田寮', '710200', null, '中国,台湾,高雄市,田寮区', '3', '823', '07', 'Tianliao', '120.3596360', '22.8693070');
INSERT INTO `sys_cn_area` VALUES ('710223', '阿莲区', '阿莲', '710200', null, '中国,台湾,高雄市,阿莲区', '3', '822', '07', 'Alian', '120.3270360', '22.8837030');
INSERT INTO `sys_cn_area` VALUES ('710224', '路竹区', '路竹', '710200', null, '中国,台湾,高雄市,路竹区', '3', '821', '07', 'Luzhu', '120.2618280', '22.8568510');
INSERT INTO `sys_cn_area` VALUES ('710225', '湖内区', '湖内', '710200', null, '中国,台湾,高雄市,湖内区', '3', '829', '07', 'Huna', '120.2115300', '22.9081880');
INSERT INTO `sys_cn_area` VALUES ('710226', '茄萣区', '茄萣', '710200', null, '中国,台湾,高雄市,茄萣区', '3', '852', '07', 'Qieding', '120.1828150', '22.9065560');
INSERT INTO `sys_cn_area` VALUES ('710227', '永安区', '永安', '710200', null, '中国,台湾,高雄市,永安区', '3', '828', '07', 'Yong\'an', '120.2253080', '22.8185800');
INSERT INTO `sys_cn_area` VALUES ('710228', '弥陀区', '弥陀', '710200', null, '中国,台湾,高雄市,弥陀区', '3', '827', '07', 'Mituo', '120.2473440', '22.7828790');
INSERT INTO `sys_cn_area` VALUES ('710229', '梓官区', '梓官', '710200', null, '中国,台湾,高雄市,梓官区', '3', '826', '07', 'Ziguan', '120.2673220', '22.7604750');
INSERT INTO `sys_cn_area` VALUES ('710230', '旗山区', '旗山', '710200', null, '中国,台湾,高雄市,旗山区', '3', '842', '07', 'Qishan', '120.4835500', '22.8884910');
INSERT INTO `sys_cn_area` VALUES ('710231', '美浓区', '美浓', '710200', null, '中国,台湾,高雄市,美浓区', '3', '843', '07', 'Meinong', '120.5415300', '22.8978800');
INSERT INTO `sys_cn_area` VALUES ('710232', '六龟区', '六龟', '710200', null, '中国,台湾,高雄市,六龟区', '3', '844', '07', 'Liugui', '120.6334180', '22.9979140');
INSERT INTO `sys_cn_area` VALUES ('710233', '甲仙区', '甲仙', '710200', null, '中国,台湾,高雄市,甲仙区', '3', '847', '07', 'Jiaxian', '120.5911850', '23.0846880');
INSERT INTO `sys_cn_area` VALUES ('710234', '杉林区', '杉林', '710200', null, '中国,台湾,高雄市,杉林区', '3', '846', '07', 'Shanlin', '120.5389800', '22.9707120');
INSERT INTO `sys_cn_area` VALUES ('710235', '内门区', '内门', '710200', null, '中国,台湾,高雄市,内门区', '3', '845', '07', 'Namen', '120.4623510', '22.9434370');
INSERT INTO `sys_cn_area` VALUES ('710236', '茂林区', '茂林', '710200', null, '中国,台湾,高雄市,茂林区', '3', '851', '07', 'Maolin', '120.6632170', '22.8862480');
INSERT INTO `sys_cn_area` VALUES ('710237', '桃源区', '桃源', '710200', null, '中国,台湾,高雄市,桃源区', '3', '848', '07', 'Taoyuan', '120.7600490', '23.1591370');
INSERT INTO `sys_cn_area` VALUES ('710238', '那玛夏区', '那玛夏', '710200', null, '中国,台湾,高雄市,那玛夏区', '3', '849', '07', 'Namaxia', '120.6927990', '23.2169640');
INSERT INTO `sys_cn_area` VALUES ('710300', '基隆市', '基隆', '710000', null, '中国,台湾,基隆市', '2', '2', '02', 'Keelung', '121.7462480', '25.1307410');
INSERT INTO `sys_cn_area` VALUES ('710301', '中正区', '中正', '710300', null, '中国,台湾,基隆市,中正区', '3', '202', '02', 'Zhongzheng', '121.5182670', '25.0323610');
INSERT INTO `sys_cn_area` VALUES ('710302', '七堵区', '七堵', '710300', null, '中国,台湾,基隆市,七堵区', '3', '206', '02', 'Qidu', '121.7130320', '25.0957390');
INSERT INTO `sys_cn_area` VALUES ('710303', '暖暖区', '暖暖', '710300', null, '中国,台湾,基隆市,暖暖区', '3', '205', '02', 'Nuannuan', '121.7361020', '25.0997770');
INSERT INTO `sys_cn_area` VALUES ('710304', '仁爱区', '仁爱', '710300', null, '中国,台湾,基隆市,仁爱区', '3', '200', '02', 'Renai', '121.7409400', '25.1275260');
INSERT INTO `sys_cn_area` VALUES ('710305', '中山区', '中山', '710300', null, '中国,台湾,基隆市,中山区', '3', '203', '02', 'Zhongshan', '121.7391320', '25.1339910');
INSERT INTO `sys_cn_area` VALUES ('710306', '安乐区', '安乐', '710300', null, '中国,台湾,基隆市,安乐区', '3', '204', '02', 'Anle', '121.7232030', '25.1209100');
INSERT INTO `sys_cn_area` VALUES ('710307', '信义区', '信义', '710300', null, '中国,台湾,基隆市,信义区', '3', '201', '02', 'Xinyi', '121.7513810', '25.1294070');
INSERT INTO `sys_cn_area` VALUES ('710400', '台中市', '台中', '710000', null, '中国,台湾,台中市', '2', '4', '04', 'Taichung', '120.6790400', '24.1386200');
INSERT INTO `sys_cn_area` VALUES ('710401', '中区', '中区', '710400', null, '中国,台湾,台中市,中区', '3', '400', '04', 'Zhongqu', '120.6795100', '24.1438300');
INSERT INTO `sys_cn_area` VALUES ('710402', '东区', '东区', '710400', null, '中国,台湾,台中市,东区', '3', '401', '04', 'Dongqu', '120.7040000', '24.1366200');
INSERT INTO `sys_cn_area` VALUES ('710403', '南区', '南区', '710400', null, '中国,台湾,台中市,南区', '3', '402', '04', 'Nanqu', '120.1886480', '22.9609440');
INSERT INTO `sys_cn_area` VALUES ('710404', '西区', '西区', '710400', null, '中国,台湾,台中市,西区', '3', '403', '04', 'Xiqu', '120.6710400', '24.1413800');
INSERT INTO `sys_cn_area` VALUES ('710405', '北区', '北区', '710400', null, '中国,台湾,台中市,北区', '3', '404', '04', 'Beiqu', '120.6824100', '24.1660400');
INSERT INTO `sys_cn_area` VALUES ('710406', '西屯区', '西屯', '710400', null, '中国,台湾,台中市,西屯区', '3', '407', '04', 'Xitun', '120.6398200', '24.1813400');
INSERT INTO `sys_cn_area` VALUES ('710407', '南屯区', '南屯', '710400', null, '中国,台湾,台中市,南屯区', '3', '408', '04', 'Nantun', '120.6430800', '24.1382700');
INSERT INTO `sys_cn_area` VALUES ('710408', '北屯区', '北屯', '710400', null, '中国,台湾,台中市,北屯区', '3', '406', '04', 'Beitun', '120.6862500', '24.1822200');
INSERT INTO `sys_cn_area` VALUES ('710409', '丰原区', '丰原', '710400', null, '中国,台湾,台中市,丰原区', '3', '420', '04', 'Fengyuan', '120.7184600', '24.2421900');
INSERT INTO `sys_cn_area` VALUES ('710410', '东势区', '东势', '710400', null, '中国,台湾,台中市,东势区', '3', '423', '04', 'Dongshi', '120.8277700', '24.2586100');
INSERT INTO `sys_cn_area` VALUES ('710411', '大甲区', '大甲', '710400', null, '中国,台湾,台中市,大甲区', '3', '437', '04', 'Dajia', '120.6223900', '24.3489200');
INSERT INTO `sys_cn_area` VALUES ('710412', '清水区', '清水', '710400', null, '中国,台湾,台中市,清水区', '3', '436', '04', 'Qingshui', '120.5597800', '24.2686500');
INSERT INTO `sys_cn_area` VALUES ('710413', '沙鹿区', '沙鹿', '710400', null, '中国,台湾,台中市,沙鹿区', '3', '433', '04', 'Shalu', '120.5657000', '24.2334800');
INSERT INTO `sys_cn_area` VALUES ('710414', '梧栖区', '梧栖', '710400', null, '中国,台湾,台中市,梧栖区', '3', '435', '04', 'Wuqi', '120.5315200', '24.2549600');
INSERT INTO `sys_cn_area` VALUES ('710415', '后里区', '后里', '710400', null, '中国,台湾,台中市,后里区', '3', '421', '04', 'Houli', '120.7107100', '24.3049100');
INSERT INTO `sys_cn_area` VALUES ('710416', '神冈区', '神冈', '710400', null, '中国,台湾,台中市,神冈区', '3', '429', '04', 'Shengang', '120.6615500', '24.2577700');
INSERT INTO `sys_cn_area` VALUES ('710417', '潭子区', '潭子', '710400', null, '中国,台湾,台中市,潭子区', '3', '427', '04', 'Tanzi', '120.7051600', '24.2095300');
INSERT INTO `sys_cn_area` VALUES ('710418', '大雅区', '大雅', '710400', null, '中国,台湾,台中市,大雅区', '3', '428', '04', 'Daya', '120.6477800', '24.2292300');
INSERT INTO `sys_cn_area` VALUES ('710419', '新社区', '新社', '710400', null, '中国,台湾,台中市,新社区', '3', '426', '04', 'Xinshe', '120.8095000', '24.2341400');
INSERT INTO `sys_cn_area` VALUES ('710420', '石冈区', '石冈', '710400', null, '中国,台湾,台中市,石冈区', '3', '422', '04', 'Shigang', '120.7804100', '24.2749800');
INSERT INTO `sys_cn_area` VALUES ('710421', '外埔区', '外埔', '710400', null, '中国,台湾,台中市,外埔区', '3', '438', '04', 'Waipu', '120.6543700', '24.3320100');
INSERT INTO `sys_cn_area` VALUES ('710422', '大安区', '大安', '710400', null, '中国,台湾,台中市,大安区', '3', '439', '04', 'Da\'an', '120.5865200', '24.3460700');
INSERT INTO `sys_cn_area` VALUES ('710423', '乌日区', '乌日', '710400', null, '中国,台湾,台中市,乌日区', '3', '414', '04', 'Wuri', '120.6238100', '24.1045000');
INSERT INTO `sys_cn_area` VALUES ('710424', '大肚区', '大肚', '710400', null, '中国,台湾,台中市,大肚区', '3', '432', '04', 'Dadu', '120.5409600', '24.1536600');
INSERT INTO `sys_cn_area` VALUES ('710425', '龙井区', '龙井', '710400', null, '中国,台湾,台中市,龙井区', '3', '434', '04', 'Longjing', '120.5459400', '24.1927100');
INSERT INTO `sys_cn_area` VALUES ('710426', '雾峰区', '雾峰', '710400', null, '中国,台湾,台中市,雾峰区', '3', '413', '04', 'Wufeng', '120.7002000', '24.0615200');
INSERT INTO `sys_cn_area` VALUES ('710427', '太平区', '太平', '710400', null, '中国,台湾,台中市,太平区', '3', '411', '04', 'Taiping', '120.7185230', '24.1264720');
INSERT INTO `sys_cn_area` VALUES ('710428', '大里区', '大里', '710400', null, '中国,台湾,台中市,大里区', '3', '412', '04', 'Dali', '120.6778600', '24.0993900');
INSERT INTO `sys_cn_area` VALUES ('710429', '和平区', '和平', '710400', null, '中国,台湾,台中市,和平区', '3', '424', '04', 'Heping', '120.8834900', '24.1747700');
INSERT INTO `sys_cn_area` VALUES ('710500', '台南市', '台南', '710000', null, '中国,台湾,台南市', '2', '7', '06', 'Tainan', '120.2793630', '23.1724780');
INSERT INTO `sys_cn_area` VALUES ('710501', '东区', '东区', '710500', null, '中国,台湾,台南市,东区', '3', '701', '06', 'Dongqu', '120.2241980', '22.9800720');
INSERT INTO `sys_cn_area` VALUES ('710502', '南区', '南区', '710500', null, '中国,台湾,台南市,南区', '3', '702', '06', 'Nanqu', '120.1886480', '22.9609440');
INSERT INTO `sys_cn_area` VALUES ('710504', '北区', '北区', '710500', null, '中国,台湾,台南市,北区', '3', '704', '06', 'Beiqu', '120.6824100', '24.1660400');
INSERT INTO `sys_cn_area` VALUES ('710506', '安南区', '安南', '710500', null, '中国,台湾,台南市,安南区', '3', '709', '06', 'Annan', '120.1846170', '23.0472300');
INSERT INTO `sys_cn_area` VALUES ('710507', '安平区', '安平', '710500', null, '中国,台湾,台南市,安平区', '3', '708', '06', 'Anping', '120.1668100', '23.0007630');
INSERT INTO `sys_cn_area` VALUES ('710508', '中西区', '中西', '710500', null, '中国,台湾,台南市,中西区', '3', '700', '06', 'Zhongxi', '120.2059570', '22.9921520');
INSERT INTO `sys_cn_area` VALUES ('710509', '新营区', '新营', '710500', null, '中国,台湾,台南市,新营区', '3', '730', '06', 'Xinying', '120.3166980', '23.3102740');
INSERT INTO `sys_cn_area` VALUES ('710510', '盐水区', '盐水', '710500', null, '中国,台湾,台南市,盐水区', '3', '737', '06', 'Yanshui', '120.2663980', '23.3198280');
INSERT INTO `sys_cn_area` VALUES ('710511', '白河区', '白河', '710500', null, '中国,台湾,台南市,白河区', '3', '732', '06', 'Baihe', '120.4158100', '23.3512210');
INSERT INTO `sys_cn_area` VALUES ('710512', '柳营区', '柳营', '710500', null, '中国,台湾,台南市,柳营区', '3', '736', '06', 'Liuying', '120.3112860', '23.2781330');
INSERT INTO `sys_cn_area` VALUES ('710513', '后壁区', '后壁', '710500', null, '中国,台湾,台南市,后壁区', '3', '731', '06', 'Houbi', '120.3627260', '23.3667210');
INSERT INTO `sys_cn_area` VALUES ('710514', '东山区', '东山', '710500', null, '中国,台湾,台南市,东山区', '3', '733', '06', 'Dongshan', '120.4039840', '23.3260920');
INSERT INTO `sys_cn_area` VALUES ('710515', '麻豆区', '麻豆', '710500', null, '中国,台湾,台南市,麻豆区', '3', '721', '06', 'Madou', '120.2481790', '23.1816800');
INSERT INTO `sys_cn_area` VALUES ('710516', '下营区', '下营', '710500', null, '中国,台湾,台南市,下营区', '3', '735', '06', 'Xiaying', '120.2644840', '23.2354130');
INSERT INTO `sys_cn_area` VALUES ('710517', '六甲区', '六甲', '710500', null, '中国,台湾,台南市,六甲区', '3', '734', '06', 'Liujia', '120.3476000', '23.2319310');
INSERT INTO `sys_cn_area` VALUES ('710518', '官田区', '官田', '710500', null, '中国,台湾,台南市,官田区', '3', '720', '06', 'Guantian', '120.3143740', '23.1946520');
INSERT INTO `sys_cn_area` VALUES ('710519', '大内区', '大内', '710500', null, '中国,台湾,台南市,大内区', '3', '742', '06', 'Dana', '120.3488530', '23.1194600');
INSERT INTO `sys_cn_area` VALUES ('710520', '佳里区', '佳里', '710500', null, '中国,台湾,台南市,佳里区', '3', '722', '06', 'Jiali', '120.1772110', '23.1651210');
INSERT INTO `sys_cn_area` VALUES ('710521', '学甲区', '学甲', '710500', null, '中国,台湾,台南市,学甲区', '3', '726', '06', 'Xuejia', '120.1802550', '23.2323480');
INSERT INTO `sys_cn_area` VALUES ('710522', '西港区', '西港', '710500', null, '中国,台湾,台南市,西港区', '3', '723', '06', 'Xigang', '120.2036180', '23.1230570');
INSERT INTO `sys_cn_area` VALUES ('710523', '七股区', '七股', '710500', null, '中国,台湾,台南市,七股区', '3', '724', '06', 'Qigu', '120.1400030', '23.1405450');
INSERT INTO `sys_cn_area` VALUES ('710524', '将军区', '将军', '710500', null, '中国,台湾,台南市,将军区', '3', '725', '06', 'Jiangjun', '120.1568710', '23.1995430');
INSERT INTO `sys_cn_area` VALUES ('710525', '北门区', '北门', '710500', null, '中国,台湾,台南市,北门区', '3', '727', '06', 'Beimen', '120.1258210', '23.2671480');
INSERT INTO `sys_cn_area` VALUES ('710526', '新化区', '新化', '710500', null, '中国,台湾,台南市,新化区', '3', '712', '06', 'Xinhua', '120.3108070', '23.0385330');
INSERT INTO `sys_cn_area` VALUES ('710527', '善化区', '善化', '710500', null, '中国,台湾,台南市,善化区', '3', '741', '06', 'Shanhua', '120.2968950', '23.1322610');
INSERT INTO `sys_cn_area` VALUES ('710528', '新市区', '新市', '710500', null, '中国,台湾,台南市,新市区', '3', '744', '06', 'Xinshi', '120.2951380', '23.0789700');
INSERT INTO `sys_cn_area` VALUES ('710529', '安定区', '安定', '710500', null, '中国,台湾,台南市,安定区', '3', '745', '06', 'Anding', '120.2370830', '23.1214980');
INSERT INTO `sys_cn_area` VALUES ('710530', '山上区', '山上', '710500', null, '中国,台湾,台南市,山上区', '3', '743', '06', 'Shanshang', '120.3529080', '23.1032230');
INSERT INTO `sys_cn_area` VALUES ('710531', '玉井区', '玉井', '710500', null, '中国,台湾,台南市,玉井区', '3', '714', '06', 'Yujing', '120.4601100', '23.1238590');
INSERT INTO `sys_cn_area` VALUES ('710532', '楠西区', '楠西', '710500', null, '中国,台湾,台南市,楠西区', '3', '715', '06', 'Nanxi', '120.4853960', '23.1734540');
INSERT INTO `sys_cn_area` VALUES ('710533', '南化区', '南化', '710500', null, '中国,台湾,台南市,南化区', '3', '716', '06', 'Nanhua', '120.4771160', '23.0426140');
INSERT INTO `sys_cn_area` VALUES ('710534', '左镇区', '左镇', '710500', null, '中国,台湾,台南市,左镇区', '3', '713', '06', 'Zuozhen', '120.4073090', '23.0579550');
INSERT INTO `sys_cn_area` VALUES ('710535', '仁德区', '仁德', '710500', null, '中国,台湾,台南市,仁德区', '3', '717', '06', 'Rende', '120.2515200', '22.9722120');
INSERT INTO `sys_cn_area` VALUES ('710536', '归仁区', '归仁', '710500', null, '中国,台湾,台南市,归仁区', '3', '711', '06', 'Guiren', '120.2937910', '22.9670810');
INSERT INTO `sys_cn_area` VALUES ('710537', '关庙区', '关庙', '710500', null, '中国,台湾,台南市,关庙区', '3', '718', '06', 'Guanmiao', '120.3276890', '22.9629490');
INSERT INTO `sys_cn_area` VALUES ('710538', '龙崎区', '龙崎', '710500', null, '中国,台湾,台南市,龙崎区', '3', '719', '06', 'Longqi', '120.3608240', '22.9656810');
INSERT INTO `sys_cn_area` VALUES ('710539', '永康区', '永康', '710500', null, '中国,台湾,台南市,永康区', '3', '710', '06', 'Yongkang', '120.2570690', '23.0260610');
INSERT INTO `sys_cn_area` VALUES ('710600', '新竹市', '新竹', '710000', null, '中国,台湾,新竹市', '2', '3', '03', 'Hsinchu', '120.9687980', '24.8067380');
INSERT INTO `sys_cn_area` VALUES ('710601', '东区', '东区', '710600', null, '中国,台湾,新竹市,东区', '3', '300', '03', 'Dongqu', '120.9702390', '24.8013370');
INSERT INTO `sys_cn_area` VALUES ('710602', '北区', '北区', '710600', null, '中国,台湾,新竹市,北区', '3', null, '03', 'Beiqu', '120.6824100', '24.1660400');
INSERT INTO `sys_cn_area` VALUES ('710603', '香山区', '香山', '710600', null, '中国,台湾,新竹市,香山区', '3', null, '03', 'Xiangshan', '120.9566790', '24.7689330');
INSERT INTO `sys_cn_area` VALUES ('710700', '嘉义市', '嘉义', '710000', null, '中国,台湾,嘉义市', '2', '6', '05', 'Chiayi', '120.4525380', '23.4815680');
INSERT INTO `sys_cn_area` VALUES ('710701', '东区', '东区', '710700', null, '中国,台湾,嘉义市,东区', '3', '600', '05', 'Dongqu', '120.4580090', '23.4862130');
INSERT INTO `sys_cn_area` VALUES ('710702', '西区', '西区', '710700', null, '中国,台湾,嘉义市,西区', '3', '600', '05', 'Xiqu', '120.4374930', '23.4730290');
INSERT INTO `sys_cn_area` VALUES ('710800', '新北市', '新北', '710000', null, '中国,台湾,新北市', '2', '2', '02', 'New Taipei', '121.4657460', '25.0123660');
INSERT INTO `sys_cn_area` VALUES ('710801', '板桥区', '板桥', '710800', null, '中国,台湾,新北市,板桥区', '3', '220', '02', 'Banqiao', '121.4590840', '25.0095780');
INSERT INTO `sys_cn_area` VALUES ('710802', '三重区', '三重', '710800', null, '中国,台湾,新北市,三重区', '3', '241', '02', 'Sanzhong', '121.4881020', '25.0614860');
INSERT INTO `sys_cn_area` VALUES ('710803', '中和区', '中和', '710800', null, '中国,台湾,新北市,中和区', '3', '235', '02', 'Zhonghe', '121.4989800', '24.9993970');
INSERT INTO `sys_cn_area` VALUES ('710804', '永和区', '永和', '710800', null, '中国,台湾,新北市,永和区', '3', '234', '02', 'Yonghe', '121.5136600', '25.0078020');
INSERT INTO `sys_cn_area` VALUES ('710805', '新庄区', '新庄', '710800', null, '中国,台湾,新北市,新庄区', '3', '242', '02', 'Xinzhuang', '121.4504130', '25.0359470');
INSERT INTO `sys_cn_area` VALUES ('710806', '新店区', '新店', '710800', null, '中国,台湾,新北市,新店区', '3', '231', '02', 'Xindian', '121.5417500', '24.9675580');
INSERT INTO `sys_cn_area` VALUES ('710807', '树林区', '树林', '710800', null, '中国,台湾,新北市,树林区', '3', '238', '02', 'Shulin', '121.4205330', '24.9907060');
INSERT INTO `sys_cn_area` VALUES ('710808', '莺歌区', '莺歌', '710800', null, '中国,台湾,新北市,莺歌区', '3', '239', '02', 'Yingge', '121.3545730', '24.9554130');
INSERT INTO `sys_cn_area` VALUES ('710809', '三峡区', '三峡', '710800', null, '中国,台湾,新北市,三峡区', '3', '237', '02', 'Sanxia', '121.3689050', '24.9343390');
INSERT INTO `sys_cn_area` VALUES ('710810', '淡水区', '淡水', '710800', null, '中国,台湾,新北市,淡水区', '3', '251', '02', 'Danshui', '121.4409150', '25.1694520');
INSERT INTO `sys_cn_area` VALUES ('710811', '汐止区', '汐止', '710800', null, '中国,台湾,新北市,汐止区', '3', '221', '02', 'Xizhi', '121.6294700', '25.0629990');
INSERT INTO `sys_cn_area` VALUES ('710812', '瑞芳区', '瑞芳', '710800', null, '中国,台湾,新北市,瑞芳区', '3', '224', '02', 'Ruifang', '121.8100610', '25.1088950');
INSERT INTO `sys_cn_area` VALUES ('710813', '土城区', '土城', '710800', null, '中国,台湾,新北市,土城区', '3', '236', '02', 'Tucheng', '121.4433480', '24.9722010');
INSERT INTO `sys_cn_area` VALUES ('710814', '芦洲区', '芦洲', '710800', null, '中国,台湾,新北市,芦洲区', '3', '247', '02', 'Luzhou', '121.4737000', '25.0849230');
INSERT INTO `sys_cn_area` VALUES ('710815', '五股区', '五股', '710800', null, '中国,台湾,新北市,五股区', '3', '248', '02', 'Wugu', '121.4381560', '25.0827430');
INSERT INTO `sys_cn_area` VALUES ('710816', '泰山区', '泰山', '710800', null, '中国,台湾,新北市,泰山区', '3', '243', '02', 'Taishan', '121.4308110', '25.0588640');
INSERT INTO `sys_cn_area` VALUES ('710817', '林口区', '林口', '710800', null, '中国,台湾,新北市,林口区', '3', '244', '02', 'Linkou', '121.3916020', '25.0775310');
INSERT INTO `sys_cn_area` VALUES ('710818', '深坑区', '深坑', '710800', null, '中国,台湾,新北市,深坑区', '3', '222', '02', 'Shenkeng', '121.6156700', '25.0023290');
INSERT INTO `sys_cn_area` VALUES ('710819', '石碇区', '石碇', '710800', null, '中国,台湾,新北市,石碇区', '3', '223', '02', 'Shiding', '121.6585670', '24.9916790');
INSERT INTO `sys_cn_area` VALUES ('710820', '坪林区', '坪林', '710800', null, '中国,台湾,新北市,坪林区', '3', '232', '02', 'Pinglin', '121.7111850', '24.9373880');
INSERT INTO `sys_cn_area` VALUES ('710821', '三芝区', '三芝', '710800', null, '中国,台湾,新北市,三芝区', '3', '252', '02', 'Sanzhi', '121.5008660', '25.2580470');
INSERT INTO `sys_cn_area` VALUES ('710822', '石门区', '石门', '710800', null, '中国,台湾,新北市,石门区', '3', '253', '02', 'Shimen', '121.5684910', '25.2904120');
INSERT INTO `sys_cn_area` VALUES ('710823', '八里区', '八里', '710800', null, '中国,台湾,新北市,八里区', '3', '249', '02', 'Bali', '121.3982270', '25.1466800');
INSERT INTO `sys_cn_area` VALUES ('710824', '平溪区', '平溪', '710800', null, '中国,台湾,新北市,平溪区', '3', '226', '02', 'Pingxi', '121.7382550', '25.0257250');
INSERT INTO `sys_cn_area` VALUES ('710825', '双溪区', '双溪', '710800', null, '中国,台湾,新北市,双溪区', '3', '227', '02', 'Shuangxi', '121.8656760', '25.0334090');
INSERT INTO `sys_cn_area` VALUES ('710826', '贡寮区', '贡寮', '710800', null, '中国,台湾,新北市,贡寮区', '3', '228', '02', 'Gongliao', '121.9081850', '25.0223880');
INSERT INTO `sys_cn_area` VALUES ('710827', '金山区', '金山', '710800', null, '中国,台湾,新北市,金山区', '3', '208', '02', 'Jinshan', '121.6364270', '25.2218830');
INSERT INTO `sys_cn_area` VALUES ('710828', '万里区', '万里', '710800', null, '中国,台湾,新北市,万里区', '3', '207', '02', 'Wanli', '121.6886870', '25.1812340');
INSERT INTO `sys_cn_area` VALUES ('710829', '乌来区', '乌来', '710800', null, '中国,台湾,新北市,乌来区', '3', '233', '02', 'Wulai', '121.5505310', '24.8652960');
INSERT INTO `sys_cn_area` VALUES ('712200', '宜兰县', '宜兰', '710000', null, '中国,台湾,宜兰县', '2', '2', '03', 'Yilan', '121.5000000', '24.6000000');
INSERT INTO `sys_cn_area` VALUES ('712201', '宜兰市', '宜兰', '712200', null, '中国,台湾,宜兰县,宜兰市', '3', '260', '03', 'Yilan', '121.7534760', '24.7516820');
INSERT INTO `sys_cn_area` VALUES ('712221', '罗东镇', '罗东', '712200', null, '中国,台湾,宜兰县,罗东镇', '3', '265', '03', 'Luodong', '121.7669190', '24.6770330');
INSERT INTO `sys_cn_area` VALUES ('712222', '苏澳镇', '苏澳', '712200', null, '中国,台湾,宜兰县,苏澳镇', '3', '270', '03', 'Suao', '121.8426560', '24.5946220');
INSERT INTO `sys_cn_area` VALUES ('712223', '头城镇', '头城', '712200', null, '中国,台湾,宜兰县,头城镇', '3', '261', '03', 'Toucheng', '121.8233070', '24.8592170');
INSERT INTO `sys_cn_area` VALUES ('712224', '礁溪乡', '礁溪', '712200', null, '中国,台湾,宜兰县,礁溪乡', '3', '262', '03', 'Jiaoxi', '121.7666800', '24.8223450');
INSERT INTO `sys_cn_area` VALUES ('712225', '壮围乡', '壮围', '712200', null, '中国,台湾,宜兰县,壮围乡', '3', '263', '03', 'Zhuangwei', '121.7816190', '24.7449490');
INSERT INTO `sys_cn_area` VALUES ('712226', '员山乡', '员山', '712200', null, '中国,台湾,宜兰县,员山乡', '3', '264', '03', 'Yuanshan', '121.7217330', '24.7417710');
INSERT INTO `sys_cn_area` VALUES ('712227', '冬山乡', '冬山', '712200', null, '中国,台湾,宜兰县,冬山乡', '3', '269', '03', 'Dongshan', '121.7922800', '24.6345140');
INSERT INTO `sys_cn_area` VALUES ('712228', '五结乡', '五结', '712200', null, '中国,台湾,宜兰县,五结乡', '3', '268', '03', 'Wujie', '121.7982970', '24.6846400');
INSERT INTO `sys_cn_area` VALUES ('712229', '三星乡', '三星', '712200', null, '中国,台湾,宜兰县,三星乡', '3', '266', '03', 'Sanxing', '121.0034180', '23.7752910');
INSERT INTO `sys_cn_area` VALUES ('712230', '大同乡', '大同', '712200', null, '中国,台湾,宜兰县,大同乡', '3', '267', '03', 'Datong', '121.6055570', '24.6759970');
INSERT INTO `sys_cn_area` VALUES ('712231', '南澳乡', '南澳', '712200', null, '中国,台湾,宜兰县,南澳乡', '3', '272', '03', 'Nanao', '121.7998100', '24.4653930');
INSERT INTO `sys_cn_area` VALUES ('712300', '桃园县', '桃园', '710000', null, '中国,台湾,桃园县', '2', '3', '03', 'Taoyuan', '121.0830000', '25.0000000');
INSERT INTO `sys_cn_area` VALUES ('712301', '桃园市', '桃园', '712300', null, '中国,台湾,桃园县,桃园市', '3', '330', '03', 'Taoyuan', '121.3013370', '24.9937770');
INSERT INTO `sys_cn_area` VALUES ('712302', '中坜市', '中坜', '712300', null, '中国,台湾,桃园县,中坜市', '3', '320', '03', 'Zhongli', '121.2249260', '24.9653530');
INSERT INTO `sys_cn_area` VALUES ('712303', '平镇市', '平镇', '712300', null, '中国,台湾,桃园县,平镇市', '3', '324', '03', 'Pingzhen', '121.2183590', '24.9457520');
INSERT INTO `sys_cn_area` VALUES ('712304', '八德市', '八德', '712300', null, '中国,台湾,桃园县,八德市', '3', '334', '03', 'Bade', '121.2846550', '24.9286510');
INSERT INTO `sys_cn_area` VALUES ('712305', '杨梅市', '杨梅', '712300', null, '中国,台湾,桃园县,杨梅市', '3', '326', '03', 'Yangmei', '121.1458730', '24.9075750');
INSERT INTO `sys_cn_area` VALUES ('712306', '芦竹市', '芦竹', '712300', null, '中国,台湾,桃园县,芦竹市', '3', '338', '03', 'Luzhu', '121.2920640', '25.0453920');
INSERT INTO `sys_cn_area` VALUES ('712321', '大溪镇', '大溪', '712300', null, '中国,台湾,桃园县,大溪镇', '3', '335', '03', 'Daxi', '121.2869620', '24.8805840');
INSERT INTO `sys_cn_area` VALUES ('712324', '大园乡', '大园', '712300', null, '中国,台湾,桃园县,大园乡', '3', '337', '03', 'Dayuan', '121.1962920', '25.0644710');
INSERT INTO `sys_cn_area` VALUES ('712325', '龟山乡', '龟山', '712300', null, '中国,台湾,桃园县,龟山乡', '3', '333', '03', 'Guishan', '121.3377670', '24.9925170');
INSERT INTO `sys_cn_area` VALUES ('712327', '龙潭乡', '龙潭', '712300', null, '中国,台湾,桃园县,龙潭乡', '3', '325', '03', 'Longtan', '121.2163920', '24.8638510');
INSERT INTO `sys_cn_area` VALUES ('712329', '新屋乡', '新屋', '712300', null, '中国,台湾,桃园县,新屋乡', '3', '327', '03', 'Xinwu', '121.1058010', '24.9722030');
INSERT INTO `sys_cn_area` VALUES ('712330', '观音乡', '观音', '712300', null, '中国,台湾,桃园县,观音乡', '3', '328', '03', 'Guanyin', '121.0775190', '25.0333030');
INSERT INTO `sys_cn_area` VALUES ('712331', '复兴乡', '复兴', '712300', null, '中国,台湾,桃园县,复兴乡', '3', '336', '03', 'Fuxing', '121.3526130', '24.8209080');
INSERT INTO `sys_cn_area` VALUES ('712400', '新竹县', '新竹', '710000', null, '中国,台湾,新竹县', '2', '3', '03', 'Hsinchu', '121.1600000', '24.6000000');
INSERT INTO `sys_cn_area` VALUES ('712401', '竹北市', '竹北', '712400', null, '中国,台湾,新竹县,竹北市', '3', '302', '03', 'Zhubei', '121.0043170', '24.8396520');
INSERT INTO `sys_cn_area` VALUES ('712421', '竹东镇', '竹东', '712400', null, '中国,台湾,新竹县,竹东镇', '3', '310', '03', 'Zhudong', '121.0864180', '24.7336010');
INSERT INTO `sys_cn_area` VALUES ('712422', '新埔镇', '新埔', '712400', null, '中国,台湾,新竹县,新埔镇', '3', '305', '03', 'Xinpu', '121.0728040', '24.8248200');
INSERT INTO `sys_cn_area` VALUES ('712423', '关西镇', '关西', '712400', null, '中国,台湾,新竹县,关西镇', '3', '306', '03', 'Guanxi', '121.1773010', '24.7888420');
INSERT INTO `sys_cn_area` VALUES ('712424', '湖口乡', '湖口', '712400', null, '中国,台湾,新竹县,湖口乡', '3', '303', '03', 'Hukou', '121.0436910', '24.9039430');
INSERT INTO `sys_cn_area` VALUES ('712425', '新丰乡', '新丰', '712400', null, '中国,台湾,新竹县,新丰乡', '3', '304', '03', 'Xinfeng', '120.9830060', '24.8996000');
INSERT INTO `sys_cn_area` VALUES ('712426', '芎林乡', '芎林', '712400', null, '中国,台湾,新竹县,芎林乡', '3', '307', '03', 'Xionglin', '121.0769240', '24.7744360');
INSERT INTO `sys_cn_area` VALUES ('712427', '横山乡', '横山', '712400', null, '中国,台湾,新竹县,横山乡', '3', '312', '03', 'Hengshan', '121.1162440', '24.7208070');
INSERT INTO `sys_cn_area` VALUES ('712428', '北埔乡', '北埔', '712400', null, '中国,台湾,新竹县,北埔乡', '3', '314', '03', 'Beipu', '121.0531560', '24.6971260');
INSERT INTO `sys_cn_area` VALUES ('712429', '宝山乡', '宝山', '712400', null, '中国,台湾,新竹县,宝山乡', '3', '308', '03', 'Baoshan', '120.9857520', '24.7609750');
INSERT INTO `sys_cn_area` VALUES ('712430', '峨眉乡', '峨眉', '712400', null, '中国,台湾,新竹县,峨眉乡', '3', '315', '03', 'Emei', '121.0152910', '24.6861270');
INSERT INTO `sys_cn_area` VALUES ('712431', '尖石乡', '尖石', '712400', null, '中国,台湾,新竹县,尖石乡', '3', '313', '03', 'Jianshi', '121.1978020', '24.7043600');
INSERT INTO `sys_cn_area` VALUES ('712432', '五峰乡', '五峰', '712400', null, '中国,台湾,新竹县,五峰乡', '3', '311', '03', 'Wufeng', '121.0034180', '23.7752910');
INSERT INTO `sys_cn_area` VALUES ('712500', '苗栗县', '苗栗', '710000', null, '中国,台湾,苗栗县', '2', '3', '037', 'Miaoli', '120.7500000', '24.5000000');
INSERT INTO `sys_cn_area` VALUES ('712501', '苗栗市', '苗栗', '712500', null, '中国,台湾,苗栗县,苗栗市', '3', '360', '037', 'Miaoli', '120.8188690', '24.5614720');
INSERT INTO `sys_cn_area` VALUES ('712521', '苑里镇', '苑里', '712500', null, '中国,台湾,苗栗县,苑里镇', '3', '358', '037', 'Yuanli', '120.6489070', '24.4417500');
INSERT INTO `sys_cn_area` VALUES ('712522', '通霄镇', '通霄', '712500', null, '中国,台湾,苗栗县,通霄镇', '3', '357', '037', 'Tongxiao', '120.6767000', '24.4890870');
INSERT INTO `sys_cn_area` VALUES ('712523', '竹南镇', '竹南', '712500', null, '中国,台湾,苗栗县,竹南镇', '3', '350', '037', 'Zhunan', '120.8726410', '24.6855130');
INSERT INTO `sys_cn_area` VALUES ('712524', '头份镇', '头份', '712500', null, '中国,台湾,苗栗县,头份镇', '3', '351', '037', 'Toufen', '120.8951880', '24.6879930');
INSERT INTO `sys_cn_area` VALUES ('712525', '后龙镇', '后龙', '712500', null, '中国,台湾,苗栗县,后龙镇', '3', '356', '037', 'Houlong', '120.7864800', '24.6126170');
INSERT INTO `sys_cn_area` VALUES ('712526', '卓兰镇', '卓兰', '712500', null, '中国,台湾,苗栗县,卓兰镇', '3', '369', '037', 'Zhuolan', '120.8234410', '24.3095090');
INSERT INTO `sys_cn_area` VALUES ('712527', '大湖乡', '大湖', '712500', null, '中国,台湾,苗栗县,大湖乡', '3', '364', '037', 'Dahu', '120.8636410', '24.4225470');
INSERT INTO `sys_cn_area` VALUES ('712528', '公馆乡', '公馆', '712500', null, '中国,台湾,苗栗县,公馆乡', '3', '363', '037', 'Gongguan', '120.8229830', '24.4991080');
INSERT INTO `sys_cn_area` VALUES ('712529', '铜锣乡', '铜锣', '712500', null, '中国,台湾,苗栗县,铜锣乡', '3', '366', '037', 'Tongluo', '121.0034180', '23.7752910');
INSERT INTO `sys_cn_area` VALUES ('712530', '南庄乡', '南庄', '712500', null, '中国,台湾,苗栗县,南庄乡', '3', '353', '037', 'Nanzhuang', '120.9949570', '24.5968350');
INSERT INTO `sys_cn_area` VALUES ('712531', '头屋乡', '头屋', '712500', null, '中国,台湾,苗栗县,头屋乡', '3', '362', '037', 'Touwu', '120.8466160', '24.5742490');
INSERT INTO `sys_cn_area` VALUES ('712532', '三义乡', '三义', '712500', null, '中国,台湾,苗栗县,三义乡', '3', '367', '037', 'Sanyi', '120.7423400', '24.3502700');
INSERT INTO `sys_cn_area` VALUES ('712533', '西湖乡', '西湖', '712500', null, '中国,台湾,苗栗县,西湖乡', '3', '368', '037', 'Xihu', '121.0034180', '23.7752910');
INSERT INTO `sys_cn_area` VALUES ('712534', '造桥乡', '造桥', '712500', null, '中国,台湾,苗栗县,造桥乡', '3', '361', '037', 'Zaoqiao', '120.8623990', '24.6375370');
INSERT INTO `sys_cn_area` VALUES ('712535', '三湾乡', '三湾', '712500', null, '中国,台湾,苗栗县,三湾乡', '3', '352', '037', 'Sanwan', '120.9514840', '24.6510510');
INSERT INTO `sys_cn_area` VALUES ('712536', '狮潭乡', '狮潭', '712500', null, '中国,台湾,苗栗县,狮潭乡', '3', '354', '037', 'Shitan', '120.9180240', '24.5400040');
INSERT INTO `sys_cn_area` VALUES ('712537', '泰安乡', '泰安', '712500', null, '中国,台湾,苗栗县,泰安乡', '3', '365', '037', 'Tai\'an', '120.9044410', '24.4426000');
INSERT INTO `sys_cn_area` VALUES ('712700', '彰化县', '彰化', '710000', null, '中国,台湾,彰化县', '2', '5', '04', 'Changhua', '120.4160000', '24.0000000');
INSERT INTO `sys_cn_area` VALUES ('712701', '彰化市', '彰化市', '712700', null, '中国,台湾,彰化县,彰化市', '3', '500', '04', 'Zhanghuashi', '120.5422940', '24.0809110');
INSERT INTO `sys_cn_area` VALUES ('712721', '鹿港镇', '鹿港', '712700', null, '中国,台湾,彰化县,鹿港镇', '3', '505', '04', 'Lugang', '120.4353920', '24.0569370');
INSERT INTO `sys_cn_area` VALUES ('712722', '和美镇', '和美', '712700', null, '中国,台湾,彰化县,和美镇', '3', '508', '04', 'Hemei', '120.5002650', '24.1109040');
INSERT INTO `sys_cn_area` VALUES ('712723', '线西乡', '线西', '712700', null, '中国,台湾,彰化县,线西乡', '3', '507', '04', 'Xianxi', '120.4659210', '24.1286530');
INSERT INTO `sys_cn_area` VALUES ('712724', '伸港乡', '伸港', '712700', null, '中国,台湾,彰化县,伸港乡', '3', '509', '04', 'Shengang', '120.4842240', '24.1460810');
INSERT INTO `sys_cn_area` VALUES ('712725', '福兴乡', '福兴', '712700', null, '中国,台湾,彰化县,福兴乡', '3', '506', '04', 'Fuxing', '120.4436820', '24.0478830');
INSERT INTO `sys_cn_area` VALUES ('712726', '秀水乡', '秀水', '712700', null, '中国,台湾,彰化县,秀水乡', '3', '504', '04', 'Xiushui', '120.5026580', '24.0352670');
INSERT INTO `sys_cn_area` VALUES ('712727', '花坛乡', '花坛', '712700', null, '中国,台湾,彰化县,花坛乡', '3', '503', '04', 'Huatan', '120.5384030', '24.0293990');
INSERT INTO `sys_cn_area` VALUES ('712728', '芬园乡', '芬园', '712700', null, '中国,台湾,彰化县,芬园乡', '3', '502', '04', 'Fenyuan', '120.6290240', '24.0136580');
INSERT INTO `sys_cn_area` VALUES ('712729', '员林镇', '员林', '712700', null, '中国,台湾,彰化县,员林镇', '3', '510', '04', 'Yuanlin', '120.5746250', '23.9589990');
INSERT INTO `sys_cn_area` VALUES ('712730', '溪湖镇', '溪湖', '712700', null, '中国,台湾,彰化县,溪湖镇', '3', '514', '04', 'Xihu', '120.4791440', '23.9623150');
INSERT INTO `sys_cn_area` VALUES ('712731', '田中镇', '田中', '712700', null, '中国,台湾,彰化县,田中镇', '3', '520', '04', 'Tianzhong', '120.5806290', '23.8617180');
INSERT INTO `sys_cn_area` VALUES ('712732', '大村乡', '大村', '712700', null, '中国,台湾,彰化县,大村乡', '3', '515', '04', 'Dacun', '120.5407130', '23.9937260');
INSERT INTO `sys_cn_area` VALUES ('712733', '埔盐乡', '埔盐', '712700', null, '中国,台湾,彰化县,埔盐乡', '3', '516', '04', 'Puyan', '120.4640440', '24.0003460');
INSERT INTO `sys_cn_area` VALUES ('712734', '埔心乡', '埔心', '712700', null, '中国,台湾,彰化县,埔心乡', '3', '513', '04', 'Puxin', '120.5435680', '23.9530190');
INSERT INTO `sys_cn_area` VALUES ('712735', '永靖乡', '永靖', '712700', null, '中国,台湾,彰化县,永靖乡', '3', '512', '04', 'Yongjing', '120.5477750', '23.9247030');
INSERT INTO `sys_cn_area` VALUES ('712736', '社头乡', '社头', '712700', null, '中国,台湾,彰化县,社头乡', '3', '511', '04', 'Shetou', '120.5826810', '23.8966860');
INSERT INTO `sys_cn_area` VALUES ('712737', '二水乡', '二水', '712700', null, '中国,台湾,彰化县,二水乡', '3', '530', '04', 'Ershui', '120.6187880', '23.8069950');
INSERT INTO `sys_cn_area` VALUES ('712738', '北斗镇', '北斗', '712700', null, '中国,台湾,彰化县,北斗镇', '3', '521', '04', 'Beidou', '120.5204490', '23.8709110');
INSERT INTO `sys_cn_area` VALUES ('712739', '二林镇', '二林', '712700', null, '中国,台湾,彰化县,二林镇', '3', '526', '04', 'Erlin', '120.3744680', '23.8997510');
INSERT INTO `sys_cn_area` VALUES ('712740', '田尾乡', '田尾', '712700', null, '中国,台湾,彰化县,田尾乡', '3', '522', '04', 'Tianwei', '120.5247170', '23.8907350');
INSERT INTO `sys_cn_area` VALUES ('712741', '埤头乡', '埤头', '712700', null, '中国,台湾,彰化县,埤头乡', '3', '523', '04', 'Pitou', '120.4625990', '23.8913240');
INSERT INTO `sys_cn_area` VALUES ('712742', '芳苑乡', '芳苑', '712700', null, '中国,台湾,彰化县,芳苑乡', '3', '528', '04', 'Fangyuan', '120.3203290', '23.9242220');
INSERT INTO `sys_cn_area` VALUES ('712743', '大城乡', '大城', '712700', null, '中国,台湾,彰化县,大城乡', '3', '527', '04', 'Dacheng', '120.3209340', '23.8523820');
INSERT INTO `sys_cn_area` VALUES ('712744', '竹塘乡', '竹塘', '712700', null, '中国,台湾,彰化县,竹塘乡', '3', '525', '04', 'Zhutang', '120.4274990', '23.8601120');
INSERT INTO `sys_cn_area` VALUES ('712745', '溪州乡', '溪州', '712700', null, '中国,台湾,彰化县,溪州乡', '3', '524', '04', 'Xizhou', '120.4987060', '23.8512290');
INSERT INTO `sys_cn_area` VALUES ('712800', '南投县', '南投', '710000', null, '中国,台湾,南投县', '2', '5', '049', 'Nantou', '120.8300000', '23.8300000');
INSERT INTO `sys_cn_area` VALUES ('712801', '南投市', '南投市', '712800', null, '中国,台湾,南投县,南投市', '3', '540', '049', 'Nantoushi', '120.6837060', '23.9099560');
INSERT INTO `sys_cn_area` VALUES ('712821', '埔里镇', '埔里', '712800', null, '中国,台湾,南投县,埔里镇', '3', '545', '049', 'Puli', '120.9646480', '23.9647890');
INSERT INTO `sys_cn_area` VALUES ('712822', '草屯镇', '草屯', '712800', null, '中国,台湾,南投县,草屯镇', '3', '542', '049', 'Caotun', '120.6803430', '23.9739470');
INSERT INTO `sys_cn_area` VALUES ('712823', '竹山镇', '竹山', '712800', null, '中国,台湾,南投县,竹山镇', '3', '557', '049', 'Zhushan', '120.6720070', '23.7576550');
INSERT INTO `sys_cn_area` VALUES ('712824', '集集镇', '集集', '712800', null, '中国,台湾,南投县,集集镇', '3', '552', '049', 'Jiji', '120.7836730', '23.8290130');
INSERT INTO `sys_cn_area` VALUES ('712825', '名间乡', '名间', '712800', null, '中国,台湾,南投县,名间乡', '3', '551', '049', 'Mingjian', '120.7027970', '23.8384270');
INSERT INTO `sys_cn_area` VALUES ('712826', '鹿谷乡', '鹿谷', '712800', null, '中国,台湾,南投县,鹿谷乡', '3', '558', '049', 'Lugu', '120.7527960', '23.7444710');
INSERT INTO `sys_cn_area` VALUES ('712827', '中寮乡', '中寮', '712800', null, '中国,台湾,南投县,中寮乡', '3', '541', '049', 'Zhongliao', '120.7666540', '23.8789350');
INSERT INTO `sys_cn_area` VALUES ('712828', '鱼池乡', '鱼池', '712800', null, '中国,台湾,南投县,鱼池乡', '3', '555', '049', 'Yuchi', '120.9360600', '23.8963560');
INSERT INTO `sys_cn_area` VALUES ('712829', '国姓乡', '国姓', '712800', null, '中国,台湾,南投县,国姓乡', '3', '544', '049', 'Guoxing', '120.8585410', '24.0422980');
INSERT INTO `sys_cn_area` VALUES ('712830', '水里乡', '水里', '712800', null, '中国,台湾,南投县,水里乡', '3', '553', '049', 'Shuili', '120.8559120', '23.8120860');
INSERT INTO `sys_cn_area` VALUES ('712831', '信义乡', '信义', '712800', null, '中国,台湾,南投县,信义乡', '3', '556', '049', 'Xinyi', '120.8552570', '23.6999220');
INSERT INTO `sys_cn_area` VALUES ('712832', '仁爱乡', '仁爱', '712800', null, '中国,台湾,南投县,仁爱乡', '3', '546', '049', 'Renai', '121.1335430', '24.0244290');
INSERT INTO `sys_cn_area` VALUES ('712900', '云林县', '云林', '710000', null, '中国,台湾,云林县', '2', '6', '05', 'Yunlin', '120.2500000', '23.7500000');
INSERT INTO `sys_cn_area` VALUES ('712901', '斗六市', '斗六', '712900', null, '中国,台湾,云林县,斗六市', '3', '640', '05', 'Douliu', '120.5273600', '23.6976510');
INSERT INTO `sys_cn_area` VALUES ('712921', '斗南镇', '斗南', '712900', null, '中国,台湾,云林县,斗南镇', '3', '630', '05', 'Dounan', '120.4790750', '23.6797310');
INSERT INTO `sys_cn_area` VALUES ('712922', '虎尾镇', '虎尾', '712900', null, '中国,台湾,云林县,虎尾镇', '3', '632', '05', 'Huwei', '120.4453390', '23.7081820');
INSERT INTO `sys_cn_area` VALUES ('712923', '西螺镇', '西螺', '712900', null, '中国,台湾,云林县,西螺镇', '3', '648', '05', 'Xiluo', '120.4660100', '23.7979840');
INSERT INTO `sys_cn_area` VALUES ('712924', '土库镇', '土库', '712900', null, '中国,台湾,云林县,土库镇', '3', '633', '05', 'Tuku', '120.3925720', '23.6778220');
INSERT INTO `sys_cn_area` VALUES ('712925', '北港镇', '北港', '712900', null, '中国,台湾,云林县,北港镇', '3', '651', '05', 'Beigang', '120.3023930', '23.5755250');
INSERT INTO `sys_cn_area` VALUES ('712926', '古坑乡', '古坑', '712900', null, '中国,台湾,云林县,古坑乡', '3', '646', '05', 'Gukeng', '120.5620430', '23.6425680');
INSERT INTO `sys_cn_area` VALUES ('712927', '大埤乡', '大埤', '712900', null, '中国,台湾,云林县,大埤乡', '3', '631', '05', 'Dapi', '120.4305160', '23.6459080');
INSERT INTO `sys_cn_area` VALUES ('712928', '莿桐乡', '莿桐', '712900', null, '中国,台湾,云林县,莿桐乡', '3', '647', '05', 'Citong', '120.5023740', '23.7607840');
INSERT INTO `sys_cn_area` VALUES ('712929', '林内乡', '林内', '712900', null, '中国,台湾,云林县,林内乡', '3', '643', '05', 'Linna', '120.6113650', '23.7587120');
INSERT INTO `sys_cn_area` VALUES ('712930', '二仑乡', '二仑', '712900', null, '中国,台湾,云林县,二仑乡', '3', '649', '05', 'Erlun', '120.4150770', '23.7712730');
INSERT INTO `sys_cn_area` VALUES ('712931', '仑背乡', '仑背', '712900', null, '中国,台湾,云林县,仑背乡', '3', '637', '05', 'Lunbei', '120.3538950', '23.7588400');
INSERT INTO `sys_cn_area` VALUES ('712932', '麦寮乡', '麦寮', '712900', null, '中国,台湾,云林县,麦寮乡', '3', '638', '05', 'Mailiao', '120.2520430', '23.7538410');
INSERT INTO `sys_cn_area` VALUES ('712933', '东势乡', '东势', '712900', null, '中国,台湾,云林县,东势乡', '3', '635', '05', 'Dongshi', '120.2526720', '23.6746790');
INSERT INTO `sys_cn_area` VALUES ('712934', '褒忠乡', '褒忠', '712900', null, '中国,台湾,云林县,褒忠乡', '3', '634', '05', 'Baozhong', '120.3104880', '23.6942450');
INSERT INTO `sys_cn_area` VALUES ('712935', '台西乡', '台西', '712900', null, '中国,台湾,云林县,台西乡', '3', '636', '05', 'Taixi', '120.1961410', '23.7028190');
INSERT INTO `sys_cn_area` VALUES ('712936', '元长乡', '元长', '712900', null, '中国,台湾,云林县,元长乡', '3', '655', '05', 'Yuanchang', '120.3151240', '23.6494580');
INSERT INTO `sys_cn_area` VALUES ('712937', '四湖乡', '四湖', '712900', null, '中国,台湾,云林县,四湖乡', '3', '654', '05', 'Sihu', '120.2257410', '23.6377400');
INSERT INTO `sys_cn_area` VALUES ('712938', '口湖乡', '口湖', '712900', null, '中国,台湾,云林县,口湖乡', '3', '653', '05', 'Kouhu', '120.1853700', '23.5824060');
INSERT INTO `sys_cn_area` VALUES ('712939', '水林乡', '水林', '712900', null, '中国,台湾,云林县,水林乡', '3', '652', '05', 'Shuilin', '120.2459480', '23.5726340');
INSERT INTO `sys_cn_area` VALUES ('713000', '嘉义县', '嘉义', '710000', null, '中国,台湾,嘉义县', '2', '6', '05', 'Chiayi', '120.3000000', '23.5000000');
INSERT INTO `sys_cn_area` VALUES ('713001', '太保市', '太保', '713000', null, '中国,台湾,嘉义县,太保市', '3', '612', '05', 'Taibao', '120.3328760', '23.4596470');
INSERT INTO `sys_cn_area` VALUES ('713002', '朴子市', '朴子', '713000', null, '中国,台湾,嘉义县,朴子市', '3', '613', '05', 'Puzi', '120.2470140', '23.4649610');
INSERT INTO `sys_cn_area` VALUES ('713023', '布袋镇', '布袋', '713000', null, '中国,台湾,嘉义县,布袋镇', '3', '625', '05', 'Budai', '120.1669360', '23.3779790');
INSERT INTO `sys_cn_area` VALUES ('713024', '大林镇', '大林', '713000', null, '中国,台湾,嘉义县,大林镇', '3', '622', '05', 'Dalin', '120.4713360', '23.6038150');
INSERT INTO `sys_cn_area` VALUES ('713025', '民雄乡', '民雄', '713000', null, '中国,台湾,嘉义县,民雄乡', '3', '621', '05', 'Minxiong', '120.4285770', '23.5514560');
INSERT INTO `sys_cn_area` VALUES ('713026', '溪口乡', '溪口', '713000', null, '中国,台湾,嘉义县,溪口乡', '3', '623', '05', 'Xikou', '120.3938220', '23.6022230');
INSERT INTO `sys_cn_area` VALUES ('713027', '新港乡', '新港', '713000', null, '中国,台湾,嘉义县,新港乡', '3', '616', '05', 'Xingang', '120.3476470', '23.5518060');
INSERT INTO `sys_cn_area` VALUES ('713028', '六脚乡', '六脚', '713000', null, '中国,台湾,嘉义县,六脚乡', '3', '615', '05', 'Liujiao', '120.2910830', '23.4939420');
INSERT INTO `sys_cn_area` VALUES ('713029', '东石乡', '东石', '713000', null, '中国,台湾,嘉义县,东石乡', '3', '614', '05', 'Dongshi', '120.1538220', '23.4592350');
INSERT INTO `sys_cn_area` VALUES ('713030', '义竹乡', '义竹', '713000', null, '中国,台湾,嘉义县,义竹乡', '3', '624', '05', 'Yizhu', '120.2434230', '23.3362770');
INSERT INTO `sys_cn_area` VALUES ('713031', '鹿草乡', '鹿草', '713000', null, '中国,台湾,嘉义县,鹿草乡', '3', '611', '05', 'Lucao', '120.3083700', '23.4107840');
INSERT INTO `sys_cn_area` VALUES ('713032', '水上乡', '水上', '713000', null, '中国,台湾,嘉义县,水上乡', '3', '608', '05', 'Shuishang', '120.3979360', '23.4281040');
INSERT INTO `sys_cn_area` VALUES ('713033', '中埔乡', '中埔', '713000', null, '中国,台湾,嘉义县,中埔乡', '3', '606', '05', 'Zhongpu', '120.5229480', '23.4251480');
INSERT INTO `sys_cn_area` VALUES ('713034', '竹崎乡', '竹崎', '713000', null, '中国,台湾,嘉义县,竹崎乡', '3', '604', '05', 'Zhuqi', '120.5514660', '23.5231840');
INSERT INTO `sys_cn_area` VALUES ('713035', '梅山乡', '梅山', '713000', null, '中国,台湾,嘉义县,梅山乡', '3', '603', '05', 'Meishan', '120.5571920', '23.5849150');
INSERT INTO `sys_cn_area` VALUES ('713036', '番路乡', '番路', '713000', null, '中国,台湾,嘉义县,番路乡', '3', '602', '05', 'Fanlu', '120.5550430', '23.4652220');
INSERT INTO `sys_cn_area` VALUES ('713037', '大埔乡', '大埔', '713000', null, '中国,台湾,嘉义县,大埔乡', '3', '607', '05', 'Dapu', '120.5937950', '23.2967150');
INSERT INTO `sys_cn_area` VALUES ('713038', '阿里山乡', '阿里山', '713000', null, '中国,台湾,嘉义县,阿里山乡', '3', '605', '05', 'Alishan', '120.7325200', '23.4679500');
INSERT INTO `sys_cn_area` VALUES ('713300', '屏东县', '屏东', '710000', null, '中国,台湾,屏东县', '2', '9', '08', 'Pingtung', '120.4879280', '22.6828020');
INSERT INTO `sys_cn_area` VALUES ('713301', '屏东市', '屏东', '713300', null, '中国,台湾,屏东县,屏东市', '3', '900', '08', 'Pingdong', '120.4884650', '22.6697230');
INSERT INTO `sys_cn_area` VALUES ('713321', '潮州镇', '潮州', '713300', null, '中国,台湾,屏东县,潮州镇', '3', '920', '08', 'Chaozhou', '120.5428540', '22.5505360');
INSERT INTO `sys_cn_area` VALUES ('713322', '东港镇', '东港', '713300', null, '中国,台湾,屏东县,东港镇', '3', '928', '08', 'Donggang', '120.4544890', '22.4666260');
INSERT INTO `sys_cn_area` VALUES ('713323', '恒春镇', '恒春', '713300', null, '中国,台湾,屏东县,恒春镇', '3', '946', '08', 'Hengchun', '120.7454510', '22.0023730');
INSERT INTO `sys_cn_area` VALUES ('713324', '万丹乡', '万丹', '713300', null, '中国,台湾,屏东县,万丹乡', '3', '913', '08', 'Wandan', '120.4845330', '22.5898390');
INSERT INTO `sys_cn_area` VALUES ('713325', '长治乡', '长治', '713300', null, '中国,台湾,屏东县,长治乡', '3', '908', '08', 'Changzhi', '120.5276140', '22.6770620');
INSERT INTO `sys_cn_area` VALUES ('713326', '麟洛乡', '麟洛', '713300', null, '中国,台湾,屏东县,麟洛乡', '3', '909', '08', 'Linluo', '120.5272830', '22.6506040');
INSERT INTO `sys_cn_area` VALUES ('713327', '九如乡', '九如', '713300', null, '中国,台湾,屏东县,九如乡', '3', '904', '08', 'Jiuru', '120.4901420', '22.7397780');
INSERT INTO `sys_cn_area` VALUES ('713328', '里港乡', '里港', '713300', null, '中国,台湾,屏东县,里港乡', '3', '905', '08', 'Ligang', '120.4944900', '22.7792200');
INSERT INTO `sys_cn_area` VALUES ('713329', '盐埔乡', '盐埔', '713300', null, '中国,台湾,屏东县,盐埔乡', '3', '907', '08', 'Yanpu', '120.5728490', '22.7547830');
INSERT INTO `sys_cn_area` VALUES ('713330', '高树乡', '高树', '713300', null, '中国,台湾,屏东县,高树乡', '3', '906', '08', 'Gaoshu', '120.6002140', '22.8267890');
INSERT INTO `sys_cn_area` VALUES ('713331', '万峦乡', '万峦', '713300', null, '中国,台湾,屏东县,万峦乡', '3', '923', '08', 'Wanluan', '120.5664770', '22.5719650');
INSERT INTO `sys_cn_area` VALUES ('713332', '内埔乡', '内埔', '713300', null, '中国,台湾,屏东县,内埔乡', '3', '912', '08', 'Napu', '120.5668650', '22.6119670');
INSERT INTO `sys_cn_area` VALUES ('713333', '竹田乡', '竹田', '713300', null, '中国,台湾,屏东县,竹田乡', '3', '911', '08', 'Zhutian', '120.5440380', '22.5846780');
INSERT INTO `sys_cn_area` VALUES ('713334', '新埤乡', '新埤', '713300', null, '中国,台湾,屏东县,新埤乡', '3', '925', '08', 'Xinpi', '120.5495460', '22.4699760');
INSERT INTO `sys_cn_area` VALUES ('713335', '枋寮乡', '枋寮', '713300', null, '中国,台湾,屏东县,枋寮乡', '3', '940', '08', 'Fangliao', '120.5934380', '22.3655600');
INSERT INTO `sys_cn_area` VALUES ('713336', '新园乡', '新园', '713300', null, '中国,台湾,屏东县,新园乡', '3', '932', '08', 'Xinyuan', '120.4617390', '22.5439520');
INSERT INTO `sys_cn_area` VALUES ('713337', '崁顶乡', '崁顶', '713300', null, '中国,台湾,屏东县,崁顶乡', '3', '924', '08', 'Kanding', '120.5145710', '22.5147950');
INSERT INTO `sys_cn_area` VALUES ('713338', '林边乡', '林边', '713300', null, '中国,台湾,屏东县,林边乡', '3', '927', '08', 'Linbian', '120.5150910', '22.4340150');
INSERT INTO `sys_cn_area` VALUES ('713339', '南州乡', '南州', '713300', null, '中国,台湾,屏东县,南州乡', '3', '926', '08', 'Nanzhou', '120.5098080', '22.4901920');
INSERT INTO `sys_cn_area` VALUES ('713340', '佳冬乡', '佳冬', '713300', null, '中国,台湾,屏东县,佳冬乡', '3', '931', '08', 'Jiadong', '120.5515440', '22.4176530');
INSERT INTO `sys_cn_area` VALUES ('713341', '琉球乡', '琉球', '713300', null, '中国,台湾,屏东县,琉球乡', '3', '929', '08', 'Liuqiu', '120.3690200', '22.3423660');
INSERT INTO `sys_cn_area` VALUES ('713342', '车城乡', '车城', '713300', null, '中国,台湾,屏东县,车城乡', '3', '944', '08', 'Checheng', '120.7109790', '22.0720770');
INSERT INTO `sys_cn_area` VALUES ('713343', '满州乡', '满州', '713300', null, '中国,台湾,屏东县,满州乡', '3', '947', '08', 'Manzhou', '120.8388430', '22.0208530');
INSERT INTO `sys_cn_area` VALUES ('713344', '枋山乡', '枋山', '713300', null, '中国,台湾,屏东县,枋山乡', '3', '941', '08', 'Fangshan', '120.6563560', '22.2603380');
INSERT INTO `sys_cn_area` VALUES ('713345', '三地门乡', '三地门', '713300', null, '中国,台湾,屏东县,三地门乡', '3', '901', '08', 'Sandimen', '120.6544860', '22.7138770');
INSERT INTO `sys_cn_area` VALUES ('713346', '雾台乡', '雾台', '713300', null, '中国,台湾,屏东县,雾台乡', '3', '902', '08', 'Wutai', '120.7323180', '22.7448770');
INSERT INTO `sys_cn_area` VALUES ('713347', '玛家乡', '玛家', '713300', null, '中国,台湾,屏东县,玛家乡', '3', '903', '08', 'Majia', '120.6441300', '22.7067180');
INSERT INTO `sys_cn_area` VALUES ('713348', '泰武乡', '泰武', '713300', null, '中国,台湾,屏东县,泰武乡', '3', '921', '08', 'Taiwu', '120.6328560', '22.5918190');
INSERT INTO `sys_cn_area` VALUES ('713349', '来义乡', '来义', '713300', null, '中国,台湾,屏东县,来义乡', '3', '922', '08', 'Laiyi', '120.6336010', '22.5258660');
INSERT INTO `sys_cn_area` VALUES ('713350', '春日乡', '春日', '713300', null, '中国,台湾,屏东县,春日乡', '3', '942', '08', 'Chunri', '120.6287930', '22.3706720');
INSERT INTO `sys_cn_area` VALUES ('713351', '狮子乡', '狮子', '713300', null, '中国,台湾,屏东县,狮子乡', '3', '943', '08', 'Shizi', '120.7046170', '22.2019170');
INSERT INTO `sys_cn_area` VALUES ('713352', '牡丹乡', '牡丹', '713300', null, '中国,台湾,屏东县,牡丹乡', '3', '945', '08', 'Mudan', '120.7701080', '22.1256870');
INSERT INTO `sys_cn_area` VALUES ('713400', '台东县', '台东', '710000', null, '中国,台湾,台东县', '2', '9', '089', 'Taitung', '120.9160000', '23.0000000');
INSERT INTO `sys_cn_area` VALUES ('713401', '台东市', '台东', '713400', null, '中国,台湾,台东县,台东市', '3', '950', '089', 'Taidong', '121.1456540', '22.7560450');
INSERT INTO `sys_cn_area` VALUES ('713421', '成功镇', '成功', '713400', null, '中国,台湾,台东县,成功镇', '3', '961', '089', 'Chenggong', '121.3795710', '23.1002230');
INSERT INTO `sys_cn_area` VALUES ('713422', '关山镇', '关山', '713400', null, '中国,台湾,台东县,关山镇', '3', '956', '089', 'Guanshan', '121.1631340', '23.0474500');
INSERT INTO `sys_cn_area` VALUES ('713423', '卑南乡', '卑南', '713400', null, '中国,台湾,台东县,卑南乡', '3', '954', '089', 'Beinan', '121.0835030', '22.7860390');
INSERT INTO `sys_cn_area` VALUES ('713424', '鹿野乡', '鹿野', '713400', null, '中国,台湾,台东县,鹿野乡', '3', '955', '089', 'Luye', '121.1359820', '22.9139510');
INSERT INTO `sys_cn_area` VALUES ('713425', '池上乡', '池上', '713400', null, '中国,台湾,台东县,池上乡', '3', '958', '089', 'Chishang', '121.2151390', '23.1223930');
INSERT INTO `sys_cn_area` VALUES ('713426', '东河乡', '东河', '713400', null, '中国,台湾,台东县,东河乡', '3', '959', '089', 'Donghe', '121.3003340', '22.9699340');
INSERT INTO `sys_cn_area` VALUES ('713427', '长滨乡', '长滨', '713400', null, '中国,台湾,台东县,长滨乡', '3', '962', '089', 'Changbin', '121.4515220', '23.3150410');
INSERT INTO `sys_cn_area` VALUES ('713428', '太麻里乡', '太麻里', '713400', null, '中国,台湾,台东县,太麻里乡', '3', '963', '089', 'Taimali', '121.0073940', '22.6153830');
INSERT INTO `sys_cn_area` VALUES ('713429', '大武乡', '大武', '713400', null, '中国,台湾,台东县,大武乡', '3', '965', '089', 'Dawu', '120.8899380', '22.3399190');
INSERT INTO `sys_cn_area` VALUES ('713430', '绿岛乡', '绿岛', '713400', null, '中国,台湾,台东县,绿岛乡', '3', '951', '089', 'Lvdao', '121.4925960', '22.6616760');
INSERT INTO `sys_cn_area` VALUES ('713431', '海端乡', '海端', '713400', null, '中国,台湾,台东县,海端乡', '3', '957', '089', 'Haiduan', '121.1720080', '23.1010740');
INSERT INTO `sys_cn_area` VALUES ('713432', '延平乡', '延平', '713400', null, '中国,台湾,台东县,延平乡', '3', '953', '089', 'Yanping', '121.0844990', '22.9023580');
INSERT INTO `sys_cn_area` VALUES ('713433', '金峰乡', '金峰', '713400', null, '中国,台湾,台东县,金峰乡', '3', '964', '089', 'Jinfeng', '120.9712920', '22.5955110');
INSERT INTO `sys_cn_area` VALUES ('713434', '达仁乡', '达仁', '713400', null, '中国,台湾,台东县,达仁乡', '3', '966', '089', 'Daren', '120.8841310', '22.2948690');
INSERT INTO `sys_cn_area` VALUES ('713435', '兰屿乡', '兰屿', '713400', null, '中国,台湾,台东县,兰屿乡', '3', '952', '089', 'Lanyu', '121.5324730', '22.0567360');
INSERT INTO `sys_cn_area` VALUES ('713500', '花莲县', '花莲', '710000', null, '中国,台湾,花莲县', '2', '9', '03', 'Hualien', '121.3000000', '23.8300000');
INSERT INTO `sys_cn_area` VALUES ('713501', '花莲市', '花莲', '713500', null, '中国,台湾,花莲县,花莲市', '3', '970', '03', 'Hualian', '121.6068100', '23.9820740');
INSERT INTO `sys_cn_area` VALUES ('713521', '凤林镇', '凤林', '713500', null, '中国,台湾,花莲县,凤林镇', '3', '975', '03', 'Fenglin', '121.4516870', '23.7446480');
INSERT INTO `sys_cn_area` VALUES ('713522', '玉里镇', '玉里', '713500', null, '中国,台湾,花莲县,玉里镇', '3', '981', '03', 'Yuli', '121.3164450', '23.3365090');
INSERT INTO `sys_cn_area` VALUES ('713523', '新城乡', '新城', '713500', null, '中国,台湾,花莲县,新城乡', '3', '971', '03', 'Xincheng', '121.6405120', '24.1281330');
INSERT INTO `sys_cn_area` VALUES ('713524', '吉安乡', '吉安', '713500', null, '中国,台湾,花莲县,吉安乡', '3', '973', '03', 'Ji\'an', '121.5680050', '23.9616350');
INSERT INTO `sys_cn_area` VALUES ('713525', '寿丰乡', '寿丰', '713500', null, '中国,台湾,花莲县,寿丰乡', '3', '974', '03', 'Shoufeng', '121.5089550', '23.8706800');
INSERT INTO `sys_cn_area` VALUES ('713526', '光复乡', '光复', '713500', null, '中国,台湾,花莲县,光复乡', '3', '976', '03', 'Guangfu', '121.4234960', '23.6690840');
INSERT INTO `sys_cn_area` VALUES ('713527', '丰滨乡', '丰滨', '713500', null, '中国,台湾,花莲县,丰滨乡', '3', '977', '03', 'Fengbin', '121.5186390', '23.5970800');
INSERT INTO `sys_cn_area` VALUES ('713528', '瑞穗乡', '瑞穗', '713500', null, '中国,台湾,花莲县,瑞穗乡', '3', '978', '03', 'Ruisui', '121.3759920', '23.4968170');
INSERT INTO `sys_cn_area` VALUES ('713529', '富里乡', '富里', '713500', null, '中国,台湾,花莲县,富里乡', '3', '983', '03', 'Fuli', '121.2501240', '23.1799840');
INSERT INTO `sys_cn_area` VALUES ('713530', '秀林乡', '秀林', '713500', null, '中国,台湾,花莲县,秀林乡', '3', '972', '03', 'Xiulin', '121.6203810', '24.1166420');
INSERT INTO `sys_cn_area` VALUES ('713531', '万荣乡', '万荣', '713500', null, '中国,台湾,花莲县,万荣乡', '3', '979', '03', 'Wanrong', '121.4074930', '23.7153460');
INSERT INTO `sys_cn_area` VALUES ('713532', '卓溪乡', '卓溪', '713500', null, '中国,台湾,花莲县,卓溪乡', '3', '982', '03', 'Zhuoxi', '121.3034220', '23.3463690');
INSERT INTO `sys_cn_area` VALUES ('713600', '澎湖县', '澎湖', '710000', null, '中国,台湾,澎湖县', '2', '8', '06', 'Penghu', '119.5664170', '23.5697330');
INSERT INTO `sys_cn_area` VALUES ('713601', '马公市', '马公', '713600', null, '中国,台湾,澎湖县,马公市', '3', '880', '06', 'Magong', '119.5664990', '23.5658450');
INSERT INTO `sys_cn_area` VALUES ('713621', '湖西乡', '湖西', '713600', null, '中国,台湾,澎湖县,湖西乡', '3', '885', '06', 'Huxi', '119.6596660', '23.5833580');
INSERT INTO `sys_cn_area` VALUES ('713622', '白沙乡', '白沙', '713600', null, '中国,台湾,澎湖县,白沙乡', '3', '884', '06', 'Baisha', '119.5979190', '23.6660600');
INSERT INTO `sys_cn_area` VALUES ('713623', '西屿乡', '西屿', '713600', null, '中国,台湾,澎湖县,西屿乡', '3', '881', '06', 'Xiyu', '119.5069740', '23.6008360');
INSERT INTO `sys_cn_area` VALUES ('713624', '望安乡', '望安', '713600', null, '中国,台湾,澎湖县,望安乡', '3', '882', '06', 'Wang\'an', '119.5005380', '23.3575310');
INSERT INTO `sys_cn_area` VALUES ('713625', '七美乡', '七美', '713600', null, '中国,台湾,澎湖县,七美乡', '3', '883', '06', 'Qimei', '119.4239290', '23.2060180');
INSERT INTO `sys_cn_area` VALUES ('713700', '金门县', '金门', '710000', null, '中国,台湾,金门县', '2', '8', '082', 'Jinmen', '118.3170890', '24.4327060');
INSERT INTO `sys_cn_area` VALUES ('713701', '金城镇', '金城', '713700', null, '中国,台湾,金门县,金城镇', '3', '893', '082', 'Jincheng', '118.3166670', '24.4166670');
INSERT INTO `sys_cn_area` VALUES ('713702', '金湖镇', '金湖', '713700', null, '中国,台湾,金门县,金湖镇', '3', '891', '082', 'Jinhu', '118.4197430', '24.4386330');
INSERT INTO `sys_cn_area` VALUES ('713703', '金沙镇', '金沙', '713700', null, '中国,台湾,金门县,金沙镇', '3', '890', '082', 'Jinsha', '118.4279930', '24.4811090');
INSERT INTO `sys_cn_area` VALUES ('713704', '金宁乡', '金宁', '713700', null, '中国,台湾,金门县,金宁乡', '3', '892', '082', 'Jinning', '118.3345060', '24.4567200');
INSERT INTO `sys_cn_area` VALUES ('713705', '烈屿乡', '烈屿', '713700', null, '中国,台湾,金门县,烈屿乡', '3', '894', '082', 'Lieyu', '118.2472550', '24.4331020');
INSERT INTO `sys_cn_area` VALUES ('713706', '乌丘乡', '乌丘', '713700', null, '中国,台湾,金门县,乌丘乡', '3', '896', '082', 'Wuqiu', '118.3195780', '24.4350380');
INSERT INTO `sys_cn_area` VALUES ('713800', '连江县', '连江', '710000', null, '中国,台湾,连江县', '2', '2', '0836', 'Lienchiang', '119.5397040', '26.1973640');
INSERT INTO `sys_cn_area` VALUES ('713801', '南竿乡', '南竿', '713800', null, '中国,台湾,连江县,南竿乡', '3', '209', '0836', 'Nangan', '119.9442670', '26.1440350');
INSERT INTO `sys_cn_area` VALUES ('713802', '北竿乡', '北竿', '713800', null, '中国,台湾,连江县,北竿乡', '3', '210', '0836', 'Beigan', '120.0005720', '26.2219830');
INSERT INTO `sys_cn_area` VALUES ('713803', '莒光乡', '莒光', '713800', null, '中国,台湾,连江县,莒光乡', '3', '211', '0836', 'Juguang', '119.9404050', '25.9762560');
INSERT INTO `sys_cn_area` VALUES ('713804', '东引乡', '东引', '713800', null, '中国,台湾,连江县,东引乡', '3', '212', '0836', 'Dongyin', '120.4939550', '26.3661640');
INSERT INTO `sys_cn_area` VALUES ('810000', '香港特别行政区', '香港', '100000', null, '中国,香港特别行政区', '1', null, '', 'Hong Kong', '114.1733550', '22.3200480');
INSERT INTO `sys_cn_area` VALUES ('810100', '香港岛', '香港岛', '810000', null, '中国,香港特别行政区,香港岛', '2', '999077', '00852', 'Hong Kong Island', '114.1773140', '22.2664160');
INSERT INTO `sys_cn_area` VALUES ('810101', '中西区', '中西区', '810100', null, '中国,香港特别行政区,香港岛,中西区', '3', '999077', '00852', 'Central and Western District', '114.1543740', '22.2819810');
INSERT INTO `sys_cn_area` VALUES ('810102', '湾仔区', '湾仔区', '810100', null, '中国,香港特别行政区,香港岛,湾仔区', '3', '999077', '00852', 'Wan Chai District', '114.1829150', '22.2763890');
INSERT INTO `sys_cn_area` VALUES ('810103', '东区', '东区', '810100', null, '中国,香港特别行政区,香港岛,东区', '3', '999077', '00852', 'Eastern District', '114.2559930', '22.2627550');
INSERT INTO `sys_cn_area` VALUES ('810104', '南区', '南区', '810100', null, '中国,香港特别行政区,香港岛,南区', '3', '999077', '00852', 'Southern District', '114.1741340', '22.2467600');
INSERT INTO `sys_cn_area` VALUES ('810200', '九龙', '九龙', '810000', null, '中国,香港特别行政区,九龙', '2', '999077', '00852', 'Kowloon', '114.1749500', '22.3271150');
INSERT INTO `sys_cn_area` VALUES ('810201', '油尖旺区', '油尖旺', '810200', null, '中国,香港特别行政区,九龙,油尖旺区', '3', '999077', '00852', 'Yau Tsim Mong', '114.1733320', '22.3117040');
INSERT INTO `sys_cn_area` VALUES ('810202', '深水埗区', '深水埗', '810200', null, '中国,香港特别行政区,九龙,深水埗区', '3', '999077', '00852', 'Sham Shui Po', '114.1672100', '22.3281710');
INSERT INTO `sys_cn_area` VALUES ('810203', '九龙城区', '九龙城', '810200', null, '中国,香港特别行政区,九龙,九龙城区', '3', '999077', '00852', 'Jiulongcheng', '114.1950530', '22.3267300');
INSERT INTO `sys_cn_area` VALUES ('810204', '黄大仙区', '黄大仙', '810200', null, '中国,香港特别行政区,九龙,黄大仙区', '3', '999077', '00852', 'Wong Tai Sin', '114.1992400', '22.3363130');
INSERT INTO `sys_cn_area` VALUES ('810205', '观塘区', '观塘', '810200', null, '中国,香港特别行政区,九龙,观塘区', '3', '999077', '00852', 'Kwun Tong', '114.2312680', '22.3094300');
INSERT INTO `sys_cn_area` VALUES ('810300', '新界', '新界', '810000', null, '中国,香港特别行政区,新界', '2', '999077', '00852', 'New Territories', '114.2024080', '22.3417660');
INSERT INTO `sys_cn_area` VALUES ('810301', '荃湾区', '荃湾', '810300', null, '中国,香港特别行政区,新界,荃湾区', '3', '999077', '00852', 'Tsuen Wan', '114.1229520', '22.3709730');
INSERT INTO `sys_cn_area` VALUES ('810302', '屯门区', '屯门', '810300', null, '中国,香港特别行政区,新界,屯门区', '3', '999077', '00852', 'Tuen Mun', '113.9774160', '22.3910470');
INSERT INTO `sys_cn_area` VALUES ('810303', '元朗区', '元朗', '810300', null, '中国,香港特别行政区,新界,元朗区', '3', '999077', '00852', 'Yuen Long', '114.0397960', '22.4433420');
INSERT INTO `sys_cn_area` VALUES ('810304', '北区', '北区', '810300', null, '中国,香港特别行政区,新界,北区', '3', '999077', '00852', 'North District', '114.1489590', '22.4940860');
INSERT INTO `sys_cn_area` VALUES ('810305', '大埔区', '大埔', '810300', null, '中国,香港特别行政区,新界,大埔区', '3', '999077', '00852', 'Tai Po', '114.1717430', '22.4456530');
INSERT INTO `sys_cn_area` VALUES ('810306', '西贡区', '西贡', '810300', null, '中国,香港特别行政区,新界,西贡区', '3', '999077', '00852', 'Sai Kung', '114.2785400', '22.3794400');
INSERT INTO `sys_cn_area` VALUES ('810307', '沙田区', '沙田', '810300', null, '中国,香港特别行政区,新界,沙田区', '3', '999077', '00852', 'Sha Tin', '114.1919410', '22.3792940');
INSERT INTO `sys_cn_area` VALUES ('810308', '葵青区', '葵青', '810300', null, '中国,香港特别行政区,新界,葵青区', '3', '999077', '00852', 'Kwai Tsing', '114.1393200', '22.3638770');
INSERT INTO `sys_cn_area` VALUES ('810309', '离岛区', '离岛', '810300', null, '中国,香港特别行政区,新界,离岛区', '3', '999077', '00852', 'Outlying Islands', '113.9458420', '22.2815080');
INSERT INTO `sys_cn_area` VALUES ('820000', '澳门特别行政区', '澳门', '100000', null, '中国,澳门特别行政区', '1', null, '', 'Macau', '113.5490900', '22.1989510');
INSERT INTO `sys_cn_area` VALUES ('820100', '澳门半岛', '澳门半岛', '820000', null, '中国,澳门特别行政区,澳门半岛', '2', '999078', '00853', 'MacauPeninsula', '113.5491340', '22.1987510');
INSERT INTO `sys_cn_area` VALUES ('820101', '花地玛堂区', '花地玛堂区', '820100', null, '中国,澳门特别行政区,澳门半岛,花地玛堂区', '3', '999078', '00853', 'Nossa Senhora de Fatima', '113.5522840', '22.2080670');
INSERT INTO `sys_cn_area` VALUES ('820102', '圣安多尼堂区', '圣安多尼堂区', '820100', null, '中国,澳门特别行政区,澳门半岛,圣安多尼堂区', '3', '999078', '00853', 'Santo Antonio', '113.5643010', '22.1238100');
INSERT INTO `sys_cn_area` VALUES ('820103', '大堂区', '大堂', '820100', null, '中国,澳门特别行政区,澳门半岛,大堂区', '3', '999078', '00853', 'Sé', '113.5529710', '22.1883590');
INSERT INTO `sys_cn_area` VALUES ('820104', '望德堂区', '望德堂区', '820100', null, '中国,澳门特别行政区,澳门半岛,望德堂区', '3', '999078', '00853', 'Sao Lazaro', '113.5505680', '22.1940810');
INSERT INTO `sys_cn_area` VALUES ('820105', '风顺堂区', '风顺堂区', '820100', null, '中国,澳门特别行政区,澳门半岛,风顺堂区', '3', '999078', '00853', 'Sao Lourenco', '113.5419280', '22.1873680');
INSERT INTO `sys_cn_area` VALUES ('820200', '氹仔岛', '氹仔岛', '820000', null, '中国,澳门特别行政区,氹仔岛', '2', '999078', '00853', 'Taipa', '113.5776690', '22.1568380');
INSERT INTO `sys_cn_area` VALUES ('820201', '嘉模堂区', '嘉模堂区', '820200', null, '中国,澳门特别行政区,氹仔岛,嘉模堂区', '3', '999078', '00853', 'Our Lady Of Carmel\'s Parish', '113.5653030', '22.1490290');
INSERT INTO `sys_cn_area` VALUES ('820300', '路环岛', '路环岛', '820000', null, '中国,澳门特别行政区,路环岛', '2', '999078', '00853', 'Coloane', '113.5648570', '22.1162260');
INSERT INTO `sys_cn_area` VALUES ('820301', '圣方济各堂区', '圣方济各堂区', '820300', null, '中国,澳门特别行政区,路环岛,圣方济各堂区', '3', '999078', '00853', 'St Francis Xavier\'s Parish', '113.5599540', '22.1234860');
INSERT INTO `sys_cn_area` VALUES ('900000', '钓鱼岛', '钓鱼岛', '100000', null, '中国,钓鱼岛', '1', null, '', 'DiaoyuDao', '123.4780880', '25.7423850');

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `config_name` varchar(50) DEFAULT NULL COMMENT '配置名称',
  `config_key` varchar(50) DEFAULT NULL COMMENT '键名(静态数据，设置后就不允许再修改)',
  `config_value` varchar(3000) DEFAULT NULL COMMENT '键值',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态   0：正常   1：隐藏 2：禁用',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `delete_flag` int(1) DEFAULT '0' COMMENT '删除标识(0:正常，1:已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('3', '用户初始密码', 'user.initPassword', '123456', '0', '创建系统用户时的初始密码', '0', '2020-04-07 21:03:45', '3', '2020-04-13 19:56:51', '3', '0');
INSERT INTO `sys_config` VALUES ('10', 'RSA加密密钥', 'RsaKeyPair', '{\"privateKey\":\"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIQF6tTdPKBiAiN6T2JI9i5HsXYnMdDgJ4w5IZ8FgNpsd0Aw8JTYLy+ZFM8LoHBx5zMGzrOpR7pAaYNdcNxg3NxPPMz2orOn+PrQadJZMp95s6OeOUBpncvT6mcuburbK2dTF4CqrnNtO99MxKgt2pS9v0VcW/Eqv4M3wHc8JN+1AgMBAAECgYAJfgNsWpvJTEKrGlgq0OQiX7U6sYa7ZeJyComITXT+P14zl1E04nZCDdeZK1TVwNrGqG6kLD+j/I2ZjFZZAf3fHsMGpDFKKX6ds2O8nd4agPaLpgwVjMri7JqP/HKgKNOWQ8Vfn9rFPRzLcjSVF6F6VGHd/3s0pAVaPB5y9/DyAQJBALpfIShv0jPEutf03C/xktY56X6U2CmJ5n5vSwCyydGq0+6MQn0f17eX39eVSh4nYk/pbZz+V/m+z3alxwK9Z1ECQQC1WNBbdXge+S7pKqN+S3Xe9qbACXtTnNI8199iLw6YSyo+97eXelab4v1Wwk/skn4r+jkIUaOqKFlFMjVPW6ElAkBiS2wMjLV7skWtQqqi6rE8JX0d0tkTR3T2uDIBo0pIN+XhCb7DiXjXjtVzOXzG3JTAeufiBk9WHCoFdLe6nTSRAkBGGUepItZE+sN0ZAQAzMCKaEN61e9zGZp25Gc398Kngd6Zqn2wMx0JcwvEnqXwZ4wYCchD+/LM0n33bnoG6/91AkEAlLCaDPCA2TJYayZoKEMQXQ3ZfqfFHNigVs0mEh/dCgChZK9fKBjgfnVihZ/7MFT4gflmm6CjDMjlGijBvH26OQ==\",\"publicKey\":\"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCEBerU3TygYgIjek9iSPYuR7F2JzHQ4CeMOSGfBYDabHdAMPCU2C8vmRTPC6BwceczBs6zqUe6QGmDXXDcYNzcTzzM9qKzp/j60GnSWTKfebOjnjlAaZ3L0+pnLm7q2ytnUxeAqq5zbTvfTMSoLdqUvb9FXFvxKr+DN8B3PCTftQIDAQAB\"}', '0', '非对称加密有公钥和私钥两个概念，私钥自己拥有，不能给别人，公钥公开。根据应用的不同，我们可以选择使用不同的密钥加密：\n\n签名：使用私钥加密，公钥解密。用于让所有公钥所有者验证私钥所有者的身份并且用来防止私钥所有者发布的内容被篡改，但是不用来保证内容不被他人获得。\n\n加密：用公钥加密，私钥解密。用于向公钥所有者发布信息,这个信息可能被他人篡改,但是无法被他人获得。', '0', '2020-04-19 20:15:54', '3', '2020-04-19 20:15:54', '3', '0');
INSERT INTO `sys_config` VALUES ('11', 'AES加密密钥', 'AesSecretKey', 'ID3lJr9xH1IO03wy', '0', '对称加密指加密和解密使用相同密钥的加密算法，AES全称高级加密标准（英语：Advanced Encryption Standard，缩写：AES），在密码学中又称Rijndael加密法。\n\n对于Java中AES的默认模式是：AES/ECB/PKCS5Padding，如果使用CryptoJS，请调整为：padding: CryptoJS.pad.Pkcs7', '0', '2020-04-19 20:16:01', '3', '2020-04-19 20:16:01', '3', '0');
INSERT INTO `sys_config` VALUES ('14', '安全设置', 'securitySetting', '{\"maxFailedLoginAttempts\":5,\"passwordPolicy\":{\"maximumLength\":30,\"minimumDigits\":0,\"minimumLength\":6,\"minimumLowercaseLetters\":0,\"minimumSpecialCharacters\":0,\"minimumUppercaseLetters\":0,\"passwordExpirationPeriodDays\":0,\"passwordPolicyDesc\":\"密码长度最少6位，最多30位\"},\"userLockoutNotificationEmail\":\"290603672@qq.com\"}', '0', null, '0', '2020-04-24 16:22:48', '3', '2020-04-24 16:22:48', '3', '0');
INSERT INTO `sys_config` VALUES ('15', '系统名称', 'system_name', 'magic4j platform', '0', '', '0', '2020-04-24 23:30:40', '3', '2020-05-10 16:39:36', '3', '1');
INSERT INTO `sys_config` VALUES ('16', '系统Logo图片', 'system_logo', 'http://file.itgacl.com/group1/M00/00/00/rBAACl6UFZSAR73kAACcM3DyTnU558.jpg', '0', null, '0', '2020-04-24 23:31:57', '3', '2020-04-24 23:31:57', '3', '1');
INSERT INTO `sys_config` VALUES ('17', '文件存储方式', 'fileStorageType', 'fastdfs', '0', '', '0', '2020-04-26 16:57:43', '3', '2020-04-26 17:02:17', '3', '0');
INSERT INTO `sys_config` VALUES ('18', '平台设置', 'PlatformSetting', '{\"systemName\":\"magic4j开发平台\",\"systemLogo\":\"http://file.itgacl.com/group1/M00/00/01/rBAACl67bX2AZM4OAAA0kXoP_b4673.png\"}', null, null, '0', '2020-05-13 02:45:01', '3', '2020-05-13 02:45:01', '3', '0');
INSERT INTO `sys_config` VALUES ('19', '平台设置', 'PlatformSetting', '{\"systemName\":\"迈傲IOT平台\",\"systemLogo\":\"http://file.itgacl.com/group1/M00/00/01/rBAACl67aE2AZ-O5AADVWljTiFA480.png\"}', null, null, '6', '2020-05-13 03:31:27', '38', '2020-05-13 03:31:27', '38', '0');
INSERT INTO `sys_config` VALUES ('20', '平台设置', 'PlatformSetting', '{\"systemName\":\"京信通信\",\"systemLogo\":\"http://file.itgacl.com/group1/M00/00/01/rBAACl67blGAbMzEAAAGvZZdWIY806.png\"}', null, null, '4', '2020-05-13 11:49:38', '37', '2020-05-13 11:49:38', '37', '0');

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `parent_name` varchar(30) DEFAULT '' COMMENT '父部门名称',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` int(255) DEFAULT NULL COMMENT '部门状态（0正常 1停用）',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` int(11) DEFAULT NULL COMMENT '删除标志（0代表存在 1代表删除）',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '', '元力云网络有限公司', '0', null, null, null, '0', '5', '0', '6', '2020-04-04 14:46:24', '6', '2020-04-04 15:00:41');
INSERT INTO `sys_dept` VALUES ('2', '1', '', '研发部', '0', null, null, null, '0', '5', '0', '6', '2020-04-04 14:54:16', '6', '2020-04-04 14:54:16');
INSERT INTO `sys_dept` VALUES ('3', '1', '', '运营部', '0', null, null, null, '0', '5', '0', '6', '2020-04-04 14:55:29', '6', '2020-04-04 14:55:29');
INSERT INTO `sys_dept` VALUES ('4', '1', '', '市场部', '0', null, null, null, '0', '5', '0', '6', '2020-04-04 14:55:38', '6', '2020-04-04 14:55:38');
INSERT INTO `sys_dept` VALUES ('5', '2', '', 'java服务端组', '1', '', '', '', '0', '6', '1', '6', '2020-04-04 14:56:49', '3', '2020-05-08 08:34:26');
INSERT INTO `sys_dept` VALUES ('6', '2', '', '大数据开发组', '2', '', '', '', '0', '5', '0', '6', '2020-04-04 14:57:01', '3', '2020-05-08 08:34:31');
INSERT INTO `sys_dept` VALUES ('8', '2', '', '物联网开发组', '3', '', '', '', '0', '5', '0', '6', '2020-04-04 15:01:33', '3', '2020-05-08 08:34:37');
INSERT INTO `sys_dept` VALUES ('9', '11', '', '行政部', '0', null, null, null, '0', '6', '1', '6', '2020-04-04 15:02:03', '6', '2020-04-04 15:03:33');
INSERT INTO `sys_dept` VALUES ('10', '11', '', '财务部', '0', null, null, null, '0', '6', '1', '6', '2020-04-04 15:02:20', '6', '2020-04-04 15:03:56');
INSERT INTO `sys_dept` VALUES ('11', '1', '', '综合部', '0', null, null, null, '0', '6', '1', '6', '2020-04-04 15:02:42', '6', '2020-04-04 15:02:42');
INSERT INTO `sys_dept` VALUES ('12', '2', '', '测试组', '4', '', '', '', '0', '6', '1', '10', '2020-04-05 20:23:54', '3', '2020-05-08 08:34:45');
INSERT INTO `sys_dept` VALUES ('13', '4', '', '销售部', '1', '张三', '13557591759', '123@qq.com', '0', '0', '1', '3', '2020-04-15 07:12:30', '3', '2020-04-15 07:12:30');
INSERT INTO `sys_dept` VALUES ('14', '4', '', '采购部', '2', '李四', '15177196635', '', '0', '0', '1', '3', '2020-04-15 07:15:10', '3', '2020-04-15 07:36:40');
INSERT INTO `sys_dept` VALUES ('15', '0', '', '迈傲科技', '1', '伍工', null, null, '0', '6', '0', '38', '2020-05-13 11:29:12', '38', '2020-05-13 11:29:12');
INSERT INTO `sys_dept` VALUES ('16', '15', '', '研发部', '1', '刘工', null, null, '0', '6', '0', '38', '2020-05-13 11:29:32', '38', '2020-05-13 11:29:32');
INSERT INTO `sys_dept` VALUES ('17', '15', '', '市场部', '2', '左工', null, null, '0', '6', '0', '38', '2020-05-13 11:30:53', '38', '2020-05-13 11:30:53');
INSERT INTO `sys_dept` VALUES ('18', '15', '', '综合部', '1', '傅工', null, null, '0', '6', '0', '38', '2020-05-13 11:31:19', '38', '2020-05-13 11:31:19');
INSERT INTO `sys_dept` VALUES ('19', '16', '', '产品工作室', '1', '高工', null, null, '0', '6', '0', '38', '2020-05-13 11:31:48', '38', '2020-05-13 11:31:48');
INSERT INTO `sys_dept` VALUES ('20', '16', '', '产品研发室', '2', '徐工', '13822290843', '290603672@qq.com', '0', '6', '0', '38', '2020-05-13 11:32:39', '38', '2020-05-13 11:33:05');
INSERT INTO `sys_dept` VALUES ('21', '0', '', '京信通信', '1', '张', null, null, '0', '4', '0', '37', '2020-05-13 11:52:55', '37', '2020-05-13 11:52:55');
INSERT INTO `sys_dept` VALUES ('22', '21', '', '研发部', '1', '李四', null, null, '0', '4', '0', '37', '2020-05-13 11:53:11', '37', '2020-05-13 11:53:11');
INSERT INTO `sys_dept` VALUES ('23', '21', '', '市场部', '1', '朱', null, null, '0', '4', '0', '37', '2020-05-13 11:53:27', '37', '2020-05-13 11:53:27');

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT ' 父ID（保留字段，暂时没用上） ',
  `dict_name` varchar(50) DEFAULT NULL COMMENT '字典名称',
  `dict_type` varchar(50) NOT NULL COMMENT ' 字典类型(静态数据，设置了就不允许再更改)',
  `dict_code` varchar(50) NOT NULL COMMENT ' 字典编码(静态数据，设置了就不允许再更改) ',
  `dict_label` varchar(200) NOT NULL COMMENT ' 字典文本 ',
  `sort_no` int(11) unsigned DEFAULT '1' COMMENT ' 顺序 ',
  `dict_desc` varchar(400) DEFAULT NULL COMMENT '字典描述',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_Time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` int(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `SYS_DICT_PK` (`id`) USING BTREE,
  KEY `idx_dc_dt` (`dict_type`,`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('5', '0', '性别', 'user_sex', '0', '男', '1', '', '3', '2020-04-07 20:48:57', '3', '2020-04-14 10:42:39', '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '性别', 'user_sex', '1', '女', '2', '', '3', '2020-04-07 20:49:00', '3', '2020-04-14 10:42:50', '0');
INSERT INTO `sys_dict` VALUES ('7', '0', '性别', 'user_sex', '2', '保密', '3', '', '3', '2020-04-07 20:49:02', '3', '2020-04-14 10:43:13', '0');
INSERT INTO `sys_dict` VALUES ('8', '0', '用户状态', 'user_status', '0', '正常', '4', null, '3', '2020-04-11 18:03:54', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('9', '0', '用户状态', 'user_status', '1', '禁用', '3', null, '3', '2020-04-11 18:03:57', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('10', '0', '操作类型', 'oper_type', 'create', '新增', '1', null, '3', '2020-04-11 07:56:30', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('11', '0', '操作类型', 'oper_type', 'update', '修改', '2', null, '3', '2020-04-11 07:56:31', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('12', '0', '操作类型', 'oper_type', 'delete', '删除', '3', null, '3', '2020-04-11 07:56:31', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('13', '0', '操作类型', 'oper_type', 'get', '查询', '4', null, '3', '2020-04-11 07:56:32', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('14', '0', '操作类型', 'oper_type', 'read', '读取', '5', null, '3', '2020-04-11 07:56:32', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('15', '0', '操作类型', 'oper_type', 'retrieve', '检索', '5', null, '3', '2020-04-11 07:56:33', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('16', '0', '操作类型', 'oper_type', 'run', '运行', '6', null, '3', '2020-04-11 14:30:06', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('17', '0', '操作类型', 'oper_type', 'pause', '暂停', '7', null, '3', '2020-04-11 14:30:07', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('18', '0', '操作类型', 'oper_type', 'resume', '恢复', '8', null, '3', '2020-04-11 14:30:09', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('19', '0', '数据范围', 'data_scope', '1', '全部数据权限', '1', null, '3', '2020-04-11 14:30:17', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('20', '0', '数据范围', 'data_scope', '2', '本部门数据权限', '2', null, '3', '2020-04-11 14:30:16', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('21', '0', '数据范围', 'data_scope', '3', '本部门及以下数据权限', '3', null, '3', '2020-04-11 14:30:15', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('22', '0', '数据范围', 'data_scope', '4', '自定数据权限', '4', null, '3', '2020-04-11 14:30:15', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('23', '0', '数据状态', 'data_status', '0', '正常', '1', null, null, '2020-04-13 17:15:57', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('24', '0', '数据状态', 'data_status', '1', '隐藏', '1', null, null, '2020-04-13 17:15:58', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('25', '0', '数据状态', 'data_status', '2', '禁用', '1', null, null, '2020-04-13 17:15:58', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('26', '0', '删除标识', 'delete_flag', '0', '未删除', '1', '', '3', '2020-04-14 00:51:13', '3', '2020-04-14 21:22:50', '0');
INSERT INTO `sys_dict` VALUES ('27', '0', '删除标识', 'delete_flag', '1', 'YES', '1', '', '3', '2020-04-14 00:51:13', '3', '2020-04-14 21:20:06', '0');
INSERT INTO `sys_dict` VALUES ('28', '0', '操作结果', 'opera_result', '0', '成功', '1', null, '3', '2020-04-14 15:23:29', '3', '2020-04-14 15:23:29', '0');
INSERT INTO `sys_dict` VALUES ('29', '0', '操作结果', 'opera_result', '1', '失败', '1', null, '3', '2020-04-14 15:23:29', '3', '2020-04-14 15:23:29', '0');
INSERT INTO `sys_dict` VALUES ('30', '0', '部门状态', 'dept_status', '0', '正常', '1', null, '3', '2020-04-15 00:03:08', '3', '2020-04-15 00:03:08', '0');
INSERT INTO `sys_dict` VALUES ('31', '0', '部门状态', 'dept_status', '1', '停用', '1', null, '3', '2020-04-15 00:03:08', '3', '2020-04-15 00:03:08', '0');
INSERT INTO `sys_dict` VALUES ('32', '0', '岗位状态', 'post_status', '0', '正常', '1', '', '3', '2020-04-15 10:30:54', '3', '2020-04-24 17:00:09', '0');
INSERT INTO `sys_dict` VALUES ('33', '0', '岗位状态', 'post_status', '1', '停用', '1', null, '3', '2020-04-15 10:30:56', '3', '2020-04-15 10:30:56', '0');
INSERT INTO `sys_dict` VALUES ('34', '0', '调度任务状态', 'schedule_job_status', '0', '正常', '1', null, '3', '2020-04-17 14:01:14', '3', '2020-04-17 14:01:14', '0');
INSERT INTO `sys_dict` VALUES ('35', '0', '调度任务状态', 'schedule_job_status', '1', '暂停', '1', null, '3', '2020-04-17 14:01:14', '3', '2020-04-17 14:01:14', '0');
INSERT INTO `sys_dict` VALUES ('36', '0', '文件存储方式', 'file_storage_type', 'local', '本地存储', '1', null, '3', '2020-04-26 15:22:43', '3', '2020-04-25 08:00:17', '0');
INSERT INTO `sys_dict` VALUES ('37', '0', '文件存储方式', 'file_storage_type', 'sftp', 'sftp存储', '1', '', '3', '2020-05-01 00:04:21', '3', '2020-05-06 20:20:04', '0');
INSERT INTO `sys_dict` VALUES ('38', '0', '文件存储方式', 'file_storage_type', 'fastdfs', 'fastdfs存储', '1', null, '3', '2020-04-26 15:22:49', '3', '2020-04-25 08:00:17', '0');
INSERT INTO `sys_dict` VALUES ('39', '0', '文件存储方式', 'file_storage_type', 'seaweedfs', 'seaweedfs存储', '1', null, '3', '2020-05-06 20:19:25', '3', '2020-04-25 08:00:17', '1');
INSERT INTO `sys_dict` VALUES ('40', '0', '文件存储方式', 'file_storage_type', 'oss', 'oss云存储', '1', '', '3', '2020-05-06 20:17:16', '3', '2020-05-06 20:18:37', '0');
INSERT INTO `sys_dict` VALUES ('41', '0', '文件存储方式', 'file_storage_type', 'cos', 'cos云存储', '1', '', '3', '2020-05-06 20:17:20', '3', '2020-05-06 20:18:44', '0');
INSERT INTO `sys_dict` VALUES ('42', '0', '文件存储方式', 'file_storage_type', 'kodo', 'kodo云存储', '1', '', '3', '2020-05-06 20:17:24', '3', '2020-05-06 20:18:51', '0');
INSERT INTO `sys_dict` VALUES ('43', '0', '操作类型', 'oper_type', 'upload', '上传', '1', null, '3', '2020-05-12 19:44:22', '3', '2020-05-12 19:44:22', '0');
INSERT INTO `sys_dict` VALUES ('44', '0', '操作类型', 'oper_type', 'download', '下载', '1', null, '3', '2020-05-12 19:51:26', '3', '2020-05-12 19:51:26', '0');
INSERT INTO `sys_dict` VALUES ('45', '0', '操作类型', 'oper_type', 'forbid', '禁用', '1', null, '3', '2020-05-12 19:53:14', '3', '2020-05-12 19:53:14', '0');
INSERT INTO `sys_dict` VALUES ('46', '0', '操作类型', 'oper_type', 'enable', '启用', '1', null, '3', '2020-05-12 19:53:14', '3', '2020-05-12 19:53:14', '0');
INSERT INTO `sys_dict` VALUES ('47', '0', '操作类型', 'oper_type', 'authorize', '授权', '1', null, '3', '2020-05-12 21:28:46', '3', '2020-05-12 19:58:17', '0');
INSERT INTO `sys_dict` VALUES ('48', '0', '操作类型', 'oper_type', 'clean', '清理', '1', null, '3', '2020-05-12 21:28:49', '3', '2020-05-12 21:01:31', '0');

-- ----------------------------
-- Table structure for `sys_file`
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `original_file_name` varchar(255) DEFAULT NULL COMMENT '上传文件的原始文件名',
  `new_file_name` varchar(50) DEFAULT NULL COMMENT '上传文件重命名后的文件名',
  `save_path` varchar(255) DEFAULT NULL COMMENT '文件保存路径',
  `file_url` varchar(255) DEFAULT NULL COMMENT '文件网络访问URL地址',
  `file_suffix` varchar(10) DEFAULT NULL COMMENT '文件后缀名',
  `storage_type` varchar(10) DEFAULT NULL COMMENT '存储方式',
  `file_length` int(11) DEFAULT NULL COMMENT '文件大小',
  `file_md5` varchar(32) DEFAULT NULL COMMENT '文件MD5值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `delete_flag` int(1) DEFAULT '0' COMMENT '删除标识(0:正常，1:已删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='文件管理';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('70', '6', '资产和设备关系.png', 'rBAACl64HLOATewUAABg_SMO31I123.png', 'group1/M00/00/00/rBAACl64HLOATewUAABg_SMO31I123.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64HLOATewUAABg_SMO31I123.png', 'png', 'fastdfs', '24829', 'afc3101196aa37fff6cee3cb7d0b348c', null, '2020-05-10 23:24:35', '30', '2020-05-10 23:24:35', '30', '1');
INSERT INTO `sys_file` VALUES ('71', '6', 'tb-gateway负载均衡_20200429153747.png', 'rBAACl64HLOAfNgVAAFLK2OYDo4760.png', 'group1/M00/00/00/rBAACl64HLOAfNgVAAFLK2OYDo4760.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64HLOAfNgVAAFLK2OYDo4760.png', 'png', 'fastdfs', '84779', '9f2f0ad85a6907e51ed72d7815e19459', null, '2020-05-10 23:24:35', '30', '2020-05-10 23:24:35', '30', '1');
INSERT INTO `sys_file` VALUES ('72', '0', '垃圾回收器2_20200319202259.png', 'rBAACl64njOAPBAUAAMVJyS_Ips857.png', 'group1/M00/00/00/rBAACl64njOAPBAUAAMVJyS_Ips857.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64njOAPBAUAAMVJyS_Ips857.png', 'png', 'fastdfs', '202023', '70d15e0cb0e34907bc2c0bb0962cea34', null, '2020-05-11 08:37:08', '32', '2020-05-11 08:37:08', '32', '0');
INSERT INTO `sys_file` VALUES ('73', '0', '垃圾回收器_20200319202259.png', 'rBAACl64njuAMIYYAAga-xBiWTQ653.png', 'group1/M00/00/00/rBAACl64njuAMIYYAAga-xBiWTQ653.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64njuAMIYYAAga-xBiWTQ653.png', 'png', 'fastdfs', '531195', '2f64687164e8d15608d879648eda6338', null, '2020-05-11 08:37:15', '32', '2020-05-11 08:37:15', '32', '0');
INSERT INTO `sys_file` VALUES ('74', '0', '狼.png', 'rBAACl64oimAF7FKAACDjkPoIfE888.png', 'group1/M00/00/00/rBAACl64oimAF7FKAACDjkPoIfE888.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64oimAF7FKAACDjkPoIfE888.png', 'png', 'fastdfs', '33678', '034c454458df34cc47b4e50058e78daa', null, '2020-05-11 08:54:01', '32', '2020-05-11 08:54:01', '32', '0');
INSERT INTO `sys_file` VALUES ('75', '0', '热水器.png', 'rBAACl64o2yAAhp8AACxijr734U232.png', 'group1/M00/00/00/rBAACl64o2yAAhp8AACxijr734U232.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64o2yAAhp8AACxijr734U232.png', 'png', 'fastdfs', '45450', '9c18954e0ffd84ea55a5c0a17ee8637b', null, '2020-05-11 08:59:24', '32', '2020-05-11 08:59:24', '32', '0');
INSERT INTO `sys_file` VALUES ('76', '0', '燃气灶.png', 'rBAACl64o2yAaru7AAC9g9Psqq8968.png', 'group1/M00/00/00/rBAACl64o2yAaru7AAC9g9Psqq8968.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64o2yAaru7AAC9g9Psqq8968.png', 'png', 'fastdfs', '48515', '643e6df27a9cdb48e18f341b0c6b8d8f', null, '2020-05-11 08:59:24', '32', '2020-05-11 08:59:24', '32', '0');
INSERT INTO `sys_file` VALUES ('77', '6', 'Iot_gateway_架构_20200226223934.png', 'rBAACl64pBiAXFcsAALINc5Ufyk291.png', 'group1/M00/00/00/rBAACl64pBiAXFcsAALINc5Ufyk291.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64pBiAXFcsAALINc5Ufyk291.png', 'png', 'fastdfs', '182325', 'ca161dd6883ed3b0220973b6becdc2f3', null, '2020-05-11 09:02:16', '30', '2020-05-11 09:02:16', '30', '1');
INSERT INTO `sys_file` VALUES ('78', '6', 'IOT网关架构图.png', 'rBAACl64pBmAIM1UAALHmRDmCT4153.png', 'group1/M00/00/00/rBAACl64pBmAIM1UAALHmRDmCT4153.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64pBmAIM1UAALHmRDmCT4153.png', 'png', 'fastdfs', '182169', '992b9370398674713233492a05a33aa0', null, '2020-05-11 09:02:17', '30', '2020-05-11 09:02:17', '30', '1');
INSERT INTO `sys_file` VALUES ('79', '6', 'jvm分代算法_20200319202120.png', 'rBAACl64pXyAWC15AAJEzhG3QBM279.png', 'group1/M00/00/00/rBAACl64pXyAWC15AAJEzhG3QBM279.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64pXyAWC15AAJEzhG3QBM279.png', 'png', 'fastdfs', '148686', '31348b50601073d04a2db93d771f5bfb', null, '2020-05-11 09:08:12', '30', '2020-05-11 09:08:12', '30', '1');
INSERT INTO `sys_file` VALUES ('80', '6', 'tbCEandPEcompare2.png', 'rBAACl64sE2ATcbkAACQ8rj4Y_Q821.png', 'group1/M00/00/00/rBAACl64sE2ATcbkAACQ8rj4Y_Q821.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64sE2ATcbkAACQ8rj4Y_Q821.png', 'png', 'fastdfs', '37106', '48d52ddb6478d196092f1e39c132a159', null, '2020-05-11 09:54:21', '30', '2020-05-11 09:54:21', '30', '1');
INSERT INTO `sys_file` VALUES ('81', '6', 'tbCEandPEcompare.png', 'rBAACl64sE2AT71bAAED87a3iQ4394.png', 'group1/M00/00/00/rBAACl64sE2AT71bAAED87a3iQ4394.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64sE2AT71bAAED87a3iQ4394.png', 'png', 'fastdfs', '66547', '35adcf0af62385d599f249633dc7a833', null, '2020-05-11 09:54:21', '30', '2020-05-11 09:54:21', '30', '1');
INSERT INTO `sys_file` VALUES ('82', '0', 'TB网关集群方案一.svg', 'rBAACl64sR-AWMLpAAJSpsIlFJQ630.svg', 'group1/M00/00/00/rBAACl64sR-AWMLpAAJSpsIlFJQ630.svg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64sR-AWMLpAAJSpsIlFJQ630.svg', 'svg', 'fastdfs', '152230', 'e31ef7bc273968fd5217ce8aee5b7f70', null, '2020-05-11 09:57:51', '32', '2020-05-11 09:57:51', '32', '0');
INSERT INTO `sys_file` VALUES ('83', '0', 'TB网关集群方案二.svg', 'rBAACl64sSmAQUVxAAIteMtGum8655.svg', 'group1/M00/00/00/rBAACl64sSmAQUVxAAIteMtGum8655.svg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64sSmAQUVxAAIteMtGum8655.svg', 'svg', 'fastdfs', '142712', '01bbcaf42b7fd3af4237ea2995a316aa', null, '2020-05-11 09:58:01', '32', '2020-05-11 09:58:01', '32', '0');
INSERT INTO `sys_file` VALUES ('84', '0', 'timg.jpg', 'rBAACl667qeAV2q-AABsYmyDkDs957.jpg', 'group1/M00/00/00/rBAACl667qeAV2q-AABsYmyDkDs957.jpg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl667qeAV2q-AABsYmyDkDs957.jpg', 'jpg', 'fastdfs', '27746', '0b8678480f5ee3129305d3ac511a0b06', null, '2020-05-13 02:44:55', '3', '2020-05-13 02:44:55', '3', '0');
INSERT INTO `sys_file` VALUES ('85', '0', 'timg.jpg', 'rBAACl6674iAFTpUAABsYmyDkDs326.jpg', 'group1/M00/00/00/rBAACl6674iAFTpUAABsYmyDkDs326.jpg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl6674iAFTpUAABsYmyDkDs326.jpg', 'jpg', 'fastdfs', '27746', '0b8678480f5ee3129305d3ac511a0b06', null, '2020-05-13 02:48:41', '3', '2020-05-13 02:48:41', '3', '0');
INSERT INTO `sys_file` VALUES ('86', '0', 'timg.jpg', 'rBAACl668TmAXg31AABsYmyDkDs121.jpg', 'group1/M00/00/00/rBAACl668TmAXg31AABsYmyDkDs121.jpg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl668TmAXg31AABsYmyDkDs121.jpg', 'jpg', 'fastdfs', '27746', '0b8678480f5ee3129305d3ac511a0b06', null, '2020-05-13 02:55:54', '3', '2020-05-13 02:55:54', '3', '0');
INSERT INTO `sys_file` VALUES ('87', '0', 'timg.jpg', 'rBAACl668eqALkkMAABsYmyDkDs025.jpg', 'group1/M00/00/00/rBAACl668eqALkkMAABsYmyDkDs025.jpg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl668eqALkkMAABsYmyDkDs025.jpg', 'jpg', 'fastdfs', '27746', '0b8678480f5ee3129305d3ac511a0b06', null, '2020-05-13 02:58:51', '3', '2020-05-13 02:58:51', '3', '0');
INSERT INTO `sys_file` VALUES ('88', '0', 'me_20200228004143.jpg', 'rBAACl668mWAR5smAAI1pwHQmMo389.jpg', 'group1/M00/00/00/rBAACl668mWAR5smAAI1pwHQmMo389.jpg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl668mWAR5smAAI1pwHQmMo389.jpg', 'jpg', 'fastdfs', '144807', 'c48255f88be8595af449fc6ec4bdf1c3', null, '2020-05-13 03:00:54', '3', '2020-05-13 03:00:54', '3', '0');
INSERT INTO `sys_file` VALUES ('89', '0', '码出未来.jpg', 'rBAACl668ueAP8hrAAA0QPSWMD4901.jpg', 'group1/M00/00/00/rBAACl668ueAP8hrAAA0QPSWMD4901.jpg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl668ueAP8hrAAA0QPSWMD4901.jpg', 'jpg', 'fastdfs', '13376', '8d2af682f979c23e0652ccb99a8bcb69', null, '2020-05-13 03:03:04', '3', '2020-05-13 03:03:04', '3', '0');
INSERT INTO `sys_file` VALUES ('90', '6', 'mapout_LOGO.png', 'rBAACl66-Y6AGHDPAAAbUjZ6V8I587.png', 'group1/M00/00/00/rBAACl66-Y6AGHDPAAAbUjZ6V8I587.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl66-Y6AGHDPAAAbUjZ6V8I587.png', 'png', 'fastdfs', '6994', 'f29a98fd87af1ba6473de9359e74f147', null, '2020-05-13 03:31:27', '38', '2020-05-13 03:31:27', '38', '1');
INSERT INTO `sys_file` VALUES ('91', '0', 'IOT网关架构图.png', 'rBAACl66_fKAVWQ0AALHmRDmCT4670.png', 'group1/M00/00/00/rBAACl66_fKAVWQ0AALHmRDmCT4670.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl66_fKAVWQ0AALHmRDmCT4670.png', 'png', 'fastdfs', '182169', '992b9370398674713233492a05a33aa0', null, '2020-05-13 03:50:10', '32', '2020-05-13 03:50:10', '32', '0');
INSERT INTO `sys_file` VALUES ('92', '0', 'TB网关集群方案一.svg', 'rBAACl66_oyAFbl7AAJSpsIlFJQ142.svg', 'group1/M00/00/00/rBAACl66_oyAFbl7AAJSpsIlFJQ142.svg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl66_oyAFbl7AAJSpsIlFJQ142.svg', 'svg', 'fastdfs', '152230', 'e31ef7bc273968fd5217ce8aee5b7f70', null, '2020-05-13 03:52:45', '32', '2020-05-13 03:52:45', '32', '0');
INSERT INTO `sys_file` VALUES ('93', '6', 'gc回收算法_20200319201740.png', 'rBAACl66_02AToOdAAIhAUGU_B8865.png', 'group1/M00/00/00/rBAACl66_02AToOdAAIhAUGU_B8865.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl66_02AToOdAAIhAUGU_B8865.png', 'png', 'fastdfs', '139521', '5c484ae76248ac00dcdeea38af733920', null, '2020-05-13 03:55:58', '38', '2020-05-13 03:55:58', '38', '1');
INSERT INTO `sys_file` VALUES ('94', '6', 'TB多租户设计.png', 'rBAACl67QoaAaQrPAAQi_ii-knM174.png', 'group1/M00/00/00/rBAACl67QoaAaQrPAAQi_ii-knM174.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl67QoaAaQrPAAQi_ii-knM174.png', 'png', 'fastdfs', '271102', 'ef1f087ef09f4593a2c10e8068bd0b28', null, '2020-05-13 08:42:46', '38', '2020-05-13 08:42:46', '38', '1');
INSERT INTO `sys_file` VALUES ('95', '6', '资产和设备关系.png', 'rBAACl67Q0SAWPoJAABg_SMO31I821.png', 'group1/M00/00/00/rBAACl67Q0SAWPoJAABg_SMO31I821.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl67Q0SAWPoJAABg_SMO31I821.png', 'png', 'fastdfs', '24829', 'afc3101196aa37fff6cee3cb7d0b348c', null, '2020-05-13 08:45:57', '38', '2020-05-13 08:45:57', '38', '1');
INSERT INTO `sys_file` VALUES ('96', '6', '油烟机.png', 'rBAACl67Q0WADKuiAADMvvIr6kQ183.png', 'group1/M00/00/00/rBAACl67Q0WADKuiAADMvvIr6kQ183.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl67Q0WADKuiAADMvvIr6kQ183.png', 'png', 'fastdfs', '52414', '9bfe5e35bf3f3d9141095f4e95e7cd95', null, '2020-05-13 08:45:57', '38', '2020-05-13 08:45:57', '38', '1');
INSERT INTO `sys_file` VALUES ('97', '6', 'gc算法1_20200319201813.png', 'rBAACl67RLeAMl8kAAM30YGixgE342.png', 'group1/M00/00/00/rBAACl67RLeAMl8kAAM30YGixgE342.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl67RLeAMl8kAAM30YGixgE342.png', 'png', 'fastdfs', '210897', 'c5a764e94227620f4bd0a11baa3a6dde', null, '2020-05-13 08:52:07', '38', '2020-05-13 08:52:07', '38', '1');
INSERT INTO `sys_file` VALUES ('98', '6', 'gc回收算法_20200319201740.png', 'rBAACl67RLmAD9mNAAIhAUGU_B8269.png', 'group1/M00/00/00/rBAACl67RLmAD9mNAAIhAUGU_B8269.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl67RLmAD9mNAAIhAUGU_B8269.png', 'png', 'fastdfs', '139521', '5c484ae76248ac00dcdeea38af733920', null, '2020-05-13 08:52:10', '38', '2020-05-13 08:52:10', '38', '1');
INSERT INTO `sys_file` VALUES ('99', '6', 'gc算法2_20200319201841.png', 'rBAACl67RLuAFJPCAAPD_54rF7U735.png', 'group1/M00/00/00/rBAACl67RLuAFJPCAAPD_54rF7U735.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl67RLuAFJPCAAPD_54rF7U735.png', 'png', 'fastdfs', '246783', '4f623c4e7952525f850c3af7fc549ec1', null, '2020-05-13 08:52:12', '38', '2020-05-13 08:52:12', '38', '1');
INSERT INTO `sys_file` VALUES ('100', '6', 'RPC.png', 'rBAACl67S7uAJqhBAABMH4dg-2Y436.png', 'group1/M00/00/00/rBAACl67S7uAJqhBAABMH4dg-2Y436.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl67S7uAJqhBAABMH4dg-2Y436.png', 'png', 'fastdfs', '19487', '12e98e80503018da3274f659413c143a', null, '2020-05-13 09:22:03', '38', '2020-05-13 09:22:03', '38', '1');
INSERT INTO `sys_file` VALUES ('101', '6', 'kafka.png', 'rBAACl67S7uANkchAAAg9WMyTT4136.png', 'group1/M00/00/00/rBAACl67S7uANkchAAAg9WMyTT4136.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl67S7uANkchAAAg9WMyTT4136.png', 'png', 'fastdfs', '8437', 'b012d6a48a1f6432cc95724cd22144e3', null, '2020-05-13 09:22:04', '38', '2020-05-13 09:22:04', '38', '1');
INSERT INTO `sys_file` VALUES ('102', '6', 'White Labeling_20200226211906.png', 'rBAACl67TDmAW8bKAABn9Gt4gs4460.png', 'group1/M00/00/00/rBAACl67TDmAW8bKAABn9Gt4gs4460.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl67TDmAW8bKAABn9Gt4gs4460.png', 'png', 'fastdfs', '26612', '5a2dd4d6cdfd999aaeb585612870ea22', null, '2020-05-13 09:24:45', '38', '2020-05-13 09:24:45', '38', '1');
INSERT INTO `sys_file` VALUES ('103', '6', 'thingsboard单体架构集群部署方案(修正版).docx', 'rBAACl67TF2ARdxHABFnlw3ghuc05.docx', 'group1/M00/00/01/rBAACl67TF2ARdxHABFnlw3ghuc05.docx', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67TF2ARdxHABFnlw3ghuc05.docx', 'docx', 'fastdfs', '1140631', '3c3d08798ddd9daf745a4c55f5df21d3', null, '2020-05-13 09:24:46', '38', '2020-05-13 09:24:46', '38', '1');
INSERT INTO `sys_file` VALUES ('104', '6', 'White Labeling_page.png', 'rBAACl67TF2AXF3zAAI4DPlA28M663.png', 'group1/M00/00/01/rBAACl67TF2AXF3zAAI4DPlA28M663.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67TF2AXF3zAAI4DPlA28M663.png', 'png', 'fastdfs', '145420', '5f4ae8899a45475503cd9f27af28e040', null, '2020-05-13 09:24:46', '38', '2020-05-13 09:24:46', '38', '1');
INSERT INTO `sys_file` VALUES ('105', '6', 'White Labeling_20200226211906.png', 'rBAACl67THaAbYeOAABn9Gt4gs4539.png', 'group1/M00/00/01/rBAACl67THaAbYeOAABn9Gt4gs4539.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67THaAbYeOAABn9Gt4gs4539.png', 'png', 'fastdfs', '26612', '5a2dd4d6cdfd999aaeb585612870ea22', null, '2020-05-13 09:25:20', '38', '2020-05-13 09:25:20', '38', '1');
INSERT INTO `sys_file` VALUES ('106', '6', 'thingsboard微服务架构部署方案规划.docx', 'rBAACl67THaAWhAjAAN8V9AT7Dw86.docx', 'group1/M00/00/01/rBAACl67THaAWhAjAAN8V9AT7Dw86.docx', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67THaAWhAjAAN8V9AT7Dw86.docx', 'docx', 'fastdfs', '228439', '53f8f8f93f6ef5c7c6ebb261eebe8791', null, '2020-05-13 09:25:20', '38', '2020-05-13 09:25:20', '38', '1');
INSERT INTO `sys_file` VALUES ('107', '6', 'thingsboard单体架构集群部署方案(修正版).docx', 'rBAACl67TH2AO3vBABFnlw3ghuc69.docx', 'group1/M00/00/01/rBAACl67TH2AO3vBABFnlw3ghuc69.docx', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67TH2AO3vBABFnlw3ghuc69.docx', 'docx', 'fastdfs', '1140631', '3c3d08798ddd9daf745a4c55f5df21d3', null, '2020-05-13 09:25:20', '38', '2020-05-13 09:25:20', '38', '1');
INSERT INTO `sys_file` VALUES ('108', '6', 'White Labeling_page.png', 'rBAACl67TH-AO6AWAAI4DPlA28M824.png', 'group1/M00/00/01/rBAACl67TH-AO6AWAAI4DPlA28M824.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67TH-AO6AWAAI4DPlA28M824.png', 'png', 'fastdfs', '145420', '5f4ae8899a45475503cd9f27af28e040', null, '2020-05-13 09:25:20', '38', '2020-05-13 09:25:20', '38', '1');
INSERT INTO `sys_file` VALUES ('109', '6', 'TB.png', 'rBAACl67TQeACqy0AABZ_23w6d8029.png', 'group1/M00/00/01/rBAACl67TQeACqy0AABZ_23w6d8029.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67TQeACqy0AABZ_23w6d8029.png', 'png', 'fastdfs', '23039', 'a0c67349abf8390cfac7dfcc2b2c7052', null, '2020-05-13 09:27:41', '38', '2020-05-13 09:27:41', '38', '1');
INSERT INTO `sys_file` VALUES ('110', '6', 'spark.png', 'rBAACl67TQqAAbOHAAC6pBLGLsQ951.png', 'group1/M00/00/01/rBAACl67TQqAAbOHAAC6pBLGLsQ951.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67TQqAAbOHAAC6pBLGLsQ951.png', 'png', 'fastdfs', '47780', 'd20c0b79c1bfcb8a74f5ec02cb8c7ceb', null, '2020-05-13 09:27:41', '38', '2020-05-13 09:27:41', '38', '1');
INSERT INTO `sys_file` VALUES ('111', '6', 'smart-metering-model.png', 'rBAACl67TQ2AGewtAADWi7gfC9M425.png', 'group1/M00/00/01/rBAACl67TQ2AGewtAADWi7gfC9M425.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67TQ2AGewtAADWi7gfC9M425.png', 'png', 'fastdfs', '54923', '27fe1049700fb62c0d55eb3d2aaa99b1', null, '2020-05-13 09:27:41', '38', '2020-05-13 09:27:41', '38', '1');
INSERT INTO `sys_file` VALUES ('112', '6', 'gc算法1_20200319201813.png', 'rBAACl67Tf6AEri-AAM30YGixgE729.png', 'group1/M00/00/01/rBAACl67Tf6AEri-AAM30YGixgE729.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67Tf6AEri-AAM30YGixgE729.png', 'png', 'fastdfs', '210897', 'c5a764e94227620f4bd0a11baa3a6dde', null, '2020-05-13 09:31:57', '38', '2020-05-13 09:31:57', '38', '1');
INSERT INTO `sys_file` VALUES ('113', '6', 'gc回收算法_20200319201740.png', 'rBAACl67TgOARq-qAAIhAUGU_B8835.png', 'group1/M00/00/01/rBAACl67TgOARq-qAAIhAUGU_B8835.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67TgOARq-qAAIhAUGU_B8835.png', 'png', 'fastdfs', '139521', '5c484ae76248ac00dcdeea38af733920', null, '2020-05-13 09:31:57', '38', '2020-05-13 09:31:57', '38', '1');
INSERT INTO `sys_file` VALUES ('114', '6', 'gc算法2_20200319201841.png', 'rBAACl67TgyAZtN7AAPD_54rF7U562.png', 'group1/M00/00/01/rBAACl67TgyAZtN7AAPD_54rF7U562.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67TgyAZtN7AAPD_54rF7U562.png', 'png', 'fastdfs', '246783', '4f623c4e7952525f850c3af7fc549ec1', null, '2020-05-13 09:31:57', '38', '2020-05-13 09:31:57', '38', '1');
INSERT INTO `sys_file` VALUES ('115', '6', '燃气灶.png', 'rBAACl67ToyAZNk1AAC9g9Psqq8636.png', 'group1/M00/00/01/rBAACl67ToyAZNk1AAC9g9Psqq8636.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67ToyAZNk1AAC9g9Psqq8636.png', 'png', 'fastdfs', '48515', '643e6df27a9cdb48e18f341b0c6b8d8f', null, '2020-05-13 09:34:07', '38', '2020-05-13 09:34:07', '38', '1');
INSERT INTO `sys_file` VALUES ('116', '6', '热水器.png', 'rBAACl67To-Ac8DSAACxijr734U937.png', 'group1/M00/00/01/rBAACl67To-Ac8DSAACxijr734U937.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67To-Ac8DSAACxijr734U937.png', 'png', 'fastdfs', '45450', '9c18954e0ffd84ea55a5c0a17ee8637b', null, '2020-05-13 09:34:07', '38', '2020-05-13 09:34:07', '38', '1');
INSERT INTO `sys_file` VALUES ('117', '6', '新风机.png', 'rBAACl67To-Ab-ZwAABt0iLWDkE749.png', 'group1/M00/00/01/rBAACl67To-Ab-ZwAABt0iLWDkE749.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67To-Ab-ZwAABt0iLWDkE749.png', 'png', 'fastdfs', '28114', '34ddbb44d2fda5a7b796882c300a7280', null, '2020-05-13 09:34:07', '38', '2020-05-13 09:34:07', '38', '1');
INSERT INTO `sys_file` VALUES ('118', '6', 'White Labeling_20200226211906.png', 'rBAACl67TCGAREfxAABn9Gt4gs4152.png', 'group1/M00/00/00/rBAACl67TCGAREfxAABn9Gt4gs4152.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl67TCGAREfxAABn9Gt4gs4152.png', 'png', 'fastdfs', '26612', '5a2dd4d6cdfd999aaeb585612870ea22', null, '2020-05-13 09:57:23', '38', '2020-05-13 09:57:23', '38', '1');
INSERT INTO `sys_file` VALUES ('119', '6', 'thingsboard微服务架构部署方案规划.docx', 'rBAACl67TCyAPSmKAAN8V9AT7Dw05.docx', 'group1/M00/00/00/rBAACl67TCyAPSmKAAN8V9AT7Dw05.docx', 'http://file.itgacl.com/group1/M00/00/00/rBAACl67TCyAPSmKAAN8V9AT7Dw05.docx', 'docx', 'fastdfs', '228439', '53f8f8f93f6ef5c7c6ebb261eebe8791', null, '2020-05-13 09:57:23', '38', '2020-05-13 09:57:23', '38', '1');
INSERT INTO `sys_file` VALUES ('120', '6', 'thingsboard单体架构集群部署方案(修正版).docx', 'rBAACl67U_6AQPO2ABFnlw3ghuc90.docx', 'group1/M00/00/01/rBAACl67U_6AQPO2ABFnlw3ghuc90.docx', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67U_6AQPO2ABFnlw3ghuc90.docx', 'docx', 'fastdfs', '1140631', '3c3d08798ddd9daf745a4c55f5df21d3', null, '2020-05-13 09:57:23', '38', '2020-05-13 09:57:23', '38', '1');
INSERT INTO `sys_file` VALUES ('121', '6', 'White Labeling_page.png', 'rBAACl67VAOACT18AAI4DPlA28M357.png', 'group1/M00/00/01/rBAACl67VAOACT18AAI4DPlA28M357.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67VAOACT18AAI4DPlA28M357.png', 'png', 'fastdfs', '145420', '5f4ae8899a45475503cd9f27af28e040', null, '2020-05-13 09:57:23', '38', '2020-05-13 09:57:23', '38', '1');
INSERT INTO `sys_file` VALUES ('122', '6', 'free_software_licenses.png', 'rBAACl67VQSAT2ewAATzSHOmpgA498.png', 'group1/M00/00/01/rBAACl67VQSAT2ewAATzSHOmpgA498.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67VQSAT2ewAATzSHOmpgA498.png', 'png', 'fastdfs', '324424', '14e8236423906ff90e930d4a6371d2cd', null, '2020-05-13 10:01:41', '38', '2020-05-13 10:01:41', '38', '1');
INSERT INTO `sys_file` VALUES ('123', '6', 'TB_tenantadmin.png', 'rBAACl67WM6Abz6wAAAZdlYQwxo626.png', 'group1/M00/00/01/rBAACl67WM6Abz6wAAAZdlYQwxo626.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67WM6Abz6wAAAZdlYQwxo626.png', 'png', 'fastdfs', '6518', 'bffec7b8eb9b5db9da02a9b1d75137df', null, '2020-05-13 10:17:50', '38', '2020-05-13 10:17:50', '38', '1');
INSERT INTO `sys_file` VALUES ('124', '6', 'gw_publish_msg_error4.png', 'rBAACl67WPaAWpgyAAB3xVx9mfE660.png', 'group1/M00/00/01/rBAACl67WPaAWpgyAAB3xVx9mfE660.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67WPaAWpgyAAB3xVx9mfE660.png', 'png', 'fastdfs', '30661', 'dbd3acfe7e99d791a49de1115521abad', null, '2020-05-13 10:18:31', '38', '2020-05-13 10:18:31', '38', '1');
INSERT INTO `sys_file` VALUES ('125', '6', 'TB.png', 'rBAACl67WWiAIuKXAABZ_23w6d8306.png', 'group1/M00/00/01/rBAACl67WWiAIuKXAABZ_23w6d8306.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67WWiAIuKXAABZ_23w6d8306.png', 'png', 'fastdfs', '23039', 'a0c67349abf8390cfac7dfcc2b2c7052', null, '2020-05-13 10:20:24', '38', '2020-05-13 10:20:24', '38', '1');
INSERT INTO `sys_file` VALUES ('126', '6', 'TB_tenantadmin.png', 'rBAACl67WX6AbKVYAAAZdlYQwxo617.png', 'group1/M00/00/01/rBAACl67WX6AbKVYAAAZdlYQwxo617.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67WX6AbKVYAAAZdlYQwxo617.png', 'png', 'fastdfs', '6518', 'bffec7b8eb9b5db9da02a9b1d75137df', null, '2020-05-13 10:20:47', '38', '2020-05-13 10:20:47', '38', '1');
INSERT INTO `sys_file` VALUES ('127', '6', 'thingsboard微服务架构部署方案规划.docx', 'rBAACl67WgaAI3OlAAN8V9AT7Dw55.docx', 'group1/M00/00/01/rBAACl67WgaAI3OlAAN8V9AT7Dw55.docx', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67WgaAI3OlAAN8V9AT7Dw55.docx', 'docx', 'fastdfs', '228439', '53f8f8f93f6ef5c7c6ebb261eebe8791', null, '2020-05-13 10:23:02', '38', '2020-05-13 10:23:02', '38', '1');
INSERT INTO `sys_file` VALUES ('128', '6', 'White Labeling_20200226211906.png', 'rBAACl67TAKAK3H6AABn9Gt4gs4285.png', 'group1/M00/00/00/rBAACl67TAKAK3H6AABn9Gt4gs4285.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl67TAKAK3H6AABn9Gt4gs4285.png', 'png', 'fastdfs', '26612', '5a2dd4d6cdfd999aaeb585612870ea22', null, '2020-05-13 10:49:29', '38', '2020-05-13 10:49:29', '38', '1');
INSERT INTO `sys_file` VALUES ('129', '6', 'thingsboard微服务架构部署方案规划.docx', 'rBAACl67TBCAH9-SAAN8V9AT7Dw77.docx', 'group1/M00/00/00/rBAACl67TBCAH9-SAAN8V9AT7Dw77.docx', 'http://file.itgacl.com/group1/M00/00/00/rBAACl67TBCAH9-SAAN8V9AT7Dw77.docx', 'docx', 'fastdfs', '228439', '53f8f8f93f6ef5c7c6ebb261eebe8791', null, '2020-05-13 10:49:29', '38', '2020-05-13 10:49:29', '38', '1');
INSERT INTO `sys_file` VALUES ('130', '6', 'thingsboard单体架构集群部署方案(修正版).docx', 'rBAACl67YDaABn2ZABFnlw3ghuc21.docx', 'group1/M00/00/01/rBAACl67YDaABn2ZABFnlw3ghuc21.docx', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67YDaABn2ZABFnlw3ghuc21.docx', 'docx', 'fastdfs', '1140631', '3c3d08798ddd9daf745a4c55f5df21d3', null, '2020-05-13 10:49:30', '38', '2020-05-13 10:49:30', '38', '1');
INSERT INTO `sys_file` VALUES ('131', '6', 'White Labeling_page.png', 'rBAACl67YDmABnAzAAI4DPlA28M940.png', 'group1/M00/00/01/rBAACl67YDmABnAzAAI4DPlA28M940.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67YDmABnAzAAI4DPlA28M940.png', 'png', 'fastdfs', '145420', '5f4ae8899a45475503cd9f27af28e040', null, '2020-05-13 10:49:30', '38', '2020-05-13 10:49:30', '38', '1');
INSERT INTO `sys_file` VALUES ('132', '6', 'free_software_licenses.png', 'rBAACl67YXuAGD2eAATzSHOmpgA777.png', 'group1/M00/00/01/rBAACl67YXuAGD2eAATzSHOmpgA777.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67YXuAGD2eAATzSHOmpgA777.png', 'png', 'fastdfs', '324424', '14e8236423906ff90e930d4a6371d2cd', null, '2020-05-13 10:54:51', '38', '2020-05-13 10:54:51', '38', '1');
INSERT INTO `sys_file` VALUES ('133', '6', 'free_software_licenses.png', 'rBAACl67YzGAEF_VAATzSHOmpgA456.png', 'group1/M00/00/01/rBAACl67YzGAEF_VAATzSHOmpgA456.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67YzGAEF_VAATzSHOmpgA456.png', 'png', 'fastdfs', '324424', '14e8236423906ff90e930d4a6371d2cd', null, '2020-05-13 11:02:10', '38', '2020-05-13 11:02:10', '38', '1');
INSERT INTO `sys_file` VALUES ('134', '6', 'haproxy_20200428163828.png', 'rBAACl67aE2AZ-O5AADVWljTiFA480.png', 'group1/M00/00/01/rBAACl67aE2AZ-O5AADVWljTiFA480.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67aE2AZ-O5AADVWljTiFA480.png', 'png', 'fastdfs', '54618', '6e836341de0a70cbb228581c608f9f70', null, '2020-05-13 11:23:58', '38', '2020-05-13 11:23:58', '38', '1');
INSERT INTO `sys_file` VALUES ('135', '6', 'gc算法1_20200319201813.png', 'rBAACl67aPyAP-QUAAM30YGixgE557.png', 'group1/M00/00/01/rBAACl67aPyAP-QUAAM30YGixgE557.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67aPyAP-QUAAM30YGixgE557.png', 'png', 'fastdfs', '210897', 'c5a764e94227620f4bd0a11baa3a6dde', null, '2020-05-13 11:27:09', '38', '2020-05-13 11:27:09', '38', '0');
INSERT INTO `sys_file` VALUES ('136', '6', 'gc算法3_20200319201943.png', 'rBAACl67aQGAefSYAAQ2IdN3NY4795.png', 'group1/M00/00/01/rBAACl67aQGAefSYAAQ2IdN3NY4795.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67aQGAefSYAAQ2IdN3NY4795.png', 'png', 'fastdfs', '276001', 'bdf89853f4d659d12b015dac870ba2a3', null, '2020-05-13 11:27:09', '38', '2020-05-13 11:27:09', '38', '0');
INSERT INTO `sys_file` VALUES ('137', '6', 'gc回收算法_20200319201740.png', 'rBAACl67aQWAHOYOAAIhAUGU_B8958.png', 'group1/M00/00/01/rBAACl67aQWAHOYOAAIhAUGU_B8958.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67aQWAHOYOAAIhAUGU_B8958.png', 'png', 'fastdfs', '139521', '5c484ae76248ac00dcdeea38af733920', null, '2020-05-13 11:27:09', '38', '2020-05-13 11:27:09', '38', '0');
INSERT INTO `sys_file` VALUES ('138', '6', 'gc算法2_20200319201841.png', 'rBAACl67aQyAMAqkAAPD_54rF7U013.png', 'group1/M00/00/01/rBAACl67aQyAMAqkAAPD_54rF7U013.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67aQyAMAqkAAPD_54rF7U013.png', 'png', 'fastdfs', '246783', '4f623c4e7952525f850c3af7fc549ec1', null, '2020-05-13 11:27:09', '38', '2020-05-13 11:27:09', '38', '0');
INSERT INTO `sys_file` VALUES ('139', '0', 'magic4j项目结构_20200508151434.png', 'rBAACl67bX2AZM4OAAA0kXoP_b4673.png', 'group1/M00/00/01/rBAACl67bX2AZM4OAAA0kXoP_b4673.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67bX2AZM4OAAA0kXoP_b4673.png', 'png', 'fastdfs', '13457', '322b7cd2beba4c2976f866f52e9248ea', null, '2020-05-13 11:46:05', '32', '2020-05-13 11:46:05', '32', '0');
INSERT INTO `sys_file` VALUES ('140', '4', 'comba.png', 'rBAACl67blGAbMzEAAAGvZZdWIY806.png', 'group1/M00/00/01/rBAACl67blGAbMzEAAAGvZZdWIY806.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67blGAbMzEAAAGvZZdWIY806.png', 'png', 'fastdfs', '1725', 'd87a4cade042df2a0f06409a2e503aad', null, '2020-05-13 11:49:38', '37', '2020-05-13 11:49:38', '37', '0');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `log_type` int(1) DEFAULT NULL COMMENT '日志类型(0:操作日志，1:登录日志)',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `module_name` varchar(30) DEFAULT NULL COMMENT '模块名',
  `operation` varchar(30) DEFAULT NULL COMMENT '操作',
  `class_name` varchar(255) DEFAULT NULL COMMENT '类名',
  `method` varchar(30) DEFAULT NULL COMMENT '方法名',
  `req_param` varchar(2000) DEFAULT NULL COMMENT '请求参数,json字符串',
  `execute_time` bigint(20) DEFAULT NULL COMMENT '执行时间(毫秒)',
  `client_ip` varchar(20) DEFAULT NULL COMMENT '客户端IP',
  `client_browser` varchar(50) DEFAULT NULL COMMENT '客户端浏览器',
  `client_operation_system` varchar(50) DEFAULT NULL COMMENT '客户端操作系统',
  `client_operation_location` varchar(255) DEFAULT NULL COMMENT '客户端操作地点',
  `handle_server_ip` varchar(20) DEFAULT NULL COMMENT '处理请求的服务器IP',
  `status` int(1) DEFAULT NULL COMMENT '执行结果：0成功，1：失败',
  `json_result` varchar(3000) DEFAULT NULL COMMENT '响应结果，json字符串',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1515 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '岗位名称',
  `post_code` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '岗位编码',
  `order_num` int(11) DEFAULT NULL COMMENT '显示顺序',
  `status` int(11) DEFAULT NULL COMMENT '状态（0正常 1停用）',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` int(1) DEFAULT NULL COMMENT '删除标识(0:正常，1:已删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', '董事长', 'CEO', '1', '0', '0', null, '3', '2020-04-08 15:18:45', '3', '2020-04-08 15:18:45', '0');
INSERT INTO `sys_post` VALUES ('2', '产品经理', 'PM', '2', '0', '0', null, '3', '2020-04-08 15:20:26', '3', '2020-04-08 15:20:26', '0');
INSERT INTO `sys_post` VALUES ('3', '技术总监', 'CTO', '3', '0', '0', '', '3', '2020-04-08 15:20:40', '3', '2020-04-15 10:35:06', '0');
INSERT INTO `sys_post` VALUES ('4', '财务总监', 'CFO', '4', '0', '0', null, '3', '2020-04-08 15:20:50', '3', '2020-04-08 15:20:50', '0');
INSERT INTO `sys_post` VALUES ('5', '人力资源', 'HR', '2', '1', '0', '', '3', '2020-04-08 15:21:10', '3', '2020-04-15 10:33:58', '0');
INSERT INTO `sys_post` VALUES ('6', '研发经理', 'DM', '6', '0', '0', null, '3', '2020-04-08 15:21:49', '3', '2020-04-08 15:21:49', '0');
INSERT INTO `sys_post` VALUES ('7', '部门经理', 'deptManager', '3', '0', '0', '部门经理', '3', '2020-04-15 10:34:36', '3', '2020-04-15 10:34:36', '1');
INSERT INTO `sys_post` VALUES ('8', '董事长1', 'CEO2', '1', '0', '0', null, '3', '2020-04-15 10:35:45', '3', '2020-04-15 10:35:45', '1');
INSERT INTO `sys_post` VALUES ('9', 'aa', 'aa', '1', '1', '0', null, '3', '2020-04-15 10:35:54', '3', '2020-04-15 10:35:54', '1');
INSERT INTO `sys_post` VALUES ('10', 'bbb', 'aab', '1', '0', '0', null, '3', '2020-04-15 10:36:03', '3', '2020-04-15 10:36:03', '1');

-- ----------------------------
-- Table structure for `sys_resource`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT '父ID',
  `parent_name` varchar(50) DEFAULT NULL COMMENT '父名称(冗余字段)',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `perms` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `type` int(1) DEFAULT '1' COMMENT '类型（0：系统资源 1：菜单   2：按钮）',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `level` int(11) DEFAULT NULL COMMENT '资源等级(级别)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` int(1) DEFAULT '0' COMMENT '删除标识(0:正常，1:已删除)',
  `request_types` varchar(255) DEFAULT NULL COMMENT 'HTTP请求方式(GET、POST、PUT、DELETE)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1777 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统资源';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('87', '系统管理', null, '', '', 'system', '', '1', '1', '1', '', '3', '2020-04-07 16:29:55', '3', '2020-05-07 17:54:40', '0', null);
INSERT INTO `sys_resource` VALUES ('88', '用户管理', '87', '系统管理', 'system/user/index', 'user', '', '1', '1', '2', '', '3', '2020-04-07 16:31:15', '3', '2020-04-11 08:26:22', '0', null);
INSERT INTO `sys_resource` VALUES ('89', '角色管理', '87', '系统管理', 'system/role/index', 'peoples', '', '1', '2', '2', '', '3', '2020-04-07 16:31:47', '3', '2020-04-11 08:26:29', '0', null);
INSERT INTO `sys_resource` VALUES ('90', '菜单管理', '87', '系统管理', 'system/menu/index', 'tree-table', '', '1', '3', '2', '', '3', '2020-04-07 16:32:24', '3', '2020-04-11 08:26:37', '0', null);
INSERT INTO `sys_resource` VALUES ('681', '数据字典', '87', '系统管理', 'system/dict/index', 'dict', '', '1', '5', '2', '', '3', '2020-04-11 08:12:52', '3', '2020-04-11 08:27:27', '1', null);
INSERT INTO `sys_resource` VALUES ('682', '部门管理', '87', '系统管理', 'system/dept/index', 'tree', '', '1', '4', '2', '', '3', '2020-04-11 08:15:30', '3', '2020-04-11 08:26:47', '1', null);
INSERT INTO `sys_resource` VALUES ('689', '系统工具', null, '', '', 'tool', '', '1', '3', null, '', '3', '2020-04-13 15:41:29', '3', '2020-05-07 17:54:52', '0', null);
INSERT INTO `sys_resource` VALUES ('690', '表单构建', '689', '系统工具', 'tool/build/index', 'form', '', '1', '1', null, '', '3', '2020-04-13 15:43:55', '3', '2020-05-07 18:11:29', '0', null);
INSERT INTO `sys_resource` VALUES ('691', '系统配置', '87', '系统管理', 'system/config/index', 'guide', '', '1', '4', '2', '', '3', '2020-04-13 17:44:20', '3', '2020-05-07 17:58:21', '0', null);
INSERT INTO `sys_resource` VALUES ('698', '数据字典', '87', '系统管理', 'system/dict/index', 'dict', '', '1', '5', '2', '', '3', '2020-04-13 22:26:06', '3', '2020-05-07 17:58:35', '0', null);
INSERT INTO `sys_resource` VALUES ('699', '系统日志', '87', '系统管理', 'system/log/index', 'log', '', '1', '11', '2', '', '3', '2020-04-14 11:28:22', '3', '2020-05-07 18:00:23', '0', null);
INSERT INTO `sys_resource` VALUES ('700', '登录日志', '699', '系统日志', 'system/log/login/index', 'logininfor', '', '1', '1', '3', '', '3', '2020-04-14 11:30:37', '3', '2020-04-14 16:54:48', '0', null);
INSERT INTO `sys_resource` VALUES ('701', '操作日志', '699', '系统日志', 'system/log/opera/index', 'monitor', '', '1', '2', '3', '', '3', '2020-04-14 11:36:17', '3', '2020-04-14 16:54:59', '0', null);
INSERT INTO `sys_resource` VALUES ('723', '部门管理', '87', '系统管理', 'system/dept/index', 'tree', '', '1', '8', '2', '', '3', '2020-04-15 00:05:46', '3', '2020-05-07 18:13:14', '0', null);
INSERT INTO `sys_resource` VALUES ('726', '岗位管理', '87', '系统管理', 'system/post/index', 'post', '', '1', '9', '2', '', '3', '2020-04-15 10:32:26', '3', '2020-05-07 18:13:20', '0', null);
INSERT INTO `sys_resource` VALUES ('727', '租户管理', '87', '系统管理', 'system/tenant/index', 'nested', '', '1', '7', '2', '', '3', '2020-04-15 19:24:40', '3', '2020-05-07 19:40:21', '0', null);
INSERT INTO `sys_resource` VALUES ('730', '调度管理', null, '', '', 'job', '', '1', '2', null, '', '3', '2020-04-15 22:02:01', '3', '2020-05-07 17:54:47', '0', null);
INSERT INTO `sys_resource` VALUES ('759', '任务管理', '730', '调度管理', 'schedule/job/index', 'skill', null, '1', '1', null, null, '3', '2020-04-17 14:45:38', '3', '2020-04-17 14:45:38', '0', null);
INSERT INTO `sys_resource` VALUES ('760', '调度日志', '730', '调度管理', 'schedule/log/index', 'log', null, '1', '2', null, null, '3', '2020-04-17 14:46:18', '3', '2020-04-17 14:46:18', '0', null);
INSERT INTO `sys_resource` VALUES ('770', '安全设置', '1774', '系统设置', 'system/setting/security/index', 'skill', '', '1', '1', '3', '', '3', '2020-04-22 15:24:11', '3', '2020-05-13 02:12:12', '0', null);
INSERT INTO `sys_resource` VALUES ('783', '文件管理', '87', '系统管理', 'system/file/index', 'upload', '', '1', '10', '2', '', '3', '2020-05-06 14:10:55', '3', '2020-05-07 18:13:27', '0', null);
INSERT INTO `sys_resource` VALUES ('1391', '资源管理', '87', '系统管理', 'system/authRes/index', 'tree-table', null, '1', '1', '2', null, '32', '2020-05-11 14:01:17', '32', '2020-05-11 14:01:17', '0', null);
INSERT INTO `sys_resource` VALUES ('1398', '租户信息', '727', '租户管理', 'system/tenant/info/index', 'list', null, '1', '1', '3', null, '3', '2020-05-12 09:02:01', '3', '2020-05-12 09:02:01', '0', null);
INSERT INTO `sys_resource` VALUES ('1399', '租户用户', '727', '租户管理', 'system/tenant/user/index', 'peoples', null, '1', '2', '3', null, '3', '2020-05-12 09:02:42', '3', '2020-05-12 09:02:42', '0', null);
INSERT INTO `sys_resource` VALUES ('1714', '调度日志', null, null, '#调度日志#', null, '#', '0', '0', '1', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', '#');
INSERT INTO `sys_resource` VALUES ('1715', '字典管理', null, null, '#字典管理#', null, '#', '0', '0', '1', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', '#');
INSERT INTO `sys_resource` VALUES ('1716', '部门管理', null, null, '#部门管理#', null, '#', '0', '0', '1', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', '#');
INSERT INTO `sys_resource` VALUES ('1717', '岗位管理', null, null, '#岗位管理#', null, '#', '0', '0', '1', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', '#');
INSERT INTO `sys_resource` VALUES ('1718', '系统角色', null, null, '#系统角色#', null, '#', '0', '0', '1', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', '#');
INSERT INTO `sys_resource` VALUES ('1719', '系统用户', null, null, '#系统用户#', null, '#', '0', '0', '1', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', '#');
INSERT INTO `sys_resource` VALUES ('1720', '文件管理', null, null, '#文件管理#', null, '#', '0', '0', '1', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', '#');
INSERT INTO `sys_resource` VALUES ('1721', '系统配置', null, null, '#系统配置#', null, '#', '0', '0', '1', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', '#');
INSERT INTO `sys_resource` VALUES ('1722', '租户管理', null, null, '#租户管理#', null, '#', '0', '0', '1', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', '#');
INSERT INTO `sys_resource` VALUES ('1723', '系统资源', null, null, '#系统资源#', null, '#', '0', '0', '1', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', '#');
INSERT INTO `sys_resource` VALUES ('1724', '定时任务', null, null, '#定时任务#', null, '#', '0', '0', '1', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', '#');
INSERT INTO `sys_resource` VALUES ('1725', '日志管理', null, null, '#日志管理#', null, '#', '0', '0', '1', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', '#');
INSERT INTO `sys_resource` VALUES ('1726', '删除', '1714', '调度日志', '/api/schedule/jobLog/{ids}', null, 'delete:schedule:jobLog', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1727', '清空', '1714', '调度日志', '/api/schedule/jobLog/clean', null, 'delete:schedule:jobLog:clean', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1728', '修改', '1715', '字典管理', '/api/sys/dict', null, 'put:sys:dict', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1729', '删除', '1715', '字典管理', '/api/sys/dict/{ids}', null, 'delete:sys:dict', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1730', '新增', '1715', '字典管理', '/api/sys/dict', null, 'post:sys:dict', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1731', '修改', '1716', '部门管理', '/api/sys/dept', null, 'put:sys:dept', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1732', '删除', '1716', '部门管理', '/api/sys/dept/{ids}', null, 'delete:sys:dept', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1733', '新增', '1716', '部门管理', '/api/sys/dept', null, 'post:sys:dept', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1734', '修改', '1717', '岗位管理', '/api/sys/post', null, 'put:sys:post', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1735', '删除', '1717', '岗位管理', '/api/sys/post/{ids}', null, 'delete:sys:post', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1736', '新增', '1717', '岗位管理', '/api/sys/post', null, 'post:sys:post', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1737', '修改', '1718', '系统角色', '/api/sys/role', null, 'put:sys:role', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1738', '删除', '1718', '系统角色', '/api/sys/role/{ids}', null, 'delete:sys:role', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1739', '新增', '1718', '系统角色', '/api/sys/role', null, 'post:sys:role', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1740', '授权', '1718', '系统角色', '/api/sys/role/{id}/res', null, 'put:sys:role:res', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1741', '启用', '1719', '系统用户', '/api/sys/user/enable/{ids}', null, 'put:sys:user:enable', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1742', '修改', '1719', '系统用户', '/api/sys/user', null, 'put:sys:user', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1743', '删除', '1719', '系统用户', '/api/sys/user/{ids}', null, 'delete:sys:user', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1744', '新增', '1719', '系统用户', '/api/sys/user', null, 'post:sys:user', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1745', '重置密码', '1719', '系统用户', '/api/sys/user/resetPwd', null, 'put:sys:user:resetPwd', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '3', '2020-05-12 21:52:20', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1746', '禁用', '1719', '系统用户', '/api/sys/user/forbid/{ids}', null, 'put:sys:user:forbid', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1747', '查询租户用户', '1719', '系统用户', '/api/sys/user/tenant/user/list', null, 'get:sys:user:tenant:user:list', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '3', '2020-05-12 21:52:35', '0', 'GET');
INSERT INTO `sys_resource` VALUES ('1748', '删除', '1720', '文件管理', '/api/sys/file/{ids}', null, 'delete:sys:file', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1749', '上传网络文件', '1720', '文件管理', '/api/sys/file/uploadNetworkFile', null, 'post:sys:file:uploadNetworkFile', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '3', '2020-05-12 21:47:45', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1750', '存储设置', '1720', '文件管理', '/api/sys/file/storageType/setting', null, 'put:sys:file:storageType:setting', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '3', '2020-05-12 21:51:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1751', '上传', '1720', '文件管理', '/api/sys/file/upload', null, 'post:sys:file:upload', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1752', '下载', '1720', '文件管理', '/api/sys/file/download', null, 'get:sys:file:download', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'GET');
INSERT INTO `sys_resource` VALUES ('1753', '修改', '1721', '系统配置', '/api/sys/config', null, 'put:sys:config', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1754', '删除', '1721', '系统配置', '/api/sys/config/{ids}', null, 'delete:sys:config', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1755', '新增', '1721', '系统配置', '/api/sys/config', null, 'post:sys:config', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1756', '刷新RSA秘钥', '1721', '系统配置', '/api/sys/config/refreshRsaSecretKey', null, 'post:sys:config:refreshRsaSecretKey', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '3', '2020-05-12 21:53:22', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1757', '保存安全设置', '1721', '系统配置', '/api/sys/config/security/set', null, 'post:sys:config:security:set', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '3', '2020-05-12 21:53:50', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1758', '刷新AES秘钥', '1721', '系统配置', '/api/sys/config/refreshAesSecretKey', null, 'post:sys:config:refreshAesSecretKey', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '3', '2020-05-12 21:54:00', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1759', '修改', '1722', '租户管理', '/api/sys/tenant', null, 'put:sys:tenant', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1760', '删除', '1722', '租户管理', '/api/sys/tenant/{ids}', null, 'delete:sys:tenant', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1761', '新增', '1722', '租户管理', '/api/sys/tenant', null, 'post:sys:tenant', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1762', '修改', '1723', '系统资源', '/api/sys/resource', null, 'put:sys:resource', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1763', '删除', '1723', '系统资源', '/api/sys/resource/{ids}', null, 'delete:sys:resource', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1764', '新增', '1723', '系统资源', '/api/sys/resource', null, 'post:sys:resource', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1765', '刷新', '1723', '系统资源', '/api/sys/resource/refreshAuthRes', null, 'post:sys:resource:refreshAuthRes', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '3', '2020-05-12 21:54:25', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1766', '运行', '1724', '定时任务', '/api/schedule/job/run/{ids}', null, 'put:schedule:job:run', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1767', '修改', '1724', '定时任务', '/api/schedule/job', null, 'put:schedule:job', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1768', '删除', '1724', '定时任务', '/api/schedule/job/{ids}', null, 'delete:schedule:job', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1769', '新增', '1724', '定时任务', '/api/schedule/job', null, 'post:schedule:job', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1770', '恢复', '1724', '定时任务', '/api/schedule/job/resume/{ids}', null, 'put:schedule:job:resume', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1771', '暂停', '1724', '定时任务', '/api/schedule/job/pause/{ids}', null, 'put:schedule:job:pause', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1772', '删除', '1725', '日志管理', '/api/sys/log/{ids}', null, 'delete:sys:log', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1773', '清理', '1725', '日志管理', '/api/sys/log/clean', null, 'delete:sys:log:clean', '0', '0', '2', null, '1', '2020-05-12 21:29:30', '1', '2020-05-12 21:29:30', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1774', '系统设置', '87', '系统管理', 'system/setting/index', 'server', null, '1', '6', '2', null, '3', '2020-05-13 02:11:25', '3', '2020-05-13 02:11:25', '0', null);
INSERT INTO `sys_resource` VALUES ('1775', '平台设置', '1774', '系统设置', 'system/setting/platform/index', 'example', null, '1', '2', '3', null, '3', '2020-05-13 02:13:25', '3', '2020-05-13 02:13:25', '0', null);
INSERT INTO `sys_resource` VALUES ('1776', '保存平台设置', '1721', '系统配置', '/api/sys/config/platformSetting', null, 'post:sys:config:platformSetting', '0', '0', '2', null, '1', '2020-05-13 03:10:48', '3', '2020-05-13 03:16:51', '0', 'POST');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(50) DEFAULT NULL COMMENT '角色编码（示例：super_admin,normal_admin）',
  `data_scope` int(11) DEFAULT NULL COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` int(1) DEFAULT '0' COMMENT '删除标识(0:正常，1:已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('4', '超级管理员', 'magic4j_admin', '1', '系统的超级管理员，拥有最高权限', '0', '1', '2020-04-03 23:52:58', '3', '2020-04-11 14:05:46', '0');
INSERT INTO `sys_role` VALUES ('5', '租户管理员', 'tenant_admin', '1', '租户管理员', '0', '32', '2020-04-04 08:01:20', '32', '2020-05-13 03:56:51', '0');
INSERT INTO `sys_role` VALUES ('10', '系统管理员', 'sys_admin', '4', '系统普通管理员', '0', '3', '2020-04-11 11:51:32', '3', '2020-05-13 03:43:36', '0');
INSERT INTO `sys_role` VALUES ('13', '管理员', 'sys_admin', '1', null, '6', '38', '2020-05-13 11:36:02', '38', '2020-05-13 11:36:02', '0');
INSERT INTO `sys_role` VALUES ('14', '普通用户', 'dept_admin', '1', null, '6', '38', '2020-05-13 11:38:43', '38', '2020-05-13 11:38:43', '0');
INSERT INTO `sys_role` VALUES ('15', '系统管理员', 'sys_admin', '1', null, '4', '37', '2020-05-13 11:51:35', '37', '2020-05-13 11:51:35', '0');

-- ----------------------------
-- Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('1', '6', '2');
INSERT INTO `sys_role_dept` VALUES ('2', '7', '5');
INSERT INTO `sys_role_dept` VALUES ('3', '7', '6');
INSERT INTO `sys_role_dept` VALUES ('26', '4', '1');
INSERT INTO `sys_role_dept` VALUES ('27', '4', '2');
INSERT INTO `sys_role_dept` VALUES ('28', '4', '3');
INSERT INTO `sys_role_dept` VALUES ('29', '4', '4');
INSERT INTO `sys_role_dept` VALUES ('30', '4', '5');
INSERT INTO `sys_role_dept` VALUES ('31', '4', '6');
INSERT INTO `sys_role_dept` VALUES ('32', '4', '8');
INSERT INTO `sys_role_dept` VALUES ('33', '4', '9');
INSERT INTO `sys_role_dept` VALUES ('34', '4', '10');
INSERT INTO `sys_role_dept` VALUES ('35', '4', '11');
INSERT INTO `sys_role_dept` VALUES ('36', '4', '12');
INSERT INTO `sys_role_dept` VALUES ('49', '10', '1');
INSERT INTO `sys_role_dept` VALUES ('50', '10', '2');
INSERT INTO `sys_role_dept` VALUES ('51', '10', '5');
INSERT INTO `sys_role_dept` VALUES ('52', '10', '10');
INSERT INTO `sys_role_dept` VALUES ('53', '10', '11');
INSERT INTO `sys_role_dept` VALUES ('54', '10', '12');
INSERT INTO `sys_role_dept` VALUES ('145', '5', '1');
INSERT INTO `sys_role_dept` VALUES ('146', '5', '2');
INSERT INTO `sys_role_dept` VALUES ('147', '5', '3');
INSERT INTO `sys_role_dept` VALUES ('148', '5', '4');
INSERT INTO `sys_role_dept` VALUES ('149', '5', '5');
INSERT INTO `sys_role_dept` VALUES ('150', '5', '6');
INSERT INTO `sys_role_dept` VALUES ('151', '5', '8');
INSERT INTO `sys_role_dept` VALUES ('152', '5', '9');
INSERT INTO `sys_role_dept` VALUES ('153', '5', '10');
INSERT INTO `sys_role_dept` VALUES ('154', '5', '11');
INSERT INTO `sys_role_dept` VALUES ('155', '5', '12');
INSERT INTO `sys_role_dept` VALUES ('156', '5', '13');
INSERT INTO `sys_role_dept` VALUES ('157', '5', '14');
INSERT INTO `sys_role_dept` VALUES ('158', '11', '5');
INSERT INTO `sys_role_dept` VALUES ('159', '11', '9');
INSERT INTO `sys_role_dept` VALUES ('160', '11', '10');
INSERT INTO `sys_role_dept` VALUES ('161', '11', '11');
INSERT INTO `sys_role_dept` VALUES ('162', '11', '12');
INSERT INTO `sys_role_dept` VALUES ('163', '12', '5');
INSERT INTO `sys_role_dept` VALUES ('164', '12', '9');
INSERT INTO `sys_role_dept` VALUES ('165', '12', '10');
INSERT INTO `sys_role_dept` VALUES ('166', '12', '11');
INSERT INTO `sys_role_dept` VALUES ('167', '12', '12');
INSERT INTO `sys_role_dept` VALUES ('168', '13', '15');
INSERT INTO `sys_role_dept` VALUES ('169', '13', '16');
INSERT INTO `sys_role_dept` VALUES ('170', '13', '17');
INSERT INTO `sys_role_dept` VALUES ('171', '13', '18');
INSERT INTO `sys_role_dept` VALUES ('172', '13', '19');
INSERT INTO `sys_role_dept` VALUES ('173', '13', '20');
INSERT INTO `sys_role_dept` VALUES ('174', '14', '15');
INSERT INTO `sys_role_dept` VALUES ('175', '14', '16');
INSERT INTO `sys_role_dept` VALUES ('176', '14', '17');
INSERT INTO `sys_role_dept` VALUES ('177', '14', '18');
INSERT INTO `sys_role_dept` VALUES ('178', '14', '19');
INSERT INTO `sys_role_dept` VALUES ('179', '14', '20');

-- ----------------------------
-- Table structure for `sys_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `resource_id` bigint(20) DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4813 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色与资源对应关系表';

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('1467', '4', '87');
INSERT INTO `sys_role_resource` VALUES ('1468', '4', '88');
INSERT INTO `sys_role_resource` VALUES ('1469', '4', '89');
INSERT INTO `sys_role_resource` VALUES ('1470', '4', '90');
INSERT INTO `sys_role_resource` VALUES ('1583', '4', '689');
INSERT INTO `sys_role_resource` VALUES ('1584', '4', '690');
INSERT INTO `sys_role_resource` VALUES ('1585', '4', '691');
INSERT INTO `sys_role_resource` VALUES ('1590', '4', '698');
INSERT INTO `sys_role_resource` VALUES ('1591', '4', '699');
INSERT INTO `sys_role_resource` VALUES ('1592', '4', '700');
INSERT INTO `sys_role_resource` VALUES ('1593', '4', '701');
INSERT INTO `sys_role_resource` VALUES ('1594', '4', '723');
INSERT INTO `sys_role_resource` VALUES ('1597', '4', '726');
INSERT INTO `sys_role_resource` VALUES ('1598', '4', '727');
INSERT INTO `sys_role_resource` VALUES ('1601', '4', '730');
INSERT INTO `sys_role_resource` VALUES ('1622', '4', '759');
INSERT INTO `sys_role_resource` VALUES ('1623', '4', '760');
INSERT INTO `sys_role_resource` VALUES ('1633', '4', '770');
INSERT INTO `sys_role_resource` VALUES ('1646', '4', '783');
INSERT INTO `sys_role_resource` VALUES ('3370', '4', '1391');
INSERT INTO `sys_role_resource` VALUES ('3377', '4', '1398');
INSERT INTO `sys_role_resource` VALUES ('3378', '4', '1399');
INSERT INTO `sys_role_resource` VALUES ('3632', '11', '87');
INSERT INTO `sys_role_resource` VALUES ('3633', '11', '699');
INSERT INTO `sys_role_resource` VALUES ('3634', '11', '88');
INSERT INTO `sys_role_resource` VALUES ('3635', '11', '691');
INSERT INTO `sys_role_resource` VALUES ('3636', '11', '726');
INSERT INTO `sys_role_resource` VALUES ('3637', '11', '701');
INSERT INTO `sys_role_resource` VALUES ('3681', '12', '87');
INSERT INTO `sys_role_resource` VALUES ('3682', '12', '699');
INSERT INTO `sys_role_resource` VALUES ('3683', '12', '88');
INSERT INTO `sys_role_resource` VALUES ('3684', '12', '723');
INSERT INTO `sys_role_resource` VALUES ('3685', '12', '783');
INSERT INTO `sys_role_resource` VALUES ('3686', '12', '700');
INSERT INTO `sys_role_resource` VALUES ('4216', '4', '1726');
INSERT INTO `sys_role_resource` VALUES ('4217', '4', '1727');
INSERT INTO `sys_role_resource` VALUES ('4218', '4', '1728');
INSERT INTO `sys_role_resource` VALUES ('4219', '4', '1729');
INSERT INTO `sys_role_resource` VALUES ('4220', '4', '1730');
INSERT INTO `sys_role_resource` VALUES ('4221', '4', '1731');
INSERT INTO `sys_role_resource` VALUES ('4222', '4', '1732');
INSERT INTO `sys_role_resource` VALUES ('4223', '4', '1733');
INSERT INTO `sys_role_resource` VALUES ('4224', '4', '1734');
INSERT INTO `sys_role_resource` VALUES ('4225', '4', '1735');
INSERT INTO `sys_role_resource` VALUES ('4226', '4', '1736');
INSERT INTO `sys_role_resource` VALUES ('4227', '4', '1737');
INSERT INTO `sys_role_resource` VALUES ('4228', '4', '1738');
INSERT INTO `sys_role_resource` VALUES ('4229', '4', '1739');
INSERT INTO `sys_role_resource` VALUES ('4230', '4', '1740');
INSERT INTO `sys_role_resource` VALUES ('4231', '4', '1741');
INSERT INTO `sys_role_resource` VALUES ('4232', '4', '1742');
INSERT INTO `sys_role_resource` VALUES ('4233', '4', '1743');
INSERT INTO `sys_role_resource` VALUES ('4234', '4', '1744');
INSERT INTO `sys_role_resource` VALUES ('4235', '4', '1745');
INSERT INTO `sys_role_resource` VALUES ('4236', '4', '1746');
INSERT INTO `sys_role_resource` VALUES ('4237', '4', '1747');
INSERT INTO `sys_role_resource` VALUES ('4238', '4', '1748');
INSERT INTO `sys_role_resource` VALUES ('4239', '4', '1749');
INSERT INTO `sys_role_resource` VALUES ('4240', '4', '1750');
INSERT INTO `sys_role_resource` VALUES ('4241', '4', '1751');
INSERT INTO `sys_role_resource` VALUES ('4242', '4', '1752');
INSERT INTO `sys_role_resource` VALUES ('4243', '4', '1753');
INSERT INTO `sys_role_resource` VALUES ('4244', '4', '1754');
INSERT INTO `sys_role_resource` VALUES ('4245', '4', '1755');
INSERT INTO `sys_role_resource` VALUES ('4246', '4', '1756');
INSERT INTO `sys_role_resource` VALUES ('4247', '4', '1757');
INSERT INTO `sys_role_resource` VALUES ('4248', '4', '1758');
INSERT INTO `sys_role_resource` VALUES ('4249', '4', '1759');
INSERT INTO `sys_role_resource` VALUES ('4250', '4', '1760');
INSERT INTO `sys_role_resource` VALUES ('4251', '4', '1761');
INSERT INTO `sys_role_resource` VALUES ('4252', '4', '1762');
INSERT INTO `sys_role_resource` VALUES ('4253', '4', '1763');
INSERT INTO `sys_role_resource` VALUES ('4254', '4', '1764');
INSERT INTO `sys_role_resource` VALUES ('4255', '4', '1765');
INSERT INTO `sys_role_resource` VALUES ('4256', '4', '1766');
INSERT INTO `sys_role_resource` VALUES ('4257', '4', '1767');
INSERT INTO `sys_role_resource` VALUES ('4258', '4', '1768');
INSERT INTO `sys_role_resource` VALUES ('4259', '4', '1769');
INSERT INTO `sys_role_resource` VALUES ('4260', '4', '1770');
INSERT INTO `sys_role_resource` VALUES ('4261', '4', '1771');
INSERT INTO `sys_role_resource` VALUES ('4262', '4', '1772');
INSERT INTO `sys_role_resource` VALUES ('4263', '4', '1773');
INSERT INTO `sys_role_resource` VALUES ('4264', '4', '1714');
INSERT INTO `sys_role_resource` VALUES ('4265', '4', '1715');
INSERT INTO `sys_role_resource` VALUES ('4266', '4', '1716');
INSERT INTO `sys_role_resource` VALUES ('4267', '4', '1717');
INSERT INTO `sys_role_resource` VALUES ('4268', '4', '1718');
INSERT INTO `sys_role_resource` VALUES ('4269', '4', '1719');
INSERT INTO `sys_role_resource` VALUES ('4270', '4', '1720');
INSERT INTO `sys_role_resource` VALUES ('4271', '4', '1721');
INSERT INTO `sys_role_resource` VALUES ('4272', '4', '1722');
INSERT INTO `sys_role_resource` VALUES ('4273', '4', '1723');
INSERT INTO `sys_role_resource` VALUES ('4274', '4', '1724');
INSERT INTO `sys_role_resource` VALUES ('4275', '4', '1725');
INSERT INTO `sys_role_resource` VALUES ('4388', '4', '1774');
INSERT INTO `sys_role_resource` VALUES ('4389', '4', '1775');
INSERT INTO `sys_role_resource` VALUES ('4390', '4', '1776');
INSERT INTO `sys_role_resource` VALUES ('4591', '10', '87');
INSERT INTO `sys_role_resource` VALUES ('4592', '10', '88');
INSERT INTO `sys_role_resource` VALUES ('4593', '10', '89');
INSERT INTO `sys_role_resource` VALUES ('4594', '10', '691');
INSERT INTO `sys_role_resource` VALUES ('4595', '10', '698');
INSERT INTO `sys_role_resource` VALUES ('4596', '10', '1774');
INSERT INTO `sys_role_resource` VALUES ('4597', '10', '770');
INSERT INTO `sys_role_resource` VALUES ('4598', '10', '1775');
INSERT INTO `sys_role_resource` VALUES ('4599', '10', '727');
INSERT INTO `sys_role_resource` VALUES ('4600', '10', '1398');
INSERT INTO `sys_role_resource` VALUES ('4601', '10', '1399');
INSERT INTO `sys_role_resource` VALUES ('4602', '10', '723');
INSERT INTO `sys_role_resource` VALUES ('4603', '10', '726');
INSERT INTO `sys_role_resource` VALUES ('4604', '10', '783');
INSERT INTO `sys_role_resource` VALUES ('4605', '10', '699');
INSERT INTO `sys_role_resource` VALUES ('4606', '10', '700');
INSERT INTO `sys_role_resource` VALUES ('4607', '10', '701');
INSERT INTO `sys_role_resource` VALUES ('4608', '10', '730');
INSERT INTO `sys_role_resource` VALUES ('4609', '10', '759');
INSERT INTO `sys_role_resource` VALUES ('4610', '10', '760');
INSERT INTO `sys_role_resource` VALUES ('4611', '10', '1721');
INSERT INTO `sys_role_resource` VALUES ('4612', '10', '1720');
INSERT INTO `sys_role_resource` VALUES ('4613', '10', '1718');
INSERT INTO `sys_role_resource` VALUES ('4614', '10', '1740');
INSERT INTO `sys_role_resource` VALUES ('4615', '10', '1739');
INSERT INTO `sys_role_resource` VALUES ('4616', '10', '1738');
INSERT INTO `sys_role_resource` VALUES ('4617', '10', '1737');
INSERT INTO `sys_role_resource` VALUES ('4618', '10', '1719');
INSERT INTO `sys_role_resource` VALUES ('4619', '10', '1745');
INSERT INTO `sys_role_resource` VALUES ('4620', '10', '1746');
INSERT INTO `sys_role_resource` VALUES ('4621', '10', '1742');
INSERT INTO `sys_role_resource` VALUES ('4622', '10', '1743');
INSERT INTO `sys_role_resource` VALUES ('4623', '10', '1741');
INSERT INTO `sys_role_resource` VALUES ('4624', '10', '1744');
INSERT INTO `sys_role_resource` VALUES ('4625', '10', '1747');
INSERT INTO `sys_role_resource` VALUES ('4626', '10', '1715');
INSERT INTO `sys_role_resource` VALUES ('4627', '10', '1728');
INSERT INTO `sys_role_resource` VALUES ('4628', '10', '1730');
INSERT INTO `sys_role_resource` VALUES ('4629', '10', '1729');
INSERT INTO `sys_role_resource` VALUES ('4630', '10', '1724');
INSERT INTO `sys_role_resource` VALUES ('4631', '10', '1767');
INSERT INTO `sys_role_resource` VALUES ('4632', '10', '1766');
INSERT INTO `sys_role_resource` VALUES ('4633', '10', '1771');
INSERT INTO `sys_role_resource` VALUES ('4634', '10', '1768');
INSERT INTO `sys_role_resource` VALUES ('4635', '10', '1769');
INSERT INTO `sys_role_resource` VALUES ('4636', '10', '1770');
INSERT INTO `sys_role_resource` VALUES ('4637', '10', '1755');
INSERT INTO `sys_role_resource` VALUES ('4638', '10', '1757');
INSERT INTO `sys_role_resource` VALUES ('4639', '10', '1754');
INSERT INTO `sys_role_resource` VALUES ('4640', '10', '1753');
INSERT INTO `sys_role_resource` VALUES ('4641', '10', '1776');
INSERT INTO `sys_role_resource` VALUES ('4642', '10', '1725');
INSERT INTO `sys_role_resource` VALUES ('4643', '10', '1773');
INSERT INTO `sys_role_resource` VALUES ('4644', '10', '1772');
INSERT INTO `sys_role_resource` VALUES ('4645', '10', '1716');
INSERT INTO `sys_role_resource` VALUES ('4646', '10', '1731');
INSERT INTO `sys_role_resource` VALUES ('4647', '10', '1733');
INSERT INTO `sys_role_resource` VALUES ('4648', '10', '1732');
INSERT INTO `sys_role_resource` VALUES ('4649', '10', '1717');
INSERT INTO `sys_role_resource` VALUES ('4650', '10', '1734');
INSERT INTO `sys_role_resource` VALUES ('4651', '10', '1735');
INSERT INTO `sys_role_resource` VALUES ('4652', '10', '1736');
INSERT INTO `sys_role_resource` VALUES ('4653', '10', '1722');
INSERT INTO `sys_role_resource` VALUES ('4654', '10', '1761');
INSERT INTO `sys_role_resource` VALUES ('4655', '10', '1760');
INSERT INTO `sys_role_resource` VALUES ('4656', '10', '1759');
INSERT INTO `sys_role_resource` VALUES ('4657', '10', '1752');
INSERT INTO `sys_role_resource` VALUES ('4658', '10', '1748');
INSERT INTO `sys_role_resource` VALUES ('4659', '10', '1749');
INSERT INTO `sys_role_resource` VALUES ('4660', '10', '1751');
INSERT INTO `sys_role_resource` VALUES ('4661', '10', '1714');
INSERT INTO `sys_role_resource` VALUES ('4662', '10', '1726');
INSERT INTO `sys_role_resource` VALUES ('4663', '10', '1727');
INSERT INTO `sys_role_resource` VALUES ('4706', '5', '87');
INSERT INTO `sys_role_resource` VALUES ('4707', '5', '1774');
INSERT INTO `sys_role_resource` VALUES ('4708', '5', '88');
INSERT INTO `sys_role_resource` VALUES ('4709', '5', '89');
INSERT INTO `sys_role_resource` VALUES ('4710', '5', '1775');
INSERT INTO `sys_role_resource` VALUES ('4711', '5', '723');
INSERT INTO `sys_role_resource` VALUES ('4712', '5', '726');
INSERT INTO `sys_role_resource` VALUES ('4713', '5', '783');
INSERT INTO `sys_role_resource` VALUES ('4714', '5', '699');
INSERT INTO `sys_role_resource` VALUES ('4715', '5', '700');
INSERT INTO `sys_role_resource` VALUES ('4716', '5', '701');
INSERT INTO `sys_role_resource` VALUES ('4717', '5', '1719');
INSERT INTO `sys_role_resource` VALUES ('4718', '5', '1721');
INSERT INTO `sys_role_resource` VALUES ('4719', '5', '1718');
INSERT INTO `sys_role_resource` VALUES ('4720', '5', '1740');
INSERT INTO `sys_role_resource` VALUES ('4721', '5', '1739');
INSERT INTO `sys_role_resource` VALUES ('4722', '5', '1738');
INSERT INTO `sys_role_resource` VALUES ('4723', '5', '1737');
INSERT INTO `sys_role_resource` VALUES ('4724', '5', '1745');
INSERT INTO `sys_role_resource` VALUES ('4725', '5', '1746');
INSERT INTO `sys_role_resource` VALUES ('4726', '5', '1742');
INSERT INTO `sys_role_resource` VALUES ('4727', '5', '1743');
INSERT INTO `sys_role_resource` VALUES ('4728', '5', '1741');
INSERT INTO `sys_role_resource` VALUES ('4729', '5', '1744');
INSERT INTO `sys_role_resource` VALUES ('4730', '5', '1776');
INSERT INTO `sys_role_resource` VALUES ('4731', '5', '1725');
INSERT INTO `sys_role_resource` VALUES ('4732', '5', '1773');
INSERT INTO `sys_role_resource` VALUES ('4733', '5', '1772');
INSERT INTO `sys_role_resource` VALUES ('4734', '5', '1716');
INSERT INTO `sys_role_resource` VALUES ('4735', '5', '1731');
INSERT INTO `sys_role_resource` VALUES ('4736', '5', '1733');
INSERT INTO `sys_role_resource` VALUES ('4737', '5', '1732');
INSERT INTO `sys_role_resource` VALUES ('4738', '5', '1717');
INSERT INTO `sys_role_resource` VALUES ('4739', '5', '1734');
INSERT INTO `sys_role_resource` VALUES ('4740', '5', '1735');
INSERT INTO `sys_role_resource` VALUES ('4741', '5', '1736');
INSERT INTO `sys_role_resource` VALUES ('4742', '5', '1720');
INSERT INTO `sys_role_resource` VALUES ('4743', '5', '1752');
INSERT INTO `sys_role_resource` VALUES ('4744', '5', '1748');
INSERT INTO `sys_role_resource` VALUES ('4745', '5', '1749');
INSERT INTO `sys_role_resource` VALUES ('4746', '5', '1751');
INSERT INTO `sys_role_resource` VALUES ('4747', '13', '87');
INSERT INTO `sys_role_resource` VALUES ('4748', '13', '88');
INSERT INTO `sys_role_resource` VALUES ('4749', '13', '723');
INSERT INTO `sys_role_resource` VALUES ('4750', '13', '726');
INSERT INTO `sys_role_resource` VALUES ('4751', '13', '783');
INSERT INTO `sys_role_resource` VALUES ('4752', '13', '1719');
INSERT INTO `sys_role_resource` VALUES ('4753', '13', '1720');
INSERT INTO `sys_role_resource` VALUES ('4754', '13', '1725');
INSERT INTO `sys_role_resource` VALUES ('4755', '13', '1717');
INSERT INTO `sys_role_resource` VALUES ('4756', '13', '1735');
INSERT INTO `sys_role_resource` VALUES ('4757', '13', '1734');
INSERT INTO `sys_role_resource` VALUES ('4758', '13', '1736');
INSERT INTO `sys_role_resource` VALUES ('4759', '13', '1742');
INSERT INTO `sys_role_resource` VALUES ('4760', '13', '1743');
INSERT INTO `sys_role_resource` VALUES ('4761', '13', '1744');
INSERT INTO `sys_role_resource` VALUES ('4762', '13', '1749');
INSERT INTO `sys_role_resource` VALUES ('4763', '13', '1752');
INSERT INTO `sys_role_resource` VALUES ('4764', '13', '1751');
INSERT INTO `sys_role_resource` VALUES ('4765', '13', '1772');
INSERT INTO `sys_role_resource` VALUES ('4766', '13', '1716');
INSERT INTO `sys_role_resource` VALUES ('4767', '13', '1733');
INSERT INTO `sys_role_resource` VALUES ('4768', '13', '1732');
INSERT INTO `sys_role_resource` VALUES ('4769', '13', '1731');
INSERT INTO `sys_role_resource` VALUES ('4770', '14', '87');
INSERT INTO `sys_role_resource` VALUES ('4771', '14', '88');
INSERT INTO `sys_role_resource` VALUES ('4772', '14', '723');
INSERT INTO `sys_role_resource` VALUES ('4773', '14', '726');
INSERT INTO `sys_role_resource` VALUES ('4774', '14', '783');
INSERT INTO `sys_role_resource` VALUES ('4775', '14', '699');
INSERT INTO `sys_role_resource` VALUES ('4776', '14', '700');
INSERT INTO `sys_role_resource` VALUES ('4777', '14', '701');
INSERT INTO `sys_role_resource` VALUES ('4778', '15', '87');
INSERT INTO `sys_role_resource` VALUES ('4779', '15', '88');
INSERT INTO `sys_role_resource` VALUES ('4780', '15', '1774');
INSERT INTO `sys_role_resource` VALUES ('4781', '15', '1775');
INSERT INTO `sys_role_resource` VALUES ('4782', '15', '723');
INSERT INTO `sys_role_resource` VALUES ('4783', '15', '726');
INSERT INTO `sys_role_resource` VALUES ('4784', '15', '783');
INSERT INTO `sys_role_resource` VALUES ('4785', '15', '699');
INSERT INTO `sys_role_resource` VALUES ('4786', '15', '700');
INSERT INTO `sys_role_resource` VALUES ('4787', '15', '701');
INSERT INTO `sys_role_resource` VALUES ('4788', '15', '1717');
INSERT INTO `sys_role_resource` VALUES ('4789', '15', '1735');
INSERT INTO `sys_role_resource` VALUES ('4790', '15', '1734');
INSERT INTO `sys_role_resource` VALUES ('4791', '15', '1736');
INSERT INTO `sys_role_resource` VALUES ('4792', '15', '1719');
INSERT INTO `sys_role_resource` VALUES ('4793', '15', '1745');
INSERT INTO `sys_role_resource` VALUES ('4794', '15', '1746');
INSERT INTO `sys_role_resource` VALUES ('4795', '15', '1742');
INSERT INTO `sys_role_resource` VALUES ('4796', '15', '1743');
INSERT INTO `sys_role_resource` VALUES ('4797', '15', '1741');
INSERT INTO `sys_role_resource` VALUES ('4798', '15', '1744');
INSERT INTO `sys_role_resource` VALUES ('4799', '15', '1721');
INSERT INTO `sys_role_resource` VALUES ('4800', '15', '1776');
INSERT INTO `sys_role_resource` VALUES ('4801', '15', '1720');
INSERT INTO `sys_role_resource` VALUES ('4802', '15', '1749');
INSERT INTO `sys_role_resource` VALUES ('4803', '15', '1752');
INSERT INTO `sys_role_resource` VALUES ('4804', '15', '1751');
INSERT INTO `sys_role_resource` VALUES ('4805', '15', '1748');
INSERT INTO `sys_role_resource` VALUES ('4806', '15', '1725');
INSERT INTO `sys_role_resource` VALUES ('4807', '15', '1773');
INSERT INTO `sys_role_resource` VALUES ('4808', '15', '1772');
INSERT INTO `sys_role_resource` VALUES ('4809', '15', '1716');
INSERT INTO `sys_role_resource` VALUES ('4810', '15', '1733');
INSERT INTO `sys_role_resource` VALUES ('4811', '15', '1732');
INSERT INTO `sys_role_resource` VALUES ('4812', '15', '1731');

-- ----------------------------
-- Table structure for `sys_tenant`
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '租户id',
  `name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '租户名称',
  `start_time` datetime DEFAULT NULL COMMENT '授权开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '授权结束时间',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '联系邮箱',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0正常 1-冻结',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `delete_flag` int(11) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='租户表';

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES ('3', '商熵科技', '2020-04-03 10:52:30', '2025-04-03 10:52:30', '020-123456', 'entrobus@entrobus.com', '广东省广州市番禺区大学城信息枢纽楼', '1', '', '1', '2020-04-04 07:45:22', '3', '2020-05-10 19:55:28', '1');
INSERT INTO `sys_tenant` VALUES ('4', '京信通信', '2020-04-03 10:21:30', '2025-04-03 10:21:30', '020-28390000', 'comba@comba.com', '中国广东省广州市科学城神舟路10号', '0', '', '1', '2020-04-04 07:45:38', '3', '2020-04-15 19:28:03', '0');
INSERT INTO `sys_tenant` VALUES ('5', '元力云网络有限公司', '2020-04-03 10:21:30', '2021-04-03 10:21:30', '400-968-6199', 'service@cloudoforce.com', '广州市黄埔区科学城科汇金谷四街11号901单元', '0', '', '1', '2020-04-04 07:45:47', '3', '2020-05-10 19:55:22', '1');
INSERT INTO `sys_tenant` VALUES ('6', '迈傲科技', '2020-05-29 00:00:00', '2021-06-30 00:00:00', '020-22112699,020-22112685', 'service@mapout.net', '广州市南沙区丰泽东路106号X1301-G749', '0', '', '1', '2020-04-04 07:45:55', '32', '2020-05-12 22:02:56', '0');
INSERT INTO `sys_tenant` VALUES ('7', 'rwarwar人玩人', null, null, '15111', 'aa', 'aa', '0', null, '3', '2020-04-15 19:55:50', '3', '2020-04-15 19:57:01', '1');
INSERT INTO `sys_tenant` VALUES ('8', 'aa', null, null, 'AA', 'AA', 'AA', '0', '是的', '3', '2020-04-15 19:56:06', '3', '2020-04-15 19:56:50', '1');
INSERT INTO `sys_tenant` VALUES ('9', '啊啊啊', null, null, 'aa', '所示', 'AA', '1', '分隔', '3', '2020-04-15 19:56:48', '3', '2020-04-15 19:57:01', '1');
INSERT INTO `sys_tenant` VALUES ('11', '测试A', '2020-05-06 00:00:00', '2021-06-06 00:00:00', null, null, null, '0', null, '3', '2020-05-06 08:51:58', '3', '2020-05-06 09:24:45', '1');
INSERT INTO `sys_tenant` VALUES ('12', '测试B', '2020-05-31 00:00:00', '2020-06-30 00:00:00', null, null, null, '0', null, '3', '2020-05-06 08:53:00', '3', '2020-05-06 09:24:51', '1');
INSERT INTO `sys_tenant` VALUES ('13', '测试C', '2020-05-30 00:00:00', '2021-06-30 00:00:00', null, null, null, '0', null, '3', '2020-05-06 08:54:12', '3', '2020-05-06 09:24:59', '1');
INSERT INTO `sys_tenant` VALUES ('14', '测试D', '2020-05-13 00:00:00', '2020-06-27 00:00:00', '', '', '', '1', '', '3', '2020-05-06 08:55:05', '3', '2020-05-06 09:24:59', '1');
INSERT INTO `sys_tenant` VALUES ('15', '测试A', '2019-10-30 00:00:00', '2021-10-30 00:00:00', 'aa', 'aaa', 'aa的范德萨发', '1', '', '3', '2020-05-07 08:32:26', '3', '2020-05-07 09:56:50', '1');
INSERT INTO `sys_tenant` VALUES ('16', 'BB测试', '2020-05-26 00:00:00', '2020-06-30 00:00:00', null, null, null, '0', null, '3', '2020-05-07 09:40:38', '3', '2020-05-07 09:56:53', '1');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码(Sha256加密后存储)',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐（用于和密码一起加密）',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `cellphone` char(11) DEFAULT NULL COMMENT '手机号',
  `head_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `status` int(1) DEFAULT '0' COMMENT '用户状态  0：正常   1：禁用',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  `additional_info` varchar(500) DEFAULT NULL COMMENT '附加信息，Json字符串的形式存储',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` int(1) DEFAULT '0' COMMENT '删除标识(0:正常，1:已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('3', 'magic4j', 'a283ab284e5be02e3a47533efad2032af01bc4500b447bfec3ab5373b9ec92cc', '孤傲苍狼', 'UST6mJPFuw5aTIiMRwAf', '290603672@qq.com', '13822290843', 'http://file.itgacl.com/group1/M00/00/00/rBAACl6UFZSAR73kAACcM3DyTnU558.jpg', '0', null, '0', '{\"lastLoginTs\":1589341445124,\"failedLoginAttempts\":0}', '超级管理员，拥有系统最高权限', '1', '2020-04-03 23:52:58', '3', '2020-05-11 16:19:37', '0');
INSERT INTO `sys_user` VALUES ('32', 'xdp', '09bb74576d4e3665c9513b16e876816af1de24f5d9893920738fccdae3b964b3', '徐达沛', '91v5ulygdkafCM0jgkra', 'xdp@163.com', '13598765432', 'http://file.itgacl.com/group1/M00/00/00/rBAACl66-8-Aej4QAACISF88lxk480.png', '0', '8', '0', '{\"lastLoginTs\":1589345869893,\"failedLoginAttempts\":0}', '', '3', '2020-05-10 20:21:44', '32', '2020-05-13 03:41:04', '0');
INSERT INTO `sys_user` VALUES ('37', 'comba', 'ce9534e3c679db0167d2bce72cc3c315a8032f9a9d3596960a7849229e2f768c', '京信', '4TQOXMSRgUB62xnLCU88', 'comba@comba.com', '13412345678', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67bmqAP-TuAAArJS4Lrww348.png', '0', null, '4', '{\"lastLoginTs\":1589347958525,\"failedLoginAttempts\":0}', '京信租户管理员帐号', '32', '2020-05-12 14:34:05', '37', '2020-05-13 11:50:03', '0');
INSERT INTO `sys_user` VALUES ('38', 'mapout', '5859255342f89bd2a429057f946bdd3d7d4a8ff58723f3a6bd86647eaee61389', '迈傲', 'c8khhbEKX1ClB8YN7gdh', 'mapout@service.net', '13812345678', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67aM-AQoXqAAA_S67JgJc568.png', '0', null, '6', '{\"lastLoginTs\":1589347914464,\"failedLoginAttempts\":0}', '', '32', '2020-05-12 14:35:27', '38', '2020-05-13 11:26:07', '0');
INSERT INTO `sys_user` VALUES ('41', 'user1', '502aa9485a05b75f639f8eb64dbce7ff9c62c5db088681f689edcdbde1405831', '迈傲管理员', '40IQWoCUVQTUIZ2YOiin', 'www@abc.com', '13512349876', null, '0', null, '6', '{\"lastLoginTs\":1589341322710,\"failedLoginAttempts\":0}', null, '38', '2020-05-13 11:40:34', '38', '2020-05-13 11:40:34', '0');
INSERT INTO `sys_user` VALUES ('42', 'user2', '3ab3b92728e21822b711d1c0673fb0d8d4bdc83ae19e99aeb56c378f20bfef3e', '张三', 'oOhYEoLE9127nzrzMQBY', '13412347896@163.com', '13412347896', null, '0', '20', '6', '{\"lastLoginTs\":1589341350981,\"failedLoginAttempts\":0}', null, '38', '2020-05-13 11:41:21', '38', '2020-05-13 11:41:21', '0');
INSERT INTO `sys_user` VALUES ('43', 'cb1', 'd116cf45a87dcadd5bf634fb068392f487edb5de78d20c48144f892948783b0d', '鲸鱼', 'apPZt5lnRdzyE7qQMPvm', '13498763214@163.com', '13498763214', null, '0', '22', '4', '{\"lastLoginTs\":1589342154978,\"failedLoginAttempts\":0}', null, '37', '2020-05-13 11:55:22', '37', '2020-05-13 11:55:22', '0');

-- ----------------------------
-- Table structure for `sys_user_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('9', '22', '4');
INSERT INTO `sys_user_post` VALUES ('10', '22', '2');
INSERT INTO `sys_user_post` VALUES ('11', '15', '5');
INSERT INTO `sys_user_post` VALUES ('12', '23', '7');
INSERT INTO `sys_user_post` VALUES ('13', '24', '6');
INSERT INTO `sys_user_post` VALUES ('17', '4', '4');
INSERT INTO `sys_user_post` VALUES ('18', '25', '6');
INSERT INTO `sys_user_post` VALUES ('19', '26', '3');
INSERT INTO `sys_user_post` VALUES ('26', '27', '7');
INSERT INTO `sys_user_post` VALUES ('27', '27', '2');
INSERT INTO `sys_user_post` VALUES ('28', '28', '6');
INSERT INTO `sys_user_post` VALUES ('29', '32', '3');
INSERT INTO `sys_user_post` VALUES ('30', '33', '6');
INSERT INTO `sys_user_post` VALUES ('33', '34', '3');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('6', '5', '5');
INSERT INTO `sys_user_role` VALUES ('7', '6', '5');
INSERT INTO `sys_user_role` VALUES ('8', '7', '5');
INSERT INTO `sys_user_role` VALUES ('9', '10', '6');
INSERT INTO `sys_user_role` VALUES ('10', '10', '7');
INSERT INTO `sys_user_role` VALUES ('11', '12', '9');
INSERT INTO `sys_user_role` VALUES ('12', '14', '9');
INSERT INTO `sys_user_role` VALUES ('13', '17', '9');
INSERT INTO `sys_user_role` VALUES ('21', '22', '10');
INSERT INTO `sys_user_role` VALUES ('22', '15', '10');
INSERT INTO `sys_user_role` VALUES ('23', '15', '5');
INSERT INTO `sys_user_role` VALUES ('24', '23', '10');
INSERT INTO `sys_user_role` VALUES ('25', '24', '10');
INSERT INTO `sys_user_role` VALUES ('29', '4', '5');
INSERT INTO `sys_user_role` VALUES ('30', '25', '10');
INSERT INTO `sys_user_role` VALUES ('31', '26', '10');
INSERT INTO `sys_user_role` VALUES ('35', '27', '5');
INSERT INTO `sys_user_role` VALUES ('36', '28', '10');
INSERT INTO `sys_user_role` VALUES ('37', '28', '5');
INSERT INTO `sys_user_role` VALUES ('40', '29', '5');
INSERT INTO `sys_user_role` VALUES ('41', '30', '5');
INSERT INTO `sys_user_role` VALUES ('42', '31', '5');
INSERT INTO `sys_user_role` VALUES ('43', '32', '10');
INSERT INTO `sys_user_role` VALUES ('47', '33', '11');
INSERT INTO `sys_user_role` VALUES ('50', '3', '4');
INSERT INTO `sys_user_role` VALUES ('51', '34', '12');
INSERT INTO `sys_user_role` VALUES ('52', '35', '11');
INSERT INTO `sys_user_role` VALUES ('53', '36', '11');
INSERT INTO `sys_user_role` VALUES ('54', '37', '5');
INSERT INTO `sys_user_role` VALUES ('55', '38', '5');
INSERT INTO `sys_user_role` VALUES ('56', '39', '11');
INSERT INTO `sys_user_role` VALUES ('57', '40', '12');
INSERT INTO `sys_user_role` VALUES ('58', '41', '13');
INSERT INTO `sys_user_role` VALUES ('59', '42', '14');
INSERT INTO `sys_user_role` VALUES ('60', '43', '15');
