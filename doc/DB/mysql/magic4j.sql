SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `demo_device`
-- ----------------------------
DROP TABLE IF EXISTS `demo_device`;
CREATE TABLE `demo_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `device_code` varchar(32) DEFAULT NULL COMMENT '设备编码(设备IMEI号，唯一)',
  `device_name` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `device_area` varchar(200) DEFAULT NULL COMMENT '设备所在区域',
  `device_pt_name` varchar(200) DEFAULT NULL COMMENT '设备铺设点位名称',
  `longitude` varchar(50) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(50) DEFAULT NULL COMMENT '纬度',
  `ge_po_name` varchar(200) DEFAULT NULL COMMENT '地理位置名称',
  `state` varchar(50) DEFAULT '' COMMENT '设备的工作状态',
  `ma_name` varchar(50) DEFAULT NULL COMMENT '设备维护人员姓名',
  `ma_phone` varchar(15) DEFAULT NULL COMMENT '设备维护人员电话',
  `country` varchar(50) DEFAULT NULL COMMENT '设备所在国家',
  `province` varchar(50) DEFAULT NULL COMMENT '设备所在省份',
  `city` varchar(50) DEFAULT NULL COMMENT '设备所在城市',
  `district` varchar(50) DEFAULT NULL COMMENT '设备所在地区',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` int(1) DEFAULT '0' COMMENT '删除标识(0:正常，1:已删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='伞机设备信息';

-- ----------------------------
-- Records of demo_device
-- ----------------------------
INSERT INTO `demo_device` VALUES ('1', '860344048526306', '伞机-01', '四川省德阳市中江县北塔西路113号四川省中江县城北中学(北塔西路66号)', '四川省中江县城北中学(北塔西路66号)', '104.6826019', '031.0204715', '四川省德阳市中江县北塔西路113号', 'online', '深度学习', '13990263609', '中国', '四川省', '德阳市', '中江县', '46', '2020-07-31 14:35:41', '1', '2020-08-04 23:26:31', '0');
INSERT INTO `demo_device` VALUES ('2', 'test-860344048526307', 'test-860344048526307', '广东省广州市天河区黄村东路黄村(广州市天河区)', '黄村(广州市天河区)', '113.41476510513388', '23.12508445673278', '广东省广州市天河区黄村东路', '', '孤傲苍狼', '13822290843', '中国', '广东省', '广州市', '天河区', '1', '2020-08-03 22:00:57', '1', '2020-08-03 22:00:57', '0');
INSERT INTO `demo_device` VALUES ('3', 'test-860344048526308', 'test-860344048526308', '广东省广州市天河区黄村北路沙县小吃旁(两个男孩水果店)大利家超市(黄村店)', '大利家超市(黄村店)', '113.41571044921875', '23.125789642333988', '广东省广州市天河区黄村北路沙县小吃旁(两个男孩水果店)', '', '孤傲苍狼', '13822290843', '中国', '广东省', '广州市', '天河区', '1', '2020-08-03 22:01:21', '1', '2020-08-03 22:01:21', '0');
INSERT INTO `demo_device` VALUES ('4', 'test-860344048526309', 'test-860344048526309', '广东省广州市天河区东圃黄村南胜路9号乐易购生活超市(佳丰店)', '乐易购生活超市(佳丰店)', '113.41584777832031', '23.122760772705085', '广东省广州市天河区东圃黄村南胜路9号', '', '孤傲苍狼', '13822290843', '中国', '广东省', '广州市', '天河区', '1', '2020-08-03 22:01:42', '1', '2020-08-03 22:01:42', '0');
INSERT INTO `demo_device` VALUES ('5', 'test-860344048526310', 'test-860344048526310', '广东省广州市天河区404路黄村北总站', '黄村北总站', '113.41541290283203', '23.126951217651378', '广东省广州市天河区404路', '', '孤傲苍狼', '13822290843', '中国', '广东省', '广州市', '天河区', '1', '2020-08-03 22:02:09', '1', '2020-08-03 22:02:09', '0');
INSERT INTO `demo_device` VALUES ('6', 'test-860344048526311', 'test-860344048526311', '广东省广州市天河区中山大道中1011-1015号东圃汽车客运站', '东圃汽车客运站', '113.41593933105469', '23.119441986083974', '广东省广州市天河区中山大道中1011-1015号', '', '孤傲苍狼', '13822290843', '中国', '广东省', '广州市', '天河区', '1', '2020-08-03 22:02:29', '1', '2020-08-03 22:02:29', '0');
INSERT INTO `demo_device` VALUES ('7', 'test-860344048526312', 'test-860344048526312', '广东省广州市天河区中山大道西55号华南师范大学(石牌校区)', '华南师范大学(石牌校区)', '113.352077', '23.13935', '广东省广州市天河区中山大道西55号', 'offline', '孤傲苍狼', '13822290843', '中国', '广东省', '广州市', '天河区', '1', '2020-08-03 22:02:53', '1', '2020-08-15 16:51:35', '0');
INSERT INTO `demo_device` VALUES ('8', 'test001', '测试001', '广东省广州市越秀区沿江东路453号', '沿江东路453号', '113.299026', '23.118986', '广东省广州市越秀区', '', '孤傲苍狼', '13822290843', '中国', '广东省', '广州市', '越秀区', '46', '2020-08-13 19:50:00', '46', '2020-08-14 10:26:03', '0');
INSERT INTO `demo_device` VALUES ('9', '00001', '00001', '广东省广州市海珠区东翠北街5号', '东翠北街5号', '113.296151', '23.108881', '广东省广州市海珠区', '', null, null, '中国', '广东省', '广州市', '海珠区', '46', '2020-08-15 10:57:55', '46', '2020-08-15 10:57:55', '0');
INSERT INTO `demo_device` VALUES ('10', 'sz-test-001', '深圳-测试设备01', '广东省深圳市龙岗区', '深圳北站', '114.07646', '22.605113', '广东省深圳市龙岗区', '', null, null, '中国', '广东省', '深圳市', '龙岗区', '3', '2020-09-08 12:09:38', '3', '2020-09-08 12:09:38', '0');

-- ----------------------------
-- Table structure for `demo_miniapp_user`
-- ----------------------------
DROP TABLE IF EXISTS `demo_miniapp_user`;
CREATE TABLE `demo_miniapp_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `open_id` varchar(255) DEFAULT NULL COMMENT '微信用户的openid',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '昵称',
  `gender` varchar(10) DEFAULT NULL COMMENT '性别(0：未知、1：男、2：女)',
  `language` varchar(255) DEFAULT NULL COMMENT '母语',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `province` varchar(255) DEFAULT NULL COMMENT '所在省份',
  `country` varchar(255) DEFAULT NULL COMMENT '所在国家',
  `avatar_url` varchar(255) DEFAULT NULL COMMENT '微信头像',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '微信绑定的手机号码',
  `union_id` varchar(255) DEFAULT NULL COMMENT '如果开发者拥有多个移动应用、网站应用和公众帐号，可通过获取用户基本信息中的unionid来区分用户的唯一性，因为只要是同一个微信开放平台帐号下的移动应用、网站应用和公众帐号，用户的unionid是唯一的。换句话说，同一用户，对同一个微信开放平台下的不同应用，unionid是相同的。 ',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` int(11) DEFAULT '0' COMMENT '删除标识(0:正常，1:已删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信小程序用户信息表';

-- ----------------------------
-- Records of demo_miniapp_user
-- ----------------------------

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
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('scheduler', 'DESKTOP-C3PQEI51605581568690', '1605654830578', '15000');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务执行日志';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统API资源(API接口)详细信息表';

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
  `area_code` varchar(10) DEFAULT NULL COMMENT '行政区划代码',
  `pinyin` varchar(100) DEFAULT NULL COMMENT '拼音',
  `lng` decimal(10,7) DEFAULT NULL COMMENT '经度',
  `lat` decimal(10,7) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3756 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='中国行政区域';

-- ----------------------------
-- Records of sys_cn_area
-- ----------------------------
INSERT INTO `sys_cn_area` VALUES ('1', '中国', '中国', null, null, '中国', '0', null, '', '100000', 'China', '116.3683244', '39.9150850');
INSERT INTO `sys_cn_area` VALUES ('2', '北京', '北京', '1', null, '中国,北京', '1', null, '', '110000', 'Beijing', '116.4052850', '39.9049890');
INSERT INTO `sys_cn_area` VALUES ('3', '北京市', '北京', '2', null, '中国,北京,北京市', '2', '100000', '010', '110100', 'Beijing', '116.4052850', '39.9049890');
INSERT INTO `sys_cn_area` VALUES ('4', '东城区', '东城', '3', null, '中国,北京,北京市,东城区', '3', '100010', '010', '110101', 'Dongcheng', '116.4100500', '39.9315700');
INSERT INTO `sys_cn_area` VALUES ('5', '西城区', '西城', '3', null, '中国,北京,北京市,西城区', '3', '100032', '010', '110102', 'Xicheng', '116.3600300', '39.9305000');
INSERT INTO `sys_cn_area` VALUES ('6', '朝阳区', '朝阳', '3', null, '中国,北京,北京市,朝阳区', '3', '100020', '010', '110105', 'Chaoyang', '116.4854800', '39.9484000');
INSERT INTO `sys_cn_area` VALUES ('7', '丰台区', '丰台', '3', null, '中国,北京,北京市,丰台区', '3', '100071', '010', '110106', 'Fengtai', '116.2862500', '39.8585000');
INSERT INTO `sys_cn_area` VALUES ('8', '石景山区', '石景山', '3', null, '中国,北京,北京市,石景山区', '3', '100043', '010', '110107', 'Shijingshan', '116.2229000', '39.9056400');
INSERT INTO `sys_cn_area` VALUES ('9', '海淀区', '海淀', '3', null, '中国,北京,北京市,海淀区', '3', '100089', '010', '110108', 'Haidian', '116.2981200', '39.9593100');
INSERT INTO `sys_cn_area` VALUES ('10', '门头沟区', '门头沟', '3', null, '中国,北京,北京市,门头沟区', '3', '102300', '010', '110109', 'Mentougou', '116.1013700', '39.9404300');
INSERT INTO `sys_cn_area` VALUES ('11', '房山区', '房山', '3', null, '中国,北京,北京市,房山区', '3', '102488', '010', '110111', 'Fangshan', '116.1425700', '39.7478600');
INSERT INTO `sys_cn_area` VALUES ('12', '通州区', '通州', '3', null, '中国,北京,北京市,通州区', '3', '101149', '010', '110112', 'Tongzhou', '116.6571600', '39.9096600');
INSERT INTO `sys_cn_area` VALUES ('13', '顺义区', '顺义', '3', null, '中国,北京,北京市,顺义区', '3', '101300', '010', '110113', 'Shunyi', '116.6541700', '40.1302000');
INSERT INTO `sys_cn_area` VALUES ('14', '昌平区', '昌平', '3', null, '中国,北京,北京市,昌平区', '3', '102200', '010', '110114', 'Changping', '116.2312000', '40.2207200');
INSERT INTO `sys_cn_area` VALUES ('15', '大兴区', '大兴', '3', null, '中国,北京,北京市,大兴区', '3', '102600', '010', '110115', 'Daxing', '116.3414900', '39.7266800');
INSERT INTO `sys_cn_area` VALUES ('16', '怀柔区', '怀柔', '3', null, '中国,北京,北京市,怀柔区', '3', '101400', '010', '110116', 'Huairou', '116.6316800', '40.3160200');
INSERT INTO `sys_cn_area` VALUES ('17', '平谷区', '平谷', '3', null, '中国,北京,北京市,平谷区', '3', '101200', '010', '110117', 'Pinggu', '117.1213300', '40.1405600');
INSERT INTO `sys_cn_area` VALUES ('18', '密云县', '密云', '3', null, '中国,北京,北京市,密云县', '3', '101500', '010', '110228', 'Miyun', '116.8429500', '40.3761800');
INSERT INTO `sys_cn_area` VALUES ('19', '延庆县', '延庆', '3', null, '中国,北京,北京市,延庆县', '3', '102100', '010', '110229', 'Yanqing', '115.9749400', '40.4567200');
INSERT INTO `sys_cn_area` VALUES ('20', '天津', '天津', '1', null, '中国,天津', '1', null, '', '120000', 'Tianjin', '117.1901820', '39.1255960');
INSERT INTO `sys_cn_area` VALUES ('21', '天津市', '天津', '20', null, '中国,天津,天津市', '2', '300000', '022', '120100', 'Tianjin', '117.1901820', '39.1255960');
INSERT INTO `sys_cn_area` VALUES ('22', '和平区', '和平', '21', null, '中国,天津,天津市,和平区', '3', '300041', '022', '120101', 'Heping', '117.2145600', '39.1171800');
INSERT INTO `sys_cn_area` VALUES ('23', '河东区', '河东', '21', null, '中国,天津,天津市,河东区', '3', '300171', '022', '120102', 'Hedong', '117.2256200', '39.1231800');
INSERT INTO `sys_cn_area` VALUES ('24', '河西区', '河西', '21', null, '中国,天津,天津市,河西区', '3', '300202', '022', '120103', 'Hexi', '117.2232700', '39.1095900');
INSERT INTO `sys_cn_area` VALUES ('25', '南开区', '南开', '21', null, '中国,天津,天津市,南开区', '3', '300110', '022', '120104', 'Nankai', '117.1507400', '39.1382100');
INSERT INTO `sys_cn_area` VALUES ('26', '河北区', '河北', '21', null, '中国,天津,天津市,河北区', '3', '300143', '022', '120105', 'Hebei', '117.1969700', '39.1481600');
INSERT INTO `sys_cn_area` VALUES ('27', '红桥区', '红桥', '21', null, '中国,天津,天津市,红桥区', '3', '300131', '022', '120106', 'Hongqiao', '117.1514500', '39.1671500');
INSERT INTO `sys_cn_area` VALUES ('28', '东丽区', '东丽', '21', null, '中国,天津,天津市,东丽区', '3', '300300', '022', '120110', 'Dongli', '117.3143600', '39.0863000');
INSERT INTO `sys_cn_area` VALUES ('29', '西青区', '西青', '21', null, '中国,天津,天津市,西青区', '3', '300380', '022', '120111', 'Xiqing', '117.0092700', '39.1412300');
INSERT INTO `sys_cn_area` VALUES ('30', '津南区', '津南', '21', null, '中国,天津,天津市,津南区', '3', '300350', '022', '120112', 'Jinnan', '117.3853700', '38.9913900');
INSERT INTO `sys_cn_area` VALUES ('31', '北辰区', '北辰', '21', null, '中国,天津,天津市,北辰区', '3', '300400', '022', '120113', 'Beichen', '117.1321700', '39.2213100');
INSERT INTO `sys_cn_area` VALUES ('32', '武清区', '武清', '21', null, '中国,天津,天津市,武清区', '3', '301700', '022', '120114', 'Wuqing', '117.0444300', '39.3841500');
INSERT INTO `sys_cn_area` VALUES ('33', '宝坻区', '宝坻', '21', null, '中国,天津,天津市,宝坻区', '3', '301800', '022', '120115', 'Baodi', '117.3103000', '39.7176100');
INSERT INTO `sys_cn_area` VALUES ('34', '滨海新区', '滨海新区', '21', null, '中国,天津,天津市,滨海新区', '3', '300451', '022', '120116', 'Binhaixinqu', '117.7016200', '39.0266800');
INSERT INTO `sys_cn_area` VALUES ('35', '宁河县', '宁河', '21', null, '中国,天津,天津市,宁河县', '3', '301500', '022', '120221', 'Ninghe', '117.8255000', '39.3304800');
INSERT INTO `sys_cn_area` VALUES ('36', '静海县', '静海', '21', null, '中国,天津,天津市,静海县', '3', '301600', '022', '120223', 'Jinghai', '116.9743600', '38.9458200');
INSERT INTO `sys_cn_area` VALUES ('37', '蓟县', '蓟县', '21', null, '中国,天津,天津市,蓟县', '3', '301900', '022', '120225', 'Jixian', '117.4079900', '40.0456700');
INSERT INTO `sys_cn_area` VALUES ('38', '河北省', '河北', '1', null, '中国,河北省', '1', null, '', '130000', 'Hebei', '114.5024610', '38.0454740');
INSERT INTO `sys_cn_area` VALUES ('39', '石家庄市', '石家庄', '38', null, '中国,河北省,石家庄市', '2', '50011', '0311', '130100', 'Shijiazhuang', '114.5024610', '38.0454740');
INSERT INTO `sys_cn_area` VALUES ('40', '长安区', '长安', '39', null, '中国,河北省,石家庄市,长安区', '3', '50011', '0311', '130102', 'Chang\'an', '114.5390600', '38.0366500');
INSERT INTO `sys_cn_area` VALUES ('41', '桥西区', '桥西', '39', null, '中国,河北省,石家庄市,桥西区', '3', '50091', '0311', '130104', 'Qiaoxi', '114.4697700', '38.0322100');
INSERT INTO `sys_cn_area` VALUES ('42', '新华区', '新华', '39', null, '中国,河北省,石家庄市,新华区', '3', '50051', '0311', '130105', 'Xinhua', '114.4632600', '38.0508800');
INSERT INTO `sys_cn_area` VALUES ('43', '井陉矿区', '井陉矿区', '39', null, '中国,河北省,石家庄市,井陉矿区', '3', '50100', '0311', '130107', 'Jingxingkuangqu', '114.0651800', '38.0670500');
INSERT INTO `sys_cn_area` VALUES ('44', '裕华区', '裕华', '39', null, '中国,河北省,石家庄市,裕华区', '3', '50031', '0311', '130108', 'Yuhua', '114.5311500', '38.0060400');
INSERT INTO `sys_cn_area` VALUES ('45', '藁城区', '藁城', '39', null, '中国,河北省,石家庄市,藁城区', '3', '52160', '0311', '130109', 'Gaocheng', '114.8467100', '38.0216200');
INSERT INTO `sys_cn_area` VALUES ('46', '鹿泉区', '鹿泉', '39', null, '中国,河北省,石家庄市,鹿泉区', '3', '50200', '0311', '130110', 'Luquan', '114.3134700', '38.0878200');
INSERT INTO `sys_cn_area` VALUES ('47', '栾城区', '栾城', '39', null, '中国,河北省,石家庄市,栾城区', '3', '51430', '0311', '130111', 'Luancheng', '114.6483400', '37.9002200');
INSERT INTO `sys_cn_area` VALUES ('48', '井陉县', '井陉', '39', null, '中国,河北省,石家庄市,井陉县', '3', '50300', '0311', '130121', 'Jingxing', '114.1425700', '38.0368800');
INSERT INTO `sys_cn_area` VALUES ('49', '正定县', '正定', '39', null, '中国,河北省,石家庄市,正定县', '3', '50800', '0311', '130123', 'Zhengding', '114.5729600', '38.1444500');
INSERT INTO `sys_cn_area` VALUES ('50', '行唐县', '行唐', '39', null, '中国,河北省,石家庄市,行唐县', '3', '50600', '0311', '130125', 'Xingtang', '114.5531600', '38.4365400');
INSERT INTO `sys_cn_area` VALUES ('51', '灵寿县', '灵寿', '39', null, '中国,河北省,石家庄市,灵寿县', '3', '50500', '0311', '130126', 'Lingshou', '114.3825900', '38.3084500');
INSERT INTO `sys_cn_area` VALUES ('52', '高邑县', '高邑', '39', null, '中国,河北省,石家庄市,高邑县', '3', '51330', '0311', '130127', 'Gaoyi', '114.6114200', '37.6155600');
INSERT INTO `sys_cn_area` VALUES ('53', '深泽县', '深泽', '39', null, '中国,河北省,石家庄市,深泽县', '3', '52560', '0311', '130128', 'Shenze', '115.2035800', '38.1835300');
INSERT INTO `sys_cn_area` VALUES ('54', '赞皇县', '赞皇', '39', null, '中国,河北省,石家庄市,赞皇县', '3', '51230', '0311', '130129', 'Zanhuang', '114.3877500', '37.6613500');
INSERT INTO `sys_cn_area` VALUES ('55', '无极县', '无极', '39', null, '中国,河北省,石家庄市,无极县', '3', '52460', '0311', '130130', 'Wuji', '114.9750900', '38.1765300');
INSERT INTO `sys_cn_area` VALUES ('56', '平山县', '平山', '39', null, '中国,河北省,石家庄市,平山县', '3', '50400', '0311', '130131', 'Pingshan', '114.1860000', '38.2599400');
INSERT INTO `sys_cn_area` VALUES ('57', '元氏县', '元氏', '39', null, '中国,河北省,石家庄市,元氏县', '3', '51130', '0311', '130132', 'Yuanshi', '114.5253900', '37.7666800');
INSERT INTO `sys_cn_area` VALUES ('58', '赵县', '赵县', '39', null, '中国,河北省,石家庄市,赵县', '3', '51530', '0311', '130133', 'Zhaoxian', '114.7761200', '37.7562800');
INSERT INTO `sys_cn_area` VALUES ('59', '辛集市', '辛集', '39', null, '中国,河北省,石家庄市,辛集市', '3', '52360', '0311', '130181', 'Xinji', '115.2062600', '37.9407900');
INSERT INTO `sys_cn_area` VALUES ('60', '晋州市', '晋州', '39', null, '中国,河北省,石家庄市,晋州市', '3', '52260', '0311', '130183', 'Jinzhou', '115.0434800', '38.0313500');
INSERT INTO `sys_cn_area` VALUES ('61', '新乐市', '新乐', '39', null, '中国,河北省,石家庄市,新乐市', '3', '50700', '0311', '130184', 'Xinle', '114.6898500', '38.3441700');
INSERT INTO `sys_cn_area` VALUES ('62', '唐山市', '唐山', '38', null, '中国,河北省,唐山市', '2', '63000', '0315', '130200', 'Tangshan', '118.1753930', '39.6351130');
INSERT INTO `sys_cn_area` VALUES ('63', '路南区', '路南', '62', null, '中国,河北省,唐山市,路南区', '3', '63000', '0315', '130202', 'Lunan', '118.1543100', '39.6250500');
INSERT INTO `sys_cn_area` VALUES ('64', '路北区', '路北', '62', null, '中国,河北省,唐山市,路北区', '3', '63000', '0315', '130203', 'Lubei', '118.2007900', '39.6243600');
INSERT INTO `sys_cn_area` VALUES ('65', '古冶区', '古冶', '62', null, '中国,河北省,唐山市,古冶区', '3', '63100', '0315', '130204', 'Guye', '118.4580300', '39.7199300');
INSERT INTO `sys_cn_area` VALUES ('66', '开平区', '开平', '62', null, '中国,河北省,唐山市,开平区', '3', '63021', '0315', '130205', 'Kaiping', '118.2617100', '39.6712800');
INSERT INTO `sys_cn_area` VALUES ('67', '丰南区', '丰南', '62', null, '中国,河北省,唐山市,丰南区', '3', '63300', '0315', '130207', 'Fengnan', '118.1128200', '39.5648300');
INSERT INTO `sys_cn_area` VALUES ('68', '丰润区', '丰润', '62', null, '中国,河北省,唐山市,丰润区', '3', '64000', '0315', '130208', 'Fengrun', '118.1297600', '39.8244000');
INSERT INTO `sys_cn_area` VALUES ('69', '曹妃甸区', '曹妃甸', '62', null, '中国,河北省,唐山市,曹妃甸区', '3', '63200', '0315', '130209', 'Caofeidian', '118.4603790', '39.2730700');
INSERT INTO `sys_cn_area` VALUES ('70', '滦县', '滦县', '62', null, '中国,河北省,唐山市,滦县', '3', '63700', '0315', '130223', 'Luanxian', '118.7034600', '39.7405600');
INSERT INTO `sys_cn_area` VALUES ('71', '滦南县', '滦南', '62', null, '中国,河北省,唐山市,滦南县', '3', '63500', '0315', '130224', 'Luannan', '118.6741000', '39.5039000');
INSERT INTO `sys_cn_area` VALUES ('72', '乐亭县', '乐亭', '62', null, '中国,河北省,唐山市,乐亭县', '3', '63600', '0315', '130225', 'Laoting', '118.9125000', '39.4256100');
INSERT INTO `sys_cn_area` VALUES ('73', '迁西县', '迁西', '62', null, '中国,河北省,唐山市,迁西县', '3', '64300', '0315', '130227', 'Qianxi', '118.3161600', '40.1458700');
INSERT INTO `sys_cn_area` VALUES ('74', '玉田县', '玉田', '62', null, '中国,河北省,唐山市,玉田县', '3', '64100', '0315', '130229', 'Yutian', '117.7388000', '39.9004900');
INSERT INTO `sys_cn_area` VALUES ('75', '遵化市', '遵化', '62', null, '中国,河北省,唐山市,遵化市', '3', '64200', '0315', '130281', 'Zunhua', '117.9644400', '40.1874100');
INSERT INTO `sys_cn_area` VALUES ('76', '迁安市', '迁安', '62', null, '中国,河北省,唐山市,迁安市', '3', '64400', '0315', '130283', 'Qian\'an', '118.7006800', '39.9983300');
INSERT INTO `sys_cn_area` VALUES ('77', '秦皇岛市', '秦皇岛', '38', null, '中国,河北省,秦皇岛市', '2', '66000', '0335', '130300', 'Qinhuangdao', '119.5865790', '39.9425310');
INSERT INTO `sys_cn_area` VALUES ('78', '海港区', '海港', '77', null, '中国,河北省,秦皇岛市,海港区', '3', '66000', '0335', '130302', 'Haigang', '119.6104600', '39.9345000');
INSERT INTO `sys_cn_area` VALUES ('79', '山海关区', '山海关', '77', null, '中国,河北省,秦皇岛市,山海关区', '3', '66200', '0335', '130303', 'Shanhaiguan', '119.7756300', '39.9786900');
INSERT INTO `sys_cn_area` VALUES ('80', '北戴河区', '北戴河', '77', null, '中国,河北省,秦皇岛市,北戴河区', '3', '66100', '0335', '130304', 'Beidaihe', '119.4838800', '39.8340800');
INSERT INTO `sys_cn_area` VALUES ('81', '青龙满族自治县', '青龙', '77', null, '中国,河北省,秦皇岛市,青龙满族自治县', '3', '66500', '0335', '130321', 'Qinglong', '118.9524200', '40.4074300');
INSERT INTO `sys_cn_area` VALUES ('82', '昌黎县', '昌黎', '77', null, '中国,河北省,秦皇岛市,昌黎县', '3', '66600', '0335', '130322', 'Changli', '119.1659500', '39.7088400');
INSERT INTO `sys_cn_area` VALUES ('83', '抚宁县', '抚宁', '77', null, '中国,河北省,秦皇岛市,抚宁县', '3', '66300', '0335', '130323', 'Funing', '119.2448700', '39.8753800');
INSERT INTO `sys_cn_area` VALUES ('84', '卢龙县', '卢龙', '77', null, '中国,河北省,秦皇岛市,卢龙县', '3', '66400', '0335', '130324', 'Lulong', '118.8928800', '39.8917600');
INSERT INTO `sys_cn_area` VALUES ('85', '邯郸市', '邯郸', '38', null, '中国,河北省,邯郸市', '2', '56002', '0310', '130400', 'Handan', '114.4906860', '36.6122730');
INSERT INTO `sys_cn_area` VALUES ('86', '邯山区', '邯山', '85', null, '中国,河北省,邯郸市,邯山区', '3', '56001', '0310', '130402', 'Hanshan', '114.4837500', '36.6000600');
INSERT INTO `sys_cn_area` VALUES ('87', '丛台区', '丛台', '85', null, '中国,河北省,邯郸市,丛台区', '3', '56002', '0310', '130403', 'Congtai', '114.4934300', '36.6184700');
INSERT INTO `sys_cn_area` VALUES ('88', '复兴区', '复兴', '85', null, '中国,河北省,邯郸市,复兴区', '3', '56003', '0310', '130404', 'Fuxing', '114.4592800', '36.6113400');
INSERT INTO `sys_cn_area` VALUES ('89', '峰峰矿区', '峰峰矿区', '85', null, '中国,河北省,邯郸市,峰峰矿区', '3', '56200', '0310', '130406', 'Fengfengkuangqu', '114.2114800', '36.4193700');
INSERT INTO `sys_cn_area` VALUES ('90', '邯郸县', '邯郸', '85', null, '中国,河北省,邯郸市,邯郸县', '3', '56101', '0310', '130421', 'Handan', '114.5310300', '36.5938500');
INSERT INTO `sys_cn_area` VALUES ('91', '临漳县', '临漳', '85', null, '中国,河北省,邯郸市,临漳县', '3', '56600', '0310', '130423', 'Linzhang', '114.6195000', '36.3346100');
INSERT INTO `sys_cn_area` VALUES ('92', '成安县', '成安', '85', null, '中国,河北省,邯郸市,成安县', '3', '56700', '0310', '130424', 'Cheng\'an', '114.6699500', '36.4441100');
INSERT INTO `sys_cn_area` VALUES ('93', '大名县', '大名', '85', null, '中国,河北省,邯郸市,大名县', '3', '56900', '0310', '130425', 'Daming', '115.1536200', '36.2799400');
INSERT INTO `sys_cn_area` VALUES ('94', '涉县', '涉县', '85', null, '中国,河北省,邯郸市,涉县', '3', '56400', '0310', '130426', 'Shexian', '113.6918300', '36.5807200');
INSERT INTO `sys_cn_area` VALUES ('95', '磁县', '磁县', '85', null, '中国,河北省,邯郸市,磁县', '3', '56500', '0310', '130427', 'Cixian', '114.3738700', '36.3739200');
INSERT INTO `sys_cn_area` VALUES ('96', '肥乡县', '肥乡', '85', null, '中国,河北省,邯郸市,肥乡县', '3', '57550', '0310', '130428', 'Feixiang', '114.7999800', '36.5480700');
INSERT INTO `sys_cn_area` VALUES ('97', '永年县', '永年', '85', null, '中国,河北省,邯郸市,永年县', '3', '57150', '0310', '130429', 'Yongnian', '114.4892500', '36.7835600');
INSERT INTO `sys_cn_area` VALUES ('98', '邱县', '邱县', '85', null, '中国,河北省,邯郸市,邱县', '3', '57450', '0310', '130430', 'Qiuxian', '115.1740700', '36.8208200');
INSERT INTO `sys_cn_area` VALUES ('99', '鸡泽县', '鸡泽', '85', null, '中国,河北省,邯郸市,鸡泽县', '3', '57350', '0310', '130431', 'Jize', '114.8742000', '36.9237400');
INSERT INTO `sys_cn_area` VALUES ('100', '广平县', '广平', '85', null, '中国,河北省,邯郸市,广平县', '3', '57650', '0310', '130432', 'Guangping', '114.9465300', '36.4804600');
INSERT INTO `sys_cn_area` VALUES ('101', '馆陶县', '馆陶', '85', null, '中国,河北省,邯郸市,馆陶县', '3', '57750', '0310', '130433', 'Guantao', '115.2991300', '36.5371900');
INSERT INTO `sys_cn_area` VALUES ('102', '魏县', '魏县', '85', null, '中国,河北省,邯郸市,魏县', '3', '56800', '0310', '130434', 'Weixian', '114.9351800', '36.3617100');
INSERT INTO `sys_cn_area` VALUES ('103', '曲周县', '曲周', '85', null, '中国,河北省,邯郸市,曲周县', '3', '57250', '0310', '130435', 'Quzhou', '114.9519600', '36.7767100');
INSERT INTO `sys_cn_area` VALUES ('104', '武安市', '武安', '85', null, '中国,河北省,邯郸市,武安市', '3', '56300', '0310', '130481', 'Wu\'an', '114.2015300', '36.6928100');
INSERT INTO `sys_cn_area` VALUES ('105', '邢台市', '邢台', '38', null, '中国,河北省,邢台市', '2', '54001', '0319', '130500', 'Xingtai', '114.5088510', '37.0682000');
INSERT INTO `sys_cn_area` VALUES ('106', '桥东区', '桥东', '105', null, '中国,河北省,邢台市,桥东区', '3', '54001', '0319', '130502', 'Qiaodong', '114.5072500', '37.0680100');
INSERT INTO `sys_cn_area` VALUES ('107', '桥西区', '桥西', '105', null, '中国,河北省,邢台市,桥西区', '3', '54000', '0319', '130503', 'Qiaoxi', '114.4680300', '37.0598400');
INSERT INTO `sys_cn_area` VALUES ('108', '邢台县', '邢台', '105', null, '中国,河北省,邢台市,邢台县', '3', '54001', '0319', '130521', 'Xingtai', '114.5657500', '37.0456000');
INSERT INTO `sys_cn_area` VALUES ('109', '临城县', '临城', '105', null, '中国,河北省,邢台市,临城县', '3', '54300', '0319', '130522', 'Lincheng', '114.5038700', '37.4397700');
INSERT INTO `sys_cn_area` VALUES ('110', '内丘县', '内丘', '105', null, '中国,河北省,邢台市,内丘县', '3', '54200', '0319', '130523', 'Neiqiu', '114.5121200', '37.2867100');
INSERT INTO `sys_cn_area` VALUES ('111', '柏乡县', '柏乡', '105', null, '中国,河北省,邢台市,柏乡县', '3', '55450', '0319', '130524', 'Baixiang', '114.6933200', '37.4824200');
INSERT INTO `sys_cn_area` VALUES ('112', '隆尧县', '隆尧', '105', null, '中国,河北省,邢台市,隆尧县', '3', '55350', '0319', '130525', 'Longyao', '114.7761500', '37.3535100');
INSERT INTO `sys_cn_area` VALUES ('113', '任县', '任县', '105', null, '中国,河北省,邢台市,任县', '3', '55150', '0319', '130526', 'Renxian', '114.6842000', '37.1257500');
INSERT INTO `sys_cn_area` VALUES ('114', '南和县', '南和', '105', null, '中国,河北省,邢台市,南和县', '3', '54400', '0319', '130527', 'Nanhe', '114.6837100', '37.0048800');
INSERT INTO `sys_cn_area` VALUES ('115', '宁晋县', '宁晋', '105', null, '中国,河北省,邢台市,宁晋县', '3', '55550', '0319', '130528', 'Ningjin', '114.9211700', '37.6169600');
INSERT INTO `sys_cn_area` VALUES ('116', '巨鹿县', '巨鹿', '105', null, '中国,河北省,邢台市,巨鹿县', '3', '55250', '0319', '130529', 'Julu', '115.0352400', '37.2180100');
INSERT INTO `sys_cn_area` VALUES ('117', '新河县', '新河', '105', null, '中国,河北省,邢台市,新河县', '3', '55650', '0319', '130530', 'Xinhe', '115.2498700', '37.5271800');
INSERT INTO `sys_cn_area` VALUES ('118', '广宗县', '广宗', '105', null, '中国,河北省,邢台市,广宗县', '3', '54600', '0319', '130531', 'Guangzong', '115.1425400', '37.0746000');
INSERT INTO `sys_cn_area` VALUES ('119', '平乡县', '平乡', '105', null, '中国,河北省,邢台市,平乡县', '3', '54500', '0319', '130532', 'Pingxiang', '115.0300200', '37.0631700');
INSERT INTO `sys_cn_area` VALUES ('120', '威县', '威县', '105', null, '中国,河北省,邢台市,威县', '3', '54700', '0319', '130533', 'Weixian', '115.2637000', '36.9768000');
INSERT INTO `sys_cn_area` VALUES ('121', '清河县', '清河', '105', null, '中国,河北省,邢台市,清河县', '3', '54800', '0319', '130534', 'Qinghe', '115.6647900', '37.0712200');
INSERT INTO `sys_cn_area` VALUES ('122', '临西县', '临西', '105', null, '中国,河北省,邢台市,临西县', '3', '54900', '0319', '130535', 'Linxi', '115.5009700', '36.8707800');
INSERT INTO `sys_cn_area` VALUES ('123', '南宫市', '南宫', '105', null, '中国,河北省,邢台市,南宫市', '3', '55750', '0319', '130581', 'Nangong', '115.3906800', '37.3579900');
INSERT INTO `sys_cn_area` VALUES ('124', '沙河市', '沙河', '105', null, '中国,河北省,邢台市,沙河市', '3', '54100', '0319', '130582', 'Shahe', '114.4981000', '36.8577000');
INSERT INTO `sys_cn_area` VALUES ('125', '保定市', '保定', '38', null, '中国,河北省,保定市', '2', '71052', '0312', '130600', 'Baoding', '115.4823310', '38.8676570');
INSERT INTO `sys_cn_area` VALUES ('126', '新市区', '新市', '125', null, '中国,河北省,保定市,新市区', '3', '71051', '0312', '130602', 'Xinshi', '115.4587000', '38.8775100');
INSERT INTO `sys_cn_area` VALUES ('127', '北市区', '北市', '125', null, '中国,河北省,保定市,北市区', '3', '71000', '0312', '130603', 'Beishi', '115.4971500', '38.8832200');
INSERT INTO `sys_cn_area` VALUES ('128', '南市区', '南市', '125', null, '中国,河北省,保定市,南市区', '3', '71001', '0312', '130604', 'Nanshi', '115.5285900', '38.8545500');
INSERT INTO `sys_cn_area` VALUES ('129', '满城县', '满城', '125', null, '中国,河北省,保定市,满城县', '3', '72150', '0312', '130621', 'Mancheng', '115.3229600', '38.9497200');
INSERT INTO `sys_cn_area` VALUES ('130', '清苑县', '清苑', '125', null, '中国,河北省,保定市,清苑县', '3', '71100', '0312', '130622', 'Qingyuan', '115.4926700', '38.7670900');
INSERT INTO `sys_cn_area` VALUES ('131', '涞水县', '涞水', '125', null, '中国,河北省,保定市,涞水县', '3', '74100', '0312', '130623', 'Laishui', '115.7151700', '39.3940400');
INSERT INTO `sys_cn_area` VALUES ('132', '阜平县', '阜平', '125', null, '中国,河北省,保定市,阜平县', '3', '73200', '0312', '130624', 'Fuping', '114.1968300', '38.8476300');
INSERT INTO `sys_cn_area` VALUES ('133', '徐水县', '徐水', '125', null, '中国,河北省,保定市,徐水县', '3', '72550', '0312', '130625', 'Xushui', '115.6582900', '39.0209900');
INSERT INTO `sys_cn_area` VALUES ('134', '定兴县', '定兴', '125', null, '中国,河北省,保定市,定兴县', '3', '72650', '0312', '130626', 'Dingxing', '115.8078600', '39.2631200');
INSERT INTO `sys_cn_area` VALUES ('135', '唐县', '唐县', '125', null, '中国,河北省,保定市,唐县', '3', '72350', '0312', '130627', 'Tangxian', '114.9851600', '38.7451300');
INSERT INTO `sys_cn_area` VALUES ('136', '高阳县', '高阳', '125', null, '中国,河北省,保定市,高阳县', '3', '71500', '0312', '130628', 'Gaoyang', '115.7788000', '38.7000300');
INSERT INTO `sys_cn_area` VALUES ('137', '容城县', '容城', '125', null, '中国,河北省,保定市,容城县', '3', '71700', '0312', '130629', 'Rongcheng', '115.8715800', '39.0535000');
INSERT INTO `sys_cn_area` VALUES ('138', '涞源县', '涞源', '125', null, '中国,河北省,保定市,涞源县', '3', '74300', '0312', '130630', 'Laiyuan', '114.6912800', '39.3538800');
INSERT INTO `sys_cn_area` VALUES ('139', '望都县', '望都', '125', null, '中国,河北省,保定市,望都县', '3', '72450', '0312', '130631', 'Wangdu', '115.1567000', '38.7099600');
INSERT INTO `sys_cn_area` VALUES ('140', '安新县', '安新', '125', null, '中国,河北省,保定市,安新县', '3', '71600', '0312', '130632', 'Anxin', '115.9355700', '38.9353200');
INSERT INTO `sys_cn_area` VALUES ('141', '易县', '易县', '125', null, '中国,河北省,保定市,易县', '3', '74200', '0312', '130633', 'Yixian', '115.4981000', '39.3488500');
INSERT INTO `sys_cn_area` VALUES ('142', '曲阳县', '曲阳', '125', null, '中国,河北省,保定市,曲阳县', '3', '73100', '0312', '130634', 'Quyang', '114.7012300', '38.6215400');
INSERT INTO `sys_cn_area` VALUES ('143', '蠡县', '蠡县', '125', null, '中国,河北省,保定市,蠡县', '3', '71400', '0312', '130635', 'Lixian', '115.5771700', '38.4897400');
INSERT INTO `sys_cn_area` VALUES ('144', '顺平县', '顺平', '125', null, '中国,河北省,保定市,顺平县', '3', '72250', '0312', '130636', 'Shunping', '115.1347000', '38.8385400');
INSERT INTO `sys_cn_area` VALUES ('145', '博野县', '博野', '125', null, '中国,河北省,保定市,博野县', '3', '71300', '0312', '130637', 'Boye', '115.4703300', '38.4564000');
INSERT INTO `sys_cn_area` VALUES ('146', '雄县', '雄县', '125', null, '中国,河北省,保定市,雄县', '3', '71800', '0312', '130638', 'Xiongxian', '116.1087300', '38.9944200');
INSERT INTO `sys_cn_area` VALUES ('147', '涿州市', '涿州', '125', null, '中国,河北省,保定市,涿州市', '3', '72750', '0312', '130681', 'Zhuozhou', '115.9806200', '39.4862200');
INSERT INTO `sys_cn_area` VALUES ('148', '定州市', '定州', '125', null, '中国,河北省,保定市,定州市', '3', '73000', '0312', '130682', 'Dingzhou', '114.9902000', '38.5162300');
INSERT INTO `sys_cn_area` VALUES ('149', '安国市', '安国', '125', null, '中国,河北省,保定市,安国市', '3', '71200', '0312', '130683', 'Anguo', '115.3232100', '38.4139100');
INSERT INTO `sys_cn_area` VALUES ('150', '高碑店市', '高碑店', '125', null, '中国,河北省,保定市,高碑店市', '3', '74000', '0312', '130684', 'Gaobeidian', '115.8736800', '39.3265500');
INSERT INTO `sys_cn_area` VALUES ('151', '张家口市', '张家口', '38', null, '中国,河北省,张家口市', '2', '75000', '0313', '130700', 'Zhangjiakou', '114.8840910', '40.8119010');
INSERT INTO `sys_cn_area` VALUES ('152', '桥东区', '桥东', '151', null, '中国,河北省,张家口市,桥东区', '3', '75000', '0313', '130702', 'Qiaodong', '114.8943000', '40.7884400');
INSERT INTO `sys_cn_area` VALUES ('153', '桥西区', '桥西', '151', null, '中国,河北省,张家口市,桥西区', '3', '75061', '0313', '130703', 'Qiaoxi', '114.8696200', '40.8194500');
INSERT INTO `sys_cn_area` VALUES ('154', '宣化区', '宣化', '151', null, '中国,河北省,张家口市,宣化区', '3', '75100', '0313', '130705', 'Xuanhua', '115.0654300', '40.6095700');
INSERT INTO `sys_cn_area` VALUES ('155', '下花园区', '下花园', '151', null, '中国,河北省,张家口市,下花园区', '3', '75300', '0313', '130706', 'Xiahuayuan', '115.2874400', '40.5023600');
INSERT INTO `sys_cn_area` VALUES ('156', '宣化县', '宣化', '151', null, '中国,河北省,张家口市,宣化县', '3', '75100', '0313', '130721', 'Xuanhua', '115.1549700', '40.5661800');
INSERT INTO `sys_cn_area` VALUES ('157', '张北县', '张北', '151', null, '中国,河北省,张家口市,张北县', '3', '76450', '0313', '130722', 'Zhangbei', '114.7143200', '41.1597700');
INSERT INTO `sys_cn_area` VALUES ('158', '康保县', '康保', '151', null, '中国,河北省,张家口市,康保县', '3', '76650', '0313', '130723', 'Kangbao', '114.6003100', '41.8522500');
INSERT INTO `sys_cn_area` VALUES ('159', '沽源县', '沽源', '151', null, '中国,河北省,张家口市,沽源县', '3', '76550', '0313', '130724', 'Guyuan', '115.6885900', '41.6695900');
INSERT INTO `sys_cn_area` VALUES ('160', '尚义县', '尚义', '151', null, '中国,河北省,张家口市,尚义县', '3', '76750', '0313', '130725', 'Shangyi', '113.9713400', '41.0778200');
INSERT INTO `sys_cn_area` VALUES ('161', '蔚县', '蔚县', '151', null, '中国,河北省,张家口市,蔚县', '3', '75700', '0313', '130726', 'Yuxian', '114.5889200', '39.8406700');
INSERT INTO `sys_cn_area` VALUES ('162', '阳原县', '阳原', '151', null, '中国,河北省,张家口市,阳原县', '3', '75800', '0313', '130727', 'Yangyuan', '114.1505100', '40.1036100');
INSERT INTO `sys_cn_area` VALUES ('163', '怀安县', '怀安', '151', null, '中国,河北省,张家口市,怀安县', '3', '76150', '0313', '130728', 'Huai\'an', '114.3855900', '40.6742500');
INSERT INTO `sys_cn_area` VALUES ('164', '万全县', '万全', '151', null, '中国,河北省,张家口市,万全县', '3', '76250', '0313', '130729', 'Wanquan', '114.7405000', '40.7669400');
INSERT INTO `sys_cn_area` VALUES ('165', '怀来县', '怀来', '151', null, '中国,河北省,张家口市,怀来县', '3', '75400', '0313', '130730', 'Huailai', '115.5177300', '40.4153600');
INSERT INTO `sys_cn_area` VALUES ('166', '涿鹿县', '涿鹿', '151', null, '中国,河北省,张家口市,涿鹿县', '3', '75600', '0313', '130731', 'Zhuolu', '115.2240300', '40.3763600');
INSERT INTO `sys_cn_area` VALUES ('167', '赤城县', '赤城', '151', null, '中国,河北省,张家口市,赤城县', '3', '75500', '0313', '130732', 'Chicheng', '115.8318700', '40.9143800');
INSERT INTO `sys_cn_area` VALUES ('168', '崇礼县', '崇礼', '151', null, '中国,河北省,张家口市,崇礼县', '3', '76350', '0313', '130733', 'Chongli', '115.2799300', '40.9751900');
INSERT INTO `sys_cn_area` VALUES ('169', '承德市', '承德', '38', null, '中国,河北省,承德市', '2', '67000', '0314', '130800', 'Chengde', '117.9391520', '40.9762040');
INSERT INTO `sys_cn_area` VALUES ('170', '双桥区', '双桥', '169', null, '中国,河北省,承德市,双桥区', '3', '67000', '0314', '130802', 'Shuangqiao', '117.9432000', '40.9746600');
INSERT INTO `sys_cn_area` VALUES ('171', '双滦区', '双滦', '169', null, '中国,河北省,承德市,双滦区', '3', '67001', '0314', '130803', 'Shuangluan', '117.7448700', '40.9537500');
INSERT INTO `sys_cn_area` VALUES ('172', '鹰手营子矿区', '鹰手营子矿区', '169', null, '中国,河北省,承德市,鹰手营子矿区', '3', '67200', '0314', '130804', 'Yingshouyingzikuangqu', '117.6598500', '40.5474400');
INSERT INTO `sys_cn_area` VALUES ('173', '承德县', '承德', '169', null, '中国,河北省,承德市,承德县', '3', '67400', '0314', '130821', 'Chengde', '118.1763900', '40.7698500');
INSERT INTO `sys_cn_area` VALUES ('174', '兴隆县', '兴隆', '169', null, '中国,河北省,承德市,兴隆县', '3', '67300', '0314', '130822', 'Xinglong', '117.5007300', '40.4170900');
INSERT INTO `sys_cn_area` VALUES ('175', '平泉县', '平泉', '169', null, '中国,河北省,承德市,平泉县', '3', '67500', '0314', '130823', 'Pingquan', '118.7019600', '41.0183900');
INSERT INTO `sys_cn_area` VALUES ('176', '滦平县', '滦平', '169', null, '中国,河北省,承德市,滦平县', '3', '68250', '0314', '130824', 'Luanping', '117.3327600', '40.9414800');
INSERT INTO `sys_cn_area` VALUES ('177', '隆化县', '隆化', '169', null, '中国,河北省,承德市,隆化县', '3', '68150', '0314', '130825', 'Longhua', '117.7297000', '41.3141200');
INSERT INTO `sys_cn_area` VALUES ('178', '丰宁满族自治县', '丰宁', '169', null, '中国,河北省,承德市,丰宁满族自治县', '3', '68350', '0314', '130826', 'Fengning', '116.6492000', '41.2048100');
INSERT INTO `sys_cn_area` VALUES ('179', '宽城满族自治县', '宽城', '169', null, '中国,河北省,承德市,宽城满族自治县', '3', '67600', '0314', '130827', 'Kuancheng', '118.4917600', '40.6082900');
INSERT INTO `sys_cn_area` VALUES ('180', '围场满族蒙古族自治县', '围场', '169', null, '中国,河北省,承德市,围场满族蒙古族自治县', '3', '68450', '0314', '130828', 'Weichang', '117.7601000', '41.9436800');
INSERT INTO `sys_cn_area` VALUES ('181', '沧州市', '沧州', '38', null, '中国,河北省,沧州市', '2', '61001', '0317', '130900', 'Cangzhou', '116.8574610', '38.3105820');
INSERT INTO `sys_cn_area` VALUES ('182', '新华区', '新华', '181', null, '中国,河北省,沧州市,新华区', '3', '61000', '0317', '130902', 'Xinhua', '116.8664300', '38.3143800');
INSERT INTO `sys_cn_area` VALUES ('183', '运河区', '运河', '181', null, '中国,河北省,沧州市,运河区', '3', '61001', '0317', '130903', 'Yunhe', '116.8570600', '38.3135200');
INSERT INTO `sys_cn_area` VALUES ('184', '沧县', '沧县', '181', null, '中国,河北省,沧州市,沧县', '3', '61000', '0317', '130921', 'Cangxian', '116.8781700', '38.2936100');
INSERT INTO `sys_cn_area` VALUES ('185', '青县', '青县', '181', null, '中国,河北省,沧州市,青县', '3', '62650', '0317', '130922', 'Qingxian', '116.8031600', '38.5834500');
INSERT INTO `sys_cn_area` VALUES ('186', '东光县', '东光', '181', null, '中国,河北省,沧州市,东光县', '3', '61600', '0317', '130923', 'Dongguang', '116.5366800', '37.8857000');
INSERT INTO `sys_cn_area` VALUES ('187', '海兴县', '海兴', '181', null, '中国,河北省,沧州市,海兴县', '3', '61200', '0317', '130924', 'Haixing', '117.4975800', '38.1395800');
INSERT INTO `sys_cn_area` VALUES ('188', '盐山县', '盐山', '181', null, '中国,河北省,沧州市,盐山县', '3', '61300', '0317', '130925', 'Yanshan', '117.2309200', '38.0564700');
INSERT INTO `sys_cn_area` VALUES ('189', '肃宁县', '肃宁', '181', null, '中国,河北省,沧州市,肃宁县', '3', '62350', '0317', '130926', 'Suning', '115.8297100', '38.4227200');
INSERT INTO `sys_cn_area` VALUES ('190', '南皮县', '南皮', '181', null, '中国,河北省,沧州市,南皮县', '3', '61500', '0317', '130927', 'Nanpi', '116.7022400', '38.0410900');
INSERT INTO `sys_cn_area` VALUES ('191', '吴桥县', '吴桥', '181', null, '中国,河北省,沧州市,吴桥县', '3', '61800', '0317', '130928', 'Wuqiao', '116.3847000', '37.6254600');
INSERT INTO `sys_cn_area` VALUES ('192', '献县', '献县', '181', null, '中国,河北省,沧州市,献县', '3', '62250', '0317', '130929', 'Xianxian', '116.1269500', '38.1922800');
INSERT INTO `sys_cn_area` VALUES ('193', '孟村回族自治县', '孟村', '181', null, '中国,河北省,沧州市,孟村回族自治县', '3', '61400', '0317', '130930', 'Mengcun', '117.1041200', '38.0533800');
INSERT INTO `sys_cn_area` VALUES ('194', '泊头市', '泊头', '181', null, '中国,河北省,沧州市,泊头市', '3', '62150', '0317', '130981', 'Botou', '116.5782400', '38.0835900');
INSERT INTO `sys_cn_area` VALUES ('195', '任丘市', '任丘', '181', null, '中国,河北省,沧州市,任丘市', '3', '62550', '0317', '130982', 'Renqiu', '116.1033000', '38.7112400');
INSERT INTO `sys_cn_area` VALUES ('196', '黄骅市', '黄骅', '181', null, '中国,河北省,沧州市,黄骅市', '3', '61100', '0317', '130983', 'Huanghua', '117.3388300', '38.3706000');
INSERT INTO `sys_cn_area` VALUES ('197', '河间市', '河间', '181', null, '中国,河北省,沧州市,河间市', '3', '62450', '0317', '130984', 'Hejian', '116.0993000', '38.4454900');
INSERT INTO `sys_cn_area` VALUES ('198', '廊坊市', '廊坊', '38', null, '中国,河北省,廊坊市', '2', '65000', '0316', '131000', 'Langfang', '116.7138730', '39.5292440');
INSERT INTO `sys_cn_area` VALUES ('199', '安次区', '安次', '198', null, '中国,河北省,廊坊市,安次区', '3', '65000', '0316', '131002', 'Anci', '116.7030800', '39.5205700');
INSERT INTO `sys_cn_area` VALUES ('200', '广阳区', '广阳', '198', null, '中国,河北省,廊坊市,广阳区', '3', '65000', '0316', '131003', 'Guangyang', '116.7106900', '39.5227800');
INSERT INTO `sys_cn_area` VALUES ('201', '固安县', '固安', '198', null, '中国,河北省,廊坊市,固安县', '3', '65500', '0316', '131022', 'Gu\'an', '116.2991600', '39.4383300');
INSERT INTO `sys_cn_area` VALUES ('202', '永清县', '永清', '198', null, '中国,河北省,廊坊市,永清县', '3', '65600', '0316', '131023', 'Yongqing', '116.5009100', '39.3206900');
INSERT INTO `sys_cn_area` VALUES ('203', '香河县', '香河', '198', null, '中国,河北省,廊坊市,香河县', '3', '65400', '0316', '131024', 'Xianghe', '117.0063400', '39.7613300');
INSERT INTO `sys_cn_area` VALUES ('204', '大城县', '大城', '198', null, '中国,河北省,廊坊市,大城县', '3', '65900', '0316', '131025', 'Daicheng', '116.6535300', '38.7053400');
INSERT INTO `sys_cn_area` VALUES ('205', '文安县', '文安', '198', null, '中国,河北省,廊坊市,文安县', '3', '65800', '0316', '131026', 'Wen\'an', '116.4584600', '38.8732500');
INSERT INTO `sys_cn_area` VALUES ('206', '大厂回族自治县', '大厂', '198', null, '中国,河北省,廊坊市,大厂回族自治县', '3', '65300', '0316', '131028', 'Dachang', '116.9891600', '39.8864900');
INSERT INTO `sys_cn_area` VALUES ('207', '霸州市', '霸州', '198', null, '中国,河北省,廊坊市,霸州市', '3', '65700', '0316', '131081', 'Bazhou', '116.3915400', '39.1256900');
INSERT INTO `sys_cn_area` VALUES ('208', '三河市', '三河', '198', null, '中国,河北省,廊坊市,三河市', '3', '65200', '0316', '131082', 'Sanhe', '117.0722900', '39.9835800');
INSERT INTO `sys_cn_area` VALUES ('209', '衡水市', '衡水', '38', null, '中国,河北省,衡水市', '2', '53000', '0318', '131100', 'Hengshui', '115.6659930', '37.7350970');
INSERT INTO `sys_cn_area` VALUES ('210', '桃城区', '桃城', '209', null, '中国,河北省,衡水市,桃城区', '3', '53000', '0318', '131102', 'Taocheng', '115.6752900', '37.7349900');
INSERT INTO `sys_cn_area` VALUES ('211', '枣强县', '枣强', '209', null, '中国,河北省,衡水市,枣强县', '3', '53100', '0318', '131121', 'Zaoqiang', '115.7257600', '37.5102700');
INSERT INTO `sys_cn_area` VALUES ('212', '武邑县', '武邑', '209', null, '中国,河北省,衡水市,武邑县', '3', '53400', '0318', '131122', 'Wuyi', '115.8874800', '37.8018100');
INSERT INTO `sys_cn_area` VALUES ('213', '武强县', '武强', '209', null, '中国,河北省,衡水市,武强县', '3', '53300', '0318', '131123', 'Wuqiang', '115.9822600', '38.0413800');
INSERT INTO `sys_cn_area` VALUES ('214', '饶阳县', '饶阳', '209', null, '中国,河北省,衡水市,饶阳县', '3', '53900', '0318', '131124', 'Raoyang', '115.7255800', '38.2352900');
INSERT INTO `sys_cn_area` VALUES ('215', '安平县', '安平', '209', null, '中国,河北省,衡水市,安平县', '3', '53600', '0318', '131125', 'Anping', '115.5187600', '38.2338800');
INSERT INTO `sys_cn_area` VALUES ('216', '故城县', '故城', '209', null, '中国,河北省,衡水市,故城县', '3', '53800', '0318', '131126', 'Gucheng', '115.9707600', '37.3477300');
INSERT INTO `sys_cn_area` VALUES ('217', '景县', '景县', '209', null, '中国,河北省,衡水市,景县', '3', '53500', '0318', '131127', 'Jingxian', '116.2690400', '37.6926000');
INSERT INTO `sys_cn_area` VALUES ('218', '阜城县', '阜城', '209', null, '中国,河北省,衡水市,阜城县', '3', '53700', '0318', '131128', 'Fucheng', '116.1443100', '37.8688100');
INSERT INTO `sys_cn_area` VALUES ('219', '冀州市', '冀州', '209', null, '中国,河北省,衡水市,冀州市', '3', '53200', '0318', '131181', 'Jizhou', '115.5793400', '37.5508200');
INSERT INTO `sys_cn_area` VALUES ('220', '深州市', '深州', '209', null, '中国,河北省,衡水市,深州市', '3', '53800', '0318', '131182', 'Shenzhou', '115.5599300', '38.0010900');
INSERT INTO `sys_cn_area` VALUES ('221', '山西省', '山西', '1', null, '中国,山西省', '1', null, '', '140000', 'Shanxi', '112.5492480', '37.8570140');
INSERT INTO `sys_cn_area` VALUES ('222', '太原市', '太原', '221', null, '中国,山西省,太原市', '2', '30082', '0351', '140100', 'Taiyuan', '112.5492480', '37.8570140');
INSERT INTO `sys_cn_area` VALUES ('223', '小店区', '小店', '222', null, '中国,山西省,太原市,小店区', '3', '30032', '0351', '140105', 'Xiaodian', '112.5687800', '37.7356500');
INSERT INTO `sys_cn_area` VALUES ('224', '迎泽区', '迎泽', '222', null, '中国,山西省,太原市,迎泽区', '3', '30002', '0351', '140106', 'Yingze', '112.5633800', '37.8632600');
INSERT INTO `sys_cn_area` VALUES ('225', '杏花岭区', '杏花岭', '222', null, '中国,山西省,太原市,杏花岭区', '3', '30009', '0351', '140107', 'Xinghualing', '112.5623700', '37.8842900');
INSERT INTO `sys_cn_area` VALUES ('226', '尖草坪区', '尖草坪', '222', null, '中国,山西省,太原市,尖草坪区', '3', '30023', '0351', '140108', 'Jiancaoping', '112.4870900', '37.9419300');
INSERT INTO `sys_cn_area` VALUES ('227', '万柏林区', '万柏林', '222', null, '中国,山西省,太原市,万柏林区', '3', '30024', '0351', '140109', 'Wanbailin', '112.5155300', '37.8592300');
INSERT INTO `sys_cn_area` VALUES ('228', '晋源区', '晋源', '222', null, '中国,山西省,太原市,晋源区', '3', '30025', '0351', '140110', 'Jinyuan', '112.4798500', '37.7247900');
INSERT INTO `sys_cn_area` VALUES ('229', '清徐县', '清徐', '222', null, '中国,山西省,太原市,清徐县', '3', '30400', '0351', '140121', 'Qingxu', '112.3588800', '37.6075800');
INSERT INTO `sys_cn_area` VALUES ('230', '阳曲县', '阳曲', '222', null, '中国,山西省,太原市,阳曲县', '3', '30100', '0351', '140122', 'Yangqu', '112.6786100', '38.0598900');
INSERT INTO `sys_cn_area` VALUES ('231', '娄烦县', '娄烦', '222', null, '中国,山西省,太原市,娄烦县', '3', '30300', '0351', '140123', 'Loufan', '111.7947300', '38.0668900');
INSERT INTO `sys_cn_area` VALUES ('232', '古交市', '古交', '222', null, '中国,山西省,太原市,古交市', '3', '30200', '0351', '140181', 'Gujiao', '112.1691800', '37.9098300');
INSERT INTO `sys_cn_area` VALUES ('233', '大同市', '大同', '221', null, '中国,山西省,大同市', '2', '37008', '0352', '140200', 'Datong', '113.2952590', '40.0903100');
INSERT INTO `sys_cn_area` VALUES ('234', '城区', '城区', '233', null, '中国,山西省,大同市,城区', '3', '37008', '0352', '140202', 'Chengqu', '113.2980000', '40.0756600');
INSERT INTO `sys_cn_area` VALUES ('235', '矿区', '矿区', '233', null, '中国,山西省,大同市,矿区', '3', '37003', '0352', '140203', 'Kuangqu', '113.1772000', '40.0368500');
INSERT INTO `sys_cn_area` VALUES ('236', '南郊区', '南郊', '233', null, '中国,山西省,大同市,南郊区', '3', '37001', '0352', '140211', 'Nanjiao', '113.1494700', '40.0053900');
INSERT INTO `sys_cn_area` VALUES ('237', '新荣区', '新荣', '233', null, '中国,山西省,大同市,新荣区', '3', '37002', '0352', '140212', 'Xinrong', '113.1350400', '40.2561800');
INSERT INTO `sys_cn_area` VALUES ('238', '阳高县', '阳高', '233', null, '中国,山西省,大同市,阳高县', '3', '38100', '0352', '140221', 'Yanggao', '113.7501200', '40.3625600');
INSERT INTO `sys_cn_area` VALUES ('239', '天镇县', '天镇', '233', null, '中国,山西省,大同市,天镇县', '3', '38200', '0352', '140222', 'Tianzhen', '114.0931000', '40.4229900');
INSERT INTO `sys_cn_area` VALUES ('240', '广灵县', '广灵', '233', null, '中国,山西省,大同市,广灵县', '3', '37500', '0352', '140223', 'Guangling', '114.2820400', '39.7608200');
INSERT INTO `sys_cn_area` VALUES ('241', '灵丘县', '灵丘', '233', null, '中国,山西省,大同市,灵丘县', '3', '34400', '0352', '140224', 'Lingqiu', '114.2367200', '39.4404300');
INSERT INTO `sys_cn_area` VALUES ('242', '浑源县', '浑源', '233', null, '中国,山西省,大同市,浑源县', '3', '37400', '0352', '140225', 'Hunyuan', '113.6955200', '39.6996200');
INSERT INTO `sys_cn_area` VALUES ('243', '左云县', '左云', '233', null, '中国,山西省,大同市,左云县', '3', '37100', '0352', '140226', 'Zuoyun', '112.7026600', '40.0133600');
INSERT INTO `sys_cn_area` VALUES ('244', '大同县', '大同', '233', null, '中国,山西省,大同市,大同县', '3', '37300', '0352', '140227', 'Datong', '113.6121200', '40.0401200');
INSERT INTO `sys_cn_area` VALUES ('245', '阳泉市', '阳泉', '221', null, '中国,山西省,阳泉市', '2', '45000', '0353', '140300', 'Yangquan', '113.5832850', '37.8611880');
INSERT INTO `sys_cn_area` VALUES ('246', '城区', '城区', '245', null, '中国,山西省,阳泉市,城区', '3', '45000', '0353', '140302', 'Chengqu', '113.6006900', '37.8474000');
INSERT INTO `sys_cn_area` VALUES ('247', '矿区', '矿区', '245', null, '中国,山西省,阳泉市,矿区', '3', '45000', '0353', '140303', 'Kuangqu', '113.5567700', '37.8689500');
INSERT INTO `sys_cn_area` VALUES ('248', '郊区', '郊区', '245', null, '中国,山西省,阳泉市,郊区', '3', '45011', '0353', '140311', 'Jiaoqu', '113.5853900', '37.9413900');
INSERT INTO `sys_cn_area` VALUES ('249', '平定县', '平定', '245', null, '中国,山西省,阳泉市,平定县', '3', '45200', '0353', '140321', 'Pingding', '113.6578900', '37.7860100');
INSERT INTO `sys_cn_area` VALUES ('250', '盂县', '盂县', '245', null, '中国,山西省,阳泉市,盂县', '3', '45100', '0353', '140322', 'Yuxian', '113.4123500', '38.0857900');
INSERT INTO `sys_cn_area` VALUES ('251', '长治市', '长治', '221', null, '中国,山西省,长治市', '2', '46000', '0355', '140400', 'Changzhi', '113.1135560', '36.1911120');
INSERT INTO `sys_cn_area` VALUES ('252', '城区', '城区', '251', null, '中国,山西省,长治市,城区', '3', '46011', '0355', '140402', 'Chengqu', '113.1230800', '36.2035100');
INSERT INTO `sys_cn_area` VALUES ('253', '郊区', '郊区', '251', null, '中国,山西省,长治市,郊区', '3', '46011', '0355', '140411', 'Jiaoqu', '113.1265300', '36.1991800');
INSERT INTO `sys_cn_area` VALUES ('254', '长治县', '长治', '251', null, '中国,山西省,长治市,长治县', '3', '47100', '0355', '140421', 'Changzhi', '113.0479100', '36.0472200');
INSERT INTO `sys_cn_area` VALUES ('255', '襄垣县', '襄垣', '251', null, '中国,山西省,长治市,襄垣县', '3', '46200', '0355', '140423', 'Xiangyuan', '113.0515700', '36.5352700');
INSERT INTO `sys_cn_area` VALUES ('256', '屯留县', '屯留', '251', null, '中国,山西省,长治市,屯留县', '3', '46100', '0355', '140424', 'Tunliu', '112.8919600', '36.3157900');
INSERT INTO `sys_cn_area` VALUES ('257', '平顺县', '平顺', '251', null, '中国,山西省,长治市,平顺县', '3', '47400', '0355', '140425', 'Pingshun', '113.4360300', '36.2000500');
INSERT INTO `sys_cn_area` VALUES ('258', '黎城县', '黎城', '251', null, '中国,山西省,长治市,黎城县', '3', '47600', '0355', '140426', 'Licheng', '113.3876600', '36.5030100');
INSERT INTO `sys_cn_area` VALUES ('259', '壶关县', '壶关', '251', null, '中国,山西省,长治市,壶关县', '3', '47300', '0355', '140427', 'Huguan', '113.2070000', '36.1130100');
INSERT INTO `sys_cn_area` VALUES ('260', '长子县', '长子', '251', null, '中国,山西省,长治市,长子县', '3', '46600', '0355', '140428', 'Zhangzi', '112.8773100', '36.1212500');
INSERT INTO `sys_cn_area` VALUES ('261', '武乡县', '武乡', '251', null, '中国,山西省,长治市,武乡县', '3', '46300', '0355', '140429', 'Wuxiang', '112.8634300', '36.8368700');
INSERT INTO `sys_cn_area` VALUES ('262', '沁县', '沁县', '251', null, '中国,山西省,长治市,沁县', '3', '46400', '0355', '140430', 'Qinxian', '112.6986300', '36.7562800');
INSERT INTO `sys_cn_area` VALUES ('263', '沁源县', '沁源', '251', null, '中国,山西省,长治市,沁源县', '3', '46500', '0355', '140431', 'Qinyuan', '112.3375800', '36.5000800');
INSERT INTO `sys_cn_area` VALUES ('264', '潞城市', '潞城', '251', null, '中国,山西省,长治市,潞城市', '3', '47500', '0355', '140481', 'Lucheng', '113.2288800', '36.3341400');
INSERT INTO `sys_cn_area` VALUES ('265', '晋城市', '晋城', '221', null, '中国,山西省,晋城市', '2', '48000', '0356', '140500', 'Jincheng', '112.8512740', '35.4975530');
INSERT INTO `sys_cn_area` VALUES ('266', '城区', '城区', '265', null, '中国,山西省,晋城市,城区', '3', '48000', '0356', '140502', 'Chengqu', '112.8531900', '35.5017500');
INSERT INTO `sys_cn_area` VALUES ('267', '沁水县', '沁水', '265', null, '中国,山西省,晋城市,沁水县', '3', '48200', '0356', '140521', 'Qinshui', '112.1871000', '35.6910200');
INSERT INTO `sys_cn_area` VALUES ('268', '阳城县', '阳城', '265', null, '中国,山西省,晋城市,阳城县', '3', '48100', '0356', '140522', 'Yangcheng', '112.4148500', '35.4861400');
INSERT INTO `sys_cn_area` VALUES ('269', '陵川县', '陵川', '265', null, '中国,山西省,晋城市,陵川县', '3', '48300', '0356', '140524', 'Lingchuan', '113.2806000', '35.7753200');
INSERT INTO `sys_cn_area` VALUES ('270', '泽州县', '泽州', '265', null, '中国,山西省,晋城市,泽州县', '3', '48012', '0356', '140525', 'Zezhou', '112.8394700', '35.5078900');
INSERT INTO `sys_cn_area` VALUES ('271', '高平市', '高平', '265', null, '中国,山西省,晋城市,高平市', '3', '48400', '0356', '140581', 'Gaoping', '112.9228800', '35.7970500');
INSERT INTO `sys_cn_area` VALUES ('272', '朔州市', '朔州', '221', null, '中国,山西省,朔州市', '2', '38500', '0349', '140600', 'Shuozhou', '112.4333870', '39.3312610');
INSERT INTO `sys_cn_area` VALUES ('273', '朔城区', '朔城', '272', null, '中国,山西省,朔州市,朔城区', '3', '36000', '0349', '140602', 'Shuocheng', '112.4318900', '39.3198200');
INSERT INTO `sys_cn_area` VALUES ('274', '平鲁区', '平鲁', '272', null, '中国,山西省,朔州市,平鲁区', '3', '38600', '0349', '140603', 'Pinglu', '112.2883300', '39.5115500');
INSERT INTO `sys_cn_area` VALUES ('275', '山阴县', '山阴', '272', null, '中国,山西省,朔州市,山阴县', '3', '36900', '0349', '140621', 'Shanyin', '112.8166200', '39.5269700');
INSERT INTO `sys_cn_area` VALUES ('276', '应县', '应县', '272', null, '中国,山西省,朔州市,应县', '3', '37600', '0349', '140622', 'Yingxian', '113.1905200', '39.5527900');
INSERT INTO `sys_cn_area` VALUES ('277', '右玉县', '右玉', '272', null, '中国,山西省,朔州市,右玉县', '3', '37200', '0349', '140623', 'Youyu', '112.4690200', '39.9901100');
INSERT INTO `sys_cn_area` VALUES ('278', '怀仁县', '怀仁', '272', null, '中国,山西省,朔州市,怀仁县', '3', '38300', '0349', '140624', 'Huairen', '113.1000900', '39.8280600');
INSERT INTO `sys_cn_area` VALUES ('279', '晋中市', '晋中', '221', null, '中国,山西省,晋中市', '2', '30600', '0354', '140700', 'Jinzhong', '112.7364650', '37.6964950');
INSERT INTO `sys_cn_area` VALUES ('280', '榆次区', '榆次', '279', null, '中国,山西省,晋中市,榆次区', '3', '30600', '0354', '140702', 'Yuci', '112.7078800', '37.6978000');
INSERT INTO `sys_cn_area` VALUES ('281', '榆社县', '榆社', '279', null, '中国,山西省,晋中市,榆社县', '3', '31800', '0354', '140721', 'Yushe', '112.9755800', '37.0721000');
INSERT INTO `sys_cn_area` VALUES ('282', '左权县', '左权', '279', null, '中国,山西省,晋中市,左权县', '3', '32600', '0354', '140722', 'Zuoquan', '113.3791800', '37.0823500');
INSERT INTO `sys_cn_area` VALUES ('283', '和顺县', '和顺', '279', null, '中国,山西省,晋中市,和顺县', '3', '32700', '0354', '140723', 'Heshun', '113.5698800', '37.3296300');
INSERT INTO `sys_cn_area` VALUES ('284', '昔阳县', '昔阳', '279', null, '中国,山西省,晋中市,昔阳县', '3', '45300', '0354', '140724', 'Xiyang', '113.7051700', '37.6186300');
INSERT INTO `sys_cn_area` VALUES ('285', '寿阳县', '寿阳', '279', null, '中国,山西省,晋中市,寿阳县', '3', '45400', '0354', '140725', 'Shouyang', '113.1749500', '37.8889900');
INSERT INTO `sys_cn_area` VALUES ('286', '太谷县', '太谷', '279', null, '中国,山西省,晋中市,太谷县', '3', '30800', '0354', '140726', 'Taigu', '112.5524600', '37.4216100');
INSERT INTO `sys_cn_area` VALUES ('287', '祁县', '祁县', '279', null, '中国,山西省,晋中市,祁县', '3', '30900', '0354', '140727', 'Qixian', '112.3335800', '37.3579000');
INSERT INTO `sys_cn_area` VALUES ('288', '平遥县', '平遥', '279', null, '中国,山西省,晋中市,平遥县', '3', '31100', '0354', '140728', 'Pingyao', '112.1755300', '37.1892000');
INSERT INTO `sys_cn_area` VALUES ('289', '灵石县', '灵石', '279', null, '中国,山西省,晋中市,灵石县', '3', '31300', '0354', '140729', 'Lingshi', '111.7774000', '36.8481400');
INSERT INTO `sys_cn_area` VALUES ('290', '介休市', '介休', '279', null, '中国,山西省,晋中市,介休市', '3', '32000', '0354', '140781', 'Jiexiu', '111.9182400', '37.0277100');
INSERT INTO `sys_cn_area` VALUES ('291', '运城市', '运城', '221', null, '中国,山西省,运城市', '2', '44000', '0359', '140800', 'Yuncheng', '111.0039570', '35.0227780');
INSERT INTO `sys_cn_area` VALUES ('292', '盐湖区', '盐湖', '291', null, '中国,山西省,运城市,盐湖区', '3', '44000', '0359', '140802', 'Yanhu', '110.9982700', '35.0151000');
INSERT INTO `sys_cn_area` VALUES ('293', '临猗县', '临猗', '291', null, '中国,山西省,运城市,临猗县', '3', '44100', '0359', '140821', 'Linyi', '110.7743200', '35.1445500');
INSERT INTO `sys_cn_area` VALUES ('294', '万荣县', '万荣', '291', null, '中国,山西省,运城市,万荣县', '3', '44200', '0359', '140822', 'Wanrong', '110.8365700', '35.4155600');
INSERT INTO `sys_cn_area` VALUES ('295', '闻喜县', '闻喜', '291', null, '中国,山西省,运城市,闻喜县', '3', '43800', '0359', '140823', 'Wenxi', '111.2226500', '35.3555300');
INSERT INTO `sys_cn_area` VALUES ('296', '稷山县', '稷山', '291', null, '中国,山西省,运城市,稷山县', '3', '43200', '0359', '140824', 'Jishan', '110.9792400', '35.5999300');
INSERT INTO `sys_cn_area` VALUES ('297', '新绛县', '新绛', '291', null, '中国,山西省,运城市,新绛县', '3', '43100', '0359', '140825', 'Xinjiang', '111.2250900', '35.6156600');
INSERT INTO `sys_cn_area` VALUES ('298', '绛县', '绛县', '291', null, '中国,山西省,运城市,绛县', '3', '43600', '0359', '140826', 'Jiangxian', '111.5666800', '35.4909600');
INSERT INTO `sys_cn_area` VALUES ('299', '垣曲县', '垣曲', '291', null, '中国,山西省,运城市,垣曲县', '3', '43700', '0359', '140827', 'Yuanqu', '111.6716600', '35.2992300');
INSERT INTO `sys_cn_area` VALUES ('300', '夏县', '夏县', '291', null, '中国,山西省,运城市,夏县', '3', '44400', '0359', '140828', 'Xiaxian', '111.2196600', '35.1412100');
INSERT INTO `sys_cn_area` VALUES ('301', '平陆县', '平陆', '291', null, '中国,山西省,运城市,平陆县', '3', '44300', '0359', '140829', 'Pinglu', '111.2170400', '34.8377200');
INSERT INTO `sys_cn_area` VALUES ('302', '芮城县', '芮城', '291', null, '中国,山西省,运城市,芮城县', '3', '44600', '0359', '140830', 'Ruicheng', '110.6945500', '34.6938400');
INSERT INTO `sys_cn_area` VALUES ('303', '永济市', '永济', '291', null, '中国,山西省,运城市,永济市', '3', '44500', '0359', '140881', 'Yongji', '110.4453700', '34.8655600');
INSERT INTO `sys_cn_area` VALUES ('304', '河津市', '河津', '291', null, '中国,山西省,运城市,河津市', '3', '43300', '0359', '140882', 'Hejin', '110.7116000', '35.5947800');
INSERT INTO `sys_cn_area` VALUES ('305', '忻州市', '忻州', '221', null, '中国,山西省,忻州市', '2', '34000', '0350', '140900', 'Xinzhou', '112.7335380', '38.4176900');
INSERT INTO `sys_cn_area` VALUES ('306', '忻府区', '忻府', '305', null, '中国,山西省,忻州市,忻府区', '3', '34000', '0350', '140902', 'Xinfu', '112.7460300', '38.4041400');
INSERT INTO `sys_cn_area` VALUES ('307', '定襄县', '定襄', '305', null, '中国,山西省,忻州市,定襄县', '3', '35400', '0350', '140921', 'Dingxiang', '112.9573300', '38.4738700');
INSERT INTO `sys_cn_area` VALUES ('308', '五台县', '五台', '305', null, '中国,山西省,忻州市,五台县', '3', '35500', '0350', '140922', 'Wutai', '113.2525600', '38.7277400');
INSERT INTO `sys_cn_area` VALUES ('309', '代县', '代县', '305', null, '中国,山西省,忻州市,代县', '3', '34200', '0350', '140923', 'Daixian', '112.9591300', '39.0671700');
INSERT INTO `sys_cn_area` VALUES ('310', '繁峙县', '繁峙', '305', null, '中国,山西省,忻州市,繁峙县', '3', '34300', '0350', '140924', 'Fanshi', '113.2630300', '39.1888600');
INSERT INTO `sys_cn_area` VALUES ('311', '宁武县', '宁武', '305', null, '中国,山西省,忻州市,宁武县', '3', '36700', '0350', '140925', 'Ningwu', '112.3042300', '39.0021100');
INSERT INTO `sys_cn_area` VALUES ('312', '静乐县', '静乐', '305', null, '中国,山西省,忻州市,静乐县', '3', '35100', '0350', '140926', 'Jingle', '111.9415800', '38.3602000');
INSERT INTO `sys_cn_area` VALUES ('313', '神池县', '神池', '305', null, '中国,山西省,忻州市,神池县', '3', '36100', '0350', '140927', 'Shenchi', '112.2054100', '39.0900000');
INSERT INTO `sys_cn_area` VALUES ('314', '五寨县', '五寨', '305', null, '中国,山西省,忻州市,五寨县', '3', '36200', '0350', '140928', 'Wuzhai', '111.8489000', '38.9075700');
INSERT INTO `sys_cn_area` VALUES ('315', '岢岚县', '岢岚', '305', null, '中国,山西省,忻州市,岢岚县', '3', '36300', '0350', '140929', 'Kelan', '111.5738800', '38.7045200');
INSERT INTO `sys_cn_area` VALUES ('316', '河曲县', '河曲', '305', null, '中国,山西省,忻州市,河曲县', '3', '36500', '0350', '140930', 'Hequ', '111.1382100', '39.3843900');
INSERT INTO `sys_cn_area` VALUES ('317', '保德县', '保德', '305', null, '中国,山西省,忻州市,保德县', '3', '36600', '0350', '140931', 'Baode', '111.0865600', '39.0224800');
INSERT INTO `sys_cn_area` VALUES ('318', '偏关县', '偏关', '305', null, '中国,山西省,忻州市,偏关县', '3', '36400', '0350', '140932', 'Pianguan', '111.5086300', '39.4360900');
INSERT INTO `sys_cn_area` VALUES ('319', '原平市', '原平', '305', null, '中国,山西省,忻州市,原平市', '3', '34100', '0350', '140981', 'Yuanping', '112.7058400', '38.7318100');
INSERT INTO `sys_cn_area` VALUES ('320', '临汾市', '临汾', '221', null, '中国,山西省,临汾市', '2', '41000', '0357', '141000', 'Linfen', '111.5179730', '36.0841500');
INSERT INTO `sys_cn_area` VALUES ('321', '尧都区', '尧都', '320', null, '中国,山西省,临汾市,尧都区', '3', '41000', '0357', '141002', 'Yaodu', '111.5787000', '36.0829800');
INSERT INTO `sys_cn_area` VALUES ('322', '曲沃县', '曲沃', '320', null, '中国,山西省,临汾市,曲沃县', '3', '43400', '0357', '141021', 'Quwo', '111.4752500', '35.6411900');
INSERT INTO `sys_cn_area` VALUES ('323', '翼城县', '翼城', '320', null, '中国,山西省,临汾市,翼城县', '3', '43500', '0357', '141022', 'Yicheng', '111.7181000', '35.7388100');
INSERT INTO `sys_cn_area` VALUES ('324', '襄汾县', '襄汾', '320', null, '中国,山西省,临汾市,襄汾县', '3', '41500', '0357', '141023', 'Xiangfen', '111.4420400', '35.8771100');
INSERT INTO `sys_cn_area` VALUES ('325', '洪洞县', '洪洞', '320', null, '中国,山西省,临汾市,洪洞县', '3', '41600', '0357', '141024', 'Hongtong', '111.6750100', '36.2542500');
INSERT INTO `sys_cn_area` VALUES ('326', '古县', '古县', '320', null, '中国,山西省,临汾市,古县', '3', '42400', '0357', '141025', 'Guxian', '111.9204100', '36.2668800');
INSERT INTO `sys_cn_area` VALUES ('327', '安泽县', '安泽', '320', null, '中国,山西省,临汾市,安泽县', '3', '42500', '0357', '141026', 'Anze', '112.2498100', '36.1480300');
INSERT INTO `sys_cn_area` VALUES ('328', '浮山县', '浮山', '320', null, '中国,山西省,临汾市,浮山县', '3', '42600', '0357', '141027', 'Fushan', '111.8474400', '35.9685400');
INSERT INTO `sys_cn_area` VALUES ('329', '吉县', '吉县', '320', null, '中国,山西省,临汾市,吉县', '3', '42200', '0357', '141028', 'Jixian', '110.6814800', '36.0987300');
INSERT INTO `sys_cn_area` VALUES ('330', '乡宁县', '乡宁', '320', null, '中国,山西省,临汾市,乡宁县', '3', '42100', '0357', '141029', 'Xiangning', '110.8465200', '35.9707200');
INSERT INTO `sys_cn_area` VALUES ('331', '大宁县', '大宁', '320', null, '中国,山西省,临汾市,大宁县', '3', '42300', '0357', '141030', 'Daning', '110.7521600', '36.4662400');
INSERT INTO `sys_cn_area` VALUES ('332', '隰县', '隰县', '320', null, '中国,山西省,临汾市,隰县', '3', '41300', '0357', '141031', 'Xixian', '110.9388100', '36.6925800');
INSERT INTO `sys_cn_area` VALUES ('333', '永和县', '永和', '320', null, '中国,山西省,临汾市,永和县', '3', '41400', '0357', '141032', 'Yonghe', '110.6316800', '36.7584000');
INSERT INTO `sys_cn_area` VALUES ('334', '蒲县', '蒲县', '320', null, '中国,山西省,临汾市,蒲县', '3', '41200', '0357', '141033', 'Puxian', '111.0967400', '36.4124300');
INSERT INTO `sys_cn_area` VALUES ('335', '汾西县', '汾西', '320', null, '中国,山西省,临汾市,汾西县', '3', '31500', '0357', '141034', 'Fenxi', '111.5681100', '36.6506300');
INSERT INTO `sys_cn_area` VALUES ('336', '侯马市', '侯马', '320', null, '中国,山西省,临汾市,侯马市', '3', '43000', '0357', '141081', 'Houma', '111.3720700', '35.6190300');
INSERT INTO `sys_cn_area` VALUES ('337', '霍州市', '霍州', '320', null, '中国,山西省,临汾市,霍州市', '3', '31400', '0357', '141082', 'Huozhou', '111.7550000', '36.5638000');
INSERT INTO `sys_cn_area` VALUES ('338', '吕梁市', '吕梁', '221', null, '中国,山西省,吕梁市', '2', '33000', '0358', '141100', 'Lvliang', '111.1343350', '37.5243660');
INSERT INTO `sys_cn_area` VALUES ('339', '离石区', '离石', '338', null, '中国,山西省,吕梁市,离石区', '3', '33000', '0358', '141102', 'Lishi', '111.1505900', '37.5177000');
INSERT INTO `sys_cn_area` VALUES ('340', '文水县', '文水', '338', null, '中国,山西省,吕梁市,文水县', '3', '32100', '0358', '141121', 'Wenshui', '112.0282900', '37.4384100');
INSERT INTO `sys_cn_area` VALUES ('341', '交城县', '交城', '338', null, '中国,山西省,吕梁市,交城县', '3', '30500', '0358', '141122', 'Jiaocheng', '112.1585000', '37.5512000');
INSERT INTO `sys_cn_area` VALUES ('342', '兴县', '兴县', '338', null, '中国,山西省,吕梁市,兴县', '3', '33600', '0358', '141123', 'Xingxian', '111.1269200', '38.4632100');
INSERT INTO `sys_cn_area` VALUES ('343', '临县', '临县', '338', null, '中国,山西省,吕梁市,临县', '3', '33200', '0358', '141124', 'Linxian', '110.9928200', '37.9527100');
INSERT INTO `sys_cn_area` VALUES ('344', '柳林县', '柳林', '338', null, '中国,山西省,吕梁市,柳林县', '3', '33300', '0358', '141125', 'Liulin', '110.8892200', '37.4293200');
INSERT INTO `sys_cn_area` VALUES ('345', '石楼县', '石楼', '338', null, '中国,山西省,吕梁市,石楼县', '3', '32500', '0358', '141126', 'Shilou', '110.8352000', '36.9973100');
INSERT INTO `sys_cn_area` VALUES ('346', '岚县', '岚县', '338', null, '中国,山西省,吕梁市,岚县', '3', '33500', '0358', '141127', 'Lanxian', '111.6762700', '38.2787400');
INSERT INTO `sys_cn_area` VALUES ('347', '方山县', '方山', '338', null, '中国,山西省,吕梁市,方山县', '3', '33100', '0358', '141128', 'Fangshan', '111.2401100', '37.8897900');
INSERT INTO `sys_cn_area` VALUES ('348', '中阳县', '中阳', '338', null, '中国,山西省,吕梁市,中阳县', '3', '33400', '0358', '141129', 'Zhongyang', '111.1795000', '37.3571500');
INSERT INTO `sys_cn_area` VALUES ('349', '交口县', '交口', '338', null, '中国,山西省,吕梁市,交口县', '3', '32400', '0358', '141130', 'Jiaokou', '111.1810300', '36.9821300');
INSERT INTO `sys_cn_area` VALUES ('350', '孝义市', '孝义', '338', null, '中国,山西省,吕梁市,孝义市', '3', '32300', '0358', '141181', 'Xiaoyi', '111.7736200', '37.1441400');
INSERT INTO `sys_cn_area` VALUES ('351', '汾阳市', '汾阳', '338', null, '中国,山西省,吕梁市,汾阳市', '3', '32200', '0358', '141182', 'Fenyang', '111.7882000', '37.2660500');
INSERT INTO `sys_cn_area` VALUES ('352', '内蒙古自治区', '内蒙古', '1', null, '中国,内蒙古自治区', '1', null, '', '150000', 'Inner Mongolia', '111.6708010', '40.8183110');
INSERT INTO `sys_cn_area` VALUES ('353', '呼和浩特市', '呼和浩特', '352', null, '中国,内蒙古自治区,呼和浩特市', '2', '10000', '0471', '150100', 'Hohhot', '111.6708010', '40.8183110');
INSERT INTO `sys_cn_area` VALUES ('354', '新城区', '新城', '353', null, '中国,内蒙古自治区,呼和浩特市,新城区', '3', '10050', '0471', '150102', 'Xincheng', '111.6655400', '40.8582800');
INSERT INTO `sys_cn_area` VALUES ('355', '回民区', '回民', '353', null, '中国,内蒙古自治区,呼和浩特市,回民区', '3', '10030', '0471', '150103', 'Huimin', '111.6240200', '40.8082700');
INSERT INTO `sys_cn_area` VALUES ('356', '玉泉区', '玉泉', '353', null, '中国,内蒙古自治区,呼和浩特市,玉泉区', '3', '10020', '0471', '150104', 'Yuquan', '111.6745600', '40.7522700');
INSERT INTO `sys_cn_area` VALUES ('357', '赛罕区', '赛罕', '353', null, '中国,内蒙古自治区,呼和浩特市,赛罕区', '3', '10020', '0471', '150105', 'Saihan', '111.7022400', '40.7920700');
INSERT INTO `sys_cn_area` VALUES ('358', '土默特左旗', '土默特左旗', '353', null, '中国,内蒙古自治区,呼和浩特市,土默特左旗', '3', '10100', '0471', '150121', 'Tumotezuoqi', '111.1489800', '40.7222900');
INSERT INTO `sys_cn_area` VALUES ('359', '托克托县', '托克托', '353', null, '中国,内蒙古自治区,呼和浩特市,托克托县', '3', '10200', '0471', '150122', 'Tuoketuo', '111.1910100', '40.2749200');
INSERT INTO `sys_cn_area` VALUES ('360', '和林格尔县', '和林格尔', '353', null, '中国,内蒙古自治区,呼和浩特市,和林格尔县', '3', '11500', '0471', '150123', 'Helingeer', '111.8220500', '40.3789200');
INSERT INTO `sys_cn_area` VALUES ('361', '清水河县', '清水河', '353', null, '中国,内蒙古自治区,呼和浩特市,清水河县', '3', '11600', '0471', '150124', 'Qingshuihe', '111.6831600', '39.9097000');
INSERT INTO `sys_cn_area` VALUES ('362', '武川县', '武川', '353', null, '中国,内蒙古自治区,呼和浩特市,武川县', '3', '11700', '0471', '150125', 'Wuchuan', '111.4578500', '41.0928900');
INSERT INTO `sys_cn_area` VALUES ('363', '包头市', '包头', '352', null, '中国,内蒙古自治区,包头市', '2', '14025', '0472', '150200', 'Baotou', '109.8404050', '40.6581680');
INSERT INTO `sys_cn_area` VALUES ('364', '东河区', '东河', '363', null, '中国,内蒙古自治区,包头市,东河区', '3', '14040', '0472', '150202', 'Donghe', '110.0462000', '40.5823700');
INSERT INTO `sys_cn_area` VALUES ('365', '昆都仑区', '昆都仑', '363', null, '中国,内蒙古自治区,包头市,昆都仑区', '3', '14010', '0472', '150203', 'Kundulun', '109.8386200', '40.6417500');
INSERT INTO `sys_cn_area` VALUES ('366', '青山区', '青山', '363', null, '中国,内蒙古自治区,包头市,青山区', '3', '14030', '0472', '150204', 'Qingshan', '109.9013100', '40.6432900');
INSERT INTO `sys_cn_area` VALUES ('367', '石拐区', '石拐', '363', null, '中国,内蒙古自治区,包头市,石拐区', '3', '14070', '0472', '150205', 'Shiguai', '110.2732200', '40.6729700');
INSERT INTO `sys_cn_area` VALUES ('368', '白云鄂博矿区', '白云鄂博矿区', '363', null, '中国,内蒙古自治区,包头市,白云鄂博矿区', '3', '14080', '0472', '150206', 'Baiyunebokuangqu', '109.9736700', '41.7696800');
INSERT INTO `sys_cn_area` VALUES ('369', '九原区', '九原', '363', null, '中国,内蒙古自治区,包头市,九原区', '3', '14060', '0472', '150207', 'Jiuyuan', '109.9649600', '40.6055400');
INSERT INTO `sys_cn_area` VALUES ('370', '土默特右旗', '土默特右旗', '363', null, '中国,内蒙古自治区,包头市,土默特右旗', '3', '14100', '0472', '150221', 'Tumoteyouqi', '110.5241700', '40.5688000');
INSERT INTO `sys_cn_area` VALUES ('371', '固阳县', '固阳', '363', null, '中国,内蒙古自治区,包头市,固阳县', '3', '14200', '0472', '150222', 'Guyang', '110.0637200', '41.0185100');
INSERT INTO `sys_cn_area` VALUES ('372', '达尔罕茂明安联合旗', '达茂旗', '363', null, '中国,内蒙古自治区,包头市,达尔罕茂明安联合旗', '3', '14500', '0472', '150223', 'Damaoqi', '110.4325800', '41.6987500');
INSERT INTO `sys_cn_area` VALUES ('373', '乌海市', '乌海', '352', null, '中国,内蒙古自治区,乌海市', '2', '16000', '0473', '150300', 'Wuhai', '106.8255630', '39.6737340');
INSERT INTO `sys_cn_area` VALUES ('374', '海勃湾区', '海勃湾', '373', null, '中国,内蒙古自治区,乌海市,海勃湾区', '3', '16000', '0473', '150302', 'Haibowan', '106.8222000', '39.6695500');
INSERT INTO `sys_cn_area` VALUES ('375', '海南区', '海南', '373', null, '中国,内蒙古自治区,乌海市,海南区', '3', '16030', '0473', '150303', 'Hainan', '106.8865600', '39.4412800');
INSERT INTO `sys_cn_area` VALUES ('376', '乌达区', '乌达', '373', null, '中国,内蒙古自治区,乌海市,乌达区', '3', '16040', '0473', '150304', 'Wuda', '106.7272300', '39.5050000');
INSERT INTO `sys_cn_area` VALUES ('377', '赤峰市', '赤峰', '352', null, '中国,内蒙古自治区,赤峰市', '2', '24000', '0476', '150400', 'Chifeng', '118.9568060', '42.2753170');
INSERT INTO `sys_cn_area` VALUES ('378', '红山区', '红山', '377', null, '中国,内蒙古自治区,赤峰市,红山区', '3', '24020', '0476', '150402', 'Hongshan', '118.9575500', '42.2431200');
INSERT INTO `sys_cn_area` VALUES ('379', '元宝山区', '元宝山', '377', null, '中国,内蒙古自治区,赤峰市,元宝山区', '3', '24076', '0476', '150403', 'Yuanbaoshan', '119.2892100', '42.0400500');
INSERT INTO `sys_cn_area` VALUES ('380', '松山区', '松山', '377', null, '中国,内蒙古自治区,赤峰市,松山区', '3', '24005', '0476', '150404', 'Songshan', '118.9328000', '42.2861300');
INSERT INTO `sys_cn_area` VALUES ('381', '阿鲁科尔沁旗', '阿鲁科尔沁旗', '377', null, '中国,内蒙古自治区,赤峰市,阿鲁科尔沁旗', '3', '25550', '0476', '150421', 'Alukeerqinqi', '120.0652700', '43.8798800');
INSERT INTO `sys_cn_area` VALUES ('382', '巴林左旗', '巴林左旗', '377', null, '中国,内蒙古自治区,赤峰市,巴林左旗', '3', '25450', '0476', '150422', 'Balinzuoqi', '119.3801200', '43.9703100');
INSERT INTO `sys_cn_area` VALUES ('383', '巴林右旗', '巴林右旗', '377', null, '中国,内蒙古自治区,赤峰市,巴林右旗', '3', '25150', '0476', '150423', 'Balinyouqi', '118.6646100', '43.5338700');
INSERT INTO `sys_cn_area` VALUES ('384', '林西县', '林西', '377', null, '中国,内蒙古自治区,赤峰市,林西县', '3', '25250', '0476', '150424', 'Linxi', '118.0473300', '43.6116500');
INSERT INTO `sys_cn_area` VALUES ('385', '克什克腾旗', '克什克腾旗', '377', null, '中国,内蒙古自治区,赤峰市,克什克腾旗', '3', '25350', '0476', '150425', 'Keshiketengqi', '117.5456200', '43.2650100');
INSERT INTO `sys_cn_area` VALUES ('386', '翁牛特旗', '翁牛特旗', '377', null, '中国,内蒙古自治区,赤峰市,翁牛特旗', '3', '24500', '0476', '150426', 'Wengniuteqi', '119.0304200', '42.9314700');
INSERT INTO `sys_cn_area` VALUES ('387', '喀喇沁旗', '喀喇沁旗', '377', null, '中国,内蒙古自治区,赤峰市,喀喇沁旗', '3', '24400', '0476', '150428', 'Kalaqinqi', '118.7014400', '41.9291700');
INSERT INTO `sys_cn_area` VALUES ('388', '宁城县', '宁城', '377', null, '中国,内蒙古自治区,赤峰市,宁城县', '3', '24200', '0476', '150429', 'Ningcheng', '119.3437500', '41.5966100');
INSERT INTO `sys_cn_area` VALUES ('389', '敖汉旗', '敖汉旗', '377', null, '中国,内蒙古自治区,赤峰市,敖汉旗', '3', '24300', '0476', '150430', 'Aohanqi', '119.9216300', '42.2907100');
INSERT INTO `sys_cn_area` VALUES ('390', '通辽市', '通辽', '352', null, '中国,内蒙古自治区,通辽市', '2', '28000', '0475', '150500', 'Tongliao', '122.2631190', '43.6174290');
INSERT INTO `sys_cn_area` VALUES ('391', '科尔沁区', '科尔沁', '390', null, '中国,内蒙古自治区,通辽市,科尔沁区', '3', '28000', '0475', '150502', 'Keerqin', '122.2557300', '43.6225700');
INSERT INTO `sys_cn_area` VALUES ('392', '科尔沁左翼中旗', '科尔沁左翼中旗', '390', null, '中国,内蒙古自治区,通辽市,科尔沁左翼中旗', '3', '29300', '0475', '150521', 'Keerqinzuoyizhongqi', '123.3191200', '44.1301400');
INSERT INTO `sys_cn_area` VALUES ('393', '科尔沁左翼后旗', '科尔沁左翼后旗', '390', null, '中国,内蒙古自治区,通辽市,科尔沁左翼后旗', '3', '28100', '0475', '150522', 'Keerqinzuoyihouqi', '122.3574500', '42.9489700');
INSERT INTO `sys_cn_area` VALUES ('394', '开鲁县', '开鲁', '390', null, '中国,内蒙古自治区,通辽市,开鲁县', '3', '28400', '0475', '150523', 'Kailu', '121.3188400', '43.6000300');
INSERT INTO `sys_cn_area` VALUES ('395', '库伦旗', '库伦旗', '390', null, '中国,内蒙古自治区,通辽市,库伦旗', '3', '28200', '0475', '150524', 'Kulunqi', '121.7760000', '42.7299800');
INSERT INTO `sys_cn_area` VALUES ('396', '奈曼旗', '奈曼旗', '390', null, '中国,内蒙古自治区,通辽市,奈曼旗', '3', '28300', '0475', '150525', 'Naimanqi', '120.6634800', '42.8452700');
INSERT INTO `sys_cn_area` VALUES ('397', '扎鲁特旗', '扎鲁特旗', '390', null, '中国,内蒙古自治区,通辽市,扎鲁特旗', '3', '29100', '0475', '150526', 'Zhaluteqi', '120.9150700', '44.5559200');
INSERT INTO `sys_cn_area` VALUES ('398', '霍林郭勒市', '霍林郭勒', '390', null, '中国,内蒙古自治区,通辽市,霍林郭勒市', '3', '29200', '0475', '150581', 'Huolinguole', '119.6542900', '45.5345400');
INSERT INTO `sys_cn_area` VALUES ('399', '鄂尔多斯市', '鄂尔多斯', '352', null, '中国,内蒙古自治区,鄂尔多斯市', '2', '17004', '0477', '150600', 'Ordos', '109.9902900', '39.8171790');
INSERT INTO `sys_cn_area` VALUES ('400', '东胜区', '东胜', '399', null, '中国,内蒙古自治区,鄂尔多斯市,东胜区', '3', '17000', '0477', '150602', 'Dongsheng', '109.9628900', '39.8223600');
INSERT INTO `sys_cn_area` VALUES ('401', '达拉特旗', '达拉特旗', '399', null, '中国,内蒙古自治区,鄂尔多斯市,达拉特旗', '3', '14300', '0477', '150621', 'Dalateqi', '110.0331700', '40.4001000');
INSERT INTO `sys_cn_area` VALUES ('402', '准格尔旗', '准格尔旗', '399', null, '中国,内蒙古自治区,鄂尔多斯市,准格尔旗', '3', '17100', '0477', '150622', 'Zhungeerqi', '111.2364500', '39.8678300');
INSERT INTO `sys_cn_area` VALUES ('403', '鄂托克前旗', '鄂托克前旗', '399', null, '中国,内蒙古自治区,鄂尔多斯市,鄂托克前旗', '3', '16200', '0477', '150623', 'Etuokeqianqi', '107.4840300', '38.1839600');
INSERT INTO `sys_cn_area` VALUES ('404', '鄂托克旗', '鄂托克旗', '399', null, '中国,内蒙古自治区,鄂尔多斯市,鄂托克旗', '3', '16100', '0477', '150624', 'Etuokeqi', '107.9822600', '39.0945600');
INSERT INTO `sys_cn_area` VALUES ('405', '杭锦旗', '杭锦旗', '399', null, '中国,内蒙古自治区,鄂尔多斯市,杭锦旗', '3', '17400', '0477', '150625', 'Hangjinqi', '108.7293400', '39.8402300');
INSERT INTO `sys_cn_area` VALUES ('406', '乌审旗', '乌审旗', '399', null, '中国,内蒙古自治区,鄂尔多斯市,乌审旗', '3', '17300', '0477', '150626', 'Wushenqi', '108.8461000', '38.5909200');
INSERT INTO `sys_cn_area` VALUES ('407', '伊金霍洛旗', '伊金霍洛旗', '399', null, '中国,内蒙古自治区,鄂尔多斯市,伊金霍洛旗', '3', '17200', '0477', '150627', 'Yijinhuoluoqi', '109.7490800', '39.5739300');
INSERT INTO `sys_cn_area` VALUES ('408', '呼伦贝尔市', '呼伦贝尔', '352', null, '中国,内蒙古自治区,呼伦贝尔市', '2', '21008', '0470', '150700', 'Hulunber', '119.7581680', '49.2153330');
INSERT INTO `sys_cn_area` VALUES ('409', '海拉尔区', '海拉尔', '408', null, '中国,内蒙古自治区,呼伦贝尔市,海拉尔区', '3', '21000', '0470', '150702', 'Hailaer', '119.7364000', '49.2122000');
INSERT INTO `sys_cn_area` VALUES ('410', '扎赉诺尔区', '扎赉诺尔', '408', null, '中国,内蒙古自治区,呼伦贝尔市,扎赉诺尔区', '3', '21410', '0470', '150703', 'Zhalainuoer', '117.7927020', '49.4869430');
INSERT INTO `sys_cn_area` VALUES ('411', '阿荣旗', '阿荣旗', '408', null, '中国,内蒙古自治区,呼伦贝尔市,阿荣旗', '3', '162750', '0470', '150721', 'Arongqi', '123.4594100', '48.1258100');
INSERT INTO `sys_cn_area` VALUES ('412', '莫力达瓦达斡尔族自治旗', '莫旗', '408', null, '中国,内蒙古自治区,呼伦贝尔市,莫力达瓦达斡尔族自治旗', '3', '162850', '0470', '150722', 'Moqi', '124.5149800', '48.4805500');
INSERT INTO `sys_cn_area` VALUES ('413', '鄂伦春自治旗', '鄂伦春', '408', null, '中国,内蒙古自治区,呼伦贝尔市,鄂伦春自治旗', '3', '165450', '0470', '150723', 'Elunchun', '123.7260400', '50.5977700');
INSERT INTO `sys_cn_area` VALUES ('414', '鄂温克族自治旗', '鄂温', '408', null, '中国,内蒙古自治区,呼伦贝尔市,鄂温克族自治旗', '3', '21100', '0470', '150724', 'Ewen', '119.7565000', '49.1428400');
INSERT INTO `sys_cn_area` VALUES ('415', '陈巴尔虎旗', '陈巴尔虎旗', '408', null, '中国,内蒙古自治区,呼伦贝尔市,陈巴尔虎旗', '3', '21500', '0470', '150725', 'Chenbaerhuqi', '119.4243400', '49.3268400');
INSERT INTO `sys_cn_area` VALUES ('416', '新巴尔虎左旗', '新巴尔虎左旗', '408', null, '中国,内蒙古自治区,呼伦贝尔市,新巴尔虎左旗', '3', '21200', '0470', '150726', 'Xinbaerhuzuoqi', '118.2698900', '48.2184200');
INSERT INTO `sys_cn_area` VALUES ('417', '新巴尔虎右旗', '新巴尔虎右旗', '408', null, '中国,内蒙古自治区,呼伦贝尔市,新巴尔虎右旗', '3', '21300', '0470', '150727', 'Xinbaerhuyouqi', '116.8236600', '48.6647300');
INSERT INTO `sys_cn_area` VALUES ('418', '满洲里市', '满洲里', '408', null, '中国,内蒙古自治区,呼伦贝尔市,满洲里市', '3', '21400', '0470', '150781', 'Manzhouli', '117.4794600', '49.5827200');
INSERT INTO `sys_cn_area` VALUES ('419', '牙克石市', '牙克石', '408', null, '中国,内蒙古自治区,呼伦贝尔市,牙克石市', '3', '22150', '0470', '150782', 'Yakeshi', '120.7117000', '49.2856000');
INSERT INTO `sys_cn_area` VALUES ('420', '扎兰屯市', '扎兰屯', '408', null, '中国,内蒙古自治区,呼伦贝尔市,扎兰屯市', '3', '162650', '0470', '150783', 'Zhalantun', '122.7375700', '48.0136300');
INSERT INTO `sys_cn_area` VALUES ('421', '额尔古纳市', '额尔古纳', '408', null, '中国,内蒙古自治区,呼伦贝尔市,额尔古纳市', '3', '22250', '0470', '150784', 'Eerguna', '120.1909400', '50.2424900');
INSERT INTO `sys_cn_area` VALUES ('422', '根河市', '根河', '408', null, '中国,内蒙古自治区,呼伦贝尔市,根河市', '3', '22350', '0470', '150785', 'Genhe', '121.5219700', '50.7799600');
INSERT INTO `sys_cn_area` VALUES ('423', '巴彦淖尔市', '巴彦淖尔', '352', null, '中国,内蒙古自治区,巴彦淖尔市', '2', '15001', '0478', '150800', 'Bayan Nur', '107.4169590', '40.7574020');
INSERT INTO `sys_cn_area` VALUES ('424', '临河区', '临河', '423', null, '中国,内蒙古自治区,巴彦淖尔市,临河区', '3', '15001', '0478', '150802', 'Linhe', '107.4266800', '40.7582700');
INSERT INTO `sys_cn_area` VALUES ('425', '五原县', '五原', '423', null, '中国,内蒙古自治区,巴彦淖尔市,五原县', '3', '15100', '0478', '150821', 'Wuyuan', '108.2691600', '41.0963100');
INSERT INTO `sys_cn_area` VALUES ('426', '磴口县', '磴口', '423', null, '中国,内蒙古自治区,巴彦淖尔市,磴口县', '3', '15200', '0478', '150822', 'Dengkou', '107.0093600', '40.3306200');
INSERT INTO `sys_cn_area` VALUES ('427', '乌拉特前旗', '乌拉特前旗', '423', null, '中国,内蒙古自治区,巴彦淖尔市,乌拉特前旗', '3', '14400', '0478', '150823', 'Wulateqianqi', '108.6521900', '40.7364900');
INSERT INTO `sys_cn_area` VALUES ('428', '乌拉特中旗', '乌拉特中旗', '423', null, '中国,内蒙古自治区,巴彦淖尔市,乌拉特中旗', '3', '15300', '0478', '150824', 'Wulatezhongqi', '108.5258700', '41.5678900');
INSERT INTO `sys_cn_area` VALUES ('429', '乌拉特后旗', '乌拉特后旗', '423', null, '中国,内蒙古自治区,巴彦淖尔市,乌拉特后旗', '3', '15500', '0478', '150825', 'Wulatehouqi', '106.9897100', '41.4315100');
INSERT INTO `sys_cn_area` VALUES ('430', '杭锦后旗', '杭锦后旗', '423', null, '中国,内蒙古自治区,巴彦淖尔市,杭锦后旗', '3', '15400', '0478', '150826', 'Hangjinhouqi', '107.1513300', '40.8862700');
INSERT INTO `sys_cn_area` VALUES ('431', '乌兰察布市', '乌兰察布', '352', null, '中国,内蒙古自治区,乌兰察布市', '2', '12000', '0474', '150900', 'Ulanqab', '113.1145430', '41.0341260');
INSERT INTO `sys_cn_area` VALUES ('432', '集宁区', '集宁', '431', null, '中国,内蒙古自治区,乌兰察布市,集宁区', '3', '12000', '0474', '150902', 'Jining', '113.1145200', '41.0353000');
INSERT INTO `sys_cn_area` VALUES ('433', '卓资县', '卓资', '431', null, '中国,内蒙古自治区,乌兰察布市,卓资县', '3', '12300', '0474', '150921', 'Zhuozi', '112.5775700', '40.8941400');
INSERT INTO `sys_cn_area` VALUES ('434', '化德县', '化德', '431', null, '中国,内蒙古自治区,乌兰察布市,化德县', '3', '13350', '0474', '150922', 'Huade', '114.0107100', '41.9043300');
INSERT INTO `sys_cn_area` VALUES ('435', '商都县', '商都', '431', null, '中国,内蒙古自治区,乌兰察布市,商都县', '3', '13450', '0474', '150923', 'Shangdu', '113.5777200', '41.5621300');
INSERT INTO `sys_cn_area` VALUES ('436', '兴和县', '兴和', '431', null, '中国,内蒙古自治区,乌兰察布市,兴和县', '3', '13650', '0474', '150924', 'Xinghe', '113.8339500', '40.8718600');
INSERT INTO `sys_cn_area` VALUES ('437', '凉城县', '凉城', '431', null, '中国,内蒙古自治区,乌兰察布市,凉城县', '3', '13750', '0474', '150925', 'Liangcheng', '112.4956900', '40.5334600');
INSERT INTO `sys_cn_area` VALUES ('438', '察哈尔右翼前旗', '察右前旗', '431', null, '中国,内蒙古自治区,乌兰察布市,察哈尔右翼前旗', '3', '12200', '0474', '150926', 'Chayouqianqi', '113.2213100', '40.7788000');
INSERT INTO `sys_cn_area` VALUES ('439', '察哈尔右翼中旗', '察右中旗', '431', null, '中国,内蒙古自治区,乌兰察布市,察哈尔右翼中旗', '3', '13550', '0474', '150927', 'Chayouzhongqi', '112.6353700', '41.2774200');
INSERT INTO `sys_cn_area` VALUES ('440', '察哈尔右翼后旗', '察右后旗', '431', null, '中国,内蒙古自治区,乌兰察布市,察哈尔右翼后旗', '3', '12400', '0474', '150928', 'Chayouhouqi', '113.1921600', '41.4355400');
INSERT INTO `sys_cn_area` VALUES ('441', '四子王旗', '四子王旗', '431', null, '中国,内蒙古自治区,乌兰察布市,四子王旗', '3', '11800', '0474', '150929', 'Siziwangqi', '111.7065400', '41.5331200');
INSERT INTO `sys_cn_area` VALUES ('442', '丰镇市', '丰镇', '431', null, '中国,内蒙古自治区,乌兰察布市,丰镇市', '3', '12100', '0474', '150981', 'Fengzhen', '113.1098300', '40.4369000');
INSERT INTO `sys_cn_area` VALUES ('443', '兴安盟', '兴安盟', '352', null, '中国,内蒙古自治区,兴安盟', '2', '137401', '0482', '152200', 'Hinggan', '122.0703170', '46.0762680');
INSERT INTO `sys_cn_area` VALUES ('444', '乌兰浩特市', '乌兰浩特', '443', null, '中国,内蒙古自治区,兴安盟,乌兰浩特市', '3', '137401', '0482', '152201', 'Wulanhaote', '122.0637800', '46.0623500');
INSERT INTO `sys_cn_area` VALUES ('445', '阿尔山市', '阿尔山', '443', null, '中国,内蒙古自治区,兴安盟,阿尔山市', '3', '137800', '0482', '152202', 'Aershan', '119.9431700', '47.1771600');
INSERT INTO `sys_cn_area` VALUES ('446', '科尔沁右翼前旗', '科右前旗', '443', null, '中国,内蒙古自治区,兴安盟,科尔沁右翼前旗', '3', '137423', '0482', '152221', 'Keyouqianqi', '121.9526900', '46.0795000');
INSERT INTO `sys_cn_area` VALUES ('447', '科尔沁右翼中旗', '科右中旗', '443', null, '中国,内蒙古自治区,兴安盟,科尔沁右翼中旗', '3', '29400', '0482', '152222', 'Keyouzhongqi', '121.4680700', '45.0560500');
INSERT INTO `sys_cn_area` VALUES ('448', '扎赉特旗', '扎赉特旗', '443', null, '中国,内蒙古自治区,兴安盟,扎赉特旗', '3', '137600', '0482', '152223', 'Zhalaiteqi', '122.9122900', '46.7267000');
INSERT INTO `sys_cn_area` VALUES ('449', '突泉县', '突泉', '443', null, '中国,内蒙古自治区,兴安盟,突泉县', '3', '137500', '0482', '152224', 'Tuquan', '121.5939600', '45.3818700');
INSERT INTO `sys_cn_area` VALUES ('450', '锡林郭勒盟', '锡林郭勒盟', '352', null, '中国,内蒙古自治区,锡林郭勒盟', '2', '26000', '0479', '152500', 'Xilin Gol', '116.0909960', '43.9440180');
INSERT INTO `sys_cn_area` VALUES ('451', '二连浩特市', '二连浩特', '450', null, '中国,内蒙古自治区,锡林郭勒盟,二连浩特市', '3', '11100', '0479', '152501', 'Erlianhaote', '111.9829700', '43.6530300');
INSERT INTO `sys_cn_area` VALUES ('452', '锡林浩特市', '锡林浩特', '450', null, '中国,内蒙古自治区,锡林郭勒盟,锡林浩特市', '3', '26021', '0479', '152502', 'Xilinhaote', '116.0860300', '43.9334100');
INSERT INTO `sys_cn_area` VALUES ('453', '阿巴嘎旗', '阿巴嘎旗', '450', null, '中国,内蒙古自治区,锡林郭勒盟,阿巴嘎旗', '3', '11400', '0479', '152522', 'Abagaqi', '114.9682600', '44.0217400');
INSERT INTO `sys_cn_area` VALUES ('454', '苏尼特左旗', '苏尼特左旗', '450', null, '中国,内蒙古自治区,锡林郭勒盟,苏尼特左旗', '3', '11300', '0479', '152523', 'Sunitezuoqi', '113.6506000', '43.8568700');
INSERT INTO `sys_cn_area` VALUES ('455', '苏尼特右旗', '苏尼特右旗', '450', null, '中国,内蒙古自治区,锡林郭勒盟,苏尼特右旗', '3', '11200', '0479', '152524', 'Suniteyouqi', '112.6574100', '42.7469000');
INSERT INTO `sys_cn_area` VALUES ('456', '东乌珠穆沁旗', '东乌旗', '450', null, '中国,内蒙古自治区,锡林郭勒盟,东乌珠穆沁旗', '3', '26300', '0479', '152525', 'Dongwuqi', '116.9729300', '45.5110800');
INSERT INTO `sys_cn_area` VALUES ('457', '西乌珠穆沁旗', '西乌旗', '450', null, '中国,内蒙古自治区,锡林郭勒盟,西乌珠穆沁旗', '3', '26200', '0479', '152526', 'Xiwuqi', '117.6098300', '44.5962300');
INSERT INTO `sys_cn_area` VALUES ('458', '太仆寺旗', '太仆寺旗', '450', null, '中国,内蒙古自治区,锡林郭勒盟,太仆寺旗', '3', '27000', '0479', '152527', 'Taipusiqi', '115.2830200', '41.8772700');
INSERT INTO `sys_cn_area` VALUES ('459', '镶黄旗', '镶黄旗', '450', null, '中国,内蒙古自治区,锡林郭勒盟,镶黄旗', '3', '13250', '0479', '152528', 'Xianghuangqi', '113.8447200', '42.2392700');
INSERT INTO `sys_cn_area` VALUES ('460', '正镶白旗', '正镶白旗', '450', null, '中国,内蒙古自治区,锡林郭勒盟,正镶白旗', '3', '13800', '0479', '152529', 'Zhengxiangbaiqi', '115.0006700', '42.3071200');
INSERT INTO `sys_cn_area` VALUES ('461', '正蓝旗', '正蓝旗', '450', null, '中国,内蒙古自治区,锡林郭勒盟,正蓝旗', '3', '27200', '0479', '152530', 'Zhenglanqi', '116.0036300', '42.2522900');
INSERT INTO `sys_cn_area` VALUES ('462', '多伦县', '多伦', '450', null, '中国,内蒙古自治区,锡林郭勒盟,多伦县', '3', '27300', '0479', '152531', 'Duolun', '116.4856500', '42.2030000');
INSERT INTO `sys_cn_area` VALUES ('463', '阿拉善盟', '阿拉善盟', '352', null, '中国,内蒙古自治区,阿拉善盟', '2', '750306', '0483', '152900', 'Alxa', '105.7064220', '38.8448140');
INSERT INTO `sys_cn_area` VALUES ('464', '阿拉善左旗', '阿拉善左旗', '463', null, '中国,内蒙古自治区,阿拉善盟,阿拉善左旗', '3', '750306', '0483', '152921', 'Alashanzuoqi', '105.6753200', '38.8293000');
INSERT INTO `sys_cn_area` VALUES ('465', '阿拉善右旗', '阿拉善右旗', '463', null, '中国,内蒙古自治区,阿拉善盟,阿拉善右旗', '3', '737300', '0483', '152922', 'Alashanyouqi', '101.6670500', '39.2153300');
INSERT INTO `sys_cn_area` VALUES ('466', '额济纳旗', '额济纳旗', '463', null, '中国,内蒙古自治区,阿拉善盟,额济纳旗', '3', '735400', '0483', '152923', 'Ejinaqi', '101.0688700', '41.9675500');
INSERT INTO `sys_cn_area` VALUES ('467', '辽宁省', '辽宁', '1', null, '中国,辽宁省', '1', null, '', '210000', 'Liaoning', '123.4290960', '41.7967670');
INSERT INTO `sys_cn_area` VALUES ('468', '沈阳市', '沈阳', '467', null, '中国,辽宁省,沈阳市', '2', '110013', '024', '210100', 'Shenyang', '123.4290960', '41.7967670');
INSERT INTO `sys_cn_area` VALUES ('469', '和平区', '和平', '468', null, '中国,辽宁省,沈阳市,和平区', '3', '110001', '024', '210102', 'Heping', '123.4204000', '41.7899700');
INSERT INTO `sys_cn_area` VALUES ('470', '沈河区', '沈河', '468', null, '中国,辽宁省,沈阳市,沈河区', '3', '110011', '024', '210103', 'Shenhe', '123.4587100', '41.7962500');
INSERT INTO `sys_cn_area` VALUES ('471', '大东区', '大东', '468', null, '中国,辽宁省,沈阳市,大东区', '3', '110041', '024', '210104', 'Dadong', '123.4699700', '41.8053900');
INSERT INTO `sys_cn_area` VALUES ('472', '皇姑区', '皇姑', '468', null, '中国,辽宁省,沈阳市,皇姑区', '3', '110031', '024', '210105', 'Huanggu', '123.4252700', '41.8203500');
INSERT INTO `sys_cn_area` VALUES ('473', '铁西区', '铁西', '468', null, '中国,辽宁省,沈阳市,铁西区', '3', '110021', '024', '210106', 'Tiexi', '123.3767500', '41.8026900');
INSERT INTO `sys_cn_area` VALUES ('474', '苏家屯区', '苏家屯', '468', null, '中国,辽宁省,沈阳市,苏家屯区', '3', '110101', '024', '210111', 'Sujiatun', '123.3440500', '41.6647500');
INSERT INTO `sys_cn_area` VALUES ('475', '浑南区', '浑南', '468', null, '中国,辽宁省,沈阳市,浑南区', '3', '110015', '024', '210112', 'Hunnan', '123.4577070', '41.7194500');
INSERT INTO `sys_cn_area` VALUES ('476', '沈北新区', '沈北新区', '468', null, '中国,辽宁省,沈阳市,沈北新区', '3', '110121', '024', '210113', 'Shenbeixinqu', '123.5265800', '42.0529700');
INSERT INTO `sys_cn_area` VALUES ('477', '于洪区', '于洪', '468', null, '中国,辽宁省,沈阳市,于洪区', '3', '110141', '024', '210114', 'Yuhong', '123.3080700', '41.7940000');
INSERT INTO `sys_cn_area` VALUES ('478', '辽中县', '辽中', '468', null, '中国,辽宁省,沈阳市,辽中县', '3', '110200', '024', '210122', 'Liaozhong', '122.7265900', '41.5130200');
INSERT INTO `sys_cn_area` VALUES ('479', '康平县', '康平', '468', null, '中国,辽宁省,沈阳市,康平县', '3', '110500', '024', '210123', 'Kangping', '123.3544600', '42.7508100');
INSERT INTO `sys_cn_area` VALUES ('480', '法库县', '法库', '468', null, '中国,辽宁省,沈阳市,法库县', '3', '110400', '024', '210124', 'Faku', '123.4121400', '42.5060800');
INSERT INTO `sys_cn_area` VALUES ('481', '新民市', '新民', '468', null, '中国,辽宁省,沈阳市,新民市', '3', '110300', '024', '210181', 'Xinmin', '122.8286700', '41.9984700');
INSERT INTO `sys_cn_area` VALUES ('482', '大连市', '大连', '467', null, '中国,辽宁省,大连市', '2', '116011', '0411', '210200', 'Dalian', '121.6186220', '38.9145900');
INSERT INTO `sys_cn_area` VALUES ('483', '中山区', '中山', '482', null, '中国,辽宁省,大连市,中山区', '3', '116001', '0411', '210202', 'Zhongshan', '121.6446500', '38.9185900');
INSERT INTO `sys_cn_area` VALUES ('484', '西岗区', '西岗', '482', null, '中国,辽宁省,大连市,西岗区', '3', '116011', '0411', '210203', 'Xigang', '121.6123800', '38.9146900');
INSERT INTO `sys_cn_area` VALUES ('485', '沙河口区', '沙河口', '482', null, '中国,辽宁省,大连市,沙河口区', '3', '116021', '0411', '210204', 'Shahekou', '121.5801700', '38.9053600');
INSERT INTO `sys_cn_area` VALUES ('486', '甘井子区', '甘井子', '482', null, '中国,辽宁省,大连市,甘井子区', '3', '116033', '0411', '210211', 'Ganjingzi', '121.5656700', '38.9501700');
INSERT INTO `sys_cn_area` VALUES ('487', '旅顺口区', '旅顺口', '482', null, '中国,辽宁省,大连市,旅顺口区', '3', '116041', '0411', '210212', 'Lvshunkou', '121.2620200', '38.8512500');
INSERT INTO `sys_cn_area` VALUES ('488', '金州区', '金州', '482', null, '中国,辽宁省,大连市,金州区', '3', '116100', '0411', '210213', 'Jinzhou', '121.7189300', '39.1004000');
INSERT INTO `sys_cn_area` VALUES ('489', '长海县', '长海', '482', null, '中国,辽宁省,大连市,长海县', '3', '116500', '0411', '210224', 'Changhai', '122.5885900', '39.2727400');
INSERT INTO `sys_cn_area` VALUES ('490', '瓦房店市', '瓦房店', '482', null, '中国,辽宁省,大连市,瓦房店市', '3', '116300', '0411', '210281', 'Wafangdian', '121.9810400', '39.6284300');
INSERT INTO `sys_cn_area` VALUES ('491', '普兰店市', '普兰店', '482', null, '中国,辽宁省,大连市,普兰店市', '3', '116200', '0411', '210282', 'Pulandian', '121.9631600', '39.3946500');
INSERT INTO `sys_cn_area` VALUES ('492', '庄河市', '庄河', '482', null, '中国,辽宁省,大连市,庄河市', '3', '116400', '0411', '210283', 'Zhuanghe', '122.9672500', '39.6881500');
INSERT INTO `sys_cn_area` VALUES ('493', '鞍山市', '鞍山', '467', null, '中国,辽宁省,鞍山市', '2', '114001', '0412', '210300', 'Anshan', '122.9956320', '41.1106260');
INSERT INTO `sys_cn_area` VALUES ('494', '铁东区', '铁东', '493', null, '中国,辽宁省,鞍山市,铁东区', '3', '114001', '0412', '210302', 'Tiedong', '122.9908500', '41.0897500');
INSERT INTO `sys_cn_area` VALUES ('495', '铁西区', '铁西', '493', null, '中国,辽宁省,鞍山市,铁西区', '3', '114013', '0413', '210303', 'Tiexi', '122.9696700', '41.1197700');
INSERT INTO `sys_cn_area` VALUES ('496', '立山区', '立山', '493', null, '中国,辽宁省,鞍山市,立山区', '3', '114031', '0414', '210304', 'Lishan', '123.0294800', '41.1500800');
INSERT INTO `sys_cn_area` VALUES ('497', '千山区', '千山', '493', null, '中国,辽宁省,鞍山市,千山区', '3', '114041', '0415', '210311', 'Qianshan', '122.9604800', '41.0750700');
INSERT INTO `sys_cn_area` VALUES ('498', '台安县', '台安', '493', null, '中国,辽宁省,鞍山市,台安县', '3', '114100', '0417', '210321', 'Tai\'an', '122.4358500', '41.4126500');
INSERT INTO `sys_cn_area` VALUES ('499', '岫岩满族自治县', '岫岩', '493', null, '中国,辽宁省,鞍山市,岫岩满族自治县', '3', '114300', '0418', '210323', 'Xiuyan', '123.2887500', '40.2799600');
INSERT INTO `sys_cn_area` VALUES ('500', '海城市', '海城', '493', null, '中国,辽宁省,鞍山市,海城市', '3', '114200', '0416', '210381', 'Haicheng', '122.6845700', '40.8814200');
INSERT INTO `sys_cn_area` VALUES ('501', '抚顺市', '抚顺', '467', null, '中国,辽宁省,抚顺市', '2', '113008', '024', '210400', 'Fushun', '123.9211090', '41.8759560');
INSERT INTO `sys_cn_area` VALUES ('502', '新抚区', '新抚', '501', null, '中国,辽宁省,抚顺市,新抚区', '3', '113008', '024', '210402', 'Xinfu', '123.9126400', '41.8620500');
INSERT INTO `sys_cn_area` VALUES ('503', '东洲区', '东洲', '501', null, '中国,辽宁省,抚顺市,东洲区', '3', '113003', '024', '210403', 'Dongzhou', '124.0375900', '41.8519000');
INSERT INTO `sys_cn_area` VALUES ('504', '望花区', '望花', '501', null, '中国,辽宁省,抚顺市,望花区', '3', '113001', '024', '210404', 'Wanghua', '123.7828300', '41.8553200');
INSERT INTO `sys_cn_area` VALUES ('505', '顺城区', '顺城', '501', null, '中国,辽宁省,抚顺市,顺城区', '3', '113006', '024', '210411', 'Shuncheng', '123.9450600', '41.8832100');
INSERT INTO `sys_cn_area` VALUES ('506', '抚顺县', '抚顺', '501', null, '中国,辽宁省,抚顺市,抚顺县', '3', '113006', '024', '210421', 'Fushun', '124.1775500', '41.7121700');
INSERT INTO `sys_cn_area` VALUES ('507', '新宾满族自治县', '新宾', '501', null, '中国,辽宁省,抚顺市,新宾满族自治县', '3', '113200', '024', '210422', 'Xinbin', '125.0404900', '41.7340900');
INSERT INTO `sys_cn_area` VALUES ('508', '清原满族自治县', '清原', '501', null, '中国,辽宁省,抚顺市,清原满族自治县', '3', '113300', '024', '210423', 'Qingyuan', '124.9280700', '42.1022100');
INSERT INTO `sys_cn_area` VALUES ('509', '本溪市', '本溪', '467', null, '中国,辽宁省,本溪市', '2', '117000', '0414', '210500', 'Benxi', '123.7705190', '41.2979090');
INSERT INTO `sys_cn_area` VALUES ('510', '平山区', '平山', '509', null, '中国,辽宁省,本溪市,平山区', '3', '117000', '0414', '210502', 'Pingshan', '123.7689200', '41.2997000');
INSERT INTO `sys_cn_area` VALUES ('511', '溪湖区', '溪湖', '509', null, '中国,辽宁省,本溪市,溪湖区', '3', '117002', '0414', '210503', 'Xihu', '123.7676400', '41.3292100');
INSERT INTO `sys_cn_area` VALUES ('512', '明山区', '明山', '509', null, '中国,辽宁省,本溪市,明山区', '3', '117021', '0414', '210504', 'Mingshan', '123.8174600', '41.3082700');
INSERT INTO `sys_cn_area` VALUES ('513', '南芬区', '南芬', '509', null, '中国,辽宁省,本溪市,南芬区', '3', '117014', '0414', '210505', 'Nanfen', '123.7452300', '41.1006000');
INSERT INTO `sys_cn_area` VALUES ('514', '本溪满族自治县', '本溪', '509', null, '中国,辽宁省,本溪市,本溪满族自治县', '3', '117100', '0414', '210521', 'Benxi', '124.1274100', '41.3005900');
INSERT INTO `sys_cn_area` VALUES ('515', '桓仁满族自治县', '桓仁', '509', null, '中国,辽宁省,本溪市,桓仁满族自治县', '3', '117200', '0414', '210522', 'Huanren', '125.3606200', '41.2679800');
INSERT INTO `sys_cn_area` VALUES ('516', '丹东市', '丹东', '467', null, '中国,辽宁省,丹东市', '2', '118000', '0415', '210600', 'Dandong', '124.3830440', '40.1242960');
INSERT INTO `sys_cn_area` VALUES ('517', '元宝区', '元宝', '516', null, '中国,辽宁省,丹东市,元宝区', '3', '118000', '0415', '210602', 'Yuanbao', '124.3957500', '40.1365100');
INSERT INTO `sys_cn_area` VALUES ('518', '振兴区', '振兴', '516', null, '中国,辽宁省,丹东市,振兴区', '3', '118002', '0415', '210603', 'Zhenxing', '124.3603500', '40.1048900');
INSERT INTO `sys_cn_area` VALUES ('519', '振安区', '振安', '516', null, '中国,辽宁省,丹东市,振安区', '3', '118001', '0415', '210604', 'Zhen\'an', '124.4281600', '40.1582600');
INSERT INTO `sys_cn_area` VALUES ('520', '宽甸满族自治县', '宽甸', '516', null, '中国,辽宁省,丹东市,宽甸满族自治县', '3', '118200', '0415', '210624', 'Kuandian', '124.7824700', '40.7318700');
INSERT INTO `sys_cn_area` VALUES ('521', '东港市', '东港', '516', null, '中国,辽宁省,丹东市,东港市', '3', '118300', '0415', '210681', 'Donggang', '124.1628700', '39.8625600');
INSERT INTO `sys_cn_area` VALUES ('522', '凤城市', '凤城', '516', null, '中国,辽宁省,丹东市,凤城市', '3', '118100', '0415', '210682', 'Fengcheng', '124.0667100', '40.4530200');
INSERT INTO `sys_cn_area` VALUES ('523', '锦州市', '锦州', '467', null, '中国,辽宁省,锦州市', '2', '121000', '0416', '210700', 'Jinzhou', '121.1357420', '41.1192690');
INSERT INTO `sys_cn_area` VALUES ('524', '古塔区', '古塔', '523', null, '中国,辽宁省,锦州市,古塔区', '3', '121001', '0416', '210702', 'Guta', '121.1283200', '41.1172500');
INSERT INTO `sys_cn_area` VALUES ('525', '凌河区', '凌河', '523', null, '中国,辽宁省,锦州市,凌河区', '3', '121000', '0416', '210703', 'Linghe', '121.1508900', '41.1149600');
INSERT INTO `sys_cn_area` VALUES ('526', '太和区', '太和', '523', null, '中国,辽宁省,锦州市,太和区', '3', '121011', '0416', '210711', 'Taihe', '121.1035400', '41.1092900');
INSERT INTO `sys_cn_area` VALUES ('527', '黑山县', '黑山', '523', null, '中国,辽宁省,锦州市,黑山县', '3', '121400', '0416', '210726', 'Heishan', '122.1208100', '41.6941700');
INSERT INTO `sys_cn_area` VALUES ('528', '义县', '义县', '523', null, '中国,辽宁省,锦州市,义县', '3', '121100', '0416', '210727', 'Yixian', '121.2403500', '41.5345800');
INSERT INTO `sys_cn_area` VALUES ('529', '凌海市', '凌海', '523', null, '中国,辽宁省,锦州市,凌海市', '3', '121200', '0416', '210781', 'Linghai', '121.3570500', '41.1737000');
INSERT INTO `sys_cn_area` VALUES ('530', '北镇市', '北镇', '523', null, '中国,辽宁省,锦州市,北镇市', '3', '121300', '0416', '210782', 'Beizhen', '121.7985800', '41.5953700');
INSERT INTO `sys_cn_area` VALUES ('531', '营口市', '营口', '467', null, '中国,辽宁省,营口市', '2', '115003', '0417', '210800', 'Yingkou', '122.2351510', '40.6674320');
INSERT INTO `sys_cn_area` VALUES ('532', '站前区', '站前', '531', null, '中国,辽宁省,营口市,站前区', '3', '115002', '0417', '210802', 'Zhanqian', '122.2589600', '40.6726600');
INSERT INTO `sys_cn_area` VALUES ('533', '西市区', '西市', '531', null, '中国,辽宁省,营口市,西市区', '3', '115004', '0417', '210803', 'Xishi', '122.2064100', '40.6664000');
INSERT INTO `sys_cn_area` VALUES ('534', '鲅鱼圈区', '鲅鱼圈', '531', null, '中国,辽宁省,营口市,鲅鱼圈区', '3', '115007', '0417', '210804', 'Bayuquan', '122.1326600', '40.2686500');
INSERT INTO `sys_cn_area` VALUES ('535', '老边区', '老边', '531', null, '中国,辽宁省,营口市,老边区', '3', '115005', '0417', '210811', 'Laobian', '122.3799600', '40.6803000');
INSERT INTO `sys_cn_area` VALUES ('536', '盖州市', '盖州', '531', null, '中国,辽宁省,营口市,盖州市', '3', '115200', '0417', '210881', 'Gaizhou', '122.3546400', '40.4044600');
INSERT INTO `sys_cn_area` VALUES ('537', '大石桥市', '大石桥', '531', null, '中国,辽宁省,营口市,大石桥市', '3', '115100', '0417', '210882', 'Dashiqiao', '122.5092700', '40.6456700');
INSERT INTO `sys_cn_area` VALUES ('538', '阜新市', '阜新', '467', null, '中国,辽宁省,阜新市', '2', '123000', '0418', '210900', 'Fuxin', '121.6489620', '42.0117960');
INSERT INTO `sys_cn_area` VALUES ('539', '海州区', '海州', '538', null, '中国,辽宁省,阜新市,海州区', '3', '123000', '0418', '210902', 'Haizhou', '121.6562600', '42.0133600');
INSERT INTO `sys_cn_area` VALUES ('540', '新邱区', '新邱', '538', null, '中国,辽宁省,阜新市,新邱区', '3', '123005', '0418', '210903', 'Xinqiu', '121.7925100', '42.0918100');
INSERT INTO `sys_cn_area` VALUES ('541', '太平区', '太平', '538', null, '中国,辽宁省,阜新市,太平区', '3', '123003', '0418', '210904', 'Taiping', '121.6786500', '42.0106500');
INSERT INTO `sys_cn_area` VALUES ('542', '清河门区', '清河门', '538', null, '中国,辽宁省,阜新市,清河门区', '3', '123006', '0418', '210905', 'Qinghemen', '121.4161000', '41.7830900');
INSERT INTO `sys_cn_area` VALUES ('543', '细河区', '细河', '538', null, '中国,辽宁省,阜新市,细河区', '3', '123000', '0418', '210911', 'Xihe', '121.6801300', '42.0253300');
INSERT INTO `sys_cn_area` VALUES ('544', '阜新蒙古族自治县', '阜新', '538', null, '中国,辽宁省,阜新市,阜新蒙古族自治县', '3', '123100', '0418', '210921', 'Fuxin', '121.7578700', '42.0651000');
INSERT INTO `sys_cn_area` VALUES ('545', '彰武县', '彰武', '538', null, '中国,辽宁省,阜新市,彰武县', '3', '123200', '0418', '210922', 'Zhangwu', '122.5402200', '42.3862500');
INSERT INTO `sys_cn_area` VALUES ('546', '辽阳市', '辽阳', '467', null, '中国,辽宁省,辽阳市', '2', '111000', '0419', '211000', 'Liaoyang', '123.1815200', '41.2694020');
INSERT INTO `sys_cn_area` VALUES ('547', '白塔区', '白塔', '546', null, '中国,辽宁省,辽阳市,白塔区', '3', '111000', '0419', '211002', 'Baita', '123.1747000', '41.2702500');
INSERT INTO `sys_cn_area` VALUES ('548', '文圣区', '文圣', '546', null, '中国,辽宁省,辽阳市,文圣区', '3', '111000', '0419', '211003', 'Wensheng', '123.1852100', '41.2626700');
INSERT INTO `sys_cn_area` VALUES ('549', '宏伟区', '宏伟', '546', null, '中国,辽宁省,辽阳市,宏伟区', '3', '111003', '0419', '211004', 'Hongwei', '123.1929000', '41.2185200');
INSERT INTO `sys_cn_area` VALUES ('550', '弓长岭区', '弓长岭', '546', null, '中国,辽宁省,辽阳市,弓长岭区', '3', '111008', '0419', '211005', 'Gongchangling', '123.4196300', '41.1518100');
INSERT INTO `sys_cn_area` VALUES ('551', '太子河区', '太子河', '546', null, '中国,辽宁省,辽阳市,太子河区', '3', '111000', '0419', '211011', 'Taizihe', '123.1818200', '41.2533700');
INSERT INTO `sys_cn_area` VALUES ('552', '辽阳县', '辽阳', '546', null, '中国,辽宁省,辽阳市,辽阳县', '3', '111200', '0419', '211021', 'Liaoyang', '123.1057400', '41.2054200');
INSERT INTO `sys_cn_area` VALUES ('553', '灯塔市', '灯塔', '546', null, '中国,辽宁省,辽阳市,灯塔市', '3', '111300', '0419', '211081', 'Dengta', '123.3392600', '41.4261200');
INSERT INTO `sys_cn_area` VALUES ('554', '盘锦市', '盘锦', '467', null, '中国,辽宁省,盘锦市', '2', '124010', '0427', '211100', 'Panjin', '122.0695700', '41.1244840');
INSERT INTO `sys_cn_area` VALUES ('555', '双台子区', '双台子', '554', null, '中国,辽宁省,盘锦市,双台子区', '3', '124000', '0427', '211102', 'Shuangtaizi', '122.0601100', '41.1906000');
INSERT INTO `sys_cn_area` VALUES ('556', '兴隆台区', '兴隆台', '554', null, '中国,辽宁省,盘锦市,兴隆台区', '3', '124010', '0427', '211103', 'Xinglongtai', '122.0752900', '41.1240200');
INSERT INTO `sys_cn_area` VALUES ('557', '大洼县', '大洼', '554', null, '中国,辽宁省,盘锦市,大洼县', '3', '124200', '0427', '211121', 'Dawa', '122.0823900', '41.0024400');
INSERT INTO `sys_cn_area` VALUES ('558', '盘山县', '盘山', '554', null, '中国,辽宁省,盘锦市,盘山县', '3', '124000', '0427', '211122', 'Panshan', '121.9977700', '41.2380500');
INSERT INTO `sys_cn_area` VALUES ('559', '铁岭市', '铁岭', '467', null, '中国,辽宁省,铁岭市', '2', '112000', '024', '211200', 'Tieling', '123.8442790', '42.2905850');
INSERT INTO `sys_cn_area` VALUES ('560', '银州区', '银州', '559', null, '中国,辽宁省,铁岭市,银州区', '3', '112000', '024', '211202', 'Yinzhou', '123.8573000', '42.2950700');
INSERT INTO `sys_cn_area` VALUES ('561', '清河区', '清河', '559', null, '中国,辽宁省,铁岭市,清河区', '3', '112003', '024', '211204', 'Qinghe', '124.1591100', '42.5467900');
INSERT INTO `sys_cn_area` VALUES ('562', '铁岭县', '铁岭', '559', null, '中国,辽宁省,铁岭市,铁岭县', '3', '112000', '024', '211221', 'Tieling', '123.7732500', '42.2249800');
INSERT INTO `sys_cn_area` VALUES ('563', '西丰县', '西丰', '559', null, '中国,辽宁省,铁岭市,西丰县', '3', '112400', '024', '211223', 'Xifeng', '124.7304000', '42.7375600');
INSERT INTO `sys_cn_area` VALUES ('564', '昌图县', '昌图', '559', null, '中国,辽宁省,铁岭市,昌图县', '3', '112500', '024', '211224', 'Changtu', '124.1120600', '42.7842800');
INSERT INTO `sys_cn_area` VALUES ('565', '调兵山市', '调兵山', '559', null, '中国,辽宁省,铁岭市,调兵山市', '3', '112700', '024', '211281', 'Diaobingshan', '123.5668900', '42.4675000');
INSERT INTO `sys_cn_area` VALUES ('566', '开原市', '开原', '559', null, '中国,辽宁省,铁岭市,开原市', '3', '112300', '024', '211282', 'Kaiyuan', '124.0394500', '42.5458500');
INSERT INTO `sys_cn_area` VALUES ('567', '朝阳市', '朝阳', '467', null, '中国,辽宁省,朝阳市', '2', '122000', '0421', '211300', 'Chaoyang', '120.4511760', '41.5767580');
INSERT INTO `sys_cn_area` VALUES ('568', '双塔区', '双塔', '567', null, '中国,辽宁省,朝阳市,双塔区', '3', '122000', '0421', '211302', 'Shuangta', '120.4538500', '41.5660000');
INSERT INTO `sys_cn_area` VALUES ('569', '龙城区', '龙城', '567', null, '中国,辽宁省,朝阳市,龙城区', '3', '122000', '0421', '211303', 'Longcheng', '120.4371900', '41.5926400');
INSERT INTO `sys_cn_area` VALUES ('570', '朝阳县', '朝阳', '567', null, '中国,辽宁省,朝阳市,朝阳县', '3', '122000', '0421', '211321', 'Chaoyang', '120.1740100', '41.4324000');
INSERT INTO `sys_cn_area` VALUES ('571', '建平县', '建平', '567', null, '中国,辽宁省,朝阳市,建平县', '3', '122400', '0421', '211322', 'Jianping', '119.6439200', '41.4031500');
INSERT INTO `sys_cn_area` VALUES ('572', '喀喇沁左翼蒙古族自治县', '喀喇沁左翼', '567', null, '中国,辽宁省,朝阳市,喀喇沁左翼蒙古族自治县', '3', '122300', '0421', '211324', 'Kalaqinzuoyi', '119.7418500', '41.1280100');
INSERT INTO `sys_cn_area` VALUES ('573', '北票市', '北票', '567', null, '中国,辽宁省,朝阳市,北票市', '3', '122100', '0421', '211381', 'Beipiao', '120.7697700', '41.8019600');
INSERT INTO `sys_cn_area` VALUES ('574', '凌源市', '凌源', '567', null, '中国,辽宁省,朝阳市,凌源市', '3', '122500', '0421', '211382', 'Lingyuan', '119.4014800', '41.2455800');
INSERT INTO `sys_cn_area` VALUES ('575', '葫芦岛市', '葫芦岛', '467', null, '中国,辽宁省,葫芦岛市', '2', '125000', '0429', '211400', 'Huludao', '120.8563940', '40.7555720');
INSERT INTO `sys_cn_area` VALUES ('576', '连山区', '连山', '575', null, '中国,辽宁省,葫芦岛市,连山区', '3', '125001', '0429', '211402', 'Lianshan', '120.8639300', '40.7555400');
INSERT INTO `sys_cn_area` VALUES ('577', '龙港区', '龙港', '575', null, '中国,辽宁省,葫芦岛市,龙港区', '3', '125003', '0429', '211403', 'Longgang', '120.9486600', '40.7191900');
INSERT INTO `sys_cn_area` VALUES ('578', '南票区', '南票', '575', null, '中国,辽宁省,葫芦岛市,南票区', '3', '125027', '0429', '211404', 'Nanpiao', '120.7497800', '41.1070700');
INSERT INTO `sys_cn_area` VALUES ('579', '绥中县', '绥中', '575', null, '中国,辽宁省,葫芦岛市,绥中县', '3', '125200', '0429', '211421', 'Suizhong', '120.3445100', '40.3255200');
INSERT INTO `sys_cn_area` VALUES ('580', '建昌县', '建昌', '575', null, '中国,辽宁省,葫芦岛市,建昌县', '3', '125300', '0429', '211422', 'Jianchang', '119.8377000', '40.8244800');
INSERT INTO `sys_cn_area` VALUES ('581', '兴城市', '兴城', '575', null, '中国,辽宁省,葫芦岛市,兴城市', '3', '125100', '0429', '211481', 'Xingcheng', '120.7253700', '40.6149200');
INSERT INTO `sys_cn_area` VALUES ('582', '金普新区', '金普新区', '467', null, '中国,辽宁省,金普新区', '2', '116100', '0411', '211500', 'Jinpuxinqu', '121.7896270', '39.0554510');
INSERT INTO `sys_cn_area` VALUES ('583', '金州新区', '金州新区', '582', null, '中国,辽宁省,金普新区,金州新区', '3', '116100', '0411', '211501', 'Jinzhouxinqu', '121.7848210', '39.0522520');
INSERT INTO `sys_cn_area` VALUES ('584', '普湾新区', '普湾新区', '582', null, '中国,辽宁省,金普新区,普湾新区', '3', '116200', '0411', '211502', 'Puwanxinqu', '121.8128120', '39.3300930');
INSERT INTO `sys_cn_area` VALUES ('585', '保税区', '保税区', '582', null, '中国,辽宁省,金普新区,保税区', '3', '116100', '0411', '211503', 'Baoshuiqu', '121.9428900', '39.2246140');
INSERT INTO `sys_cn_area` VALUES ('586', '吉林省', '吉林', '1', null, '中国,吉林省', '1', null, '', '220000', 'Jilin', '125.3245000', '43.8868410');
INSERT INTO `sys_cn_area` VALUES ('587', '长春市', '长春', '586', null, '中国,吉林省,长春市', '2', '130022', '0431', '220100', 'Changchun', '125.3245000', '43.8868410');
INSERT INTO `sys_cn_area` VALUES ('588', '南关区', '南关', '587', null, '中国,吉林省,长春市,南关区', '3', '130022', '0431', '220102', 'Nanguan', '125.3503500', '43.8640100');
INSERT INTO `sys_cn_area` VALUES ('589', '宽城区', '宽城', '587', null, '中国,吉林省,长春市,宽城区', '3', '130051', '0431', '220103', 'Kuancheng', '125.3263500', '43.9018200');
INSERT INTO `sys_cn_area` VALUES ('590', '朝阳区', '朝阳', '587', null, '中国,吉林省,长春市,朝阳区', '3', '130012', '0431', '220104', 'Chaoyang', '125.2883000', '43.8333900');
INSERT INTO `sys_cn_area` VALUES ('591', '二道区', '二道', '587', null, '中国,吉林省,长春市,二道区', '3', '130031', '0431', '220105', 'Erdao', '125.3742900', '43.8650100');
INSERT INTO `sys_cn_area` VALUES ('592', '绿园区', '绿园', '587', null, '中国,吉林省,长春市,绿园区', '3', '130062', '0431', '220106', 'Lvyuan', '125.2558200', '43.8804500');
INSERT INTO `sys_cn_area` VALUES ('593', '双阳区', '双阳', '587', null, '中国,吉林省,长春市,双阳区', '3', '130600', '0431', '220112', 'Shuangyang', '125.6563100', '43.5280300');
INSERT INTO `sys_cn_area` VALUES ('594', '九台区', '九台', '587', null, '中国,吉林省,长春市,九台区', '3', '130500', '0431', '220113', 'Jiutai', '125.8395000', '44.1516300');
INSERT INTO `sys_cn_area` VALUES ('595', '农安县', '农安', '587', null, '中国,吉林省,长春市,农安县', '3', '130200', '0431', '220122', 'Nong\'an', '125.1848100', '44.4326500');
INSERT INTO `sys_cn_area` VALUES ('596', '榆树市', '榆树', '587', null, '中国,吉林省,长春市,榆树市', '3', '130400', '0431', '220182', 'Yushu', '126.5568800', '44.8252300');
INSERT INTO `sys_cn_area` VALUES ('597', '德惠市', '德惠', '587', null, '中国,吉林省,长春市,德惠市', '3', '130300', '0431', '220183', 'Dehui', '125.7053800', '44.5371900');
INSERT INTO `sys_cn_area` VALUES ('598', '吉林市', '吉林', '586', null, '中国,吉林省,吉林市', '2', '132011', '0432', '220200', 'Jilin', '126.5530200', '43.8435770');
INSERT INTO `sys_cn_area` VALUES ('599', '昌邑区', '昌邑', '598', null, '中国,吉林省,吉林市,昌邑区', '3', '132002', '0432', '220202', 'Changyi', '126.5742400', '43.8818300');
INSERT INTO `sys_cn_area` VALUES ('600', '龙潭区', '龙潭', '598', null, '中国,吉林省,吉林市,龙潭区', '3', '132021', '0432', '220203', 'Longtan', '126.5621300', '43.9105400');
INSERT INTO `sys_cn_area` VALUES ('601', '船营区', '船营', '598', null, '中国,吉林省,吉林市,船营区', '3', '132011', '0432', '220204', 'Chuanying', '126.5409600', '43.8334400');
INSERT INTO `sys_cn_area` VALUES ('602', '丰满区', '丰满', '598', null, '中国,吉林省,吉林市,丰满区', '3', '132013', '0432', '220211', 'Fengman', '126.5623700', '43.8223600');
INSERT INTO `sys_cn_area` VALUES ('603', '永吉县', '永吉', '598', null, '中国,吉林省,吉林市,永吉县', '3', '132200', '0432', '220221', 'Yongji', '126.4963000', '43.6719700');
INSERT INTO `sys_cn_area` VALUES ('604', '蛟河市', '蛟河', '598', null, '中国,吉林省,吉林市,蛟河市', '3', '132500', '0432', '220281', 'Jiaohe', '127.3442600', '43.7269600');
INSERT INTO `sys_cn_area` VALUES ('605', '桦甸市', '桦甸', '598', null, '中国,吉林省,吉林市,桦甸市', '3', '132400', '0432', '220282', 'Huadian', '126.7462400', '42.9720600');
INSERT INTO `sys_cn_area` VALUES ('606', '舒兰市', '舒兰', '598', null, '中国,吉林省,吉林市,舒兰市', '3', '132600', '0432', '220283', 'Shulan', '126.9653000', '44.4058200');
INSERT INTO `sys_cn_area` VALUES ('607', '磐石市', '磐石', '598', null, '中国,吉林省,吉林市,磐石市', '3', '132300', '0432', '220284', 'Panshi', '126.0625000', '42.9462800');
INSERT INTO `sys_cn_area` VALUES ('608', '四平市', '四平', '586', null, '中国,吉林省,四平市', '2', '136000', '0434', '220300', 'Siping', '124.3707850', '43.1703440');
INSERT INTO `sys_cn_area` VALUES ('609', '铁西区', '铁西', '608', null, '中国,吉林省,四平市,铁西区', '3', '136000', '0434', '220302', 'Tiexi', '124.3736900', '43.1745600');
INSERT INTO `sys_cn_area` VALUES ('610', '铁东区', '铁东', '608', null, '中国,吉林省,四平市,铁东区', '3', '136001', '0434', '220303', 'Tiedong', '124.4097600', '43.1624100');
INSERT INTO `sys_cn_area` VALUES ('611', '梨树县', '梨树', '608', null, '中国,吉林省,四平市,梨树县', '3', '136500', '0434', '220322', 'Lishu', '124.3356300', '43.3071700');
INSERT INTO `sys_cn_area` VALUES ('612', '伊通满族自治县', '伊通', '608', null, '中国,吉林省,四平市,伊通满族自治县', '3', '130700', '0434', '220323', 'Yitong', '125.3059600', '43.3443400');
INSERT INTO `sys_cn_area` VALUES ('613', '公主岭市', '公主岭', '608', null, '中国,吉林省,四平市,公主岭市', '3', '136100', '0434', '220381', 'Gongzhuling', '124.8226600', '43.5045300');
INSERT INTO `sys_cn_area` VALUES ('614', '双辽市', '双辽', '608', null, '中国,吉林省,四平市,双辽市', '3', '136400', '0434', '220382', 'Shuangliao', '123.5010600', '43.5209900');
INSERT INTO `sys_cn_area` VALUES ('615', '辽源市', '辽源', '586', null, '中国,吉林省,辽源市', '2', '136200', '0437', '220400', 'Liaoyuan', '125.1453490', '42.9026920');
INSERT INTO `sys_cn_area` VALUES ('616', '龙山区', '龙山', '615', null, '中国,吉林省,辽源市,龙山区', '3', '136200', '0437', '220402', 'Longshan', '125.1364100', '42.8971400');
INSERT INTO `sys_cn_area` VALUES ('617', '西安区', '西安', '615', null, '中国,吉林省,辽源市,西安区', '3', '136201', '0437', '220403', 'Xi\'an', '125.1490400', '42.9270000');
INSERT INTO `sys_cn_area` VALUES ('618', '东丰县', '东丰', '615', null, '中国,吉林省,辽源市,东丰县', '3', '136300', '0437', '220421', 'Dongfeng', '125.5324400', '42.6783000');
INSERT INTO `sys_cn_area` VALUES ('619', '东辽县', '东辽', '615', null, '中国,吉林省,辽源市,东辽县', '3', '136600', '0437', '220422', 'Dongliao', '124.9859600', '42.9249200');
INSERT INTO `sys_cn_area` VALUES ('620', '通化市', '通化', '586', null, '中国,吉林省,通化市', '2', '134001', '0435', '220500', 'Tonghua', '125.9365010', '41.7211770');
INSERT INTO `sys_cn_area` VALUES ('621', '东昌区', '东昌', '620', null, '中国,吉林省,通化市,东昌区', '3', '134001', '0435', '220502', 'Dongchang', '125.9551000', '41.7284900');
INSERT INTO `sys_cn_area` VALUES ('622', '二道江区', '二道江', '620', null, '中国,吉林省,通化市,二道江区', '3', '134003', '0435', '220503', 'Erdaojiang', '126.0425700', '41.7741000');
INSERT INTO `sys_cn_area` VALUES ('623', '通化县', '通化', '620', null, '中国,吉林省,通化市,通化县', '3', '134100', '0435', '220521', 'Tonghua', '125.7593600', '41.6792800');
INSERT INTO `sys_cn_area` VALUES ('624', '辉南县', '辉南', '620', null, '中国,吉林省,通化市,辉南县', '3', '135100', '0435', '220523', 'Huinan', '126.0468400', '42.6849700');
INSERT INTO `sys_cn_area` VALUES ('625', '柳河县', '柳河', '620', null, '中国,吉林省,通化市,柳河县', '3', '135300', '0435', '220524', 'Liuhe', '125.7447500', '42.2846800');
INSERT INTO `sys_cn_area` VALUES ('626', '梅河口市', '梅河口', '620', null, '中国,吉林省,通化市,梅河口市', '3', '135000', '0435', '220581', 'Meihekou', '125.7104100', '42.5382800');
INSERT INTO `sys_cn_area` VALUES ('627', '集安市', '集安', '620', null, '中国,吉林省,通化市,集安市', '3', '134200', '0435', '220582', 'Ji\'an', '126.1882900', '41.1226800');
INSERT INTO `sys_cn_area` VALUES ('628', '白山市', '白山', '586', null, '中国,吉林省,白山市', '2', '134300', '0439', '220600', 'Baishan', '126.4278390', '41.9425050');
INSERT INTO `sys_cn_area` VALUES ('629', '浑江区', '浑江', '628', null, '中国,吉林省,白山市,浑江区', '3', '134300', '0439', '220602', 'Hunjiang', '126.4223420', '41.9456560');
INSERT INTO `sys_cn_area` VALUES ('630', '江源区', '江源', '628', null, '中国,吉林省,白山市,江源区', '3', '134700', '0439', '220605', 'Jiangyuan', '126.5907900', '42.0566400');
INSERT INTO `sys_cn_area` VALUES ('631', '抚松县', '抚松', '628', null, '中国,吉林省,白山市,抚松县', '3', '134500', '0439', '220621', 'Fusong', '127.2803000', '42.3419800');
INSERT INTO `sys_cn_area` VALUES ('632', '靖宇县', '靖宇', '628', null, '中国,吉林省,白山市,靖宇县', '3', '135200', '0439', '220622', 'Jingyu', '126.8130800', '42.3886300');
INSERT INTO `sys_cn_area` VALUES ('633', '长白朝鲜族自治县', '长白', '628', null, '中国,吉林省,白山市,长白朝鲜族自治县', '3', '134400', '0439', '220623', 'Changbai', '128.2004700', '41.4199600');
INSERT INTO `sys_cn_area` VALUES ('634', '临江市', '临江', '628', null, '中国,吉林省,白山市,临江市', '3', '134600', '0439', '220681', 'Linjiang', '126.9175100', '41.8114200');
INSERT INTO `sys_cn_area` VALUES ('635', '松原市', '松原', '586', null, '中国,吉林省,松原市', '2', '138000', '0438', '220700', 'Songyuan', '124.8236080', '45.1182430');
INSERT INTO `sys_cn_area` VALUES ('636', '宁江区', '宁江', '635', null, '中国,吉林省,松原市,宁江区', '3', '138000', '0438', '220702', 'Ningjiang', '124.8168900', '45.1717500');
INSERT INTO `sys_cn_area` VALUES ('637', '前郭尔罗斯蒙古族自治县', '前郭尔罗斯', '635', null, '中国,吉林省,松原市,前郭尔罗斯蒙古族自治县', '3', '138000', '0438', '220721', 'Qianguoerluosi', '124.8235100', '45.1172600');
INSERT INTO `sys_cn_area` VALUES ('638', '长岭县', '长岭', '635', null, '中国,吉林省,松原市,长岭县', '3', '131500', '0438', '220722', 'Changling', '123.9672500', '44.2758100');
INSERT INTO `sys_cn_area` VALUES ('639', '乾安县', '乾安', '635', null, '中国,吉林省,松原市,乾安县', '3', '131400', '0438', '220723', 'Qian\'an', '124.0273700', '45.0106800');
INSERT INTO `sys_cn_area` VALUES ('640', '扶余市', '扶余', '635', null, '中国,吉林省,松原市,扶余市', '3', '131200', '0438', '220781', 'Fuyu', '126.0427580', '44.9861990');
INSERT INTO `sys_cn_area` VALUES ('641', '白城市', '白城', '586', null, '中国,吉林省,白城市', '2', '137000', '0436', '220800', 'Baicheng', '122.8411140', '45.6190260');
INSERT INTO `sys_cn_area` VALUES ('642', '洮北区', '洮北', '641', null, '中国,吉林省,白城市,洮北区', '3', '137000', '0436', '220802', 'Taobei', '122.8510400', '45.6216700');
INSERT INTO `sys_cn_area` VALUES ('643', '镇赉县', '镇赉', '641', null, '中国,吉林省,白城市,镇赉县', '3', '137300', '0436', '220821', 'Zhenlai', '123.1992400', '45.8477900');
INSERT INTO `sys_cn_area` VALUES ('644', '通榆县', '通榆', '641', null, '中国,吉林省,白城市,通榆县', '3', '137200', '0436', '220822', 'Tongyu', '123.0876100', '44.8138800');
INSERT INTO `sys_cn_area` VALUES ('645', '洮南市', '洮南', '641', null, '中国,吉林省,白城市,洮南市', '3', '137100', '0436', '220881', 'Taonan', '122.7877200', '45.3350200');
INSERT INTO `sys_cn_area` VALUES ('646', '大安市', '大安', '641', null, '中国,吉林省,白城市,大安市', '3', '131300', '0436', '220882', 'Da\'an', '124.2951900', '45.5084600');
INSERT INTO `sys_cn_area` VALUES ('647', '延边朝鲜族自治州', '延边', '586', null, '中国,吉林省,延边朝鲜族自治州', '2', '133000', '0433', '222400', 'Yanbian', '129.5132280', '42.9048230');
INSERT INTO `sys_cn_area` VALUES ('648', '延吉市', '延吉', '647', null, '中国,吉林省,延边朝鲜族自治州,延吉市', '3', '133000', '0433', '222401', 'Yanji', '129.5135700', '42.9068200');
INSERT INTO `sys_cn_area` VALUES ('649', '图们市', '图们', '647', null, '中国,吉林省,延边朝鲜族自治州,图们市', '3', '133100', '0433', '222402', 'Tumen', '129.8438100', '42.9680100');
INSERT INTO `sys_cn_area` VALUES ('650', '敦化市', '敦化', '647', null, '中国,吉林省,延边朝鲜族自治州,敦化市', '3', '133700', '0433', '222403', 'Dunhua', '128.2324200', '43.3730400');
INSERT INTO `sys_cn_area` VALUES ('651', '珲春市', '珲春', '647', null, '中国,吉林省,延边朝鲜族自治州,珲春市', '3', '133300', '0433', '222404', 'Hunchun', '130.3657200', '42.8624200');
INSERT INTO `sys_cn_area` VALUES ('652', '龙井市', '龙井', '647', null, '中国,吉林省,延边朝鲜族自治州,龙井市', '3', '133400', '0433', '222405', 'Longjing', '129.4258400', '42.7680400');
INSERT INTO `sys_cn_area` VALUES ('653', '和龙市', '和龙', '647', null, '中国,吉林省,延边朝鲜族自治州,和龙市', '3', '133500', '0433', '222406', 'Helong', '129.0107700', '42.5464000');
INSERT INTO `sys_cn_area` VALUES ('654', '汪清县', '汪清', '647', null, '中国,吉林省,延边朝鲜族自治州,汪清县', '3', '133200', '0433', '222424', 'Wangqing', '129.7712100', '43.3127800');
INSERT INTO `sys_cn_area` VALUES ('655', '安图县', '安图', '647', null, '中国,吉林省,延边朝鲜族自治州,安图县', '3', '133600', '0433', '222426', 'Antu', '128.9062500', '43.1153300');
INSERT INTO `sys_cn_area` VALUES ('656', '黑龙江省', '黑龙江', '1', null, '中国,黑龙江省', '1', null, '', '230000', 'Heilongjiang', '126.6424640', '45.7569670');
INSERT INTO `sys_cn_area` VALUES ('657', '哈尔滨市', '哈尔滨', '656', null, '中国,黑龙江省,哈尔滨市', '2', '150010', '0451', '230100', 'Harbin', '126.6424640', '45.7569670');
INSERT INTO `sys_cn_area` VALUES ('658', '道里区', '道里', '657', null, '中国,黑龙江省,哈尔滨市,道里区', '3', '150010', '0451', '230102', 'Daoli', '126.6170500', '45.7558600');
INSERT INTO `sys_cn_area` VALUES ('659', '南岗区', '南岗', '657', null, '中国,黑龙江省,哈尔滨市,南岗区', '3', '150006', '0451', '230103', 'Nangang', '126.6685400', '45.7599600');
INSERT INTO `sys_cn_area` VALUES ('660', '道外区', '道外', '657', null, '中国,黑龙江省,哈尔滨市,道外区', '3', '150020', '0451', '230104', 'Daowai', '126.6493800', '45.7918700');
INSERT INTO `sys_cn_area` VALUES ('661', '平房区', '平房', '657', null, '中国,黑龙江省,哈尔滨市,平房区', '3', '150060', '0451', '230108', 'Pingfang', '126.6372900', '45.5977700');
INSERT INTO `sys_cn_area` VALUES ('662', '松北区', '松北', '657', null, '中国,黑龙江省,哈尔滨市,松北区', '3', '150028', '0451', '230109', 'Songbei', '126.5627600', '45.8083100');
INSERT INTO `sys_cn_area` VALUES ('663', '香坊区', '香坊', '657', null, '中国,黑龙江省,哈尔滨市,香坊区', '3', '150036', '0451', '230110', 'Xiangfang', '126.6796800', '45.7238300');
INSERT INTO `sys_cn_area` VALUES ('664', '呼兰区', '呼兰', '657', null, '中国,黑龙江省,哈尔滨市,呼兰区', '3', '150500', '0451', '230111', 'Hulan', '126.5879200', '45.8889500');
INSERT INTO `sys_cn_area` VALUES ('665', '阿城区', '阿城', '657', null, '中国,黑龙江省,哈尔滨市,阿城区', '3', '150300', '0451', '230112', 'A\'cheng', '126.9752500', '45.5414400');
INSERT INTO `sys_cn_area` VALUES ('666', '双城区', '双城', '657', null, '中国,黑龙江省,哈尔滨市,双城区', '3', '150100', '0451', '230113', 'Shuangcheng', '126.3087840', '45.3779420');
INSERT INTO `sys_cn_area` VALUES ('667', '依兰县', '依兰', '657', null, '中国,黑龙江省,哈尔滨市,依兰县', '3', '154800', '0451', '230123', 'Yilan', '129.5681700', '46.3247000');
INSERT INTO `sys_cn_area` VALUES ('668', '方正县', '方正', '657', null, '中国,黑龙江省,哈尔滨市,方正县', '3', '150800', '0451', '230124', 'Fangzheng', '128.8295200', '45.8516200');
INSERT INTO `sys_cn_area` VALUES ('669', '宾县', '宾县', '657', null, '中国,黑龙江省,哈尔滨市,宾县', '3', '150400', '0451', '230125', 'Binxian', '127.4867500', '45.7550400');
INSERT INTO `sys_cn_area` VALUES ('670', '巴彦县', '巴彦', '657', null, '中国,黑龙江省,哈尔滨市,巴彦县', '3', '151800', '0451', '230126', 'Bayan', '127.4079900', '46.0814800');
INSERT INTO `sys_cn_area` VALUES ('671', '木兰县', '木兰', '657', null, '中国,黑龙江省,哈尔滨市,木兰县', '3', '151900', '0451', '230127', 'Mulan', '128.0448000', '45.9494400');
INSERT INTO `sys_cn_area` VALUES ('672', '通河县', '通河', '657', null, '中国,黑龙江省,哈尔滨市,通河县', '3', '150900', '0451', '230128', 'Tonghe', '128.7460300', '45.9900700');
INSERT INTO `sys_cn_area` VALUES ('673', '延寿县', '延寿', '657', null, '中国,黑龙江省,哈尔滨市,延寿县', '3', '150700', '0451', '230129', 'Yanshou', '128.3341900', '45.4554000');
INSERT INTO `sys_cn_area` VALUES ('674', '尚志市', '尚志', '657', null, '中国,黑龙江省,哈尔滨市,尚志市', '3', '150600', '0451', '230183', 'Shangzhi', '127.9619100', '45.2173600');
INSERT INTO `sys_cn_area` VALUES ('675', '五常市', '五常', '657', null, '中国,黑龙江省,哈尔滨市,五常市', '3', '150200', '0451', '230184', 'Wuchang', '127.1675100', '44.9318400');
INSERT INTO `sys_cn_area` VALUES ('676', '齐齐哈尔市', '齐齐哈尔', '656', null, '中国,黑龙江省,齐齐哈尔市', '2', '161005', '0452', '230200', 'Qiqihar', '123.9534860', '47.3480790');
INSERT INTO `sys_cn_area` VALUES ('677', '龙沙区', '龙沙', '676', null, '中国,黑龙江省,齐齐哈尔市,龙沙区', '3', '161000', '0452', '230202', 'Longsha', '123.9575200', '47.3177600');
INSERT INTO `sys_cn_area` VALUES ('678', '建华区', '建华', '676', null, '中国,黑龙江省,齐齐哈尔市,建华区', '3', '161006', '0452', '230203', 'Jianhua', '124.0133000', '47.3671800');
INSERT INTO `sys_cn_area` VALUES ('679', '铁锋区', '铁锋', '676', null, '中国,黑龙江省,齐齐哈尔市,铁锋区', '3', '161000', '0452', '230204', 'Tiefeng', '123.9782100', '47.3407500');
INSERT INTO `sys_cn_area` VALUES ('680', '昂昂溪区', '昂昂溪', '676', null, '中国,黑龙江省,齐齐哈尔市,昂昂溪区', '3', '161031', '0452', '230205', 'Angangxi', '123.8222900', '47.1551300');
INSERT INTO `sys_cn_area` VALUES ('681', '富拉尔基区', '富拉尔基', '676', null, '中国,黑龙江省,齐齐哈尔市,富拉尔基区', '3', '161041', '0452', '230206', 'Fulaerji', '123.6291800', '47.2088400');
INSERT INTO `sys_cn_area` VALUES ('682', '碾子山区', '碾子山', '676', null, '中国,黑龙江省,齐齐哈尔市,碾子山区', '3', '161046', '0452', '230207', 'Nianzishan', '122.8818300', '47.5166200');
INSERT INTO `sys_cn_area` VALUES ('683', '梅里斯达斡尔族区', '梅里斯', '676', null, '中国,黑龙江省,齐齐哈尔市,梅里斯达斡尔族区', '3', '161021', '0452', '230208', 'Meilisi', '123.7527400', '47.3094600');
INSERT INTO `sys_cn_area` VALUES ('684', '龙江县', '龙江', '676', null, '中国,黑龙江省,齐齐哈尔市,龙江县', '3', '161100', '0452', '230221', 'Longjiang', '123.2053200', '47.3386800');
INSERT INTO `sys_cn_area` VALUES ('685', '依安县', '依安', '676', null, '中国,黑龙江省,齐齐哈尔市,依安县', '3', '161500', '0452', '230223', 'Yi\'an', '125.3089600', '47.8931000');
INSERT INTO `sys_cn_area` VALUES ('686', '泰来县', '泰来', '676', null, '中国,黑龙江省,齐齐哈尔市,泰来县', '3', '162400', '0452', '230224', 'Tailai', '123.4228500', '46.3938600');
INSERT INTO `sys_cn_area` VALUES ('687', '甘南县', '甘南', '676', null, '中国,黑龙江省,齐齐哈尔市,甘南县', '3', '162100', '0452', '230225', 'Gannan', '123.5031700', '47.9243700');
INSERT INTO `sys_cn_area` VALUES ('688', '富裕县', '富裕', '676', null, '中国,黑龙江省,齐齐哈尔市,富裕县', '3', '161200', '0452', '230227', 'Fuyu', '124.4745700', '47.7743100');
INSERT INTO `sys_cn_area` VALUES ('689', '克山县', '克山', '676', null, '中国,黑龙江省,齐齐哈尔市,克山县', '3', '161600', '0452', '230229', 'Keshan', '125.8739600', '48.0326500');
INSERT INTO `sys_cn_area` VALUES ('690', '克东县', '克东', '676', null, '中国,黑龙江省,齐齐哈尔市,克东县', '3', '164800', '0452', '230230', 'Kedong', '126.2491700', '48.0382800');
INSERT INTO `sys_cn_area` VALUES ('691', '拜泉县', '拜泉', '676', null, '中国,黑龙江省,齐齐哈尔市,拜泉县', '3', '164700', '0452', '230231', 'Baiquan', '126.0916700', '47.6081700');
INSERT INTO `sys_cn_area` VALUES ('692', '讷河市', '讷河', '676', null, '中国,黑龙江省,齐齐哈尔市,讷河市', '3', '161300', '0452', '230281', 'Nehe', '124.8771300', '48.4838800');
INSERT INTO `sys_cn_area` VALUES ('693', '鸡西市', '鸡西', '656', null, '中国,黑龙江省,鸡西市', '2', '158100', '0467', '230300', 'Jixi', '130.9759660', '45.3000460');
INSERT INTO `sys_cn_area` VALUES ('694', '鸡冠区', '鸡冠', '693', null, '中国,黑龙江省,鸡西市,鸡冠区', '3', '158100', '0467', '230302', 'Jiguan', '130.9813900', '45.3039600');
INSERT INTO `sys_cn_area` VALUES ('695', '恒山区', '恒山', '693', null, '中国,黑龙江省,鸡西市,恒山区', '3', '158130', '0467', '230303', 'Hengshan', '130.9049300', '45.2107100');
INSERT INTO `sys_cn_area` VALUES ('696', '滴道区', '滴道', '693', null, '中国,黑龙江省,鸡西市,滴道区', '3', '158150', '0467', '230304', 'Didao', '130.8484100', '45.3510900');
INSERT INTO `sys_cn_area` VALUES ('697', '梨树区', '梨树', '693', null, '中国,黑龙江省,鸡西市,梨树区', '3', '158160', '0467', '230305', 'Lishu', '130.6984800', '45.0903700');
INSERT INTO `sys_cn_area` VALUES ('698', '城子河区', '城子河', '693', null, '中国,黑龙江省,鸡西市,城子河区', '3', '158170', '0467', '230306', 'Chengzihe', '131.0113200', '45.3368900');
INSERT INTO `sys_cn_area` VALUES ('699', '麻山区', '麻山', '693', null, '中国,黑龙江省,鸡西市,麻山区', '3', '158180', '0467', '230307', 'Mashan', '130.4781100', '45.2120900');
INSERT INTO `sys_cn_area` VALUES ('700', '鸡东县', '鸡东', '693', null, '中国,黑龙江省,鸡西市,鸡东县', '3', '158200', '0467', '230321', 'Jidong', '131.1242300', '45.2602500');
INSERT INTO `sys_cn_area` VALUES ('701', '虎林市', '虎林', '693', null, '中国,黑龙江省,鸡西市,虎林市', '3', '158400', '0467', '230381', 'Hulin', '132.9367900', '45.7629100');
INSERT INTO `sys_cn_area` VALUES ('702', '密山市', '密山', '693', null, '中国,黑龙江省,鸡西市,密山市', '3', '158300', '0467', '230382', 'Mishan', '131.8462500', '45.5297000');
INSERT INTO `sys_cn_area` VALUES ('703', '鹤岗市', '鹤岗', '656', null, '中国,黑龙江省,鹤岗市', '2', '154100', '0468', '230400', 'Hegang', '130.2774870', '47.3320850');
INSERT INTO `sys_cn_area` VALUES ('704', '向阳区', '向阳', '703', null, '中国,黑龙江省,鹤岗市,向阳区', '3', '154100', '0468', '230402', 'Xiangyang', '130.2943000', '47.3424700');
INSERT INTO `sys_cn_area` VALUES ('705', '工农区', '工农', '703', null, '中国,黑龙江省,鹤岗市,工农区', '3', '154101', '0468', '230403', 'Gongnong', '130.2746800', '47.3186900');
INSERT INTO `sys_cn_area` VALUES ('706', '南山区', '南山', '703', null, '中国,黑龙江省,鹤岗市,南山区', '3', '154104', '0468', '230404', 'Nanshan', '130.2767600', '47.3140400');
INSERT INTO `sys_cn_area` VALUES ('707', '兴安区', '兴安', '703', null, '中国,黑龙江省,鹤岗市,兴安区', '3', '154102', '0468', '230405', 'Xing\'an', '130.2396500', '47.2526000');
INSERT INTO `sys_cn_area` VALUES ('708', '东山区', '东山', '703', null, '中国,黑龙江省,鹤岗市,东山区', '3', '154106', '0468', '230406', 'Dongshan', '130.3170600', '47.3385300');
INSERT INTO `sys_cn_area` VALUES ('709', '兴山区', '兴山', '703', null, '中国,黑龙江省,鹤岗市,兴山区', '3', '154105', '0468', '230407', 'Xingshan', '130.2927100', '47.3577600');
INSERT INTO `sys_cn_area` VALUES ('710', '萝北县', '萝北', '703', null, '中国,黑龙江省,鹤岗市,萝北县', '3', '154200', '0468', '230421', 'Luobei', '130.8334600', '47.5795900');
INSERT INTO `sys_cn_area` VALUES ('711', '绥滨县', '绥滨', '703', null, '中国,黑龙江省,鹤岗市,绥滨县', '3', '156200', '0468', '230422', 'Suibin', '131.8602900', '47.2903000');
INSERT INTO `sys_cn_area` VALUES ('712', '双鸭山市', '双鸭山', '656', null, '中国,黑龙江省,双鸭山市', '2', '155100', '0469', '230500', 'Shuangyashan', '131.1573040', '46.6434420');
INSERT INTO `sys_cn_area` VALUES ('713', '尖山区', '尖山', '712', null, '中国,黑龙江省,双鸭山市,尖山区', '3', '155100', '0469', '230502', 'Jianshan', '131.1584100', '46.6463500');
INSERT INTO `sys_cn_area` VALUES ('714', '岭东区', '岭东', '712', null, '中国,黑龙江省,双鸭山市,岭东区', '3', '155120', '0469', '230503', 'Lingdong', '131.1647300', '46.5904300');
INSERT INTO `sys_cn_area` VALUES ('715', '四方台区', '四方台', '712', null, '中国,黑龙江省,双鸭山市,四方台区', '3', '155130', '0469', '230505', 'Sifangtai', '131.3359300', '46.5949900');
INSERT INTO `sys_cn_area` VALUES ('716', '宝山区', '宝山', '712', null, '中国,黑龙江省,双鸭山市,宝山区', '3', '155131', '0469', '230506', 'Baoshan', '131.4016000', '46.5771800');
INSERT INTO `sys_cn_area` VALUES ('717', '集贤县', '集贤', '712', null, '中国,黑龙江省,双鸭山市,集贤县', '3', '155900', '0469', '230521', 'Jixian', '131.1405300', '46.7267800');
INSERT INTO `sys_cn_area` VALUES ('718', '友谊县', '友谊', '712', null, '中国,黑龙江省,双鸭山市,友谊县', '3', '155800', '0469', '230522', 'Youyi', '131.8078900', '46.7673900');
INSERT INTO `sys_cn_area` VALUES ('719', '宝清县', '宝清', '712', null, '中国,黑龙江省,双鸭山市,宝清县', '3', '155600', '0469', '230523', 'Baoqing', '132.1969500', '46.3271600');
INSERT INTO `sys_cn_area` VALUES ('720', '饶河县', '饶河', '712', null, '中国,黑龙江省,双鸭山市,饶河县', '3', '155700', '0469', '230524', 'Raohe', '134.0198600', '46.7989900');
INSERT INTO `sys_cn_area` VALUES ('721', '大庆市', '大庆', '656', null, '中国,黑龙江省,大庆市', '2', '163000', '0459', '230600', 'Daqing', '125.1127200', '46.5907340');
INSERT INTO `sys_cn_area` VALUES ('722', '萨尔图区', '萨尔图', '721', null, '中国,黑龙江省,大庆市,萨尔图区', '3', '163001', '0459', '230602', 'Saertu', '125.0879200', '46.5935900');
INSERT INTO `sys_cn_area` VALUES ('723', '龙凤区', '龙凤', '721', null, '中国,黑龙江省,大庆市,龙凤区', '3', '163711', '0459', '230603', 'Longfeng', '125.1165700', '46.5327300');
INSERT INTO `sys_cn_area` VALUES ('724', '让胡路区', '让胡路', '721', null, '中国,黑龙江省,大庆市,让胡路区', '3', '163712', '0459', '230604', 'Ranghulu', '124.8707500', '46.6522000');
INSERT INTO `sys_cn_area` VALUES ('725', '红岗区', '红岗', '721', null, '中国,黑龙江省,大庆市,红岗区', '3', '163511', '0459', '230605', 'Honggang', '124.8924800', '46.4012800');
INSERT INTO `sys_cn_area` VALUES ('726', '大同区', '大同', '721', null, '中国,黑龙江省,大庆市,大同区', '3', '163515', '0459', '230606', 'Datong', '124.8159100', '46.0329500');
INSERT INTO `sys_cn_area` VALUES ('727', '肇州县', '肇州', '721', null, '中国,黑龙江省,大庆市,肇州县', '3', '166400', '0459', '230621', 'Zhaozhou', '125.2705900', '45.7041400');
INSERT INTO `sys_cn_area` VALUES ('728', '肇源县', '肇源', '721', null, '中国,黑龙江省,大庆市,肇源县', '3', '166500', '0459', '230622', 'Zhaoyuan', '125.0845600', '45.5203200');
INSERT INTO `sys_cn_area` VALUES ('729', '林甸县', '林甸', '721', null, '中国,黑龙江省,大庆市,林甸县', '3', '166300', '0459', '230623', 'Lindian', '124.8756400', '47.1860100');
INSERT INTO `sys_cn_area` VALUES ('730', '杜尔伯特蒙古族自治县', '杜尔伯特', '721', null, '中国,黑龙江省,大庆市,杜尔伯特蒙古族自治县', '3', '166200', '0459', '230624', 'Duerbote', '124.4493700', '46.8650700');
INSERT INTO `sys_cn_area` VALUES ('731', '伊春市', '伊春', '656', null, '中国,黑龙江省,伊春市', '2', '153000', '0458', '230700', 'Yichun', '128.8993960', '47.7247750');
INSERT INTO `sys_cn_area` VALUES ('732', '伊春区', '伊春', '731', null, '中国,黑龙江省,伊春市,伊春区', '3', '153000', '0458', '230702', 'Yichun', '128.9075200', '47.7280000');
INSERT INTO `sys_cn_area` VALUES ('733', '南岔区', '南岔', '731', null, '中国,黑龙江省,伊春市,南岔区', '3', '153100', '0458', '230703', 'Nancha', '129.2836200', '47.1389700');
INSERT INTO `sys_cn_area` VALUES ('734', '友好区', '友好', '731', null, '中国,黑龙江省,伊春市,友好区', '3', '153031', '0458', '230704', 'Youhao', '128.8403900', '47.8537100');
INSERT INTO `sys_cn_area` VALUES ('735', '西林区', '西林', '731', null, '中国,黑龙江省,伊春市,西林区', '3', '153025', '0458', '230705', 'Xilin', '129.3120100', '47.4810300');
INSERT INTO `sys_cn_area` VALUES ('736', '翠峦区', '翠峦', '731', null, '中国,黑龙江省,伊春市,翠峦区', '3', '153013', '0458', '230706', 'Cuiluan', '128.6672900', '47.7250300');
INSERT INTO `sys_cn_area` VALUES ('737', '新青区', '新青', '731', null, '中国,黑龙江省,伊春市,新青区', '3', '153036', '0458', '230707', 'Xinqing', '129.5365300', '48.2906700');
INSERT INTO `sys_cn_area` VALUES ('738', '美溪区', '美溪', '731', null, '中国,黑龙江省,伊春市,美溪区', '3', '153021', '0458', '230708', 'Meixi', '129.1370800', '47.6351300');
INSERT INTO `sys_cn_area` VALUES ('739', '金山屯区', '金山屯', '731', null, '中国,黑龙江省,伊春市,金山屯区', '3', '153026', '0458', '230709', 'Jinshantun', '129.4376800', '47.4134900');
INSERT INTO `sys_cn_area` VALUES ('740', '五营区', '五营', '731', null, '中国,黑龙江省,伊春市,五营区', '3', '153033', '0458', '230710', 'Wuying', '129.2454500', '48.1079100');
INSERT INTO `sys_cn_area` VALUES ('741', '乌马河区', '乌马河', '731', null, '中国,黑龙江省,伊春市,乌马河区', '3', '153011', '0458', '230711', 'Wumahe', '128.7967200', '47.7280000');
INSERT INTO `sys_cn_area` VALUES ('742', '汤旺河区', '汤旺河', '731', null, '中国,黑龙江省,伊春市,汤旺河区', '3', '153037', '0458', '230712', 'Tangwanghe', '129.5722600', '48.4518200');
INSERT INTO `sys_cn_area` VALUES ('743', '带岭区', '带岭', '731', null, '中国,黑龙江省,伊春市,带岭区', '3', '153106', '0458', '230713', 'Dailing', '129.0235200', '47.0255300');
INSERT INTO `sys_cn_area` VALUES ('744', '乌伊岭区', '乌伊岭', '731', null, '中国,黑龙江省,伊春市,乌伊岭区', '3', '153038', '0458', '230714', 'Wuyiling', '129.4398100', '48.5960200');
INSERT INTO `sys_cn_area` VALUES ('745', '红星区', '红星', '731', null, '中国,黑龙江省,伊春市,红星区', '3', '153035', '0458', '230715', 'Hongxing', '129.3887000', '48.2394400');
INSERT INTO `sys_cn_area` VALUES ('746', '上甘岭区', '上甘岭', '731', null, '中国,黑龙江省,伊春市,上甘岭区', '3', '153032', '0458', '230716', 'Shangganling', '129.0244700', '47.9752200');
INSERT INTO `sys_cn_area` VALUES ('747', '嘉荫县', '嘉荫', '731', null, '中国,黑龙江省,伊春市,嘉荫县', '3', '153200', '0458', '230722', 'Jiayin', '130.3982500', '48.8917000');
INSERT INTO `sys_cn_area` VALUES ('748', '铁力市', '铁力', '731', null, '中国,黑龙江省,伊春市,铁力市', '3', '152500', '0458', '230781', 'Tieli', '128.0317000', '46.9857100');
INSERT INTO `sys_cn_area` VALUES ('749', '佳木斯市', '佳木斯', '656', null, '中国,黑龙江省,佳木斯市', '2', '154002', '0454', '230800', 'Jiamusi', '130.3616340', '46.8096060');
INSERT INTO `sys_cn_area` VALUES ('750', '向阳区', '向阳', '749', null, '中国,黑龙江省,佳木斯市,向阳区', '3', '154002', '0454', '230803', 'Xiangyang', '130.3651900', '46.8077800');
INSERT INTO `sys_cn_area` VALUES ('751', '前进区', '前进', '749', null, '中国,黑龙江省,佳木斯市,前进区', '3', '154002', '0454', '230804', 'Qianjin', '130.3749700', '46.8140100');
INSERT INTO `sys_cn_area` VALUES ('752', '东风区', '东风', '749', null, '中国,黑龙江省,佳木斯市,东风区', '3', '154005', '0454', '230805', 'Dongfeng', '130.4036600', '46.8225700');
INSERT INTO `sys_cn_area` VALUES ('753', '郊区', '郊区', '749', null, '中国,黑龙江省,佳木斯市,郊区', '3', '154004', '0454', '230811', 'Jiaoqu', '130.3273100', '46.8095800');
INSERT INTO `sys_cn_area` VALUES ('754', '桦南县', '桦南', '749', null, '中国,黑龙江省,佳木斯市,桦南县', '3', '154400', '0454', '230822', 'Huanan', '130.5536100', '46.2392100');
INSERT INTO `sys_cn_area` VALUES ('755', '桦川县', '桦川', '749', null, '中国,黑龙江省,佳木斯市,桦川县', '3', '154300', '0454', '230826', 'Huachuan', '130.7189300', '47.0229700');
INSERT INTO `sys_cn_area` VALUES ('756', '汤原县', '汤原', '749', null, '中国,黑龙江省,佳木斯市,汤原县', '3', '154700', '0454', '230828', 'Tangyuan', '129.9096600', '46.7275500');
INSERT INTO `sys_cn_area` VALUES ('757', '抚远县', '抚远', '749', null, '中国,黑龙江省,佳木斯市,抚远县', '3', '156500', '0454', '230833', 'Fuyuan', '134.2959500', '48.3679400');
INSERT INTO `sys_cn_area` VALUES ('758', '同江市', '同江', '749', null, '中国,黑龙江省,佳木斯市,同江市', '3', '156400', '0454', '230881', 'Tongjiang', '132.5109500', '47.6421100');
INSERT INTO `sys_cn_area` VALUES ('759', '富锦市', '富锦', '749', null, '中国,黑龙江省,佳木斯市,富锦市', '3', '156100', '0454', '230882', 'Fujin', '132.0370700', '47.2513200');
INSERT INTO `sys_cn_area` VALUES ('760', '七台河市', '七台河', '656', null, '中国,黑龙江省,七台河市', '2', '154600', '0464', '230900', 'Qitaihe', '131.0155840', '45.7712660');
INSERT INTO `sys_cn_area` VALUES ('761', '新兴区', '新兴', '760', null, '中国,黑龙江省,七台河市,新兴区', '3', '154604', '0464', '230902', 'Xinxing', '130.9321200', '45.8162400');
INSERT INTO `sys_cn_area` VALUES ('762', '桃山区', '桃山', '760', null, '中国,黑龙江省,七台河市,桃山区', '3', '154600', '0464', '230903', 'Taoshan', '131.0178600', '45.7678200');
INSERT INTO `sys_cn_area` VALUES ('763', '茄子河区', '茄子河', '760', null, '中国,黑龙江省,七台河市,茄子河区', '3', '154622', '0464', '230904', 'Qiezihe', '131.0680700', '45.7851900');
INSERT INTO `sys_cn_area` VALUES ('764', '勃利县', '勃利', '760', null, '中国,黑龙江省,七台河市,勃利县', '3', '154500', '0464', '230921', 'Boli', '130.5917900', '45.7550000');
INSERT INTO `sys_cn_area` VALUES ('765', '牡丹江市', '牡丹江', '656', null, '中国,黑龙江省,牡丹江市', '2', '157000', '0453', '231000', 'Mudanjiang', '129.6186020', '44.5829620');
INSERT INTO `sys_cn_area` VALUES ('766', '东安区', '东安', '765', null, '中国,黑龙江省,牡丹江市,东安区', '3', '157000', '0453', '231002', 'Dong\'an', '129.6266500', '44.5813300');
INSERT INTO `sys_cn_area` VALUES ('767', '阳明区', '阳明', '765', null, '中国,黑龙江省,牡丹江市,阳明区', '3', '157013', '0453', '231003', 'Yangming', '129.6354700', '44.5960300');
INSERT INTO `sys_cn_area` VALUES ('768', '爱民区', '爱民', '765', null, '中国,黑龙江省,牡丹江市,爱民区', '3', '157009', '0453', '231004', 'Aimin', '129.5907700', '44.5964800');
INSERT INTO `sys_cn_area` VALUES ('769', '西安区', '西安', '765', null, '中国,黑龙江省,牡丹江市,西安区', '3', '157000', '0453', '231005', 'Xi\'an', '129.6161600', '44.5776600');
INSERT INTO `sys_cn_area` VALUES ('770', '东宁县', '东宁', '765', null, '中国,黑龙江省,牡丹江市,东宁县', '3', '157200', '0453', '231024', 'Dongning', '131.1279300', '44.0661000');
INSERT INTO `sys_cn_area` VALUES ('771', '林口县', '林口', '765', null, '中国,黑龙江省,牡丹江市,林口县', '3', '157600', '0453', '231025', 'Linkou', '130.2839300', '45.2780900');
INSERT INTO `sys_cn_area` VALUES ('772', '绥芬河市', '绥芬河', '765', null, '中国,黑龙江省,牡丹江市,绥芬河市', '3', '157300', '0453', '231081', 'Suifenhe', '131.1513900', '44.4124900');
INSERT INTO `sys_cn_area` VALUES ('773', '海林市', '海林', '765', null, '中国,黑龙江省,牡丹江市,海林市', '3', '157100', '0453', '231083', 'Hailin', '129.3815600', '44.5900000');
INSERT INTO `sys_cn_area` VALUES ('774', '宁安市', '宁安', '765', null, '中国,黑龙江省,牡丹江市,宁安市', '3', '157400', '0453', '231084', 'Ning\'an', '129.4830300', '44.3401600');
INSERT INTO `sys_cn_area` VALUES ('775', '穆棱市', '穆棱', '765', null, '中国,黑龙江省,牡丹江市,穆棱市', '3', '157500', '0453', '231085', 'Muling', '130.5246500', '44.9190000');
INSERT INTO `sys_cn_area` VALUES ('776', '黑河市', '黑河', '656', null, '中国,黑龙江省,黑河市', '2', '164300', '0456', '231100', 'Heihe', '127.4990230', '50.2495850');
INSERT INTO `sys_cn_area` VALUES ('777', '爱辉区', '爱辉', '776', null, '中国,黑龙江省,黑河市,爱辉区', '3', '164300', '0456', '231102', 'Aihui', '127.5007400', '50.2520200');
INSERT INTO `sys_cn_area` VALUES ('778', '嫩江县', '嫩江', '776', null, '中国,黑龙江省,黑河市,嫩江县', '3', '161400', '0456', '231121', 'Nenjiang', '125.2260700', '49.1784400');
INSERT INTO `sys_cn_area` VALUES ('779', '逊克县', '逊克', '776', null, '中国,黑龙江省,黑河市,逊克县', '3', '164400', '0456', '231123', 'Xunke', '128.4788200', '49.5798300');
INSERT INTO `sys_cn_area` VALUES ('780', '孙吴县', '孙吴', '776', null, '中国,黑龙江省,黑河市,孙吴县', '3', '164200', '0456', '231124', 'Sunwu', '127.3359900', '49.4253900');
INSERT INTO `sys_cn_area` VALUES ('781', '北安市', '北安', '776', null, '中国,黑龙江省,黑河市,北安市', '3', '164000', '0456', '231181', 'Bei\'an', '126.4819300', '48.2387200');
INSERT INTO `sys_cn_area` VALUES ('782', '五大连池市', '五大连池', '776', null, '中国,黑龙江省,黑河市,五大连池市', '3', '164100', '0456', '231182', 'Wudalianchi', '126.2029400', '48.5150700');
INSERT INTO `sys_cn_area` VALUES ('783', '绥化市', '绥化', '656', null, '中国,黑龙江省,绥化市', '2', '152000', '0455', '231200', 'Suihua', '126.9929300', '46.6373930');
INSERT INTO `sys_cn_area` VALUES ('784', '北林区', '北林', '783', null, '中国,黑龙江省,绥化市,北林区', '3', '152000', '0455', '231202', 'Beilin', '126.9856400', '46.6373500');
INSERT INTO `sys_cn_area` VALUES ('785', '望奎县', '望奎', '783', null, '中国,黑龙江省,绥化市,望奎县', '3', '152100', '0455', '231221', 'Wangkui', '126.4818700', '46.8307900');
INSERT INTO `sys_cn_area` VALUES ('786', '兰西县', '兰西', '783', null, '中国,黑龙江省,绥化市,兰西县', '3', '151500', '0455', '231222', 'Lanxi', '126.2899400', '46.2525000');
INSERT INTO `sys_cn_area` VALUES ('787', '青冈县', '青冈', '783', null, '中国,黑龙江省,绥化市,青冈县', '3', '151600', '0455', '231223', 'Qinggang', '126.1132500', '46.6853400');
INSERT INTO `sys_cn_area` VALUES ('788', '庆安县', '庆安', '783', null, '中国,黑龙江省,绥化市,庆安县', '3', '152400', '0455', '231224', 'Qing\'an', '127.5075300', '46.8801600');
INSERT INTO `sys_cn_area` VALUES ('789', '明水县', '明水', '783', null, '中国,黑龙江省,绥化市,明水县', '3', '151700', '0455', '231225', 'Mingshui', '125.9059400', '47.1732700');
INSERT INTO `sys_cn_area` VALUES ('790', '绥棱县', '绥棱', '783', null, '中国,黑龙江省,绥化市,绥棱县', '3', '152200', '0455', '231226', 'Suileng', '127.1158400', '47.2426700');
INSERT INTO `sys_cn_area` VALUES ('791', '安达市', '安达', '783', null, '中国,黑龙江省,绥化市,安达市', '3', '151400', '0455', '231281', 'Anda', '125.3437500', '46.4177000');
INSERT INTO `sys_cn_area` VALUES ('792', '肇东市', '肇东', '783', null, '中国,黑龙江省,绥化市,肇东市', '3', '151100', '0455', '231282', 'Zhaodong', '125.9624300', '46.0513100');
INSERT INTO `sys_cn_area` VALUES ('793', '海伦市', '海伦', '783', null, '中国,黑龙江省,绥化市,海伦市', '3', '152300', '0455', '231283', 'Hailun', '126.9682000', '47.4609300');
INSERT INTO `sys_cn_area` VALUES ('794', '大兴安岭地区', '大兴安岭', '656', null, '中国,黑龙江省,大兴安岭地区', '2', '165000', '0457', '232700', 'DaXingAnLing', '124.7115260', '52.3352620');
INSERT INTO `sys_cn_area` VALUES ('795', '加格达奇区', '加格达奇', '794', null, '中国,黑龙江省,大兴安岭地区,加格达奇区', '3', '165000', '0457', '232701', 'Jiagedaqi', '124.3095400', '51.9814400');
INSERT INTO `sys_cn_area` VALUES ('796', '新林区', '新林', '794', null, '中国,黑龙江省,大兴安岭地区,新林区', '3', '165000', '0457', '232702', 'Xinlin', '124.3979830', '51.6734100');
INSERT INTO `sys_cn_area` VALUES ('797', '松岭区', '松岭', '794', null, '中国,黑龙江省,大兴安岭地区,松岭区', '3', '165000', '0457', '232703', 'Songling', '124.1897130', '51.9854530');
INSERT INTO `sys_cn_area` VALUES ('798', '呼中区', '呼中', '794', null, '中国,黑龙江省,大兴安岭地区,呼中区', '3', '165000', '0457', '232704', 'Huzhong', '123.6000900', '52.0334600');
INSERT INTO `sys_cn_area` VALUES ('799', '呼玛县', '呼玛', '794', null, '中国,黑龙江省,大兴安岭地区,呼玛县', '3', '165100', '0457', '232721', 'Huma', '126.6617400', '51.7311200');
INSERT INTO `sys_cn_area` VALUES ('800', '塔河县', '塔河', '794', null, '中国,黑龙江省,大兴安岭地区,塔河县', '3', '165200', '0457', '232722', 'Tahe', '124.7099900', '52.3343100');
INSERT INTO `sys_cn_area` VALUES ('801', '漠河县', '漠河', '794', null, '中国,黑龙江省,大兴安岭地区,漠河县', '3', '165300', '0457', '232723', 'Mohe', '122.5375900', '52.9700300');
INSERT INTO `sys_cn_area` VALUES ('802', '上海', '上海', '1', null, '中国,上海', '1', null, '', '310000', 'Shanghai', '121.4726440', '31.2317060');
INSERT INTO `sys_cn_area` VALUES ('803', '上海市', '上海', '802', null, '中国,上海,上海市', '2', '200000', '021', '310100', 'Shanghai', '121.4726440', '31.2317060');
INSERT INTO `sys_cn_area` VALUES ('804', '黄浦区', '黄浦', '803', null, '中国,上海,上海市,黄浦区', '3', '200001', '021', '310101', 'Huangpu', '121.4929500', '31.2233700');
INSERT INTO `sys_cn_area` VALUES ('805', '徐汇区', '徐汇', '803', null, '中国,上海,上海市,徐汇区', '3', '200030', '021', '310104', 'Xuhui', '121.4367600', '31.1883100');
INSERT INTO `sys_cn_area` VALUES ('806', '长宁区', '长宁', '803', null, '中国,上海,上海市,长宁区', '3', '200050', '021', '310105', 'Changning', '121.4246200', '31.2203600');
INSERT INTO `sys_cn_area` VALUES ('807', '静安区', '静安', '803', null, '中国,上海,上海市,静安区', '3', '200040', '021', '310106', 'Jing\'an', '121.4444000', '31.2288400');
INSERT INTO `sys_cn_area` VALUES ('808', '普陀区', '普陀', '803', null, '中国,上海,上海市,普陀区', '3', '200333', '021', '310107', 'Putuo', '121.3970300', '31.2495100');
INSERT INTO `sys_cn_area` VALUES ('809', '闸北区', '闸北', '803', null, '中国,上海,上海市,闸北区', '3', '200070', '021', '310108', 'Zhabei', '121.4463600', '31.2807500');
INSERT INTO `sys_cn_area` VALUES ('810', '虹口区', '虹口', '803', null, '中国,上海,上海市,虹口区', '3', '200086', '021', '310109', 'Hongkou', '121.4816200', '31.2778800');
INSERT INTO `sys_cn_area` VALUES ('811', '杨浦区', '杨浦', '803', null, '中国,上海,上海市,杨浦区', '3', '200082', '021', '310110', 'Yangpu', '121.5260000', '31.2595000');
INSERT INTO `sys_cn_area` VALUES ('812', '闵行区', '闵行', '803', null, '中国,上海,上海市,闵行区', '3', '201100', '021', '310112', 'Minhang', '121.3816200', '31.1124600');
INSERT INTO `sys_cn_area` VALUES ('813', '宝山区', '宝山', '803', null, '中国,上海,上海市,宝山区', '3', '201900', '021', '310113', 'Baoshan', '121.4891000', '31.4045000');
INSERT INTO `sys_cn_area` VALUES ('814', '嘉定区', '嘉定', '803', null, '中国,上海,上海市,嘉定区', '3', '201800', '021', '310114', 'Jiading', '121.2655000', '31.3747300');
INSERT INTO `sys_cn_area` VALUES ('815', '浦东新区', '浦东', '803', null, '中国,上海,上海市,浦东新区', '3', '200135', '021', '310115', 'Pudong', '121.5447000', '31.2224900');
INSERT INTO `sys_cn_area` VALUES ('816', '金山区', '金山', '803', null, '中国,上海,上海市,金山区', '3', '200540', '021', '310116', 'Jinshan', '121.3416400', '30.7416300');
INSERT INTO `sys_cn_area` VALUES ('817', '松江区', '松江', '803', null, '中国,上海,上海市,松江区', '3', '201600', '021', '310117', 'Songjiang', '121.2287900', '31.0322200');
INSERT INTO `sys_cn_area` VALUES ('818', '青浦区', '青浦', '803', null, '中国,上海,上海市,青浦区', '3', '201700', '021', '310118', 'Qingpu', '121.1241700', '31.1497400');
INSERT INTO `sys_cn_area` VALUES ('819', '奉贤区', '奉贤', '803', null, '中国,上海,上海市,奉贤区', '3', '201400', '021', '310120', 'Fengxian', '121.4741200', '30.9179000');
INSERT INTO `sys_cn_area` VALUES ('820', '崇明县', '崇明', '803', null, '中国,上海,上海市,崇明县', '3', '202150', '021', '310230', 'Chongming', '121.3975800', '31.6227800');
INSERT INTO `sys_cn_area` VALUES ('821', '江苏省', '江苏', '1', null, '中国,江苏省', '1', null, '', '320000', 'Jiangsu', '118.7674130', '32.0415440');
INSERT INTO `sys_cn_area` VALUES ('822', '南京市', '南京', '821', null, '中国,江苏省,南京市', '2', '210008', '025', '320100', 'Nanjing', '118.7674130', '32.0415440');
INSERT INTO `sys_cn_area` VALUES ('823', '玄武区', '玄武', '822', null, '中国,江苏省,南京市,玄武区', '3', '210018', '025', '320102', 'Xuanwu', '118.7977200', '32.0485600');
INSERT INTO `sys_cn_area` VALUES ('824', '秦淮区', '秦淮', '822', null, '中国,江苏省,南京市,秦淮区', '3', '210001', '025', '320104', 'Qinhuai', '118.7981500', '32.0111200');
INSERT INTO `sys_cn_area` VALUES ('825', '建邺区', '建邺', '822', null, '中国,江苏省,南京市,建邺区', '3', '210004', '025', '320105', 'Jianye', '118.7664100', '32.0309600');
INSERT INTO `sys_cn_area` VALUES ('826', '鼓楼区', '鼓楼', '822', null, '中国,江苏省,南京市,鼓楼区', '3', '210009', '025', '320106', 'Gulou', '118.7697400', '32.0663200');
INSERT INTO `sys_cn_area` VALUES ('827', '浦口区', '浦口', '822', null, '中国,江苏省,南京市,浦口区', '3', '211800', '025', '320111', 'Pukou', '118.6280200', '32.0588100');
INSERT INTO `sys_cn_area` VALUES ('828', '栖霞区', '栖霞', '822', null, '中国,江苏省,南京市,栖霞区', '3', '210046', '025', '320113', 'Qixia', '118.8806400', '32.1135200');
INSERT INTO `sys_cn_area` VALUES ('829', '雨花台区', '雨花台', '822', null, '中国,江苏省,南京市,雨花台区', '3', '210012', '025', '320114', 'Yuhuatai', '118.7799000', '31.9920200');
INSERT INTO `sys_cn_area` VALUES ('830', '江宁区', '江宁', '822', null, '中国,江苏省,南京市,江宁区', '3', '211100', '025', '320115', 'Jiangning', '118.8399000', '31.9526300');
INSERT INTO `sys_cn_area` VALUES ('831', '六合区', '六合', '822', null, '中国,江苏省,南京市,六合区', '3', '211500', '025', '320116', 'Luhe', '118.8413000', '32.3422200');
INSERT INTO `sys_cn_area` VALUES ('832', '溧水区', '溧水', '822', null, '中国,江苏省,南京市,溧水区', '3', '211200', '025', '320117', 'Lishui', '119.0287320', '31.6530610');
INSERT INTO `sys_cn_area` VALUES ('833', '高淳区', '高淳', '822', null, '中国,江苏省,南京市,高淳区', '3', '211300', '025', '320118', 'Gaochun', '118.8758900', '31.3271320');
INSERT INTO `sys_cn_area` VALUES ('834', '无锡市', '无锡', '821', null, '中国,江苏省,无锡市', '2', '214000', '0510', '320200', 'Wuxi', '120.3016630', '31.5747290');
INSERT INTO `sys_cn_area` VALUES ('835', '崇安区', '崇安', '834', null, '中国,江苏省,无锡市,崇安区', '3', '214001', '0510', '320202', 'Chong\'an', '120.2997500', '31.5800200');
INSERT INTO `sys_cn_area` VALUES ('836', '南长区', '南长', '834', null, '中国,江苏省,无锡市,南长区', '3', '214021', '0510', '320203', 'Nanchang', '120.3087300', '31.5635900');
INSERT INTO `sys_cn_area` VALUES ('837', '北塘区', '北塘', '834', null, '中国,江苏省,无锡市,北塘区', '3', '214044', '0510', '320204', 'Beitang', '120.2940500', '31.6059200');
INSERT INTO `sys_cn_area` VALUES ('838', '锡山区', '锡山', '834', null, '中国,江苏省,无锡市,锡山区', '3', '214101', '0510', '320205', 'Xishan', '120.3569900', '31.5886000');
INSERT INTO `sys_cn_area` VALUES ('839', '惠山区', '惠山', '834', null, '中国,江苏省,无锡市,惠山区', '3', '214174', '0510', '320206', 'Huishan', '120.2984900', '31.6808800');
INSERT INTO `sys_cn_area` VALUES ('840', '滨湖区', '滨湖', '834', null, '中国,江苏省,无锡市,滨湖区', '3', '214123', '0510', '320211', 'Binhu', '120.2946100', '31.5216200');
INSERT INTO `sys_cn_area` VALUES ('841', '江阴市', '江阴', '834', null, '中国,江苏省,无锡市,江阴市', '3', '214431', '0510', '320281', 'Jiangyin', '120.2853000', '31.9199600');
INSERT INTO `sys_cn_area` VALUES ('842', '宜兴市', '宜兴', '834', null, '中国,江苏省,无锡市,宜兴市', '3', '214200', '0510', '320282', 'Yixing', '119.8235700', '31.3397800');
INSERT INTO `sys_cn_area` VALUES ('843', '徐州市', '徐州', '821', null, '中国,江苏省,徐州市', '2', '221003', '0516', '320300', 'Xuzhou', '117.1848110', '34.2617920');
INSERT INTO `sys_cn_area` VALUES ('844', '鼓楼区', '鼓楼', '843', null, '中国,江苏省,徐州市,鼓楼区', '3', '221005', '0516', '320302', 'Gulou', '117.1855900', '34.2885100');
INSERT INTO `sys_cn_area` VALUES ('845', '云龙区', '云龙', '843', null, '中国,江苏省,徐州市,云龙区', '3', '221007', '0516', '320303', 'Yunlong', '117.2305300', '34.2489500');
INSERT INTO `sys_cn_area` VALUES ('846', '贾汪区', '贾汪', '843', null, '中国,江苏省,徐州市,贾汪区', '3', '221003', '0516', '320305', 'Jiawang', '117.4534600', '34.4426400');
INSERT INTO `sys_cn_area` VALUES ('847', '泉山区', '泉山', '843', null, '中国,江苏省,徐州市,泉山区', '3', '221006', '0516', '320311', 'Quanshan', '117.1937800', '34.2441800');
INSERT INTO `sys_cn_area` VALUES ('848', '铜山区', '铜山', '843', null, '中国,江苏省,徐州市,铜山区', '3', '221106', '0516', '320312', 'Tongshan', '117.1838940', '34.1928800');
INSERT INTO `sys_cn_area` VALUES ('849', '丰县', '丰县', '843', null, '中国,江苏省,徐州市,丰县', '3', '221700', '0516', '320321', 'Fengxian', '116.5995700', '34.6997200');
INSERT INTO `sys_cn_area` VALUES ('850', '沛县', '沛县', '843', null, '中国,江苏省,徐州市,沛县', '3', '221600', '0516', '320322', 'Peixian', '116.9374300', '34.7216300');
INSERT INTO `sys_cn_area` VALUES ('851', '睢宁县', '睢宁', '843', null, '中国,江苏省,徐州市,睢宁县', '3', '221200', '0516', '320324', 'Suining', '117.9410400', '33.9126900');
INSERT INTO `sys_cn_area` VALUES ('852', '新沂市', '新沂', '843', null, '中国,江苏省,徐州市,新沂市', '3', '221400', '0516', '320381', 'Xinyi', '118.3545200', '34.3694200');
INSERT INTO `sys_cn_area` VALUES ('853', '邳州市', '邳州', '843', null, '中国,江苏省,徐州市,邳州市', '3', '221300', '0516', '320382', 'Pizhou', '117.9585800', '34.3332900');
INSERT INTO `sys_cn_area` VALUES ('854', '常州市', '常州', '821', null, '中国,江苏省,常州市', '2', '213000', '0519', '320400', 'Changzhou', '119.9469730', '31.7727520');
INSERT INTO `sys_cn_area` VALUES ('855', '天宁区', '天宁', '854', null, '中国,江苏省,常州市,天宁区', '3', '213000', '0519', '320402', 'Tianning', '119.9513200', '31.7521100');
INSERT INTO `sys_cn_area` VALUES ('856', '钟楼区', '钟楼', '854', null, '中国,江苏省,常州市,钟楼区', '3', '213023', '0519', '320404', 'Zhonglou', '119.9017800', '31.8022100');
INSERT INTO `sys_cn_area` VALUES ('857', '戚墅堰区', '戚墅堰', '854', null, '中国,江苏省,常州市,戚墅堰区', '3', '213025', '0519', '320405', 'Qishuyan', '120.0610600', '31.7195600');
INSERT INTO `sys_cn_area` VALUES ('858', '新北区', '新北', '854', null, '中国,江苏省,常州市,新北区', '3', '213022', '0519', '320411', 'Xinbei', '119.9713100', '31.8304600');
INSERT INTO `sys_cn_area` VALUES ('859', '武进区', '武进', '854', null, '中国,江苏省,常州市,武进区', '3', '213100', '0519', '320412', 'Wujin', '119.9424400', '31.7008600');
INSERT INTO `sys_cn_area` VALUES ('860', '溧阳市', '溧阳', '854', null, '中国,江苏省,常州市,溧阳市', '3', '213300', '0519', '320481', 'Liyang', '119.4837000', '31.4153800');
INSERT INTO `sys_cn_area` VALUES ('861', '金坛市', '金坛', '854', null, '中国,江苏省,常州市,金坛市', '3', '213200', '0519', '320482', 'Jintan', '119.5775700', '31.7404300');
INSERT INTO `sys_cn_area` VALUES ('862', '苏州市', '苏州', '821', null, '中国,江苏省,苏州市', '2', '215002', '0512', '320500', 'Suzhou', '120.6195850', '31.2993790');
INSERT INTO `sys_cn_area` VALUES ('863', '虎丘区', '虎丘', '862', null, '中国,江苏省,苏州市,虎丘区', '3', '215004', '0512', '320505', 'Huqiu', '120.5734500', '31.2953000');
INSERT INTO `sys_cn_area` VALUES ('864', '吴中区', '吴中', '862', null, '中国,江苏省,苏州市,吴中区', '3', '215128', '0512', '320506', 'Wuzhong', '120.6321100', '31.2622600');
INSERT INTO `sys_cn_area` VALUES ('865', '相城区', '相城', '862', null, '中国,江苏省,苏州市,相城区', '3', '215131', '0512', '320507', 'Xiangcheng', '120.6423900', '31.3688900');
INSERT INTO `sys_cn_area` VALUES ('866', '姑苏区', '姑苏', '862', null, '中国,江苏省,苏州市,姑苏区', '3', '215031', '0512', '320508', 'Gusu', '120.6195850', '31.2993790');
INSERT INTO `sys_cn_area` VALUES ('867', '吴江区', '吴江', '862', null, '中国,江苏省,苏州市,吴江区', '3', '215200', '0512', '320509', 'Wujiang', '120.6383170', '31.1598150');
INSERT INTO `sys_cn_area` VALUES ('868', '常熟市', '常熟', '862', null, '中国,江苏省,苏州市,常熟市', '3', '215500', '0512', '320581', 'Changshu', '120.7522500', '31.6537400');
INSERT INTO `sys_cn_area` VALUES ('869', '张家港市', '张家港', '862', null, '中国,江苏省,苏州市,张家港市', '3', '215600', '0512', '320582', 'Zhangjiagang', '120.5553800', '31.8753200');
INSERT INTO `sys_cn_area` VALUES ('870', '昆山市', '昆山', '862', null, '中国,江苏省,苏州市,昆山市', '3', '215300', '0512', '320583', 'Kunshan', '120.9807400', '31.3846400');
INSERT INTO `sys_cn_area` VALUES ('871', '太仓市', '太仓', '862', null, '中国,江苏省,苏州市,太仓市', '3', '215400', '0512', '320585', 'Taicang', '121.1089100', '31.4497000');
INSERT INTO `sys_cn_area` VALUES ('872', '南通市', '南通', '821', null, '中国,江苏省,南通市', '2', '226001', '0513', '320600', 'Nantong', '120.8646080', '32.0162120');
INSERT INTO `sys_cn_area` VALUES ('873', '崇川区', '崇川', '872', null, '中国,江苏省,南通市,崇川区', '3', '226001', '0513', '320602', 'Chongchuan', '120.8573000', '32.0098000');
INSERT INTO `sys_cn_area` VALUES ('874', '港闸区', '港闸', '872', null, '中国,江苏省,南通市,港闸区', '3', '226001', '0513', '320611', 'Gangzha', '120.8177800', '32.0316300');
INSERT INTO `sys_cn_area` VALUES ('875', '通州区', '通州', '872', null, '中国,江苏省,南通市,通州区', '3', '226300', '0513', '320612', 'Tongzhou', '121.0729300', '32.0676000');
INSERT INTO `sys_cn_area` VALUES ('876', '海安县', '海安', '872', null, '中国,江苏省,南通市,海安县', '3', '226600', '0513', '320621', 'Hai\'an', '120.4585200', '32.5451400');
INSERT INTO `sys_cn_area` VALUES ('877', '如东县', '如东', '872', null, '中国,江苏省,南通市,如东县', '3', '226400', '0513', '320623', 'Rudong', '121.1894200', '32.3143900');
INSERT INTO `sys_cn_area` VALUES ('878', '启东市', '启东', '872', null, '中国,江苏省,南通市,启东市', '3', '226200', '0513', '320681', 'Qidong', '121.6598500', '31.8108300');
INSERT INTO `sys_cn_area` VALUES ('879', '如皋市', '如皋', '872', null, '中国,江苏省,南通市,如皋市', '3', '226500', '0513', '320682', 'Rugao', '120.5596900', '32.3759700');
INSERT INTO `sys_cn_area` VALUES ('880', '海门市', '海门', '872', null, '中国,江苏省,南通市,海门市', '3', '226100', '0513', '320684', 'Haimen', '121.1699500', '31.8942200');
INSERT INTO `sys_cn_area` VALUES ('881', '连云港市', '连云港', '821', null, '中国,江苏省,连云港市', '2', '222002', '0518', '320700', 'Lianyungang', '119.1788210', '34.6000180');
INSERT INTO `sys_cn_area` VALUES ('882', '连云区', '连云', '881', null, '中国,江苏省,连云港市,连云区', '3', '222042', '0518', '320703', 'Lianyun', '119.3730400', '34.7529300');
INSERT INTO `sys_cn_area` VALUES ('883', '海州区', '海州', '881', null, '中国,江苏省,连云港市,海州区', '3', '222003', '0518', '320706', 'Haizhou', '119.1312800', '34.5698600');
INSERT INTO `sys_cn_area` VALUES ('884', '赣榆区', '赣榆', '881', null, '中国,江苏省,连云港市,赣榆区', '3', '222100', '0518', '320707', 'Ganyu', '119.1287740', '34.8391540');
INSERT INTO `sys_cn_area` VALUES ('885', '东海县', '东海', '881', null, '中国,江苏省,连云港市,东海县', '3', '222300', '0518', '320722', 'Donghai', '118.7714500', '34.5421500');
INSERT INTO `sys_cn_area` VALUES ('886', '灌云县', '灌云', '881', null, '中国,江苏省,连云港市,灌云县', '3', '222200', '0518', '320723', 'Guanyun', '119.2392500', '34.2839100');
INSERT INTO `sys_cn_area` VALUES ('887', '灌南县', '灌南', '881', null, '中国,江苏省,连云港市,灌南县', '3', '222500', '0518', '320724', 'Guannan', '119.3563200', '34.0900000');
INSERT INTO `sys_cn_area` VALUES ('888', '淮安市', '淮安', '821', null, '中国,江苏省,淮安市', '2', '223001', '0517', '320800', 'Huai\'an', '119.0212650', '33.5975060');
INSERT INTO `sys_cn_area` VALUES ('889', '清河区', '清河', '888', null, '中国,江苏省,淮安市,清河区', '3', '223001', '0517', '320802', 'Qinghe', '119.0077800', '33.5994900');
INSERT INTO `sys_cn_area` VALUES ('890', '淮安区', '淮安', '888', null, '中国,江苏省,淮安市,淮安区', '3', '223200', '0517', '320803', 'Huai\'an', '119.0212650', '33.5975060');
INSERT INTO `sys_cn_area` VALUES ('891', '淮阴区', '淮阴', '888', null, '中国,江苏省,淮安市,淮阴区', '3', '223300', '0517', '320804', 'Huaiyin', '119.0348500', '33.6317100');
INSERT INTO `sys_cn_area` VALUES ('892', '清浦区', '清浦', '888', null, '中国,江苏省,淮安市,清浦区', '3', '223002', '0517', '320811', 'Qingpu', '119.0264800', '33.5523200');
INSERT INTO `sys_cn_area` VALUES ('893', '涟水县', '涟水', '888', null, '中国,江苏省,淮安市,涟水县', '3', '223400', '0517', '320826', 'Lianshui', '119.2608300', '33.7809400');
INSERT INTO `sys_cn_area` VALUES ('894', '洪泽县', '洪泽', '888', null, '中国,江苏省,淮安市,洪泽县', '3', '223100', '0517', '320829', 'Hongze', '118.8734400', '33.2942900');
INSERT INTO `sys_cn_area` VALUES ('895', '盱眙县', '盱眙', '888', null, '中国,江苏省,淮安市,盱眙县', '3', '211700', '0517', '320830', 'Xuyi', '118.5449500', '33.0108600');
INSERT INTO `sys_cn_area` VALUES ('896', '金湖县', '金湖', '888', null, '中国,江苏省,淮安市,金湖县', '3', '211600', '0517', '320831', 'Jinhu', '119.0230700', '33.0221900');
INSERT INTO `sys_cn_area` VALUES ('897', '盐城市', '盐城', '821', null, '中国,江苏省,盐城市', '2', '224005', '0515', '320900', 'Yancheng', '120.1399980', '33.3776310');
INSERT INTO `sys_cn_area` VALUES ('898', '亭湖区', '亭湖', '897', null, '中国,江苏省,盐城市,亭湖区', '3', '224005', '0515', '320902', 'Tinghu', '120.1658300', '33.3782500');
INSERT INTO `sys_cn_area` VALUES ('899', '盐都区', '盐都', '897', null, '中国,江苏省,盐城市,盐都区', '3', '224055', '0515', '320903', 'Yandu', '120.1544100', '33.3373000');
INSERT INTO `sys_cn_area` VALUES ('900', '响水县', '响水', '897', null, '中国,江苏省,盐城市,响水县', '3', '224600', '0515', '320921', 'Xiangshui', '119.5698500', '34.2051300');
INSERT INTO `sys_cn_area` VALUES ('901', '滨海县', '滨海', '897', null, '中国,江苏省,盐城市,滨海县', '3', '224500', '0515', '320922', 'Binhai', '119.8205800', '33.9897200');
INSERT INTO `sys_cn_area` VALUES ('902', '阜宁县', '阜宁', '897', null, '中国,江苏省,盐城市,阜宁县', '3', '224400', '0515', '320923', 'Funing', '119.8017500', '33.7822800');
INSERT INTO `sys_cn_area` VALUES ('903', '射阳县', '射阳', '897', null, '中国,江苏省,盐城市,射阳县', '3', '224300', '0515', '320924', 'Sheyang', '120.2604300', '33.7763600');
INSERT INTO `sys_cn_area` VALUES ('904', '建湖县', '建湖', '897', null, '中国,江苏省,盐城市,建湖县', '3', '224700', '0515', '320925', 'Jianhu', '119.7985200', '33.4724100');
INSERT INTO `sys_cn_area` VALUES ('905', '东台市', '东台', '897', null, '中国,江苏省,盐城市,东台市', '3', '224200', '0515', '320981', 'Dongtai', '120.3237600', '32.8507800');
INSERT INTO `sys_cn_area` VALUES ('906', '大丰市', '大丰', '897', null, '中国,江苏省,盐城市,大丰市', '3', '224100', '0515', '320982', 'Dafeng', '120.4659400', '33.1989300');
INSERT INTO `sys_cn_area` VALUES ('907', '扬州市', '扬州', '821', null, '中国,江苏省,扬州市', '2', '225002', '0514', '321000', 'Yangzhou', '119.4210030', '32.3931590');
INSERT INTO `sys_cn_area` VALUES ('908', '广陵区', '广陵', '907', null, '中国,江苏省,扬州市,广陵区', '3', '225002', '0514', '321002', 'Guangling', '119.4318600', '32.3947200');
INSERT INTO `sys_cn_area` VALUES ('909', '邗江区', '邗江', '907', null, '中国,江苏省,扬州市,邗江区', '3', '225002', '0514', '321003', 'Hanjiang', '119.3981600', '32.3765000');
INSERT INTO `sys_cn_area` VALUES ('910', '江都区', '江都', '907', null, '中国,江苏省,扬州市,江都区', '3', '225200', '0514', '321012', 'Jiangdu', '119.5674810', '32.4265640');
INSERT INTO `sys_cn_area` VALUES ('911', '宝应县', '宝应', '907', null, '中国,江苏省,扬州市,宝应县', '3', '225800', '0514', '321023', 'Baoying', '119.3121300', '33.2354900');
INSERT INTO `sys_cn_area` VALUES ('912', '仪征市', '仪征', '907', null, '中国,江苏省,扬州市,仪征市', '3', '211400', '0514', '321081', 'Yizheng', '119.1843200', '32.2719700');
INSERT INTO `sys_cn_area` VALUES ('913', '高邮市', '高邮', '907', null, '中国,江苏省,扬州市,高邮市', '3', '225600', '0514', '321084', 'Gaoyou', '119.4596500', '32.7813500');
INSERT INTO `sys_cn_area` VALUES ('914', '镇江市', '镇江', '821', null, '中国,江苏省,镇江市', '2', '212004', '0511', '321100', 'Zhenjiang', '119.4527530', '32.2044020');
INSERT INTO `sys_cn_area` VALUES ('915', '京口区', '京口', '914', null, '中国,江苏省,镇江市,京口区', '3', '212003', '0511', '321102', 'Jingkou', '119.4694700', '32.1980900');
INSERT INTO `sys_cn_area` VALUES ('916', '润州区', '润州', '914', null, '中国,江苏省,镇江市,润州区', '3', '212005', '0511', '321111', 'Runzhou', '119.4113400', '32.1952300');
INSERT INTO `sys_cn_area` VALUES ('917', '丹徒区', '丹徒', '914', null, '中国,江苏省,镇江市,丹徒区', '3', '212028', '0511', '321112', 'Dantu', '119.4338300', '32.1318300');
INSERT INTO `sys_cn_area` VALUES ('918', '丹阳市', '丹阳', '914', null, '中国,江苏省,镇江市,丹阳市', '3', '212300', '0511', '321181', 'Danyang', '119.5752500', '31.9912100');
INSERT INTO `sys_cn_area` VALUES ('919', '扬中市', '扬中', '914', null, '中国,江苏省,镇江市,扬中市', '3', '212200', '0511', '321182', 'Yangzhong', '119.7971800', '32.2363000');
INSERT INTO `sys_cn_area` VALUES ('920', '句容市', '句容', '914', null, '中国,江苏省,镇江市,句容市', '3', '212400', '0511', '321183', 'Jurong', '119.1648200', '31.9559100');
INSERT INTO `sys_cn_area` VALUES ('921', '泰州市', '泰州', '821', null, '中国,江苏省,泰州市', '2', '225300', '0523', '321200', 'Taizhou', '119.9151760', '32.4848820');
INSERT INTO `sys_cn_area` VALUES ('922', '海陵区', '海陵', '921', null, '中国,江苏省,泰州市,海陵区', '3', '225300', '0523', '321202', 'Hailing', '119.9194200', '32.4910100');
INSERT INTO `sys_cn_area` VALUES ('923', '高港区', '高港', '921', null, '中国,江苏省,泰州市,高港区', '3', '225321', '0523', '321203', 'Gaogang', '119.8808900', '32.3183300');
INSERT INTO `sys_cn_area` VALUES ('924', '姜堰区', '姜堰', '921', null, '中国,江苏省,泰州市,姜堰区', '3', '225500', '0523', '321204', 'Jiangyan', '120.1482080', '32.5084830');
INSERT INTO `sys_cn_area` VALUES ('925', '兴化市', '兴化', '921', null, '中国,江苏省,泰州市,兴化市', '3', '225700', '0523', '321281', 'Xinghua', '119.8523800', '32.9094400');
INSERT INTO `sys_cn_area` VALUES ('926', '靖江市', '靖江', '921', null, '中国,江苏省,泰州市,靖江市', '3', '214500', '0523', '321282', 'Jingjiang', '120.2729100', '32.0159500');
INSERT INTO `sys_cn_area` VALUES ('927', '泰兴市', '泰兴', '921', null, '中国,江苏省,泰州市,泰兴市', '3', '225400', '0523', '321283', 'Taixing', '120.0519400', '32.1718700');
INSERT INTO `sys_cn_area` VALUES ('928', '宿迁市', '宿迁', '821', null, '中国,江苏省,宿迁市', '2', '223800', '0527', '321300', 'Suqian', '118.2933280', '33.9451540');
INSERT INTO `sys_cn_area` VALUES ('929', '宿城区', '宿城', '928', null, '中国,江苏省,宿迁市,宿城区', '3', '223800', '0527', '321302', 'Sucheng', '118.2914100', '33.9421900');
INSERT INTO `sys_cn_area` VALUES ('930', '宿豫区', '宿豫', '928', null, '中国,江苏省,宿迁市,宿豫区', '3', '223800', '0527', '321311', 'Suyu', '118.3292200', '33.9467300');
INSERT INTO `sys_cn_area` VALUES ('931', '沭阳县', '沭阳', '928', null, '中国,江苏省,宿迁市,沭阳县', '3', '223600', '0527', '321322', 'Shuyang', '118.7687300', '34.1144600');
INSERT INTO `sys_cn_area` VALUES ('932', '泗阳县', '泗阳', '928', null, '中国,江苏省,宿迁市,泗阳县', '3', '223700', '0527', '321323', 'Siyang', '118.7033000', '33.7209600');
INSERT INTO `sys_cn_area` VALUES ('933', '泗洪县', '泗洪', '928', null, '中国,江苏省,宿迁市,泗洪县', '3', '223900', '0527', '321324', 'Sihong', '118.2171600', '33.4599600');
INSERT INTO `sys_cn_area` VALUES ('934', '浙江省', '浙江', '1', null, '中国,浙江省', '1', null, '', '330000', 'Zhejiang', '120.1535760', '30.2874590');
INSERT INTO `sys_cn_area` VALUES ('935', '杭州市', '杭州', '934', null, '中国,浙江省,杭州市', '2', '310026', '0571', '330100', 'Hangzhou', '120.1535760', '30.2874590');
INSERT INTO `sys_cn_area` VALUES ('936', '上城区', '上城', '935', null, '中国,浙江省,杭州市,上城区', '3', '310002', '0571', '330102', 'Shangcheng', '120.1692200', '30.2425500');
INSERT INTO `sys_cn_area` VALUES ('937', '下城区', '下城', '935', null, '中国,浙江省,杭州市,下城区', '3', '310006', '0571', '330103', 'Xiacheng', '120.1809600', '30.2815300');
INSERT INTO `sys_cn_area` VALUES ('938', '江干区', '江干', '935', null, '中国,浙江省,杭州市,江干区', '3', '310016', '0571', '330104', 'Jianggan', '120.2051700', '30.2572000');
INSERT INTO `sys_cn_area` VALUES ('939', '拱墅区', '拱墅', '935', null, '中国,浙江省,杭州市,拱墅区', '3', '310011', '0571', '330105', 'Gongshu', '120.1420900', '30.3196800');
INSERT INTO `sys_cn_area` VALUES ('940', '西湖区', '西湖', '935', null, '中国,浙江省,杭州市,西湖区', '3', '310013', '0571', '330106', 'Xihu', '120.1297900', '30.2594900');
INSERT INTO `sys_cn_area` VALUES ('941', '滨江区', '滨江', '935', null, '中国,浙江省,杭州市,滨江区', '3', '310051', '0571', '330108', 'Binjiang', '120.2119400', '30.2083500');
INSERT INTO `sys_cn_area` VALUES ('942', '萧山区', '萧山', '935', null, '中国,浙江省,杭州市,萧山区', '3', '311200', '0571', '330109', 'Xiaoshan', '120.2645200', '30.1850500');
INSERT INTO `sys_cn_area` VALUES ('943', '余杭区', '余杭', '935', null, '中国,浙江省,杭州市,余杭区', '3', '311100', '0571', '330110', 'Yuhang', '120.2998600', '30.4182900');
INSERT INTO `sys_cn_area` VALUES ('944', '桐庐县', '桐庐', '935', null, '中国,浙江省,杭州市,桐庐县', '3', '311500', '0571', '330122', 'Tonglu', '119.6885300', '29.7977900');
INSERT INTO `sys_cn_area` VALUES ('945', '淳安县', '淳安', '935', null, '中国,浙江省,杭州市,淳安县', '3', '311700', '0571', '330127', 'Chun\'an', '119.0425700', '29.6098800');
INSERT INTO `sys_cn_area` VALUES ('946', '建德市', '建德', '935', null, '中国,浙江省,杭州市,建德市', '3', '311600', '0571', '330182', 'Jiande', '119.2815800', '29.4760300');
INSERT INTO `sys_cn_area` VALUES ('947', '富阳区', '富阳', '935', null, '中国,浙江省,杭州市,富阳区', '3', '311400', '0571', '330183', 'Fuyang', '119.9604100', '30.0487800');
INSERT INTO `sys_cn_area` VALUES ('948', '临安市', '临安', '935', null, '中国,浙江省,杭州市,临安市', '3', '311300', '0571', '330185', 'Lin\'an', '119.7247300', '30.2344700');
INSERT INTO `sys_cn_area` VALUES ('949', '宁波市', '宁波', '934', null, '中国,浙江省,宁波市', '2', '315000', '0574', '330200', 'Ningbo', '121.5497920', '29.8683880');
INSERT INTO `sys_cn_area` VALUES ('950', '海曙区', '海曙', '949', null, '中国,浙江省,宁波市,海曙区', '3', '315000', '0574', '330203', 'Haishu', '121.5510600', '29.8597700');
INSERT INTO `sys_cn_area` VALUES ('951', '江东区', '江东', '949', null, '中国,浙江省,宁波市,江东区', '3', '315040', '0574', '330204', 'Jiangdong', '121.5702800', '29.8670100');
INSERT INTO `sys_cn_area` VALUES ('952', '江北区', '江北', '949', null, '中国,浙江省,宁波市,江北区', '3', '315020', '0574', '330205', 'Jiangbei', '121.5568100', '29.8877600');
INSERT INTO `sys_cn_area` VALUES ('953', '北仑区', '北仑', '949', null, '中国,浙江省,宁波市,北仑区', '3', '315800', '0574', '330206', 'Beilun', '121.8440800', '29.9006900');
INSERT INTO `sys_cn_area` VALUES ('954', '镇海区', '镇海', '949', null, '中国,浙江省,宁波市,镇海区', '3', '315200', '0574', '330211', 'Zhenhai', '121.7161500', '29.9489300');
INSERT INTO `sys_cn_area` VALUES ('955', '鄞州区', '鄞州', '949', null, '中国,浙江省,宁波市,鄞州区', '3', '315100', '0574', '330212', 'Yinzhou', '121.5475400', '29.8161400');
INSERT INTO `sys_cn_area` VALUES ('956', '象山县', '象山', '949', null, '中国,浙江省,宁波市,象山县', '3', '315700', '0574', '330225', 'Xiangshan', '121.8691700', '29.4775800');
INSERT INTO `sys_cn_area` VALUES ('957', '宁海县', '宁海', '949', null, '中国,浙江省,宁波市,宁海县', '3', '315600', '0574', '330226', 'Ninghai', '121.4307200', '29.2889000');
INSERT INTO `sys_cn_area` VALUES ('958', '余姚市', '余姚', '949', null, '中国,浙江省,宁波市,余姚市', '3', '315400', '0574', '330281', 'Yuyao', '121.1534100', '30.0386700');
INSERT INTO `sys_cn_area` VALUES ('959', '慈溪市', '慈溪', '949', null, '中国,浙江省,宁波市,慈溪市', '3', '315300', '0574', '330282', 'Cixi', '121.2664100', '30.1695900');
INSERT INTO `sys_cn_area` VALUES ('960', '奉化市', '奉化', '949', null, '中国,浙江省,宁波市,奉化市', '3', '315500', '0574', '330283', 'Fenghua', '121.4100300', '29.6553700');
INSERT INTO `sys_cn_area` VALUES ('961', '温州市', '温州', '934', null, '中国,浙江省,温州市', '2', '325000', '0577', '330300', 'Wenzhou', '120.6721110', '28.0005750');
INSERT INTO `sys_cn_area` VALUES ('962', '鹿城区', '鹿城', '961', null, '中国,浙江省,温州市,鹿城区', '3', '325000', '0577', '330302', 'Lucheng', '120.6550500', '28.0148900');
INSERT INTO `sys_cn_area` VALUES ('963', '龙湾区', '龙湾', '961', null, '中国,浙江省,温州市,龙湾区', '3', '325013', '0577', '330303', 'Longwan', '120.8305300', '27.9128400');
INSERT INTO `sys_cn_area` VALUES ('964', '瓯海区', '瓯海', '961', null, '中国,浙江省,温州市,瓯海区', '3', '325005', '0577', '330304', 'Ouhai', '120.6375100', '28.0071400');
INSERT INTO `sys_cn_area` VALUES ('965', '洞头县', '洞头', '961', null, '中国,浙江省,温州市,洞头县', '3', '325700', '0577', '330322', 'Dongtou', '121.1560600', '27.8363400');
INSERT INTO `sys_cn_area` VALUES ('966', '永嘉县', '永嘉', '961', null, '中国,浙江省,温州市,永嘉县', '3', '325100', '0577', '330324', 'Yongjia', '120.6931700', '28.1545600');
INSERT INTO `sys_cn_area` VALUES ('967', '平阳县', '平阳', '961', null, '中国,浙江省,温州市,平阳县', '3', '325400', '0577', '330326', 'Pingyang', '120.5650600', '27.6624500');
INSERT INTO `sys_cn_area` VALUES ('968', '苍南县', '苍南', '961', null, '中国,浙江省,温州市,苍南县', '3', '325800', '0577', '330327', 'Cangnan', '120.4260800', '27.5173900');
INSERT INTO `sys_cn_area` VALUES ('969', '文成县', '文成', '961', null, '中国,浙江省,温州市,文成县', '3', '325300', '0577', '330328', 'Wencheng', '120.0906300', '27.7867800');
INSERT INTO `sys_cn_area` VALUES ('970', '泰顺县', '泰顺', '961', null, '中国,浙江省,温州市,泰顺县', '3', '325500', '0577', '330329', 'Taishun', '119.7182000', '27.5569400');
INSERT INTO `sys_cn_area` VALUES ('971', '瑞安市', '瑞安', '961', null, '中国,浙江省,温州市,瑞安市', '3', '325200', '0577', '330381', 'Rui\'an', '120.6546600', '27.7804100');
INSERT INTO `sys_cn_area` VALUES ('972', '乐清市', '乐清', '961', null, '中国,浙江省,温州市,乐清市', '3', '325600', '0577', '330382', 'Yueqing', '120.9617000', '28.1240400');
INSERT INTO `sys_cn_area` VALUES ('973', '嘉兴市', '嘉兴', '934', null, '中国,浙江省,嘉兴市', '2', '314000', '0573', '330400', 'Jiaxing', '120.7508650', '30.7626530');
INSERT INTO `sys_cn_area` VALUES ('974', '南湖区', '南湖', '973', null, '中国,浙江省,嘉兴市,南湖区', '3', '314051', '0573', '330402', 'Nanhu', '120.7852400', '30.7486500');
INSERT INTO `sys_cn_area` VALUES ('975', '秀洲区', '秀洲', '973', null, '中国,浙江省,嘉兴市,秀洲区', '3', '314031', '0573', '330411', 'Xiuzhou', '120.7086700', '30.7645400');
INSERT INTO `sys_cn_area` VALUES ('976', '嘉善县', '嘉善', '973', null, '中国,浙江省,嘉兴市,嘉善县', '3', '314100', '0573', '330421', 'Jiashan', '120.9255900', '30.8299300');
INSERT INTO `sys_cn_area` VALUES ('977', '海盐县', '海盐', '973', null, '中国,浙江省,嘉兴市,海盐县', '3', '314300', '0573', '330424', 'Haiyan', '120.9457000', '30.5254700');
INSERT INTO `sys_cn_area` VALUES ('978', '海宁市', '海宁', '973', null, '中国,浙江省,嘉兴市,海宁市', '3', '314400', '0573', '330481', 'Haining', '120.6813000', '30.5097000');
INSERT INTO `sys_cn_area` VALUES ('979', '平湖市', '平湖', '973', null, '中国,浙江省,嘉兴市,平湖市', '3', '314200', '0573', '330482', 'Pinghu', '121.0216600', '30.6961800');
INSERT INTO `sys_cn_area` VALUES ('980', '桐乡市', '桐乡', '973', null, '中国,浙江省,嘉兴市,桐乡市', '3', '314500', '0573', '330483', 'Tongxiang', '120.5648500', '30.6302000');
INSERT INTO `sys_cn_area` VALUES ('981', '湖州市', '湖州', '934', null, '中国,浙江省,湖州市', '2', '313000', '0572', '330500', 'Huzhou', '120.1023980', '30.8671980');
INSERT INTO `sys_cn_area` VALUES ('982', '吴兴区', '吴兴', '981', null, '中国,浙江省,湖州市,吴兴区', '3', '313000', '0572', '330502', 'Wuxing', '120.1254800', '30.8575200');
INSERT INTO `sys_cn_area` VALUES ('983', '南浔区', '南浔', '981', null, '中国,浙江省,湖州市,南浔区', '3', '313009', '0572', '330503', 'Nanxun', '120.4203800', '30.8668600');
INSERT INTO `sys_cn_area` VALUES ('984', '德清县', '德清', '981', null, '中国,浙江省,湖州市,德清县', '3', '313200', '0572', '330521', 'Deqing', '119.9783600', '30.5336900');
INSERT INTO `sys_cn_area` VALUES ('985', '长兴县', '长兴', '981', null, '中国,浙江省,湖州市,长兴县', '3', '313100', '0572', '330522', 'Changxing', '119.9078300', '31.0060600');
INSERT INTO `sys_cn_area` VALUES ('986', '安吉县', '安吉', '981', null, '中国,浙江省,湖州市,安吉县', '3', '313300', '0572', '330523', 'Anji', '119.6815800', '30.6379800');
INSERT INTO `sys_cn_area` VALUES ('987', '绍兴市', '绍兴', '934', null, '中国,浙江省,绍兴市', '2', '312000', '0575', '330600', 'Shaoxing', '120.5821120', '29.9971170');
INSERT INTO `sys_cn_area` VALUES ('988', '越城区', '越城', '987', null, '中国,浙江省,绍兴市,越城区', '3', '312000', '0575', '330602', 'Yuecheng', '120.5819000', '29.9889500');
INSERT INTO `sys_cn_area` VALUES ('989', '柯桥区', '柯桥', '987', null, '中国,浙江省,绍兴市,柯桥区', '3', '312030', '0575', '330603', 'Keqiao ', '120.4927360', '30.0876300');
INSERT INTO `sys_cn_area` VALUES ('990', '上虞区', '上虞', '987', null, '中国,浙江省,绍兴市,上虞区', '3', '312300', '0575', '330604', 'Shangyu', '120.4760750', '30.0780380');
INSERT INTO `sys_cn_area` VALUES ('991', '新昌县', '新昌', '987', null, '中国,浙江省,绍兴市,新昌县', '3', '312500', '0575', '330624', 'Xinchang', '120.9043500', '29.4999100');
INSERT INTO `sys_cn_area` VALUES ('992', '诸暨市', '诸暨', '987', null, '中国,浙江省,绍兴市,诸暨市', '3', '311800', '0575', '330681', 'Zhuji', '120.2362900', '29.7135800');
INSERT INTO `sys_cn_area` VALUES ('993', '嵊州市', '嵊州', '987', null, '中国,浙江省,绍兴市,嵊州市', '3', '312400', '0575', '330683', 'Shengzhou', '120.8217400', '29.5885400');
INSERT INTO `sys_cn_area` VALUES ('994', '金华市', '金华', '934', null, '中国,浙江省,金华市', '2', '321000', '0579', '330700', 'Jinhua', '119.6495060', '29.0895240');
INSERT INTO `sys_cn_area` VALUES ('995', '婺城区', '婺城', '994', null, '中国,浙江省,金华市,婺城区', '3', '321000', '0579', '330702', 'Wucheng', '119.5713500', '29.0952100');
INSERT INTO `sys_cn_area` VALUES ('996', '金东区', '金东', '994', null, '中国,浙江省,金华市,金东区', '3', '321000', '0579', '330703', 'Jindong', '119.6930200', '29.0991000');
INSERT INTO `sys_cn_area` VALUES ('997', '武义县', '武义', '994', null, '中国,浙江省,金华市,武义县', '3', '321200', '0579', '330723', 'Wuyi', '119.8164000', '28.8933100');
INSERT INTO `sys_cn_area` VALUES ('998', '浦江县', '浦江', '994', null, '中国,浙江省,金华市,浦江县', '3', '322200', '0579', '330726', 'Pujiang', '119.8918100', '29.4535300');
INSERT INTO `sys_cn_area` VALUES ('999', '磐安县', '磐安', '994', null, '中国,浙江省,金华市,磐安县', '3', '322300', '0579', '330727', 'Pan\'an', '120.4502200', '29.0573300');
INSERT INTO `sys_cn_area` VALUES ('1000', '兰溪市', '兰溪', '994', null, '中国,浙江省,金华市,兰溪市', '3', '321100', '0579', '330781', 'Lanxi', '119.4596500', '29.2084100');
INSERT INTO `sys_cn_area` VALUES ('1001', '义乌市', '义乌', '994', null, '中国,浙江省,金华市,义乌市', '3', '322000', '0579', '330782', 'Yiwu', '120.0744000', '29.3055800');
INSERT INTO `sys_cn_area` VALUES ('1002', '东阳市', '东阳', '994', null, '中国,浙江省,金华市,东阳市', '3', '322100', '0579', '330783', 'Dongyang', '120.2418500', '29.2894200');
INSERT INTO `sys_cn_area` VALUES ('1003', '永康市', '永康', '994', null, '中国,浙江省,金华市,永康市', '3', '321300', '0579', '330784', 'Yongkang', '120.0472700', '28.8884400');
INSERT INTO `sys_cn_area` VALUES ('1004', '衢州市', '衢州', '934', null, '中国,浙江省,衢州市', '2', '324002', '0570', '330800', 'Quzhou', '118.8726300', '28.9417080');
INSERT INTO `sys_cn_area` VALUES ('1005', '柯城区', '柯城', '1004', null, '中国,浙江省,衢州市,柯城区', '3', '324100', '0570', '330802', 'Kecheng', '118.8710900', '28.9685800');
INSERT INTO `sys_cn_area` VALUES ('1006', '衢江区', '衢江', '1004', null, '中国,浙江省,衢州市,衢江区', '3', '324022', '0570', '330803', 'Qujiang', '118.9598000', '28.9797700');
INSERT INTO `sys_cn_area` VALUES ('1007', '常山县', '常山', '1004', null, '中国,浙江省,衢州市,常山县', '3', '324200', '0570', '330822', 'Changshan', '118.5102500', '28.9019100');
INSERT INTO `sys_cn_area` VALUES ('1008', '开化县', '开化', '1004', null, '中国,浙江省,衢州市,开化县', '3', '324300', '0570', '330824', 'Kaihua', '118.4161600', '29.1378500');
INSERT INTO `sys_cn_area` VALUES ('1009', '龙游县', '龙游', '1004', null, '中国,浙江省,衢州市,龙游县', '3', '324400', '0570', '330825', 'Longyou', '119.1722100', '29.0282300');
INSERT INTO `sys_cn_area` VALUES ('1010', '江山市', '江山', '1004', null, '中国,浙江省,衢州市,江山市', '3', '324100', '0570', '330881', 'Jiangshan', '118.6267400', '28.7386000');
INSERT INTO `sys_cn_area` VALUES ('1011', '舟山市', '舟山', '934', null, '中国,浙江省,舟山市', '2', '316000', '0580', '330900', 'Zhoushan', '122.1068630', '30.0160280');
INSERT INTO `sys_cn_area` VALUES ('1012', '定海区', '定海', '1011', null, '中国,浙江省,舟山市,定海区', '3', '316000', '0580', '330902', 'Dinghai', '122.1067700', '30.0198500');
INSERT INTO `sys_cn_area` VALUES ('1013', '普陀区', '普陀', '1011', null, '中国,浙江省,舟山市,普陀区', '3', '316100', '0580', '330903', 'Putuo', '122.3027800', '29.9490800');
INSERT INTO `sys_cn_area` VALUES ('1014', '岱山县', '岱山', '1011', null, '中国,浙江省,舟山市,岱山县', '3', '316200', '0580', '330921', 'Daishan', '122.2048600', '30.2438500');
INSERT INTO `sys_cn_area` VALUES ('1015', '嵊泗县', '嵊泗', '1011', null, '中国,浙江省,舟山市,嵊泗县', '3', '202450', '0580', '330922', 'Shengsi', '122.4512900', '30.7267800');
INSERT INTO `sys_cn_area` VALUES ('1016', '台州市', '台州', '934', null, '中国,浙江省,台州市', '2', '318000', '0576', '331000', 'Taizhou', '121.4285990', '28.6613780');
INSERT INTO `sys_cn_area` VALUES ('1017', '椒江区', '椒江', '1016', null, '中国,浙江省,台州市,椒江区', '3', '318000', '0576', '331002', 'Jiaojiang', '121.4428700', '28.6730100');
INSERT INTO `sys_cn_area` VALUES ('1018', '黄岩区', '黄岩', '1016', null, '中国,浙江省,台州市,黄岩区', '3', '318020', '0576', '331003', 'Huangyan', '121.2589100', '28.6507700');
INSERT INTO `sys_cn_area` VALUES ('1019', '路桥区', '路桥', '1016', null, '中国,浙江省,台州市,路桥区', '3', '318050', '0576', '331004', 'Luqiao', '121.3738100', '28.5801600');
INSERT INTO `sys_cn_area` VALUES ('1020', '玉环县', '玉环', '1016', null, '中国,浙江省,台州市,玉环县', '3', '317600', '0576', '331021', 'Yuhuan', '121.2324200', '28.1363700');
INSERT INTO `sys_cn_area` VALUES ('1021', '三门县', '三门', '1016', null, '中国,浙江省,台州市,三门县', '3', '317100', '0576', '331022', 'Sanmen', '121.3937000', '29.1051000');
INSERT INTO `sys_cn_area` VALUES ('1022', '天台县', '天台', '1016', null, '中国,浙江省,台州市,天台县', '3', '317200', '0576', '331023', 'Tiantai', '121.0084800', '29.1429000');
INSERT INTO `sys_cn_area` VALUES ('1023', '仙居县', '仙居', '1016', null, '中国,浙江省,台州市,仙居县', '3', '317300', '0576', '331024', 'Xianju', '120.7287200', '28.8467200');
INSERT INTO `sys_cn_area` VALUES ('1024', '温岭市', '温岭', '1016', null, '中国,浙江省,台州市,温岭市', '3', '317500', '0576', '331081', 'Wenling', '121.3859500', '28.3717600');
INSERT INTO `sys_cn_area` VALUES ('1025', '临海市', '临海', '1016', null, '中国,浙江省,台州市,临海市', '3', '317000', '0576', '331082', 'Linhai', '121.1388500', '28.8560300');
INSERT INTO `sys_cn_area` VALUES ('1026', '丽水市', '丽水', '934', null, '中国,浙江省,丽水市', '2', '323000', '0578', '331100', 'Lishui', '119.9217860', '28.4519930');
INSERT INTO `sys_cn_area` VALUES ('1027', '莲都区', '莲都', '1026', null, '中国,浙江省,丽水市,莲都区', '3', '323000', '0578', '331102', 'Liandu', '119.9127000', '28.4458300');
INSERT INTO `sys_cn_area` VALUES ('1028', '青田县', '青田', '1026', null, '中国,浙江省,丽水市,青田县', '3', '323900', '0578', '331121', 'Qingtian', '120.2902800', '28.1389700');
INSERT INTO `sys_cn_area` VALUES ('1029', '缙云县', '缙云', '1026', null, '中国,浙江省,丽水市,缙云县', '3', '321400', '0578', '331122', 'Jinyun', '120.0903600', '28.6594400');
INSERT INTO `sys_cn_area` VALUES ('1030', '遂昌县', '遂昌', '1026', null, '中国,浙江省,丽水市,遂昌县', '3', '323300', '0578', '331123', 'Suichang', '119.2760600', '28.5929100');
INSERT INTO `sys_cn_area` VALUES ('1031', '松阳县', '松阳', '1026', null, '中国,浙江省,丽水市,松阳县', '3', '323400', '0578', '331124', 'Songyang', '119.4819900', '28.4494000');
INSERT INTO `sys_cn_area` VALUES ('1032', '云和县', '云和', '1026', null, '中国,浙江省,丽水市,云和县', '3', '323600', '0578', '331125', 'Yunhe', '119.5728700', '28.1164300');
INSERT INTO `sys_cn_area` VALUES ('1033', '庆元县', '庆元', '1026', null, '中国,浙江省,丽水市,庆元县', '3', '323800', '0578', '331126', 'Qingyuan', '119.0625600', '27.6184200');
INSERT INTO `sys_cn_area` VALUES ('1034', '景宁畲族自治县', '景宁', '1026', null, '中国,浙江省,丽水市,景宁畲族自治县', '3', '323500', '0578', '331127', 'Jingning', '119.6383900', '27.9739300');
INSERT INTO `sys_cn_area` VALUES ('1035', '龙泉市', '龙泉', '1026', null, '中国,浙江省,丽水市,龙泉市', '3', '323700', '0578', '331181', 'Longquan', '119.1416300', '28.0743000');
INSERT INTO `sys_cn_area` VALUES ('1036', '舟山群岛新区', '舟山新区', '934', null, '中国,浙江省,舟山群岛新区', '2', '316000', '0580', '331200', 'Zhoushan', '122.3176570', '29.8132420');
INSERT INTO `sys_cn_area` VALUES ('1037', '金塘岛', '金塘', '1036', null, '中国,浙江省,舟山群岛新区,金塘岛', '3', '316000', '0580', '331201', 'Jintang', '121.8933730', '30.0406410');
INSERT INTO `sys_cn_area` VALUES ('1038', '六横岛', '六横', '1036', null, '中国,浙江省,舟山群岛新区,六横岛', '3', '316000', '0580', '331202', 'Liuheng', '122.1426500', '29.6629380');
INSERT INTO `sys_cn_area` VALUES ('1039', '衢山岛', '衢山', '1036', null, '中国,浙江省,舟山群岛新区,衢山岛', '3', '316000', '0580', '331203', 'Qushan', '122.3584250', '30.4426420');
INSERT INTO `sys_cn_area` VALUES ('1040', '舟山本岛西北部', '舟山', '1036', null, '中国,浙江省,舟山群岛新区,舟山本岛西北部', '3', '316000', '0580', '331204', 'Zhoushan', '122.0306400', '30.1403770');
INSERT INTO `sys_cn_area` VALUES ('1041', '岱山岛西南部', '岱山', '1036', null, '中国,浙江省,舟山群岛新区,岱山岛西南部', '3', '316000', '0580', '331205', 'Daishan', '122.1801230', '30.2772690');
INSERT INTO `sys_cn_area` VALUES ('1042', '泗礁岛', '泗礁', '1036', null, '中国,浙江省,舟山群岛新区,泗礁岛', '3', '316000', '0580', '331206', 'Sijiao', '122.4580300', '30.7251120');
INSERT INTO `sys_cn_area` VALUES ('1043', '朱家尖岛', '朱家尖', '1036', null, '中国,浙江省,舟山群岛新区,朱家尖岛', '3', '316000', '0580', '331207', 'Zhujiajian', '122.3906360', '29.9163030');
INSERT INTO `sys_cn_area` VALUES ('1044', '洋山岛', '洋山', '1036', null, '中国,浙江省,舟山群岛新区,洋山岛', '3', '316000', '0580', '331208', 'Yangshan', '121.9958910', '30.0946370');
INSERT INTO `sys_cn_area` VALUES ('1045', '长涂岛', '长涂', '1036', null, '中国,浙江省,舟山群岛新区,长涂岛', '3', '316000', '0580', '331209', 'Changtu', '122.2846810', '30.2488800');
INSERT INTO `sys_cn_area` VALUES ('1046', '虾峙岛', '虾峙', '1036', null, '中国,浙江省,舟山群岛新区,虾峙岛', '3', '316000', '0580', '331210', 'Xiazhi', '122.2446860', '29.7529410');
INSERT INTO `sys_cn_area` VALUES ('1047', '安徽省', '安徽', '1', null, '中国,安徽省', '1', null, '', '340000', 'Anhui', '117.2830420', '31.8611900');
INSERT INTO `sys_cn_area` VALUES ('1048', '合肥市', '合肥', '1047', null, '中国,安徽省,合肥市', '2', '230001', '0551', '340100', 'Hefei', '117.2830420', '31.8611900');
INSERT INTO `sys_cn_area` VALUES ('1049', '瑶海区', '瑶海', '1048', null, '中国,安徽省,合肥市,瑶海区', '3', '230011', '0551', '340102', 'Yaohai', '117.3094700', '31.8580900');
INSERT INTO `sys_cn_area` VALUES ('1050', '庐阳区', '庐阳', '1048', null, '中国,安徽省,合肥市,庐阳区', '3', '230001', '0551', '340103', 'Luyang', '117.2645200', '31.8787400');
INSERT INTO `sys_cn_area` VALUES ('1051', '蜀山区', '蜀山', '1048', null, '中国,安徽省,合肥市,蜀山区', '3', '230031', '0551', '340104', 'Shushan', '117.2610400', '31.8511700');
INSERT INTO `sys_cn_area` VALUES ('1052', '包河区', '包河', '1048', null, '中国,安徽省,合肥市,包河区', '3', '230041', '0551', '340111', 'Baohe', '117.3098400', '31.7950200');
INSERT INTO `sys_cn_area` VALUES ('1053', '长丰县', '长丰', '1048', null, '中国,安徽省,合肥市,长丰县', '3', '231100', '0551', '340121', 'Changfeng', '117.1654900', '32.4795900');
INSERT INTO `sys_cn_area` VALUES ('1054', '肥东县', '肥东', '1048', null, '中国,安徽省,合肥市,肥东县', '3', '231600', '0551', '340122', 'Feidong', '117.4712800', '31.8852500');
INSERT INTO `sys_cn_area` VALUES ('1055', '肥西县', '肥西', '1048', null, '中国,安徽省,合肥市,肥西县', '3', '231200', '0551', '340123', 'Feixi', '117.1684500', '31.7214300');
INSERT INTO `sys_cn_area` VALUES ('1056', '庐江县', '庐江', '1048', null, '中国,安徽省,合肥市,庐江县', '3', '231500', '0565', '340124', 'Lujiang', '117.2898440', '31.2514880');
INSERT INTO `sys_cn_area` VALUES ('1057', '巢湖市', '巢湖', '1048', null, '中国,安徽省,合肥市,巢湖市', '3', '238000', '0565', '340181', 'Chaohu', '117.8741550', '31.6005180');
INSERT INTO `sys_cn_area` VALUES ('1058', '芜湖市', '芜湖', '1047', null, '中国,安徽省,芜湖市', '2', '241000', '0551', '340200', 'Wuhu', '118.3764510', '31.3263190');
INSERT INTO `sys_cn_area` VALUES ('1059', '镜湖区', '镜湖', '1058', null, '中国,安徽省,芜湖市,镜湖区', '3', '241000', '0553', '340202', 'Jinghu', '118.3852500', '31.3403800');
INSERT INTO `sys_cn_area` VALUES ('1060', '弋江区', '弋江', '1058', null, '中国,安徽省,芜湖市,弋江区', '3', '241000', '0553', '340203', 'Yijiang', '118.3726500', '31.3117800');
INSERT INTO `sys_cn_area` VALUES ('1061', '鸠江区', '鸠江', '1058', null, '中国,安徽省,芜湖市,鸠江区', '3', '241000', '0553', '340207', 'Jiujiang', '118.3921500', '31.3692800');
INSERT INTO `sys_cn_area` VALUES ('1062', '三山区', '三山', '1058', null, '中国,安徽省,芜湖市,三山区', '3', '241000', '0553', '340208', 'Sanshan', '118.2250900', '31.2070300');
INSERT INTO `sys_cn_area` VALUES ('1063', '芜湖县', '芜湖', '1058', null, '中国,安徽省,芜湖市,芜湖县', '3', '241100', '0553', '340221', 'Wuhu', '118.5752500', '31.1347600');
INSERT INTO `sys_cn_area` VALUES ('1064', '繁昌县', '繁昌', '1058', null, '中国,安徽省,芜湖市,繁昌县', '3', '241200', '0553', '340222', 'Fanchang', '118.1998200', '31.0831900');
INSERT INTO `sys_cn_area` VALUES ('1065', '南陵县', '南陵', '1058', null, '中国,安徽省,芜湖市,南陵县', '3', '242400', '0553', '340223', 'Nanling', '118.3368800', '30.9196900');
INSERT INTO `sys_cn_area` VALUES ('1066', '无为县', '无为', '1058', null, '中国,安徽省,芜湖市,无为县', '3', '238300', '0565', '340225', 'Wuwei', '117.9114320', '31.3030750');
INSERT INTO `sys_cn_area` VALUES ('1067', '蚌埠市', '蚌埠', '1047', null, '中国,安徽省,蚌埠市', '2', '233000', '0552', '340300', 'Bengbu', '117.3623700', '32.9340370');
INSERT INTO `sys_cn_area` VALUES ('1068', '龙子湖区', '龙子湖', '1067', null, '中国,安徽省,蚌埠市,龙子湖区', '3', '233000', '0552', '340302', 'Longzihu', '117.3937900', '32.9430100');
INSERT INTO `sys_cn_area` VALUES ('1069', '蚌山区', '蚌山', '1067', null, '中国,安徽省,蚌埠市,蚌山区', '3', '233000', '0552', '340303', 'Bengshan', '117.3676700', '32.9441100');
INSERT INTO `sys_cn_area` VALUES ('1070', '禹会区', '禹会', '1067', null, '中国,安徽省,蚌埠市,禹会区', '3', '233010', '0552', '340304', 'Yuhui', '117.3531500', '32.9333600');
INSERT INTO `sys_cn_area` VALUES ('1071', '淮上区', '淮上', '1067', null, '中国,安徽省,蚌埠市,淮上区', '3', '233002', '0552', '340311', 'Huaishang', '117.3598300', '32.9642300');
INSERT INTO `sys_cn_area` VALUES ('1072', '怀远县', '怀远', '1067', null, '中国,安徽省,蚌埠市,怀远县', '3', '233400', '0552', '340321', 'Huaiyuan', '117.2050700', '32.9700700');
INSERT INTO `sys_cn_area` VALUES ('1073', '五河县', '五河', '1067', null, '中国,安徽省,蚌埠市,五河县', '3', '233300', '0552', '340322', 'Wuhe', '117.8914400', '33.1445700');
INSERT INTO `sys_cn_area` VALUES ('1074', '固镇县', '固镇', '1067', null, '中国,安徽省,蚌埠市,固镇县', '3', '233700', '0552', '340323', 'Guzhen', '117.3155800', '33.3180300');
INSERT INTO `sys_cn_area` VALUES ('1075', '淮南市', '淮南', '1047', null, '中国,安徽省,淮南市', '2', '232001', '0554', '340400', 'Huainan', '117.0254490', '32.6459470');
INSERT INTO `sys_cn_area` VALUES ('1076', '大通区', '大通', '1075', null, '中国,安徽省,淮南市,大通区', '3', '232033', '0554', '340402', 'Datong', '117.0525500', '32.6326500');
INSERT INTO `sys_cn_area` VALUES ('1077', '田家庵区', '田家庵', '1075', null, '中国,安徽省,淮南市,田家庵区', '3', '232000', '0554', '340403', 'Tianjiaan', '117.0173900', '32.6469700');
INSERT INTO `sys_cn_area` VALUES ('1078', '谢家集区', '谢家集', '1075', null, '中国,安徽省,淮南市,谢家集区', '3', '232052', '0554', '340404', 'Xiejiaji', '116.8637700', '32.5981800');
INSERT INTO `sys_cn_area` VALUES ('1079', '八公山区', '八公山', '1075', null, '中国,安徽省,淮南市,八公山区', '3', '232072', '0554', '340405', 'Bagongshan', '116.8369400', '32.6294100');
INSERT INTO `sys_cn_area` VALUES ('1080', '潘集区', '潘集', '1075', null, '中国,安徽省,淮南市,潘集区', '3', '232082', '0554', '340406', 'Panji', '116.8162200', '32.7828700');
INSERT INTO `sys_cn_area` VALUES ('1081', '凤台县', '凤台', '1075', null, '中国,安徽省,淮南市,凤台县', '3', '232100', '0554', '340421', 'Fengtai', '116.7156900', '32.7075200');
INSERT INTO `sys_cn_area` VALUES ('1082', '马鞍山市', '马鞍山', '1047', null, '中国,安徽省,马鞍山市', '2', '243001', '0555', '340500', 'Ma\'anshan', '118.5079060', '31.6893620');
INSERT INTO `sys_cn_area` VALUES ('1083', '花山区', '花山', '1082', null, '中国,安徽省,马鞍山市,花山区', '3', '243000', '0555', '340503', 'Huashan', '118.5123100', '31.7001000');
INSERT INTO `sys_cn_area` VALUES ('1084', '雨山区', '雨山', '1082', null, '中国,安徽省,马鞍山市,雨山区', '3', '243071', '0555', '340504', 'Yushan', '118.4986900', '31.6821900');
INSERT INTO `sys_cn_area` VALUES ('1085', '博望区', '博望', '1082', null, '中国,安徽省,马鞍山市,博望区', '3', '243131', '0555', '340506', 'Bowang', '118.8443870', '31.5618710');
INSERT INTO `sys_cn_area` VALUES ('1086', '当涂县', '当涂', '1082', null, '中国,安徽省,马鞍山市,当涂县', '3', '243100', '0555', '340521', 'Dangtu', '118.4978600', '31.5709800');
INSERT INTO `sys_cn_area` VALUES ('1087', '含山县', '含山', '1082', null, '中国,安徽省,马鞍山市,含山县', '3', '238100', '0555', '340522', 'Hanshan ', '118.1055450', '31.7277580');
INSERT INTO `sys_cn_area` VALUES ('1088', '和县', '和县', '1082', null, '中国,安徽省,马鞍山市,和县', '3', '238200', '0555', '340523', 'Hexian', '118.3514050', '31.7417940');
INSERT INTO `sys_cn_area` VALUES ('1089', '淮北市', '淮北', '1047', null, '中国,安徽省,淮北市', '2', '235000', '0561', '340600', 'Huaibei', '116.7946640', '33.9717070');
INSERT INTO `sys_cn_area` VALUES ('1090', '杜集区', '杜集', '1089', null, '中国,安徽省,淮北市,杜集区', '3', '235000', '0561', '340602', 'Duji', '116.8299800', '33.9936300');
INSERT INTO `sys_cn_area` VALUES ('1091', '相山区', '相山', '1089', null, '中国,安徽省,淮北市,相山区', '3', '235000', '0561', '340603', 'Xiangshan', '116.7946400', '33.9597900');
INSERT INTO `sys_cn_area` VALUES ('1092', '烈山区', '烈山', '1089', null, '中国,安徽省,淮北市,烈山区', '3', '235000', '0561', '340604', 'Lieshan', '116.8144800', '33.8935500');
INSERT INTO `sys_cn_area` VALUES ('1093', '濉溪县', '濉溪', '1089', null, '中国,安徽省,淮北市,濉溪县', '3', '235100', '0561', '340621', 'Suixi', '116.7678500', '33.9145500');
INSERT INTO `sys_cn_area` VALUES ('1094', '铜陵市', '铜陵', '1047', null, '中国,安徽省,铜陵市', '2', '244000', '0562', '340700', 'Tongling', '117.8165760', '30.9299350');
INSERT INTO `sys_cn_area` VALUES ('1095', '铜官山区', '铜官山', '1094', null, '中国,安徽省,铜陵市,铜官山区', '3', '244000', '0562', '340702', 'Tongguanshan', '117.8152500', '30.9342300');
INSERT INTO `sys_cn_area` VALUES ('1096', '狮子山区', '狮子山', '1094', null, '中国,安徽省,铜陵市,狮子山区', '3', '244000', '0562', '340703', 'Shizishan', '117.8917800', '30.9263100');
INSERT INTO `sys_cn_area` VALUES ('1097', '郊区', '郊区', '1094', null, '中国,安徽省,铜陵市,郊区', '3', '244000', '0562', '340711', 'Jiaoqu', '117.8086800', '30.9197600');
INSERT INTO `sys_cn_area` VALUES ('1098', '铜陵县', '铜陵', '1094', null, '中国,安徽省,铜陵市,铜陵县', '3', '244100', '0562', '340721', 'Tongling', '117.7911300', '30.9536500');
INSERT INTO `sys_cn_area` VALUES ('1099', '安庆市', '安庆', '1047', null, '中国,安徽省,安庆市', '2', '246001', '0556', '340800', 'Anqing', '117.0535710', '30.5248160');
INSERT INTO `sys_cn_area` VALUES ('1100', '迎江区', '迎江', '1099', null, '中国,安徽省,安庆市,迎江区', '3', '246001', '0556', '340802', 'Yingjiang', '117.0493000', '30.5042100');
INSERT INTO `sys_cn_area` VALUES ('1101', '大观区', '大观', '1099', null, '中国,安徽省,安庆市,大观区', '3', '246002', '0556', '340803', 'Daguan', '117.0342600', '30.5121600');
INSERT INTO `sys_cn_area` VALUES ('1102', '宜秀区', '宜秀', '1099', null, '中国,安徽省,安庆市,宜秀区', '3', '246003', '0556', '340811', 'Yixiu', '117.0612700', '30.5078300');
INSERT INTO `sys_cn_area` VALUES ('1103', '怀宁县', '怀宁', '1099', null, '中国,安徽省,安庆市,怀宁县', '3', '246100', '0556', '340822', 'Huaining', '116.8296800', '30.7337600');
INSERT INTO `sys_cn_area` VALUES ('1104', '枞阳县', '枞阳', '1099', null, '中国,安徽省,安庆市,枞阳县', '3', '246700', '0556', '340823', 'Zongyang', '117.2201500', '30.6995600');
INSERT INTO `sys_cn_area` VALUES ('1105', '潜山县', '潜山', '1099', null, '中国,安徽省,安庆市,潜山县', '3', '246300', '0556', '340824', 'Qianshan', '116.5757400', '30.6303700');
INSERT INTO `sys_cn_area` VALUES ('1106', '太湖县', '太湖', '1099', null, '中国,安徽省,安庆市,太湖县', '3', '246400', '0556', '340825', 'Taihu', '116.3088000', '30.4541000');
INSERT INTO `sys_cn_area` VALUES ('1107', '宿松县', '宿松', '1099', null, '中国,安徽省,安庆市,宿松县', '3', '246500', '0556', '340826', 'Susong', '116.1291500', '30.1536000');
INSERT INTO `sys_cn_area` VALUES ('1108', '望江县', '望江', '1099', null, '中国,安徽省,安庆市,望江县', '3', '246200', '0556', '340827', 'Wangjiang', '116.6881400', '30.1258500');
INSERT INTO `sys_cn_area` VALUES ('1109', '岳西县', '岳西', '1099', null, '中国,安徽省,安庆市,岳西县', '3', '246600', '0556', '340828', 'Yuexi', '116.3599500', '30.8498300');
INSERT INTO `sys_cn_area` VALUES ('1110', '桐城市', '桐城', '1099', null, '中国,安徽省,安庆市,桐城市', '3', '231400', '0556', '340881', 'Tongcheng', '116.9507100', '31.0521600');
INSERT INTO `sys_cn_area` VALUES ('1111', '黄山市', '黄山', '1047', null, '中国,安徽省,黄山市', '2', '245000', '0559', '341000', 'Huangshan', '118.3173250', '29.7092390');
INSERT INTO `sys_cn_area` VALUES ('1112', '屯溪区', '屯溪', '1111', null, '中国,安徽省,黄山市,屯溪区', '3', '245000', '0559', '341002', 'Tunxi', '118.3336800', '29.7113800');
INSERT INTO `sys_cn_area` VALUES ('1113', '黄山区', '黄山', '1111', null, '中国,安徽省,黄山市,黄山区', '3', '242700', '0559', '341003', 'Huangshan', '118.1416000', '30.2729000');
INSERT INTO `sys_cn_area` VALUES ('1114', '徽州区', '徽州', '1111', null, '中国,安徽省,黄山市,徽州区', '3', '245061', '0559', '341004', 'Huizhou', '118.3365400', '29.8278400');
INSERT INTO `sys_cn_area` VALUES ('1115', '歙县', '歙县', '1111', null, '中国,安徽省,黄山市,歙县', '3', '245200', '0559', '341021', 'Shexian', '118.4367600', '29.8674500');
INSERT INTO `sys_cn_area` VALUES ('1116', '休宁县', '休宁', '1111', null, '中国,安徽省,黄山市,休宁县', '3', '245400', '0559', '341022', 'Xiuning', '118.1813600', '29.7860700');
INSERT INTO `sys_cn_area` VALUES ('1117', '黟县', '黟县', '1111', null, '中国,安徽省,黄山市,黟县', '3', '245500', '0559', '341023', 'Yixian', '117.9413700', '29.9258800');
INSERT INTO `sys_cn_area` VALUES ('1118', '祁门县', '祁门', '1111', null, '中国,安徽省,黄山市,祁门县', '3', '245600', '0559', '341024', 'Qimen', '117.7184700', '29.8572300');
INSERT INTO `sys_cn_area` VALUES ('1119', '滁州市', '滁州', '1047', null, '中国,安徽省,滁州市', '2', '239000', '0550', '341100', 'Chuzhou', '118.3162640', '32.3036270');
INSERT INTO `sys_cn_area` VALUES ('1120', '琅琊区', '琅琊', '1119', null, '中国,安徽省,滁州市,琅琊区', '3', '239000', '0550', '341102', 'Langya', '118.3053800', '32.2952100');
INSERT INTO `sys_cn_area` VALUES ('1121', '南谯区', '南谯', '1119', null, '中国,安徽省,滁州市,南谯区', '3', '239000', '0550', '341103', 'Nanqiao', '118.3122200', '32.3186100');
INSERT INTO `sys_cn_area` VALUES ('1122', '来安县', '来安', '1119', null, '中国,安徽省,滁州市,来安县', '3', '239200', '0550', '341122', 'Lai\'an', '118.4343800', '32.4517600');
INSERT INTO `sys_cn_area` VALUES ('1123', '全椒县', '全椒', '1119', null, '中国,安徽省,滁州市,全椒县', '3', '239500', '0550', '341124', 'Quanjiao', '118.2729100', '32.0852400');
INSERT INTO `sys_cn_area` VALUES ('1124', '定远县', '定远', '1119', null, '中国,安徽省,滁州市,定远县', '3', '233200', '0550', '341125', 'Dingyuan', '117.6803500', '32.5248800');
INSERT INTO `sys_cn_area` VALUES ('1125', '凤阳县', '凤阳', '1119', null, '中国,安徽省,滁州市,凤阳县', '3', '233100', '0550', '341126', 'Fengyang', '117.5645400', '32.8650700');
INSERT INTO `sys_cn_area` VALUES ('1126', '天长市', '天长', '1119', null, '中国,安徽省,滁州市,天长市', '3', '239300', '0550', '341181', 'Tianchang', '118.9986800', '32.6912400');
INSERT INTO `sys_cn_area` VALUES ('1127', '明光市', '明光', '1119', null, '中国,安徽省,滁州市,明光市', '3', '239400', '0550', '341182', 'Mingguang', '117.9909300', '32.7781900');
INSERT INTO `sys_cn_area` VALUES ('1128', '阜阳市', '阜阳', '1047', null, '中国,安徽省,阜阳市', '2', '236033', '0558', '341200', 'Fuyang', '115.8197290', '32.8969690');
INSERT INTO `sys_cn_area` VALUES ('1129', '颍州区', '颍州', '1128', null, '中国,安徽省,阜阳市,颍州区', '3', '236001', '0558', '341202', 'Yingzhou', '115.8069400', '32.8834600');
INSERT INTO `sys_cn_area` VALUES ('1130', '颍东区', '颍东', '1128', null, '中国,安徽省,阜阳市,颍东区', '3', '236058', '0558', '341203', 'Yingdong', '115.8565900', '32.9129600');
INSERT INTO `sys_cn_area` VALUES ('1131', '颍泉区', '颍泉', '1128', null, '中国,安徽省,阜阳市,颍泉区', '3', '236045', '0558', '341204', 'Yingquan', '115.8071200', '32.9249000');
INSERT INTO `sys_cn_area` VALUES ('1132', '临泉县', '临泉', '1128', null, '中国,安徽省,阜阳市,临泉县', '3', '236400', '0558', '341221', 'Linquan', '115.2623200', '33.0675800');
INSERT INTO `sys_cn_area` VALUES ('1133', '太和县', '太和', '1128', null, '中国,安徽省,阜阳市,太和县', '3', '236600', '0558', '341222', 'Taihe', '115.6219100', '33.1602500');
INSERT INTO `sys_cn_area` VALUES ('1134', '阜南县', '阜南', '1128', null, '中国,安徽省,阜阳市,阜南县', '3', '236300', '0558', '341225', 'Funan', '115.5856300', '32.6355100');
INSERT INTO `sys_cn_area` VALUES ('1135', '颍上县', '颍上', '1128', null, '中国,安徽省,阜阳市,颍上县', '3', '236200', '0558', '341226', 'Yingshang', '116.2645800', '32.6299800');
INSERT INTO `sys_cn_area` VALUES ('1136', '界首市', '界首', '1128', null, '中国,安徽省,阜阳市,界首市', '3', '236500', '0558', '341282', 'Jieshou', '115.3744500', '33.2571400');
INSERT INTO `sys_cn_area` VALUES ('1137', '宿州市', '宿州', '1047', null, '中国,安徽省,宿州市', '2', '234000', '0557', '341300', 'Suzhou', '116.9840840', '33.6338910');
INSERT INTO `sys_cn_area` VALUES ('1138', '埇桥区', '埇桥', '1137', null, '中国,安徽省,宿州市,埇桥区', '3', '234000', '0557', '341302', 'Yongqiao', '116.9773100', '33.6405800');
INSERT INTO `sys_cn_area` VALUES ('1139', '砀山县', '砀山', '1137', null, '中国,安徽省,宿州市,砀山县', '3', '235300', '0557', '341321', 'Dangshan', '116.3536300', '34.4235600');
INSERT INTO `sys_cn_area` VALUES ('1140', '萧县', '萧县', '1137', null, '中国,安徽省,宿州市,萧县', '3', '235200', '0557', '341322', 'Xiaoxian', '116.9454600', '34.1879000');
INSERT INTO `sys_cn_area` VALUES ('1141', '灵璧县', '灵璧', '1137', null, '中国,安徽省,宿州市,灵璧县', '3', '234200', '0557', '341323', 'Lingbi', '117.5581300', '33.5433900');
INSERT INTO `sys_cn_area` VALUES ('1142', '泗县', '泗县', '1137', null, '中国,安徽省,宿州市,泗县', '3', '234300', '0557', '341324', 'Sixian', '117.9103300', '33.4829500');
INSERT INTO `sys_cn_area` VALUES ('1143', '六安市', '六安', '1047', null, '中国,安徽省,六安市', '2', '237000', '0564', '341500', 'Lu\'an', '116.5076760', '31.7528890');
INSERT INTO `sys_cn_area` VALUES ('1144', '金安区', '金安', '1143', null, '中国,安徽省,六安市,金安区', '3', '237005', '0564', '341502', 'Jin\'an', '116.5091200', '31.7557300');
INSERT INTO `sys_cn_area` VALUES ('1145', '裕安区', '裕安', '1143', null, '中国,安徽省,六安市,裕安区', '3', '237010', '0564', '341503', 'Yu\'an', '116.4798500', '31.7378700');
INSERT INTO `sys_cn_area` VALUES ('1146', '寿县', '寿县', '1143', null, '中国,安徽省,六安市,寿县', '3', '232200', '0564', '341521', 'Shouxian', '116.7846600', '32.5765300');
INSERT INTO `sys_cn_area` VALUES ('1147', '霍邱县', '霍邱', '1143', null, '中国,安徽省,六安市,霍邱县', '3', '237400', '0564', '341522', 'Huoqiu', '116.2779500', '32.3530000');
INSERT INTO `sys_cn_area` VALUES ('1148', '舒城县', '舒城', '1143', null, '中国,安徽省,六安市,舒城县', '3', '231300', '0564', '341523', 'Shucheng', '116.9449100', '31.4641300');
INSERT INTO `sys_cn_area` VALUES ('1149', '金寨县', '金寨', '1143', null, '中国,安徽省,六安市,金寨县', '3', '237300', '0564', '341524', 'Jinzhai', '115.9346300', '31.7351000');
INSERT INTO `sys_cn_area` VALUES ('1150', '霍山县', '霍山', '1143', null, '中国,安徽省,六安市,霍山县', '3', '237200', '0564', '341525', 'Huoshan', '116.3329100', '31.3929000');
INSERT INTO `sys_cn_area` VALUES ('1151', '亳州市', '亳州', '1047', null, '中国,安徽省,亳州市', '2', '236802', '0558', '341600', 'Bozhou', '115.7829390', '33.8693380');
INSERT INTO `sys_cn_area` VALUES ('1152', '谯城区', '谯城', '1151', null, '中国,安徽省,亳州市,谯城区', '3', '236800', '0558', '341602', 'Qiaocheng', '115.7794100', '33.8753200');
INSERT INTO `sys_cn_area` VALUES ('1153', '涡阳县', '涡阳', '1151', null, '中国,安徽省,亳州市,涡阳县', '3', '233600', '0558', '341621', 'Guoyang', '116.2168200', '33.5091100');
INSERT INTO `sys_cn_area` VALUES ('1154', '蒙城县', '蒙城', '1151', null, '中国,安徽省,亳州市,蒙城县', '3', '233500', '0558', '341622', 'Mengcheng', '116.5646000', '33.2647700');
INSERT INTO `sys_cn_area` VALUES ('1155', '利辛县', '利辛', '1151', null, '中国,安徽省,亳州市,利辛县', '3', '236700', '0558', '341623', 'Lixin', '116.2080000', '33.1419800');
INSERT INTO `sys_cn_area` VALUES ('1156', '池州市', '池州', '1047', null, '中国,安徽省,池州市', '2', '247100', '0566', '341700', 'Chizhou', '117.4891570', '30.6560370');
INSERT INTO `sys_cn_area` VALUES ('1157', '贵池区', '贵池', '1156', null, '中国,安徽省,池州市,贵池区', '3', '247100', '0566', '341702', 'Guichi', '117.4872200', '30.6528300');
INSERT INTO `sys_cn_area` VALUES ('1158', '东至县', '东至', '1156', null, '中国,安徽省,池州市,东至县', '3', '247200', '0566', '341721', 'Dongzhi', '117.0271900', '30.0969000');
INSERT INTO `sys_cn_area` VALUES ('1159', '石台县', '石台', '1156', null, '中国,安徽省,池州市,石台县', '3', '245100', '0566', '341722', 'Shitai', '117.4866600', '30.2104200');
INSERT INTO `sys_cn_area` VALUES ('1160', '青阳县', '青阳', '1156', null, '中国,安徽省,池州市,青阳县', '3', '242800', '0566', '341723', 'Qingyang', '117.8474400', '30.6393200');
INSERT INTO `sys_cn_area` VALUES ('1161', '宣城市', '宣城', '1047', null, '中国,安徽省,宣城市', '2', '242000', '0563', '341800', 'Xuancheng', '118.7579950', '30.9456670');
INSERT INTO `sys_cn_area` VALUES ('1162', '宣州区', '宣州', '1161', null, '中国,安徽省,宣城市,宣州区', '3', '242000', '0563', '341802', 'Xuanzhou', '118.7546200', '30.9443900');
INSERT INTO `sys_cn_area` VALUES ('1163', '郎溪县', '郎溪', '1161', null, '中国,安徽省,宣城市,郎溪县', '3', '242100', '0563', '341821', 'Langxi', '119.1792300', '31.1259900');
INSERT INTO `sys_cn_area` VALUES ('1164', '广德县', '广德', '1161', null, '中国,安徽省,宣城市,广德县', '3', '242200', '0563', '341822', 'Guangde', '119.4176900', '30.8937100');
INSERT INTO `sys_cn_area` VALUES ('1165', '泾县', '泾县', '1161', null, '中国,安徽省,宣城市,泾县', '3', '242500', '0563', '341823', 'Jingxian', '118.4196400', '30.6949800');
INSERT INTO `sys_cn_area` VALUES ('1166', '绩溪县', '绩溪', '1161', null, '中国,安徽省,宣城市,绩溪县', '3', '245300', '0563', '341824', 'Jixi', '118.5976500', '30.0706900');
INSERT INTO `sys_cn_area` VALUES ('1167', '旌德县', '旌德', '1161', null, '中国,安徽省,宣城市,旌德县', '3', '242600', '0563', '341825', 'Jingde', '118.5429900', '30.2889800');
INSERT INTO `sys_cn_area` VALUES ('1168', '宁国市', '宁国', '1161', null, '中国,安徽省,宣城市,宁国市', '3', '242300', '0563', '341881', 'Ningguo', '118.9834900', '30.6238000');
INSERT INTO `sys_cn_area` VALUES ('1169', '福建省', '福建', '1', null, '中国,福建省', '1', null, '', '350000', 'Fujian', '119.3062390', '26.0753020');
INSERT INTO `sys_cn_area` VALUES ('1170', '福州市', '福州', '1169', null, '中国,福建省,福州市', '2', '350001', '0591', '350100', 'Fuzhou', '119.3062390', '26.0753020');
INSERT INTO `sys_cn_area` VALUES ('1171', '鼓楼区', '鼓楼', '1170', null, '中国,福建省,福州市,鼓楼区', '3', '350001', '0591', '350102', 'Gulou', '119.3038400', '26.0822500');
INSERT INTO `sys_cn_area` VALUES ('1172', '台江区', '台江', '1170', null, '中国,福建省,福州市,台江区', '3', '350004', '0591', '350103', 'Taijiang', '119.3089900', '26.0620400');
INSERT INTO `sys_cn_area` VALUES ('1173', '仓山区', '仓山', '1170', null, '中国,福建省,福州市,仓山区', '3', '350007', '0591', '350104', 'Cangshan', '119.3154300', '26.0433500');
INSERT INTO `sys_cn_area` VALUES ('1174', '马尾区', '马尾', '1170', null, '中国,福建省,福州市,马尾区', '3', '350015', '0591', '350105', 'Mawei', '119.4555000', '25.9894200');
INSERT INTO `sys_cn_area` VALUES ('1175', '晋安区', '晋安', '1170', null, '中国,福建省,福州市,晋安区', '3', '350011', '0591', '350111', 'Jin\'an', '119.3282800', '26.0818000');
INSERT INTO `sys_cn_area` VALUES ('1176', '闽侯县', '闽侯', '1170', null, '中国,福建省,福州市,闽侯县', '3', '350100', '0591', '350121', 'Minhou', '119.1338800', '26.1501400');
INSERT INTO `sys_cn_area` VALUES ('1177', '连江县', '连江', '1170', null, '中国,福建省,福州市,连江县', '3', '350500', '0591', '350122', 'Lianjiang', '119.5343300', '26.1946600');
INSERT INTO `sys_cn_area` VALUES ('1178', '罗源县', '罗源', '1170', null, '中国,福建省,福州市,罗源县', '3', '350600', '0591', '350123', 'Luoyuan', '119.5509000', '26.4875200');
INSERT INTO `sys_cn_area` VALUES ('1179', '闽清县', '闽清', '1170', null, '中国,福建省,福州市,闽清县', '3', '350800', '0591', '350124', 'Minqing', '118.8623000', '26.2190100');
INSERT INTO `sys_cn_area` VALUES ('1180', '永泰县', '永泰', '1170', null, '中国,福建省,福州市,永泰县', '3', '350700', '0591', '350125', 'Yongtai', '118.9360000', '25.8681600');
INSERT INTO `sys_cn_area` VALUES ('1181', '平潭县', '平潭', '1170', null, '中国,福建省,福州市,平潭县', '3', '350400', '0591', '350128', 'Pingtan', '119.7911970', '25.5036720');
INSERT INTO `sys_cn_area` VALUES ('1182', '福清市', '福清', '1170', null, '中国,福建省,福州市,福清市', '3', '350300', '0591', '350181', 'Fuqing', '119.3850700', '25.7208600');
INSERT INTO `sys_cn_area` VALUES ('1183', '长乐市', '长乐', '1170', null, '中国,福建省,福州市,长乐市', '3', '350200', '0591', '350182', 'Changle', '119.5231300', '25.9627600');
INSERT INTO `sys_cn_area` VALUES ('1184', '厦门市', '厦门', '1169', null, '中国,福建省,厦门市', '2', '361003', '0592', '350200', 'Xiamen', '118.1102200', '24.4904740');
INSERT INTO `sys_cn_area` VALUES ('1185', '思明区', '思明', '1184', null, '中国,福建省,厦门市,思明区', '3', '361001', '0592', '350203', 'Siming', '118.0823300', '24.4454300');
INSERT INTO `sys_cn_area` VALUES ('1186', '海沧区', '海沧', '1184', null, '中国,福建省,厦门市,海沧区', '3', '361026', '0592', '350205', 'Haicang', '118.0328900', '24.4846100');
INSERT INTO `sys_cn_area` VALUES ('1187', '湖里区', '湖里', '1184', null, '中国,福建省,厦门市,湖里区', '3', '361006', '0592', '350206', 'Huli', '118.1462100', '24.5125300');
INSERT INTO `sys_cn_area` VALUES ('1188', '集美区', '集美', '1184', null, '中国,福建省,厦门市,集美区', '3', '361021', '0592', '350211', 'Jimei', '118.0971900', '24.5758400');
INSERT INTO `sys_cn_area` VALUES ('1189', '同安区', '同安', '1184', null, '中国,福建省,厦门市,同安区', '3', '361100', '0592', '350212', 'Tong\'an', '118.1519700', '24.7230800');
INSERT INTO `sys_cn_area` VALUES ('1190', '翔安区', '翔安', '1184', null, '中国,福建省,厦门市,翔安区', '3', '361101', '0592', '350213', 'Xiang\'an', '118.2478300', '24.6186300');
INSERT INTO `sys_cn_area` VALUES ('1191', '莆田市', '莆田', '1169', null, '中国,福建省,莆田市', '2', '351100', '0594', '350300', 'Putian', '119.0075580', '25.4310110');
INSERT INTO `sys_cn_area` VALUES ('1192', '城厢区', '城厢', '1191', null, '中国,福建省,莆田市,城厢区', '3', '351100', '0594', '350302', 'Chengxiang', '118.9946200', '25.4187200');
INSERT INTO `sys_cn_area` VALUES ('1193', '涵江区', '涵江', '1191', null, '中国,福建省,莆田市,涵江区', '3', '351111', '0594', '350303', 'Hanjiang', '119.1162100', '25.4587600');
INSERT INTO `sys_cn_area` VALUES ('1194', '荔城区', '荔城', '1191', null, '中国,福建省,莆田市,荔城区', '3', '351100', '0594', '350304', 'Licheng', '119.0133900', '25.4336900');
INSERT INTO `sys_cn_area` VALUES ('1195', '秀屿区', '秀屿', '1191', null, '中国,福建省,莆田市,秀屿区', '3', '351152', '0594', '350305', 'Xiuyu', '119.1055300', '25.3183100');
INSERT INTO `sys_cn_area` VALUES ('1196', '仙游县', '仙游', '1191', null, '中国,福建省,莆田市,仙游县', '3', '351200', '0594', '350322', 'Xianyou', '118.6917700', '25.3621400');
INSERT INTO `sys_cn_area` VALUES ('1197', '三明市', '三明', '1169', null, '中国,福建省,三明市', '2', '365000', '0598', '350400', 'Sanming', '117.6350010', '26.2654440');
INSERT INTO `sys_cn_area` VALUES ('1198', '梅列区', '梅列', '1197', null, '中国,福建省,三明市,梅列区', '3', '365000', '0598', '350402', 'Meilie', '117.6458500', '26.2717100');
INSERT INTO `sys_cn_area` VALUES ('1199', '三元区', '三元', '1197', null, '中国,福建省,三明市,三元区', '3', '365001', '0598', '350403', 'Sanyuan', '117.6078800', '26.2337200');
INSERT INTO `sys_cn_area` VALUES ('1200', '明溪县', '明溪', '1197', null, '中国,福建省,三明市,明溪县', '3', '365200', '0598', '350421', 'Mingxi', '117.2049800', '26.3529400');
INSERT INTO `sys_cn_area` VALUES ('1201', '清流县', '清流', '1197', null, '中国,福建省,三明市,清流县', '3', '365300', '0598', '350423', 'Qingliu', '116.8146000', '26.1714400');
INSERT INTO `sys_cn_area` VALUES ('1202', '宁化县', '宁化', '1197', null, '中国,福建省,三明市,宁化县', '3', '365400', '0598', '350424', 'Ninghua', '116.6610100', '26.2587400');
INSERT INTO `sys_cn_area` VALUES ('1203', '大田县', '大田', '1197', null, '中国,福建省,三明市,大田县', '3', '366100', '0598', '350425', 'Datian', '117.8471000', '25.6926000');
INSERT INTO `sys_cn_area` VALUES ('1204', '尤溪县', '尤溪', '1197', null, '中国,福建省,三明市,尤溪县', '3', '365100', '0598', '350426', 'Youxi', '118.1904900', '26.1700200');
INSERT INTO `sys_cn_area` VALUES ('1205', '沙县', '沙县', '1197', null, '中国,福建省,三明市,沙县', '3', '365500', '0598', '350427', 'Shaxian', '117.7926600', '26.3961500');
INSERT INTO `sys_cn_area` VALUES ('1206', '将乐县', '将乐', '1197', null, '中国,福建省,三明市,将乐县', '3', '353300', '0598', '350428', 'Jiangle', '117.4731700', '26.7283700');
INSERT INTO `sys_cn_area` VALUES ('1207', '泰宁县', '泰宁', '1197', null, '中国,福建省,三明市,泰宁县', '3', '354400', '0598', '350429', 'Taining', '117.1757800', '26.9001000');
INSERT INTO `sys_cn_area` VALUES ('1208', '建宁县', '建宁', '1197', null, '中国,福建省,三明市,建宁县', '3', '354500', '0598', '350430', 'Jianning', '116.8460300', '26.8309100');
INSERT INTO `sys_cn_area` VALUES ('1209', '永安市', '永安', '1197', null, '中国,福建省,三明市,永安市', '3', '366000', '0598', '350481', 'Yong\'an', '117.3651700', '25.9413600');
INSERT INTO `sys_cn_area` VALUES ('1210', '泉州市', '泉州', '1169', null, '中国,福建省,泉州市', '2', '362000', '0595', '350500', 'Quanzhou', '118.5894210', '24.9088530');
INSERT INTO `sys_cn_area` VALUES ('1211', '鲤城区', '鲤城', '1210', null, '中国,福建省,泉州市,鲤城区', '3', '362000', '0595', '350502', 'Licheng', '118.5659100', '24.8874100');
INSERT INTO `sys_cn_area` VALUES ('1212', '丰泽区', '丰泽', '1210', null, '中国,福建省,泉州市,丰泽区', '3', '362000', '0595', '350503', 'Fengze', '118.6132800', '24.8911900');
INSERT INTO `sys_cn_area` VALUES ('1213', '洛江区', '洛江', '1210', null, '中国,福建省,泉州市,洛江区', '3', '362011', '0595', '350504', 'Luojiang', '118.6711100', '24.9398400');
INSERT INTO `sys_cn_area` VALUES ('1214', '泉港区', '泉港', '1210', null, '中国,福建省,泉州市,泉港区', '3', '362114', '0595', '350505', 'Quangang', '118.9158600', '25.1200500');
INSERT INTO `sys_cn_area` VALUES ('1215', '惠安县', '惠安', '1210', null, '中国,福建省,泉州市,惠安县', '3', '362100', '0595', '350521', 'Hui\'an', '118.7968700', '25.0305900');
INSERT INTO `sys_cn_area` VALUES ('1216', '安溪县', '安溪', '1210', null, '中国,福建省,泉州市,安溪县', '3', '362400', '0595', '350524', 'Anxi', '118.1871900', '25.0562700');
INSERT INTO `sys_cn_area` VALUES ('1217', '永春县', '永春', '1210', null, '中国,福建省,泉州市,永春县', '3', '362600', '0595', '350525', 'Yongchun', '118.2943700', '25.3218300');
INSERT INTO `sys_cn_area` VALUES ('1218', '德化县', '德化', '1210', null, '中国,福建省,泉州市,德化县', '3', '362500', '0595', '350526', 'Dehua', '118.2417600', '25.4922400');
INSERT INTO `sys_cn_area` VALUES ('1219', '金门县', '金门', '1210', null, '中国,福建省,泉州市,金门县', '3', null, '', '350527', 'Jinmen', '118.3226300', '24.4292200');
INSERT INTO `sys_cn_area` VALUES ('1220', '石狮市', '石狮', '1210', null, '中国,福建省,泉州市,石狮市', '3', '362700', '0595', '350581', 'Shishi', '118.6477900', '24.7324200');
INSERT INTO `sys_cn_area` VALUES ('1221', '晋江市', '晋江', '1210', null, '中国,福建省,泉州市,晋江市', '3', '362200', '0595', '350582', 'Jinjiang', '118.5519400', '24.7814100');
INSERT INTO `sys_cn_area` VALUES ('1222', '南安市', '南安', '1210', null, '中国,福建省,泉州市,南安市', '3', '362300', '0595', '350583', 'Nan\'an', '118.3858900', '24.9605500');
INSERT INTO `sys_cn_area` VALUES ('1223', '漳州市', '漳州', '1169', null, '中国,福建省,漳州市', '2', '363005', '0596', '350600', 'Zhangzhou', '117.6618010', '24.5108970');
INSERT INTO `sys_cn_area` VALUES ('1224', '芗城区', '芗城', '1223', null, '中国,福建省,漳州市,芗城区', '3', '363000', '0596', '350602', 'Xiangcheng', '117.6540200', '24.5108100');
INSERT INTO `sys_cn_area` VALUES ('1225', '龙文区', '龙文', '1223', null, '中国,福建省,漳州市,龙文区', '3', '363005', '0596', '350603', 'Longwen', '117.7097100', '24.5032300');
INSERT INTO `sys_cn_area` VALUES ('1226', '云霄县', '云霄', '1223', null, '中国,福建省,漳州市,云霄县', '3', '363300', '0596', '350622', 'Yunxiao', '117.3405100', '23.9553400');
INSERT INTO `sys_cn_area` VALUES ('1227', '漳浦县', '漳浦', '1223', null, '中国,福建省,漳州市,漳浦县', '3', '363200', '0596', '350623', 'Zhangpu', '117.6136700', '24.1170600');
INSERT INTO `sys_cn_area` VALUES ('1228', '诏安县', '诏安', '1223', null, '中国,福建省,漳州市,诏安县', '3', '363500', '0596', '350624', 'Zhao\'an', '117.1750100', '23.7114800');
INSERT INTO `sys_cn_area` VALUES ('1229', '长泰县', '长泰', '1223', null, '中国,福建省,漳州市,长泰县', '3', '363900', '0596', '350625', 'Changtai', '117.7592400', '24.6252600');
INSERT INTO `sys_cn_area` VALUES ('1230', '东山县', '东山', '1223', null, '中国,福建省,漳州市,东山县', '3', '363400', '0596', '350626', 'Dongshan', '117.4282200', '23.7010900');
INSERT INTO `sys_cn_area` VALUES ('1231', '南靖县', '南靖', '1223', null, '中国,福建省,漳州市,南靖县', '3', '363600', '0596', '350627', 'Nanjing', '117.3573600', '24.5144800');
INSERT INTO `sys_cn_area` VALUES ('1232', '平和县', '平和', '1223', null, '中国,福建省,漳州市,平和县', '3', '363700', '0596', '350628', 'Pinghe', '117.3124000', '24.3639500');
INSERT INTO `sys_cn_area` VALUES ('1233', '华安县', '华安', '1223', null, '中国,福建省,漳州市,华安县', '3', '363800', '0596', '350629', 'Hua\'an', '117.5407700', '25.0056300');
INSERT INTO `sys_cn_area` VALUES ('1234', '龙海市', '龙海', '1223', null, '中国,福建省,漳州市,龙海市', '3', '363100', '0596', '350681', 'Longhai', '117.8180200', '24.4465500');
INSERT INTO `sys_cn_area` VALUES ('1235', '南平市', '南平', '1169', null, '中国,福建省,南平市', '2', '353000', '0599', '350700', 'Nanping', '118.1784590', '26.6356270');
INSERT INTO `sys_cn_area` VALUES ('1236', '延平区', '延平', '1235', null, '中国,福建省,南平市,延平区', '3', '353000', '0600', '350702', 'Yanping', '118.1818900', '26.6374500');
INSERT INTO `sys_cn_area` VALUES ('1237', '建阳区', '建阳', '1235', null, '中国,福建省,南平市,建阳区', '3', '354200', '0599', '350703', 'Jianyang', '118.1226700', '27.3320670');
INSERT INTO `sys_cn_area` VALUES ('1238', '顺昌县', '顺昌', '1235', null, '中国,福建省,南平市,顺昌县', '3', '353200', '0605', '350721', 'Shunchang', '117.8103000', '26.7929800');
INSERT INTO `sys_cn_area` VALUES ('1239', '浦城县', '浦城', '1235', null, '中国,福建省,南平市,浦城县', '3', '353400', '0606', '350722', 'Pucheng', '118.5400700', '27.9188800');
INSERT INTO `sys_cn_area` VALUES ('1240', '光泽县', '光泽', '1235', null, '中国,福建省,南平市,光泽县', '3', '354100', '0607', '350723', 'Guangze', '117.3334600', '27.5423100');
INSERT INTO `sys_cn_area` VALUES ('1241', '松溪县', '松溪', '1235', null, '中国,福建省,南平市,松溪县', '3', '353500', '0608', '350724', 'Songxi', '118.7853300', '27.5262400');
INSERT INTO `sys_cn_area` VALUES ('1242', '政和县', '政和', '1235', null, '中国,福建省,南平市,政和县', '3', '353600', '0609', '350725', 'Zhenghe', '118.8557100', '27.3676900');
INSERT INTO `sys_cn_area` VALUES ('1243', '邵武市', '邵武', '1235', null, '中国,福建省,南平市,邵武市', '3', '354000', '0601', '350781', 'Shaowu', '117.4924000', '27.3403300');
INSERT INTO `sys_cn_area` VALUES ('1244', '武夷山市', '武夷山', '1235', null, '中国,福建省,南平市,武夷山市', '3', '354300', '0602', '350782', 'Wuyishan', '118.0366500', '27.7554300');
INSERT INTO `sys_cn_area` VALUES ('1245', '建瓯市', '建瓯', '1235', null, '中国,福建省,南平市,建瓯市', '3', '353100', '0603', '350783', 'Jianou', '118.2976600', '27.0230100');
INSERT INTO `sys_cn_area` VALUES ('1246', '龙岩市', '龙岩', '1169', null, '中国,福建省,龙岩市', '2', '364000', '0597', '350800', 'Longyan', '117.0297800', '25.0916030');
INSERT INTO `sys_cn_area` VALUES ('1247', '新罗区', '新罗', '1246', null, '中国,福建省,龙岩市,新罗区', '3', '364000', '0597', '350802', 'Xinluo', '117.0369300', '25.0983400');
INSERT INTO `sys_cn_area` VALUES ('1248', '长汀县', '长汀', '1246', null, '中国,福建省,龙岩市,长汀县', '3', '366300', '0597', '350821', 'Changting', '116.3588800', '25.8277300');
INSERT INTO `sys_cn_area` VALUES ('1249', '永定区', '永定', '1246', null, '中国,福建省,龙岩市,永定区', '3', '364100', '0597', '350822', 'Yongding', '116.7319900', '24.7230200');
INSERT INTO `sys_cn_area` VALUES ('1250', '上杭县', '上杭', '1246', null, '中国,福建省,龙岩市,上杭县', '3', '364200', '0597', '350823', 'Shanghang', '116.4202200', '25.0494300');
INSERT INTO `sys_cn_area` VALUES ('1251', '武平县', '武平', '1246', null, '中国,福建省,龙岩市,武平县', '3', '364300', '0597', '350824', 'Wuping', '116.1022900', '25.0924400');
INSERT INTO `sys_cn_area` VALUES ('1252', '连城县', '连城', '1246', null, '中国,福建省,龙岩市,连城县', '3', '366200', '0597', '350825', 'Liancheng', '116.7545400', '25.7103000');
INSERT INTO `sys_cn_area` VALUES ('1253', '漳平市', '漳平', '1246', null, '中国,福建省,龙岩市,漳平市', '3', '364400', '0597', '350881', 'Zhangping', '117.4199200', '25.2910900');
INSERT INTO `sys_cn_area` VALUES ('1254', '宁德市', '宁德', '1169', null, '中国,福建省,宁德市', '2', '352100', '0593', '350900', 'Ningde', '119.5270820', '26.6592400');
INSERT INTO `sys_cn_area` VALUES ('1255', '蕉城区', '蕉城', '1254', null, '中国,福建省,宁德市,蕉城区', '3', '352100', '0593', '350902', 'Jiaocheng', '119.5264300', '26.6604800');
INSERT INTO `sys_cn_area` VALUES ('1256', '霞浦县', '霞浦', '1254', null, '中国,福建省,宁德市,霞浦县', '3', '355100', '0593', '350921', 'Xiapu', '119.9989300', '26.8857800');
INSERT INTO `sys_cn_area` VALUES ('1257', '古田县', '古田', '1254', null, '中国,福建省,宁德市,古田县', '3', '352200', '0593', '350922', 'Gutian', '118.7468800', '26.5768200');
INSERT INTO `sys_cn_area` VALUES ('1258', '屏南县', '屏南', '1254', null, '中国,福建省,宁德市,屏南县', '3', '352300', '0593', '350923', 'Pingnan', '118.9886100', '26.9109900');
INSERT INTO `sys_cn_area` VALUES ('1259', '寿宁县', '寿宁', '1254', null, '中国,福建省,宁德市,寿宁县', '3', '355500', '0593', '350924', 'Shouning', '119.5039000', '27.4599600');
INSERT INTO `sys_cn_area` VALUES ('1260', '周宁县', '周宁', '1254', null, '中国,福建省,宁德市,周宁县', '3', '355400', '0593', '350925', 'Zhouning', '119.3383700', '27.1066400');
INSERT INTO `sys_cn_area` VALUES ('1261', '柘荣县', '柘荣', '1254', null, '中国,福建省,宁德市,柘荣县', '3', '355300', '0593', '350926', 'Zherong', '119.8997100', '27.2354300');
INSERT INTO `sys_cn_area` VALUES ('1262', '福安市', '福安', '1254', null, '中国,福建省,宁德市,福安市', '3', '355000', '0593', '350981', 'Fu\'an', '119.6495000', '27.0867300');
INSERT INTO `sys_cn_area` VALUES ('1263', '福鼎市', '福鼎', '1254', null, '中国,福建省,宁德市,福鼎市', '3', '355200', '0593', '350982', 'Fuding', '120.2166400', '27.3243000');
INSERT INTO `sys_cn_area` VALUES ('1264', '江西省', '江西', '1', null, '中国,江西省', '1', null, '', '360000', 'Jiangxi', '115.8921510', '28.6764930');
INSERT INTO `sys_cn_area` VALUES ('1265', '南昌市', '南昌', '1264', null, '中国,江西省,南昌市', '2', '330008', '0791', '360100', 'Nanchang', '115.8921510', '28.6764930');
INSERT INTO `sys_cn_area` VALUES ('1266', '东湖区', '东湖', '1265', null, '中国,江西省,南昌市,东湖区', '3', '330006', '0791', '360102', 'Donghu', '115.8988000', '28.6850500');
INSERT INTO `sys_cn_area` VALUES ('1267', '西湖区', '西湖', '1265', null, '中国,江西省,南昌市,西湖区', '3', '330009', '0791', '360103', 'Xihu', '115.8772800', '28.6568800');
INSERT INTO `sys_cn_area` VALUES ('1268', '青云谱区', '青云谱', '1265', null, '中国,江西省,南昌市,青云谱区', '3', '330001', '0791', '360104', 'Qingyunpu', '115.9150000', '28.6319900');
INSERT INTO `sys_cn_area` VALUES ('1269', '湾里区', '湾里', '1265', null, '中国,江西省,南昌市,湾里区', '3', '330004', '0791', '360105', 'Wanli', '115.7310400', '28.7152900');
INSERT INTO `sys_cn_area` VALUES ('1270', '青山湖区', '青山湖', '1265', null, '中国,江西省,南昌市,青山湖区', '3', '330029', '0791', '360111', 'Qingshanhu', '115.9617000', '28.6820600');
INSERT INTO `sys_cn_area` VALUES ('1271', '南昌县', '南昌', '1265', null, '中国,江西省,南昌市,南昌县', '3', '330200', '0791', '360121', 'Nanchang', '115.9439300', '28.5455900');
INSERT INTO `sys_cn_area` VALUES ('1272', '新建县', '新建', '1265', null, '中国,江西省,南昌市,新建县', '3', '330100', '0791', '360122', 'Xinjian', '115.8154600', '28.6924800');
INSERT INTO `sys_cn_area` VALUES ('1273', '安义县', '安义', '1265', null, '中国,江西省,南昌市,安义县', '3', '330500', '0791', '360123', 'Anyi', '115.5487900', '28.8460200');
INSERT INTO `sys_cn_area` VALUES ('1274', '进贤县', '进贤', '1265', null, '中国,江西省,南昌市,进贤县', '3', '331700', '0791', '360124', 'Jinxian', '116.2408700', '28.3767900');
INSERT INTO `sys_cn_area` VALUES ('1275', '景德镇市', '景德镇', '1264', null, '中国,江西省,景德镇市', '2', '333000', '0798', '360200', 'Jingdezhen', '117.2146640', '29.2925600');
INSERT INTO `sys_cn_area` VALUES ('1276', '昌江区', '昌江', '1275', null, '中国,江西省,景德镇市,昌江区', '3', '333000', '0799', '360202', 'Changjiang', '117.1835900', '29.2732100');
INSERT INTO `sys_cn_area` VALUES ('1277', '珠山区', '珠山', '1275', null, '中国,江西省,景德镇市,珠山区', '3', '333000', '0800', '360203', 'Zhushan', '117.2023300', '29.3012700');
INSERT INTO `sys_cn_area` VALUES ('1278', '浮梁县', '浮梁', '1275', null, '中国,江西省,景德镇市,浮梁县', '3', '333400', '0802', '360222', 'Fuliang', '117.2151700', '29.3515600');
INSERT INTO `sys_cn_area` VALUES ('1279', '乐平市', '乐平', '1275', null, '中国,江西省,景德镇市,乐平市', '3', '333300', '0801', '360281', 'Leping', '117.1288700', '28.9629500');
INSERT INTO `sys_cn_area` VALUES ('1280', '萍乡市', '萍乡', '1264', null, '中国,江西省,萍乡市', '2', '337000', '0799', '360300', 'Pingxiang', '113.8521860', '27.6229460');
INSERT INTO `sys_cn_area` VALUES ('1281', '安源区', '安源', '1280', null, '中国,江西省,萍乡市,安源区', '3', '337000', '0800', '360302', 'Anyuan', '113.8913500', '27.6165300');
INSERT INTO `sys_cn_area` VALUES ('1282', '湘东区', '湘东', '1280', null, '中国,江西省,萍乡市,湘东区', '3', '337016', '0801', '360313', 'Xiangdong', '113.7329400', '27.6400700');
INSERT INTO `sys_cn_area` VALUES ('1283', '莲花县', '莲花', '1280', null, '中国,江西省,萍乡市,莲花县', '3', '337100', '0802', '360321', 'Lianhua', '113.9614200', '27.1286600');
INSERT INTO `sys_cn_area` VALUES ('1284', '上栗县', '上栗', '1280', null, '中国,江西省,萍乡市,上栗县', '3', '337009', '0803', '360322', 'Shangli', '113.7940300', '27.8746700');
INSERT INTO `sys_cn_area` VALUES ('1285', '芦溪县', '芦溪', '1280', null, '中国,江西省,萍乡市,芦溪县', '3', '337053', '0804', '360323', 'Luxi', '114.0295100', '27.6306300');
INSERT INTO `sys_cn_area` VALUES ('1286', '九江市', '九江', '1264', null, '中国,江西省,九江市', '2', '332000', '0792', '360400', 'Jiujiang', '115.9928110', '29.7120340');
INSERT INTO `sys_cn_area` VALUES ('1287', '庐山区', '庐山', '1286', null, '中国,江西省,九江市,庐山区', '3', '332005', '0792', '360402', 'Lushan', '115.9890400', '29.6717700');
INSERT INTO `sys_cn_area` VALUES ('1288', '浔阳区', '浔阳', '1286', null, '中国,江西省,九江市,浔阳区', '3', '332000', '0792', '360403', 'Xunyang', '115.9898600', '29.7278600');
INSERT INTO `sys_cn_area` VALUES ('1289', '九江县', '九江', '1286', null, '中国,江西省,九江市,九江县', '3', '332100', '0792', '360421', 'Jiujiang', '115.9112800', '29.6085200');
INSERT INTO `sys_cn_area` VALUES ('1290', '武宁县', '武宁', '1286', null, '中国,江西省,九江市,武宁县', '3', '332300', '0792', '360423', 'Wuning', '115.1006100', '29.2584000');
INSERT INTO `sys_cn_area` VALUES ('1291', '修水县', '修水', '1286', null, '中国,江西省,九江市,修水县', '3', '332400', '0792', '360424', 'Xiushui', '114.5468400', '29.0253900');
INSERT INTO `sys_cn_area` VALUES ('1292', '永修县', '永修', '1286', null, '中国,江西省,九江市,永修县', '3', '330300', '0792', '360425', 'Yongxiu', '115.8091100', '29.0209300');
INSERT INTO `sys_cn_area` VALUES ('1293', '德安县', '德安', '1286', null, '中国,江西省,九江市,德安县', '3', '330400', '0792', '360426', 'De\'an', '115.7560100', '29.3134100');
INSERT INTO `sys_cn_area` VALUES ('1294', '星子县', '星子', '1286', null, '中国,江西省,九江市,星子县', '3', '332800', '0792', '360427', 'Xingzi', '116.0449200', '29.4460800');
INSERT INTO `sys_cn_area` VALUES ('1295', '都昌县', '都昌', '1286', null, '中国,江西省,九江市,都昌县', '3', '332600', '0792', '360428', 'Duchang', '116.2040100', '29.2732700');
INSERT INTO `sys_cn_area` VALUES ('1296', '湖口县', '湖口', '1286', null, '中国,江西省,九江市,湖口县', '3', '332500', '0792', '360429', 'Hukou', '116.2185300', '29.7381800');
INSERT INTO `sys_cn_area` VALUES ('1297', '彭泽县', '彭泽', '1286', null, '中国,江西省,九江市,彭泽县', '3', '332700', '0792', '360430', 'Pengze', '116.5501100', '29.8958900');
INSERT INTO `sys_cn_area` VALUES ('1298', '瑞昌市', '瑞昌', '1286', null, '中国,江西省,九江市,瑞昌市', '3', '332200', '0792', '360481', 'Ruichang', '115.6670500', '29.6718300');
INSERT INTO `sys_cn_area` VALUES ('1299', '共青城市', '共青城', '1286', null, '中国,江西省,九江市,共青城市', '3', '332020', '0792', '360482', 'Gongqingcheng', '115.8019390', '29.2387850');
INSERT INTO `sys_cn_area` VALUES ('1300', '新余市', '新余', '1264', null, '中国,江西省,新余市', '2', '338025', '0790', '360500', 'Xinyu', '114.9308350', '27.8108340');
INSERT INTO `sys_cn_area` VALUES ('1301', '渝水区', '渝水', '1300', null, '中国,江西省,新余市,渝水区', '3', '338025', '0790', '360502', 'Yushui', '114.9440000', '27.8009800');
INSERT INTO `sys_cn_area` VALUES ('1302', '分宜县', '分宜', '1300', null, '中国,江西省,新余市,分宜县', '3', '336600', '0790', '360521', 'Fenyi', '114.6918900', '27.8147500');
INSERT INTO `sys_cn_area` VALUES ('1303', '鹰潭市', '鹰潭', '1264', null, '中国,江西省,鹰潭市', '2', '335000', '0701', '360600', 'Yingtan', '117.0338380', '28.2386380');
INSERT INTO `sys_cn_area` VALUES ('1304', '月湖区', '月湖', '1303', null, '中国,江西省,鹰潭市,月湖区', '3', '335000', '0701', '360602', 'Yuehu', '117.0373200', '28.2391300');
INSERT INTO `sys_cn_area` VALUES ('1305', '余江县', '余江', '1303', null, '中国,江西省,鹰潭市,余江县', '3', '335200', '0701', '360622', 'Yujiang', '116.8185100', '28.2103400');
INSERT INTO `sys_cn_area` VALUES ('1306', '贵溪市', '贵溪', '1303', null, '中国,江西省,鹰潭市,贵溪市', '3', '335400', '0701', '360681', 'Guixi', '117.2424600', '28.2926000');
INSERT INTO `sys_cn_area` VALUES ('1307', '赣州市', '赣州', '1264', null, '中国,江西省,赣州市', '2', '341000', '0797', '360700', 'Ganzhou', '114.9402780', '25.8509700');
INSERT INTO `sys_cn_area` VALUES ('1308', '章贡区', '章贡', '1307', null, '中国,江西省,赣州市,章贡区', '3', '341000', '0797', '360702', 'Zhanggong', '114.9428400', '25.8624000');
INSERT INTO `sys_cn_area` VALUES ('1309', '南康区', '南康', '1307', null, '中国,江西省,赣州市,南康区', '3', '341400', '0797', '360703', 'Nankang', '114.7569330', '25.6617210');
INSERT INTO `sys_cn_area` VALUES ('1310', '赣县', '赣县', '1307', null, '中国,江西省,赣州市,赣县', '3', '341100', '0797', '360721', 'Ganxian', '115.0117100', '25.8614900');
INSERT INTO `sys_cn_area` VALUES ('1311', '信丰县', '信丰', '1307', null, '中国,江西省,赣州市,信丰县', '3', '341600', '0797', '360722', 'Xinfeng', '114.9227900', '25.3861200');
INSERT INTO `sys_cn_area` VALUES ('1312', '大余县', '大余', '1307', null, '中国,江西省,赣州市,大余县', '3', '341500', '0797', '360723', 'Dayu', '114.3575700', '25.3956100');
INSERT INTO `sys_cn_area` VALUES ('1313', '上犹县', '上犹', '1307', null, '中国,江西省,赣州市,上犹县', '3', '341200', '0797', '360724', 'Shangyou', '114.5413800', '25.7956700');
INSERT INTO `sys_cn_area` VALUES ('1314', '崇义县', '崇义', '1307', null, '中国,江西省,赣州市,崇义县', '3', '341300', '0797', '360725', 'Chongyi', '114.3083500', '25.6818600');
INSERT INTO `sys_cn_area` VALUES ('1315', '安远县', '安远', '1307', null, '中国,江西省,赣州市,安远县', '3', '342100', '0797', '360726', 'Anyuan', '115.3948300', '25.1371000');
INSERT INTO `sys_cn_area` VALUES ('1316', '龙南县', '龙南', '1307', null, '中国,江西省,赣州市,龙南县', '3', '341700', '0797', '360727', 'Longnan', '114.7899400', '24.9108600');
INSERT INTO `sys_cn_area` VALUES ('1317', '定南县', '定南', '1307', null, '中国,江西省,赣州市,定南县', '3', '341900', '0797', '360728', 'Dingnan', '115.0271300', '24.7839500');
INSERT INTO `sys_cn_area` VALUES ('1318', '全南县', '全南', '1307', null, '中国,江西省,赣州市,全南县', '3', '341800', '0797', '360729', 'Quannan', '114.5292000', '24.7432400');
INSERT INTO `sys_cn_area` VALUES ('1319', '宁都县', '宁都', '1307', null, '中国,江西省,赣州市,宁都县', '3', '342800', '0797', '360730', 'Ningdu', '116.0156500', '26.4722700');
INSERT INTO `sys_cn_area` VALUES ('1320', '于都县', '于都', '1307', null, '中国,江西省,赣州市,于都县', '3', '342300', '0797', '360731', 'Yudu', '115.4141500', '25.9525700');
INSERT INTO `sys_cn_area` VALUES ('1321', '兴国县', '兴国', '1307', null, '中国,江西省,赣州市,兴国县', '3', '342400', '0797', '360732', 'Xingguo', '115.3630900', '26.3377600');
INSERT INTO `sys_cn_area` VALUES ('1322', '会昌县', '会昌', '1307', null, '中国,江西省,赣州市,会昌县', '3', '342600', '0797', '360733', 'Huichang', '115.7855500', '25.6006800');
INSERT INTO `sys_cn_area` VALUES ('1323', '寻乌县', '寻乌', '1307', null, '中国,江西省,赣州市,寻乌县', '3', '342200', '0797', '360734', 'Xunwu', '115.6485200', '24.9551300');
INSERT INTO `sys_cn_area` VALUES ('1324', '石城县', '石城', '1307', null, '中国,江西省,赣州市,石城县', '3', '342700', '0797', '360735', 'Shicheng', '116.3442000', '26.3261700');
INSERT INTO `sys_cn_area` VALUES ('1325', '瑞金市', '瑞金', '1307', null, '中国,江西省,赣州市,瑞金市', '3', '342500', '0797', '360781', 'Ruijin', '116.0270300', '25.8855700');
INSERT INTO `sys_cn_area` VALUES ('1326', '吉安市', '吉安', '1264', null, '中国,江西省,吉安市', '2', '343000', '0796', '360800', 'Ji\'an', '114.9863730', '27.1116990');
INSERT INTO `sys_cn_area` VALUES ('1327', '吉州区', '吉州', '1326', null, '中国,江西省,吉安市,吉州区', '3', '343000', '0796', '360802', 'Jizhou', '114.9759800', '27.1066900');
INSERT INTO `sys_cn_area` VALUES ('1328', '青原区', '青原', '1326', null, '中国,江西省,吉安市,青原区', '3', '343009', '0796', '360803', 'Qingyuan', '115.0174700', '27.1057700');
INSERT INTO `sys_cn_area` VALUES ('1329', '吉安县', '吉安', '1326', null, '中国,江西省,吉安市,吉安县', '3', '343100', '0796', '360821', 'Ji\'an', '114.9069500', '27.0404800');
INSERT INTO `sys_cn_area` VALUES ('1330', '吉水县', '吉水', '1326', null, '中国,江西省,吉安市,吉水县', '3', '331600', '0796', '360822', 'Jishui', '115.1343000', '27.2107100');
INSERT INTO `sys_cn_area` VALUES ('1331', '峡江县', '峡江', '1326', null, '中国,江西省,吉安市,峡江县', '3', '331409', '0796', '360823', 'Xiajiang', '115.3172300', '27.5760000');
INSERT INTO `sys_cn_area` VALUES ('1332', '新干县', '新干', '1326', null, '中国,江西省,吉安市,新干县', '3', '331300', '0796', '360824', 'Xingan', '115.3930600', '27.7409200');
INSERT INTO `sys_cn_area` VALUES ('1333', '永丰县', '永丰', '1326', null, '中国,江西省,吉安市,永丰县', '3', '331500', '0796', '360825', 'Yongfeng', '115.4423800', '27.3178500');
INSERT INTO `sys_cn_area` VALUES ('1334', '泰和县', '泰和', '1326', null, '中国,江西省,吉安市,泰和县', '3', '343700', '0796', '360826', 'Taihe', '114.9078900', '26.7911300');
INSERT INTO `sys_cn_area` VALUES ('1335', '遂川县', '遂川', '1326', null, '中国,江西省,吉安市,遂川县', '3', '343900', '0796', '360827', 'Suichuan', '114.5162900', '26.3259800');
INSERT INTO `sys_cn_area` VALUES ('1336', '万安县', '万安', '1326', null, '中国,江西省,吉安市,万安县', '3', '343800', '0796', '360828', 'Wan\'an', '114.7865900', '26.4593100');
INSERT INTO `sys_cn_area` VALUES ('1337', '安福县', '安福', '1326', null, '中国,江西省,吉安市,安福县', '3', '343200', '0796', '360829', 'Anfu', '114.6195600', '27.3927600');
INSERT INTO `sys_cn_area` VALUES ('1338', '永新县', '永新', '1326', null, '中国,江西省,吉安市,永新县', '3', '343400', '0796', '360830', 'Yongxin', '114.2424600', '26.9448800');
INSERT INTO `sys_cn_area` VALUES ('1339', '井冈山市', '井冈山', '1326', null, '中国,江西省,吉安市,井冈山市', '3', '343600', '0796', '360881', 'Jinggangshan', '114.2894900', '26.7480400');
INSERT INTO `sys_cn_area` VALUES ('1340', '宜春市', '宜春', '1264', null, '中国,江西省,宜春市', '2', '336000', '0795', '360900', 'Yichun', '114.3911360', '27.8043000');
INSERT INTO `sys_cn_area` VALUES ('1341', '袁州区', '袁州', '1340', null, '中国,江西省,宜春市,袁州区', '3', '336000', '0795', '360902', 'Yuanzhou', '114.3824600', '27.7964900');
INSERT INTO `sys_cn_area` VALUES ('1342', '奉新县', '奉新', '1340', null, '中国,江西省,宜春市,奉新县', '3', '330700', '0795', '360921', 'Fengxin', '115.4003600', '28.6879000');
INSERT INTO `sys_cn_area` VALUES ('1343', '万载县', '万载', '1340', null, '中国,江西省,宜春市,万载县', '3', '336100', '0795', '360922', 'Wanzai', '114.4458000', '28.1065600');
INSERT INTO `sys_cn_area` VALUES ('1344', '上高县', '上高', '1340', null, '中国,江西省,宜春市,上高县', '3', '336400', '0795', '360923', 'Shanggao', '114.9245900', '28.2342300');
INSERT INTO `sys_cn_area` VALUES ('1345', '宜丰县', '宜丰', '1340', null, '中国,江西省,宜春市,宜丰县', '3', '336300', '0795', '360924', 'Yifeng', '114.7803000', '28.3855500');
INSERT INTO `sys_cn_area` VALUES ('1346', '靖安县', '靖安', '1340', null, '中国,江西省,宜春市,靖安县', '3', '330600', '0795', '360925', 'Jing\'an', '115.3627900', '28.8616700');
INSERT INTO `sys_cn_area` VALUES ('1347', '铜鼓县', '铜鼓', '1340', null, '中国,江西省,宜春市,铜鼓县', '3', '336200', '0795', '360926', 'Tonggu', '114.3703600', '28.5231100');
INSERT INTO `sys_cn_area` VALUES ('1348', '丰城市', '丰城', '1340', null, '中国,江西省,宜春市,丰城市', '3', '331100', '0795', '360981', 'Fengcheng', '115.7711400', '28.1591800');
INSERT INTO `sys_cn_area` VALUES ('1349', '樟树市', '樟树', '1340', null, '中国,江西省,宜春市,樟树市', '3', '331200', '0795', '360982', 'Zhangshu', '115.5465000', '28.0533200');
INSERT INTO `sys_cn_area` VALUES ('1350', '高安市', '高安', '1340', null, '中国,江西省,宜春市,高安市', '3', '330800', '0795', '360983', 'Gao\'an', '115.3753000', '28.4178000');
INSERT INTO `sys_cn_area` VALUES ('1351', '抚州市', '抚州', '1264', null, '中国,江西省,抚州市', '2', '344000', '0794', '361000', 'Fuzhou', '116.3583510', '27.9838500');
INSERT INTO `sys_cn_area` VALUES ('1352', '临川区', '临川', '1351', null, '中国,江西省,抚州市,临川区', '3', '344000', '0794', '361002', 'Linchuan', '116.3591900', '27.9772100');
INSERT INTO `sys_cn_area` VALUES ('1353', '南城县', '南城', '1351', null, '中国,江西省,抚州市,南城县', '3', '344700', '0794', '361021', 'Nancheng', '116.6441900', '27.5538100');
INSERT INTO `sys_cn_area` VALUES ('1354', '黎川县', '黎川', '1351', null, '中国,江西省,抚州市,黎川县', '3', '344600', '0794', '361022', 'Lichuan', '116.9077100', '27.2823200');
INSERT INTO `sys_cn_area` VALUES ('1355', '南丰县', '南丰', '1351', null, '中国,江西省,抚州市,南丰县', '3', '344500', '0794', '361023', 'Nanfeng', '116.5256000', '27.2184200');
INSERT INTO `sys_cn_area` VALUES ('1356', '崇仁县', '崇仁', '1351', null, '中国,江西省,抚州市,崇仁县', '3', '344200', '0794', '361024', 'Chongren', '116.0602100', '27.7596200');
INSERT INTO `sys_cn_area` VALUES ('1357', '乐安县', '乐安', '1351', null, '中国,江西省,抚州市,乐安县', '3', '344300', '0794', '361025', 'Le\'an', '115.8310800', '27.4281200');
INSERT INTO `sys_cn_area` VALUES ('1358', '宜黄县', '宜黄', '1351', null, '中国,江西省,抚州市,宜黄县', '3', '344400', '0794', '361026', 'Yihuang', '116.2362600', '27.5548700');
INSERT INTO `sys_cn_area` VALUES ('1359', '金溪县', '金溪', '1351', null, '中国,江西省,抚州市,金溪县', '3', '344800', '0794', '361027', 'Jinxi', '116.7739200', '27.9075300');
INSERT INTO `sys_cn_area` VALUES ('1360', '资溪县', '资溪', '1351', null, '中国,江西省,抚州市,资溪县', '3', '335300', '0794', '361028', 'Zixi', '117.0693900', '27.7049300');
INSERT INTO `sys_cn_area` VALUES ('1361', '东乡县', '东乡', '1351', null, '中国,江西省,抚州市,东乡县', '3', '331800', '0794', '361029', 'Dongxiang', '116.5903900', '28.2361400');
INSERT INTO `sys_cn_area` VALUES ('1362', '广昌县', '广昌', '1351', null, '中国,江西省,抚州市,广昌县', '3', '344900', '0794', '361030', 'Guangchang', '116.3254700', '26.8341000');
INSERT INTO `sys_cn_area` VALUES ('1363', '上饶市', '上饶', '1264', null, '中国,江西省,上饶市', '2', '334000', '0793', '361100', 'Shangrao', '117.9711850', '28.4444200');
INSERT INTO `sys_cn_area` VALUES ('1364', '信州区', '信州', '1363', null, '中国,江西省,上饶市,信州区', '3', '334000', '0793', '361102', 'Xinzhou', '117.9668200', '28.4312100');
INSERT INTO `sys_cn_area` VALUES ('1365', '上饶县', '上饶', '1363', null, '中国,江西省,上饶市,上饶县', '3', '334100', '0793', '361121', 'Shangrao', '117.9088400', '28.4485600');
INSERT INTO `sys_cn_area` VALUES ('1366', '广丰县', '广丰', '1363', null, '中国,江西省,上饶市,广丰县', '3', '334600', '0793', '361122', 'Guangfeng', '118.1915800', '28.4376600');
INSERT INTO `sys_cn_area` VALUES ('1367', '玉山县', '玉山', '1363', null, '中国,江西省,上饶市,玉山县', '3', '334700', '0793', '361123', 'Yushan', '118.2446200', '28.6818000');
INSERT INTO `sys_cn_area` VALUES ('1368', '铅山县', '铅山', '1363', null, '中国,江西省,上饶市,铅山县', '3', '334500', '0793', '361124', 'Yanshan', '117.7099600', '28.3154900');
INSERT INTO `sys_cn_area` VALUES ('1369', '横峰县', '横峰', '1363', null, '中国,江西省,上饶市,横峰县', '3', '334300', '0793', '361125', 'Hengfeng', '117.5964000', '28.4071600');
INSERT INTO `sys_cn_area` VALUES ('1370', '弋阳县', '弋阳', '1363', null, '中国,江西省,上饶市,弋阳县', '3', '334400', '0793', '361126', 'Yiyang', '117.4592900', '28.3745100');
INSERT INTO `sys_cn_area` VALUES ('1371', '余干县', '余干', '1363', null, '中国,江西省,上饶市,余干县', '3', '335100', '0793', '361127', 'Yugan', '116.6955500', '28.7020600');
INSERT INTO `sys_cn_area` VALUES ('1372', '鄱阳县', '鄱阳', '1363', null, '中国,江西省,上饶市,鄱阳县', '3', '333100', '0793', '361128', 'Poyang', '116.6996700', '29.0118000');
INSERT INTO `sys_cn_area` VALUES ('1373', '万年县', '万年', '1363', null, '中国,江西省,上饶市,万年县', '3', '335500', '0793', '361129', 'Wannian', '117.0688400', '28.6953700');
INSERT INTO `sys_cn_area` VALUES ('1374', '婺源县', '婺源', '1363', null, '中国,江西省,上饶市,婺源县', '3', '333200', '0793', '361130', 'Wuyuan', '117.8610500', '29.2484100');
INSERT INTO `sys_cn_area` VALUES ('1375', '德兴市', '德兴', '1363', null, '中国,江西省,上饶市,德兴市', '3', '334200', '0793', '361181', 'Dexing', '117.5791900', '28.9473600');
INSERT INTO `sys_cn_area` VALUES ('1376', '山东省', '山东', '1', null, '中国,山东省', '1', null, '', '370000', 'Shandong', '117.0009230', '36.6758070');
INSERT INTO `sys_cn_area` VALUES ('1377', '济南市', '济南', '1376', null, '中国,山东省,济南市', '2', '250001', '0531', '370100', 'Jinan', '117.0009230', '36.6758070');
INSERT INTO `sys_cn_area` VALUES ('1378', '历下区', '历下', '1377', null, '中国,山东省,济南市,历下区', '3', '250014', '0531', '370102', 'Lixia', '117.0768000', '36.6666100');
INSERT INTO `sys_cn_area` VALUES ('1379', '市中区', '市中区', '1377', null, '中国,山东省,济南市,市中区', '3', '250001', '0531', '370103', 'Shizhongqu', '116.9974100', '36.6510100');
INSERT INTO `sys_cn_area` VALUES ('1380', '槐荫区', '槐荫', '1377', null, '中国,山东省,济南市,槐荫区', '3', '250117', '0531', '370104', 'Huaiyin', '116.9007500', '36.6513600');
INSERT INTO `sys_cn_area` VALUES ('1381', '天桥区', '天桥', '1377', null, '中国,山东省,济南市,天桥区', '3', '250031', '0531', '370105', 'Tianqiao', '116.9874900', '36.6780100');
INSERT INTO `sys_cn_area` VALUES ('1382', '历城区', '历城', '1377', null, '中国,山东省,济南市,历城区', '3', '250100', '0531', '370112', 'Licheng', '117.0650900', '36.6799500');
INSERT INTO `sys_cn_area` VALUES ('1383', '长清区', '长清', '1377', null, '中国,山东省,济南市,长清区', '3', '250300', '0531', '370113', 'Changqing', '116.7519200', '36.5535200');
INSERT INTO `sys_cn_area` VALUES ('1384', '平阴县', '平阴', '1377', null, '中国,山东省,济南市,平阴县', '3', '250400', '0531', '370124', 'Pingyin', '116.4558700', '36.2895500');
INSERT INTO `sys_cn_area` VALUES ('1385', '济阳县', '济阳', '1377', null, '中国,山东省,济南市,济阳县', '3', '251400', '0531', '370125', 'Jiyang', '117.1732700', '36.9784500');
INSERT INTO `sys_cn_area` VALUES ('1386', '商河县', '商河', '1377', null, '中国,山东省,济南市,商河县', '3', '251600', '0531', '370126', 'Shanghe', '117.1572200', '37.3111900');
INSERT INTO `sys_cn_area` VALUES ('1387', '章丘市', '章丘', '1377', null, '中国,山东省,济南市,章丘市', '3', '250200', '0531', '370181', 'Zhangqiu', '117.5367700', '36.7139200');
INSERT INTO `sys_cn_area` VALUES ('1388', '青岛市', '青岛', '1376', null, '中国,山东省,青岛市', '2', '266001', '0532', '370200', 'Qingdao', '120.3695570', '36.0944060');
INSERT INTO `sys_cn_area` VALUES ('1389', '市南区', '市南', '1388', null, '中国,山东省,青岛市,市南区', '3', '266001', '0532', '370202', 'Shinan', '120.3877300', '36.0667100');
INSERT INTO `sys_cn_area` VALUES ('1390', '市北区', '市北', '1388', null, '中国,山东省,青岛市,市北区', '3', '266011', '0532', '370203', 'Shibei', '120.3746900', '36.0873400');
INSERT INTO `sys_cn_area` VALUES ('1391', '黄岛区', '黄岛', '1388', null, '中国,山东省,青岛市,黄岛区', '3', '266500', '0532', '370211', 'Huangdao', '120.1977500', '35.9606500');
INSERT INTO `sys_cn_area` VALUES ('1392', '崂山区', '崂山', '1388', null, '中国,山东省,青岛市,崂山区', '3', '266100', '0532', '370212', 'Laoshan', '120.4692300', '36.1071700');
INSERT INTO `sys_cn_area` VALUES ('1393', '李沧区', '李沧', '1388', null, '中国,山东省,青岛市,李沧区', '3', '266021', '0532', '370213', 'Licang', '120.4328600', '36.1450200');
INSERT INTO `sys_cn_area` VALUES ('1394', '城阳区', '城阳', '1388', null, '中国,山东省,青岛市,城阳区', '3', '266041', '0532', '370214', 'Chengyang', '120.3962100', '36.3073500');
INSERT INTO `sys_cn_area` VALUES ('1395', '胶州市', '胶州', '1388', null, '中国,山东省,青岛市,胶州市', '3', '266300', '0532', '370281', 'Jiaozhou', '120.0335000', '36.2644200');
INSERT INTO `sys_cn_area` VALUES ('1396', '即墨市', '即墨', '1388', null, '中国,山东省,青岛市,即墨市', '3', '266200', '0532', '370282', 'Jimo', '120.4469900', '36.3890700');
INSERT INTO `sys_cn_area` VALUES ('1397', '平度市', '平度', '1388', null, '中国,山东省,青岛市,平度市', '3', '266700', '0532', '370283', 'Pingdu', '119.9599600', '36.7868800');
INSERT INTO `sys_cn_area` VALUES ('1398', '莱西市', '莱西', '1388', null, '中国,山东省,青岛市,莱西市', '3', '266600', '0532', '370285', 'Laixi', '120.5177300', '36.8880400');
INSERT INTO `sys_cn_area` VALUES ('1399', '西海岸新区', '西海岸', '1388', null, '中国,山东省,青岛市,西海岸新区', '3', '266500', '0532', '370286', 'Xihai\'an', '120.1977500', '35.9606500');
INSERT INTO `sys_cn_area` VALUES ('1400', '淄博市', '淄博', '1376', null, '中国,山东省,淄博市', '2', '255039', '0533', '370300', 'Zibo', '118.0476480', '36.8149390');
INSERT INTO `sys_cn_area` VALUES ('1401', '淄川区', '淄川', '1400', null, '中国,山东省,淄博市,淄川区', '3', '255100', '0533', '370302', 'Zichuan', '117.9665500', '36.6433900');
INSERT INTO `sys_cn_area` VALUES ('1402', '张店区', '张店', '1400', null, '中国,山东省,淄博市,张店区', '3', '255022', '0533', '370303', 'Zhangdian', '118.0178800', '36.8067600');
INSERT INTO `sys_cn_area` VALUES ('1403', '博山区', '博山', '1400', null, '中国,山东省,淄博市,博山区', '3', '255200', '0533', '370304', 'Boshan', '117.8616600', '36.4946900');
INSERT INTO `sys_cn_area` VALUES ('1404', '临淄区', '临淄', '1400', null, '中国,山东省,淄博市,临淄区', '3', '255400', '0533', '370305', 'Linzi', '118.3096600', '36.8259000');
INSERT INTO `sys_cn_area` VALUES ('1405', '周村区', '周村', '1400', null, '中国,山东省,淄博市,周村区', '3', '255300', '0533', '370306', 'Zhoucun', '117.8696900', '36.8032200');
INSERT INTO `sys_cn_area` VALUES ('1406', '桓台县', '桓台', '1400', null, '中国,山东省,淄博市,桓台县', '3', '256400', '0533', '370321', 'Huantai', '118.0969800', '36.9603600');
INSERT INTO `sys_cn_area` VALUES ('1407', '高青县', '高青', '1400', null, '中国,山东省,淄博市,高青县', '3', '256300', '0533', '370322', 'Gaoqing', '117.8270800', '37.1719700');
INSERT INTO `sys_cn_area` VALUES ('1408', '沂源县', '沂源', '1400', null, '中国,山东省,淄博市,沂源县', '3', '256100', '0533', '370323', 'Yiyuan', '118.1710500', '36.1853600');
INSERT INTO `sys_cn_area` VALUES ('1409', '枣庄市', '枣庄', '1376', null, '中国,山东省,枣庄市', '2', '277101', '0632', '370400', 'Zaozhuang', '117.5579640', '34.8564240');
INSERT INTO `sys_cn_area` VALUES ('1410', '市中区', '市中区', '1409', null, '中国,山东省,枣庄市,市中区', '3', '277101', '0632', '370402', 'Shizhongqu', '117.5560300', '34.8639100');
INSERT INTO `sys_cn_area` VALUES ('1411', '薛城区', '薛城', '1409', null, '中国,山东省,枣庄市,薛城区', '3', '277000', '0632', '370403', 'Xuecheng', '117.2631800', '34.7949800');
INSERT INTO `sys_cn_area` VALUES ('1412', '峄城区', '峄城', '1409', null, '中国,山东省,枣庄市,峄城区', '3', '277300', '0632', '370404', 'Yicheng', '117.5905700', '34.7722500');
INSERT INTO `sys_cn_area` VALUES ('1413', '台儿庄区', '台儿庄', '1409', null, '中国,山东省,枣庄市,台儿庄区', '3', '277400', '0632', '370405', 'Taierzhuang', '117.7345200', '34.5636300');
INSERT INTO `sys_cn_area` VALUES ('1414', '山亭区', '山亭', '1409', null, '中国,山东省,枣庄市,山亭区', '3', '277200', '0632', '370406', 'Shanting', '117.4663000', '35.0954100');
INSERT INTO `sys_cn_area` VALUES ('1415', '滕州市', '滕州', '1409', null, '中国,山东省,枣庄市,滕州市', '3', '277500', '0632', '370481', 'Tengzhou', '117.1650000', '35.1053400');
INSERT INTO `sys_cn_area` VALUES ('1416', '东营市', '东营', '1376', null, '中国,山东省,东营市', '2', '257093', '0546', '370500', 'Dongying', '118.4963000', '37.4612660');
INSERT INTO `sys_cn_area` VALUES ('1417', '东营区', '东营', '1416', null, '中国,山东省,东营市,东营区', '3', '257029', '0546', '370502', 'Dongying', '118.5816000', '37.4487500');
INSERT INTO `sys_cn_area` VALUES ('1418', '河口区', '河口', '1416', null, '中国,山东省,东营市,河口区', '3', '257200', '0546', '370503', 'Hekou', '118.5249000', '37.8854100');
INSERT INTO `sys_cn_area` VALUES ('1419', '垦利县', '垦利', '1416', null, '中国,山东省,东营市,垦利县', '3', '257500', '0546', '370521', 'Kenli', '118.5481500', '37.5882500');
INSERT INTO `sys_cn_area` VALUES ('1420', '利津县', '利津', '1416', null, '中国,山东省,东营市,利津县', '3', '257400', '0546', '370522', 'Lijin', '118.2563700', '37.4915700');
INSERT INTO `sys_cn_area` VALUES ('1421', '广饶县', '广饶', '1416', null, '中国,山东省,东营市,广饶县', '3', '257300', '0546', '370523', 'Guangrao', '118.4070400', '37.0538100');
INSERT INTO `sys_cn_area` VALUES ('1422', '烟台市', '烟台', '1376', null, '中国,山东省,烟台市', '2', '264010', '0635', '370600', 'Yantai', '121.3913820', '37.5392970');
INSERT INTO `sys_cn_area` VALUES ('1423', '芝罘区', '芝罘', '1422', null, '中国,山东省,烟台市,芝罘区', '3', '264001', '0635', '370602', 'Zhifu', '121.4002300', '37.5406400');
INSERT INTO `sys_cn_area` VALUES ('1424', '福山区', '福山', '1422', null, '中国,山东省,烟台市,福山区', '3', '265500', '0635', '370611', 'Fushan', '121.2681200', '37.4984100');
INSERT INTO `sys_cn_area` VALUES ('1425', '牟平区', '牟平', '1422', null, '中国,山东省,烟台市,牟平区', '3', '264100', '0635', '370612', 'Muping', '121.6006700', '37.3884600');
INSERT INTO `sys_cn_area` VALUES ('1426', '莱山区', '莱山', '1422', null, '中国,山东省,烟台市,莱山区', '3', '264600', '0635', '370613', 'Laishan', '121.4451200', '37.5116500');
INSERT INTO `sys_cn_area` VALUES ('1427', '长岛县', '长岛', '1422', null, '中国,山东省,烟台市,长岛县', '3', '265800', '0635', '370634', 'Changdao', '120.7380000', '37.9175400');
INSERT INTO `sys_cn_area` VALUES ('1428', '龙口市', '龙口', '1422', null, '中国,山东省,烟台市,龙口市', '3', '265700', '0635', '370681', 'Longkou', '120.5063400', '37.6406400');
INSERT INTO `sys_cn_area` VALUES ('1429', '莱阳市', '莱阳', '1422', null, '中国,山东省,烟台市,莱阳市', '3', '265200', '0635', '370682', 'Laiyang', '120.7106600', '36.9801200');
INSERT INTO `sys_cn_area` VALUES ('1430', '莱州市', '莱州', '1422', null, '中国,山东省,烟台市,莱州市', '3', '261400', '0635', '370683', 'Laizhou', '119.9413700', '37.1780600');
INSERT INTO `sys_cn_area` VALUES ('1431', '蓬莱市', '蓬莱', '1422', null, '中国,山东省,烟台市,蓬莱市', '3', '265600', '0635', '370684', 'Penglai', '120.7598800', '37.8111900');
INSERT INTO `sys_cn_area` VALUES ('1432', '招远市', '招远', '1422', null, '中国,山东省,烟台市,招远市', '3', '265400', '0635', '370685', 'Zhaoyuan', '120.4048100', '37.3626900');
INSERT INTO `sys_cn_area` VALUES ('1433', '栖霞市', '栖霞', '1422', null, '中国,山东省,烟台市,栖霞市', '3', '265300', '0635', '370686', 'Qixia', '120.8502500', '37.3357100');
INSERT INTO `sys_cn_area` VALUES ('1434', '海阳市', '海阳', '1422', null, '中国,山东省,烟台市,海阳市', '3', '265100', '0635', '370687', 'Haiyang', '121.1597600', '36.7762200');
INSERT INTO `sys_cn_area` VALUES ('1435', '潍坊市', '潍坊', '1376', null, '中国,山东省,潍坊市', '2', '261041', '0536', '370700', 'Weifang', '119.1070780', '36.7092500');
INSERT INTO `sys_cn_area` VALUES ('1436', '潍城区', '潍城', '1435', null, '中国,山东省,潍坊市,潍城区', '3', '261021', '0536', '370702', 'Weicheng', '119.1058200', '36.7139000');
INSERT INTO `sys_cn_area` VALUES ('1437', '寒亭区', '寒亭', '1435', null, '中国,山东省,潍坊市,寒亭区', '3', '261100', '0536', '370703', 'Hanting', '119.2183200', '36.7750400');
INSERT INTO `sys_cn_area` VALUES ('1438', '坊子区', '坊子', '1435', null, '中国,山东省,潍坊市,坊子区', '3', '261200', '0536', '370704', 'Fangzi', '119.1647600', '36.6521800');
INSERT INTO `sys_cn_area` VALUES ('1439', '奎文区', '奎文', '1435', null, '中国,山东省,潍坊市,奎文区', '3', '261031', '0536', '370705', 'Kuiwen', '119.1253200', '36.7072300');
INSERT INTO `sys_cn_area` VALUES ('1440', '临朐县', '临朐', '1435', null, '中国,山东省,潍坊市,临朐县', '3', '262600', '0536', '370724', 'Linqu', '118.5440000', '36.5121600');
INSERT INTO `sys_cn_area` VALUES ('1441', '昌乐县', '昌乐', '1435', null, '中国,山东省,潍坊市,昌乐县', '3', '262400', '0536', '370725', 'Changle', '118.8301700', '36.7078000');
INSERT INTO `sys_cn_area` VALUES ('1442', '青州市', '青州', '1435', null, '中国,山东省,潍坊市,青州市', '3', '262500', '0536', '370781', 'Qingzhou', '118.4791500', '36.6850500');
INSERT INTO `sys_cn_area` VALUES ('1443', '诸城市', '诸城', '1435', null, '中国,山东省,潍坊市,诸城市', '3', '262200', '0536', '370782', 'Zhucheng', '119.4098800', '35.9966200');
INSERT INTO `sys_cn_area` VALUES ('1444', '寿光市', '寿光', '1435', null, '中国,山东省,潍坊市,寿光市', '3', '262700', '0536', '370783', 'Shouguang', '118.7404700', '36.8812800');
INSERT INTO `sys_cn_area` VALUES ('1445', '安丘市', '安丘', '1435', null, '中国,山东省,潍坊市,安丘市', '3', '262100', '0536', '370784', 'Anqiu', '119.2189000', '36.4784700');
INSERT INTO `sys_cn_area` VALUES ('1446', '高密市', '高密', '1435', null, '中国,山东省,潍坊市,高密市', '3', '261500', '0536', '370785', 'Gaomi', '119.7570100', '36.3839700');
INSERT INTO `sys_cn_area` VALUES ('1447', '昌邑市', '昌邑', '1435', null, '中国,山东省,潍坊市,昌邑市', '3', '261300', '0536', '370786', 'Changyi', '119.3976700', '36.8600800');
INSERT INTO `sys_cn_area` VALUES ('1448', '济宁市', '济宁', '1376', null, '中国,山东省,济宁市', '2', '272119', '0537', '370800', 'Jining', '116.5872450', '35.4153930');
INSERT INTO `sys_cn_area` VALUES ('1449', '任城区', '任城', '1448', null, '中国,山东省,济宁市,任城区', '3', '272113', '0537', '370811', 'Rencheng', '116.5950400', '35.4065900');
INSERT INTO `sys_cn_area` VALUES ('1450', '兖州区', '兖州', '1448', null, '中国,山东省,济宁市,兖州区', '3', '272000', '0537', '370812', 'Yanzhou ', '116.8265460', '35.5523050');
INSERT INTO `sys_cn_area` VALUES ('1451', '微山县', '微山', '1448', null, '中国,山东省,济宁市,微山县', '3', '277600', '0537', '370826', 'Weishan', '117.1287500', '34.8071200');
INSERT INTO `sys_cn_area` VALUES ('1452', '鱼台县', '鱼台', '1448', null, '中国,山东省,济宁市,鱼台县', '3', '272300', '0537', '370827', 'Yutai', '116.6476100', '34.9967400');
INSERT INTO `sys_cn_area` VALUES ('1453', '金乡县', '金乡', '1448', null, '中国,山东省,济宁市,金乡县', '3', '272200', '0537', '370828', 'Jinxiang', '116.3114600', '35.0650000');
INSERT INTO `sys_cn_area` VALUES ('1454', '嘉祥县', '嘉祥', '1448', null, '中国,山东省,济宁市,嘉祥县', '3', '272400', '0537', '370829', 'Jiaxiang', '116.3424900', '35.4083600');
INSERT INTO `sys_cn_area` VALUES ('1455', '汶上县', '汶上', '1448', null, '中国,山东省,济宁市,汶上县', '3', '272501', '0537', '370830', 'Wenshang', '116.4874200', '35.7329500');
INSERT INTO `sys_cn_area` VALUES ('1456', '泗水县', '泗水', '1448', null, '中国,山东省,济宁市,泗水县', '3', '273200', '0537', '370831', 'Sishui', '117.2794800', '35.6611300');
INSERT INTO `sys_cn_area` VALUES ('1457', '梁山县', '梁山', '1448', null, '中国,山东省,济宁市,梁山县', '3', '272600', '0537', '370832', 'Liangshan', '116.0968300', '35.8032200');
INSERT INTO `sys_cn_area` VALUES ('1458', '曲阜市', '曲阜', '1448', null, '中国,山东省,济宁市,曲阜市', '3', '273100', '0537', '370881', 'Qufu', '116.9864500', '35.5809100');
INSERT INTO `sys_cn_area` VALUES ('1459', '邹城市', '邹城', '1448', null, '中国,山东省,济宁市,邹城市', '3', '273500', '0537', '370883', 'Zoucheng', '116.9733500', '35.4053100');
INSERT INTO `sys_cn_area` VALUES ('1460', '泰安市', '泰安', '1376', null, '中国,山东省,泰安市', '2', '271000', '0538', '370900', 'Tai\'an', '117.1290630', '36.1949680');
INSERT INTO `sys_cn_area` VALUES ('1461', '泰山区', '泰山', '1460', null, '中国,山东省,泰安市,泰山区', '3', '271000', '0538', '370902', 'Taishan', '117.1344600', '36.1941100');
INSERT INTO `sys_cn_area` VALUES ('1462', '岱岳区', '岱岳', '1460', null, '中国,山东省,泰安市,岱岳区', '3', '271000', '0538', '370911', 'Daiyue', '117.0417400', '36.1875000');
INSERT INTO `sys_cn_area` VALUES ('1463', '宁阳县', '宁阳', '1460', null, '中国,山东省,泰安市,宁阳县', '3', '271400', '0538', '370921', 'Ningyang', '116.8054200', '35.7599000');
INSERT INTO `sys_cn_area` VALUES ('1464', '东平县', '东平', '1460', null, '中国,山东省,泰安市,东平县', '3', '271500', '0538', '370923', 'Dongping', '116.4711300', '35.9379200');
INSERT INTO `sys_cn_area` VALUES ('1465', '新泰市', '新泰', '1460', null, '中国,山东省,泰安市,新泰市', '3', '271200', '0538', '370982', 'Xintai', '117.7695900', '35.9088700');
INSERT INTO `sys_cn_area` VALUES ('1466', '肥城市', '肥城', '1460', null, '中国,山东省,泰安市,肥城市', '3', '271600', '0538', '370983', 'Feicheng', '116.7681500', '36.1824700');
INSERT INTO `sys_cn_area` VALUES ('1467', '威海市', '威海', '1376', null, '中国,山东省,威海市', '2', '264200', '0631', '371000', 'Weihai', '122.1163940', '37.5096910');
INSERT INTO `sys_cn_area` VALUES ('1468', '环翠区', '环翠', '1467', null, '中国,山东省,威海市,环翠区', '3', '264200', '0631', '371002', 'Huancui', '122.1234400', '37.5019900');
INSERT INTO `sys_cn_area` VALUES ('1469', '文登区', '文登', '1467', null, '中国,山东省,威海市,文登区', '3', '266440', '0631', '371003', 'Wendeng', '122.0571390', '37.1962110');
INSERT INTO `sys_cn_area` VALUES ('1470', '荣成市', '荣成', '1467', null, '中国,山东省,威海市,荣成市', '3', '264300', '0631', '371082', 'Rongcheng', '122.4877300', '37.1652000');
INSERT INTO `sys_cn_area` VALUES ('1471', '乳山市', '乳山', '1467', null, '中国,山东省,威海市,乳山市', '3', '264500', '0631', '371083', 'Rushan', '121.5381400', '36.9191800');
INSERT INTO `sys_cn_area` VALUES ('1472', '日照市', '日照', '1376', null, '中国,山东省,日照市', '2', '276800', '0633', '371100', 'Rizhao', '119.4612080', '35.4285880');
INSERT INTO `sys_cn_area` VALUES ('1473', '东港区', '东港', '1472', null, '中国,山东省,日照市,东港区', '3', '276800', '0633', '371102', 'Donggang', '119.4623700', '35.4254100');
INSERT INTO `sys_cn_area` VALUES ('1474', '岚山区', '岚山', '1472', null, '中国,山东省,日照市,岚山区', '3', '276808', '0633', '371103', 'Lanshan', '119.3188400', '35.1220300');
INSERT INTO `sys_cn_area` VALUES ('1475', '五莲县', '五莲', '1472', null, '中国,山东省,日照市,五莲县', '3', '262300', '0633', '371121', 'Wulian', '119.2070000', '35.7500400');
INSERT INTO `sys_cn_area` VALUES ('1476', '莒县', '莒县', '1472', null, '中国,山东省,日照市,莒县', '3', '276500', '0633', '371122', 'Juxian', '118.8378900', '35.5805400');
INSERT INTO `sys_cn_area` VALUES ('1477', '莱芜市', '莱芜', '1376', null, '中国,山东省,莱芜市', '2', '271100', '0634', '371200', 'Laiwu', '117.6777360', '36.2143970');
INSERT INTO `sys_cn_area` VALUES ('1478', '莱城区', '莱城', '1477', null, '中国,山东省,莱芜市,莱城区', '3', '271199', '0634', '371202', 'Laicheng', '117.6598600', '36.2032000');
INSERT INTO `sys_cn_area` VALUES ('1479', '钢城区', '钢城', '1477', null, '中国,山东省,莱芜市,钢城区', '3', '271100', '0634', '371203', 'Gangcheng', '117.8049000', '36.0631900');
INSERT INTO `sys_cn_area` VALUES ('1480', '临沂市', '临沂', '1376', null, '中国,山东省,临沂市', '2', '253000', '0539', '371300', 'Linyi', '118.3264430', '35.0652820');
INSERT INTO `sys_cn_area` VALUES ('1481', '兰山区', '兰山', '1480', null, '中国,山东省,临沂市,兰山区', '3', '276002', '0539', '371302', 'Lanshan', '118.3481700', '35.0687200');
INSERT INTO `sys_cn_area` VALUES ('1482', '罗庄区', '罗庄', '1480', null, '中国,山东省,临沂市,罗庄区', '3', '276022', '0539', '371311', 'Luozhuang', '118.2846600', '34.9962700');
INSERT INTO `sys_cn_area` VALUES ('1483', '河东区', '河东', '1480', null, '中国,山东省,临沂市,河东区', '3', '276034', '0539', '371312', 'Hedong', '118.4105500', '35.0880300');
INSERT INTO `sys_cn_area` VALUES ('1484', '沂南县', '沂南', '1480', null, '中国,山东省,临沂市,沂南县', '3', '276300', '0539', '371321', 'Yinan', '118.4706100', '35.5513100');
INSERT INTO `sys_cn_area` VALUES ('1485', '郯城县', '郯城', '1480', null, '中国,山东省,临沂市,郯城县', '3', '276100', '0539', '371322', 'Tancheng', '118.3671200', '34.6135400');
INSERT INTO `sys_cn_area` VALUES ('1486', '沂水县', '沂水', '1480', null, '中国,山东省,临沂市,沂水县', '3', '276400', '0539', '371323', 'Yishui', '118.6300900', '35.7873100');
INSERT INTO `sys_cn_area` VALUES ('1487', '兰陵县', '兰陵', '1480', null, '中国,山东省,临沂市,兰陵县', '3', '277700', '0539', '371324', 'Lanling', '117.8565920', '34.7383150');
INSERT INTO `sys_cn_area` VALUES ('1488', '费县', '费县', '1480', null, '中国,山东省,临沂市,费县', '3', '273400', '0539', '371325', 'Feixian', '117.9783600', '35.2656200');
INSERT INTO `sys_cn_area` VALUES ('1489', '平邑县', '平邑', '1480', null, '中国,山东省,临沂市,平邑县', '3', '273300', '0539', '371326', 'Pingyi', '117.6386700', '35.5057300');
INSERT INTO `sys_cn_area` VALUES ('1490', '莒南县', '莒南', '1480', null, '中国,山东省,临沂市,莒南县', '3', '276600', '0539', '371327', 'Junan', '118.8322700', '35.1753900');
INSERT INTO `sys_cn_area` VALUES ('1491', '蒙阴县', '蒙阴', '1480', null, '中国,山东省,临沂市,蒙阴县', '3', '276200', '0539', '371328', 'Mengyin', '117.9459200', '35.7099600');
INSERT INTO `sys_cn_area` VALUES ('1492', '临沭县', '临沭', '1480', null, '中国,山东省,临沂市,临沭县', '3', '276700', '0539', '371329', 'Linshu', '118.6526700', '34.9209100');
INSERT INTO `sys_cn_area` VALUES ('1493', '德州市', '德州', '1376', null, '中国,山东省,德州市', '2', '253000', '0534', '371400', 'Dezhou', '116.3074280', '37.4539680');
INSERT INTO `sys_cn_area` VALUES ('1494', '德城区', '德城', '1493', null, '中国,山东省,德州市,德城区', '3', '253012', '0534', '371402', 'Decheng', '116.2994300', '37.4512600');
INSERT INTO `sys_cn_area` VALUES ('1495', '陵城区', '陵城', '1493', null, '中国,山东省,德州市,陵城区', '3', '253500', '0534', '371403', 'Lingcheng', '116.5760100', '37.3357100');
INSERT INTO `sys_cn_area` VALUES ('1496', '宁津县', '宁津', '1493', null, '中国,山东省,德州市,宁津县', '3', '253400', '0534', '371422', 'Ningjin', '116.7970200', '37.6530100');
INSERT INTO `sys_cn_area` VALUES ('1497', '庆云县', '庆云', '1493', null, '中国,山东省,德州市,庆云县', '3', '253700', '0534', '371423', 'Qingyun', '117.3863500', '37.7761600');
INSERT INTO `sys_cn_area` VALUES ('1498', '临邑县', '临邑', '1493', null, '中国,山东省,德州市,临邑县', '3', '251500', '0534', '371424', 'Linyi', '116.8654700', '37.1905300');
INSERT INTO `sys_cn_area` VALUES ('1499', '齐河县', '齐河', '1493', null, '中国,山东省,德州市,齐河县', '3', '251100', '0534', '371425', 'Qihe', '116.7551500', '36.7953200');
INSERT INTO `sys_cn_area` VALUES ('1500', '平原县', '平原', '1493', null, '中国,山东省,德州市,平原县', '3', '253100', '0534', '371426', 'Pingyuan', '116.4343200', '37.1663200');
INSERT INTO `sys_cn_area` VALUES ('1501', '夏津县', '夏津', '1493', null, '中国,山东省,德州市,夏津县', '3', '253200', '0534', '371427', 'Xiajin', '116.0017000', '36.9485200');
INSERT INTO `sys_cn_area` VALUES ('1502', '武城县', '武城', '1493', null, '中国,山东省,德州市,武城县', '3', '253300', '0534', '371428', 'Wucheng', '116.0700900', '37.2140300');
INSERT INTO `sys_cn_area` VALUES ('1503', '乐陵市', '乐陵', '1493', null, '中国,山东省,德州市,乐陵市', '3', '253600', '0534', '371481', 'Leling', '117.2314100', '37.7316400');
INSERT INTO `sys_cn_area` VALUES ('1504', '禹城市', '禹城', '1493', null, '中国,山东省,德州市,禹城市', '3', '251200', '0534', '371482', 'Yucheng', '116.6430900', '36.9344400');
INSERT INTO `sys_cn_area` VALUES ('1505', '聊城市', '聊城', '1376', null, '中国,山东省,聊城市', '2', '252052', '0635', '371500', 'Liaocheng', '115.9803670', '36.4560130');
INSERT INTO `sys_cn_area` VALUES ('1506', '东昌府区', '东昌府', '1505', null, '中国,山东省,聊城市,东昌府区', '3', '252000', '0635', '371502', 'Dongchangfu', '115.9738300', '36.4445800');
INSERT INTO `sys_cn_area` VALUES ('1507', '阳谷县', '阳谷', '1505', null, '中国,山东省,聊城市,阳谷县', '3', '252300', '0635', '371521', 'Yanggu', '115.7912600', '36.1144400');
INSERT INTO `sys_cn_area` VALUES ('1508', '莘县', '莘县', '1505', null, '中国,山东省,聊城市,莘县', '3', '252400', '0635', '371522', 'Shenxian', '115.6697000', '36.2342300');
INSERT INTO `sys_cn_area` VALUES ('1509', '茌平县', '茌平', '1505', null, '中国,山东省,聊城市,茌平县', '3', '252100', '0635', '371523', 'Chiping', '116.2549100', '36.5796900');
INSERT INTO `sys_cn_area` VALUES ('1510', '东阿县', '东阿', '1505', null, '中国,山东省,聊城市,东阿县', '3', '252200', '0635', '371524', 'Dong\'e', '116.2501200', '36.3320900');
INSERT INTO `sys_cn_area` VALUES ('1511', '冠县', '冠县', '1505', null, '中国,山东省,聊城市,冠县', '3', '252500', '0635', '371525', 'Guanxian', '115.4419500', '36.4842900');
INSERT INTO `sys_cn_area` VALUES ('1512', '高唐县', '高唐', '1505', null, '中国,山东省,聊城市,高唐县', '3', '252800', '0635', '371526', 'Gaotang', '116.2317200', '36.8653500');
INSERT INTO `sys_cn_area` VALUES ('1513', '临清市', '临清', '1505', null, '中国,山东省,聊城市,临清市', '3', '252600', '0635', '371581', 'Linqing', '115.7062900', '36.8394500');
INSERT INTO `sys_cn_area` VALUES ('1514', '滨州市', '滨州', '1376', null, '中国,山东省,滨州市', '2', '256619', '0543', '371600', 'Binzhou', '118.0169740', '37.3835420');
INSERT INTO `sys_cn_area` VALUES ('1515', '滨城区', '滨城', '1514', null, '中国,山东省,滨州市,滨城区', '3', '256613', '0543', '371602', 'Bincheng', '118.0202600', '37.3852400');
INSERT INTO `sys_cn_area` VALUES ('1516', '沾化区', '沾化', '1514', null, '中国,山东省,滨州市,沾化区', '3', '256800', '0543', '371603', 'Zhanhua', '118.1321400', '37.6983200');
INSERT INTO `sys_cn_area` VALUES ('1517', '惠民县', '惠民', '1514', null, '中国,山东省,滨州市,惠民县', '3', '251700', '0543', '371621', 'Huimin', '117.5111300', '37.4901300');
INSERT INTO `sys_cn_area` VALUES ('1518', '阳信县', '阳信', '1514', null, '中国,山东省,滨州市,阳信县', '3', '251800', '0543', '371622', 'Yangxin', '117.5813900', '37.6419800');
INSERT INTO `sys_cn_area` VALUES ('1519', '无棣县', '无棣', '1514', null, '中国,山东省,滨州市,无棣县', '3', '251900', '0543', '371623', 'Wudi', '117.6139500', '37.7400900');
INSERT INTO `sys_cn_area` VALUES ('1520', '博兴县', '博兴', '1514', null, '中国,山东省,滨州市,博兴县', '3', '256500', '0543', '371625', 'Boxing', '118.1336000', '37.1431600');
INSERT INTO `sys_cn_area` VALUES ('1521', '邹平县', '邹平', '1514', null, '中国,山东省,滨州市,邹平县', '3', '256200', '0543', '371626', 'Zouping', '117.7430700', '36.8629500');
INSERT INTO `sys_cn_area` VALUES ('1522', '北海新区', '北海新区', '1514', null, '中国,山东省,滨州市,北海新区', '3', '256200', '0543', '371627', 'Beihaixinqu', '118.0169740', '37.3835420');
INSERT INTO `sys_cn_area` VALUES ('1523', '菏泽市', '菏泽', '1376', null, '中国,山东省,菏泽市', '2', '274020', '0530', '371700', 'Heze', '115.4693810', '35.2465310');
INSERT INTO `sys_cn_area` VALUES ('1524', '牡丹区', '牡丹', '1523', null, '中国,山东省,菏泽市,牡丹区', '3', '274009', '0530', '371702', 'Mudan', '115.4166200', '35.2509100');
INSERT INTO `sys_cn_area` VALUES ('1525', '曹县', '曹县', '1523', null, '中国,山东省,菏泽市,曹县', '3', '274400', '0530', '371721', 'Caoxian', '115.5422600', '34.8265900');
INSERT INTO `sys_cn_area` VALUES ('1526', '单县', '单县', '1523', null, '中国,山东省,菏泽市,单县', '3', '273700', '0530', '371722', 'Shanxian', '116.0870300', '34.7951400');
INSERT INTO `sys_cn_area` VALUES ('1527', '成武县', '成武', '1523', null, '中国,山东省,菏泽市,成武县', '3', '274200', '0530', '371723', 'Chengwu', '115.8897000', '34.9533200');
INSERT INTO `sys_cn_area` VALUES ('1528', '巨野县', '巨野', '1523', null, '中国,山东省,菏泽市,巨野县', '3', '274900', '0530', '371724', 'Juye', '116.0949700', '35.3978800');
INSERT INTO `sys_cn_area` VALUES ('1529', '郓城县', '郓城', '1523', null, '中国,山东省,菏泽市,郓城县', '3', '274700', '0530', '371725', 'Yuncheng', '115.9443900', '35.6004400');
INSERT INTO `sys_cn_area` VALUES ('1530', '鄄城县', '鄄城', '1523', null, '中国,山东省,菏泽市,鄄城县', '3', '274600', '0530', '371726', 'Juancheng', '115.5099700', '35.5641200');
INSERT INTO `sys_cn_area` VALUES ('1531', '定陶县', '定陶', '1523', null, '中国,山东省,菏泽市,定陶县', '3', '274100', '0530', '371727', 'Dingtao', '115.5728700', '35.0711800');
INSERT INTO `sys_cn_area` VALUES ('1532', '东明县', '东明', '1523', null, '中国,山东省,菏泽市,东明县', '3', '274500', '0530', '371728', 'Dongming', '115.0907900', '35.2890600');
INSERT INTO `sys_cn_area` VALUES ('1533', '河南省', '河南', '1', null, '中国,河南省', '1', null, '', '410000', 'Henan', '113.6654120', '34.7579750');
INSERT INTO `sys_cn_area` VALUES ('1534', '郑州市', '郑州', '1533', null, '中国,河南省,郑州市', '2', '450000', '0371', '410100', 'Zhengzhou', '113.6654120', '34.7579750');
INSERT INTO `sys_cn_area` VALUES ('1535', '中原区', '中原', '1534', null, '中国,河南省,郑州市,中原区', '3', '450007', '0371', '410102', 'Zhongyuan', '113.6133300', '34.7482700');
INSERT INTO `sys_cn_area` VALUES ('1536', '二七区', '二七', '1534', null, '中国,河南省,郑州市,二七区', '3', '450052', '0371', '410103', 'Erqi', '113.6393100', '34.7233600');
INSERT INTO `sys_cn_area` VALUES ('1537', '管城回族区', '管城', '1534', null, '中国,河南省,郑州市,管城回族区', '3', '450000', '0371', '410104', 'Guancheng', '113.6773400', '34.7538300');
INSERT INTO `sys_cn_area` VALUES ('1538', '金水区', '金水', '1534', null, '中国,河南省,郑州市,金水区', '3', '450003', '0371', '410105', 'Jinshui', '113.6605700', '34.8002800');
INSERT INTO `sys_cn_area` VALUES ('1539', '上街区', '上街', '1534', null, '中国,河南省,郑州市,上街区', '3', '450041', '0371', '410106', 'Shangjie', '113.3089700', '34.8027600');
INSERT INTO `sys_cn_area` VALUES ('1540', '惠济区', '惠济', '1534', null, '中国,河南省,郑州市,惠济区', '3', '450053', '0371', '410108', 'Huiji', '113.6168800', '34.8673500');
INSERT INTO `sys_cn_area` VALUES ('1541', '中牟县', '中牟', '1534', null, '中国,河南省,郑州市,中牟县', '3', '451450', '0371', '410122', 'Zhongmu', '113.9761900', '34.7189900');
INSERT INTO `sys_cn_area` VALUES ('1542', '巩义市', '巩义', '1534', null, '中国,河南省,郑州市,巩义市', '3', '451200', '0371', '410181', 'Gongyi', '113.0220000', '34.7479400');
INSERT INTO `sys_cn_area` VALUES ('1543', '荥阳市', '荥阳', '1534', null, '中国,河南省,郑州市,荥阳市', '3', '450100', '0371', '410182', 'Xingyang', '113.3834500', '34.7875900');
INSERT INTO `sys_cn_area` VALUES ('1544', '新密市', '新密', '1534', null, '中国,河南省,郑州市,新密市', '3', '452300', '0371', '410183', 'Xinmi', '113.3869000', '34.5370400');
INSERT INTO `sys_cn_area` VALUES ('1545', '新郑市', '新郑', '1534', null, '中国,河南省,郑州市,新郑市', '3', '451100', '0371', '410184', 'Xinzheng', '113.7364500', '34.3955000');
INSERT INTO `sys_cn_area` VALUES ('1546', '登封市', '登封', '1534', null, '中国,河南省,郑州市,登封市', '3', '452470', '0371', '410185', 'Dengfeng', '113.0502300', '34.4534500');
INSERT INTO `sys_cn_area` VALUES ('1547', '开封市', '开封', '1533', null, '中国,河南省,开封市', '2', '475001', '0378', '410200', 'Kaifeng', '114.3414470', '34.7970490');
INSERT INTO `sys_cn_area` VALUES ('1548', '龙亭区', '龙亭', '1547', null, '中国,河南省,开封市,龙亭区', '3', '475100', '0378', '410202', 'Longting', '114.3548400', '34.7999500');
INSERT INTO `sys_cn_area` VALUES ('1549', '顺河回族区', '顺河', '1547', null, '中国,河南省,开封市,顺河回族区', '3', '475000', '0378', '410203', 'Shunhe', '114.3612300', '34.7958600');
INSERT INTO `sys_cn_area` VALUES ('1550', '鼓楼区', '鼓楼', '1547', null, '中国,河南省,开封市,鼓楼区', '3', '475000', '0378', '410204', 'Gulou', '114.3555900', '34.7951700');
INSERT INTO `sys_cn_area` VALUES ('1551', '禹王台区', '禹王台', '1547', null, '中国,河南省,开封市,禹王台区', '3', '475003', '0378', '410205', 'Yuwangtai', '114.3478700', '34.7769300');
INSERT INTO `sys_cn_area` VALUES ('1552', '祥符区', '祥符', '1547', null, '中国,河南省,开封市,祥符区', '3', '475100', '0378', '410212', 'Xiangfu', '114.4385900', '34.7587400');
INSERT INTO `sys_cn_area` VALUES ('1553', '杞县', '杞县', '1547', null, '中国,河南省,开封市,杞县', '3', '475200', '0378', '410221', 'Qixian', '114.7828000', '34.5503300');
INSERT INTO `sys_cn_area` VALUES ('1554', '通许县', '通许', '1547', null, '中国,河南省,开封市,通许县', '3', '475400', '0378', '410222', 'Tongxu', '114.4671600', '34.4752200');
INSERT INTO `sys_cn_area` VALUES ('1555', '尉氏县', '尉氏', '1547', null, '中国,河南省,开封市,尉氏县', '3', '475500', '0378', '410223', 'Weishi', '114.1928400', '34.4122300');
INSERT INTO `sys_cn_area` VALUES ('1556', '兰考县', '兰考', '1547', null, '中国,河南省,开封市,兰考县', '3', '475300', '0378', '410225', 'Lankao', '114.8196100', '34.8235000');
INSERT INTO `sys_cn_area` VALUES ('1557', '洛阳市', '洛阳', '1533', null, '中国,河南省,洛阳市', '2', '471000', '0379', '410300', 'Luoyang', '112.4344680', '34.6630410');
INSERT INTO `sys_cn_area` VALUES ('1558', '老城区', '老城', '1557', null, '中国,河南省,洛阳市,老城区', '3', '471002', '0379', '410302', 'Laocheng', '112.4690200', '34.6836400');
INSERT INTO `sys_cn_area` VALUES ('1559', '西工区', '西工', '1557', null, '中国,河南省,洛阳市,西工区', '3', '471000', '0379', '410303', 'Xigong', '112.4371000', '34.6700000');
INSERT INTO `sys_cn_area` VALUES ('1560', '瀍河回族区', '瀍河', '1557', null, '中国,河南省,洛阳市,瀍河回族区', '3', '471002', '0379', '410304', 'Chanhe', '112.5001800', '34.6798500');
INSERT INTO `sys_cn_area` VALUES ('1561', '涧西区', '涧西', '1557', null, '中国,河南省,洛阳市,涧西区', '3', '471003', '0379', '410305', 'Jianxi', '112.3958800', '34.6582300');
INSERT INTO `sys_cn_area` VALUES ('1562', '吉利区', '吉利', '1557', null, '中国,河南省,洛阳市,吉利区', '3', '471012', '0379', '410306', 'Jili', '112.5890500', '34.9008800');
INSERT INTO `sys_cn_area` VALUES ('1563', '洛龙区', '洛龙', '1557', null, '中国,河南省,洛阳市,洛龙区', '3', '471000', '0379', '410311', 'Luolong', '112.4641200', '34.6186600');
INSERT INTO `sys_cn_area` VALUES ('1564', '孟津县', '孟津', '1557', null, '中国,河南省,洛阳市,孟津县', '3', '471100', '0379', '410322', 'Mengjin', '112.4435100', '34.8260000');
INSERT INTO `sys_cn_area` VALUES ('1565', '新安县', '新安', '1557', null, '中国,河南省,洛阳市,新安县', '3', '471800', '0379', '410323', 'Xin\'an', '112.1323800', '34.7281400');
INSERT INTO `sys_cn_area` VALUES ('1566', '栾川县', '栾川', '1557', null, '中国,河南省,洛阳市,栾川县', '3', '471500', '0379', '410324', 'Luanchuan', '111.6177900', '33.7857600');
INSERT INTO `sys_cn_area` VALUES ('1567', '嵩县', '嵩县', '1557', null, '中国,河南省,洛阳市,嵩县', '3', '471400', '0379', '410325', 'Songxian', '112.0852600', '34.1346600');
INSERT INTO `sys_cn_area` VALUES ('1568', '汝阳县', '汝阳', '1557', null, '中国,河南省,洛阳市,汝阳县', '3', '471200', '0379', '410326', 'Ruyang', '112.4731400', '34.1538700');
INSERT INTO `sys_cn_area` VALUES ('1569', '宜阳县', '宜阳', '1557', null, '中国,河南省,洛阳市,宜阳县', '3', '471600', '0379', '410327', 'Yiyang', '112.1790700', '34.5152300');
INSERT INTO `sys_cn_area` VALUES ('1570', '洛宁县', '洛宁', '1557', null, '中国,河南省,洛阳市,洛宁县', '3', '471700', '0379', '410328', 'Luoning', '111.6508700', '34.3891300');
INSERT INTO `sys_cn_area` VALUES ('1571', '伊川县', '伊川', '1557', null, '中国,河南省,洛阳市,伊川县', '3', '471300', '0379', '410329', 'Yichuan', '112.4294700', '34.4220500');
INSERT INTO `sys_cn_area` VALUES ('1572', '偃师市', '偃师', '1557', null, '中国,河南省,洛阳市,偃师市', '3', '471900', '0379', '410381', 'Yanshi', '112.7922000', '34.7281000');
INSERT INTO `sys_cn_area` VALUES ('1573', '平顶山市', '平顶山', '1533', null, '中国,河南省,平顶山市', '2', '467000', '0375', '410400', 'Pingdingshan', '113.3077180', '33.7352410');
INSERT INTO `sys_cn_area` VALUES ('1574', '新华区', '新华', '1573', null, '中国,河南省,平顶山市,新华区', '3', '467002', '0375', '410402', 'Xinhua', '113.2940200', '33.7373000');
INSERT INTO `sys_cn_area` VALUES ('1575', '卫东区', '卫东', '1573', null, '中国,河南省,平顶山市,卫东区', '3', '467021', '0375', '410403', 'Weidong', '113.3351100', '33.7347200');
INSERT INTO `sys_cn_area` VALUES ('1576', '石龙区', '石龙', '1573', null, '中国,河南省,平顶山市,石龙区', '3', '467045', '0375', '410404', 'Shilong', '112.8987900', '33.8987800');
INSERT INTO `sys_cn_area` VALUES ('1577', '湛河区', '湛河', '1573', null, '中国,河南省,平顶山市,湛河区', '3', '467000', '0375', '410411', 'Zhanhe', '113.2925200', '33.7362000');
INSERT INTO `sys_cn_area` VALUES ('1578', '宝丰县', '宝丰', '1573', null, '中国,河南省,平顶山市,宝丰县', '3', '467400', '0375', '410421', 'Baofeng', '113.0549300', '33.8691600');
INSERT INTO `sys_cn_area` VALUES ('1579', '叶县', '叶县', '1573', null, '中国,河南省,平顶山市,叶县', '3', '467200', '0375', '410422', 'Yexian', '113.3510400', '33.6222500');
INSERT INTO `sys_cn_area` VALUES ('1580', '鲁山县', '鲁山', '1573', null, '中国,河南省,平顶山市,鲁山县', '3', '467300', '0375', '410423', 'Lushan', '112.9057000', '33.7387900');
INSERT INTO `sys_cn_area` VALUES ('1581', '郏县', '郏县', '1573', null, '中国,河南省,平顶山市,郏县', '3', '467100', '0375', '410425', 'Jiaxian', '113.2158800', '33.9707200');
INSERT INTO `sys_cn_area` VALUES ('1582', '舞钢市', '舞钢', '1573', null, '中国,河南省,平顶山市,舞钢市', '3', '462500', '0375', '410481', 'Wugang', '113.5241700', '33.2938000');
INSERT INTO `sys_cn_area` VALUES ('1583', '汝州市', '汝州', '1573', null, '中国,河南省,平顶山市,汝州市', '3', '467500', '0375', '410482', 'Ruzhou', '112.8430100', '34.1613500');
INSERT INTO `sys_cn_area` VALUES ('1584', '安阳市', '安阳', '1533', null, '中国,河南省,安阳市', '2', '455000', '0372', '410500', 'Anyang', '114.3524820', '36.1034420');
INSERT INTO `sys_cn_area` VALUES ('1585', '文峰区', '文峰', '1584', null, '中国,河南省,安阳市,文峰区', '3', '455000', '0372', '410502', 'Wenfeng', '114.3570800', '36.0904600');
INSERT INTO `sys_cn_area` VALUES ('1586', '北关区', '北关', '1584', null, '中国,河南省,安阳市,北关区', '3', '455001', '0372', '410503', 'Beiguan', '114.3573500', '36.1187200');
INSERT INTO `sys_cn_area` VALUES ('1587', '殷都区', '殷都', '1584', null, '中国,河南省,安阳市,殷都区', '3', '455004', '0372', '410505', 'Yindu', '114.3034000', '36.1099000');
INSERT INTO `sys_cn_area` VALUES ('1588', '龙安区', '龙安', '1584', null, '中国,河南省,安阳市,龙安区', '3', '455001', '0372', '410506', 'Long\'an', '114.3481400', '36.1190400');
INSERT INTO `sys_cn_area` VALUES ('1589', '安阳县', '安阳', '1584', null, '中国,河南省,安阳市,安阳县', '3', '455000', '0372', '410522', 'Anyang', '114.3660500', '36.0669500');
INSERT INTO `sys_cn_area` VALUES ('1590', '汤阴县', '汤阴', '1584', null, '中国,河南省,安阳市,汤阴县', '3', '456150', '0372', '410523', 'Tangyin', '114.3583900', '35.9215200');
INSERT INTO `sys_cn_area` VALUES ('1591', '滑县', '滑县', '1584', null, '中国,河南省,安阳市,滑县', '3', '456400', '0372', '410526', 'Huaxian', '114.5206600', '35.5807000');
INSERT INTO `sys_cn_area` VALUES ('1592', '内黄县', '内黄', '1584', null, '中国,河南省,安阳市,内黄县', '3', '456350', '0372', '410527', 'Neihuang', '114.9067300', '35.9526900');
INSERT INTO `sys_cn_area` VALUES ('1593', '林州市', '林州', '1584', null, '中国,河南省,安阳市,林州市', '3', '456550', '0372', '410581', 'Linzhou', '113.8155800', '36.0780400');
INSERT INTO `sys_cn_area` VALUES ('1594', '鹤壁市', '鹤壁', '1533', null, '中国,河南省,鹤壁市', '2', '458030', '0392', '410600', 'Hebi', '114.2954440', '35.7482360');
INSERT INTO `sys_cn_area` VALUES ('1595', '鹤山区', '鹤山', '1594', null, '中国,河南省,鹤壁市,鹤山区', '3', '458010', '0392', '410602', 'Heshan', '114.1633600', '35.9545800');
INSERT INTO `sys_cn_area` VALUES ('1596', '山城区', '山城', '1594', null, '中国,河南省,鹤壁市,山城区', '3', '458000', '0392', '410603', 'Shancheng', '114.1844300', '35.8977300');
INSERT INTO `sys_cn_area` VALUES ('1597', '淇滨区', '淇滨', '1594', null, '中国,河南省,鹤壁市,淇滨区', '3', '458000', '0392', '410611', 'Qibin', '114.2986700', '35.7412700');
INSERT INTO `sys_cn_area` VALUES ('1598', '浚县', '浚县', '1594', null, '中国,河南省,鹤壁市,浚县', '3', '456250', '0392', '410621', 'Xunxian', '114.5487900', '35.6708500');
INSERT INTO `sys_cn_area` VALUES ('1599', '淇县', '淇县', '1594', null, '中国,河南省,鹤壁市,淇县', '3', '456750', '0392', '410622', 'Qixian', '114.1976000', '35.6078200');
INSERT INTO `sys_cn_area` VALUES ('1600', '新乡市', '新乡', '1533', null, '中国,河南省,新乡市', '2', '453000', '0373', '410700', 'Xinxiang', '113.8839910', '35.3026160');
INSERT INTO `sys_cn_area` VALUES ('1601', '红旗区', '红旗', '1600', null, '中国,河南省,新乡市,红旗区', '3', '453000', '0373', '410702', 'Hongqi', '113.8752300', '35.3036700');
INSERT INTO `sys_cn_area` VALUES ('1602', '卫滨区', '卫滨', '1600', null, '中国,河南省,新乡市,卫滨区', '3', '453000', '0373', '410703', 'Weibin', '113.8657800', '35.3021100');
INSERT INTO `sys_cn_area` VALUES ('1603', '凤泉区', '凤泉', '1600', null, '中国,河南省,新乡市,凤泉区', '3', '453011', '0373', '410704', 'Fengquan', '113.9150700', '35.3839900');
INSERT INTO `sys_cn_area` VALUES ('1604', '牧野区', '牧野', '1600', null, '中国,河南省,新乡市,牧野区', '3', '453002', '0373', '410711', 'Muye', '113.9086000', '35.3149000');
INSERT INTO `sys_cn_area` VALUES ('1605', '新乡县', '新乡', '1600', null, '中国,河南省,新乡市,新乡县', '3', '453700', '0373', '410721', 'Xinxiang', '113.8051100', '35.1907500');
INSERT INTO `sys_cn_area` VALUES ('1606', '获嘉县', '获嘉', '1600', null, '中国,河南省,新乡市,获嘉县', '3', '453800', '0373', '410724', 'Huojia', '113.6615900', '35.2652100');
INSERT INTO `sys_cn_area` VALUES ('1607', '原阳县', '原阳', '1600', null, '中国,河南省,新乡市,原阳县', '3', '453500', '0373', '410725', 'Yuanyang', '113.9399400', '35.0656500');
INSERT INTO `sys_cn_area` VALUES ('1608', '延津县', '延津', '1600', null, '中国,河南省,新乡市,延津县', '3', '453200', '0373', '410726', 'Yanjin', '114.2026600', '35.1432700');
INSERT INTO `sys_cn_area` VALUES ('1609', '封丘县', '封丘', '1600', null, '中国,河南省,新乡市,封丘县', '3', '453300', '0373', '410727', 'Fengqiu', '114.4191500', '35.0416600');
INSERT INTO `sys_cn_area` VALUES ('1610', '长垣县', '长垣', '1600', null, '中国,河南省,新乡市,长垣县', '3', '453400', '0373', '410728', 'Changyuan', '114.6688200', '35.2004600');
INSERT INTO `sys_cn_area` VALUES ('1611', '卫辉市', '卫辉', '1600', null, '中国,河南省,新乡市,卫辉市', '3', '453100', '0373', '410781', 'Weihui', '114.0645400', '35.3984300');
INSERT INTO `sys_cn_area` VALUES ('1612', '辉县市', '辉县', '1600', null, '中国,河南省,新乡市,辉县市', '3', '453600', '0373', '410782', 'Huixian', '113.8067000', '35.4630700');
INSERT INTO `sys_cn_area` VALUES ('1613', '焦作市', '焦作', '1533', null, '中国,河南省,焦作市', '2', '454002', '0391', '410800', 'Jiaozuo', '113.2382660', '35.2390400');
INSERT INTO `sys_cn_area` VALUES ('1614', '解放区', '解放', '1613', null, '中国,河南省,焦作市,解放区', '3', '454000', '0391', '410802', 'Jiefang', '113.2293300', '35.2402300');
INSERT INTO `sys_cn_area` VALUES ('1615', '中站区', '中站', '1613', null, '中国,河南省,焦作市,中站区', '3', '454191', '0391', '410803', 'Zhongzhan', '113.1831500', '35.2366500');
INSERT INTO `sys_cn_area` VALUES ('1616', '马村区', '马村', '1613', null, '中国,河南省,焦作市,马村区', '3', '454171', '0391', '410804', 'Macun', '113.3187000', '35.2690800');
INSERT INTO `sys_cn_area` VALUES ('1617', '山阳区', '山阳', '1613', null, '中国,河南省,焦作市,山阳区', '3', '454002', '0391', '410811', 'Shanyang', '113.2546400', '35.2143600');
INSERT INTO `sys_cn_area` VALUES ('1618', '修武县', '修武', '1613', null, '中国,河南省,焦作市,修武县', '3', '454350', '0391', '410821', 'Xiuwu', '113.4477500', '35.2235700');
INSERT INTO `sys_cn_area` VALUES ('1619', '博爱县', '博爱', '1613', null, '中国,河南省,焦作市,博爱县', '3', '454450', '0391', '410822', 'Boai', '113.0669800', '35.1694300');
INSERT INTO `sys_cn_area` VALUES ('1620', '武陟县', '武陟', '1613', null, '中国,河南省,焦作市,武陟县', '3', '454950', '0391', '410823', 'Wuzhi', '113.3971800', '35.0950500');
INSERT INTO `sys_cn_area` VALUES ('1621', '温县', '温县', '1613', null, '中国,河南省,焦作市,温县', '3', '454850', '0391', '410825', 'Wenxian', '113.0806500', '34.9402200');
INSERT INTO `sys_cn_area` VALUES ('1622', '沁阳市', '沁阳', '1613', null, '中国,河南省,焦作市,沁阳市', '3', '454550', '0391', '410882', 'Qinyang', '112.9449400', '35.0893500');
INSERT INTO `sys_cn_area` VALUES ('1623', '孟州市', '孟州', '1613', null, '中国,河南省,焦作市,孟州市', '3', '454750', '0391', '410883', 'Mengzhou', '112.7913800', '34.9071000');
INSERT INTO `sys_cn_area` VALUES ('1624', '濮阳市', '濮阳', '1533', null, '中国,河南省,濮阳市', '2', '457000', '0393', '410900', 'Puyang', '115.0412990', '35.7682340');
INSERT INTO `sys_cn_area` VALUES ('1625', '华龙区', '华龙', '1624', null, '中国,河南省,濮阳市,华龙区', '3', '457001', '0393', '410902', 'Hualong', '115.0744600', '35.7773600');
INSERT INTO `sys_cn_area` VALUES ('1626', '清丰县', '清丰', '1624', null, '中国,河南省,濮阳市,清丰县', '3', '457300', '0393', '410922', 'Qingfeng', '115.1041500', '35.8850700');
INSERT INTO `sys_cn_area` VALUES ('1627', '南乐县', '南乐', '1624', null, '中国,河南省,濮阳市,南乐县', '3', '457400', '0393', '410923', 'Nanle', '115.2063900', '36.0768600');
INSERT INTO `sys_cn_area` VALUES ('1628', '范县', '范县', '1624', null, '中国,河南省,濮阳市,范县', '3', '457500', '0393', '410926', 'Fanxian', '115.5040500', '35.8517800');
INSERT INTO `sys_cn_area` VALUES ('1629', '台前县', '台前', '1624', null, '中国,河南省,濮阳市,台前县', '3', '457600', '0393', '410927', 'Taiqian', '115.8715800', '35.9692300');
INSERT INTO `sys_cn_area` VALUES ('1630', '濮阳县', '濮阳', '1624', null, '中国,河南省,濮阳市,濮阳县', '3', '457100', '0393', '410928', 'Puyang', '115.0305700', '35.7074500');
INSERT INTO `sys_cn_area` VALUES ('1631', '许昌市', '许昌', '1533', null, '中国,河南省,许昌市', '2', '461000', '0374', '411000', 'Xuchang', '113.8260630', '34.0229560');
INSERT INTO `sys_cn_area` VALUES ('1632', '魏都区', '魏都', '1631', null, '中国,河南省,许昌市,魏都区', '3', '461000', '0374', '411002', 'Weidu', '113.8227000', '34.0254400');
INSERT INTO `sys_cn_area` VALUES ('1633', '许昌县', '许昌', '1631', null, '中国,河南省,许昌市,许昌县', '3', '461100', '0374', '411023', 'Xuchang', '113.8470700', '34.0040600');
INSERT INTO `sys_cn_area` VALUES ('1634', '鄢陵县', '鄢陵', '1631', null, '中国,河南省,许昌市,鄢陵县', '3', '461200', '0374', '411024', 'Yanling', '114.1879500', '34.1031700');
INSERT INTO `sys_cn_area` VALUES ('1635', '襄城县', '襄城', '1631', null, '中国,河南省,许昌市,襄城县', '3', '461700', '0374', '411025', 'Xiangcheng', '113.4819600', '33.8492800');
INSERT INTO `sys_cn_area` VALUES ('1636', '禹州市', '禹州', '1631', null, '中国,河南省,许昌市,禹州市', '3', '461670', '0374', '411081', 'Yuzhou', '113.4880300', '34.1405400');
INSERT INTO `sys_cn_area` VALUES ('1637', '长葛市', '长葛', '1631', null, '中国,河南省,许昌市,长葛市', '3', '461500', '0374', '411082', 'Changge', '113.7732800', '34.2184600');
INSERT INTO `sys_cn_area` VALUES ('1638', '漯河市', '漯河', '1533', null, '中国,河南省,漯河市', '2', '462000', '0395', '411100', 'Luohe', '114.0264050', '33.5758550');
INSERT INTO `sys_cn_area` VALUES ('1639', '源汇区', '源汇', '1638', null, '中国,河南省,漯河市,源汇区', '3', '462000', '0395', '411102', 'Yuanhui', '114.0064700', '33.5562700');
INSERT INTO `sys_cn_area` VALUES ('1640', '郾城区', '郾城', '1638', null, '中国,河南省,漯河市,郾城区', '3', '462300', '0395', '411103', 'Yancheng', '114.0069400', '33.5872300');
INSERT INTO `sys_cn_area` VALUES ('1641', '召陵区', '召陵', '1638', null, '中国,河南省,漯河市,召陵区', '3', '462300', '0395', '411104', 'Zhaoling', '114.0939900', '33.5860100');
INSERT INTO `sys_cn_area` VALUES ('1642', '舞阳县', '舞阳', '1638', null, '中国,河南省,漯河市,舞阳县', '3', '462400', '0395', '411121', 'Wuyang', '113.5984800', '33.4324300');
INSERT INTO `sys_cn_area` VALUES ('1643', '临颍县', '临颍', '1638', null, '中国,河南省,漯河市,临颍县', '3', '462600', '0395', '411122', 'Linying', '113.9366100', '33.8112300');
INSERT INTO `sys_cn_area` VALUES ('1644', '三门峡市', '三门峡', '1533', null, '中国,河南省,三门峡市', '2', '472000', '0398', '411200', 'Sanmenxia', '111.1940990', '34.7773380');
INSERT INTO `sys_cn_area` VALUES ('1645', '湖滨区', '湖滨', '1644', null, '中国,河南省,三门峡市,湖滨区', '3', '472000', '0398', '411202', 'Hubin', '111.2000600', '34.7787200');
INSERT INTO `sys_cn_area` VALUES ('1646', '渑池县', '渑池', '1644', null, '中国,河南省,三门峡市,渑池县', '3', '472400', '0398', '411221', 'Mianchi', '111.7618400', '34.7672500');
INSERT INTO `sys_cn_area` VALUES ('1647', '陕县', '陕县', '1644', null, '中国,河南省,三门峡市,陕县', '3', '472100', '0398', '411222', 'Shanxian', '111.1033300', '34.7205200');
INSERT INTO `sys_cn_area` VALUES ('1648', '卢氏县', '卢氏', '1644', null, '中国,河南省,三门峡市,卢氏县', '3', '472200', '0398', '411224', 'Lushi', '111.0478200', '34.0543600');
INSERT INTO `sys_cn_area` VALUES ('1649', '义马市', '义马', '1644', null, '中国,河南省,三门峡市,义马市', '3', '472300', '0398', '411281', 'Yima', '111.8744500', '34.7472100');
INSERT INTO `sys_cn_area` VALUES ('1650', '灵宝市', '灵宝', '1644', null, '中国,河南省,三门峡市,灵宝市', '3', '472500', '0398', '411282', 'Lingbao', '110.8945000', '34.5168200');
INSERT INTO `sys_cn_area` VALUES ('1651', '南阳市', '南阳', '1533', null, '中国,河南省,南阳市', '2', '473002', '0377', '411300', 'Nanyang', '112.5409180', '32.9990820');
INSERT INTO `sys_cn_area` VALUES ('1652', '宛城区', '宛城', '1651', null, '中国,河南省,南阳市,宛城区', '3', '473001', '0377', '411302', 'Wancheng', '112.5395500', '33.0037800');
INSERT INTO `sys_cn_area` VALUES ('1653', '卧龙区', '卧龙', '1651', null, '中国,河南省,南阳市,卧龙区', '3', '473003', '0377', '411303', 'Wolong', '112.5347900', '32.9861500');
INSERT INTO `sys_cn_area` VALUES ('1654', '南召县', '南召', '1651', null, '中国,河南省,南阳市,南召县', '3', '474650', '0377', '411321', 'Nanzhao', '112.4319400', '33.4909800');
INSERT INTO `sys_cn_area` VALUES ('1655', '方城县', '方城', '1651', null, '中国,河南省,南阳市,方城县', '3', '473200', '0377', '411322', 'Fangcheng', '113.0126900', '33.2545300');
INSERT INTO `sys_cn_area` VALUES ('1656', '西峡县', '西峡', '1651', null, '中国,河南省,南阳市,西峡县', '3', '474550', '0377', '411323', 'Xixia', '111.4818700', '33.2977200');
INSERT INTO `sys_cn_area` VALUES ('1657', '镇平县', '镇平', '1651', null, '中国,河南省,南阳市,镇平县', '3', '474250', '0377', '411324', 'Zhenping', '112.2398000', '33.0362900');
INSERT INTO `sys_cn_area` VALUES ('1658', '内乡县', '内乡', '1651', null, '中国,河南省,南阳市,内乡县', '3', '474350', '0377', '411325', 'Neixiang', '111.8495700', '33.0467100');
INSERT INTO `sys_cn_area` VALUES ('1659', '淅川县', '淅川', '1651', null, '中国,河南省,南阳市,淅川县', '3', '474450', '0377', '411326', 'Xichuan', '111.4866300', '33.1370800');
INSERT INTO `sys_cn_area` VALUES ('1660', '社旗县', '社旗', '1651', null, '中国,河南省,南阳市,社旗县', '3', '473300', '0377', '411327', 'Sheqi', '112.9465600', '33.0550300');
INSERT INTO `sys_cn_area` VALUES ('1661', '唐河县', '唐河', '1651', null, '中国,河南省,南阳市,唐河县', '3', '473400', '0377', '411328', 'Tanghe', '112.8360900', '32.6945300');
INSERT INTO `sys_cn_area` VALUES ('1662', '新野县', '新野', '1651', null, '中国,河南省,南阳市,新野县', '3', '473500', '0377', '411329', 'Xinye', '112.3615100', '32.5169800');
INSERT INTO `sys_cn_area` VALUES ('1663', '桐柏县', '桐柏', '1651', null, '中国,河南省,南阳市,桐柏县', '3', '474750', '0377', '411330', 'Tongbai', '113.4288600', '32.3791700');
INSERT INTO `sys_cn_area` VALUES ('1664', '邓州市', '邓州', '1651', null, '中国,河南省,南阳市,邓州市', '3', '474150', '0377', '411381', 'Dengzhou', '112.0896000', '32.6857700');
INSERT INTO `sys_cn_area` VALUES ('1665', '商丘市', '商丘', '1533', null, '中国,河南省,商丘市', '2', '476000', '0370', '411400', 'Shangqiu', '115.6504970', '34.4370540');
INSERT INTO `sys_cn_area` VALUES ('1666', '梁园区', '梁园', '1665', null, '中国,河南省,商丘市,梁园区', '3', '476000', '0370', '411402', 'Liangyuan', '115.6448700', '34.4434100');
INSERT INTO `sys_cn_area` VALUES ('1667', '睢阳区', '睢阳', '1665', null, '中国,河南省,商丘市,睢阳区', '3', '476100', '0370', '411403', 'Suiyang', '115.6533800', '34.3880400');
INSERT INTO `sys_cn_area` VALUES ('1668', '民权县', '民权', '1665', null, '中国,河南省,商丘市,民权县', '3', '476800', '0370', '411421', 'Minquan', '115.1462100', '34.6493100');
INSERT INTO `sys_cn_area` VALUES ('1669', '睢县', '睢县', '1665', null, '中国,河南省,商丘市,睢县', '3', '476900', '0370', '411422', 'Suixian', '115.0716800', '34.4453900');
INSERT INTO `sys_cn_area` VALUES ('1670', '宁陵县', '宁陵', '1665', null, '中国,河南省,商丘市,宁陵县', '3', '476700', '0370', '411423', 'Ningling', '115.3051100', '34.4546300');
INSERT INTO `sys_cn_area` VALUES ('1671', '柘城县', '柘城', '1665', null, '中国,河南省,商丘市,柘城县', '3', '476200', '0370', '411424', 'Zhecheng', '115.3053800', '34.0911000');
INSERT INTO `sys_cn_area` VALUES ('1672', '虞城县', '虞城', '1665', null, '中国,河南省,商丘市,虞城县', '3', '476300', '0370', '411425', 'Yucheng', '115.8633700', '34.4018900');
INSERT INTO `sys_cn_area` VALUES ('1673', '夏邑县', '夏邑', '1665', null, '中国,河南省,商丘市,夏邑县', '3', '476400', '0370', '411426', 'Xiayi', '116.1334800', '34.2324200');
INSERT INTO `sys_cn_area` VALUES ('1674', '永城市', '永城', '1665', null, '中国,河南省,商丘市,永城市', '3', '476600', '0370', '411481', 'Yongcheng', '116.4494300', '33.9291100');
INSERT INTO `sys_cn_area` VALUES ('1675', '信阳市', '信阳', '1533', null, '中国,河南省,信阳市', '2', '464000', '0376', '411500', 'Xinyang', '114.0750310', '32.1232740');
INSERT INTO `sys_cn_area` VALUES ('1676', '浉河区', '浉河', '1675', null, '中国,河南省,信阳市,浉河区', '3', '464000', '0376', '411502', 'Shihe', '114.0587100', '32.1168000');
INSERT INTO `sys_cn_area` VALUES ('1677', '平桥区', '平桥', '1675', null, '中国,河南省,信阳市,平桥区', '3', '464100', '0376', '411503', 'Pingqiao', '114.1243500', '32.1009500');
INSERT INTO `sys_cn_area` VALUES ('1678', '罗山县', '罗山', '1675', null, '中国,河南省,信阳市,罗山县', '3', '464200', '0376', '411521', 'Luoshan', '114.5314000', '32.2027700');
INSERT INTO `sys_cn_area` VALUES ('1679', '光山县', '光山', '1675', null, '中国,河南省,信阳市,光山县', '3', '465450', '0376', '411522', 'Guangshan', '114.9187300', '32.0099200');
INSERT INTO `sys_cn_area` VALUES ('1680', '新县', '新县', '1675', null, '中国,河南省,信阳市,新县', '3', '465550', '0376', '411523', 'Xinxian', '114.8792400', '31.6438600');
INSERT INTO `sys_cn_area` VALUES ('1681', '商城县', '商城', '1675', null, '中国,河南省,信阳市,商城县', '3', '465350', '0376', '411524', 'Shangcheng', '115.4085600', '31.7998600');
INSERT INTO `sys_cn_area` VALUES ('1682', '固始县', '固始', '1675', null, '中国,河南省,信阳市,固始县', '3', '465250', '0376', '411525', 'Gushi', '115.6829800', '32.1801100');
INSERT INTO `sys_cn_area` VALUES ('1683', '潢川县', '潢川', '1675', null, '中国,河南省,信阳市,潢川县', '3', '465150', '0376', '411526', 'Huangchuan', '115.0469600', '32.1376300');
INSERT INTO `sys_cn_area` VALUES ('1684', '淮滨县', '淮滨', '1675', null, '中国,河南省,信阳市,淮滨县', '3', '464400', '0376', '411527', 'Huaibin', '115.4205000', '32.4661400');
INSERT INTO `sys_cn_area` VALUES ('1685', '息县', '息县', '1675', null, '中国,河南省,信阳市,息县', '3', '464300', '0376', '411528', 'Xixian', '114.7402000', '32.3427900');
INSERT INTO `sys_cn_area` VALUES ('1686', '周口市', '周口', '1533', null, '中国,河南省,周口市', '2', '466000', '0394', '411600', 'Zhoukou', '114.6496530', '33.6203570');
INSERT INTO `sys_cn_area` VALUES ('1687', '川汇区', '川汇', '1686', null, '中国,河南省,周口市,川汇区', '3', '466000', '0394', '411602', 'Chuanhui', '114.6420200', '33.6256000');
INSERT INTO `sys_cn_area` VALUES ('1688', '扶沟县', '扶沟', '1686', null, '中国,河南省,周口市,扶沟县', '3', '461300', '0394', '411621', 'Fugou', '114.3947700', '34.0599900');
INSERT INTO `sys_cn_area` VALUES ('1689', '西华县', '西华', '1686', null, '中国,河南省,周口市,西华县', '3', '466600', '0394', '411622', 'Xihua', '114.5227900', '33.7854800');
INSERT INTO `sys_cn_area` VALUES ('1690', '商水县', '商水', '1686', null, '中国,河南省,周口市,商水县', '3', '466100', '0394', '411623', 'Shangshui', '114.6060400', '33.5391200');
INSERT INTO `sys_cn_area` VALUES ('1691', '沈丘县', '沈丘', '1686', null, '中国,河南省,周口市,沈丘县', '3', '466300', '0394', '411624', 'Shenqiu', '115.0985100', '33.4093600');
INSERT INTO `sys_cn_area` VALUES ('1692', '郸城县', '郸城', '1686', null, '中国,河南省,周口市,郸城县', '3', '477150', '0394', '411625', 'Dancheng', '115.1771500', '33.6448500');
INSERT INTO `sys_cn_area` VALUES ('1693', '淮阳县', '淮阳', '1686', null, '中国,河南省,周口市,淮阳县', '3', '466700', '0394', '411626', 'Huaiyang', '114.8884800', '33.7321100');
INSERT INTO `sys_cn_area` VALUES ('1694', '太康县', '太康', '1686', null, '中国,河南省,周口市,太康县', '3', '461400', '0394', '411627', 'Taikang', '114.8377300', '34.0637600');
INSERT INTO `sys_cn_area` VALUES ('1695', '鹿邑县', '鹿邑', '1686', null, '中国,河南省,周口市,鹿邑县', '3', '477200', '0394', '411628', 'Luyi', '115.4855300', '33.8593100');
INSERT INTO `sys_cn_area` VALUES ('1696', '项城市', '项城', '1686', null, '中国,河南省,周口市,项城市', '3', '466200', '0394', '411681', 'Xiangcheng', '114.8755800', '33.4672000');
INSERT INTO `sys_cn_area` VALUES ('1697', '驻马店市', '驻马店', '1533', null, '中国,河南省,驻马店市', '2', '463000', '0396', '411700', 'Zhumadian', '114.0247360', '32.9801690');
INSERT INTO `sys_cn_area` VALUES ('1698', '驿城区', '驿城', '1697', null, '中国,河南省,驻马店市,驿城区', '3', '463000', '0396', '411702', 'Yicheng', '113.9937700', '32.9731600');
INSERT INTO `sys_cn_area` VALUES ('1699', '西平县', '西平', '1697', null, '中国,河南省,驻马店市,西平县', '3', '463900', '0396', '411721', 'Xiping', '114.0232200', '33.3845000');
INSERT INTO `sys_cn_area` VALUES ('1700', '上蔡县', '上蔡', '1697', null, '中国,河南省,驻马店市,上蔡县', '3', '463800', '0396', '411722', 'Shangcai', '114.2682500', '33.2682500');
INSERT INTO `sys_cn_area` VALUES ('1701', '平舆县', '平舆', '1697', null, '中国,河南省,驻马店市,平舆县', '3', '463400', '0396', '411723', 'Pingyu', '114.6355200', '32.9572700');
INSERT INTO `sys_cn_area` VALUES ('1702', '正阳县', '正阳', '1697', null, '中国,河南省,驻马店市,正阳县', '3', '463600', '0396', '411724', 'Zhengyang', '114.3895200', '32.6039000');
INSERT INTO `sys_cn_area` VALUES ('1703', '确山县', '确山', '1697', null, '中国,河南省,驻马店市,确山县', '3', '463200', '0396', '411725', 'Queshan', '114.0291700', '32.8028100');
INSERT INTO `sys_cn_area` VALUES ('1704', '泌阳县', '泌阳', '1697', null, '中国,河南省,驻马店市,泌阳县', '3', '463700', '0396', '411726', 'Biyang', '113.3268100', '32.7178100');
INSERT INTO `sys_cn_area` VALUES ('1705', '汝南县', '汝南', '1697', null, '中国,河南省,驻马店市,汝南县', '3', '463300', '0396', '411727', 'Runan', '114.3613800', '33.0046100');
INSERT INTO `sys_cn_area` VALUES ('1706', '遂平县', '遂平', '1697', null, '中国,河南省,驻马店市,遂平县', '3', '463100', '0396', '411728', 'Suiping', '114.0129700', '33.1457100');
INSERT INTO `sys_cn_area` VALUES ('1707', '新蔡县', '新蔡', '1697', null, '中国,河南省,驻马店市,新蔡县', '3', '463500', '0396', '411729', 'Xincai', '114.9819900', '32.7502000');
INSERT INTO `sys_cn_area` VALUES ('1708', '直辖县级', ' ', '1533', null, '中国,河南省,直辖县级', '2', null, '', '419000', '', '113.6654120', '34.7579750');
INSERT INTO `sys_cn_area` VALUES ('1709', '济源市', '济源', '1708', null, '中国,河南省,直辖县级,济源市', '3', '454650', '0391', '419001', 'Jiyuan', '112.5900470', '35.0903780');
INSERT INTO `sys_cn_area` VALUES ('1710', '湖北省', '湖北', '1', null, '中国,湖北省', '1', null, '', '420000', 'Hubei', '114.2985720', '30.5843550');
INSERT INTO `sys_cn_area` VALUES ('1711', '武汉市', '武汉', '1710', null, '中国,湖北省,武汉市', '2', '430014', '', '420100', 'Wuhan', '114.2985720', '30.5843550');
INSERT INTO `sys_cn_area` VALUES ('1712', '江岸区', '江岸', '1711', null, '中国,湖北省,武汉市,江岸区', '3', '430014', '027', '420102', 'Jiang\'an', '114.3094300', '30.5998200');
INSERT INTO `sys_cn_area` VALUES ('1713', '江汉区', '江汉', '1711', null, '中国,湖北省,武汉市,江汉区', '3', '430021', '027', '420103', 'Jianghan', '114.2709300', '30.6014600');
INSERT INTO `sys_cn_area` VALUES ('1714', '硚口区', '硚口', '1711', null, '中国,湖北省,武汉市,硚口区', '3', '430033', '027', '420104', 'Qiaokou', '114.2642200', '30.5694500');
INSERT INTO `sys_cn_area` VALUES ('1715', '汉阳区', '汉阳', '1711', null, '中国,湖北省,武汉市,汉阳区', '3', '430050', '027', '420105', 'Hanyang', '114.2747800', '30.5491500');
INSERT INTO `sys_cn_area` VALUES ('1716', '武昌区', '武昌', '1711', null, '中国,湖北省,武汉市,武昌区', '3', '430061', '027', '420106', 'Wuchang', '114.3158900', '30.5538900');
INSERT INTO `sys_cn_area` VALUES ('1717', '青山区', '青山', '1711', null, '中国,湖北省,武汉市,青山区', '3', '430080', '027', '420107', 'Qingshan', '114.3911700', '30.6342700');
INSERT INTO `sys_cn_area` VALUES ('1718', '洪山区', '洪山', '1711', null, '中国,湖北省,武汉市,洪山区', '3', '430070', '027', '420111', 'Hongshan', '114.3437500', '30.4998900');
INSERT INTO `sys_cn_area` VALUES ('1719', '东西湖区', '东西湖', '1711', null, '中国,湖北省,武汉市,东西湖区', '3', '430040', '027', '420112', 'Dongxihu', '114.1370800', '30.6198900');
INSERT INTO `sys_cn_area` VALUES ('1720', '汉南区', '汉南', '1711', null, '中国,湖北省,武汉市,汉南区', '3', '430090', '027', '420113', 'Hannan', '114.0846200', '30.3087900');
INSERT INTO `sys_cn_area` VALUES ('1721', '蔡甸区', '蔡甸', '1711', null, '中国,湖北省,武汉市,蔡甸区', '3', '430100', '027', '420114', 'Caidian', '114.0292900', '30.5819700');
INSERT INTO `sys_cn_area` VALUES ('1722', '江夏区', '江夏', '1711', null, '中国,湖北省,武汉市,江夏区', '3', '430200', '027', '420115', 'Jiangxia', '114.3130100', '30.3465300');
INSERT INTO `sys_cn_area` VALUES ('1723', '黄陂区', '黄陂', '1711', null, '中国,湖北省,武汉市,黄陂区', '3', '432200', '027', '420116', 'Huangpi', '114.3751200', '30.8815100');
INSERT INTO `sys_cn_area` VALUES ('1724', '新洲区', '新洲', '1711', null, '中国,湖北省,武汉市,新洲区', '3', '431400', '027', '420117', 'Xinzhou', '114.8013600', '30.8414500');
INSERT INTO `sys_cn_area` VALUES ('1725', '黄石市', '黄石', '1710', null, '中国,湖北省,黄石市', '2', '435003', '0714', '420200', 'Huangshi', '115.0770480', '30.2200740');
INSERT INTO `sys_cn_area` VALUES ('1726', '黄石港区', '黄石港', '1725', null, '中国,湖北省,黄石市,黄石港区', '3', '435000', '0714', '420202', 'Huangshigang', '115.0660400', '30.2227900');
INSERT INTO `sys_cn_area` VALUES ('1727', '西塞山区', '西塞山', '1725', null, '中国,湖北省,黄石市,西塞山区', '3', '435001', '0714', '420203', 'Xisaishan', '115.1101600', '30.2048700');
INSERT INTO `sys_cn_area` VALUES ('1728', '下陆区', '下陆', '1725', null, '中国,湖北省,黄石市,下陆区', '3', '435005', '0714', '420204', 'Xialu', '114.9611200', '30.1736800');
INSERT INTO `sys_cn_area` VALUES ('1729', '铁山区', '铁山', '1725', null, '中国,湖北省,黄石市,铁山区', '3', '435006', '0714', '420205', 'Tieshan', '114.9010900', '30.2067800');
INSERT INTO `sys_cn_area` VALUES ('1730', '阳新县', '阳新', '1725', null, '中国,湖北省,黄石市,阳新县', '3', '435200', '0714', '420222', 'Yangxin', '115.2152700', '29.8303800');
INSERT INTO `sys_cn_area` VALUES ('1731', '大冶市', '大冶', '1725', null, '中国,湖北省,黄石市,大冶市', '3', '435100', '0714', '420281', 'Daye', '114.9717400', '30.0943800');
INSERT INTO `sys_cn_area` VALUES ('1732', '十堰市', '十堰', '1710', null, '中国,湖北省,十堰市', '2', '442000', '0719', '420300', 'Shiyan', '110.7852390', '32.6470170');
INSERT INTO `sys_cn_area` VALUES ('1733', '茅箭区', '茅箭', '1732', null, '中国,湖北省,十堰市,茅箭区', '3', '442012', '0719', '420302', 'Maojian', '110.8134100', '32.5915300');
INSERT INTO `sys_cn_area` VALUES ('1734', '张湾区', '张湾', '1732', null, '中国,湖北省,十堰市,张湾区', '3', '442001', '0719', '420303', 'Zhangwan', '110.7706700', '32.6519500');
INSERT INTO `sys_cn_area` VALUES ('1735', '郧阳区', '郧阳', '1732', null, '中国,湖北省,十堰市,郧阳区', '3', '442500', '0719', '420304', 'Yunyang', '110.8185400', '32.8359300');
INSERT INTO `sys_cn_area` VALUES ('1736', '郧西县', '郧西', '1732', null, '中国,湖北省,十堰市,郧西县', '3', '442600', '0719', '420322', 'Yunxi', '110.4255600', '32.9934900');
INSERT INTO `sys_cn_area` VALUES ('1737', '竹山县', '竹山', '1732', null, '中国,湖北省,十堰市,竹山县', '3', '442200', '0719', '420323', 'Zhushan', '110.2307100', '32.2253600');
INSERT INTO `sys_cn_area` VALUES ('1738', '竹溪县', '竹溪', '1732', null, '中国,湖北省,十堰市,竹溪县', '3', '442300', '0719', '420324', 'Zhuxi', '109.7179800', '32.3190100');
INSERT INTO `sys_cn_area` VALUES ('1739', '房县', '房县', '1732', null, '中国,湖北省,十堰市,房县', '3', '442100', '0719', '420325', 'Fangxian', '110.7438600', '32.0579400');
INSERT INTO `sys_cn_area` VALUES ('1740', '丹江口市', '丹江口', '1732', null, '中国,湖北省,十堰市,丹江口市', '3', '442700', '0719', '420381', 'Danjiangkou', '111.5152500', '32.5408500');
INSERT INTO `sys_cn_area` VALUES ('1741', '宜昌市', '宜昌', '1710', null, '中国,湖北省,宜昌市', '2', '443000', '0717', '420500', 'Yichang', '111.2908430', '30.7026360');
INSERT INTO `sys_cn_area` VALUES ('1742', '西陵区', '西陵', '1741', null, '中国,湖北省,宜昌市,西陵区', '3', '443000', '0717', '420502', 'Xiling', '111.2857300', '30.7107700');
INSERT INTO `sys_cn_area` VALUES ('1743', '伍家岗区', '伍家岗', '1741', null, '中国,湖北省,宜昌市,伍家岗区', '3', '443001', '0717', '420503', 'Wujiagang', '111.3609000', '30.6443400');
INSERT INTO `sys_cn_area` VALUES ('1744', '点军区', '点军', '1741', null, '中国,湖北省,宜昌市,点军区', '3', '443006', '0717', '420504', 'Dianjun', '111.2682800', '30.6934000');
INSERT INTO `sys_cn_area` VALUES ('1745', '猇亭区', '猇亭', '1741', null, '中国,湖北省,宜昌市,猇亭区', '3', '443007', '0717', '420505', 'Xiaoting', '111.4407900', '30.5266300');
INSERT INTO `sys_cn_area` VALUES ('1746', '夷陵区', '夷陵', '1741', null, '中国,湖北省,宜昌市,夷陵区', '3', '443100', '0717', '420506', 'Yiling', '111.3262000', '30.7688100');
INSERT INTO `sys_cn_area` VALUES ('1747', '远安县', '远安', '1741', null, '中国,湖北省,宜昌市,远安县', '3', '444200', '0717', '420525', 'Yuan\'an', '111.6416000', '31.0598900');
INSERT INTO `sys_cn_area` VALUES ('1748', '兴山县', '兴山', '1741', null, '中国,湖北省,宜昌市,兴山县', '3', '443711', '0717', '420526', 'Xingshan', '110.7495100', '31.3468600');
INSERT INTO `sys_cn_area` VALUES ('1749', '秭归县', '秭归', '1741', null, '中国,湖北省,宜昌市,秭归县', '3', '443600', '0717', '420527', 'Zigui', '110.9815600', '30.8270200');
INSERT INTO `sys_cn_area` VALUES ('1750', '长阳土家族自治县', '长阳', '1741', null, '中国,湖北省,宜昌市,长阳土家族自治县', '3', '443500', '0717', '420528', 'Changyang', '111.2010500', '30.4705200');
INSERT INTO `sys_cn_area` VALUES ('1751', '五峰土家族自治县', '五峰', '1741', null, '中国,湖北省,宜昌市,五峰土家族自治县', '3', '443413', '0717', '420529', 'Wufeng', '110.6748000', '30.1985600');
INSERT INTO `sys_cn_area` VALUES ('1752', '宜都市', '宜都', '1741', null, '中国,湖北省,宜昌市,宜都市', '3', '443300', '0717', '420581', 'Yidu', '111.4502500', '30.3780700');
INSERT INTO `sys_cn_area` VALUES ('1753', '当阳市', '当阳', '1741', null, '中国,湖北省,宜昌市,当阳市', '3', '444100', '0717', '420582', 'Dangyang', '111.7891200', '30.8208000');
INSERT INTO `sys_cn_area` VALUES ('1754', '枝江市', '枝江', '1741', null, '中国,湖北省,宜昌市,枝江市', '3', '443200', '0717', '420583', 'Zhijiang', '111.7685500', '30.4261200');
INSERT INTO `sys_cn_area` VALUES ('1755', '襄阳市', '襄阳', '1710', null, '中国,湖北省,襄阳市', '2', '441021', '0710', '420600', 'Xiangyang', '112.1441460', '32.0424260');
INSERT INTO `sys_cn_area` VALUES ('1756', '襄城区', '襄城', '1755', null, '中国,湖北省,襄阳市,襄城区', '3', '441021', '0710', '420602', 'Xiangcheng', '112.1337200', '32.0101700');
INSERT INTO `sys_cn_area` VALUES ('1757', '樊城区', '樊城', '1755', null, '中国,湖北省,襄阳市,樊城区', '3', '441001', '0710', '420606', 'Fancheng', '112.1354600', '32.0448200');
INSERT INTO `sys_cn_area` VALUES ('1758', '襄州区', '襄州', '1755', null, '中国,湖北省,襄阳市,襄州区', '3', '441100', '0710', '420607', 'Xiangzhou', '112.1503270', '32.0150880');
INSERT INTO `sys_cn_area` VALUES ('1759', '南漳县', '南漳', '1755', null, '中国,湖北省,襄阳市,南漳县', '3', '441500', '0710', '420624', 'Nanzhang', '111.8460300', '31.7765300');
INSERT INTO `sys_cn_area` VALUES ('1760', '谷城县', '谷城', '1755', null, '中国,湖北省,襄阳市,谷城县', '3', '441700', '0710', '420625', 'Gucheng', '111.6526700', '32.2637700');
INSERT INTO `sys_cn_area` VALUES ('1761', '保康县', '保康', '1755', null, '中国,湖北省,襄阳市,保康县', '3', '441600', '0710', '420626', 'Baokang', '111.2613800', '31.8787400');
INSERT INTO `sys_cn_area` VALUES ('1762', '老河口市', '老河口', '1755', null, '中国,湖北省,襄阳市,老河口市', '3', '441800', '0710', '420682', 'Laohekou', '111.6711700', '32.3847600');
INSERT INTO `sys_cn_area` VALUES ('1763', '枣阳市', '枣阳', '1755', null, '中国,湖北省,襄阳市,枣阳市', '3', '441200', '0710', '420683', 'Zaoyang', '112.7744400', '32.1314200');
INSERT INTO `sys_cn_area` VALUES ('1764', '宜城市', '宜城', '1755', null, '中国,湖北省,襄阳市,宜城市', '3', '441400', '0710', '420684', 'Yicheng', '112.2577200', '31.7197200');
INSERT INTO `sys_cn_area` VALUES ('1765', '鄂州市', '鄂州', '1710', null, '中国,湖北省,鄂州市', '2', '436000', '0711', '420700', 'Ezhou', '114.8905930', '30.3965360');
INSERT INTO `sys_cn_area` VALUES ('1766', '梁子湖区', '梁子湖', '1765', null, '中国,湖北省,鄂州市,梁子湖区', '3', '436064', '0711', '420702', 'Liangzihu', '114.6846300', '30.1000300');
INSERT INTO `sys_cn_area` VALUES ('1767', '华容区', '华容', '1765', null, '中国,湖北省,鄂州市,华容区', '3', '436030', '0711', '420703', 'Huarong', '114.7356800', '30.5332800');
INSERT INTO `sys_cn_area` VALUES ('1768', '鄂城区', '鄂城', '1765', null, '中国,湖北省,鄂州市,鄂城区', '3', '436000', '0711', '420704', 'Echeng', '114.8915800', '30.4002400');
INSERT INTO `sys_cn_area` VALUES ('1769', '荆门市', '荆门', '1710', null, '中国,湖北省,荆门市', '2', '448000', '0724', '420800', 'Jingmen', '112.2042510', '31.0354200');
INSERT INTO `sys_cn_area` VALUES ('1770', '东宝区', '东宝', '1769', null, '中国,湖北省,荆门市,东宝区', '3', '448004', '0724', '420802', 'Dongbao', '112.2014700', '31.0519200');
INSERT INTO `sys_cn_area` VALUES ('1771', '掇刀区', '掇刀', '1769', null, '中国,湖北省,荆门市,掇刀区', '3', '448124', '0724', '420804', 'Duodao', '112.2080000', '30.9731600');
INSERT INTO `sys_cn_area` VALUES ('1772', '京山县', '京山', '1769', null, '中国,湖北省,荆门市,京山县', '3', '431800', '0724', '420821', 'Jingshan', '113.1107400', '31.0224000');
INSERT INTO `sys_cn_area` VALUES ('1773', '沙洋县', '沙洋', '1769', null, '中国,湖北省,荆门市,沙洋县', '3', '448200', '0724', '420822', 'Shayang', '112.5885300', '30.7091600');
INSERT INTO `sys_cn_area` VALUES ('1774', '钟祥市', '钟祥', '1769', null, '中国,湖北省,荆门市,钟祥市', '3', '431900', '0724', '420881', 'Zhongxiang', '112.5893200', '31.1678000');
INSERT INTO `sys_cn_area` VALUES ('1775', '孝感市', '孝感', '1710', null, '中国,湖北省,孝感市', '2', '432100', '0712', '420900', 'Xiaogan', '113.9266550', '30.9264230');
INSERT INTO `sys_cn_area` VALUES ('1776', '孝南区', '孝南', '1775', null, '中国,湖北省,孝感市,孝南区', '3', '432100', '0712', '420902', 'Xiaonan', '113.9111100', '30.9168000');
INSERT INTO `sys_cn_area` VALUES ('1777', '孝昌县', '孝昌', '1775', null, '中国,湖北省,孝感市,孝昌县', '3', '432900', '0712', '420921', 'Xiaochang', '113.9979500', '31.2579900');
INSERT INTO `sys_cn_area` VALUES ('1778', '大悟县', '大悟', '1775', null, '中国,湖北省,孝感市,大悟县', '3', '432800', '0712', '420922', 'Dawu', '114.1256400', '31.5617600');
INSERT INTO `sys_cn_area` VALUES ('1779', '云梦县', '云梦', '1775', null, '中国,湖北省,孝感市,云梦县', '3', '432500', '0712', '420923', 'Yunmeng', '113.7528900', '31.0209300');
INSERT INTO `sys_cn_area` VALUES ('1780', '应城市', '应城', '1775', null, '中国,湖北省,孝感市,应城市', '3', '432400', '0712', '420981', 'Yingcheng', '113.5728700', '30.9283400');
INSERT INTO `sys_cn_area` VALUES ('1781', '安陆市', '安陆', '1775', null, '中国,湖北省,孝感市,安陆市', '3', '432600', '0712', '420982', 'Anlu', '113.6855700', '31.2569300');
INSERT INTO `sys_cn_area` VALUES ('1782', '汉川市', '汉川', '1775', null, '中国,湖北省,孝感市,汉川市', '3', '432300', '0712', '420984', 'Hanchuan', '113.8389800', '30.6611700');
INSERT INTO `sys_cn_area` VALUES ('1783', '荆州市', '荆州', '1710', null, '中国,湖北省,荆州市', '2', '434000', '0716', '421000', 'Jingzhou', '112.2381300', '30.3268570');
INSERT INTO `sys_cn_area` VALUES ('1784', '沙市区', '沙市', '1783', null, '中国,湖北省,荆州市,沙市区', '3', '434000', '0716', '421002', 'Shashi', '112.2554300', '30.3110700');
INSERT INTO `sys_cn_area` VALUES ('1785', '荆州区', '荆州', '1783', null, '中国,湖北省,荆州市,荆州区', '3', '434020', '0716', '421003', 'Jingzhou', '112.1900600', '30.3526400');
INSERT INTO `sys_cn_area` VALUES ('1786', '公安县', '公安', '1783', null, '中国,湖北省,荆州市,公安县', '3', '434300', '0716', '421022', 'Gong\'an', '112.2324200', '30.0590200');
INSERT INTO `sys_cn_area` VALUES ('1787', '监利县', '监利', '1783', null, '中国,湖北省,荆州市,监利县', '3', '433300', '0716', '421023', 'Jianli', '112.8946200', '29.8149400');
INSERT INTO `sys_cn_area` VALUES ('1788', '江陵县', '江陵', '1783', null, '中国,湖北省,荆州市,江陵县', '3', '434101', '0716', '421024', 'Jiangling', '112.4246800', '30.0417400');
INSERT INTO `sys_cn_area` VALUES ('1789', '石首市', '石首', '1783', null, '中国,湖北省,荆州市,石首市', '3', '434400', '0716', '421081', 'Shishou', '112.4263600', '29.7212700');
INSERT INTO `sys_cn_area` VALUES ('1790', '洪湖市', '洪湖', '1783', null, '中国,湖北省,荆州市,洪湖市', '3', '433200', '0716', '421083', 'Honghu', '113.4759800', '29.8270000');
INSERT INTO `sys_cn_area` VALUES ('1791', '松滋市', '松滋', '1783', null, '中国,湖北省,荆州市,松滋市', '3', '434200', '0716', '421087', 'Songzi', '111.7673900', '30.1696500');
INSERT INTO `sys_cn_area` VALUES ('1792', '黄冈市', '黄冈', '1710', null, '中国,湖北省,黄冈市', '2', '438000', '0713', '421100', 'Huanggang', '114.8793650', '30.4477110');
INSERT INTO `sys_cn_area` VALUES ('1793', '黄州区', '黄州', '1792', null, '中国,湖北省,黄冈市,黄州区', '3', '438000', '0713', '421102', 'Huangzhou', '114.8800800', '30.4343600');
INSERT INTO `sys_cn_area` VALUES ('1794', '团风县', '团风', '1792', null, '中国,湖北省,黄冈市,团风县', '3', '438800', '0713', '421121', 'Tuanfeng', '114.8722800', '30.6435900');
INSERT INTO `sys_cn_area` VALUES ('1795', '红安县', '红安', '1792', null, '中国,湖北省,黄冈市,红安县', '3', '438401', '0713', '421122', 'Hong\'an', '114.6224000', '31.2866800');
INSERT INTO `sys_cn_area` VALUES ('1796', '罗田县', '罗田', '1792', null, '中国,湖北省,黄冈市,罗田县', '3', '438600', '0713', '421123', 'Luotian', '115.3997100', '30.7825500');
INSERT INTO `sys_cn_area` VALUES ('1797', '英山县', '英山', '1792', null, '中国,湖北省,黄冈市,英山县', '3', '438700', '0713', '421124', 'Yingshan', '115.6814200', '30.7351600');
INSERT INTO `sys_cn_area` VALUES ('1798', '浠水县', '浠水', '1792', null, '中国,湖北省,黄冈市,浠水县', '3', '438200', '0713', '421125', 'Xishui', '115.2691300', '30.4526500');
INSERT INTO `sys_cn_area` VALUES ('1799', '蕲春县', '蕲春', '1792', null, '中国,湖北省,黄冈市,蕲春县', '3', '435300', '0713', '421126', 'Qichun', '115.4361500', '30.2261300');
INSERT INTO `sys_cn_area` VALUES ('1800', '黄梅县', '黄梅', '1792', null, '中国,湖北省,黄冈市,黄梅县', '3', '435500', '0713', '421127', 'Huangmei', '115.9442700', '30.0703300');
INSERT INTO `sys_cn_area` VALUES ('1801', '麻城市', '麻城', '1792', null, '中国,湖北省,黄冈市,麻城市', '3', '438300', '0713', '421181', 'Macheng', '115.0098800', '31.1722800');
INSERT INTO `sys_cn_area` VALUES ('1802', '武穴市', '武穴', '1792', null, '中国,湖北省,黄冈市,武穴市', '3', '435400', '0713', '421182', 'Wuxue', '115.5597500', '29.8444600');
INSERT INTO `sys_cn_area` VALUES ('1803', '咸宁市', '咸宁', '1710', null, '中国,湖北省,咸宁市', '2', '437000', '0715', '421200', 'Xianning', '114.3289630', '29.8327980');
INSERT INTO `sys_cn_area` VALUES ('1804', '咸安区', '咸安', '1803', null, '中国,湖北省,咸宁市,咸安区', '3', '437000', '0715', '421202', 'Xian\'an', '114.2987200', '29.8529000');
INSERT INTO `sys_cn_area` VALUES ('1805', '嘉鱼县', '嘉鱼', '1803', null, '中国,湖北省,咸宁市,嘉鱼县', '3', '437200', '0715', '421221', 'Jiayu', '113.9392700', '29.9705400');
INSERT INTO `sys_cn_area` VALUES ('1806', '通城县', '通城', '1803', null, '中国,湖北省,咸宁市,通城县', '3', '437400', '0715', '421222', 'Tongcheng', '113.8158200', '29.2456800');
INSERT INTO `sys_cn_area` VALUES ('1807', '崇阳县', '崇阳', '1803', null, '中国,湖北省,咸宁市,崇阳县', '3', '437500', '0715', '421223', 'Chongyang', '114.0398200', '29.5556400');
INSERT INTO `sys_cn_area` VALUES ('1808', '通山县', '通山', '1803', null, '中国,湖北省,咸宁市,通山县', '3', '437600', '0715', '421224', 'Tongshan', '114.4823900', '29.6063000');
INSERT INTO `sys_cn_area` VALUES ('1809', '赤壁市', '赤壁', '1803', null, '中国,湖北省,咸宁市,赤壁市', '3', '437300', '0715', '421281', 'Chibi', '113.9003900', '29.7245400');
INSERT INTO `sys_cn_area` VALUES ('1810', '随州市', '随州', '1710', null, '中国,湖北省,随州市', '2', '441300', '0722', '421300', 'Suizhou', '113.3737700', '31.7174970');
INSERT INTO `sys_cn_area` VALUES ('1811', '曾都区', '曾都', '1810', null, '中国,湖北省,随州市,曾都区', '3', '441300', '0722', '421303', 'Zengdu', '113.3712800', '31.7161400');
INSERT INTO `sys_cn_area` VALUES ('1812', '随县', '随县', '1810', null, '中国,湖北省,随州市,随县', '3', '441309', '0722', '421321', 'Suixian', '113.8266300', '31.6179000');
INSERT INTO `sys_cn_area` VALUES ('1813', '广水市', '广水', '1810', null, '中国,湖北省,随州市,广水市', '3', '432700', '0722', '421381', 'Guangshui', '113.8266300', '31.6179000');
INSERT INTO `sys_cn_area` VALUES ('1814', '恩施土家族苗族自治州', '恩施', '1710', null, '中国,湖北省,恩施土家族苗族自治州', '2', '445000', '0718', '422800', 'Enshi', '109.4869900', '30.2831140');
INSERT INTO `sys_cn_area` VALUES ('1815', '恩施市', '恩施', '1814', null, '中国,湖北省,恩施土家族苗族自治州,恩施市', '3', '445000', '0718', '422801', 'Enshi', '109.4794200', '30.2950200');
INSERT INTO `sys_cn_area` VALUES ('1816', '利川市', '利川', '1814', null, '中国,湖北省,恩施土家族苗族自治州,利川市', '3', '445400', '0718', '422802', 'Lichuan', '108.9359100', '30.2911700');
INSERT INTO `sys_cn_area` VALUES ('1817', '建始县', '建始', '1814', null, '中国,湖北省,恩施土家族苗族自治州,建始县', '3', '445300', '0718', '422822', 'Jianshi', '109.7220700', '30.6020900');
INSERT INTO `sys_cn_area` VALUES ('1818', '巴东县', '巴东', '1814', null, '中国,湖北省,恩施土家族苗族自治州,巴东县', '3', '444300', '0718', '422823', 'Badong', '110.3406600', '31.0423300');
INSERT INTO `sys_cn_area` VALUES ('1819', '宣恩县', '宣恩', '1814', null, '中国,湖北省,恩施土家族苗族自治州,宣恩县', '3', '445500', '0718', '422825', 'Xuanen', '109.4917900', '29.9871400');
INSERT INTO `sys_cn_area` VALUES ('1820', '咸丰县', '咸丰', '1814', null, '中国,湖北省,恩施土家族苗族自治州,咸丰县', '3', '445600', '0718', '422826', 'Xianfeng', '109.1520000', '29.6798300');
INSERT INTO `sys_cn_area` VALUES ('1821', '来凤县', '来凤', '1814', null, '中国,湖北省,恩施土家族苗族自治州,来凤县', '3', '445700', '0718', '422827', 'Laifeng', '109.4071600', '29.4937300');
INSERT INTO `sys_cn_area` VALUES ('1822', '鹤峰县', '鹤峰', '1814', null, '中国,湖北省,恩施土家族苗族自治州,鹤峰县', '3', '445800', '0718', '422828', 'Hefeng', '110.0309100', '29.8907200');
INSERT INTO `sys_cn_area` VALUES ('1823', '直辖县级', ' ', '1710', null, '中国,湖北省,直辖县级', '2', null, '', '429000', '', '114.2985720', '30.5843550');
INSERT INTO `sys_cn_area` VALUES ('1824', '仙桃市', '仙桃', '1823', null, '中国,湖北省,直辖县级,仙桃市', '3', '433000', '0728', '429004', 'Xiantao', '113.4539740', '30.3649530');
INSERT INTO `sys_cn_area` VALUES ('1825', '潜江市', '潜江', '1823', null, '中国,湖北省,直辖县级,潜江市', '3', '433100', '0728', '429005', 'Qianjiang', '112.8968660', '30.4212150');
INSERT INTO `sys_cn_area` VALUES ('1826', '天门市', '天门', '1823', null, '中国,湖北省,直辖县级,天门市', '3', '431700', '0728', '429006', 'Tianmen', '113.1658620', '30.6530610');
INSERT INTO `sys_cn_area` VALUES ('1827', '神农架林区', '神农架', '1823', null, '中国,湖北省,直辖县级,神农架林区', '3', '442400', '0719', '429021', 'Shennongjia', '110.6715250', '31.7444490');
INSERT INTO `sys_cn_area` VALUES ('1828', '湖南省', '湖南', '1', null, '中国,湖南省', '1', null, '', '430000', 'Hunan', '112.9822790', '28.1940900');
INSERT INTO `sys_cn_area` VALUES ('1829', '长沙市', '长沙', '1828', null, '中国,湖南省,长沙市', '2', '410005', '0731', '430100', 'Changsha', '112.9822790', '28.1940900');
INSERT INTO `sys_cn_area` VALUES ('1830', '芙蓉区', '芙蓉', '1829', null, '中国,湖南省,长沙市,芙蓉区', '3', '410011', '0731', '430102', 'Furong', '113.0317600', '28.1844000');
INSERT INTO `sys_cn_area` VALUES ('1831', '天心区', '天心', '1829', null, '中国,湖南省,长沙市,天心区', '3', '410004', '0731', '430103', 'Tianxin', '112.9899100', '28.1127000');
INSERT INTO `sys_cn_area` VALUES ('1832', '岳麓区', '岳麓', '1829', null, '中国,湖南省,长沙市,岳麓区', '3', '410013', '0731', '430104', 'Yuelu', '112.9313300', '28.2351000');
INSERT INTO `sys_cn_area` VALUES ('1833', '开福区', '开福', '1829', null, '中国,湖南省,长沙市,开福区', '3', '410008', '0731', '430105', 'Kaifu', '112.9862300', '28.2558500');
INSERT INTO `sys_cn_area` VALUES ('1834', '雨花区', '雨花', '1829', null, '中国,湖南省,长沙市,雨花区', '3', '410011', '0731', '430111', 'Yuhua', '113.0356700', '28.1354100');
INSERT INTO `sys_cn_area` VALUES ('1835', '望城区', '望城', '1829', null, '中国,湖南省,长沙市,望城区', '3', '410200', '0731', '430112', 'Wangcheng', '112.8195490', '28.3474580');
INSERT INTO `sys_cn_area` VALUES ('1836', '长沙县', '长沙', '1829', null, '中国,湖南省,长沙市,长沙县', '3', '410100', '0731', '430121', 'Changsha', '113.0807100', '28.2459500');
INSERT INTO `sys_cn_area` VALUES ('1837', '宁乡县', '宁乡', '1829', null, '中国,湖南省,长沙市,宁乡县', '3', '410600', '0731', '430124', 'Ningxiang', '112.5574900', '28.2535800');
INSERT INTO `sys_cn_area` VALUES ('1838', '浏阳市', '浏阳', '1829', null, '中国,湖南省,长沙市,浏阳市', '3', '410300', '0731', '430181', 'Liuyang', '113.6431200', '28.1637500');
INSERT INTO `sys_cn_area` VALUES ('1839', '株洲市', '株洲', '1828', null, '中国,湖南省,株洲市', '2', '412000', '0731', '430200', 'Zhuzhou', '113.1517370', '27.8358060');
INSERT INTO `sys_cn_area` VALUES ('1840', '荷塘区', '荷塘', '1839', null, '中国,湖南省,株洲市,荷塘区', '3', '412000', '0731', '430202', 'Hetang', '113.1731500', '27.8556900');
INSERT INTO `sys_cn_area` VALUES ('1841', '芦淞区', '芦淞', '1839', null, '中国,湖南省,株洲市,芦淞区', '3', '412000', '0731', '430203', 'Lusong', '113.1556200', '27.7852500');
INSERT INTO `sys_cn_area` VALUES ('1842', '石峰区', '石峰', '1839', null, '中国,湖南省,株洲市,石峰区', '3', '412005', '0731', '430204', 'Shifeng', '113.1177600', '27.8755200');
INSERT INTO `sys_cn_area` VALUES ('1843', '天元区', '天元', '1839', null, '中国,湖南省,株洲市,天元区', '3', '412007', '0731', '430211', 'Tianyuan', '113.1233500', '27.8310300');
INSERT INTO `sys_cn_area` VALUES ('1844', '株洲县', '株洲', '1839', null, '中国,湖南省,株洲市,株洲县', '3', '412100', '0731', '430221', 'Zhuzhou', '113.1442800', '27.6982600');
INSERT INTO `sys_cn_area` VALUES ('1845', '攸县', '攸县', '1839', null, '中国,湖南省,株洲市,攸县', '3', '412300', '0731', '430223', 'Youxian', '113.3436500', '27.0035200');
INSERT INTO `sys_cn_area` VALUES ('1846', '茶陵县', '茶陵', '1839', null, '中国,湖南省,株洲市,茶陵县', '3', '412400', '0731', '430224', 'Chaling', '113.5436400', '26.7915000');
INSERT INTO `sys_cn_area` VALUES ('1847', '炎陵县', '炎陵', '1839', null, '中国,湖南省,株洲市,炎陵县', '3', '412500', '0731', '430225', 'Yanling', '113.7716300', '26.4881800');
INSERT INTO `sys_cn_area` VALUES ('1848', '醴陵市', '醴陵', '1839', null, '中国,湖南省,株洲市,醴陵市', '3', '412200', '0731', '430281', 'Liling', '113.4970400', '27.6461500');
INSERT INTO `sys_cn_area` VALUES ('1849', '湘潭市', '湘潭', '1828', null, '中国,湖南省,湘潭市', '2', '411100', '0731', '430300', 'Xiangtan', '112.9250830', '27.8467250');
INSERT INTO `sys_cn_area` VALUES ('1850', '雨湖区', '雨湖', '1849', null, '中国,湖南省,湘潭市,雨湖区', '3', '411100', '0731', '430302', 'Yuhu', '112.9039900', '27.8685900');
INSERT INTO `sys_cn_area` VALUES ('1851', '岳塘区', '岳塘', '1849', null, '中国,湖南省,湘潭市,岳塘区', '3', '411101', '0731', '430304', 'Yuetang', '112.9606000', '27.8578400');
INSERT INTO `sys_cn_area` VALUES ('1852', '湘潭县', '湘潭', '1849', null, '中国,湖南省,湘潭市,湘潭县', '3', '411228', '0731', '430321', 'Xiangtan', '112.9508000', '27.7789300');
INSERT INTO `sys_cn_area` VALUES ('1853', '湘乡市', '湘乡', '1849', null, '中国,湖南省,湘潭市,湘乡市', '3', '411400', '0731', '430381', 'Xiangxiang', '112.5351200', '27.7354300');
INSERT INTO `sys_cn_area` VALUES ('1854', '韶山市', '韶山', '1849', null, '中国,湖南省,湘潭市,韶山市', '3', '411300', '0731', '430382', 'Shaoshan', '112.5265500', '27.9150300');
INSERT INTO `sys_cn_area` VALUES ('1855', '衡阳市', '衡阳', '1828', null, '中国,湖南省,衡阳市', '2', '421001', '0734', '430400', 'Hengyang', '112.6076930', '26.9003580');
INSERT INTO `sys_cn_area` VALUES ('1856', '珠晖区', '珠晖', '1855', null, '中国,湖南省,衡阳市,珠晖区', '3', '421002', '0734', '430405', 'Zhuhui', '112.6205400', '26.8936100');
INSERT INTO `sys_cn_area` VALUES ('1857', '雁峰区', '雁峰', '1855', null, '中国,湖南省,衡阳市,雁峰区', '3', '421001', '0734', '430406', 'Yanfeng', '112.6165400', '26.8886600');
INSERT INTO `sys_cn_area` VALUES ('1858', '石鼓区', '石鼓', '1855', null, '中国,湖南省,衡阳市,石鼓区', '3', '421005', '0734', '430407', 'Shigu', '112.6106900', '26.9023200');
INSERT INTO `sys_cn_area` VALUES ('1859', '蒸湘区', '蒸湘', '1855', null, '中国,湖南省,衡阳市,蒸湘区', '3', '421001', '0734', '430408', 'Zhengxiang', '112.6033000', '26.8965100');
INSERT INTO `sys_cn_area` VALUES ('1860', '南岳区', '南岳', '1855', null, '中国,湖南省,衡阳市,南岳区', '3', '421900', '0734', '430412', 'Nanyue', '112.7384000', '27.2326200');
INSERT INTO `sys_cn_area` VALUES ('1861', '衡阳县', '衡阳', '1855', null, '中国,湖南省,衡阳市,衡阳县', '3', '421200', '0734', '430421', 'Hengyang', '112.3708800', '26.9706000');
INSERT INTO `sys_cn_area` VALUES ('1862', '衡南县', '衡南', '1855', null, '中国,湖南省,衡阳市,衡南县', '3', '421131', '0734', '430422', 'Hengnan', '112.6778800', '26.7382800');
INSERT INTO `sys_cn_area` VALUES ('1863', '衡山县', '衡山', '1855', null, '中国,湖南省,衡阳市,衡山县', '3', '421300', '0734', '430423', 'Hengshan', '112.8677600', '27.2313400');
INSERT INTO `sys_cn_area` VALUES ('1864', '衡东县', '衡东', '1855', null, '中国,湖南省,衡阳市,衡东县', '3', '421400', '0734', '430424', 'Hengdong', '112.9483300', '27.0809300');
INSERT INTO `sys_cn_area` VALUES ('1865', '祁东县', '祁东', '1855', null, '中国,湖南省,衡阳市,祁东县', '3', '421600', '0734', '430426', 'Qidong', '112.0903900', '26.7996400');
INSERT INTO `sys_cn_area` VALUES ('1866', '耒阳市', '耒阳', '1855', null, '中国,湖南省,衡阳市,耒阳市', '3', '421800', '0734', '430481', 'Leiyang', '112.8599800', '26.4213200');
INSERT INTO `sys_cn_area` VALUES ('1867', '常宁市', '常宁', '1855', null, '中国,湖南省,衡阳市,常宁市', '3', '421500', '0734', '430482', 'Changning', '112.4009000', '26.4069200');
INSERT INTO `sys_cn_area` VALUES ('1868', '邵阳市', '邵阳', '1828', null, '中国,湖南省,邵阳市', '2', '422000', '0739', '430500', 'Shaoyang', '111.4692300', '27.2378420');
INSERT INTO `sys_cn_area` VALUES ('1869', '双清区', '双清', '1868', null, '中国,湖南省,邵阳市,双清区', '3', '422001', '0739', '430502', 'Shuangqing', '111.4971500', '27.2329100');
INSERT INTO `sys_cn_area` VALUES ('1870', '大祥区', '大祥', '1868', null, '中国,湖南省,邵阳市,大祥区', '3', '422000', '0739', '430503', 'Daxiang', '111.4541200', '27.2333200');
INSERT INTO `sys_cn_area` VALUES ('1871', '北塔区', '北塔', '1868', null, '中国,湖南省,邵阳市,北塔区', '3', '422007', '0739', '430511', 'Beita', '111.4521900', '27.2464800');
INSERT INTO `sys_cn_area` VALUES ('1872', '邵东县', '邵东', '1868', null, '中国,湖南省,邵阳市,邵东县', '3', '422800', '0739', '430521', 'Shaodong', '111.7444100', '27.2584000');
INSERT INTO `sys_cn_area` VALUES ('1873', '新邵县', '新邵', '1868', null, '中国,湖南省,邵阳市,新邵县', '3', '422900', '0739', '430522', 'Xinshao', '111.4606600', '27.3216900');
INSERT INTO `sys_cn_area` VALUES ('1874', '邵阳县', '邵阳', '1868', null, '中国,湖南省,邵阳市,邵阳县', '3', '422100', '0739', '430523', 'Shaoyang', '111.2745900', '26.9914300');
INSERT INTO `sys_cn_area` VALUES ('1875', '隆回县', '隆回', '1868', null, '中国,湖南省,邵阳市,隆回县', '3', '422200', '0739', '430524', 'Longhui', '111.0321600', '27.1093700');
INSERT INTO `sys_cn_area` VALUES ('1876', '洞口县', '洞口', '1868', null, '中国,湖南省,邵阳市,洞口县', '3', '422300', '0739', '430525', 'Dongkou', '110.5738800', '27.0546200');
INSERT INTO `sys_cn_area` VALUES ('1877', '绥宁县', '绥宁', '1868', null, '中国,湖南省,邵阳市,绥宁县', '3', '422600', '0739', '430527', 'Suining', '110.1557600', '26.5863600');
INSERT INTO `sys_cn_area` VALUES ('1878', '新宁县', '新宁', '1868', null, '中国,湖南省,邵阳市,新宁县', '3', '422700', '0739', '430528', 'Xinning', '110.8513100', '26.4293600');
INSERT INTO `sys_cn_area` VALUES ('1879', '城步苗族自治县', '城步', '1868', null, '中国,湖南省,邵阳市,城步苗族自治县', '3', '422500', '0739', '430529', 'Chengbu', '110.3222000', '26.3904800');
INSERT INTO `sys_cn_area` VALUES ('1880', '武冈市', '武冈', '1868', null, '中国,湖南省,邵阳市,武冈市', '3', '422400', '0739', '430581', 'Wugang', '110.6328100', '26.7281700');
INSERT INTO `sys_cn_area` VALUES ('1881', '岳阳市', '岳阳', '1828', null, '中国,湖南省,岳阳市', '2', '414000', '0730', '430600', 'Yueyang', '113.1328550', '29.3702900');
INSERT INTO `sys_cn_area` VALUES ('1882', '岳阳楼区', '岳阳楼', '1881', null, '中国,湖南省,岳阳市,岳阳楼区', '3', '414000', '0730', '430602', 'Yueyanglou', '113.1294200', '29.3719000');
INSERT INTO `sys_cn_area` VALUES ('1883', '云溪区', '云溪', '1881', null, '中国,湖南省,岳阳市,云溪区', '3', '414009', '0730', '430603', 'Yunxi', '113.2771300', '29.4735700');
INSERT INTO `sys_cn_area` VALUES ('1884', '君山区', '君山', '1881', null, '中国,湖南省,岳阳市,君山区', '3', '414005', '0730', '430611', 'Junshan', '113.0043900', '29.4594100');
INSERT INTO `sys_cn_area` VALUES ('1885', '岳阳县', '岳阳', '1881', null, '中国,湖南省,岳阳市,岳阳县', '3', '414100', '0730', '430621', 'Yueyang', '113.1198700', '29.1431400');
INSERT INTO `sys_cn_area` VALUES ('1886', '华容县', '华容', '1881', null, '中国,湖南省,岳阳市,华容县', '3', '414200', '0730', '430623', 'Huarong', '112.5408900', '29.5301900');
INSERT INTO `sys_cn_area` VALUES ('1887', '湘阴县', '湘阴', '1881', null, '中国,湖南省,岳阳市,湘阴县', '3', '414600', '0730', '430624', 'Xiangyin', '112.9091100', '28.6892200');
INSERT INTO `sys_cn_area` VALUES ('1888', '平江县', '平江', '1881', null, '中国,湖南省,岳阳市,平江县', '3', '414500', '0730', '430626', 'Pingjiang', '113.5810500', '28.7066400');
INSERT INTO `sys_cn_area` VALUES ('1889', '汨罗市', '汨罗', '1881', null, '中国,湖南省,岳阳市,汨罗市', '3', '414400', '0730', '430681', 'Miluo', '113.0670700', '28.8063100');
INSERT INTO `sys_cn_area` VALUES ('1890', '临湘市', '临湘', '1881', null, '中国,湖南省,岳阳市,临湘市', '3', '414300', '0730', '430682', 'Linxiang', '113.4501000', '29.4770100');
INSERT INTO `sys_cn_area` VALUES ('1891', '常德市', '常德', '1828', null, '中国,湖南省,常德市', '2', '415000', '0736', '430700', 'Changde', '111.6913470', '29.0402250');
INSERT INTO `sys_cn_area` VALUES ('1892', '武陵区', '武陵', '1891', null, '中国,湖南省,常德市,武陵区', '3', '415000', '0736', '430702', 'Wuling', '111.6979100', '29.0287600');
INSERT INTO `sys_cn_area` VALUES ('1893', '鼎城区', '鼎城', '1891', null, '中国,湖南省,常德市,鼎城区', '3', '415101', '0736', '430703', 'Dingcheng', '111.6807800', '29.0185900');
INSERT INTO `sys_cn_area` VALUES ('1894', '安乡县', '安乡', '1891', null, '中国,湖南省,常德市,安乡县', '3', '415600', '0736', '430721', 'Anxiang', '112.1673200', '29.4132600');
INSERT INTO `sys_cn_area` VALUES ('1895', '汉寿县', '汉寿', '1891', null, '中国,湖南省,常德市,汉寿县', '3', '415900', '0736', '430722', 'Hanshou', '111.9669100', '28.9029900');
INSERT INTO `sys_cn_area` VALUES ('1896', '澧县', '澧县', '1891', null, '中国,湖南省,常德市,澧县', '3', '415500', '0736', '430723', 'Lixian', '111.7586600', '29.6331700');
INSERT INTO `sys_cn_area` VALUES ('1897', '临澧县', '临澧', '1891', null, '中国,湖南省,常德市,临澧县', '3', '415200', '0736', '430724', 'Linli', '111.6516100', '29.4416300');
INSERT INTO `sys_cn_area` VALUES ('1898', '桃源县', '桃源', '1891', null, '中国,湖南省,常德市,桃源县', '3', '415700', '0736', '430725', 'Taoyuan', '111.4889200', '28.9047400');
INSERT INTO `sys_cn_area` VALUES ('1899', '石门县', '石门', '1891', null, '中国,湖南省,常德市,石门县', '3', '415300', '0736', '430726', 'Shimen', '111.3796600', '29.5842400');
INSERT INTO `sys_cn_area` VALUES ('1900', '津市市', '津市', '1891', null, '中国,湖南省,常德市,津市市', '3', '415400', '0736', '430781', 'Jinshi', '111.8775600', '29.6056300');
INSERT INTO `sys_cn_area` VALUES ('1901', '张家界市', '张家界', '1828', null, '中国,湖南省,张家界市', '2', '427000', '0744', '430800', 'Zhangjiajie', '110.4799210', '29.1274010');
INSERT INTO `sys_cn_area` VALUES ('1902', '永定区', '永定', '1901', null, '中国,湖南省,张家界市,永定区', '3', '427000', '0744', '430802', 'Yongding', '110.4746400', '29.1338700');
INSERT INTO `sys_cn_area` VALUES ('1903', '武陵源区', '武陵源', '1901', null, '中国,湖南省,张家界市,武陵源区', '3', '427400', '0744', '430811', 'Wulingyuan', '110.5502600', '29.3457400');
INSERT INTO `sys_cn_area` VALUES ('1904', '慈利县', '慈利', '1901', null, '中国,湖南省,张家界市,慈利县', '3', '427200', '0744', '430821', 'Cili', '111.1394600', '29.4298900');
INSERT INTO `sys_cn_area` VALUES ('1905', '桑植县', '桑植', '1901', null, '中国,湖南省,张家界市,桑植县', '3', '427100', '0744', '430822', 'Sangzhi', '110.1630800', '29.3981500');
INSERT INTO `sys_cn_area` VALUES ('1906', '益阳市', '益阳', '1828', null, '中国,湖南省,益阳市', '2', '413000', '0737', '430900', 'Yiyang', '112.3550420', '28.5700660');
INSERT INTO `sys_cn_area` VALUES ('1907', '资阳区', '资阳', '1906', null, '中国,湖南省,益阳市,资阳区', '3', '413001', '0737', '430902', 'Ziyang', '112.3244700', '28.5909500');
INSERT INTO `sys_cn_area` VALUES ('1908', '赫山区', '赫山', '1906', null, '中国,湖南省,益阳市,赫山区', '3', '413002', '0737', '430903', 'Heshan', '112.3726500', '28.5742500');
INSERT INTO `sys_cn_area` VALUES ('1909', '南县', '南县', '1906', null, '中国,湖南省,益阳市,南县', '3', '413200', '0737', '430921', 'Nanxian', '112.3963000', '29.3615900');
INSERT INTO `sys_cn_area` VALUES ('1910', '桃江县', '桃江', '1906', null, '中国,湖南省,益阳市,桃江县', '3', '413400', '0737', '430922', 'Taojiang', '112.1557000', '28.5181400');
INSERT INTO `sys_cn_area` VALUES ('1911', '安化县', '安化', '1906', null, '中国,湖南省,益阳市,安化县', '3', '413500', '0737', '430923', 'Anhua', '111.2129800', '28.3742400');
INSERT INTO `sys_cn_area` VALUES ('1912', '沅江市', '沅江', '1906', null, '中国,湖南省,益阳市,沅江市', '3', '413100', '0737', '430981', 'Yuanjiang', '112.3542700', '28.8440300');
INSERT INTO `sys_cn_area` VALUES ('1913', '郴州市', '郴州', '1828', null, '中国,湖南省,郴州市', '2', '423000', '0735', '431000', 'Chenzhou', '113.0320670', '25.7935890');
INSERT INTO `sys_cn_area` VALUES ('1914', '北湖区', '北湖', '1913', null, '中国,湖南省,郴州市,北湖区', '3', '423000', '0735', '431002', 'Beihu', '113.0110300', '25.7840500');
INSERT INTO `sys_cn_area` VALUES ('1915', '苏仙区', '苏仙', '1913', null, '中国,湖南省,郴州市,苏仙区', '3', '423000', '0735', '431003', 'Suxian', '113.0422600', '25.8004500');
INSERT INTO `sys_cn_area` VALUES ('1916', '桂阳县', '桂阳', '1913', null, '中国,湖南省,郴州市,桂阳县', '3', '424400', '0735', '431021', 'Guiyang', '112.7336400', '25.7540600');
INSERT INTO `sys_cn_area` VALUES ('1917', '宜章县', '宜章', '1913', null, '中国,湖南省,郴州市,宜章县', '3', '424200', '0735', '431022', 'Yizhang', '112.9514700', '25.3993100');
INSERT INTO `sys_cn_area` VALUES ('1918', '永兴县', '永兴', '1913', null, '中国,湖南省,郴州市,永兴县', '3', '423300', '0735', '431023', 'Yongxing', '113.1124200', '26.1264600');
INSERT INTO `sys_cn_area` VALUES ('1919', '嘉禾县', '嘉禾', '1913', null, '中国,湖南省,郴州市,嘉禾县', '3', '424500', '0735', '431024', 'Jiahe', '112.3693500', '25.5879500');
INSERT INTO `sys_cn_area` VALUES ('1920', '临武县', '临武', '1913', null, '中国,湖南省,郴州市,临武县', '3', '424300', '0735', '431025', 'Linwu', '112.5636900', '25.2760200');
INSERT INTO `sys_cn_area` VALUES ('1921', '汝城县', '汝城', '1913', null, '中国,湖南省,郴州市,汝城县', '3', '424100', '0735', '431026', 'Rucheng', '113.6858200', '25.5520400');
INSERT INTO `sys_cn_area` VALUES ('1922', '桂东县', '桂东', '1913', null, '中国,湖南省,郴州市,桂东县', '3', '423500', '0735', '431027', 'Guidong', '113.9468000', '26.0798700');
INSERT INTO `sys_cn_area` VALUES ('1923', '安仁县', '安仁', '1913', null, '中国,湖南省,郴州市,安仁县', '3', '423600', '0735', '431028', 'Anren', '113.2694400', '26.7093100');
INSERT INTO `sys_cn_area` VALUES ('1924', '资兴市', '资兴', '1913', null, '中国,湖南省,郴州市,资兴市', '3', '423400', '0735', '431081', 'Zixing', '113.2372400', '25.9766800');
INSERT INTO `sys_cn_area` VALUES ('1925', '永州市', '永州', '1828', null, '中国,湖南省,永州市', '2', '425000', '0746', '431100', 'Yongzhou', '111.6080190', '26.4345160');
INSERT INTO `sys_cn_area` VALUES ('1926', '零陵区', '零陵', '1925', null, '中国,湖南省,永州市,零陵区', '3', '425100', '0746', '431102', 'Lingling', '111.6210300', '26.2210900');
INSERT INTO `sys_cn_area` VALUES ('1927', '冷水滩区', '冷水滩', '1925', null, '中国,湖南省,永州市,冷水滩区', '3', '425100', '0746', '431103', 'Lengshuitan', '111.5921400', '26.4610700');
INSERT INTO `sys_cn_area` VALUES ('1928', '祁阳县', '祁阳', '1925', null, '中国,湖南省,永州市,祁阳县', '3', '426100', '0746', '431121', 'Qiyang', '111.8401100', '26.5800900');
INSERT INTO `sys_cn_area` VALUES ('1929', '东安县', '东安', '1925', null, '中国,湖南省,永州市,东安县', '3', '425900', '0746', '431122', 'Dong\'an', '111.3164000', '26.3920200');
INSERT INTO `sys_cn_area` VALUES ('1930', '双牌县', '双牌', '1925', null, '中国,湖南省,永州市,双牌县', '3', '425200', '0746', '431123', 'Shuangpai', '111.6592700', '25.9598800');
INSERT INTO `sys_cn_area` VALUES ('1931', '道县', '道县', '1925', null, '中国,湖南省,永州市,道县', '3', '425300', '0746', '431124', 'Daoxian', '111.6019500', '25.5276600');
INSERT INTO `sys_cn_area` VALUES ('1932', '江永县', '江永', '1925', null, '中国,湖南省,永州市,江永县', '3', '425400', '0746', '431125', 'Jiangyong', '111.3408200', '25.2723300');
INSERT INTO `sys_cn_area` VALUES ('1933', '宁远县', '宁远', '1925', null, '中国,湖南省,永州市,宁远县', '3', '425600', '0746', '431126', 'Ningyuan', '111.9462500', '25.5691300');
INSERT INTO `sys_cn_area` VALUES ('1934', '蓝山县', '蓝山', '1925', null, '中国,湖南省,永州市,蓝山县', '3', '425800', '0746', '431127', 'Lanshan', '112.1936300', '25.3679400');
INSERT INTO `sys_cn_area` VALUES ('1935', '新田县', '新田', '1925', null, '中国,湖南省,永州市,新田县', '3', '425700', '0746', '431128', 'Xintian', '112.2210300', '25.9095000');
INSERT INTO `sys_cn_area` VALUES ('1936', '江华瑶族自治县', '江华', '1925', null, '中国,湖南省,永州市,江华瑶族自治县', '3', '425500', '0746', '431129', 'Jianghua', '111.5884700', '25.1845000');
INSERT INTO `sys_cn_area` VALUES ('1937', '怀化市', '怀化', '1828', null, '中国,湖南省,怀化市', '2', '418000', '0745', '431200', 'Huaihua', '109.9782400', '27.5500820');
INSERT INTO `sys_cn_area` VALUES ('1938', '鹤城区', '鹤城', '1937', null, '中国,湖南省,怀化市,鹤城区', '3', '418000', '0745', '431202', 'Hecheng', '109.9650900', '27.5494200');
INSERT INTO `sys_cn_area` VALUES ('1939', '中方县', '中方', '1937', null, '中国,湖南省,怀化市,中方县', '3', '418005', '0745', '431221', 'Zhongfang', '109.9449700', '27.4398800');
INSERT INTO `sys_cn_area` VALUES ('1940', '沅陵县', '沅陵', '1937', null, '中国,湖南省,怀化市,沅陵县', '3', '419600', '0745', '431222', 'Yuanling', '110.3963300', '28.4554800');
INSERT INTO `sys_cn_area` VALUES ('1941', '辰溪县', '辰溪', '1937', null, '中国,湖南省,怀化市,辰溪县', '3', '419500', '0745', '431223', 'Chenxi', '110.1894200', '28.0040600');
INSERT INTO `sys_cn_area` VALUES ('1942', '溆浦县', '溆浦', '1937', null, '中国,湖南省,怀化市,溆浦县', '3', '419300', '0745', '431224', 'Xupu', '110.5938400', '27.9083600');
INSERT INTO `sys_cn_area` VALUES ('1943', '会同县', '会同', '1937', null, '中国,湖南省,怀化市,会同县', '3', '418300', '0745', '431225', 'Huitong', '109.7356800', '26.8871600');
INSERT INTO `sys_cn_area` VALUES ('1944', '麻阳苗族自治县', '麻阳', '1937', null, '中国,湖南省,怀化市,麻阳苗族自治县', '3', '419400', '0745', '431226', 'Mayang', '109.8019400', '27.8660000');
INSERT INTO `sys_cn_area` VALUES ('1945', '新晃侗族自治县', '新晃', '1937', null, '中国,湖南省,怀化市,新晃侗族自治县', '3', '419200', '0745', '431227', 'Xinhuang', '109.1716600', '27.3593700');
INSERT INTO `sys_cn_area` VALUES ('1946', '芷江侗族自治县', '芷江', '1937', null, '中国,湖南省,怀化市,芷江侗族自治县', '3', '419100', '0745', '431228', 'Zhijiang', '109.6849000', '27.4429700');
INSERT INTO `sys_cn_area` VALUES ('1947', '靖州苗族侗族自治县', '靖州', '1937', null, '中国,湖南省,怀化市,靖州苗族侗族自治县', '3', '418400', '0745', '431229', 'Jingzhou', '109.6982100', '26.5765100');
INSERT INTO `sys_cn_area` VALUES ('1948', '通道侗族自治县', '通道', '1937', null, '中国,湖南省,怀化市,通道侗族自治县', '3', '418500', '0745', '431230', 'Tongdao', '109.7851500', '26.1571000');
INSERT INTO `sys_cn_area` VALUES ('1949', '洪江市', '洪江', '1937', null, '中国,湖南省,怀化市,洪江市', '3', '418100', '0745', '431281', 'Hongjiang', '109.8365100', '27.2092200');
INSERT INTO `sys_cn_area` VALUES ('1950', '娄底市', '娄底', '1828', null, '中国,湖南省,娄底市', '2', '417000', '0738', '431300', 'Loudi', '112.0084970', '27.7281360');
INSERT INTO `sys_cn_area` VALUES ('1951', '娄星区', '娄星', '1950', null, '中国,湖南省,娄底市,娄星区', '3', '417000', '0738', '431302', 'Louxing', '112.0019300', '27.7299200');
INSERT INTO `sys_cn_area` VALUES ('1952', '双峰县', '双峰', '1950', null, '中国,湖南省,娄底市,双峰县', '3', '417700', '0738', '431321', 'Shuangfeng', '112.1992100', '27.4541800');
INSERT INTO `sys_cn_area` VALUES ('1953', '新化县', '新化', '1950', null, '中国,湖南省,娄底市,新化县', '3', '417600', '0738', '431322', 'Xinhua', '111.3273900', '27.7266000');
INSERT INTO `sys_cn_area` VALUES ('1954', '冷水江市', '冷水江', '1950', null, '中国,湖南省,娄底市,冷水江市', '3', '417500', '0738', '431381', 'Lengshuijiang', '111.4355400', '27.6814700');
INSERT INTO `sys_cn_area` VALUES ('1955', '涟源市', '涟源', '1950', null, '中国,湖南省,娄底市,涟源市', '3', '417100', '0738', '431382', 'Lianyuan', '111.6723300', '27.6883100');
INSERT INTO `sys_cn_area` VALUES ('1956', '湘西土家族苗族自治州', '湘西', '1828', null, '中国,湖南省,湘西土家族苗族自治州', '2', '416000', '0743', '433100', 'Xiangxi', '109.7397350', '28.3142960');
INSERT INTO `sys_cn_area` VALUES ('1957', '吉首市', '吉首', '1956', null, '中国,湖南省,湘西土家族苗族自治州,吉首市', '3', '416000', '0743', '433101', 'Jishou', '109.6979900', '28.2624700');
INSERT INTO `sys_cn_area` VALUES ('1958', '泸溪县', '泸溪', '1956', null, '中国,湖南省,湘西土家族苗族自治州,泸溪县', '3', '416100', '0743', '433122', 'Luxi', '110.2168200', '28.2205000');
INSERT INTO `sys_cn_area` VALUES ('1959', '凤凰县', '凤凰', '1956', null, '中国,湖南省,湘西土家族苗族自治州,凤凰县', '3', '416200', '0743', '433123', 'Fenghuang', '109.6015600', '27.9482200');
INSERT INTO `sys_cn_area` VALUES ('1960', '花垣县', '花垣', '1956', null, '中国,湖南省,湘西土家族苗族自治州,花垣县', '3', '416400', '0743', '433124', 'Huayuan', '109.4821700', '28.5721000');
INSERT INTO `sys_cn_area` VALUES ('1961', '保靖县', '保靖', '1956', null, '中国,湖南省,湘西土家族苗族自治州,保靖县', '3', '416500', '0743', '433125', 'Baojing', '109.6604900', '28.6999700');
INSERT INTO `sys_cn_area` VALUES ('1962', '古丈县', '古丈', '1956', null, '中国,湖南省,湘西土家族苗族自治州,古丈县', '3', '416300', '0743', '433126', 'Guzhang', '109.9481200', '28.6194400');
INSERT INTO `sys_cn_area` VALUES ('1963', '永顺县', '永顺', '1956', null, '中国,湖南省,湘西土家族苗族自治州,永顺县', '3', '416700', '0743', '433127', 'Yongshun', '109.8526600', '29.0010300');
INSERT INTO `sys_cn_area` VALUES ('1964', '龙山县', '龙山', '1956', null, '中国,湖南省,湘西土家族苗族自治州,龙山县', '3', '416800', '0743', '433130', 'Longshan', '109.4432000', '29.4569300');
INSERT INTO `sys_cn_area` VALUES ('1965', '广东省', '广东', '1', null, '中国,广东省', '1', null, '', '440000', 'Guangdong', '113.2806370', '23.1251780');
INSERT INTO `sys_cn_area` VALUES ('1966', '广州市', '广州', '1965', null, '中国,广东省,广州市', '2', '510032', '020', '440100', 'Guangzhou', '113.2806370', '23.1251780');
INSERT INTO `sys_cn_area` VALUES ('1967', '荔湾区', '荔湾', '1966', null, '中国,广东省,广州市,荔湾区', '3', '510170', '020', '440103', 'Liwan', '113.2442000', '23.1259200');
INSERT INTO `sys_cn_area` VALUES ('1968', '越秀区', '越秀', '1966', null, '中国,广东省,广州市,越秀区', '3', '510030', '020', '440104', 'Yuexiu', '113.2668300', '23.1289700');
INSERT INTO `sys_cn_area` VALUES ('1969', '海珠区', '海珠', '1966', null, '中国,广东省,广州市,海珠区', '3', '510300', '020', '440105', 'Haizhu', '113.2619700', '23.1037900');
INSERT INTO `sys_cn_area` VALUES ('1970', '天河区', '天河', '1966', null, '中国,广东省,广州市,天河区', '3', '510665', '020', '440106', 'Tianhe', '113.3611200', '23.1246700');
INSERT INTO `sys_cn_area` VALUES ('1971', '白云区', '白云', '1966', null, '中国,广东省,广州市,白云区', '3', '510405', '020', '440111', 'Baiyun', '113.2730700', '23.1578700');
INSERT INTO `sys_cn_area` VALUES ('1972', '黄埔区', '黄埔', '1966', null, '中国,广东省,广州市,黄埔区', '3', '510700', '020', '440112', 'Huangpu', '113.4589500', '23.1064200');
INSERT INTO `sys_cn_area` VALUES ('1973', '番禺区', '番禺', '1966', null, '中国,广东省,广州市,番禺区', '3', '511400', '020', '440113', 'Panyu', '113.3839700', '22.9359900');
INSERT INTO `sys_cn_area` VALUES ('1974', '花都区', '花都', '1966', null, '中国,广东省,广州市,花都区', '3', '510800', '020', '440114', 'Huadu', '113.2203300', '23.4035800');
INSERT INTO `sys_cn_area` VALUES ('1975', '南沙区', '南沙', '1966', null, '中国,广东省,广州市,南沙区', '3', '511458', '020', '440115', 'Nansha', '113.6084500', '22.7714400');
INSERT INTO `sys_cn_area` VALUES ('1976', '从化区', '从化', '1966', null, '中国,广东省,广州市,从化区', '3', '510900', '020', '440117', 'Conghua', '113.5873860', '23.5452830');
INSERT INTO `sys_cn_area` VALUES ('1977', '增城区', '增城', '1966', null, '中国,广东省,广州市,增城区', '3', '511300', '020', '440118', 'Zengcheng', '113.8295790', '23.2904970');
INSERT INTO `sys_cn_area` VALUES ('1978', '韶关市', '韶关', '1965', null, '中国,广东省,韶关市', '2', '512002', '0751', '440200', 'Shaoguan', '113.5915440', '24.8013220');
INSERT INTO `sys_cn_area` VALUES ('1979', '武江区', '武江', '1978', null, '中国,广东省,韶关市,武江区', '3', '512026', '0751', '440203', 'Wujiang', '113.5876700', '24.7926400');
INSERT INTO `sys_cn_area` VALUES ('1980', '浈江区', '浈江', '1978', null, '中国,广东省,韶关市,浈江区', '3', '512023', '0751', '440204', 'Zhenjiang', '113.6110900', '24.8043800');
INSERT INTO `sys_cn_area` VALUES ('1981', '曲江区', '曲江', '1978', null, '中国,广东省,韶关市,曲江区', '3', '512101', '0751', '440205', 'Qujiang', '113.6016500', '24.6791500');
INSERT INTO `sys_cn_area` VALUES ('1982', '始兴县', '始兴', '1978', null, '中国,广东省,韶关市,始兴县', '3', '512500', '0751', '440222', 'Shixing', '114.0679900', '24.9475900');
INSERT INTO `sys_cn_area` VALUES ('1983', '仁化县', '仁化', '1978', null, '中国,广东省,韶关市,仁化县', '3', '512300', '0751', '440224', 'Renhua', '113.7473700', '25.0874200');
INSERT INTO `sys_cn_area` VALUES ('1984', '翁源县', '翁源', '1978', null, '中国,广东省,韶关市,翁源县', '3', '512600', '0751', '440229', 'Wengyuan', '114.1338500', '24.3495000');
INSERT INTO `sys_cn_area` VALUES ('1985', '乳源瑶族自治县', '乳源', '1978', null, '中国,广东省,韶关市,乳源瑶族自治县', '3', '512700', '0751', '440232', 'Ruyuan', '113.2773400', '24.7780300');
INSERT INTO `sys_cn_area` VALUES ('1986', '新丰县', '新丰', '1978', null, '中国,广东省,韶关市,新丰县', '3', '511100', '0751', '440233', 'Xinfeng', '114.2078800', '24.0592400');
INSERT INTO `sys_cn_area` VALUES ('1987', '乐昌市', '乐昌', '1978', null, '中国,广东省,韶关市,乐昌市', '3', '512200', '0751', '440281', 'Lechang', '113.3565300', '25.1279900');
INSERT INTO `sys_cn_area` VALUES ('1988', '南雄市', '南雄', '1978', null, '中国,广东省,韶关市,南雄市', '3', '512400', '0751', '440282', 'Nanxiong', '114.3096600', '25.1170600');
INSERT INTO `sys_cn_area` VALUES ('1989', '深圳市', '深圳', '1965', null, '中国,广东省,深圳市', '2', '518035', '0755', '440300', 'Shenzhen', '114.0859470', '22.5470000');
INSERT INTO `sys_cn_area` VALUES ('1990', '罗湖区', '罗湖', '1989', null, '中国,广东省,深圳市,罗湖区', '3', '518021', '0755', '440303', 'Luohu', '114.1311600', '22.5483600');
INSERT INTO `sys_cn_area` VALUES ('1991', '福田区', '福田', '1989', null, '中国,广东省,深圳市,福田区', '3', '518048', '0755', '440304', 'Futian', '114.0557100', '22.5224500');
INSERT INTO `sys_cn_area` VALUES ('1992', '南山区', '南山', '1989', null, '中国,广东省,深圳市,南山区', '3', '518051', '0755', '440305', 'Nanshan', '113.9302900', '22.5329100');
INSERT INTO `sys_cn_area` VALUES ('1993', '宝安区', '宝安', '1989', null, '中国,广东省,深圳市,宝安区', '3', '518101', '0755', '440306', 'Bao\'an', '113.8831100', '22.5537100');
INSERT INTO `sys_cn_area` VALUES ('1994', '龙岗区', '龙岗', '1989', null, '中国,广东省,深圳市,龙岗区', '3', '518172', '0755', '440307', 'Longgang', '114.2477100', '22.7198600');
INSERT INTO `sys_cn_area` VALUES ('1995', '盐田区', '盐田', '1989', null, '中国,广东省,深圳市,盐田区', '3', '518081', '0755', '440308', 'Yantian', '114.2373300', '22.5578000');
INSERT INTO `sys_cn_area` VALUES ('1996', '光明新区', '光明新区', '1989', null, '中国,广东省,深圳市,光明新区', '3', '518100', '0755', '440309', 'Guangmingxinqu', '113.8960260', '22.7772920');
INSERT INTO `sys_cn_area` VALUES ('1997', '坪山新区', '坪山新区', '1989', null, '中国,广东省,深圳市,坪山新区', '3', '518000', '0755', '440310', 'Pingshanxinqu', '114.3463700', '22.6905290');
INSERT INTO `sys_cn_area` VALUES ('1998', '大鹏新区', '大鹏新区', '1989', null, '中国,广东省,深圳市,大鹏新区', '3', '518000', '0755', '440311', 'Dapengxinqu', '114.4799010', '22.5878620');
INSERT INTO `sys_cn_area` VALUES ('1999', '龙华新区', '龙华新区', '1989', null, '中国,广东省,深圳市,龙华新区', '3', '518100', '0755', '440312', 'Longhuaxinqu', '114.0365850', '22.6869500');
INSERT INTO `sys_cn_area` VALUES ('2000', '珠海市', '珠海', '1965', null, '中国,广东省,珠海市', '2', '519000', '0756', '440400', 'Zhuhai', '113.5527240', '22.2558990');
INSERT INTO `sys_cn_area` VALUES ('2001', '香洲区', '香洲', '2000', null, '中国,广东省,珠海市,香洲区', '3', '519000', '0756', '440402', 'Xiangzhou', '113.5435000', '22.2665400');
INSERT INTO `sys_cn_area` VALUES ('2002', '斗门区', '斗门', '2000', null, '中国,广东省,珠海市,斗门区', '3', '519110', '0756', '440403', 'Doumen', '113.2964400', '22.2089800');
INSERT INTO `sys_cn_area` VALUES ('2003', '金湾区', '金湾', '2000', null, '中国,广东省,珠海市,金湾区', '3', '519040', '0756', '440404', 'Jinwan', '113.3636100', '22.1469100');
INSERT INTO `sys_cn_area` VALUES ('2004', '汕头市', '汕头', '1965', null, '中国,广东省,汕头市', '2', '515041', '0754', '440500', 'Shantou', '116.7084630', '23.3710200');
INSERT INTO `sys_cn_area` VALUES ('2005', '龙湖区', '龙湖', '2004', null, '中国,广东省,汕头市,龙湖区', '3', '515041', '0754', '440507', 'Longhu', '116.7164100', '23.3716600');
INSERT INTO `sys_cn_area` VALUES ('2006', '金平区', '金平', '2004', null, '中国,广东省,汕头市,金平区', '3', '515041', '0754', '440511', 'Jinping', '116.7036400', '23.3663700');
INSERT INTO `sys_cn_area` VALUES ('2007', '濠江区', '濠江', '2004', null, '中国,广东省,汕头市,濠江区', '3', '515071', '0754', '440512', 'Haojiang', '116.7265900', '23.2858800');
INSERT INTO `sys_cn_area` VALUES ('2008', '潮阳区', '潮阳', '2004', null, '中国,广东省,汕头市,潮阳区', '3', '515100', '0754', '440513', 'Chaoyang', '116.6015000', '23.2648500');
INSERT INTO `sys_cn_area` VALUES ('2009', '潮南区', '潮南', '2004', null, '中国,广东省,汕头市,潮南区', '3', '515144', '0754', '440514', 'Chaonan', '116.4318800', '23.2500000');
INSERT INTO `sys_cn_area` VALUES ('2010', '澄海区', '澄海', '2004', null, '中国,广东省,汕头市,澄海区', '3', '515800', '0754', '440515', 'Chenghai', '116.7558900', '23.4672800');
INSERT INTO `sys_cn_area` VALUES ('2011', '南澳县', '南澳', '2004', null, '中国,广东省,汕头市,南澳县', '3', '515900', '0754', '440523', 'Nanao', '117.0188900', '23.4223000');
INSERT INTO `sys_cn_area` VALUES ('2012', '佛山市', '佛山', '1965', null, '中国,广东省,佛山市', '2', '528000', '0757', '440600', 'Foshan', '113.1227170', '23.0287620');
INSERT INTO `sys_cn_area` VALUES ('2013', '禅城区', '禅城', '2012', null, '中国,广东省,佛山市,禅城区', '3', '528000', '0757', '440604', 'Chancheng', '113.1228000', '23.0084200');
INSERT INTO `sys_cn_area` VALUES ('2014', '南海区', '南海', '2012', null, '中国,广东省,佛山市,南海区', '3', '528251', '0757', '440605', 'Nanhai', '113.1429900', '23.0287700');
INSERT INTO `sys_cn_area` VALUES ('2015', '顺德区', '顺德', '2012', null, '中国,广东省,佛山市,顺德区', '3', '528300', '0757', '440606', 'Shunde', '113.2939400', '22.8045200');
INSERT INTO `sys_cn_area` VALUES ('2016', '三水区', '三水', '2012', null, '中国,广东省,佛山市,三水区', '3', '528133', '0757', '440607', 'Sanshui', '112.8970300', '23.1556400');
INSERT INTO `sys_cn_area` VALUES ('2017', '高明区', '高明', '2012', null, '中国,广东省,佛山市,高明区', '3', '528500', '0757', '440608', 'Gaoming', '112.8925400', '22.9002200');
INSERT INTO `sys_cn_area` VALUES ('2018', '江门市', '江门', '1965', null, '中国,广东省,江门市', '2', '529000', '0750', '440700', 'Jiangmen', '113.0949420', '22.5904310');
INSERT INTO `sys_cn_area` VALUES ('2019', '蓬江区', '蓬江', '2018', null, '中国,广东省,江门市,蓬江区', '3', '529000', '0750', '440703', 'Pengjiang', '113.0784900', '22.5951500');
INSERT INTO `sys_cn_area` VALUES ('2020', '江海区', '江海', '2018', null, '中国,广东省,江门市,江海区', '3', '529040', '0750', '440704', 'Jianghai', '113.1109900', '22.5602400');
INSERT INTO `sys_cn_area` VALUES ('2021', '新会区', '新会', '2018', null, '中国,广东省,江门市,新会区', '3', '529100', '0750', '440705', 'Xinhui', '113.0322500', '22.4587600');
INSERT INTO `sys_cn_area` VALUES ('2022', '台山市', '台山', '2018', null, '中国,广东省,江门市,台山市', '3', '529200', '0750', '440781', 'Taishan', '112.7938200', '22.2515000');
INSERT INTO `sys_cn_area` VALUES ('2023', '开平市', '开平', '2018', null, '中国,广东省,江门市,开平市', '3', '529337', '0750', '440783', 'Kaiping', '112.6984200', '22.3762200');
INSERT INTO `sys_cn_area` VALUES ('2024', '鹤山市', '鹤山', '2018', null, '中国,广东省,江门市,鹤山市', '3', '529700', '0750', '440784', 'Heshan', '112.9642900', '22.7652300');
INSERT INTO `sys_cn_area` VALUES ('2025', '恩平市', '恩平', '2018', null, '中国,广东省,江门市,恩平市', '3', '529400', '0750', '440785', 'Enping', '112.3049600', '22.1828800');
INSERT INTO `sys_cn_area` VALUES ('2026', '湛江市', '湛江', '1965', null, '中国,广东省,湛江市', '2', '524047', '0759', '440800', 'Zhanjiang', '110.4055290', '21.1953380');
INSERT INTO `sys_cn_area` VALUES ('2027', '赤坎区', '赤坎', '2026', null, '中国,广东省,湛江市,赤坎区', '3', '524033', '0759', '440802', 'Chikan', '110.3659200', '21.2660600');
INSERT INTO `sys_cn_area` VALUES ('2028', '霞山区', '霞山', '2026', null, '中国,广东省,湛江市,霞山区', '3', '524011', '0759', '440803', 'Xiashan', '110.3982200', '21.1918100');
INSERT INTO `sys_cn_area` VALUES ('2029', '坡头区', '坡头', '2026', null, '中国,广东省,湛江市,坡头区', '3', '524057', '0759', '440804', 'Potou', '110.4553300', '21.2447200');
INSERT INTO `sys_cn_area` VALUES ('2030', '麻章区', '麻章', '2026', null, '中国,广东省,湛江市,麻章区', '3', '524094', '0759', '440811', 'Mazhang', '110.3342000', '21.2633300');
INSERT INTO `sys_cn_area` VALUES ('2031', '遂溪县', '遂溪', '2026', null, '中国,广东省,湛江市,遂溪县', '3', '524300', '0759', '440823', 'Suixi', '110.2500300', '21.3772100');
INSERT INTO `sys_cn_area` VALUES ('2032', '徐闻县', '徐闻', '2026', null, '中国,广东省,湛江市,徐闻县', '3', '524100', '0759', '440825', 'Xuwen', '110.1737900', '20.3281200');
INSERT INTO `sys_cn_area` VALUES ('2033', '廉江市', '廉江', '2026', null, '中国,广东省,湛江市,廉江市', '3', '524400', '0759', '440881', 'Lianjiang', '110.2844200', '21.6091700');
INSERT INTO `sys_cn_area` VALUES ('2034', '雷州市', '雷州', '2026', null, '中国,广东省,湛江市,雷州市', '3', '524200', '0759', '440882', 'Leizhou', '110.1009200', '20.9142800');
INSERT INTO `sys_cn_area` VALUES ('2035', '吴川市', '吴川', '2026', null, '中国,广东省,湛江市,吴川市', '3', '524500', '0759', '440883', 'Wuchuan', '110.7770300', '21.4458400');
INSERT INTO `sys_cn_area` VALUES ('2036', '茂名市', '茂名', '1965', null, '中国,广东省,茂名市', '2', '525000', '0668', '440900', 'Maoming', '110.9192290', '21.6597510');
INSERT INTO `sys_cn_area` VALUES ('2037', '茂南区', '茂南', '2036', null, '中国,广东省,茂名市,茂南区', '3', '525000', '0668', '440902', 'Maonan', '110.9187000', '21.6410300');
INSERT INTO `sys_cn_area` VALUES ('2038', '电白区', '电白', '2036', null, '中国,广东省,茂名市,电白区', '3', '525400', '0668', '440904', 'Dianbai', '111.0072640', '21.5072190');
INSERT INTO `sys_cn_area` VALUES ('2039', '高州市', '高州', '2036', null, '中国,广东省,茂名市,高州市', '3', '525200', '0668', '440981', 'Gaozhou', '110.8551900', '21.9205700');
INSERT INTO `sys_cn_area` VALUES ('2040', '化州市', '化州', '2036', null, '中国,广东省,茂名市,化州市', '3', '525100', '0668', '440982', 'Huazhou', '110.6394900', '21.6639400');
INSERT INTO `sys_cn_area` VALUES ('2041', '信宜市', '信宜', '2036', null, '中国,广东省,茂名市,信宜市', '3', '525300', '0668', '440983', 'Xinyi', '110.9464700', '22.3535100');
INSERT INTO `sys_cn_area` VALUES ('2042', '肇庆市', '肇庆', '1965', null, '中国,广东省,肇庆市', '2', '526040', '0758', '441200', 'Zhaoqing', '112.4725290', '23.0515460');
INSERT INTO `sys_cn_area` VALUES ('2043', '端州区', '端州', '2042', null, '中国,广东省,肇庆市,端州区', '3', '526060', '0758', '441202', 'Duanzhou', '112.4849500', '23.0519000');
INSERT INTO `sys_cn_area` VALUES ('2044', '鼎湖区', '鼎湖', '2042', null, '中国,广东省,肇庆市,鼎湖区', '3', '526070', '0758', '441203', 'Dinghu', '112.5664300', '23.1584600');
INSERT INTO `sys_cn_area` VALUES ('2045', '广宁县', '广宁', '2042', null, '中国,广东省,肇庆市,广宁县', '3', '526300', '0758', '441223', 'Guangning', '112.4406400', '23.6346000');
INSERT INTO `sys_cn_area` VALUES ('2046', '怀集县', '怀集', '2042', null, '中国,广东省,肇庆市,怀集县', '3', '526400', '0758', '441224', 'Huaiji', '112.1839600', '23.9091800');
INSERT INTO `sys_cn_area` VALUES ('2047', '封开县', '封开', '2042', null, '中国,广东省,肇庆市,封开县', '3', '526500', '0758', '441225', 'Fengkai', '111.5033200', '23.4357100');
INSERT INTO `sys_cn_area` VALUES ('2048', '德庆县', '德庆', '2042', null, '中国,广东省,肇庆市,德庆县', '3', '526600', '0758', '441226', 'Deqing', '111.7855500', '23.1437100');
INSERT INTO `sys_cn_area` VALUES ('2049', '高要市', '高要', '2042', null, '中国,广东省,肇庆市,高要市', '3', '526100', '0758', '441283', 'Gaoyao', '112.4583400', '23.0257700');
INSERT INTO `sys_cn_area` VALUES ('2050', '四会市', '四会', '2042', null, '中国,广东省,肇庆市,四会市', '3', '526200', '0758', '441284', 'Sihui', '112.7341600', '23.3268600');
INSERT INTO `sys_cn_area` VALUES ('2051', '惠州市', '惠州', '1965', null, '中国,广东省,惠州市', '2', '516000', '0752', '441300', 'Huizhou', '114.4125990', '23.0794040');
INSERT INTO `sys_cn_area` VALUES ('2052', '惠城区', '惠城', '2051', null, '中国,广东省,惠州市,惠城区', '3', '516008', '0752', '441302', 'Huicheng', '114.3828000', '23.0837700');
INSERT INTO `sys_cn_area` VALUES ('2053', '惠阳区', '惠阳', '2051', null, '中国,广东省,惠州市,惠阳区', '3', '516211', '0752', '441303', 'Huiyang', '114.4563900', '22.7884500');
INSERT INTO `sys_cn_area` VALUES ('2054', '博罗县', '博罗', '2051', null, '中国,广东省,惠州市,博罗县', '3', '516100', '0752', '441322', 'Boluo', '114.2896400', '23.1730700');
INSERT INTO `sys_cn_area` VALUES ('2055', '惠东县', '惠东', '2051', null, '中国,广东省,惠州市,惠东县', '3', '516300', '0752', '441323', 'Huidong', '114.7200900', '22.9848400');
INSERT INTO `sys_cn_area` VALUES ('2056', '龙门县', '龙门', '2051', null, '中国,广东省,惠州市,龙门县', '3', '516800', '0752', '441324', 'Longmen', '114.2547900', '23.7275800');
INSERT INTO `sys_cn_area` VALUES ('2057', '梅州市', '梅州', '1965', null, '中国,广东省,梅州市', '2', '514021', '0753', '441400', 'Meizhou', '116.1175820', '24.2991120');
INSERT INTO `sys_cn_area` VALUES ('2058', '梅江区', '梅江', '2057', null, '中国,广东省,梅州市,梅江区', '3', '514000', '0753', '441402', 'Meijiang', '116.1166300', '24.3106200');
INSERT INTO `sys_cn_area` VALUES ('2059', '梅县区', '梅县', '2057', null, '中国,广东省,梅州市,梅县区', '3', '514787', '0753', '441403', 'Meixian', '116.0977530', '24.2867390');
INSERT INTO `sys_cn_area` VALUES ('2060', '大埔县', '大埔', '2057', null, '中国,广东省,梅州市,大埔县', '3', '514200', '0753', '441422', 'Dabu', '116.6966200', '24.3532500');
INSERT INTO `sys_cn_area` VALUES ('2061', '丰顺县', '丰顺', '2057', null, '中国,广东省,梅州市,丰顺县', '3', '514300', '0753', '441423', 'Fengshun', '116.1821900', '23.7409400');
INSERT INTO `sys_cn_area` VALUES ('2062', '五华县', '五华', '2057', null, '中国,广东省,梅州市,五华县', '3', '514400', '0753', '441424', 'Wuhua', '115.7789300', '23.9241700');
INSERT INTO `sys_cn_area` VALUES ('2063', '平远县', '平远', '2057', null, '中国,广东省,梅州市,平远县', '3', '514600', '0753', '441426', 'Pingyuan', '115.8955600', '24.5711600');
INSERT INTO `sys_cn_area` VALUES ('2064', '蕉岭县', '蕉岭', '2057', null, '中国,广东省,梅州市,蕉岭县', '3', '514100', '0753', '441427', 'Jiaoling', '116.1708900', '24.6573200');
INSERT INTO `sys_cn_area` VALUES ('2065', '兴宁市', '兴宁', '2057', null, '中国,广东省,梅州市,兴宁市', '3', '514500', '0753', '441481', 'Xingning', '115.7314100', '24.1400100');
INSERT INTO `sys_cn_area` VALUES ('2066', '汕尾市', '汕尾', '1965', null, '中国,广东省,汕尾市', '2', '516600', '0660', '441500', 'Shanwei', '115.3642380', '22.7744850');
INSERT INTO `sys_cn_area` VALUES ('2067', '城区', '城区', '2066', null, '中国,广东省,汕尾市,城区', '3', '516600', '0660', '441502', 'Chengqu', '115.3650300', '22.7789000');
INSERT INTO `sys_cn_area` VALUES ('2068', '海丰县', '海丰', '2066', null, '中国,广东省,汕尾市,海丰县', '3', '516400', '0660', '441521', 'Haifeng', '115.3233600', '22.9665300');
INSERT INTO `sys_cn_area` VALUES ('2069', '陆河县', '陆河', '2066', null, '中国,广东省,汕尾市,陆河县', '3', '516700', '0660', '441523', 'Luhe', '115.6559700', '23.3036500');
INSERT INTO `sys_cn_area` VALUES ('2070', '陆丰市', '陆丰', '2066', null, '中国,广东省,汕尾市,陆丰市', '3', '516500', '0660', '441581', 'Lufeng', '115.6481300', '22.9433500');
INSERT INTO `sys_cn_area` VALUES ('2071', '河源市', '河源', '1965', null, '中国,广东省,河源市', '2', '517000', '0762', '441600', 'Heyuan', '114.6978020', '23.7462660');
INSERT INTO `sys_cn_area` VALUES ('2072', '源城区', '源城', '2071', null, '中国,广东省,河源市,源城区', '3', '517000', '0762', '441602', 'Yuancheng', '114.7024200', '23.7341000');
INSERT INTO `sys_cn_area` VALUES ('2073', '紫金县', '紫金', '2071', null, '中国,广东省,河源市,紫金县', '3', '517400', '0762', '441621', 'Zijin', '115.1836500', '23.6386700');
INSERT INTO `sys_cn_area` VALUES ('2074', '龙川县', '龙川', '2071', null, '中国,广东省,河源市,龙川县', '3', '517300', '0762', '441622', 'Longchuan', '115.2602500', '24.1014200');
INSERT INTO `sys_cn_area` VALUES ('2075', '连平县', '连平', '2071', null, '中国,广东省,河源市,连平县', '3', '517100', '0762', '441623', 'Lianping', '114.4902600', '24.3715600');
INSERT INTO `sys_cn_area` VALUES ('2076', '和平县', '和平', '2071', null, '中国,广东省,河源市,和平县', '3', '517200', '0762', '441624', 'Heping', '114.9384100', '24.4431900');
INSERT INTO `sys_cn_area` VALUES ('2077', '东源县', '东源', '2071', null, '中国,广东省,河源市,东源县', '3', '517583', '0762', '441625', 'Dongyuan', '114.7463300', '23.7883500');
INSERT INTO `sys_cn_area` VALUES ('2078', '阳江市', '阳江', '1965', null, '中国,广东省,阳江市', '2', '529500', '0662', '441700', 'Yangjiang', '111.9751070', '21.8592220');
INSERT INTO `sys_cn_area` VALUES ('2079', '江城区', '江城', '2078', null, '中国,广东省,阳江市,江城区', '3', '529500', '0662', '441702', 'Jiangcheng', '111.9548800', '21.8619300');
INSERT INTO `sys_cn_area` VALUES ('2080', '阳东区', '阳东', '2078', null, '中国,广东省,阳江市,阳东区', '3', '529900', '0662', '441704', 'Yangdong', '112.0146700', '21.8739800');
INSERT INTO `sys_cn_area` VALUES ('2081', '阳西县', '阳西', '2078', null, '中国,广东省,阳江市,阳西县', '3', '529800', '0662', '441721', 'Yangxi', '111.6178500', '21.7523400');
INSERT INTO `sys_cn_area` VALUES ('2082', '阳春市', '阳春', '2078', null, '中国,广东省,阳江市,阳春市', '3', '529600', '0662', '441781', 'Yangchun', '111.7885400', '22.1723200');
INSERT INTO `sys_cn_area` VALUES ('2083', '清远市', '清远', '1965', null, '中国,广东省,清远市', '2', '511500', '0763', '441800', 'Qingyuan', '113.0367790', '23.7041880');
INSERT INTO `sys_cn_area` VALUES ('2084', '清城区', '清城', '2083', null, '中国,广东省,清远市,清城区', '3', '511515', '0763', '441802', 'Qingcheng', '113.0626500', '23.6978400');
INSERT INTO `sys_cn_area` VALUES ('2085', '清新区', '清新', '2083', null, '中国,广东省,清远市,清新区', '3', '511810', '0763', '441803', 'Qingxin', '113.0152030', '23.7369490');
INSERT INTO `sys_cn_area` VALUES ('2086', '佛冈县', '佛冈', '2083', null, '中国,广东省,清远市,佛冈县', '3', '511600', '0763', '441821', 'Fogang', '113.5328600', '23.8723100');
INSERT INTO `sys_cn_area` VALUES ('2087', '阳山县', '阳山', '2083', null, '中国,广东省,清远市,阳山县', '3', '513100', '0763', '441823', 'Yangshan', '112.6412900', '24.4651600');
INSERT INTO `sys_cn_area` VALUES ('2088', '连山壮族瑶族自治县', '连山', '2083', null, '中国,广东省,清远市,连山壮族瑶族自治县', '3', '513200', '0763', '441825', 'Lianshan', '112.0802000', '24.5680700');
INSERT INTO `sys_cn_area` VALUES ('2089', '连南瑶族自治县', '连南', '2083', null, '中国,广东省,清远市,连南瑶族自治县', '3', '513300', '0763', '441826', 'Liannan', '112.2884200', '24.7172600');
INSERT INTO `sys_cn_area` VALUES ('2090', '英德市', '英德', '2083', null, '中国,广东省,清远市,英德市', '3', '513000', '0763', '441881', 'Yingde', '113.4150000', '24.1857100');
INSERT INTO `sys_cn_area` VALUES ('2091', '连州市', '连州', '2083', null, '中国,广东省,清远市,连州市', '3', '513400', '0763', '441882', 'Lianzhou', '112.3815300', '24.7791300');
INSERT INTO `sys_cn_area` VALUES ('2092', '东莞市', '东莞', '1965', null, '中国,广东省,东莞市', '2', '523888', '0769', '441900', 'Dongguan', '113.7602340', '23.0488840');
INSERT INTO `sys_cn_area` VALUES ('2093', '莞城区', '莞城', '2092', null, '中国,广东省,东莞市,莞城区', '3', '523128', '0769', '441901', 'Guancheng', '113.7510430', '23.0534120');
INSERT INTO `sys_cn_area` VALUES ('2094', '南城区', '南城', '2092', null, '中国,广东省,东莞市,南城区', '3', '523617', '0769', '441902', 'Nancheng', '113.7521250', '23.0201800');
INSERT INTO `sys_cn_area` VALUES ('2095', '万江区', '万江', '2092', null, '中国,广东省,东莞市,万江区', '3', '523039', '0769', '441904', 'Wanjiang', '113.7390530', '23.0438420');
INSERT INTO `sys_cn_area` VALUES ('2096', '石碣镇', '石碣', '2092', null, '中国,广东省,东莞市,石碣镇', '3', '523290', '0769', '441905', 'Shijie', '113.8021700', '23.0989900');
INSERT INTO `sys_cn_area` VALUES ('2097', '石龙镇', '石龙', '2092', null, '中国,广东省,东莞市,石龙镇', '3', '523326', '0769', '441906', 'Shilong', '113.8763810', '23.1074440');
INSERT INTO `sys_cn_area` VALUES ('2098', '茶山镇', '茶山', '2092', null, '中国,广东省,东莞市,茶山镇', '3', '523380', '0769', '441907', 'Chashan', '113.8835260', '23.0623750');
INSERT INTO `sys_cn_area` VALUES ('2099', '石排镇', '石排', '2092', null, '中国,广东省,东莞市,石排镇', '3', '523346', '0769', '441908', 'Shipai', '113.9198590', '23.0863000');
INSERT INTO `sys_cn_area` VALUES ('2100', '企石镇', '企石', '2092', null, '中国,广东省,东莞市,企石镇', '3', '523507', '0769', '441909', 'Qishi', '114.0132330', '23.0660440');
INSERT INTO `sys_cn_area` VALUES ('2101', '横沥镇', '横沥', '2092', null, '中国,广东省,东莞市,横沥镇', '3', '523471', '0769', '441910', 'Hengli', '113.9574360', '23.0257320');
INSERT INTO `sys_cn_area` VALUES ('2102', '桥头镇', '桥头', '2092', null, '中国,广东省,东莞市,桥头镇', '3', '523520', '0769', '441911', 'Qiaotou', '114.0138500', '22.9397270');
INSERT INTO `sys_cn_area` VALUES ('2103', '谢岗镇', '谢岗', '2092', null, '中国,广东省,东莞市,谢岗镇', '3', '523592', '0769', '441912', 'Xiegang', '114.1413960', '22.9596640');
INSERT INTO `sys_cn_area` VALUES ('2104', '东坑镇', '东坑', '2092', null, '中国,广东省,东莞市,东坑镇', '3', '523451', '0769', '441913', 'Dongkeng', '113.9398350', '22.9928040');
INSERT INTO `sys_cn_area` VALUES ('2105', '常平镇', '常平', '2092', null, '中国,广东省,东莞市,常平镇', '3', '523560', '0769', '441914', 'Changping', '114.0296270', '23.0161160');
INSERT INTO `sys_cn_area` VALUES ('2106', '寮步镇', '寮步', '2092', null, '中国,广东省,东莞市,寮步镇', '3', '523411', '0769', '441915', 'Liaobu', '113.8847450', '22.9917380');
INSERT INTO `sys_cn_area` VALUES ('2107', '大朗镇', '大朗', '2092', null, '中国,广东省,东莞市,大朗镇', '3', '523770', '0769', '441916', 'Dalang', '113.9271000', '22.9657480');
INSERT INTO `sys_cn_area` VALUES ('2108', '麻涌镇', '麻涌', '2092', null, '中国,广东省,东莞市,麻涌镇', '3', '523143', '0769', '441917', 'Machong', '113.5461770', '23.0453150');
INSERT INTO `sys_cn_area` VALUES ('2109', '中堂镇', '中堂', '2092', null, '中国,广东省,东莞市,中堂镇', '3', '523233', '0769', '441918', 'Zhongtang', '113.6544220', '23.0901640');
INSERT INTO `sys_cn_area` VALUES ('2110', '高埗镇', '高埗', '2092', null, '中国,广东省,东莞市,高埗镇', '3', '523282', '0769', '441919', 'Gaobu', '113.7359170', '23.0684150');
INSERT INTO `sys_cn_area` VALUES ('2111', '樟木头镇', '樟木头', '2092', null, '中国,广东省,东莞市,樟木头镇', '3', '523619', '0769', '441920', 'Zhangmutou', '114.0662980', '22.9566820');
INSERT INTO `sys_cn_area` VALUES ('2112', '大岭山镇', '大岭山', '2092', null, '中国,广东省,东莞市,大岭山镇', '3', '523835', '0769', '441921', 'Dalingshan', '113.7829550', '22.8853660');
INSERT INTO `sys_cn_area` VALUES ('2113', '望牛墩镇', '望牛墩', '2092', null, '中国,广东省,东莞市,望牛墩镇', '3', '523203', '0769', '441922', 'Wangniudun', '113.6588470', '23.0550180');
INSERT INTO `sys_cn_area` VALUES ('2114', '黄江镇', '黄江', '2092', null, '中国,广东省,东莞市,黄江镇', '3', '523755', '0769', '441923', 'Huangjiang', '113.9926350', '22.8775360');
INSERT INTO `sys_cn_area` VALUES ('2115', '洪梅镇', '洪梅', '2092', null, '中国,广东省,东莞市,洪梅镇', '3', '523163', '0769', '441924', 'Hongmei', '113.6130810', '22.9926750');
INSERT INTO `sys_cn_area` VALUES ('2116', '清溪镇', '清溪', '2092', null, '中国,广东省,东莞市,清溪镇', '3', '523660', '0769', '441925', 'Qingxi', '114.1557960', '22.8444560');
INSERT INTO `sys_cn_area` VALUES ('2117', '沙田镇', '沙田', '2092', null, '中国,广东省,东莞市,沙田镇', '3', '523988', '0769', '441926', 'Shatian', '113.7602340', '23.0488840');
INSERT INTO `sys_cn_area` VALUES ('2118', '道滘镇', '道滘', '2092', null, '中国,广东省,东莞市,道滘镇', '3', '523171', '0769', '441927', 'Daojiao', '113.7602340', '23.0488840');
INSERT INTO `sys_cn_area` VALUES ('2119', '塘厦镇', '塘厦', '2092', null, '中国,广东省,东莞市,塘厦镇', '3', '523713', '0769', '441928', 'Tangxia', '114.1076500', '22.8228620');
INSERT INTO `sys_cn_area` VALUES ('2120', '虎门镇', '虎门', '2092', null, '中国,广东省,东莞市,虎门镇', '3', '523932', '0769', '441929', 'Humen', '113.7111800', '22.8261500');
INSERT INTO `sys_cn_area` VALUES ('2121', '厚街镇', '厚街', '2092', null, '中国,广东省,东莞市,厚街镇', '3', '523960', '0769', '441930', 'Houjie', '113.6730100', '22.9408150');
INSERT INTO `sys_cn_area` VALUES ('2122', '凤岗镇', '凤岗', '2092', null, '中国,广东省,东莞市,凤岗镇', '3', '523690', '0769', '441931', 'Fenggang', '114.1411940', '22.7445980');
INSERT INTO `sys_cn_area` VALUES ('2123', '长安镇', '长安', '2092', null, '中国,广东省,东莞市,长安镇', '3', '523850', '0769', '441932', 'Chang\'an', '113.8039390', '22.8166440');
INSERT INTO `sys_cn_area` VALUES ('2124', '中山市', '中山', '1965', null, '中国,广东省,中山市', '2', '528403', '0760', '442000', 'Zhongshan', '113.3823910', '22.5211130');
INSERT INTO `sys_cn_area` VALUES ('2125', '石岐区', '石岐', '2124', null, '中国,广东省,中山市,石岐区', '3', '528400', '0760', '442001', 'Shiqi', '113.3788350', '22.5252200');
INSERT INTO `sys_cn_area` VALUES ('2126', '南区', '南区', '2124', null, '中国,广东省,中山市,南区', '3', '528400', '0760', '442004', 'Nanqu', '113.3558960', '22.4865680');
INSERT INTO `sys_cn_area` VALUES ('2127', '五桂山区', '五桂山', '2124', null, '中国,广东省,中山市,五桂山区', '3', '528458', '0760', '442005', 'Wuguishan', '113.4107900', '22.5196800');
INSERT INTO `sys_cn_area` VALUES ('2128', '火炬开发区', '火炬', '2124', null, '中国,广东省,中山市,火炬开发区', '3', '528437', '0760', '442006', 'Huoju', '113.4805230', '22.5660820');
INSERT INTO `sys_cn_area` VALUES ('2129', '黄圃镇', '黄圃', '2124', null, '中国,广东省,中山市,黄圃镇', '3', '528429', '0760', '442007', 'Huangpu', '113.3423590', '22.7151160');
INSERT INTO `sys_cn_area` VALUES ('2130', '南头镇', '南头', '2124', null, '中国,广东省,中山市,南头镇', '3', '528421', '0760', '442008', 'Nantou', '113.2963580', '22.7139070');
INSERT INTO `sys_cn_area` VALUES ('2131', '东凤镇', '东凤', '2124', null, '中国,广东省,中山市,东凤镇', '3', '528425', '0760', '442009', 'Dongfeng', '113.2611400', '22.6877500');
INSERT INTO `sys_cn_area` VALUES ('2132', '阜沙镇', '阜沙', '2124', null, '中国,广东省,中山市,阜沙镇', '3', '528434', '0760', '442010', 'Fusha', '113.3530240', '22.6663640');
INSERT INTO `sys_cn_area` VALUES ('2133', '小榄镇', '小榄', '2124', null, '中国,广东省,中山市,小榄镇', '3', '528415', '0760', '442011', 'Xiaolan', '113.2442350', '22.6669510');
INSERT INTO `sys_cn_area` VALUES ('2134', '东升镇', '东升', '2124', null, '中国,广东省,中山市,东升镇', '3', '528400', '0760', '442012', 'Dongsheng', '113.2962980', '22.6140030');
INSERT INTO `sys_cn_area` VALUES ('2135', '古镇镇', '古镇', '2124', null, '中国,广东省,中山市,古镇镇', '3', '528422', '0760', '442013', 'Guzhen', '113.1797450', '22.6110190');
INSERT INTO `sys_cn_area` VALUES ('2136', '横栏镇', '横栏', '2124', null, '中国,广东省,中山市,横栏镇', '3', '528478', '0760', '442014', 'Henglan', '113.2658450', '22.5232020');
INSERT INTO `sys_cn_area` VALUES ('2137', '三角镇', '三角', '2124', null, '中国,广东省,中山市,三角镇', '3', '528422', '0760', '442015', 'Sanjiao', '113.4236240', '22.6770330');
INSERT INTO `sys_cn_area` VALUES ('2138', '民众镇', '民众', '2124', null, '中国,广东省,中山市,民众镇', '3', '528441', '0760', '442016', 'Minzhong', '113.4860250', '22.6234680');
INSERT INTO `sys_cn_area` VALUES ('2139', '南朗镇', '南朗', '2124', null, '中国,广东省,中山市,南朗镇', '3', '528454', '0760', '442017', 'Nanlang', '113.5339390', '22.4923780');
INSERT INTO `sys_cn_area` VALUES ('2140', '港口镇', '港口', '2124', null, '中国,广东省,中山市,港口镇', '3', '528447', '0760', '442018', 'Gangkou', '113.3823910', '22.5211130');
INSERT INTO `sys_cn_area` VALUES ('2141', '大涌镇', '大涌', '2124', null, '中国,广东省,中山市,大涌镇', '3', '528476', '0760', '442019', 'Dayong', '113.2917080', '22.4677120');
INSERT INTO `sys_cn_area` VALUES ('2142', '沙溪镇', '沙溪', '2124', null, '中国,广东省,中山市,沙溪镇', '3', '528471', '0760', '442020', 'Shaxi', '113.3283690', '22.5263250');
INSERT INTO `sys_cn_area` VALUES ('2143', '三乡镇', '三乡', '2124', null, '中国,广东省,中山市,三乡镇', '3', '528463', '0760', '442021', 'Sanxiang', '113.4334000', '22.3524940');
INSERT INTO `sys_cn_area` VALUES ('2144', '板芙镇', '板芙', '2124', null, '中国,广东省,中山市,板芙镇', '3', '528459', '0760', '442022', 'Banfu', '113.3203460', '22.4156740');
INSERT INTO `sys_cn_area` VALUES ('2145', '神湾镇', '神湾', '2124', null, '中国,广东省,中山市,神湾镇', '3', '528462', '0760', '442023', 'Shenwan', '113.3593870', '22.3124760');
INSERT INTO `sys_cn_area` VALUES ('2146', '坦洲镇', '坦洲', '2124', null, '中国,广东省,中山市,坦洲镇', '3', '528467', '0760', '442024', 'Tanzhou', '113.4856770', '22.2612690');
INSERT INTO `sys_cn_area` VALUES ('2147', '潮州市', '潮州', '1965', null, '中国,广东省,潮州市', '2', '521000', '0768', '445100', 'Chaozhou', '116.6323010', '23.6617010');
INSERT INTO `sys_cn_area` VALUES ('2148', '湘桥区', '湘桥', '2147', null, '中国,广东省,潮州市,湘桥区', '3', '521000', '0768', '445102', 'Xiangqiao', '116.6280500', '23.6745100');
INSERT INTO `sys_cn_area` VALUES ('2149', '潮安区', '潮安', '2147', null, '中国,广东省,潮州市,潮安区', '3', '515638', '0768', '445103', 'Chao\'an', '116.5928950', '23.6436560');
INSERT INTO `sys_cn_area` VALUES ('2150', '饶平县', '饶平', '2147', null, '中国,广东省,潮州市,饶平县', '3', '515700', '0768', '445122', 'Raoping', '117.0069200', '23.6699400');
INSERT INTO `sys_cn_area` VALUES ('2151', '揭阳市', '揭阳', '1965', null, '中国,广东省,揭阳市', '2', '522000', '0633', '445200', 'Jieyang', '116.3557330', '23.5437780');
INSERT INTO `sys_cn_area` VALUES ('2152', '榕城区', '榕城', '2151', null, '中国,广东省,揭阳市,榕城区', '3', '522000', '0633', '445202', 'Rongcheng', '116.3671000', '23.5250800');
INSERT INTO `sys_cn_area` VALUES ('2153', '揭东区', '揭东', '2151', null, '中国,广东省,揭阳市,揭东区', '3', '515500', '0633', '445203', 'Jiedong', '116.4129470', '23.5698870');
INSERT INTO `sys_cn_area` VALUES ('2154', '揭西县', '揭西', '2151', null, '中国,广东省,揭阳市,揭西县', '3', '515400', '0633', '445222', 'Jiexi', '115.8388300', '23.4271400');
INSERT INTO `sys_cn_area` VALUES ('2155', '惠来县', '惠来', '2151', null, '中国,广东省,揭阳市,惠来县', '3', '515200', '0633', '445224', 'Huilai', '116.2959900', '23.0328900');
INSERT INTO `sys_cn_area` VALUES ('2156', '普宁市', '普宁', '2151', null, '中国,广东省,揭阳市,普宁市', '3', '515300', '0633', '445281', 'Puning', '116.1656400', '23.2973200');
INSERT INTO `sys_cn_area` VALUES ('2157', '云浮市', '云浮', '1965', null, '中国,广东省,云浮市', '2', '527300', '0766', '445300', 'Yunfu', '112.0444390', '22.9298010');
INSERT INTO `sys_cn_area` VALUES ('2158', '云城区', '云城', '2157', null, '中国,广东省,云浮市,云城区', '3', '527300', '0766', '445302', 'Yuncheng', '112.0390800', '22.9299600');
INSERT INTO `sys_cn_area` VALUES ('2159', '云安区', '云安', '2157', null, '中国,广东省,云浮市,云安区', '3', '527500', '0766', '445303', 'Yun\'an', '112.0093600', '23.0777900');
INSERT INTO `sys_cn_area` VALUES ('2160', '新兴县', '新兴', '2157', null, '中国,广东省,云浮市,新兴县', '3', '527400', '0766', '445321', 'Xinxing', '112.2301900', '22.6973400');
INSERT INTO `sys_cn_area` VALUES ('2161', '郁南县', '郁南', '2157', null, '中国,广东省,云浮市,郁南县', '3', '527100', '0766', '445322', 'Yunan', '111.5338700', '23.2330700');
INSERT INTO `sys_cn_area` VALUES ('2162', '罗定市', '罗定', '2157', null, '中国,广东省,云浮市,罗定市', '3', '527200', '0766', '445381', 'Luoding', '111.5697900', '22.7696700');
INSERT INTO `sys_cn_area` VALUES ('2163', '广西壮族自治区', '广西', '1', null, '中国,广西壮族自治区', '1', null, '', '450000', 'Guangxi', '108.3200040', '22.8240200');
INSERT INTO `sys_cn_area` VALUES ('2164', '南宁市', '南宁', '2163', null, '中国,广西壮族自治区,南宁市', '2', '530028', '0771', '450100', 'Nanning', '108.3200040', '22.8240200');
INSERT INTO `sys_cn_area` VALUES ('2165', '兴宁区', '兴宁', '2164', null, '中国,广西壮族自治区,南宁市,兴宁区', '3', '530023', '0771', '450102', 'Xingning', '108.3669400', '22.8535500');
INSERT INTO `sys_cn_area` VALUES ('2166', '青秀区', '青秀', '2164', null, '中国,广西壮族自治区,南宁市,青秀区', '3', '530213', '0771', '450103', 'Qingxiu', '108.4954500', '22.7851100');
INSERT INTO `sys_cn_area` VALUES ('2167', '江南区', '江南', '2164', null, '中国,广西壮族自治区,南宁市,江南区', '3', '530031', '0771', '450105', 'Jiangnan', '108.2732500', '22.7812700');
INSERT INTO `sys_cn_area` VALUES ('2168', '西乡塘区', '西乡塘', '2164', null, '中国,广西壮族自治区,南宁市,西乡塘区', '3', '530001', '0771', '450107', 'Xixiangtang', '108.3134700', '22.8338600');
INSERT INTO `sys_cn_area` VALUES ('2169', '良庆区', '良庆', '2164', null, '中国,广西壮族自治区,南宁市,良庆区', '3', '530219', '0771', '450108', 'Liangqing', '108.4128400', '22.7491400');
INSERT INTO `sys_cn_area` VALUES ('2170', '邕宁区', '邕宁', '2164', null, '中国,广西壮族自治区,南宁市,邕宁区', '3', '530200', '0771', '450109', 'Yongning', '108.4868400', '22.7562800');
INSERT INTO `sys_cn_area` VALUES ('2171', '武鸣县', '武鸣', '2164', null, '中国,广西壮族自治区,南宁市,武鸣县', '3', '530100', '0771', '450122', 'Wuming', '108.2771900', '23.1564300');
INSERT INTO `sys_cn_area` VALUES ('2172', '隆安县', '隆安', '2164', null, '中国,广西壮族自治区,南宁市,隆安县', '3', '532700', '0771', '450123', 'Long\'an', '107.6919200', '23.1733600');
INSERT INTO `sys_cn_area` VALUES ('2173', '马山县', '马山', '2164', null, '中国,广西壮族自治区,南宁市,马山县', '3', '530600', '0771', '450124', 'Mashan', '108.1769700', '23.7093100');
INSERT INTO `sys_cn_area` VALUES ('2174', '上林县', '上林', '2164', null, '中国,广西壮族自治区,南宁市,上林县', '3', '530500', '0771', '450125', 'Shanglin', '108.6052200', '23.4320000');
INSERT INTO `sys_cn_area` VALUES ('2175', '宾阳县', '宾阳', '2164', null, '中国,广西壮族自治区,南宁市,宾阳县', '3', '530400', '0771', '450126', 'Binyang', '108.8118500', '23.2196000');
INSERT INTO `sys_cn_area` VALUES ('2176', '横县', '横县', '2164', null, '中国,广西壮族自治区,南宁市,横县', '3', '530300', '0771', '450127', 'Hengxian', '109.2660800', '22.6844800');
INSERT INTO `sys_cn_area` VALUES ('2177', '埌东新区', '埌东', '2164', null, '中国,广西壮族自治区,南宁市,埌东新区', '3', '530000', '0771', '450128', 'Langdong', '108.4190940', '22.8129760');
INSERT INTO `sys_cn_area` VALUES ('2178', '柳州市', '柳州', '2163', null, '中国,广西壮族自治区,柳州市', '2', '545001', '0772', '450200', 'Liuzhou', '109.4117030', '24.3146170');
INSERT INTO `sys_cn_area` VALUES ('2179', '城中区', '城中', '2178', null, '中国,广西壮族自治区,柳州市,城中区', '3', '545001', '0772', '450202', 'Chengzhong', '109.4108200', '24.3154300');
INSERT INTO `sys_cn_area` VALUES ('2180', '鱼峰区', '鱼峰', '2178', null, '中国,广西壮族自治区,柳州市,鱼峰区', '3', '545005', '0772', '450203', 'Yufeng', '109.4533000', '24.3186800');
INSERT INTO `sys_cn_area` VALUES ('2181', '柳南区', '柳南', '2178', null, '中国,广西壮族自治区,柳州市,柳南区', '3', '545007', '0772', '450204', 'Liunan', '109.3854800', '24.3359900');
INSERT INTO `sys_cn_area` VALUES ('2182', '柳北区', '柳北', '2178', null, '中国,广西壮族自治区,柳州市,柳北区', '3', '545002', '0772', '450205', 'Liubei', '109.4020200', '24.3626700');
INSERT INTO `sys_cn_area` VALUES ('2183', '柳江县', '柳江', '2178', null, '中国,广西壮族自治区,柳州市,柳江县', '3', '545100', '0772', '450221', 'Liujiang', '109.3327300', '24.2559600');
INSERT INTO `sys_cn_area` VALUES ('2184', '柳城县', '柳城', '2178', null, '中国,广西壮族自治区,柳州市,柳城县', '3', '545200', '0772', '450222', 'Liucheng', '109.2387700', '24.6495100');
INSERT INTO `sys_cn_area` VALUES ('2185', '鹿寨县', '鹿寨', '2178', null, '中国,广西壮族自治区,柳州市,鹿寨县', '3', '545600', '0772', '450223', 'Luzhai', '109.7517700', '24.4730600');
INSERT INTO `sys_cn_area` VALUES ('2186', '融安县', '融安', '2178', null, '中国,广西壮族自治区,柳州市,融安县', '3', '545400', '0772', '450224', 'Rong\'an', '109.3976100', '25.2246500');
INSERT INTO `sys_cn_area` VALUES ('2187', '融水苗族自治县', '融水', '2178', null, '中国,广西壮族自治区,柳州市,融水苗族自治县', '3', '545300', '0772', '450225', 'Rongshui', '109.2563400', '25.0662800');
INSERT INTO `sys_cn_area` VALUES ('2188', '三江侗族自治县', '三江', '2178', null, '中国,广西壮族自治区,柳州市,三江侗族自治县', '3', '545500', '0772', '450226', 'Sanjiang', '109.6044600', '25.7842800');
INSERT INTO `sys_cn_area` VALUES ('2189', '柳东新区', '柳东', '2178', null, '中国,广西壮族自治区,柳州市,柳东新区', '3', '545000', '0772', '450227', 'Liudong', '109.4370530', '24.3292040');
INSERT INTO `sys_cn_area` VALUES ('2190', '桂林市', '桂林', '2163', null, '中国,广西壮族自治区,桂林市', '2', '541100', '0773', '450300', 'Guilin', '110.2991210', '25.2742150');
INSERT INTO `sys_cn_area` VALUES ('2191', '秀峰区', '秀峰', '2190', null, '中国,广西壮族自治区,桂林市,秀峰区', '3', '541001', '0773', '450302', 'Xiufeng', '110.2891500', '25.2824900');
INSERT INTO `sys_cn_area` VALUES ('2192', '叠彩区', '叠彩', '2190', null, '中国,广西壮族自治区,桂林市,叠彩区', '3', '541001', '0773', '450303', 'Diecai', '110.3019500', '25.3138100');
INSERT INTO `sys_cn_area` VALUES ('2193', '象山区', '象山', '2190', null, '中国,广西壮族自治区,桂林市,象山区', '3', '541002', '0773', '450304', 'Xiangshan', '110.2810800', '25.2616800');
INSERT INTO `sys_cn_area` VALUES ('2194', '七星区', '七星', '2190', null, '中国,广西壮族自治区,桂林市,七星区', '3', '541004', '0773', '450305', 'Qixing', '110.3179300', '25.2525000');
INSERT INTO `sys_cn_area` VALUES ('2195', '雁山区', '雁山', '2190', null, '中国,广西壮族自治区,桂林市,雁山区', '3', '541006', '0773', '450311', 'Yanshan', '110.3091100', '25.0603800');
INSERT INTO `sys_cn_area` VALUES ('2196', '临桂区', '临桂', '2190', null, '中国,广西壮族自治区,桂林市,临桂区', '3', '541100', '0773', '450312', 'Lingui', '110.2054870', '25.2462570');
INSERT INTO `sys_cn_area` VALUES ('2197', '阳朔县', '阳朔', '2190', null, '中国,广西壮族自治区,桂林市,阳朔县', '3', '541900', '0773', '450321', 'Yangshuo', '110.4947500', '24.7757900');
INSERT INTO `sys_cn_area` VALUES ('2198', '灵川县', '灵川', '2190', null, '中国,广西壮族自治区,桂林市,灵川县', '3', '541200', '0773', '450323', 'Lingchuan', '110.3294900', '25.4129200');
INSERT INTO `sys_cn_area` VALUES ('2199', '全州县', '全州', '2190', null, '中国,广西壮族自治区,桂林市,全州县', '3', '541503', '0773', '450324', 'Quanzhou', '111.0721100', '25.9279900');
INSERT INTO `sys_cn_area` VALUES ('2200', '兴安县', '兴安', '2190', null, '中国,广西壮族自治区,桂林市,兴安县', '3', '541300', '0773', '450325', 'Xing\'an', '110.6714400', '25.6116700');
INSERT INTO `sys_cn_area` VALUES ('2201', '永福县', '永福', '2190', null, '中国,广西壮族自治区,桂林市,永福县', '3', '541800', '0773', '450326', 'Yongfu', '109.9833300', '24.9800400');
INSERT INTO `sys_cn_area` VALUES ('2202', '灌阳县', '灌阳', '2190', null, '中国,广西壮族自治区,桂林市,灌阳县', '3', '541600', '0773', '450327', 'Guanyang', '111.1595400', '25.4880300');
INSERT INTO `sys_cn_area` VALUES ('2203', '龙胜各族自治县', '龙胜', '2190', null, '中国,广西壮族自治区,桂林市,龙胜各族自治县', '3', '541700', '0773', '450328', 'Longsheng', '110.0122600', '25.7961400');
INSERT INTO `sys_cn_area` VALUES ('2204', '资源县', '资源', '2190', null, '中国,广西壮族自治区,桂林市,资源县', '3', '541400', '0773', '450329', 'Ziyuan', '110.6525500', '26.0423700');
INSERT INTO `sys_cn_area` VALUES ('2205', '平乐县', '平乐', '2190', null, '中国,广西壮族自治区,桂林市,平乐县', '3', '542400', '0773', '450330', 'Pingle', '110.6417500', '24.6324200');
INSERT INTO `sys_cn_area` VALUES ('2206', '荔浦县', '荔浦', '2190', null, '中国,广西壮族自治区,桂林市,荔浦县', '3', '546600', '0773', '450331', 'Lipu', '110.3971000', '24.4958900');
INSERT INTO `sys_cn_area` VALUES ('2207', '恭城瑶族自治县', '恭城', '2190', null, '中国,广西壮族自治区,桂林市,恭城瑶族自治县', '3', '542500', '0773', '450332', 'Gongcheng', '110.8303500', '24.8328600');
INSERT INTO `sys_cn_area` VALUES ('2208', '梧州市', '梧州', '2163', null, '中国,广西壮族自治区,梧州市', '2', '543002', '0774', '450400', 'Wuzhou', '111.3162290', '23.4723090');
INSERT INTO `sys_cn_area` VALUES ('2209', '万秀区', '万秀', '2208', null, '中国,广西壮族自治区,梧州市,万秀区', '3', '543000', '0774', '450403', 'Wanxiu', '111.3205200', '23.4729800');
INSERT INTO `sys_cn_area` VALUES ('2210', '长洲区', '长洲', '2208', null, '中国,广西壮族自治区,梧州市,长洲区', '3', '543003', '0774', '450405', 'Changzhou', '111.2749400', '23.4857300');
INSERT INTO `sys_cn_area` VALUES ('2211', '龙圩区', '龙圩', '2208', null, '中国,广西壮族自治区,梧州市,龙圩区', '3', '543002', '0774', '450406', 'Longxu', '111.3162290', '23.4723090');
INSERT INTO `sys_cn_area` VALUES ('2212', '苍梧县', '苍梧', '2208', null, '中国,广西壮族自治区,梧州市,苍梧县', '3', '543100', '0774', '450421', 'Cangwu', '111.2453300', '23.4204900');
INSERT INTO `sys_cn_area` VALUES ('2213', '藤县', '藤县', '2208', null, '中国,广西壮族自治区,梧州市,藤县', '3', '543300', '0774', '450422', 'Tengxian', '110.9141800', '23.3760500');
INSERT INTO `sys_cn_area` VALUES ('2214', '蒙山县', '蒙山', '2208', null, '中国,广西壮族自治区,梧州市,蒙山县', '3', '546700', '0774', '450423', 'Mengshan', '110.5222100', '24.2016800');
INSERT INTO `sys_cn_area` VALUES ('2215', '岑溪市', '岑溪', '2208', null, '中国,广西壮族自治区,梧州市,岑溪市', '3', '543200', '0774', '450481', 'Cenxi', '110.9959400', '22.9191000');
INSERT INTO `sys_cn_area` VALUES ('2216', '北海市', '北海', '2163', null, '中国,广西壮族自治区,北海市', '2', '536000', '0779', '450500', 'Beihai', '109.1192540', '21.4733430');
INSERT INTO `sys_cn_area` VALUES ('2217', '海城区', '海城', '2216', null, '中国,广西壮族自治区,北海市,海城区', '3', '536000', '0779', '450502', 'Haicheng', '109.1174400', '21.4750100');
INSERT INTO `sys_cn_area` VALUES ('2218', '银海区', '银海', '2216', null, '中国,广西壮族自治区,北海市,银海区', '3', '536000', '0779', '450503', 'Yinhai', '109.1302900', '21.4783000');
INSERT INTO `sys_cn_area` VALUES ('2219', '铁山港区', '铁山港', '2216', null, '中国,广西壮族自治区,北海市,铁山港区', '3', '536017', '0779', '450512', 'Tieshangang', '109.4557800', '21.5966100');
INSERT INTO `sys_cn_area` VALUES ('2220', '合浦县', '合浦', '2216', null, '中国,广西壮族自治区,北海市,合浦县', '3', '536100', '0779', '450521', 'Hepu', '109.2006800', '21.6660100');
INSERT INTO `sys_cn_area` VALUES ('2221', '防城港市', '防城港', '2163', null, '中国,广西壮族自治区,防城港市', '2', '538001', '0770', '450600', 'Fangchenggang', '108.3454780', '21.6146310');
INSERT INTO `sys_cn_area` VALUES ('2222', '港口区', '港口', '2221', null, '中国,广西壮族自治区,防城港市,港口区', '3', '538001', '0770', '450602', 'Gangkou', '108.3802200', '21.6434200');
INSERT INTO `sys_cn_area` VALUES ('2223', '防城区', '防城', '2221', null, '中国,广西壮族自治区,防城港市,防城区', '3', '538021', '0770', '450603', 'Fangcheng', '108.3572600', '21.7646400');
INSERT INTO `sys_cn_area` VALUES ('2224', '上思县', '上思', '2221', null, '中国,广西壮族自治区,防城港市,上思县', '3', '535500', '0770', '450621', 'Shangsi', '107.9823000', '22.1495700');
INSERT INTO `sys_cn_area` VALUES ('2225', '东兴市', '东兴', '2221', null, '中国,广西壮族自治区,防城港市,东兴市', '3', '538100', '0770', '450681', 'Dongxing', '107.9720400', '21.5471300');
INSERT INTO `sys_cn_area` VALUES ('2226', '钦州市', '钦州', '2163', null, '中国,广西壮族自治区,钦州市', '2', '535099', '0777', '450700', 'Qinzhou', '108.6241750', '21.9671270');
INSERT INTO `sys_cn_area` VALUES ('2227', '钦南区', '钦南', '2226', null, '中国,广西壮族自治区,钦州市,钦南区', '3', '535099', '0777', '450702', 'Qinnan', '108.6177500', '21.9513700');
INSERT INTO `sys_cn_area` VALUES ('2228', '钦北区', '钦北', '2226', null, '中国,广西壮族自治区,钦州市,钦北区', '3', '535099', '0777', '450703', 'Qinbei', '108.6303700', '21.9512700');
INSERT INTO `sys_cn_area` VALUES ('2229', '灵山县', '灵山', '2226', null, '中国,广西壮族自治区,钦州市,灵山县', '3', '535099', '0777', '450721', 'Lingshan', '109.2915300', '22.4165000');
INSERT INTO `sys_cn_area` VALUES ('2230', '浦北县', '浦北', '2226', null, '中国,广西壮族自治区,钦州市,浦北县', '3', '535099', '0777', '450722', 'Pubei', '109.5557200', '22.2688800');
INSERT INTO `sys_cn_area` VALUES ('2231', '贵港市', '贵港', '2163', null, '中国,广西壮族自治区,贵港市', '2', '537100', '0775', '450800', 'Guigang', '109.6021460', '23.0936000');
INSERT INTO `sys_cn_area` VALUES ('2232', '港北区', '港北', '2231', null, '中国,广西壮族自治区,贵港市,港北区', '3', '537100', '0775', '450802', 'Gangbei', '109.5722400', '23.1115300');
INSERT INTO `sys_cn_area` VALUES ('2233', '港南区', '港南', '2231', null, '中国,广西壮族自治区,贵港市,港南区', '3', '537100', '0775', '450803', 'Gangnan', '109.6061700', '23.0722600');
INSERT INTO `sys_cn_area` VALUES ('2234', '覃塘区', '覃塘', '2231', null, '中国,广西壮族自治区,贵港市,覃塘区', '3', '537121', '0775', '450804', 'Qintang', '109.4429300', '23.1267700');
INSERT INTO `sys_cn_area` VALUES ('2235', '平南县', '平南', '2231', null, '中国,广西壮族自治区,贵港市,平南县', '3', '537300', '0775', '450821', 'Pingnan', '110.3906200', '23.5420100');
INSERT INTO `sys_cn_area` VALUES ('2236', '桂平市', '桂平', '2231', null, '中国,广西壮族自治区,贵港市,桂平市', '3', '537200', '0775', '450881', 'Guiping', '110.0810500', '23.3933900');
INSERT INTO `sys_cn_area` VALUES ('2237', '玉林市', '玉林', '2163', null, '中国,广西壮族自治区,玉林市', '2', '537000', '0775', '450900', 'Yulin', '110.1543930', '22.6313600');
INSERT INTO `sys_cn_area` VALUES ('2238', '玉州区', '玉州', '2237', null, '中国,广西壮族自治区,玉林市,玉州区', '3', '537000', '0775', '450902', 'Yuzhou', '110.1511400', '22.6281000');
INSERT INTO `sys_cn_area` VALUES ('2239', '福绵区', '福绵', '2237', null, '中国,广西壮族自治区,玉林市,福绵区', '3', '537023', '0775', '450903', 'Fumian', '110.0648160', '22.5830570');
INSERT INTO `sys_cn_area` VALUES ('2240', '玉东新区', '玉东', '2237', null, '中国,广西壮族自治区,玉林市,玉东新区', '3', '537000', '0775', '450904', 'Yudong', '110.1543930', '22.6313600');
INSERT INTO `sys_cn_area` VALUES ('2241', '容县', '容县', '2237', null, '中国,广西壮族自治区,玉林市,容县', '3', '537500', '0775', '450921', 'Rongxian', '110.5559300', '22.8570100');
INSERT INTO `sys_cn_area` VALUES ('2242', '陆川县', '陆川', '2237', null, '中国,广西壮族自治区,玉林市,陆川县', '3', '537700', '0775', '450922', 'Luchuan', '110.2641300', '22.3245400');
INSERT INTO `sys_cn_area` VALUES ('2243', '博白县', '博白', '2237', null, '中国,广西壮族自治区,玉林市,博白县', '3', '537600', '0775', '450923', 'Bobai', '109.9774400', '22.2728600');
INSERT INTO `sys_cn_area` VALUES ('2244', '兴业县', '兴业', '2237', null, '中国,广西壮族自治区,玉林市,兴业县', '3', '537800', '0775', '450924', 'Xingye', '109.8761200', '22.7423700');
INSERT INTO `sys_cn_area` VALUES ('2245', '北流市', '北流', '2237', null, '中国,广西壮族自治区,玉林市,北流市', '3', '537400', '0775', '450981', 'Beiliu', '110.3530200', '22.7081700');
INSERT INTO `sys_cn_area` VALUES ('2246', '百色市', '百色', '2163', null, '中国,广西壮族自治区,百色市', '2', '533000', '0776', '451000', 'Baise', '106.6162850', '23.8977420');
INSERT INTO `sys_cn_area` VALUES ('2247', '右江区', '右江', '2246', null, '中国,广西壮族自治区,百色市,右江区', '3', '533000', '0776', '451002', 'Youjiang', '106.6176400', '23.9009000');
INSERT INTO `sys_cn_area` VALUES ('2248', '田阳县', '田阳', '2246', null, '中国,广西壮族自治区,百色市,田阳县', '3', '533600', '0776', '451021', 'Tianyang', '106.9155800', '23.7353500');
INSERT INTO `sys_cn_area` VALUES ('2249', '田东县', '田东', '2246', null, '中国,广西壮族自治区,百色市,田东县', '3', '531500', '0776', '451022', 'Tiandong', '107.1243200', '23.6000300');
INSERT INTO `sys_cn_area` VALUES ('2250', '平果县', '平果', '2246', null, '中国,广西壮族自治区,百色市,平果县', '3', '531400', '0776', '451023', 'Pingguo', '107.5904500', '23.3296900');
INSERT INTO `sys_cn_area` VALUES ('2251', '德保县', '德保', '2246', null, '中国,广西壮族自治区,百色市,德保县', '3', '533700', '0776', '451024', 'Debao', '106.6191700', '23.3251500');
INSERT INTO `sys_cn_area` VALUES ('2252', '靖西县', '靖西', '2246', null, '中国,广西壮族自治区,百色市,靖西县', '3', '533800', '0776', '451025', 'Jingxi', '106.4176600', '23.1342500');
INSERT INTO `sys_cn_area` VALUES ('2253', '那坡县', '那坡', '2246', null, '中国,广西壮族自治区,百色市,那坡县', '3', '533900', '0776', '451026', 'Napo', '105.8419100', '23.4064900');
INSERT INTO `sys_cn_area` VALUES ('2254', '凌云县', '凌云', '2246', null, '中国,广西壮族自治区,百色市,凌云县', '3', '533100', '0776', '451027', 'Lingyun', '106.5615500', '24.3474700');
INSERT INTO `sys_cn_area` VALUES ('2255', '乐业县', '乐业', '2246', null, '中国,广西壮族自治区,百色市,乐业县', '3', '533200', '0776', '451028', 'Leye', '106.5612400', '24.7829500');
INSERT INTO `sys_cn_area` VALUES ('2256', '田林县', '田林', '2246', null, '中国,广西壮族自治区,百色市,田林县', '3', '533300', '0776', '451029', 'Tianlin', '106.2288200', '24.2920700');
INSERT INTO `sys_cn_area` VALUES ('2257', '西林县', '西林', '2246', null, '中国,广西壮族自治区,百色市,西林县', '3', '533500', '0776', '451030', 'Xilin', '105.0972200', '24.4896600');
INSERT INTO `sys_cn_area` VALUES ('2258', '隆林各族自治县', '隆林', '2246', null, '中国,广西壮族自治区,百色市,隆林各族自治县', '3', '533400', '0776', '451031', 'Longlin', '105.3429500', '24.7703600');
INSERT INTO `sys_cn_area` VALUES ('2259', '贺州市', '贺州', '2163', null, '中国,广西壮族自治区,贺州市', '2', '542800', '0774', '451100', 'Hezhou', '111.5520560', '24.4141410');
INSERT INTO `sys_cn_area` VALUES ('2260', '八步区', '八步', '2259', null, '中国,广西壮族自治区,贺州市,八步区', '3', '542800', '0774', '451102', 'Babu', '111.5522500', '24.4117900');
INSERT INTO `sys_cn_area` VALUES ('2261', '昭平县', '昭平', '2259', null, '中国,广西壮族自治区,贺州市,昭平县', '3', '546800', '0774', '451121', 'Zhaoping', '110.8108200', '24.1701000');
INSERT INTO `sys_cn_area` VALUES ('2262', '钟山县', '钟山', '2259', null, '中国,广西壮族自治区,贺州市,钟山县', '3', '542600', '0774', '451122', 'Zhongshan', '111.3045900', '24.5248200');
INSERT INTO `sys_cn_area` VALUES ('2263', '富川瑶族自治县', '富川', '2259', null, '中国,广西壮族自治区,贺州市,富川瑶族自治县', '3', '542700', '0774', '451123', 'Fuchuan', '111.2776700', '24.8143100');
INSERT INTO `sys_cn_area` VALUES ('2264', '平桂管理区', '平桂', '2259', null, '中国,广西壮族自治区,贺州市,平桂管理区', '3', '542800', '0774', '451124', 'Pingui', '111.4856510', '24.4580410');
INSERT INTO `sys_cn_area` VALUES ('2265', '河池市', '河池', '2163', null, '中国,广西壮族自治区,河池市', '2', '547000', '0778', '451200', 'Hechi', '108.0621050', '24.6958990');
INSERT INTO `sys_cn_area` VALUES ('2266', '金城江区', '金城江', '2265', null, '中国,广西壮族自治区,河池市,金城江区', '3', '547000', '0779', '451202', 'Jinchengjiang', '108.0372700', '24.6897000');
INSERT INTO `sys_cn_area` VALUES ('2267', '南丹县', '南丹', '2265', null, '中国,广西壮族自治区,河池市,南丹县', '3', '547200', '0781', '451221', 'Nandan', '107.5456200', '24.9776000');
INSERT INTO `sys_cn_area` VALUES ('2268', '天峨县', '天峨', '2265', null, '中国,广西壮族自治区,河池市,天峨县', '3', '547300', '0782', '451222', 'Tiane', '107.1720500', '24.9959300');
INSERT INTO `sys_cn_area` VALUES ('2269', '凤山县', '凤山', '2265', null, '中国,广西壮族自治区,河池市,凤山县', '3', '547600', '0783', '451223', 'Fengshan', '107.0489200', '24.5421500');
INSERT INTO `sys_cn_area` VALUES ('2270', '东兰县', '东兰', '2265', null, '中国,广西壮族自治区,河池市,东兰县', '3', '547400', '0784', '451224', 'Donglan', '107.3752700', '24.5105300');
INSERT INTO `sys_cn_area` VALUES ('2271', '罗城仫佬族自治县', '罗城', '2265', null, '中国,广西壮族自治区,河池市,罗城仫佬族自治县', '3', '546400', '0785', '451225', 'Luocheng', '108.9077700', '24.7792300');
INSERT INTO `sys_cn_area` VALUES ('2272', '环江毛南族自治县', '环江', '2265', null, '中国,广西壮族自治区,河池市,环江毛南族自治县', '3', '547100', '0786', '451226', 'Huanjiang', '108.2605500', '24.8291600');
INSERT INTO `sys_cn_area` VALUES ('2273', '巴马瑶族自治县', '巴马', '2265', null, '中国,广西壮族自治区,河池市,巴马瑶族自治县', '3', '547500', '0787', '451227', 'Bama', '107.2530800', '24.1413500');
INSERT INTO `sys_cn_area` VALUES ('2274', '都安瑶族自治县', '都安', '2265', null, '中国,广西壮族自治区,河池市,都安瑶族自治县', '3', '530700', '0788', '451228', 'Du\'an', '108.1011600', '23.9324500');
INSERT INTO `sys_cn_area` VALUES ('2275', '大化瑶族自治县', '大化', '2265', null, '中国,广西壮族自治区,河池市,大化瑶族自治县', '3', '530800', '0789', '451229', 'Dahua', '107.9985000', '23.7448700');
INSERT INTO `sys_cn_area` VALUES ('2276', '宜州市', '宜州', '2265', null, '中国,广西壮族自治区,河池市,宜州市', '3', '546300', '0780', '451281', 'Yizhou', '108.6530400', '24.4939100');
INSERT INTO `sys_cn_area` VALUES ('2277', '来宾市', '来宾', '2163', null, '中国,广西壮族自治区,来宾市', '2', '546100', '0772', '451300', 'Laibin', '109.2297720', '23.7337660');
INSERT INTO `sys_cn_area` VALUES ('2278', '兴宾区', '兴宾', '2277', null, '中国,广西壮族自治区,来宾市,兴宾区', '3', '546100', '0772', '451302', 'Xingbin', '109.2347100', '23.7273100');
INSERT INTO `sys_cn_area` VALUES ('2279', '忻城县', '忻城', '2277', null, '中国,广西壮族自治区,来宾市,忻城县', '3', '546200', '0772', '451321', 'Xincheng', '108.6635700', '24.0686200');
INSERT INTO `sys_cn_area` VALUES ('2280', '象州县', '象州', '2277', null, '中国,广西壮族自治区,来宾市,象州县', '3', '545800', '0772', '451322', 'Xiangzhou', '109.6994000', '23.9735500');
INSERT INTO `sys_cn_area` VALUES ('2281', '武宣县', '武宣', '2277', null, '中国,广西壮族自治区,来宾市,武宣县', '3', '545900', '0772', '451323', 'Wuxuan', '109.6628400', '23.5947400');
INSERT INTO `sys_cn_area` VALUES ('2282', '金秀瑶族自治县', '金秀', '2277', null, '中国,广西壮族自治区,来宾市,金秀瑶族自治县', '3', '545799', '0772', '451324', 'Jinxiu', '110.1907900', '24.1292900');
INSERT INTO `sys_cn_area` VALUES ('2283', '合山市', '合山', '2277', null, '中国,广西壮族自治区,来宾市,合山市', '3', '546500', '0772', '451381', 'Heshan', '108.8858600', '23.8061900');
INSERT INTO `sys_cn_area` VALUES ('2284', '崇左市', '崇左', '2163', null, '中国,广西壮族自治区,崇左市', '2', '532299', '0771', '451400', 'Chongzuo', '107.3539260', '22.4041080');
INSERT INTO `sys_cn_area` VALUES ('2285', '江州区', '江州', '2284', null, '中国,广西壮族自治区,崇左市,江州区', '3', '532299', '0771', '451402', 'Jiangzhou', '107.3474700', '22.4113500');
INSERT INTO `sys_cn_area` VALUES ('2286', '扶绥县', '扶绥', '2284', null, '中国,广西壮族自治区,崇左市,扶绥县', '3', '532199', '0771', '451421', 'Fusui', '107.9040500', '22.6341300');
INSERT INTO `sys_cn_area` VALUES ('2287', '宁明县', '宁明', '2284', null, '中国,广西壮族自治区,崇左市,宁明县', '3', '532599', '0771', '451422', 'Ningming', '107.0729900', '22.1365500');
INSERT INTO `sys_cn_area` VALUES ('2288', '龙州县', '龙州', '2284', null, '中国,广西壮族自治区,崇左市,龙州县', '3', '532499', '0771', '451423', 'Longzhou', '106.8541500', '22.3393700');
INSERT INTO `sys_cn_area` VALUES ('2289', '大新县', '大新', '2284', null, '中国,广西壮族自治区,崇左市,大新县', '3', '532399', '0771', '451424', 'Daxin', '107.1982100', '22.8341200');
INSERT INTO `sys_cn_area` VALUES ('2290', '天等县', '天等', '2284', null, '中国,广西壮族自治区,崇左市,天等县', '3', '532899', '0771', '451425', 'Tiandeng', '107.1399800', '23.0770000');
INSERT INTO `sys_cn_area` VALUES ('2291', '凭祥市', '凭祥', '2284', null, '中国,广西壮族自治区,崇左市,凭祥市', '3', '532699', '0771', '451481', 'Pingxiang', '106.7553400', '22.1057300');
INSERT INTO `sys_cn_area` VALUES ('2292', '海南省', '海南', '1', null, '中国,海南省', '1', null, '', '460000', 'Hainan', '110.3311900', '20.0319710');
INSERT INTO `sys_cn_area` VALUES ('2293', '海口市', '海口', '2292', null, '中国,海南省,海口市', '2', '570000', '0898', '460100', 'Haikou', '110.3311900', '20.0319710');
INSERT INTO `sys_cn_area` VALUES ('2294', '秀英区', '秀英', '2293', null, '中国,海南省,海口市,秀英区', '3', '570311', '0898', '460105', 'Xiuying', '110.2934500', '20.0075200');
INSERT INTO `sys_cn_area` VALUES ('2295', '龙华区', '龙华', '2293', null, '中国,海南省,海口市,龙华区', '3', '570145', '0898', '460106', 'Longhua', '110.3019400', '20.0286600');
INSERT INTO `sys_cn_area` VALUES ('2296', '琼山区', '琼山', '2293', null, '中国,海南省,海口市,琼山区', '3', '571100', '0898', '460107', 'Qiongshan', '110.3541800', '20.0032100');
INSERT INTO `sys_cn_area` VALUES ('2297', '美兰区', '美兰', '2293', null, '中国,海南省,海口市,美兰区', '3', '570203', '0898', '460108', 'Meilan', '110.3690800', '20.0286400');
INSERT INTO `sys_cn_area` VALUES ('2298', '三亚市', '三亚', '2292', null, '中国,海南省,三亚市', '2', '572000', '0898', '460200', 'Sanya', '109.5082680', '18.2478720');
INSERT INTO `sys_cn_area` VALUES ('2299', '海棠区', '海棠', '2298', null, '中国,海南省,三亚市,海棠区', '3', '572000', '0898', '460202', 'Haitang', '109.5082680', '18.2478720');
INSERT INTO `sys_cn_area` VALUES ('2300', '吉阳区', '吉阳', '2298', null, '中国,海南省,三亚市,吉阳区', '3', '572000', '0898', '460203', 'Jiyang', '109.5082680', '18.2478720');
INSERT INTO `sys_cn_area` VALUES ('2301', '天涯区', '天涯', '2298', null, '中国,海南省,三亚市,天涯区', '3', '572000', '0898', '460204', 'Tianya', '109.5082680', '18.2478720');
INSERT INTO `sys_cn_area` VALUES ('2302', '崖州区', '崖州', '2298', null, '中国,海南省,三亚市,崖州区', '3', '572000', '0898', '460205', 'Yazhou', '109.5082680', '18.2478720');
INSERT INTO `sys_cn_area` VALUES ('2303', '三沙市', '三沙', '2292', null, '中国,海南省,三沙市', '2', '573199', '0898', '460300', 'Sansha', '112.3488200', '16.8310390');
INSERT INTO `sys_cn_area` VALUES ('2304', '西沙群岛', '西沙', '2303', null, '中国,海南省,三沙市,西沙群岛', '3', '572000', '0898', '460321', 'Xisha Islands', '112.0255280', '16.3313420');
INSERT INTO `sys_cn_area` VALUES ('2305', '南沙群岛', '南沙', '2303', null, '中国,海南省,三沙市,南沙群岛', '3', '573100', '0898', '460322', 'Nansha Islands', '116.7499980', '11.4718880');
INSERT INTO `sys_cn_area` VALUES ('2306', '中沙群岛', '中沙', '2303', null, '中国,海南省,三沙市,中沙群岛', '3', '573100', '0898', '460323', 'Zhongsha Islands', '117.7400710', '15.1128560');
INSERT INTO `sys_cn_area` VALUES ('2307', '直辖县级', ' ', '2292', null, '中国,海南省,直辖县级', '2', null, '', '469000', '', '109.5034790', '18.7399060');
INSERT INTO `sys_cn_area` VALUES ('2308', '五指山市', '五指山', '2307', null, '中国,海南省,直辖县级,五指山市', '3', '572200', '0898', '469001', 'Wuzhishan', '109.5166620', '18.7769210');
INSERT INTO `sys_cn_area` VALUES ('2309', '琼海市', '琼海', '2307', null, '中国,海南省,直辖县级,琼海市', '3', '571400', '0898', '469002', 'Qionghai', '110.4667850', '19.2460110');
INSERT INTO `sys_cn_area` VALUES ('2310', '儋州市', '儋州', '2307', null, '中国,海南省,直辖县级,儋州市', '3', '571700', '0898', '469003', 'Danzhou', '109.5767820', '19.5174860');
INSERT INTO `sys_cn_area` VALUES ('2311', '文昌市', '文昌', '2307', null, '中国,海南省,直辖县级,文昌市', '3', '571339', '0898', '469005', 'Wenchang', '110.7539750', '19.6129860');
INSERT INTO `sys_cn_area` VALUES ('2312', '万宁市', '万宁', '2307', null, '中国,海南省,直辖县级,万宁市', '3', '571500', '0898', '469006', 'Wanning', '110.3887930', '18.7962160');
INSERT INTO `sys_cn_area` VALUES ('2313', '东方市', '东方', '2307', null, '中国,海南省,直辖县级,东方市', '3', '572600', '0898', '469007', 'Dongfang', '108.6537890', '19.1019800');
INSERT INTO `sys_cn_area` VALUES ('2314', '定安县', '定安', '2307', null, '中国,海南省,直辖县级,定安县', '3', '571200', '0898', '469021', 'Ding\'an', '110.3239590', '19.6992110');
INSERT INTO `sys_cn_area` VALUES ('2315', '屯昌县', '屯昌', '2307', null, '中国,海南省,直辖县级,屯昌县', '3', '571600', '0898', '469022', 'Tunchang', '110.1027730', '19.3629160');
INSERT INTO `sys_cn_area` VALUES ('2316', '澄迈县', '澄迈', '2307', null, '中国,海南省,直辖县级,澄迈县', '3', '571900', '0898', '469023', 'Chengmai', '110.0071470', '19.7370950');
INSERT INTO `sys_cn_area` VALUES ('2317', '临高县', '临高', '2307', null, '中国,海南省,直辖县级,临高县', '3', '571800', '0898', '469024', 'Lingao', '109.6876970', '19.9082930');
INSERT INTO `sys_cn_area` VALUES ('2318', '白沙黎族自治县', '白沙', '2307', null, '中国,海南省,直辖县级,白沙黎族自治县', '3', '572800', '0898', '469025', 'Baisha', '109.4526060', '19.2245840');
INSERT INTO `sys_cn_area` VALUES ('2319', '昌江黎族自治县', '昌江', '2307', null, '中国,海南省,直辖县级,昌江黎族自治县', '3', '572700', '0898', '469026', 'Changjiang', '109.0533510', '19.2609680');
INSERT INTO `sys_cn_area` VALUES ('2320', '乐东黎族自治县', '乐东', '2307', null, '中国,海南省,直辖县级,乐东黎族自治县', '3', '572500', '0898', '469027', 'Ledong', '109.1754440', '18.7475800');
INSERT INTO `sys_cn_area` VALUES ('2321', '陵水黎族自治县', '陵水', '2307', null, '中国,海南省,直辖县级,陵水黎族自治县', '3', '572400', '0898', '469028', 'Lingshui', '110.0372180', '18.5050060');
INSERT INTO `sys_cn_area` VALUES ('2322', '保亭黎族苗族自治县', '保亭', '2307', null, '中国,海南省,直辖县级,保亭黎族苗族自治县', '3', '572300', '0898', '469029', 'Baoting', '109.7024500', '18.6363710');
INSERT INTO `sys_cn_area` VALUES ('2323', '琼中黎族苗族自治县', '琼中', '2307', null, '中国,海南省,直辖县级,琼中黎族苗族自治县', '3', '572900', '0898', '469030', 'Qiongzhong', '109.8399960', '19.0355700');
INSERT INTO `sys_cn_area` VALUES ('2324', '重庆', '重庆', '1', null, '中国,重庆', '1', null, '', '500000', 'Chongqing', '106.5049620', '29.5331550');
INSERT INTO `sys_cn_area` VALUES ('2325', '重庆市', '重庆', '2324', null, '中国,重庆,重庆市', '2', '400000', '023', '500100', 'Chongqing', '106.5049620', '29.5331550');
INSERT INTO `sys_cn_area` VALUES ('2326', '万州区', '万州', '2325', null, '中国,重庆,重庆市,万州区', '3', '404000', '023', '500101', 'Wanzhou', '108.4086900', '30.8078800');
INSERT INTO `sys_cn_area` VALUES ('2327', '涪陵区', '涪陵', '2325', null, '中国,重庆,重庆市,涪陵区', '3', '408000', '023', '500102', 'Fuling', '107.3900700', '29.7029200');
INSERT INTO `sys_cn_area` VALUES ('2328', '渝中区', '渝中', '2325', null, '中国,重庆,重庆市,渝中区', '3', '400010', '023', '500103', 'Yuzhong', '106.5690100', '29.5527900');
INSERT INTO `sys_cn_area` VALUES ('2329', '大渡口区', '大渡口', '2325', null, '中国,重庆,重庆市,大渡口区', '3', '400080', '023', '500104', 'Dadukou', '106.4826200', '29.4844700');
INSERT INTO `sys_cn_area` VALUES ('2330', '江北区', '江北', '2325', null, '中国,重庆,重庆市,江北区', '3', '400020', '023', '500105', 'Jiangbei', '106.5743400', '29.6065800');
INSERT INTO `sys_cn_area` VALUES ('2331', '沙坪坝区', '沙坪坝', '2325', null, '中国,重庆,重庆市,沙坪坝区', '3', '400030', '023', '500106', 'Shapingba', '106.4575200', '29.5411300');
INSERT INTO `sys_cn_area` VALUES ('2332', '九龙坡区', '九龙坡', '2325', null, '中国,重庆,重庆市,九龙坡区', '3', '400050', '023', '500107', 'Jiulongpo', '106.5110700', '29.5019700');
INSERT INTO `sys_cn_area` VALUES ('2333', '南岸区', '南岸', '2325', null, '中国,重庆,重庆市,南岸区', '3', '400064', '023', '500108', 'Nan\'an', '106.5634700', '29.5231100');
INSERT INTO `sys_cn_area` VALUES ('2334', '北碚区', '北碚', '2325', null, '中国,重庆,重庆市,北碚区', '3', '400700', '023', '500109', 'Beibei', '106.3961400', '29.8057400');
INSERT INTO `sys_cn_area` VALUES ('2335', '綦江区', '綦江', '2325', null, '中国,重庆,重庆市,綦江区', '3', '400800', '023', '500110', 'Qijiang', '106.9267790', '28.9606560');
INSERT INTO `sys_cn_area` VALUES ('2336', '大足区', '大足', '2325', null, '中国,重庆,重庆市,大足区', '3', '400900', '023', '500111', 'Dazu', '105.7681210', '29.4840250');
INSERT INTO `sys_cn_area` VALUES ('2337', '渝北区', '渝北', '2325', null, '中国,重庆,重庆市,渝北区', '3', '401120', '023', '500112', 'Yubei', '106.6307000', '29.7182000');
INSERT INTO `sys_cn_area` VALUES ('2338', '巴南区', '巴南', '2325', null, '中国,重庆,重庆市,巴南区', '3', '401320', '023', '500113', 'Banan', '106.5236500', '29.3831100');
INSERT INTO `sys_cn_area` VALUES ('2339', '黔江区', '黔江', '2325', null, '中国,重庆,重庆市,黔江区', '3', '409700', '023', '500114', 'Qianjiang', '108.7709000', '29.5332000');
INSERT INTO `sys_cn_area` VALUES ('2340', '长寿区', '长寿', '2325', null, '中国,重庆,重庆市,长寿区', '3', '401220', '023', '500115', 'Changshou', '107.0816600', '29.8535900');
INSERT INTO `sys_cn_area` VALUES ('2341', '江津区', '江津', '2325', null, '中国,重庆,重庆市,江津区', '3', '402260', '023', '500116', 'Jiangjin', '106.2591200', '29.2900800');
INSERT INTO `sys_cn_area` VALUES ('2342', '合川区', '合川', '2325', null, '中国,重庆,重庆市,合川区', '3', '401520', '023', '500117', 'Hechuan', '106.2763300', '29.9722700');
INSERT INTO `sys_cn_area` VALUES ('2343', '永川区', '永川', '2325', null, '中国,重庆,重庆市,永川区', '3', '402160', '023', '500118', 'Yongchuan', '105.9270000', '29.3559300');
INSERT INTO `sys_cn_area` VALUES ('2344', '南川区', '南川', '2325', null, '中国,重庆,重庆市,南川区', '3', '408400', '023', '500119', 'Nanchuan', '107.0993600', '29.1575100');
INSERT INTO `sys_cn_area` VALUES ('2345', '璧山区', '璧山', '2325', null, '中国,重庆,重庆市,璧山区', '3', '402760', '023', '500120', 'Bishan', '106.2311260', '29.5935810');
INSERT INTO `sys_cn_area` VALUES ('2346', '铜梁区', '铜梁', '2325', null, '中国,重庆,重庆市,铜梁区', '3', '402560', '023', '500151', 'Tongliang', '106.0549480', '29.8399440');
INSERT INTO `sys_cn_area` VALUES ('2347', '潼南县', '潼南', '2325', null, '中国,重庆,重庆市,潼南县', '3', '402660', '023', '500223', 'Tongnan', '105.8400500', '30.1912000');
INSERT INTO `sys_cn_area` VALUES ('2348', '荣昌县', '荣昌', '2325', null, '中国,重庆,重庆市,荣昌县', '3', '402460', '023', '500226', 'Rongchang', '105.5944200', '29.4048800');
INSERT INTO `sys_cn_area` VALUES ('2349', '梁平县', '梁平', '2325', null, '中国,重庆,重庆市,梁平县', '3', '405200', '023', '500228', 'Liangping', '107.7999800', '30.6754500');
INSERT INTO `sys_cn_area` VALUES ('2350', '城口县', '城口', '2325', null, '中国,重庆,重庆市,城口县', '3', '405900', '023', '500229', 'Chengkou', '108.6651300', '31.9480100');
INSERT INTO `sys_cn_area` VALUES ('2351', '丰都县', '丰都', '2325', null, '中国,重庆,重庆市,丰都县', '3', '408200', '023', '500230', 'Fengdu', '107.7309800', '29.8634800');
INSERT INTO `sys_cn_area` VALUES ('2352', '垫江县', '垫江', '2325', null, '中国,重庆,重庆市,垫江县', '3', '408300', '023', '500231', 'Dianjiang', '107.3544600', '30.3335900');
INSERT INTO `sys_cn_area` VALUES ('2353', '武隆县', '武隆', '2325', null, '中国,重庆,重庆市,武隆县', '3', '408500', '023', '500232', 'Wulong', '107.7601000', '29.3254800');
INSERT INTO `sys_cn_area` VALUES ('2354', '忠县', '忠县', '2325', null, '中国,重庆,重庆市,忠县', '3', '404300', '023', '500233', 'Zhongxian', '108.0368900', '30.2889800');
INSERT INTO `sys_cn_area` VALUES ('2355', '开县', '开县', '2325', null, '中国,重庆,重庆市,开县', '3', '405400', '023', '500234', 'Kaixian', '108.3930600', '31.1609500');
INSERT INTO `sys_cn_area` VALUES ('2356', '云阳县', '云阳', '2325', null, '中国,重庆,重庆市,云阳县', '3', '404500', '023', '500235', 'Yunyang', '108.6972600', '30.9306200');
INSERT INTO `sys_cn_area` VALUES ('2357', '奉节县', '奉节', '2325', null, '中国,重庆,重庆市,奉节县', '3', '404600', '023', '500236', 'Fengjie', '109.4647800', '31.0182500');
INSERT INTO `sys_cn_area` VALUES ('2358', '巫山县', '巫山', '2325', null, '中国,重庆,重庆市,巫山县', '3', '404700', '023', '500237', 'Wushan', '109.8781400', '31.0745800');
INSERT INTO `sys_cn_area` VALUES ('2359', '巫溪县', '巫溪', '2325', null, '中国,重庆,重庆市,巫溪县', '3', '405800', '023', '500238', 'Wuxi', '109.6312800', '31.3975600');
INSERT INTO `sys_cn_area` VALUES ('2360', '石柱土家族自治县', '石柱', '2325', null, '中国,重庆,重庆市,石柱土家族自治县', '3', '409100', '023', '500240', 'Shizhu', '108.1138900', '30.0005400');
INSERT INTO `sys_cn_area` VALUES ('2361', '秀山土家族苗族自治县', '秀山', '2325', null, '中国,重庆,重庆市,秀山土家族苗族自治县', '3', '409900', '023', '500241', 'Xiushan', '108.9886100', '28.4506200');
INSERT INTO `sys_cn_area` VALUES ('2362', '酉阳土家族苗族自治县', '酉阳', '2325', null, '中国,重庆,重庆市,酉阳土家族苗族自治县', '3', '409800', '023', '500242', 'Youyang', '108.7721200', '28.8446000');
INSERT INTO `sys_cn_area` VALUES ('2363', '彭水苗族土家族自治县', '彭水', '2325', null, '中国,重庆,重庆市,彭水苗族土家族自治县', '3', '409600', '023', '500243', 'Pengshui', '108.1663800', '29.2951600');
INSERT INTO `sys_cn_area` VALUES ('2364', '两江新区', '两江新区', '2324', null, '中国,重庆,两江新区', '2', '400000', '023', '500300', 'Liangjiangxinqu', '106.4633440', '29.7291530');
INSERT INTO `sys_cn_area` VALUES ('2365', '北部新区', '北部新区', '2364', null, '中国,重庆,两江新区,北部新区', '3', '400000', '023', '500301', 'Beibuxinqu', '106.4888410', '29.6670620');
INSERT INTO `sys_cn_area` VALUES ('2366', '保税港区', '保税港区', '2364', null, '中国,重庆,两江新区,保税港区', '3', '400000', '023', '500302', 'Baoshuigangqu', '106.6381840', '29.7163110');
INSERT INTO `sys_cn_area` VALUES ('2367', '工业园区', '工业园区', '2364', null, '中国,重庆,两江新区,工业园区', '3', '400000', '023', '500303', 'Gongyeyuanqu', '106.6264340', '29.5555400');
INSERT INTO `sys_cn_area` VALUES ('2368', '四川省', '四川', '1', null, '中国,四川省', '1', null, '', '510000', 'Sichuan', '104.0657350', '30.6594620');
INSERT INTO `sys_cn_area` VALUES ('2369', '成都市', '成都', '2368', null, '中国,四川省,成都市', '2', '610015', '028', '510100', 'Chengdu', '104.0657350', '30.6594620');
INSERT INTO `sys_cn_area` VALUES ('2370', '锦江区', '锦江', '2369', null, '中国,四川省,成都市,锦江区', '3', '610021', '028', '510104', 'Jinjiang', '104.0834700', '30.6561400');
INSERT INTO `sys_cn_area` VALUES ('2371', '青羊区', '青羊', '2369', null, '中国,四川省,成都市,青羊区', '3', '610031', '028', '510105', 'Qingyang', '104.0615100', '30.6738700');
INSERT INTO `sys_cn_area` VALUES ('2372', '金牛区', '金牛', '2369', null, '中国,四川省,成都市,金牛区', '3', '610036', '028', '510106', 'Jinniu', '104.0511400', '30.6912600');
INSERT INTO `sys_cn_area` VALUES ('2373', '武侯区', '武侯', '2369', null, '中国,四川省,成都市,武侯区', '3', '610041', '028', '510107', 'Wuhou', '104.0430300', '30.6423500');
INSERT INTO `sys_cn_area` VALUES ('2374', '成华区', '成华', '2369', null, '中国,四川省,成都市,成华区', '3', '610066', '028', '510108', 'Chenghua', '104.1019300', '30.6599300');
INSERT INTO `sys_cn_area` VALUES ('2375', '龙泉驿区', '龙泉驿', '2369', null, '中国,四川省,成都市,龙泉驿区', '3', '610100', '028', '510112', 'Longquanyi', '104.2746200', '30.5565800');
INSERT INTO `sys_cn_area` VALUES ('2376', '青白江区', '青白江', '2369', null, '中国,四川省,成都市,青白江区', '3', '610300', '028', '510113', 'Qingbaijiang', '104.2510000', '30.8784100');
INSERT INTO `sys_cn_area` VALUES ('2377', '新都区', '新都', '2369', null, '中国,四川省,成都市,新都区', '3', '610500', '028', '510114', 'Xindu', '104.1592100', '30.8231400');
INSERT INTO `sys_cn_area` VALUES ('2378', '温江区', '温江', '2369', null, '中国,四川省,成都市,温江区', '3', '611130', '028', '510115', 'Wenjiang', '103.8488100', '30.6844400');
INSERT INTO `sys_cn_area` VALUES ('2379', '金堂县', '金堂', '2369', null, '中国,四川省,成都市,金堂县', '3', '610400', '028', '510121', 'Jintang', '104.4119500', '30.8619500');
INSERT INTO `sys_cn_area` VALUES ('2380', '双流县', '双流', '2369', null, '中国,四川省,成都市,双流县', '3', '610200', '028', '510122', 'Shuangliu', '103.9237300', '30.5744400');
INSERT INTO `sys_cn_area` VALUES ('2381', '郫县', '郫县', '2369', null, '中国,四川省,成都市,郫县', '3', '611730', '028', '510124', 'Pixian', '103.8871700', '30.8105400');
INSERT INTO `sys_cn_area` VALUES ('2382', '大邑县', '大邑', '2369', null, '中国,四川省,成都市,大邑县', '3', '611330', '028', '510129', 'Dayi', '103.5207500', '30.5873800');
INSERT INTO `sys_cn_area` VALUES ('2383', '蒲江县', '蒲江', '2369', null, '中国,四川省,成都市,蒲江县', '3', '611630', '028', '510131', 'Pujiang', '103.5061600', '30.1966700');
INSERT INTO `sys_cn_area` VALUES ('2384', '新津县', '新津', '2369', null, '中国,四川省,成都市,新津县', '3', '611430', '028', '510132', 'Xinjin', '103.8114000', '30.4098300');
INSERT INTO `sys_cn_area` VALUES ('2385', '都江堰市', '都江堰', '2369', null, '中国,四川省,成都市,都江堰市', '3', '611830', '028', '510181', 'Dujiangyan', '103.6194100', '30.9982500');
INSERT INTO `sys_cn_area` VALUES ('2386', '彭州市', '彭州', '2369', null, '中国,四川省,成都市,彭州市', '3', '611930', '028', '510182', 'Pengzhou', '103.9580000', '30.9901100');
INSERT INTO `sys_cn_area` VALUES ('2387', '邛崃市', '邛崃', '2369', null, '中国,四川省,成都市,邛崃市', '3', '611530', '028', '510183', 'Qionglai', '103.4628300', '30.4148900');
INSERT INTO `sys_cn_area` VALUES ('2388', '崇州市', '崇州', '2369', null, '中国,四川省,成都市,崇州市', '3', '611230', '028', '510184', 'Chongzhou', '103.6728500', '30.6301400');
INSERT INTO `sys_cn_area` VALUES ('2389', '自贡市', '自贡', '2368', null, '中国,四川省,自贡市', '2', '643000', '0813', '510300', 'Zigong', '104.7734470', '29.3527650');
INSERT INTO `sys_cn_area` VALUES ('2390', '自流井区', '自流井', '2389', null, '中国,四川省,自贡市,自流井区', '3', '643000', '0813', '510302', 'Ziliujing', '104.7771900', '29.3374500');
INSERT INTO `sys_cn_area` VALUES ('2391', '贡井区', '贡井', '2389', null, '中国,四川省,自贡市,贡井区', '3', '643020', '0813', '510303', 'Gongjing', '104.7153600', '29.3457600');
INSERT INTO `sys_cn_area` VALUES ('2392', '大安区', '大安', '2389', null, '中国,四川省,自贡市,大安区', '3', '643010', '0813', '510304', 'Da\'an', '104.7738300', '29.3636400');
INSERT INTO `sys_cn_area` VALUES ('2393', '沿滩区', '沿滩', '2389', null, '中国,四川省,自贡市,沿滩区', '3', '643030', '0813', '510311', 'Yantan', '104.8801200', '29.2661100');
INSERT INTO `sys_cn_area` VALUES ('2394', '荣县', '荣县', '2389', null, '中国,四川省,自贡市,荣县', '3', '643100', '0813', '510321', 'Rongxian', '104.4176000', '29.4444500');
INSERT INTO `sys_cn_area` VALUES ('2395', '富顺县', '富顺', '2389', null, '中国,四川省,自贡市,富顺县', '3', '643200', '0813', '510322', 'Fushun', '104.9749100', '29.1812300');
INSERT INTO `sys_cn_area` VALUES ('2396', '攀枝花市', '攀枝花', '2368', null, '中国,四川省,攀枝花市', '2', '617000', '0812', '510400', 'Panzhihua', '101.7160070', '26.5804460');
INSERT INTO `sys_cn_area` VALUES ('2397', '东区', '东区', '2396', null, '中国,四川省,攀枝花市,东区', '3', '617067', '0812', '510402', 'Dongqu', '101.7052000', '26.5467700');
INSERT INTO `sys_cn_area` VALUES ('2398', '西区', '西区', '2396', null, '中国,四川省,攀枝花市,西区', '3', '617068', '0812', '510403', 'Xiqu', '101.6305800', '26.5975300');
INSERT INTO `sys_cn_area` VALUES ('2399', '仁和区', '仁和', '2396', null, '中国,四川省,攀枝花市,仁和区', '3', '617061', '0812', '510411', 'Renhe', '101.7381200', '26.4984100');
INSERT INTO `sys_cn_area` VALUES ('2400', '米易县', '米易', '2396', null, '中国,四川省,攀枝花市,米易县', '3', '617200', '0812', '510421', 'Miyi', '102.1113200', '26.8871800');
INSERT INTO `sys_cn_area` VALUES ('2401', '盐边县', '盐边', '2396', null, '中国,四川省,攀枝花市,盐边县', '3', '617100', '0812', '510422', 'Yanbian', '101.8544600', '26.6884700');
INSERT INTO `sys_cn_area` VALUES ('2402', '泸州市', '泸州', '2368', null, '中国,四川省,泸州市', '2', '646000', '0830', '510500', 'Luzhou', '105.4433480', '28.8891380');
INSERT INTO `sys_cn_area` VALUES ('2403', '江阳区', '江阳', '2402', null, '中国,四川省,泸州市,江阳区', '3', '646000', '0830', '510502', 'Jiangyang', '105.4533600', '28.8893400');
INSERT INTO `sys_cn_area` VALUES ('2404', '纳溪区', '纳溪', '2402', null, '中国,四川省,泸州市,纳溪区', '3', '646300', '0830', '510503', 'Naxi', '105.3725500', '28.7734300');
INSERT INTO `sys_cn_area` VALUES ('2405', '龙马潭区', '龙马潭', '2402', null, '中国,四川省,泸州市,龙马潭区', '3', '646000', '0830', '510504', 'Longmatan', '105.4377400', '28.9130800');
INSERT INTO `sys_cn_area` VALUES ('2406', '泸县', '泸县', '2402', null, '中国,四川省,泸州市,泸县', '3', '646106', '0830', '510521', 'Luxian', '105.3819200', '29.1504100');
INSERT INTO `sys_cn_area` VALUES ('2407', '合江县', '合江', '2402', null, '中国,四川省,泸州市,合江县', '3', '646200', '0830', '510522', 'Hejiang', '105.8352000', '28.8100500');
INSERT INTO `sys_cn_area` VALUES ('2408', '叙永县', '叙永', '2402', null, '中国,四川省,泸州市,叙永县', '3', '646400', '0830', '510524', 'Xuyong', '105.4447300', '28.1558600');
INSERT INTO `sys_cn_area` VALUES ('2409', '古蔺县', '古蔺', '2402', null, '中国,四川省,泸州市,古蔺县', '3', '646500', '0830', '510525', 'Gulin', '105.8134700', '28.0386700');
INSERT INTO `sys_cn_area` VALUES ('2410', '德阳市', '德阳', '2368', null, '中国,四川省,德阳市', '2', '618000', '0838', '510600', 'Deyang', '104.3986510', '31.1279910');
INSERT INTO `sys_cn_area` VALUES ('2411', '旌阳区', '旌阳', '2410', null, '中国,四川省,德阳市,旌阳区', '3', '618000', '0838', '510603', 'Jingyang', '104.3936700', '31.1390600');
INSERT INTO `sys_cn_area` VALUES ('2412', '中江县', '中江', '2410', null, '中国,四川省,德阳市,中江县', '3', '618100', '0838', '510623', 'Zhongjiang', '104.6786100', '31.0329700');
INSERT INTO `sys_cn_area` VALUES ('2413', '罗江县', '罗江', '2410', null, '中国,四川省,德阳市,罗江县', '3', '618500', '0838', '510626', 'Luojiang', '104.5102500', '31.3166500');
INSERT INTO `sys_cn_area` VALUES ('2414', '广汉市', '广汉', '2410', null, '中国,四川省,德阳市,广汉市', '3', '618300', '0838', '510681', 'Guanghan', '104.2823400', '30.9768600');
INSERT INTO `sys_cn_area` VALUES ('2415', '什邡市', '什邡', '2410', null, '中国,四川省,德阳市,什邡市', '3', '618400', '0838', '510682', 'Shifang', '104.1675400', '31.1264000');
INSERT INTO `sys_cn_area` VALUES ('2416', '绵竹市', '绵竹', '2410', null, '中国,四川省,德阳市,绵竹市', '3', '618200', '0838', '510683', 'Mianzhu', '104.2207600', '31.3377200');
INSERT INTO `sys_cn_area` VALUES ('2417', '绵阳市', '绵阳', '2368', null, '中国,四川省,绵阳市', '2', '621000', '0816', '510700', 'Mianyang', '104.7417220', '31.4640200');
INSERT INTO `sys_cn_area` VALUES ('2418', '涪城区', '涪城', '2417', null, '中国,四川省,绵阳市,涪城区', '3', '621000', '0816', '510703', 'Fucheng', '104.7571900', '31.4552200');
INSERT INTO `sys_cn_area` VALUES ('2419', '游仙区', '游仙', '2417', null, '中国,四川省,绵阳市,游仙区', '3', '621022', '0816', '510704', 'Youxian', '104.7709200', '31.4657400');
INSERT INTO `sys_cn_area` VALUES ('2420', '三台县', '三台', '2417', null, '中国,四川省,绵阳市,三台县', '3', '621100', '0816', '510722', 'Santai', '105.0907900', '31.0917900');
INSERT INTO `sys_cn_area` VALUES ('2421', '盐亭县', '盐亭', '2417', null, '中国,四川省,绵阳市,盐亭县', '3', '621600', '0816', '510723', 'Yanting', '105.3898000', '31.2217600');
INSERT INTO `sys_cn_area` VALUES ('2422', '安县', '安县', '2417', null, '中国,四川省,绵阳市,安县', '3', '622650', '0816', '510724', 'Anxian', '104.5673800', '31.5348700');
INSERT INTO `sys_cn_area` VALUES ('2423', '梓潼县', '梓潼', '2417', null, '中国,四川省,绵阳市,梓潼县', '3', '622150', '0816', '510725', 'Zitong', '105.1618300', '31.6359000');
INSERT INTO `sys_cn_area` VALUES ('2424', '北川羌族自治县', '北川', '2417', null, '中国,四川省,绵阳市,北川羌族自治县', '3', '622750', '0816', '510726', 'Beichuan', '104.4640800', '31.8328600');
INSERT INTO `sys_cn_area` VALUES ('2425', '平武县', '平武', '2417', null, '中国,四川省,绵阳市,平武县', '3', '622550', '0816', '510727', 'Pingwu', '104.5286200', '32.4079100');
INSERT INTO `sys_cn_area` VALUES ('2426', '江油市', '江油', '2417', null, '中国,四川省,绵阳市,江油市', '3', '621700', '0816', '510781', 'Jiangyou', '104.7453900', '31.7777500');
INSERT INTO `sys_cn_area` VALUES ('2427', '广元市', '广元', '2368', null, '中国,四川省,广元市', '2', '628000', '0839', '510800', 'Guangyuan', '105.8297570', '32.4336680');
INSERT INTO `sys_cn_area` VALUES ('2428', '利州区', '利州', '2427', null, '中国,四川省,广元市,利州区', '3', '628017', '0839', '510802', 'Lizhou', '105.8261940', '32.4322760');
INSERT INTO `sys_cn_area` VALUES ('2429', '昭化区', '昭化', '2427', null, '中国,四川省,广元市,昭化区', '3', '628017', '0839', '510811', 'Zhaohua', '105.6404910', '32.3865180');
INSERT INTO `sys_cn_area` VALUES ('2430', '朝天区', '朝天', '2427', null, '中国,四川省,广元市,朝天区', '3', '628017', '0839', '510812', 'Chaotian', '105.8927300', '32.6439800');
INSERT INTO `sys_cn_area` VALUES ('2431', '旺苍县', '旺苍', '2427', null, '中国,四川省,广元市,旺苍县', '3', '628200', '0839', '510821', 'Wangcang', '106.2902200', '32.2284500');
INSERT INTO `sys_cn_area` VALUES ('2432', '青川县', '青川', '2427', null, '中国,四川省,广元市,青川县', '3', '628100', '0839', '510822', 'Qingchuan', '105.2391000', '32.5856300');
INSERT INTO `sys_cn_area` VALUES ('2433', '剑阁县', '剑阁', '2427', null, '中国,四川省,广元市,剑阁县', '3', '628300', '0839', '510823', 'Jiange', '105.5252000', '32.2884500');
INSERT INTO `sys_cn_area` VALUES ('2434', '苍溪县', '苍溪', '2427', null, '中国,四川省,广元市,苍溪县', '3', '628400', '0839', '510824', 'Cangxi', '105.9360000', '31.7320900');
INSERT INTO `sys_cn_area` VALUES ('2435', '遂宁市', '遂宁', '2368', null, '中国,四川省,遂宁市', '2', '629000', '0825', '510900', 'Suining', '105.5713310', '30.5133110');
INSERT INTO `sys_cn_area` VALUES ('2436', '船山区', '船山', '2435', null, '中国,四川省,遂宁市,船山区', '3', '629000', '0825', '510903', 'Chuanshan', '105.5809000', '30.4999100');
INSERT INTO `sys_cn_area` VALUES ('2437', '安居区', '安居', '2435', null, '中国,四川省,遂宁市,安居区', '3', '629000', '0825', '510904', 'Anju', '105.4640200', '30.3577800');
INSERT INTO `sys_cn_area` VALUES ('2438', '蓬溪县', '蓬溪', '2435', null, '中国,四川省,遂宁市,蓬溪县', '3', '629100', '0825', '510921', 'Pengxi', '105.7075200', '30.7577500');
INSERT INTO `sys_cn_area` VALUES ('2439', '射洪县', '射洪', '2435', null, '中国,四川省,遂宁市,射洪县', '3', '629200', '0825', '510922', 'Shehong', '105.3892200', '30.8720300');
INSERT INTO `sys_cn_area` VALUES ('2440', '大英县', '大英', '2435', null, '中国,四川省,遂宁市,大英县', '3', '629300', '0825', '510923', 'Daying', '105.2434600', '30.5943400');
INSERT INTO `sys_cn_area` VALUES ('2441', '内江市', '内江', '2368', null, '中国,四川省,内江市', '2', '641000', '0832', '511000', 'Neijiang', '105.0661380', '29.5870800');
INSERT INTO `sys_cn_area` VALUES ('2442', '市中区', '市中区', '2441', null, '中国,四川省,内江市,市中区', '3', '641000', '0832', '511002', 'Shizhongqu', '105.0679000', '29.5870900');
INSERT INTO `sys_cn_area` VALUES ('2443', '东兴区', '东兴', '2441', null, '中国,四川省,内江市,东兴区', '3', '641100', '0832', '511011', 'Dongxing', '105.0755400', '29.5927800');
INSERT INTO `sys_cn_area` VALUES ('2444', '威远县', '威远', '2441', null, '中国,四川省,内江市,威远县', '3', '642450', '0832', '511024', 'Weiyuan', '104.6695500', '29.5282300');
INSERT INTO `sys_cn_area` VALUES ('2445', '资中县', '资中', '2441', null, '中国,四川省,内江市,资中县', '3', '641200', '0832', '511025', 'Zizhong', '104.8520500', '29.7640900');
INSERT INTO `sys_cn_area` VALUES ('2446', '隆昌县', '隆昌', '2441', null, '中国,四川省,内江市,隆昌县', '3', '642150', '0832', '511028', 'Longchang', '105.2873800', '29.3393700');
INSERT INTO `sys_cn_area` VALUES ('2447', '乐山市', '乐山', '2368', null, '中国,四川省,乐山市', '2', '614000', '0833', '511100', 'Leshan', '103.7612630', '29.5820240');
INSERT INTO `sys_cn_area` VALUES ('2448', '市中区', '市中区', '2447', null, '中国,四川省,乐山市,市中区', '3', '614000', '0833', '511102', 'Shizhongqu', '103.7615900', '29.5554300');
INSERT INTO `sys_cn_area` VALUES ('2449', '沙湾区', '沙湾', '2447', null, '中国,四川省,乐山市,沙湾区', '3', '614900', '0833', '511111', 'Shawan', '103.5487300', '29.4119400');
INSERT INTO `sys_cn_area` VALUES ('2450', '五通桥区', '五通桥', '2447', null, '中国,四川省,乐山市,五通桥区', '3', '614800', '0833', '511112', 'Wutongqiao', '103.8234500', '29.4034400');
INSERT INTO `sys_cn_area` VALUES ('2451', '金口河区', '金口河', '2447', null, '中国,四川省,乐山市,金口河区', '3', '614700', '0833', '511113', 'Jinkouhe', '103.0785800', '29.2457800');
INSERT INTO `sys_cn_area` VALUES ('2452', '犍为县', '犍为', '2447', null, '中国,四川省,乐山市,犍为县', '3', '614400', '0833', '511123', 'Qianwei', '103.9498900', '29.2097300');
INSERT INTO `sys_cn_area` VALUES ('2453', '井研县', '井研', '2447', null, '中国,四川省,乐山市,井研县', '3', '613100', '0833', '511124', 'Jingyan', '104.0701900', '29.6522800');
INSERT INTO `sys_cn_area` VALUES ('2454', '夹江县', '夹江', '2447', null, '中国,四川省,乐山市,夹江县', '3', '614100', '0833', '511126', 'Jiajiang', '103.5719900', '29.7386800');
INSERT INTO `sys_cn_area` VALUES ('2455', '沐川县', '沐川', '2447', null, '中国,四川省,乐山市,沐川县', '3', '614500', '0833', '511129', 'Muchuan', '103.9035300', '28.9564600');
INSERT INTO `sys_cn_area` VALUES ('2456', '峨边彝族自治县', '峨边', '2447', null, '中国,四川省,乐山市,峨边彝族自治县', '3', '614300', '0833', '511132', 'Ebian', '103.2633900', '29.2300400');
INSERT INTO `sys_cn_area` VALUES ('2457', '马边彝族自治县', '马边', '2447', null, '中国,四川省,乐山市,马边彝族自治县', '3', '614600', '0833', '511133', 'Mabian', '103.5461700', '28.8359300');
INSERT INTO `sys_cn_area` VALUES ('2458', '峨眉山市', '峨眉山', '2447', null, '中国,四川省,乐山市,峨眉山市', '3', '614200', '0833', '511181', 'Emeishan', '103.4844000', '29.6011700');
INSERT INTO `sys_cn_area` VALUES ('2459', '南充市', '南充', '2368', null, '中国,四川省,南充市', '2', '637000', '0817', '511300', 'Nanchong', '106.0829740', '30.7952810');
INSERT INTO `sys_cn_area` VALUES ('2460', '顺庆区', '顺庆', '2459', null, '中国,四川省,南充市,顺庆区', '3', '637000', '0817', '511302', 'Shunqing', '106.0921600', '30.7964200');
INSERT INTO `sys_cn_area` VALUES ('2461', '高坪区', '高坪', '2459', null, '中国,四川省,南充市,高坪区', '3', '637100', '0817', '511303', 'Gaoping', '106.1189400', '30.7816200');
INSERT INTO `sys_cn_area` VALUES ('2462', '嘉陵区', '嘉陵', '2459', null, '中国,四川省,南充市,嘉陵区', '3', '637100', '0817', '511304', 'Jialing', '106.0714100', '30.7584800');
INSERT INTO `sys_cn_area` VALUES ('2463', '南部县', '南部', '2459', null, '中国,四川省,南充市,南部县', '3', '637300', '0817', '511321', 'Nanbu', '106.0673800', '31.3545100');
INSERT INTO `sys_cn_area` VALUES ('2464', '营山县', '营山', '2459', null, '中国,四川省,南充市,营山县', '3', '637700', '0817', '511322', 'Yingshan', '106.5663700', '31.0774700');
INSERT INTO `sys_cn_area` VALUES ('2465', '蓬安县', '蓬安', '2459', null, '中国,四川省,南充市,蓬安县', '3', '637800', '0817', '511323', 'Peng\'an', '106.4126200', '31.0296400');
INSERT INTO `sys_cn_area` VALUES ('2466', '仪陇县', '仪陇', '2459', null, '中国,四川省,南充市,仪陇县', '3', '637600', '0817', '511324', 'Yilong', '106.2997400', '31.2762800');
INSERT INTO `sys_cn_area` VALUES ('2467', '西充县', '西充', '2459', null, '中国,四川省,南充市,西充县', '3', '637200', '0817', '511325', 'Xichong', '105.8999600', '30.9969000');
INSERT INTO `sys_cn_area` VALUES ('2468', '阆中市', '阆中', '2459', null, '中国,四川省,南充市,阆中市', '3', '637400', '0817', '511381', 'Langzhong', '106.0049400', '31.5583200');
INSERT INTO `sys_cn_area` VALUES ('2469', '眉山市', '眉山', '2368', null, '中国,四川省,眉山市', '2', '620020', '028', '511400', 'Meishan', '103.8317880', '30.0483180');
INSERT INTO `sys_cn_area` VALUES ('2470', '东坡区', '东坡', '2469', null, '中国,四川省,眉山市,东坡区', '3', '620010', '028', '511402', 'Dongpo', '103.8320000', '30.0421900');
INSERT INTO `sys_cn_area` VALUES ('2471', '彭山区', '彭山', '2469', null, '中国,四川省,眉山市,彭山区', '3', '620860', '028', '511403', 'Pengshan', '103.8726800', '30.1928300');
INSERT INTO `sys_cn_area` VALUES ('2472', '仁寿县', '仁寿', '2469', null, '中国,四川省,眉山市,仁寿县', '3', '620500', '028', '511421', 'Renshou', '104.1341200', '29.9959900');
INSERT INTO `sys_cn_area` VALUES ('2473', '洪雅县', '洪雅', '2469', null, '中国,四川省,眉山市,洪雅县', '3', '620360', '028', '511423', 'Hongya', '103.3731300', '29.9066100');
INSERT INTO `sys_cn_area` VALUES ('2474', '丹棱县', '丹棱', '2469', null, '中国,四川省,眉山市,丹棱县', '3', '620200', '028', '511424', 'Danling', '103.5133900', '30.0156200');
INSERT INTO `sys_cn_area` VALUES ('2475', '青神县', '青神', '2469', null, '中国,四川省,眉山市,青神县', '3', '620460', '028', '511425', 'Qingshen', '103.8477100', '29.8323500');
INSERT INTO `sys_cn_area` VALUES ('2476', '宜宾市', '宜宾', '2368', null, '中国,四川省,宜宾市', '2', '644000', '0831', '511500', 'Yibin', '104.6308250', '28.7601890');
INSERT INTO `sys_cn_area` VALUES ('2477', '翠屏区', '翠屏', '2476', null, '中国,四川省,宜宾市,翠屏区', '3', '644000', '0831', '511502', 'Cuiping', '104.6197800', '28.7656600');
INSERT INTO `sys_cn_area` VALUES ('2478', '南溪区', '南溪', '2476', null, '中国,四川省,宜宾市,南溪区', '3', '644100', '0831', '511503', 'Nanxi', '104.9811330', '28.8398060');
INSERT INTO `sys_cn_area` VALUES ('2479', '宜宾县', '宜宾', '2476', null, '中国,四川省,宜宾市,宜宾县', '3', '644600', '0831', '511521', 'Yibin', '104.5331400', '28.6899600');
INSERT INTO `sys_cn_area` VALUES ('2480', '江安县', '江安', '2476', null, '中国,四川省,宜宾市,江安县', '3', '644200', '0831', '511523', 'Jiang\'an', '105.0668300', '28.7238500');
INSERT INTO `sys_cn_area` VALUES ('2481', '长宁县', '长宁', '2476', null, '中国,四川省,宜宾市,长宁县', '3', '644300', '0831', '511524', 'Changning', '104.9252000', '28.5777700');
INSERT INTO `sys_cn_area` VALUES ('2482', '高县', '高县', '2476', null, '中国,四川省,宜宾市,高县', '3', '645150', '0831', '511525', 'Gaoxian', '104.5175400', '28.4361900');
INSERT INTO `sys_cn_area` VALUES ('2483', '珙县', '珙县', '2476', null, '中国,四川省,宜宾市,珙县', '3', '644500', '0831', '511526', 'Gongxian', '104.7139800', '28.4451200');
INSERT INTO `sys_cn_area` VALUES ('2484', '筠连县', '筠连', '2476', null, '中国,四川省,宜宾市,筠连县', '3', '645250', '0831', '511527', 'Junlian', '104.5121700', '28.1649500');
INSERT INTO `sys_cn_area` VALUES ('2485', '兴文县', '兴文', '2476', null, '中国,四川省,宜宾市,兴文县', '3', '644400', '0831', '511528', 'Xingwen', '105.2367500', '28.3044000');
INSERT INTO `sys_cn_area` VALUES ('2486', '屏山县', '屏山', '2476', null, '中国,四川省,宜宾市,屏山县', '3', '645350', '0831', '511529', 'Pingshan', '104.1629300', '28.6436900');
INSERT INTO `sys_cn_area` VALUES ('2487', '广安市', '广安', '2368', null, '中国,四川省,广安市', '2', '638000', '0826', '511600', 'Guang\'an', '106.6333690', '30.4563980');
INSERT INTO `sys_cn_area` VALUES ('2488', '广安区', '广安', '2487', null, '中国,四川省,广安市,广安区', '3', '638000', '0826', '511602', 'Guang\'an', '106.6416300', '30.4738900');
INSERT INTO `sys_cn_area` VALUES ('2489', '前锋区', '前锋', '2487', null, '中国,四川省,广安市,前锋区', '3', '638019', '0826', '511603', 'Qianfeng', '106.8935370', '30.4945720');
INSERT INTO `sys_cn_area` VALUES ('2490', '岳池县', '岳池', '2487', null, '中国,四川省,广安市,岳池县', '3', '638300', '0826', '511621', 'Yuechi', '106.4407900', '30.5391800');
INSERT INTO `sys_cn_area` VALUES ('2491', '武胜县', '武胜', '2487', null, '中国,四川省,广安市,武胜县', '3', '638400', '0826', '511622', 'Wusheng', '106.2959200', '30.3493200');
INSERT INTO `sys_cn_area` VALUES ('2492', '邻水县', '邻水', '2487', null, '中国,四川省,广安市,邻水县', '3', '638500', '0826', '511623', 'Linshui', '106.9296800', '30.3344900');
INSERT INTO `sys_cn_area` VALUES ('2493', '华蓥市', '华蓥', '2487', null, '中国,四川省,广安市,华蓥市', '3', '638600', '0826', '511681', 'Huaying', '106.7846600', '30.3900700');
INSERT INTO `sys_cn_area` VALUES ('2494', '达州市', '达州', '2368', null, '中国,四川省,达州市', '2', '635000', '0818', '511700', 'Dazhou', '107.5022620', '31.2094840');
INSERT INTO `sys_cn_area` VALUES ('2495', '通川区', '通川', '2494', null, '中国,四川省,达州市,通川区', '3', '635000', '0818', '511702', 'Tongchuan', '107.5045600', '31.2146900');
INSERT INTO `sys_cn_area` VALUES ('2496', '达川区', '达川', '2494', null, '中国,四川省,达州市,达川区', '3', '635000', '0818', '511703', 'Dachuan', '107.5022620', '31.2094840');
INSERT INTO `sys_cn_area` VALUES ('2497', '宣汉县', '宣汉', '2494', null, '中国,四川省,达州市,宣汉县', '3', '636150', '0818', '511722', 'Xuanhan', '107.7277500', '31.3551600');
INSERT INTO `sys_cn_area` VALUES ('2498', '开江县', '开江', '2494', null, '中国,四川省,达州市,开江县', '3', '636250', '0818', '511723', 'Kaijiang', '107.8688900', '31.0841000');
INSERT INTO `sys_cn_area` VALUES ('2499', '大竹县', '大竹', '2494', null, '中国,四川省,达州市,大竹县', '3', '635100', '0818', '511724', 'Dazhu', '107.2085500', '30.7414700');
INSERT INTO `sys_cn_area` VALUES ('2500', '渠县', '渠县', '2494', null, '中国,四川省,达州市,渠县', '3', '635200', '0818', '511725', 'Quxian', '106.9738100', '30.8376000');
INSERT INTO `sys_cn_area` VALUES ('2501', '万源市', '万源', '2494', null, '中国,四川省,达州市,万源市', '3', '636350', '0818', '511781', 'Wanyuan', '108.0359800', '32.0809100');
INSERT INTO `sys_cn_area` VALUES ('2502', '雅安市', '雅安', '2368', null, '中国,四川省,雅安市', '2', '625000', '0835', '511800', 'Ya\'an', '103.0010330', '29.9877220');
INSERT INTO `sys_cn_area` VALUES ('2503', '雨城区', '雨城', '2502', null, '中国,四川省,雅安市,雨城区', '3', '625000', '0835', '511802', 'Yucheng', '103.0330500', '30.0053100');
INSERT INTO `sys_cn_area` VALUES ('2504', '名山区', '名山', '2502', null, '中国,四川省,雅安市,名山区', '3', '625100', '0835', '511803', 'Mingshan', '103.1122140', '30.0847180');
INSERT INTO `sys_cn_area` VALUES ('2505', '荥经县', '荥经', '2502', null, '中国,四川省,雅安市,荥经县', '3', '625200', '0835', '511822', 'Yingjing', '102.8465200', '29.7940200');
INSERT INTO `sys_cn_area` VALUES ('2506', '汉源县', '汉源', '2502', null, '中国,四川省,雅安市,汉源县', '3', '625300', '0835', '511823', 'Hanyuan', '102.6784000', '29.3516800');
INSERT INTO `sys_cn_area` VALUES ('2507', '石棉县', '石棉', '2502', null, '中国,四川省,雅安市,石棉县', '3', '625400', '0835', '511824', 'Shimian', '102.3594300', '29.2279600');
INSERT INTO `sys_cn_area` VALUES ('2508', '天全县', '天全', '2502', null, '中国,四川省,雅安市,天全县', '3', '625500', '0835', '511825', 'Tianquan', '102.7590600', '30.0675400');
INSERT INTO `sys_cn_area` VALUES ('2509', '芦山县', '芦山', '2502', null, '中国,四川省,雅安市,芦山县', '3', '625600', '0835', '511826', 'Lushan', '102.9279100', '30.1436900');
INSERT INTO `sys_cn_area` VALUES ('2510', '宝兴县', '宝兴', '2502', null, '中国,四川省,雅安市,宝兴县', '3', '625700', '0835', '511827', 'Baoxing', '102.8155500', '30.3683600');
INSERT INTO `sys_cn_area` VALUES ('2511', '巴中市', '巴中', '2368', null, '中国,四川省,巴中市', '2', '636000', '0827', '511900', 'Bazhong', '106.7536690', '31.8588090');
INSERT INTO `sys_cn_area` VALUES ('2512', '巴州区', '巴州', '2511', null, '中国,四川省,巴中市,巴州区', '3', '636001', '0827', '511902', 'Bazhou', '106.7688900', '31.8512500');
INSERT INTO `sys_cn_area` VALUES ('2513', '恩阳区', '恩阳', '2511', null, '中国,四川省,巴中市,恩阳区', '3', '636064', '0827', '511903', 'Enyang', '106.7536690', '31.8588090');
INSERT INTO `sys_cn_area` VALUES ('2514', '通江县', '通江', '2511', null, '中国,四川省,巴中市,通江县', '3', '636700', '0827', '511921', 'Tongjiang', '107.2439800', '31.9129400');
INSERT INTO `sys_cn_area` VALUES ('2515', '南江县', '南江', '2511', null, '中国,四川省,巴中市,南江县', '3', '636600', '0827', '511922', 'Nanjiang', '106.8416400', '32.3533500');
INSERT INTO `sys_cn_area` VALUES ('2516', '平昌县', '平昌', '2511', null, '中国,四川省,巴中市,平昌县', '3', '636400', '0827', '511923', 'Pingchang', '107.1042400', '31.5594000');
INSERT INTO `sys_cn_area` VALUES ('2517', '资阳市', '资阳', '2368', null, '中国,四川省,资阳市', '2', '641300', '028', '512000', 'Ziyang', '104.6419170', '30.1222110');
INSERT INTO `sys_cn_area` VALUES ('2518', '雁江区', '雁江', '2517', null, '中国,四川省,资阳市,雁江区', '3', '641300', '028', '512002', 'Yanjiang', '104.6521600', '30.1152500');
INSERT INTO `sys_cn_area` VALUES ('2519', '安岳县', '安岳', '2517', null, '中国,四川省,资阳市,安岳县', '3', '642350', '028', '512021', 'Anyue', '105.3363000', '30.0978600');
INSERT INTO `sys_cn_area` VALUES ('2520', '乐至县', '乐至', '2517', null, '中国,四川省,资阳市,乐至县', '3', '641500', '028', '512022', 'Lezhi', '105.0320700', '30.2722700');
INSERT INTO `sys_cn_area` VALUES ('2521', '简阳市', '简阳', '2517', null, '中国,四川省,资阳市,简阳市', '3', '641400', '028', '512081', 'Jianyang', '104.5486400', '30.3904000');
INSERT INTO `sys_cn_area` VALUES ('2522', '阿坝藏族羌族自治州', '阿坝', '2368', null, '中国,四川省,阿坝藏族羌族自治州', '2', '624000', '0837', '513200', 'Aba', '102.2213740', '31.8997920');
INSERT INTO `sys_cn_area` VALUES ('2523', '汶川县', '汶川', '2522', null, '中国,四川省,阿坝藏族羌族自治州,汶川县', '3', '623000', '0837', '513221', 'Wenchuan', '103.5907900', '31.4732600');
INSERT INTO `sys_cn_area` VALUES ('2524', '理县', '理县', '2522', null, '中国,四川省,阿坝藏族羌族自治州,理县', '3', '623100', '0837', '513222', 'Lixian', '103.1717500', '31.4360300');
INSERT INTO `sys_cn_area` VALUES ('2525', '茂县', '茂县', '2522', null, '中国,四川省,阿坝藏族羌族自治州,茂县', '3', '623200', '0837', '513223', 'Maoxian', '103.8537200', '31.6820000');
INSERT INTO `sys_cn_area` VALUES ('2526', '松潘县', '松潘', '2522', null, '中国,四川省,阿坝藏族羌族自治州,松潘县', '3', '623300', '0837', '513224', 'Songpan', '103.5992400', '32.6387100');
INSERT INTO `sys_cn_area` VALUES ('2527', '九寨沟县', '九寨沟', '2522', null, '中国,四川省,阿坝藏族羌族自治州,九寨沟县', '3', '623400', '0837', '513225', 'Jiuzhaigou', '104.2367200', '33.2631800');
INSERT INTO `sys_cn_area` VALUES ('2528', '金川县', '金川', '2522', null, '中国,四川省,阿坝藏族羌族自治州,金川县', '3', '624100', '0837', '513226', 'Jinchuan', '102.0655500', '31.4762300');
INSERT INTO `sys_cn_area` VALUES ('2529', '小金县', '小金', '2522', null, '中国,四川省,阿坝藏族羌族自治州,小金县', '3', '624200', '0837', '513227', 'Xiaojin', '102.3649900', '30.9993400');
INSERT INTO `sys_cn_area` VALUES ('2530', '黑水县', '黑水', '2522', null, '中国,四川省,阿坝藏族羌族自治州,黑水县', '3', '623500', '0837', '513228', 'Heishui', '102.9917600', '32.0618400');
INSERT INTO `sys_cn_area` VALUES ('2531', '马尔康县', '马尔康', '2522', null, '中国,四川省,阿坝藏族羌族自治州,马尔康县', '3', '624000', '0837', '513229', 'Maerkang', '102.2062500', '31.9058400');
INSERT INTO `sys_cn_area` VALUES ('2532', '壤塘县', '壤塘', '2522', null, '中国,四川省,阿坝藏族羌族自治州,壤塘县', '3', '624300', '0837', '513230', 'Rangtang', '100.9783000', '32.2657800');
INSERT INTO `sys_cn_area` VALUES ('2533', '阿坝县', '阿坝', '2522', null, '中国,四川省,阿坝藏族羌族自治州,阿坝县', '3', '624600', '0837', '513231', 'Aba', '101.7063200', '32.9030100');
INSERT INTO `sys_cn_area` VALUES ('2534', '若尔盖县', '若尔盖', '2522', null, '中国,四川省,阿坝藏族羌族自治州,若尔盖县', '3', '624500', '0837', '513232', 'Ruoergai', '102.9598000', '33.5743200');
INSERT INTO `sys_cn_area` VALUES ('2535', '红原县', '红原', '2522', null, '中国,四川省,阿坝藏族羌族自治州,红原县', '3', '624400', '0837', '513233', 'Hongyuan', '102.5452500', '32.7898900');
INSERT INTO `sys_cn_area` VALUES ('2536', '甘孜藏族自治州', '甘孜', '2368', null, '中国,四川省,甘孜藏族自治州', '2', '626000', '0836', '513300', 'Garze', '101.9638150', '30.0506630');
INSERT INTO `sys_cn_area` VALUES ('2537', '康定县', '康定', '2536', null, '中国,四川省,甘孜藏族自治州,康定县', '3', '626000', '0836', '513321', 'Kangding', '101.9648700', '30.0553200');
INSERT INTO `sys_cn_area` VALUES ('2538', '泸定县', '泸定', '2536', null, '中国,四川省,甘孜藏族自治州,泸定县', '3', '626100', '0836', '513322', 'Luding', '102.2350700', '29.9147500');
INSERT INTO `sys_cn_area` VALUES ('2539', '丹巴县', '丹巴', '2536', null, '中国,四川省,甘孜藏族自治州,丹巴县', '3', '626300', '0836', '513323', 'Danba', '101.8842400', '30.8765600');
INSERT INTO `sys_cn_area` VALUES ('2540', '九龙县', '九龙', '2536', null, '中国,四川省,甘孜藏族自治州,九龙县', '3', '626200', '0836', '513324', 'Jiulong', '101.5084800', '29.0009100');
INSERT INTO `sys_cn_area` VALUES ('2541', '雅江县', '雅江', '2536', null, '中国,四川省,甘孜藏族自治州,雅江县', '3', '627450', '0836', '513325', 'Yajiang', '101.0149200', '30.0328100');
INSERT INTO `sys_cn_area` VALUES ('2542', '道孚县', '道孚', '2536', null, '中国,四川省,甘孜藏族自治州,道孚县', '3', '626400', '0836', '513326', 'Daofu', '101.1255400', '30.9804600');
INSERT INTO `sys_cn_area` VALUES ('2543', '炉霍县', '炉霍', '2536', null, '中国,四川省,甘孜藏族自治州,炉霍县', '3', '626500', '0836', '513327', 'Luhuo', '100.6768100', '31.3917000');
INSERT INTO `sys_cn_area` VALUES ('2544', '甘孜县', '甘孜', '2536', null, '中国,四川省,甘孜藏族自治州,甘孜县', '3', '626700', '0836', '513328', 'Ganzi', '99.9930700', '31.6267200');
INSERT INTO `sys_cn_area` VALUES ('2545', '新龙县', '新龙', '2536', null, '中国,四川省,甘孜藏族自治州,新龙县', '3', '626800', '0836', '513329', 'Xinlong', '100.3125000', '30.9406700');
INSERT INTO `sys_cn_area` VALUES ('2546', '德格县', '德格', '2536', null, '中国,四川省,甘孜藏族自治州,德格县', '3', '627250', '0836', '513330', 'Dege', '98.5807800', '31.8061500');
INSERT INTO `sys_cn_area` VALUES ('2547', '白玉县', '白玉', '2536', null, '中国,四川省,甘孜藏族自治州,白玉县', '3', '627150', '0836', '513331', 'Baiyu', '98.8256800', '31.2090200');
INSERT INTO `sys_cn_area` VALUES ('2548', '石渠县', '石渠', '2536', null, '中国,四川省,甘孜藏族自治州,石渠县', '3', '627350', '0836', '513332', 'Shiqu', '98.1015600', '32.9788400');
INSERT INTO `sys_cn_area` VALUES ('2549', '色达县', '色达', '2536', null, '中国,四川省,甘孜藏族自治州,色达县', '3', '626600', '0836', '513333', 'Seda', '100.3322400', '32.2683900');
INSERT INTO `sys_cn_area` VALUES ('2550', '理塘县', '理塘', '2536', null, '中国,四川省,甘孜藏族自治州,理塘县', '3', '627550', '0836', '513334', 'Litang', '100.2700500', '29.9967400');
INSERT INTO `sys_cn_area` VALUES ('2551', '巴塘县', '巴塘', '2536', null, '中国,四川省,甘孜藏族自治州,巴塘县', '3', '627650', '0836', '513335', 'Batang', '99.1040900', '30.0042300');
INSERT INTO `sys_cn_area` VALUES ('2552', '乡城县', '乡城', '2536', null, '中国,四川省,甘孜藏族自治州,乡城县', '3', '627850', '0836', '513336', 'Xiangcheng', '99.7994300', '28.9355400');
INSERT INTO `sys_cn_area` VALUES ('2553', '稻城县', '稻城', '2536', null, '中国,四川省,甘孜藏族自治州,稻城县', '3', '627750', '0836', '513337', 'Daocheng', '100.2980900', '29.0379000');
INSERT INTO `sys_cn_area` VALUES ('2554', '得荣县', '得荣', '2536', null, '中国,四川省,甘孜藏族自治州,得荣县', '3', '627950', '0836', '513338', 'Derong', '99.2862800', '28.7129700');
INSERT INTO `sys_cn_area` VALUES ('2555', '凉山彝族自治州', '凉山', '2368', null, '中国,四川省,凉山彝族自治州', '2', '615000', '0834', '513400', 'Liangshan', '102.2587460', '27.8867620');
INSERT INTO `sys_cn_area` VALUES ('2556', '西昌市', '西昌', '2555', null, '中国,四川省,凉山彝族自治州,西昌市', '3', '615000', '0835', '513401', 'Xichang', '102.2641300', '27.8952400');
INSERT INTO `sys_cn_area` VALUES ('2557', '木里藏族自治县', '木里', '2555', null, '中国,四川省,凉山彝族自治州,木里藏族自治县', '3', '615800', '0851', '513422', 'Muli', '101.2796000', '27.9287500');
INSERT INTO `sys_cn_area` VALUES ('2558', '盐源县', '盐源', '2555', null, '中国,四川省,凉山彝族自治州,盐源县', '3', '615700', '0836', '513423', 'Yanyuan', '101.5097000', '27.4217700');
INSERT INTO `sys_cn_area` VALUES ('2559', '德昌县', '德昌', '2555', null, '中国,四川省,凉山彝族自治州,德昌县', '3', '615500', '0837', '513424', 'Dechang', '102.1801700', '27.4048200');
INSERT INTO `sys_cn_area` VALUES ('2560', '会理县', '会理', '2555', null, '中国,四川省,凉山彝族自治州,会理县', '3', '615100', '0838', '513425', 'Huili', '102.2453900', '26.6562700');
INSERT INTO `sys_cn_area` VALUES ('2561', '会东县', '会东', '2555', null, '中国,四川省,凉山彝族自治州,会东县', '3', '615200', '0839', '513426', 'Huidong', '102.5781500', '26.6342900');
INSERT INTO `sys_cn_area` VALUES ('2562', '宁南县', '宁南', '2555', null, '中国,四川省,凉山彝族自治州,宁南县', '3', '615400', '0840', '513427', 'Ningnan', '102.7611600', '27.0656700');
INSERT INTO `sys_cn_area` VALUES ('2563', '普格县', '普格', '2555', null, '中国,四川省,凉山彝族自治州,普格县', '3', '615300', '0841', '513428', 'Puge', '102.5405500', '27.3748500');
INSERT INTO `sys_cn_area` VALUES ('2564', '布拖县', '布拖', '2555', null, '中国,四川省,凉山彝族自治州,布拖县', '3', '616350', '0842', '513429', 'Butuo', '102.8123400', '27.7079000');
INSERT INTO `sys_cn_area` VALUES ('2565', '金阳县', '金阳', '2555', null, '中国,四川省,凉山彝族自治州,金阳县', '3', '616250', '0843', '513430', 'Jinyang', '103.2477400', '27.6969800');
INSERT INTO `sys_cn_area` VALUES ('2566', '昭觉县', '昭觉', '2555', null, '中国,四川省,凉山彝族自治州,昭觉县', '3', '616150', '0844', '513431', 'Zhaojue', '102.8466100', '28.0115500');
INSERT INTO `sys_cn_area` VALUES ('2567', '喜德县', '喜德', '2555', null, '中国,四川省,凉山彝族自治州,喜德县', '3', '616750', '0845', '513432', 'Xide', '102.4133600', '28.3073900');
INSERT INTO `sys_cn_area` VALUES ('2568', '冕宁县', '冕宁', '2555', null, '中国,四川省,凉山彝族自治州,冕宁县', '3', '615600', '0846', '513433', 'Mianning', '102.1710800', '28.5516100');
INSERT INTO `sys_cn_area` VALUES ('2569', '越西县', '越西', '2555', null, '中国,四川省,凉山彝族自治州,越西县', '3', '616650', '0847', '513434', 'Yuexi', '102.5079000', '28.6413300');
INSERT INTO `sys_cn_area` VALUES ('2570', '甘洛县', '甘洛', '2555', null, '中国,四川省,凉山彝族自治州,甘洛县', '3', '616850', '0848', '513435', 'Ganluo', '102.7715400', '28.9662400');
INSERT INTO `sys_cn_area` VALUES ('2571', '美姑县', '美姑', '2555', null, '中国,四川省,凉山彝族自治州,美姑县', '3', '616450', '0849', '513436', 'Meigu', '103.1311600', '28.3259600');
INSERT INTO `sys_cn_area` VALUES ('2572', '雷波县', '雷波', '2555', null, '中国,四川省,凉山彝族自治州,雷波县', '3', '616550', '0850', '513437', 'Leibo', '103.5728700', '28.2640700');
INSERT INTO `sys_cn_area` VALUES ('2573', '贵州省', '贵州', '1', null, '中国,贵州省', '1', null, '', '520000', 'Guizhou', '106.7134780', '26.5783430');
INSERT INTO `sys_cn_area` VALUES ('2574', '贵阳市', '贵阳', '2573', null, '中国,贵州省,贵阳市', '2', '550001', '0851', '520100', 'Guiyang', '106.7134780', '26.5783430');
INSERT INTO `sys_cn_area` VALUES ('2575', '南明区', '南明', '2574', null, '中国,贵州省,贵阳市,南明区', '3', '550001', '0851', '520102', 'Nanming', '106.7145000', '26.5681900');
INSERT INTO `sys_cn_area` VALUES ('2576', '云岩区', '云岩', '2574', null, '中国,贵州省,贵阳市,云岩区', '3', '550001', '0851', '520103', 'Yunyan', '106.7248500', '26.6048400');
INSERT INTO `sys_cn_area` VALUES ('2577', '花溪区', '花溪', '2574', null, '中国,贵州省,贵阳市,花溪区', '3', '550025', '0851', '520111', 'Huaxi', '106.6768800', '26.4334300');
INSERT INTO `sys_cn_area` VALUES ('2578', '乌当区', '乌当', '2574', null, '中国,贵州省,贵阳市,乌当区', '3', '550018', '0851', '520112', 'Wudang', '106.7521000', '26.6302000');
INSERT INTO `sys_cn_area` VALUES ('2579', '白云区', '白云', '2574', null, '中国,贵州省,贵阳市,白云区', '3', '550014', '0851', '520113', 'Baiyun', '106.6308800', '26.6828400');
INSERT INTO `sys_cn_area` VALUES ('2580', '观山湖区', '观山湖', '2574', null, '中国,贵州省,贵阳市,观山湖区', '3', '550009', '0851', '520115', 'Guanshanhu', '106.6254420', '26.6182090');
INSERT INTO `sys_cn_area` VALUES ('2581', '开阳县', '开阳', '2574', null, '中国,贵州省,贵阳市,开阳县', '3', '550300', '0851', '520121', 'Kaiyang', '106.9692000', '27.0553300');
INSERT INTO `sys_cn_area` VALUES ('2582', '息烽县', '息烽', '2574', null, '中国,贵州省,贵阳市,息烽县', '3', '551100', '0851', '520122', 'Xifeng', '106.7380000', '27.0934600');
INSERT INTO `sys_cn_area` VALUES ('2583', '修文县', '修文', '2574', null, '中国,贵州省,贵阳市,修文县', '3', '550200', '0851', '520123', 'Xiuwen', '106.5948700', '26.8378300');
INSERT INTO `sys_cn_area` VALUES ('2584', '清镇市', '清镇', '2574', null, '中国,贵州省,贵阳市,清镇市', '3', '551400', '0851', '520181', 'Qingzhen', '106.4686200', '26.5526100');
INSERT INTO `sys_cn_area` VALUES ('2585', '六盘水市', '六盘水', '2573', null, '中国,贵州省,六盘水市', '2', '553400', '0858', '520200', 'Liupanshui', '104.8467430', '26.5846430');
INSERT INTO `sys_cn_area` VALUES ('2586', '钟山区', '钟山', '2585', null, '中国,贵州省,六盘水市,钟山区', '3', '553000', '0858', '520201', 'Zhongshan', '104.8784800', '26.5769900');
INSERT INTO `sys_cn_area` VALUES ('2587', '六枝特区', '六枝', '2585', null, '中国,贵州省,六盘水市,六枝特区', '3', '553400', '0858', '520203', 'Liuzhi', '105.4806200', '26.2011700');
INSERT INTO `sys_cn_area` VALUES ('2588', '水城县', '水城', '2585', null, '中国,贵州省,六盘水市,水城县', '3', '553000', '0858', '520221', 'Shuicheng', '104.9576400', '26.5478500');
INSERT INTO `sys_cn_area` VALUES ('2589', '盘县', '盘县', '2585', null, '中国,贵州省,六盘水市,盘县', '3', '561601', '0858', '520222', 'Panxian', '104.4706100', '25.7136000');
INSERT INTO `sys_cn_area` VALUES ('2590', '遵义市', '遵义', '2573', null, '中国,贵州省,遵义市', '2', '563000', '0852', '520300', 'Zunyi', '106.9372650', '27.7066260');
INSERT INTO `sys_cn_area` VALUES ('2591', '红花岗区', '红花岗', '2590', null, '中国,贵州省,遵义市,红花岗区', '3', '563000', '0852', '520302', 'Honghuagang', '106.8940400', '27.6447100');
INSERT INTO `sys_cn_area` VALUES ('2592', '汇川区', '汇川', '2590', null, '中国,贵州省,遵义市,汇川区', '3', '563000', '0852', '520303', 'Huichuan', '106.9393000', '27.7062500');
INSERT INTO `sys_cn_area` VALUES ('2593', '遵义县', '遵义', '2590', null, '中国,贵州省,遵义市,遵义县', '3', '563100', '0852', '520321', 'Zunyi', '106.8333100', '27.5377200');
INSERT INTO `sys_cn_area` VALUES ('2594', '桐梓县', '桐梓', '2590', null, '中国,贵州省,遵义市,桐梓县', '3', '563200', '0852', '520322', 'Tongzi', '106.8256800', '28.1380600');
INSERT INTO `sys_cn_area` VALUES ('2595', '绥阳县', '绥阳', '2590', null, '中国,贵州省,遵义市,绥阳县', '3', '563300', '0852', '520323', 'Suiyang', '107.1906400', '27.9470200');
INSERT INTO `sys_cn_area` VALUES ('2596', '正安县', '正安', '2590', null, '中国,贵州省,遵义市,正安县', '3', '563400', '0852', '520324', 'Zheng\'an', '107.4435700', '28.5512000');
INSERT INTO `sys_cn_area` VALUES ('2597', '道真仡佬族苗族自治县', '道真', '2590', null, '中国,贵州省,遵义市,道真仡佬族苗族自治县', '3', '563500', '0852', '520325', 'Daozhen', '107.6115200', '28.8640000');
INSERT INTO `sys_cn_area` VALUES ('2598', '务川仡佬族苗族自治县', '务川', '2590', null, '中国,贵州省,遵义市,务川仡佬族苗族自治县', '3', '564300', '0852', '520326', 'Wuchuan', '107.8893500', '28.5222700');
INSERT INTO `sys_cn_area` VALUES ('2599', '凤冈县', '凤冈', '2590', null, '中国,贵州省,遵义市,凤冈县', '3', '564200', '0852', '520327', 'Fenggang', '107.7168200', '27.9546100');
INSERT INTO `sys_cn_area` VALUES ('2600', '湄潭县', '湄潭', '2590', null, '中国,贵州省,遵义市,湄潭县', '3', '564100', '0852', '520328', 'Meitan', '107.4877900', '27.7667600');
INSERT INTO `sys_cn_area` VALUES ('2601', '余庆县', '余庆', '2590', null, '中国,贵州省,遵义市,余庆县', '3', '564400', '0852', '520329', 'Yuqing', '107.8882100', '27.2253200');
INSERT INTO `sys_cn_area` VALUES ('2602', '习水县', '习水', '2590', null, '中国,贵州省,遵义市,习水县', '3', '564600', '0852', '520330', 'Xishui', '106.2126700', '28.3197600');
INSERT INTO `sys_cn_area` VALUES ('2603', '赤水市', '赤水', '2590', null, '中国,贵州省,遵义市,赤水市', '3', '564700', '0852', '520381', 'Chishui', '105.6984500', '28.5892100');
INSERT INTO `sys_cn_area` VALUES ('2604', '仁怀市', '仁怀', '2590', null, '中国,贵州省,遵义市,仁怀市', '3', '564500', '0852', '520382', 'Renhuai', '106.4015200', '27.7923100');
INSERT INTO `sys_cn_area` VALUES ('2605', '安顺市', '安顺', '2573', null, '中国,贵州省,安顺市', '2', '561000', '0853', '520400', 'Anshun', '105.9321880', '26.2455440');
INSERT INTO `sys_cn_area` VALUES ('2606', '西秀区', '西秀', '2605', null, '中国,贵州省,安顺市,西秀区', '3', '561000', '0853', '520402', 'Xixiu', '105.9658500', '26.2449100');
INSERT INTO `sys_cn_area` VALUES ('2607', '平坝区', '平坝', '2605', null, '中国,贵州省,安顺市,平坝区', '3', '561100', '0853', '520421', 'Pingba', '106.2568300', '26.4054300');
INSERT INTO `sys_cn_area` VALUES ('2608', '普定县', '普定', '2605', null, '中国,贵州省,安顺市,普定县', '3', '562100', '0853', '520422', 'Puding', '105.7428500', '26.3014100');
INSERT INTO `sys_cn_area` VALUES ('2609', '镇宁布依族苗族自治县', '镇宁', '2605', null, '中国,贵州省,安顺市,镇宁布依族苗族自治县', '3', '561200', '0853', '520423', 'Zhenning', '105.7651300', '26.0553300');
INSERT INTO `sys_cn_area` VALUES ('2610', '关岭布依族苗族自治县', '关岭', '2605', null, '中国,贵州省,安顺市,关岭布依族苗族自治县', '3', '561300', '0853', '520424', 'Guanling', '105.6188300', '25.9424800');
INSERT INTO `sys_cn_area` VALUES ('2611', '紫云苗族布依族自治县', '紫云', '2605', null, '中国,贵州省,安顺市,紫云苗族布依族自治县', '3', '550800', '0853', '520425', 'Ziyun', '106.0836400', '25.7525800');
INSERT INTO `sys_cn_area` VALUES ('2612', '毕节市', '毕节', '2573', null, '中国,贵州省,毕节市', '2', '551700', '0857', '520500', 'Bijie', '105.2850100', '27.3016930');
INSERT INTO `sys_cn_area` VALUES ('2613', '七星关区', '七星关', '2612', null, '中国,贵州省,毕节市,七星关区', '3', '551700', '0857', '520502', 'Qixingguan', '104.9497000', '27.1535560');
INSERT INTO `sys_cn_area` VALUES ('2614', '大方县', '大方', '2612', null, '中国,贵州省,毕节市,大方县', '3', '551600', '0857', '520521', 'Dafang', '105.6092540', '27.1435210');
INSERT INTO `sys_cn_area` VALUES ('2615', '黔西县', '黔西', '2612', null, '中国,贵州省,毕节市,黔西县', '3', '551500', '0857', '520522', 'Qianxi', '106.0382990', '27.0249230');
INSERT INTO `sys_cn_area` VALUES ('2616', '金沙县', '金沙', '2612', null, '中国,贵州省,毕节市,金沙县', '3', '551800', '0857', '520523', 'Jinsha', '106.2221030', '27.4596930');
INSERT INTO `sys_cn_area` VALUES ('2617', '织金县', '织金', '2612', null, '中国,贵州省,毕节市,织金县', '3', '552100', '0857', '520524', 'Zhijin', '105.7689970', '26.6684970');
INSERT INTO `sys_cn_area` VALUES ('2618', '纳雍县', '纳雍', '2612', null, '中国,贵州省,毕节市,纳雍县', '3', '553300', '0857', '520525', 'Nayong', '105.3753220', '26.7698750');
INSERT INTO `sys_cn_area` VALUES ('2619', '威宁彝族回族苗族自治县', '威宁', '2612', null, '中国,贵州省,毕节市,威宁彝族回族苗族自治县', '3', '553100', '0857', '520526', 'Weining', '104.2865230', '26.8590990');
INSERT INTO `sys_cn_area` VALUES ('2620', '赫章县', '赫章', '2612', null, '中国,贵州省,毕节市,赫章县', '3', '553200', '0857', '520527', 'Hezhang', '104.7264380', '27.1192430');
INSERT INTO `sys_cn_area` VALUES ('2621', '铜仁市', '铜仁', '2573', null, '中国,贵州省,铜仁市', '2', '554300', '0856', '520600', 'Tongren', '109.1915550', '27.7183460');
INSERT INTO `sys_cn_area` VALUES ('2622', '碧江区', '碧江', '2621', null, '中国,贵州省,铜仁市,碧江区', '3', '554300', '0856', '520602', 'Bijiang', '109.1915550', '27.7183460');
INSERT INTO `sys_cn_area` VALUES ('2623', '万山区', '万山', '2621', null, '中国,贵州省,铜仁市,万山区', '3', '554200', '0856', '520603', 'Wanshan', '109.2119900', '27.5190300');
INSERT INTO `sys_cn_area` VALUES ('2624', '江口县', '江口', '2621', null, '中国,贵州省,铜仁市,江口县', '3', '554400', '0856', '520621', 'Jiangkou', '108.8484270', '27.6919040');
INSERT INTO `sys_cn_area` VALUES ('2625', '玉屏侗族自治县', '玉屏', '2621', null, '中国,贵州省,铜仁市,玉屏侗族自治县', '3', '554004', '0856', '520622', 'Yuping', '108.9178820', '27.2380240');
INSERT INTO `sys_cn_area` VALUES ('2626', '石阡县', '石阡', '2621', null, '中国,贵州省,铜仁市,石阡县', '3', '555100', '0856', '520623', 'Shiqian', '108.2298540', '27.5193860');
INSERT INTO `sys_cn_area` VALUES ('2627', '思南县', '思南', '2621', null, '中国,贵州省,铜仁市,思南县', '3', '565100', '0856', '520624', 'Sinan', '108.2558270', '27.9413310');
INSERT INTO `sys_cn_area` VALUES ('2628', '印江土家族苗族自治县', '印江', '2621', null, '中国,贵州省,铜仁市,印江土家族苗族自治县', '3', '555200', '0856', '520625', 'Yinjiang', '108.4055170', '27.9979760');
INSERT INTO `sys_cn_area` VALUES ('2629', '德江县', '德江', '2621', null, '中国,贵州省,铜仁市,德江县', '3', '565200', '0856', '520626', 'Dejiang', '108.1173170', '28.2609400');
INSERT INTO `sys_cn_area` VALUES ('2630', '沿河土家族自治县', '沿河', '2621', null, '中国,贵州省,铜仁市,沿河土家族自治县', '3', '565300', '0856', '520627', 'Yuanhe', '108.4957460', '28.5604870');
INSERT INTO `sys_cn_area` VALUES ('2631', '松桃苗族自治县', '松桃', '2621', null, '中国,贵州省,铜仁市,松桃苗族自治县', '3', '554100', '0856', '520628', 'Songtao', '109.2026270', '28.1654190');
INSERT INTO `sys_cn_area` VALUES ('2632', '黔西南布依族苗族自治州', '黔西南', '2573', null, '中国,贵州省,黔西南布依族苗族自治州', '2', '562400', '0859', '522300', 'Qianxinan', '104.8979710', '25.0881200');
INSERT INTO `sys_cn_area` VALUES ('2633', '兴义市 ', '兴义', '2632', null, '中国,贵州省,黔西南布依族苗族自治州,兴义市 ', '3', '562400', '0859', '522301', 'Xingyi', '104.8954800', '25.0920500');
INSERT INTO `sys_cn_area` VALUES ('2634', '兴仁县', '兴仁', '2632', null, '中国,贵州省,黔西南布依族苗族自治州,兴仁县', '3', '562300', '0859', '522322', 'Xingren', '105.1865200', '25.4328200');
INSERT INTO `sys_cn_area` VALUES ('2635', '普安县', '普安', '2632', null, '中国,贵州省,黔西南布依族苗族自治州,普安县', '3', '561500', '0859', '522323', 'Pu\'an', '104.9552900', '25.7860300');
INSERT INTO `sys_cn_area` VALUES ('2636', '晴隆县', '晴隆', '2632', null, '中国,贵州省,黔西南布依族苗族自治州,晴隆县', '3', '561400', '0859', '522324', 'Qinglong', '105.2192000', '25.8352200');
INSERT INTO `sys_cn_area` VALUES ('2637', '贞丰县', '贞丰', '2632', null, '中国,贵州省,黔西南布依族苗族自治州,贞丰县', '3', '562200', '0859', '522325', 'Zhenfeng', '105.6545400', '25.3846400');
INSERT INTO `sys_cn_area` VALUES ('2638', '望谟县', '望谟', '2632', null, '中国,贵州省,黔西南布依族苗族自治州,望谟县', '3', '552300', '0859', '522326', 'Wangmo', '106.0995700', '25.1782200');
INSERT INTO `sys_cn_area` VALUES ('2639', '册亨县', '册亨', '2632', null, '中国,贵州省,黔西南布依族苗族自治州,册亨县', '3', '552200', '0859', '522327', 'Ceheng', '105.8124000', '24.9837600');
INSERT INTO `sys_cn_area` VALUES ('2640', '安龙县', '安龙', '2632', null, '中国,贵州省,黔西南布依族苗族自治州,安龙县', '3', '552400', '0859', '522328', 'Anlong', '105.4426800', '25.0981800');
INSERT INTO `sys_cn_area` VALUES ('2641', '黔东南苗族侗族自治州', '黔东南', '2573', null, '中国,贵州省,黔东南苗族侗族自治州', '2', '556000', '0855', '522600', 'Qiandongnan', '107.9774880', '26.5833520');
INSERT INTO `sys_cn_area` VALUES ('2642', '凯里市', '凯里', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,凯里市', '3', '556000', '0855', '522601', 'Kaili', '107.9813200', '26.5668900');
INSERT INTO `sys_cn_area` VALUES ('2643', '黄平县', '黄平', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,黄平县', '3', '556100', '0855', '522622', 'Huangping', '107.9017900', '26.8957300');
INSERT INTO `sys_cn_area` VALUES ('2644', '施秉县', '施秉', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,施秉县', '3', '556200', '0855', '522623', 'Shibing', '108.1259700', '27.0349500');
INSERT INTO `sys_cn_area` VALUES ('2645', '三穗县', '三穗', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,三穗县', '3', '556500', '0855', '522624', 'Sansui', '108.6713200', '26.9476500');
INSERT INTO `sys_cn_area` VALUES ('2646', '镇远县', '镇远', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,镇远县', '3', '557700', '0855', '522625', 'Zhenyuan', '108.4272100', '27.0493300');
INSERT INTO `sys_cn_area` VALUES ('2647', '岑巩县', '岑巩', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,岑巩县', '3', '557800', '0855', '522626', 'Cengong', '108.8188400', '27.1753900');
INSERT INTO `sys_cn_area` VALUES ('2648', '天柱县', '天柱', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,天柱县', '3', '556600', '0855', '522627', 'Tianzhu', '109.2071800', '26.9078100');
INSERT INTO `sys_cn_area` VALUES ('2649', '锦屏县', '锦屏', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,锦屏县', '3', '556700', '0855', '522628', 'Jinping', '109.1998200', '26.6763500');
INSERT INTO `sys_cn_area` VALUES ('2650', '剑河县', '剑河', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,剑河县', '3', '556400', '0855', '522629', 'Jianhe', '108.5913000', '26.6525000');
INSERT INTO `sys_cn_area` VALUES ('2651', '台江县', '台江', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,台江县', '3', '556300', '0855', '522630', 'Taijiang', '108.3181400', '26.6691600');
INSERT INTO `sys_cn_area` VALUES ('2652', '黎平县', '黎平', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,黎平县', '3', '557300', '0855', '522631', 'Liping', '109.1360700', '26.2311400');
INSERT INTO `sys_cn_area` VALUES ('2653', '榕江县', '榕江', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,榕江县', '3', '557200', '0855', '522632', 'Rongjiang', '108.5207200', '25.9242100');
INSERT INTO `sys_cn_area` VALUES ('2654', '从江县', '从江', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,从江县', '3', '557400', '0855', '522633', 'Congjiang', '108.9052700', '25.7541500');
INSERT INTO `sys_cn_area` VALUES ('2655', '雷山县', '雷山', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,雷山县', '3', '557100', '0855', '522634', 'Leishan', '108.0774500', '26.3838500');
INSERT INTO `sys_cn_area` VALUES ('2656', '麻江县', '麻江', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,麻江县', '3', '557600', '0855', '522635', 'Majiang', '107.5915500', '26.4923500');
INSERT INTO `sys_cn_area` VALUES ('2657', '丹寨县', '丹寨', '2641', null, '中国,贵州省,黔东南苗族侗族自治州,丹寨县', '3', '557500', '0855', '522636', 'Danzhai', '107.7971800', '26.1981600');
INSERT INTO `sys_cn_area` VALUES ('2658', '黔南布依族苗族自治州', '黔南', '2573', null, '中国,贵州省,黔南布依族苗族自治州', '2', '558000', '0854', '522700', 'Qiannan', '107.5171560', '26.2582190');
INSERT INTO `sys_cn_area` VALUES ('2659', '都匀市', '都匀', '2658', null, '中国,贵州省,黔南布依族苗族自治州,都匀市', '3', '558000', '0854', '522701', 'Duyun', '107.5187200', '26.2594000');
INSERT INTO `sys_cn_area` VALUES ('2660', '福泉市', '福泉', '2658', null, '中国,贵州省,黔南布依族苗族自治州,福泉市', '3', '550500', '0854', '522702', 'Fuquan', '107.5171500', '26.6798900');
INSERT INTO `sys_cn_area` VALUES ('2661', '荔波县', '荔波', '2658', null, '中国,贵州省,黔南布依族苗族自治州,荔波县', '3', '558400', '0854', '522722', 'Libo', '107.8859200', '25.4139000');
INSERT INTO `sys_cn_area` VALUES ('2662', '贵定县', '贵定', '2658', null, '中国,贵州省,黔南布依族苗族自治州,贵定县', '3', '551300', '0854', '522723', 'Guiding', '107.2365400', '26.5781200');
INSERT INTO `sys_cn_area` VALUES ('2663', '瓮安县', '瓮安', '2658', null, '中国,贵州省,黔南布依族苗族自治州,瓮安县', '3', '550400', '0854', '522725', 'Weng\'an', '107.4757000', '27.0681300');
INSERT INTO `sys_cn_area` VALUES ('2664', '独山县', '独山', '2658', null, '中国,贵州省,黔南布依族苗族自治州,独山县', '3', '558200', '0854', '522726', 'Dushan', '107.5410100', '25.8245000');
INSERT INTO `sys_cn_area` VALUES ('2665', '平塘县', '平塘', '2658', null, '中国,贵州省,黔南布依族苗族自治州,平塘县', '3', '558300', '0854', '522727', 'Pingtang', '107.3242800', '25.8329400');
INSERT INTO `sys_cn_area` VALUES ('2666', '罗甸县', '罗甸', '2658', null, '中国,贵州省,黔南布依族苗族自治州,罗甸县', '3', '550100', '0854', '522728', 'Luodian', '106.7518600', '25.4258600');
INSERT INTO `sys_cn_area` VALUES ('2667', '长顺县', '长顺', '2658', null, '中国,贵州省,黔南布依族苗族自治州,长顺县', '3', '550700', '0854', '522729', 'Changshun', '106.4521700', '26.0229900');
INSERT INTO `sys_cn_area` VALUES ('2668', '龙里县', '龙里', '2658', null, '中国,贵州省,黔南布依族苗族自治州,龙里县', '3', '551200', '0854', '522730', 'Longli', '106.9766200', '26.4507600');
INSERT INTO `sys_cn_area` VALUES ('2669', '惠水县', '惠水', '2658', null, '中国,贵州省,黔南布依族苗族自治州,惠水县', '3', '550600', '0854', '522731', 'Huishui', '106.6591100', '26.1338900');
INSERT INTO `sys_cn_area` VALUES ('2670', '三都水族自治县', '三都', '2658', null, '中国,贵州省,黔南布依族苗族自治州,三都水族自治县', '3', '558100', '0854', '522732', 'Sandu', '107.8746400', '25.9856200');
INSERT INTO `sys_cn_area` VALUES ('2671', '云南省', '云南', '1', null, '中国,云南省', '1', null, '', '530000', 'Yunnan', '102.7122510', '25.0406090');
INSERT INTO `sys_cn_area` VALUES ('2672', '昆明市', '昆明', '2671', null, '中国,云南省,昆明市', '2', '650500', '0871', '530100', 'Kunming', '102.7122510', '25.0406090');
INSERT INTO `sys_cn_area` VALUES ('2673', '五华区', '五华', '2672', null, '中国,云南省,昆明市,五华区', '3', '650021', '0871', '530102', 'Wuhua', '102.7078600', '25.0352100');
INSERT INTO `sys_cn_area` VALUES ('2674', '盘龙区', '盘龙', '2672', null, '中国,云南省,昆明市,盘龙区', '3', '650051', '0871', '530103', 'Panlong', '102.7199400', '25.0405300');
INSERT INTO `sys_cn_area` VALUES ('2675', '官渡区', '官渡', '2672', null, '中国,云南省,昆明市,官渡区', '3', '650200', '0871', '530111', 'Guandu', '102.7436200', '25.0149700');
INSERT INTO `sys_cn_area` VALUES ('2676', '西山区', '西山', '2672', null, '中国,云南省,昆明市,西山区', '3', '650118', '0871', '530112', 'Xishan', '102.6646400', '25.0379600');
INSERT INTO `sys_cn_area` VALUES ('2677', '东川区', '东川', '2672', null, '中国,云南省,昆明市,东川区', '3', '654100', '0871', '530113', 'Dongchuan', '103.1883200', '26.0830000');
INSERT INTO `sys_cn_area` VALUES ('2678', '呈贡区', '呈贡', '2672', null, '中国,云南省,昆明市,呈贡区', '3', '650500', '0871', '530114', 'Chenggong', '102.8013820', '24.8892750');
INSERT INTO `sys_cn_area` VALUES ('2679', '晋宁县', '晋宁', '2672', null, '中国,云南省,昆明市,晋宁县', '3', '650600', '0871', '530122', 'Jinning', '102.5939300', '24.6665000');
INSERT INTO `sys_cn_area` VALUES ('2680', '富民县', '富民', '2672', null, '中国,云南省,昆明市,富民县', '3', '650400', '0871', '530124', 'Fumin', '102.4985000', '25.2211900');
INSERT INTO `sys_cn_area` VALUES ('2681', '宜良县', '宜良', '2672', null, '中国,云南省,昆明市,宜良县', '3', '652100', '0871', '530125', 'Yiliang', '103.1411700', '24.9170500');
INSERT INTO `sys_cn_area` VALUES ('2682', '石林彝族自治县', '石林', '2672', null, '中国,云南省,昆明市,石林彝族自治县', '3', '652200', '0871', '530126', 'Shilin', '103.2714800', '24.7589700');
INSERT INTO `sys_cn_area` VALUES ('2683', '嵩明县', '嵩明', '2672', null, '中国,云南省,昆明市,嵩明县', '3', '651700', '0871', '530127', 'Songming', '103.0372900', '25.3398600');
INSERT INTO `sys_cn_area` VALUES ('2684', '禄劝彝族苗族自治县', '禄劝', '2672', null, '中国,云南省,昆明市,禄劝彝族苗族自治县', '3', '651500', '0871', '530128', 'Luquan', '102.4671000', '25.5538700');
INSERT INTO `sys_cn_area` VALUES ('2685', '寻甸回族彝族自治县 ', '寻甸', '2672', null, '中国,云南省,昆明市,寻甸回族彝族自治县 ', '3', '655200', '0871', '530129', 'Xundian', '103.2557000', '25.5596100');
INSERT INTO `sys_cn_area` VALUES ('2686', '安宁市', '安宁', '2672', null, '中国,云南省,昆明市,安宁市', '3', '650300', '0871', '530181', 'Anning', '102.4697200', '24.9165200');
INSERT INTO `sys_cn_area` VALUES ('2687', '曲靖市', '曲靖', '2671', null, '中国,云南省,曲靖市', '2', '655000', '0874', '530300', 'Qujing', '103.7978510', '25.5015570');
INSERT INTO `sys_cn_area` VALUES ('2688', '麒麟区', '麒麟', '2687', null, '中国,云南省,曲靖市,麒麟区', '3', '655000', '0874', '530302', 'Qilin', '103.8050400', '25.4951500');
INSERT INTO `sys_cn_area` VALUES ('2689', '马龙县', '马龙', '2687', null, '中国,云南省,曲靖市,马龙县', '3', '655100', '0874', '530321', 'Malong', '103.5787300', '25.4252100');
INSERT INTO `sys_cn_area` VALUES ('2690', '陆良县', '陆良', '2687', null, '中国,云南省,曲靖市,陆良县', '3', '655600', '0874', '530322', 'Luliang', '103.6665000', '25.0233500');
INSERT INTO `sys_cn_area` VALUES ('2691', '师宗县', '师宗', '2687', null, '中国,云南省,曲靖市,师宗县', '3', '655700', '0874', '530323', 'Shizong', '103.9908400', '24.8282200');
INSERT INTO `sys_cn_area` VALUES ('2692', '罗平县', '罗平', '2687', null, '中国,云南省,曲靖市,罗平县', '3', '655800', '0874', '530324', 'Luoping', '104.3085900', '24.8844400');
INSERT INTO `sys_cn_area` VALUES ('2693', '富源县', '富源', '2687', null, '中国,云南省,曲靖市,富源县', '3', '655500', '0874', '530325', 'Fuyuan', '104.2538700', '25.6658700');
INSERT INTO `sys_cn_area` VALUES ('2694', '会泽县', '会泽', '2687', null, '中国,云南省,曲靖市,会泽县', '3', '654200', '0874', '530326', 'Huize', '103.3001700', '26.4107600');
INSERT INTO `sys_cn_area` VALUES ('2695', '沾益县', '沾益', '2687', null, '中国,云南省,曲靖市,沾益县', '3', '655331', '0874', '530328', 'Zhanyi', '103.8213500', '25.6071500');
INSERT INTO `sys_cn_area` VALUES ('2696', '宣威市', '宣威', '2687', null, '中国,云南省,曲靖市,宣威市', '3', '655400', '0874', '530381', 'Xuanwei', '104.1040900', '26.2173000');
INSERT INTO `sys_cn_area` VALUES ('2697', '玉溪市', '玉溪', '2671', null, '中国,云南省,玉溪市', '2', '653100', '0877', '530400', 'Yuxi', '102.5439070', '24.3504610');
INSERT INTO `sys_cn_area` VALUES ('2698', '红塔区', '红塔', '2697', null, '中国,云南省,玉溪市,红塔区', '3', '653100', '0877', '530402', 'Hongta', '102.5449000', '24.3541100');
INSERT INTO `sys_cn_area` VALUES ('2699', '江川县', '江川', '2697', null, '中国,云南省,玉溪市,江川县', '3', '652600', '0877', '530421', 'Jiangchuan', '102.7541200', '24.2886300');
INSERT INTO `sys_cn_area` VALUES ('2700', '澄江县', '澄江', '2697', null, '中国,云南省,玉溪市,澄江县', '3', '652500', '0877', '530422', 'Chengjiang', '102.9081700', '24.6737600');
INSERT INTO `sys_cn_area` VALUES ('2701', '通海县', '通海', '2697', null, '中国,云南省,玉溪市,通海县', '3', '652700', '0877', '530423', 'Tonghai', '102.7664100', '24.1136200');
INSERT INTO `sys_cn_area` VALUES ('2702', '华宁县', '华宁', '2697', null, '中国,云南省,玉溪市,华宁县', '3', '652800', '0877', '530424', 'Huaning', '102.9283100', '24.1926000');
INSERT INTO `sys_cn_area` VALUES ('2703', '易门县', '易门', '2697', null, '中国,云南省,玉溪市,易门县', '3', '651100', '0877', '530425', 'Yimen', '102.1635400', '24.6712200');
INSERT INTO `sys_cn_area` VALUES ('2704', '峨山彝族自治县', '峨山', '2697', null, '中国,云南省,玉溪市,峨山彝族自治县', '3', '653200', '0877', '530426', 'Eshan', '102.4057600', '24.1690400');
INSERT INTO `sys_cn_area` VALUES ('2705', '新平彝族傣族自治县', '新平', '2697', null, '中国,云南省,玉溪市,新平彝族傣族自治县', '3', '653400', '0877', '530427', 'Xinping', '101.9889500', '24.0688600');
INSERT INTO `sys_cn_area` VALUES ('2706', '元江哈尼族彝族傣族自治县', '元江', '2697', null, '中国,云南省,玉溪市,元江哈尼族彝族傣族自治县', '3', '653300', '0877', '530428', 'Yuanjiang', '101.9981200', '23.5965500');
INSERT INTO `sys_cn_area` VALUES ('2707', '保山市', '保山', '2671', null, '中国,云南省,保山市', '2', '678000', '0875', '530500', 'Baoshan', '99.1671330', '25.1118020');
INSERT INTO `sys_cn_area` VALUES ('2708', '隆阳区', '隆阳', '2707', null, '中国,云南省,保山市,隆阳区', '3', '678000', '0875', '530502', 'Longyang', '99.1633400', '25.1116300');
INSERT INTO `sys_cn_area` VALUES ('2709', '施甸县', '施甸', '2707', null, '中国,云南省,保山市,施甸县', '3', '678200', '0875', '530521', 'Shidian', '99.1876800', '24.7241800');
INSERT INTO `sys_cn_area` VALUES ('2710', '腾冲县', '腾冲', '2707', null, '中国,云南省,保山市,腾冲县', '3', '679100', '0875', '530522', 'Tengchong', '98.4941400', '25.0253900');
INSERT INTO `sys_cn_area` VALUES ('2711', '龙陵县', '龙陵', '2707', null, '中国,云南省,保山市,龙陵县', '3', '678300', '0875', '530523', 'Longling', '98.6902400', '24.5874600');
INSERT INTO `sys_cn_area` VALUES ('2712', '昌宁县', '昌宁', '2707', null, '中国,云南省,保山市,昌宁县', '3', '678100', '0875', '530524', 'Changning', '99.6036000', '24.8276300');
INSERT INTO `sys_cn_area` VALUES ('2713', '昭通市', '昭通', '2671', null, '中国,云南省,昭通市', '2', '657000', '0870', '530600', 'Zhaotong', '103.7172160', '27.3369990');
INSERT INTO `sys_cn_area` VALUES ('2714', '昭阳区', '昭阳', '2713', null, '中国,云南省,昭通市,昭阳区', '3', '657000', '0870', '530602', 'Zhaoyang', '103.7065400', '27.3199800');
INSERT INTO `sys_cn_area` VALUES ('2715', '鲁甸县', '鲁甸', '2713', null, '中国,云南省,昭通市,鲁甸县', '3', '657100', '0870', '530621', 'Ludian', '103.5472100', '27.1923800');
INSERT INTO `sys_cn_area` VALUES ('2716', '巧家县', '巧家', '2713', null, '中国,云南省,昭通市,巧家县', '3', '654600', '0870', '530622', 'Qiaojia', '102.9241600', '26.9123700');
INSERT INTO `sys_cn_area` VALUES ('2717', '盐津县', '盐津', '2713', null, '中国,云南省,昭通市,盐津县', '3', '657500', '0870', '530623', 'Yanjin', '104.2346100', '28.1085600');
INSERT INTO `sys_cn_area` VALUES ('2718', '大关县', '大关', '2713', null, '中国,云南省,昭通市,大关县', '3', '657400', '0870', '530624', 'Daguan', '103.8925400', '27.7488000');
INSERT INTO `sys_cn_area` VALUES ('2719', '永善县', '永善', '2713', null, '中国,云南省,昭通市,永善县', '3', '657300', '0870', '530625', 'Yongshan', '103.6350400', '28.2279000');
INSERT INTO `sys_cn_area` VALUES ('2720', '绥江县', '绥江', '2713', null, '中国,云南省,昭通市,绥江县', '3', '657700', '0870', '530626', 'Suijiang', '103.9493700', '28.5966100');
INSERT INTO `sys_cn_area` VALUES ('2721', '镇雄县', '镇雄', '2713', null, '中国,云南省,昭通市,镇雄县', '3', '657200', '0870', '530627', 'Zhenxiong', '104.8725800', '27.4398100');
INSERT INTO `sys_cn_area` VALUES ('2722', '彝良县', '彝良', '2713', null, '中国,云南省,昭通市,彝良县', '3', '657600', '0870', '530628', 'Yiliang', '104.0498300', '27.6280900');
INSERT INTO `sys_cn_area` VALUES ('2723', '威信县', '威信', '2713', null, '中国,云南省,昭通市,威信县', '3', '657900', '0870', '530629', 'Weixin', '105.0475400', '27.8406500');
INSERT INTO `sys_cn_area` VALUES ('2724', '水富县', '水富', '2713', null, '中国,云南省,昭通市,水富县', '3', '657800', '0870', '530630', 'Shuifu', '104.4158000', '28.6298600');
INSERT INTO `sys_cn_area` VALUES ('2725', '丽江市', '丽江', '2671', null, '中国,云南省,丽江市', '2', '674100', '0888', '530700', 'Lijiang', '100.2330260', '26.8721080');
INSERT INTO `sys_cn_area` VALUES ('2726', '古城区', '古城', '2725', null, '中国,云南省,丽江市,古城区', '3', '674100', '0888', '530702', 'Gucheng', '100.2257000', '26.8769700');
INSERT INTO `sys_cn_area` VALUES ('2727', '玉龙纳西族自治县', '玉龙', '2725', null, '中国,云南省,丽江市,玉龙纳西族自治县', '3', '674100', '0888', '530721', 'Yulong', '100.2369000', '26.8214900');
INSERT INTO `sys_cn_area` VALUES ('2728', '永胜县', '永胜', '2725', null, '中国,云南省,丽江市,永胜县', '3', '674200', '0888', '530722', 'Yongsheng', '100.7466700', '26.6859100');
INSERT INTO `sys_cn_area` VALUES ('2729', '华坪县', '华坪', '2725', null, '中国,云南省,丽江市,华坪县', '3', '674800', '0888', '530723', 'Huaping', '101.2656200', '26.6296700');
INSERT INTO `sys_cn_area` VALUES ('2730', '宁蒗彝族自治县', '宁蒗', '2725', null, '中国,云南省,丽江市,宁蒗彝族自治县', '3', '674300', '0888', '530724', 'Ninglang', '100.8507000', '27.2817900');
INSERT INTO `sys_cn_area` VALUES ('2731', '普洱市', '普洱', '2671', null, '中国,云南省,普洱市', '2', '665000', '0879', '530800', 'Pu\'er', '100.9723440', '22.7773210');
INSERT INTO `sys_cn_area` VALUES ('2732', '思茅区', '思茅', '2731', null, '中国,云南省,普洱市,思茅区', '3', '665000', '0879', '530802', 'Simao', '100.9771600', '22.7869100');
INSERT INTO `sys_cn_area` VALUES ('2733', '宁洱哈尼族彝族自治县', '宁洱', '2731', null, '中国,云南省,普洱市,宁洱哈尼族彝族自治县', '3', '665100', '0879', '530821', 'Ninger', '101.0465300', '23.0634100');
INSERT INTO `sys_cn_area` VALUES ('2734', '墨江哈尼族自治县', '墨江', '2731', null, '中国,云南省,普洱市,墨江哈尼族自治县', '3', '654800', '0879', '530822', 'Mojiang', '101.6917100', '23.4321400');
INSERT INTO `sys_cn_area` VALUES ('2735', '景东彝族自治县', '景东', '2731', null, '中国,云南省,普洱市,景东彝族自治县', '3', '676200', '0879', '530823', 'Jingdong', '100.8359900', '24.4479100');
INSERT INTO `sys_cn_area` VALUES ('2736', '景谷傣族彝族自治县', '景谷', '2731', null, '中国,云南省,普洱市,景谷傣族彝族自治县', '3', '666400', '0879', '530824', 'Jinggu', '100.7025100', '23.4970500');
INSERT INTO `sys_cn_area` VALUES ('2737', '镇沅彝族哈尼族拉祜族自治县', '镇沅', '2731', null, '中国,云南省,普洱市,镇沅彝族哈尼族拉祜族自治县', '3', '666500', '0879', '530825', 'Zhenyuan', '101.1067500', '24.0055700');
INSERT INTO `sys_cn_area` VALUES ('2738', '江城哈尼族彝族自治县', '江城', '2731', null, '中国,云南省,普洱市,江城哈尼族彝族自治县', '3', '665900', '0879', '530826', 'Jiangcheng', '101.8578800', '22.5842400');
INSERT INTO `sys_cn_area` VALUES ('2739', '孟连傣族拉祜族佤族自治县', '孟连', '2731', null, '中国,云南省,普洱市,孟连傣族拉祜族佤族自治县', '3', '665800', '0879', '530827', 'Menglian', '99.5842400', '22.3292200');
INSERT INTO `sys_cn_area` VALUES ('2740', '澜沧拉祜族自治县', '澜沧', '2731', null, '中国,云南省,普洱市,澜沧拉祜族自治县', '3', '665600', '0879', '530828', 'Lancang', '99.9359100', '22.5547400');
INSERT INTO `sys_cn_area` VALUES ('2741', '西盟佤族自治县', '西盟', '2731', null, '中国,云南省,普洱市,西盟佤族自治县', '3', '665700', '0879', '530829', 'Ximeng', '99.5986900', '22.6477400');
INSERT INTO `sys_cn_area` VALUES ('2742', '临沧市', '临沧', '2671', null, '中国,云南省,临沧市', '2', '677000', '0883', '530900', 'Lincang', '100.0869700', '23.8865670');
INSERT INTO `sys_cn_area` VALUES ('2743', '临翔区', '临翔', '2742', null, '中国,云南省,临沧市,临翔区', '3', '677000', '0883', '530902', 'Linxiang', '100.0824200', '23.8949700');
INSERT INTO `sys_cn_area` VALUES ('2744', '凤庆县', '凤庆', '2742', null, '中国,云南省,临沧市,凤庆县', '3', '675900', '0883', '530921', 'Fengqing', '99.9283700', '24.5803400');
INSERT INTO `sys_cn_area` VALUES ('2745', '云县', '云县', '2742', null, '中国,云南省,临沧市,云县', '3', '675800', '0883', '530922', 'Yunxian', '100.1280800', '24.4467500');
INSERT INTO `sys_cn_area` VALUES ('2746', '永德县', '永德', '2742', null, '中国,云南省,临沧市,永德县', '3', '677600', '0883', '530923', 'Yongde', '99.2532600', '24.0276000');
INSERT INTO `sys_cn_area` VALUES ('2747', '镇康县', '镇康', '2742', null, '中国,云南省,临沧市,镇康县', '3', '677704', '0883', '530924', 'Zhenkang', '98.8255000', '23.7624100');
INSERT INTO `sys_cn_area` VALUES ('2748', '双江拉祜族佤族布朗族傣族自治县', '双江', '2742', null, '中国,云南省,临沧市,双江拉祜族佤族布朗族傣族自治县', '3', '677300', '0883', '530925', 'Shuangjiang', '99.8276900', '23.4734900');
INSERT INTO `sys_cn_area` VALUES ('2749', '耿马傣族佤族自治县', '耿马', '2742', null, '中国,云南省,临沧市,耿马傣族佤族自治县', '3', '677500', '0883', '530926', 'Gengma', '99.3978500', '23.5377600');
INSERT INTO `sys_cn_area` VALUES ('2750', '沧源佤族自治县', '沧源', '2742', null, '中国,云南省,临沧市,沧源佤族自治县', '3', '677400', '0883', '530927', 'Cangyuan', '99.2454500', '23.1482100');
INSERT INTO `sys_cn_area` VALUES ('2751', '楚雄彝族自治州', '楚雄', '2671', null, '中国,云南省,楚雄彝族自治州', '2', '675000', '0878', '532300', 'Chuxiong', '101.5460460', '25.0419880');
INSERT INTO `sys_cn_area` VALUES ('2752', '楚雄市', '楚雄', '2751', null, '中国,云南省,楚雄彝族自治州,楚雄市', '3', '675000', '0878', '532301', 'Chuxiong', '101.5461500', '25.0329000');
INSERT INTO `sys_cn_area` VALUES ('2753', '双柏县', '双柏', '2751', null, '中国,云南省,楚雄彝族自治州,双柏县', '3', '675100', '0878', '532322', 'Shuangbai', '101.6420500', '24.6888200');
INSERT INTO `sys_cn_area` VALUES ('2754', '牟定县', '牟定', '2751', null, '中国,云南省,楚雄彝族自治州,牟定县', '3', '675500', '0878', '532323', 'Mouding', '101.5400000', '25.3155100');
INSERT INTO `sys_cn_area` VALUES ('2755', '南华县', '南华', '2751', null, '中国,云南省,楚雄彝族自治州,南华县', '3', '675200', '0878', '532324', 'Nanhua', '101.2731300', '25.1929300');
INSERT INTO `sys_cn_area` VALUES ('2756', '姚安县', '姚安', '2751', null, '中国,云南省,楚雄彝族自治州,姚安县', '3', '675300', '0878', '532325', 'Yao\'an', '101.2427900', '25.5046700');
INSERT INTO `sys_cn_area` VALUES ('2757', '大姚县', '大姚', '2751', null, '中国,云南省,楚雄彝族自治州,大姚县', '3', '675400', '0878', '532326', 'Dayao', '101.3239700', '25.7221800');
INSERT INTO `sys_cn_area` VALUES ('2758', '永仁县', '永仁', '2751', null, '中国,云南省,楚雄彝族自治州,永仁县', '3', '651400', '0878', '532327', 'Yongren', '101.6716000', '26.0579400');
INSERT INTO `sys_cn_area` VALUES ('2759', '元谋县', '元谋', '2751', null, '中国,云南省,楚雄彝族自治州,元谋县', '3', '651300', '0878', '532328', 'Yuanmou', '101.8772800', '25.7043800');
INSERT INTO `sys_cn_area` VALUES ('2760', '武定县', '武定', '2751', null, '中国,云南省,楚雄彝族自治州,武定县', '3', '651600', '0878', '532329', 'Wuding', '102.4038000', '25.5295000');
INSERT INTO `sys_cn_area` VALUES ('2761', '禄丰县', '禄丰', '2751', null, '中国,云南省,楚雄彝族自治州,禄丰县', '3', '651200', '0878', '532331', 'Lufeng', '102.0779700', '25.1481500');
INSERT INTO `sys_cn_area` VALUES ('2762', '红河哈尼族彝族自治州', '红河', '2671', null, '中国,云南省,红河哈尼族彝族自治州', '2', '661400', '0873', '532500', 'Honghe', '103.3841820', '23.3667750');
INSERT INTO `sys_cn_area` VALUES ('2763', '个旧市', '个旧', '2762', null, '中国,云南省,红河哈尼族彝族自治州,个旧市', '3', '661000', '0873', '532501', 'Gejiu', '103.1596600', '23.3589400');
INSERT INTO `sys_cn_area` VALUES ('2764', '开远市', '开远', '2762', null, '中国,云南省,红河哈尼族彝族自治州,开远市', '3', '661600', '0873', '532502', 'Kaiyuan', '103.2698600', '23.7101200');
INSERT INTO `sys_cn_area` VALUES ('2765', '蒙自市', '蒙自', '2762', null, '中国,云南省,红河哈尼族彝族自治州,蒙自市', '3', '661101', '0873', '532503', 'Mengzi', '103.3850050', '23.3668430');
INSERT INTO `sys_cn_area` VALUES ('2766', '弥勒市', '弥勒', '2762', null, '中国,云南省,红河哈尼族彝族自治州,弥勒市', '3', '652300', '0873', '532504', 'Mile ', '103.4369880', '24.4083700');
INSERT INTO `sys_cn_area` VALUES ('2767', '屏边苗族自治县', '屏边', '2762', null, '中国,云南省,红河哈尼族彝族自治州,屏边苗族自治县', '3', '661200', '0873', '532523', 'Pingbian', '103.6855400', '22.9842500');
INSERT INTO `sys_cn_area` VALUES ('2768', '建水县', '建水', '2762', null, '中国,云南省,红河哈尼族彝族自治州,建水县', '3', '654300', '0873', '532524', 'Jianshui', '102.8265600', '23.6347200');
INSERT INTO `sys_cn_area` VALUES ('2769', '石屏县', '石屏', '2762', null, '中国,云南省,红河哈尼族彝族自治州,石屏县', '3', '662200', '0873', '532525', 'Shiping', '102.4940800', '23.7144100');
INSERT INTO `sys_cn_area` VALUES ('2770', '泸西县', '泸西', '2762', null, '中国,云南省,红河哈尼族彝族自治州,泸西县', '3', '652400', '0873', '532527', 'Luxi', '103.7637300', '24.5285400');
INSERT INTO `sys_cn_area` VALUES ('2771', '元阳县', '元阳', '2762', null, '中国,云南省,红河哈尼族彝族自治州,元阳县', '3', '662400', '0873', '532528', 'Yuanyang', '102.8326100', '23.2228100');
INSERT INTO `sys_cn_area` VALUES ('2772', '红河县', '红河县', '2762', null, '中国,云南省,红河哈尼族彝族自治州,红河县', '3', '654400', '0873', '532529', 'Honghexian', '102.4205900', '23.3676700');
INSERT INTO `sys_cn_area` VALUES ('2773', '金平苗族瑶族傣族自治县', '金平', '2762', null, '中国,云南省,红河哈尼族彝族自治州,金平苗族瑶族傣族自治县', '3', '661500', '0873', '532530', 'Jinping', '103.2265100', '22.7795900');
INSERT INTO `sys_cn_area` VALUES ('2774', '绿春县', '绿春', '2762', null, '中国,云南省,红河哈尼族彝族自治州,绿春县', '3', '662500', '0873', '532531', 'Lvchun', '102.3967200', '22.9937100');
INSERT INTO `sys_cn_area` VALUES ('2775', '河口瑶族自治县', '河口', '2762', null, '中国,云南省,红河哈尼族彝族自治州,河口瑶族自治县', '3', '661300', '0873', '532532', 'Hekou', '103.9393600', '22.5292900');
INSERT INTO `sys_cn_area` VALUES ('2776', '文山壮族苗族自治州', '文山', '2671', null, '中国,云南省,文山壮族苗族自治州', '2', '663000', '0876', '532600', 'Wenshan', '104.2440100', '23.3695100');
INSERT INTO `sys_cn_area` VALUES ('2777', '文山市', '文山', '2776', null, '中国,云南省,文山壮族苗族自治州,文山市', '3', '663000', '0876', '532601', 'Wenshan', '104.2442770', '23.3692160');
INSERT INTO `sys_cn_area` VALUES ('2778', '砚山县', '砚山', '2776', null, '中国,云南省,文山壮族苗族自治州,砚山县', '3', '663100', '0876', '532622', 'Yanshan', '104.3330600', '23.6072300');
INSERT INTO `sys_cn_area` VALUES ('2779', '西畴县', '西畴', '2776', null, '中国,云南省,文山壮族苗族自治州,西畴县', '3', '663500', '0876', '532623', 'Xichou', '104.6741900', '23.4394100');
INSERT INTO `sys_cn_area` VALUES ('2780', '麻栗坡县', '麻栗坡', '2776', null, '中国,云南省,文山壮族苗族自治州,麻栗坡县', '3', '663600', '0876', '532624', 'Malipo', '104.7013200', '23.1202800');
INSERT INTO `sys_cn_area` VALUES ('2781', '马关县', '马关', '2776', null, '中国,云南省,文山壮族苗族自治州,马关县', '3', '663700', '0876', '532625', 'Maguan', '104.3951400', '23.0129300');
INSERT INTO `sys_cn_area` VALUES ('2782', '丘北县', '丘北', '2776', null, '中国,云南省,文山壮族苗族自治州,丘北县', '3', '663200', '0876', '532626', 'Qiubei', '104.1925600', '24.0395700');
INSERT INTO `sys_cn_area` VALUES ('2783', '广南县', '广南', '2776', null, '中国,云南省,文山壮族苗族自治州,广南县', '3', '663300', '0876', '532627', 'Guangnan', '105.0551100', '24.0464000');
INSERT INTO `sys_cn_area` VALUES ('2784', '富宁县', '富宁', '2776', null, '中国,云南省,文山壮族苗族自治州,富宁县', '3', '663400', '0876', '532628', 'Funing', '105.6308500', '23.6253600');
INSERT INTO `sys_cn_area` VALUES ('2785', '西双版纳傣族自治州', '西双版纳', '2671', null, '中国,云南省,西双版纳傣族自治州', '2', '666100', '0691', '532800', 'Xishuangbanna', '100.7979410', '22.0017240');
INSERT INTO `sys_cn_area` VALUES ('2786', '景洪市', '景洪', '2785', null, '中国,云南省,西双版纳傣族自治州,景洪市', '3', '666100', '0691', '532801', 'Jinghong', '100.7997700', '22.0107100');
INSERT INTO `sys_cn_area` VALUES ('2787', '勐海县', '勐海', '2785', null, '中国,云南省,西双版纳傣族自治州,勐海县', '3', '666200', '0691', '532822', 'Menghai', '100.4493100', '21.9617500');
INSERT INTO `sys_cn_area` VALUES ('2788', '勐腊县', '勐腊', '2785', null, '中国,云南省,西双版纳傣族自治州,勐腊县', '3', '666300', '0691', '532823', 'Mengla', '101.5648800', '21.4816200');
INSERT INTO `sys_cn_area` VALUES ('2789', '大理白族自治州', '大理', '2671', null, '中国,云南省,大理白族自治州', '2', '671000', '0872', '532900', 'Dali', '100.2400370', '25.5927650');
INSERT INTO `sys_cn_area` VALUES ('2790', '大理市', '大理', '2789', null, '中国,云南省,大理白族自治州,大理市', '3', '671000', '0872', '532901', 'Dali', '100.2299800', '25.5915700');
INSERT INTO `sys_cn_area` VALUES ('2791', '漾濞彝族自治县', '漾濞', '2789', null, '中国,云南省,大理白族自治州,漾濞彝族自治县', '3', '672500', '0872', '532922', 'Yangbi', '99.9547400', '25.6652000');
INSERT INTO `sys_cn_area` VALUES ('2792', '祥云县', '祥云', '2789', null, '中国,云南省,大理白族自治州,祥云县', '3', '672100', '0872', '532923', 'Xiangyun', '100.5576100', '25.4734200');
INSERT INTO `sys_cn_area` VALUES ('2793', '宾川县', '宾川', '2789', null, '中国,云南省,大理白族自治州,宾川县', '3', '671600', '0872', '532924', 'Binchuan', '100.5766600', '25.8314400');
INSERT INTO `sys_cn_area` VALUES ('2794', '弥渡县', '弥渡', '2789', null, '中国,云南省,大理白族自治州,弥渡县', '3', '675600', '0872', '532925', 'Midu', '100.4907500', '25.3417900');
INSERT INTO `sys_cn_area` VALUES ('2795', '南涧彝族自治县', '南涧', '2789', null, '中国,云南省,大理白族自治州,南涧彝族自治县', '3', '675700', '0872', '532926', 'Nanjian', '100.5096400', '25.0434900');
INSERT INTO `sys_cn_area` VALUES ('2796', '巍山彝族回族自治县', '巍山', '2789', null, '中国,云南省,大理白族自治州,巍山彝族回族自治县', '3', '672400', '0872', '532927', 'Weishan', '100.3061200', '25.2319700');
INSERT INTO `sys_cn_area` VALUES ('2797', '永平县', '永平', '2789', null, '中国,云南省,大理白族自治州,永平县', '3', '672600', '0872', '532928', 'Yongping', '99.5409500', '25.4645100');
INSERT INTO `sys_cn_area` VALUES ('2798', '云龙县', '云龙', '2789', null, '中国,云南省,大理白族自治州,云龙县', '3', '672700', '0872', '532929', 'Yunlong', '99.3725500', '25.8850500');
INSERT INTO `sys_cn_area` VALUES ('2799', '洱源县', '洱源', '2789', null, '中国,云南省,大理白族自治州,洱源县', '3', '671200', '0872', '532930', 'Eryuan', '99.9490300', '26.1082900');
INSERT INTO `sys_cn_area` VALUES ('2800', '剑川县', '剑川', '2789', null, '中国,云南省,大理白族自治州,剑川县', '3', '671300', '0872', '532931', 'Jianchuan', '99.9054500', '26.5368800');
INSERT INTO `sys_cn_area` VALUES ('2801', '鹤庆县', '鹤庆', '2789', null, '中国,云南省,大理白族自治州,鹤庆县', '3', '671500', '0872', '532932', 'Heqing', '100.1769700', '26.5579800');
INSERT INTO `sys_cn_area` VALUES ('2802', '德宏傣族景颇族自治州', '德宏', '2671', null, '中国,云南省,德宏傣族景颇族自治州', '2', '678400', '0692', '533100', 'Dehong', '98.5783630', '24.4366940');
INSERT INTO `sys_cn_area` VALUES ('2803', '瑞丽市', '瑞丽', '2802', null, '中国,云南省,德宏傣族景颇族自治州,瑞丽市', '3', '678600', '0692', '533102', 'Ruili', '97.8518300', '24.0127700');
INSERT INTO `sys_cn_area` VALUES ('2804', '芒市', '芒市', '2802', null, '中国,云南省,德宏傣族景颇族自治州,芒市', '3', '678400', '0692', '533103', 'Mangshi', '98.5886410', '24.4337350');
INSERT INTO `sys_cn_area` VALUES ('2805', '梁河县', '梁河', '2802', null, '中国,云南省,德宏傣族景颇族自治州,梁河县', '3', '679200', '0692', '533122', 'Lianghe', '98.2970500', '24.8065800');
INSERT INTO `sys_cn_area` VALUES ('2806', '盈江县', '盈江', '2802', null, '中国,云南省,德宏傣族景颇族自治州,盈江县', '3', '679300', '0692', '533123', 'Yingjiang', '97.9317900', '24.7057900');
INSERT INTO `sys_cn_area` VALUES ('2807', '陇川县', '陇川', '2802', null, '中国,云南省,德宏傣族景颇族自治州,陇川县', '3', '678700', '0692', '533124', 'Longchuan', '97.7919900', '24.1830200');
INSERT INTO `sys_cn_area` VALUES ('2808', '怒江傈僳族自治州', '怒江', '2671', null, '中国,云南省,怒江傈僳族自治州', '2', '673100', '0886', '533300', 'Nujiang', '98.8543040', '25.8509490');
INSERT INTO `sys_cn_area` VALUES ('2809', '泸水县', '泸水', '2808', null, '中国,云南省,怒江傈僳族自治州,泸水县', '3', '673100', '0886', '533321', 'Lushui', '98.8553400', '25.8377200');
INSERT INTO `sys_cn_area` VALUES ('2810', '福贡县', '福贡', '2808', null, '中国,云南省,怒江傈僳族自治州,福贡县', '3', '673400', '0886', '533323', 'Fugong', '98.8696900', '26.9036600');
INSERT INTO `sys_cn_area` VALUES ('2811', '贡山独龙族怒族自治县', '贡山', '2808', null, '中国,云南省,怒江傈僳族自治州,贡山独龙族怒族自治县', '3', '673500', '0886', '533324', 'Gongshan', '98.6658300', '27.7408800');
INSERT INTO `sys_cn_area` VALUES ('2812', '兰坪白族普米族自治县', '兰坪', '2808', null, '中国,云南省,怒江傈僳族自治州,兰坪白族普米族自治县', '3', '671400', '0886', '533325', 'Lanping', '99.4189100', '26.4525100');
INSERT INTO `sys_cn_area` VALUES ('2813', '迪庆藏族自治州', '迪庆', '2671', null, '中国,云南省,迪庆藏族自治州', '2', '674400', '0887', '533400', 'Deqen', '99.7064630', '27.8268530');
INSERT INTO `sys_cn_area` VALUES ('2814', '香格里拉市', '香格里拉', '2813', null, '中国,云南省,迪庆藏族自治州,香格里拉市', '3', '674400', '0887', '533421', 'Xianggelila', '99.7060100', '27.8230800');
INSERT INTO `sys_cn_area` VALUES ('2815', '德钦县', '德钦', '2813', null, '中国,云南省,迪庆藏族自治州,德钦县', '3', '674500', '0887', '533422', 'Deqin', '98.9108200', '28.4863000');
INSERT INTO `sys_cn_area` VALUES ('2816', '维西傈僳族自治县', '维西', '2813', null, '中国,云南省,迪庆藏族自治州,维西傈僳族自治县', '3', '674600', '0887', '533423', 'Weixi', '99.2840200', '27.1793000');
INSERT INTO `sys_cn_area` VALUES ('2817', '西藏自治区', '西藏', '1', null, '中国,西藏自治区', '1', null, '', '540000', 'Tibet', '91.1322120', '29.6603610');
INSERT INTO `sys_cn_area` VALUES ('2818', '拉萨市', '拉萨', '2817', null, '中国,西藏自治区,拉萨市', '2', '850000', '0891', '540100', 'Lhasa', '91.1322120', '29.6603610');
INSERT INTO `sys_cn_area` VALUES ('2819', '城关区', '城关', '2818', null, '中国,西藏自治区,拉萨市,城关区', '3', '850000', '0891', '540102', 'Chengguan', '91.1385900', '29.6531200');
INSERT INTO `sys_cn_area` VALUES ('2820', '林周县', '林周', '2818', null, '中国,西藏自治区,拉萨市,林周县', '3', '851600', '0891', '540121', 'Linzhou', '91.2586000', '29.8944500');
INSERT INTO `sys_cn_area` VALUES ('2821', '当雄县', '当雄', '2818', null, '中国,西藏自治区,拉萨市,当雄县', '3', '851500', '0891', '540122', 'Dangxiong', '91.1007600', '30.4830900');
INSERT INTO `sys_cn_area` VALUES ('2822', '尼木县', '尼木', '2818', null, '中国,西藏自治区,拉萨市,尼木县', '3', '851300', '0891', '540123', 'Nimu', '90.1637800', '29.4335300');
INSERT INTO `sys_cn_area` VALUES ('2823', '曲水县', '曲水', '2818', null, '中国,西藏自治区,拉萨市,曲水县', '3', '850600', '0891', '540124', 'Qushui', '90.7318700', '29.3563600');
INSERT INTO `sys_cn_area` VALUES ('2824', '堆龙德庆县', '堆龙德庆', '2818', null, '中国,西藏自治区,拉萨市,堆龙德庆县', '3', '851400', '0891', '540125', 'Duilongdeqing', '91.0003300', '29.6500200');
INSERT INTO `sys_cn_area` VALUES ('2825', '达孜县', '达孜', '2818', null, '中国,西藏自治区,拉萨市,达孜县', '3', '850100', '0891', '540126', 'Dazi', '91.3575700', '29.6722000');
INSERT INTO `sys_cn_area` VALUES ('2826', '墨竹工卡县', '墨竹工卡', '2818', null, '中国,西藏自治区,拉萨市,墨竹工卡县', '3', '850200', '0891', '540127', 'Mozhugongka', '91.7281400', '29.8361400');
INSERT INTO `sys_cn_area` VALUES ('2827', '日喀则市', '日喀则', '2817', null, '中国,西藏自治区,日喀则市', '2', '857000', '0892', '540200', 'Rikaze', '88.8848740', '29.2637920');
INSERT INTO `sys_cn_area` VALUES ('2828', '桑珠孜区', '桑珠孜', '2827', null, '中国,西藏自治区,日喀则市,桑珠孜区', '3', '857000', '0892', '540202', 'Sangzhuzi', '88.8803670', '29.2695650');
INSERT INTO `sys_cn_area` VALUES ('2829', '南木林县', '南木林', '2827', null, '中国,西藏自治区,日喀则市,南木林县', '3', '857100', '0892', '540221', 'Nanmulin', '89.0968600', '29.6820600');
INSERT INTO `sys_cn_area` VALUES ('2830', '江孜县', '江孜', '2827', null, '中国,西藏自治区,日喀则市,江孜县', '3', '857400', '0892', '540222', 'Jiangzi', '89.6026300', '28.9174400');
INSERT INTO `sys_cn_area` VALUES ('2831', '定日县', '定日', '2827', null, '中国,西藏自治区,日喀则市,定日县', '3', '858200', '0892', '540223', 'Dingri', '87.1217600', '28.6612900');
INSERT INTO `sys_cn_area` VALUES ('2832', '萨迦县', '萨迦', '2827', null, '中国,西藏自治区,日喀则市,萨迦县', '3', '857800', '0892', '540224', 'Sajia', '88.0219100', '28.9029900');
INSERT INTO `sys_cn_area` VALUES ('2833', '拉孜县', '拉孜', '2827', null, '中国,西藏自治区,日喀则市,拉孜县', '3', '858100', '0892', '540225', 'Lazi', '87.6341200', '29.0850000');
INSERT INTO `sys_cn_area` VALUES ('2834', '昂仁县', '昂仁', '2827', null, '中国,西藏自治区,日喀则市,昂仁县', '3', '858500', '0892', '540226', 'Angren', '87.2385800', '29.2949600');
INSERT INTO `sys_cn_area` VALUES ('2835', '谢通门县', '谢通门', '2827', null, '中国,西藏自治区,日喀则市,谢通门县', '3', '858900', '0892', '540227', 'Xietongmen', '88.2624200', '29.4333700');
INSERT INTO `sys_cn_area` VALUES ('2836', '白朗县', '白朗', '2827', null, '中国,西藏自治区,日喀则市,白朗县', '3', '857300', '0892', '540228', 'Bailang', '89.2620500', '29.1055300');
INSERT INTO `sys_cn_area` VALUES ('2837', '仁布县', '仁布', '2827', null, '中国,西藏自治区,日喀则市,仁布县', '3', '857200', '0892', '540229', 'Renbu', '89.8422800', '29.2301000');
INSERT INTO `sys_cn_area` VALUES ('2838', '康马县', '康马', '2827', null, '中国,西藏自治区,日喀则市,康马县', '3', '857500', '0892', '540230', 'Kangma', '89.6852700', '28.5567000');
INSERT INTO `sys_cn_area` VALUES ('2839', '定结县', '定结', '2827', null, '中国,西藏自治区,日喀则市,定结县', '3', '857900', '0892', '540231', 'Dingjie', '87.7725500', '28.3640300');
INSERT INTO `sys_cn_area` VALUES ('2840', '仲巴县', '仲巴', '2827', null, '中国,西藏自治区,日喀则市,仲巴县', '3', '858800', '0892', '540232', 'Zhongba', '84.0295100', '29.7659500');
INSERT INTO `sys_cn_area` VALUES ('2841', '亚东县', '亚东', '2827', null, '中国,西藏自治区,日喀则市,亚东县', '3', '857600', '0892', '540233', 'Yadong', '88.9080200', '27.4839000');
INSERT INTO `sys_cn_area` VALUES ('2842', '吉隆县', '吉隆', '2827', null, '中国,西藏自治区,日喀则市,吉隆县', '3', '858700', '0892', '540234', 'Jilong', '85.2984600', '28.8538200');
INSERT INTO `sys_cn_area` VALUES ('2843', '聂拉木县', '聂拉木', '2827', null, '中国,西藏自治区,日喀则市,聂拉木县', '3', '858300', '0892', '540235', 'Nielamu', '85.9799800', '28.1564500');
INSERT INTO `sys_cn_area` VALUES ('2844', '萨嘎县', '萨嘎', '2827', null, '中国,西藏自治区,日喀则市,萨嘎县', '3', '857800', '0892', '540236', 'Saga', '85.2341300', '29.3293600');
INSERT INTO `sys_cn_area` VALUES ('2845', '岗巴县', '岗巴', '2827', null, '中国,西藏自治区,日喀则市,岗巴县', '3', '857700', '0892', '540237', 'Gangba', '88.5206900', '28.2750400');
INSERT INTO `sys_cn_area` VALUES ('2846', '昌都市', '昌都', '2817', null, '中国,西藏自治区,昌都市', '2', '854000', '0895', '540300', 'Qamdo', '97.1784520', '31.1368750');
INSERT INTO `sys_cn_area` VALUES ('2847', '卡若区', '昌都', '2846', null, '中国,西藏自治区,昌都市,卡若区', '3', '854000', '0895', '540302', 'Karuo', '97.1804300', '31.1385000');
INSERT INTO `sys_cn_area` VALUES ('2848', '江达县', '江达', '2846', null, '中国,西藏自治区,昌都市,江达县', '3', '854100', '0895', '540321', 'Jiangda', '98.2186500', '31.5034300');
INSERT INTO `sys_cn_area` VALUES ('2849', '贡觉县', '贡觉', '2846', null, '中国,西藏自治区,昌都市,贡觉县', '3', '854200', '0895', '540322', 'Gongjue', '98.2716300', '30.8594100');
INSERT INTO `sys_cn_area` VALUES ('2850', '类乌齐县', '类乌齐', '2846', null, '中国,西藏自治区,昌都市,类乌齐县', '3', '855600', '0895', '540323', 'Leiwuqi', '96.6001500', '31.2120700');
INSERT INTO `sys_cn_area` VALUES ('2851', '丁青县', '丁青', '2846', null, '中国,西藏自治区,昌都市,丁青县', '3', '855700', '0895', '540324', 'Dingqing', '95.5936200', '31.4162100');
INSERT INTO `sys_cn_area` VALUES ('2852', '察雅县', '察雅', '2846', null, '中国,西藏自治区,昌都市,察雅县', '3', '854300', '0895', '540325', 'Chaya', '97.5652100', '30.6533600');
INSERT INTO `sys_cn_area` VALUES ('2853', '八宿县', '八宿', '2846', null, '中国,西藏自治区,昌都市,八宿县', '3', '854600', '0895', '540326', 'Basu', '96.9176000', '30.0534600');
INSERT INTO `sys_cn_area` VALUES ('2854', '左贡县', '左贡', '2846', null, '中国,西藏自治区,昌都市,左贡县', '3', '854400', '0895', '540327', 'Zuogong', '97.8442900', '29.6710800');
INSERT INTO `sys_cn_area` VALUES ('2855', '芒康县', '芒康', '2846', null, '中国,西藏自治区,昌都市,芒康县', '3', '854500', '0895', '540328', 'Mangkang', '98.5937800', '29.6794600');
INSERT INTO `sys_cn_area` VALUES ('2856', '洛隆县', '洛隆', '2846', null, '中国,西藏自治区,昌都市,洛隆县', '3', '855400', '0895', '540329', 'Luolong', '95.8264400', '30.7404900');
INSERT INTO `sys_cn_area` VALUES ('2857', '边坝县', '边坝', '2846', null, '中国,西藏自治区,昌都市,边坝县', '3', '855500', '0895', '540330', 'Bianba', '94.7068700', '30.9343400');
INSERT INTO `sys_cn_area` VALUES ('2858', '山南地区', '山南', '2817', null, '中国,西藏自治区,山南地区', '2', '856000', '0893', '542200', 'Shannan', '91.7665290', '29.2360230');
INSERT INTO `sys_cn_area` VALUES ('2859', '乃东县', '乃东', '2858', null, '中国,西藏自治区,山南地区,乃东县', '3', '856100', '0893', '542221', 'Naidong', '91.7615300', '29.2249000');
INSERT INTO `sys_cn_area` VALUES ('2860', '扎囊县', '扎囊', '2858', null, '中国,西藏自治区,山南地区,扎囊县', '3', '850800', '0893', '542222', 'Zhanang', '91.3328800', '29.2399000');
INSERT INTO `sys_cn_area` VALUES ('2861', '贡嘎县', '贡嘎', '2858', null, '中国,西藏自治区,山南地区,贡嘎县', '3', '850700', '0893', '542223', 'Gongga', '90.9886700', '29.2940800');
INSERT INTO `sys_cn_area` VALUES ('2862', '桑日县', '桑日', '2858', null, '中国,西藏自治区,山南地区,桑日县', '3', '856200', '0893', '542224', 'Sangri', '92.0200500', '29.2664300');
INSERT INTO `sys_cn_area` VALUES ('2863', '琼结县', '琼结', '2858', null, '中国,西藏自治区,山南地区,琼结县', '3', '856800', '0893', '542225', 'Qiongjie', '91.6809300', '29.0263200');
INSERT INTO `sys_cn_area` VALUES ('2864', '曲松县', '曲松', '2858', null, '中国,西藏自治区,山南地区,曲松县', '3', '856300', '0893', '542226', 'Qusong', '92.2026300', '29.0641200');
INSERT INTO `sys_cn_area` VALUES ('2865', '措美县', '措美', '2858', null, '中国,西藏自治区,山南地区,措美县', '3', '856900', '0893', '542227', 'Cuomei', '91.4323700', '28.4379400');
INSERT INTO `sys_cn_area` VALUES ('2866', '洛扎县', '洛扎', '2858', null, '中国,西藏自治区,山南地区,洛扎县', '3', '856600', '0893', '542228', 'Luozha', '90.8603500', '28.3872000');
INSERT INTO `sys_cn_area` VALUES ('2867', '加查县', '加查', '2858', null, '中国,西藏自治区,山南地区,加查县', '3', '856400', '0893', '542229', 'Jiacha', '92.5770200', '29.1397300');
INSERT INTO `sys_cn_area` VALUES ('2868', '隆子县', '隆子', '2858', null, '中国,西藏自治区,山南地区,隆子县', '3', '856600', '0893', '542231', 'Longzi', '92.4614800', '28.4079700');
INSERT INTO `sys_cn_area` VALUES ('2869', '错那县', '错那', '2858', null, '中国,西藏自治区,山南地区,错那县', '3', '856700', '0893', '542232', 'Cuona', '91.9575200', '27.9922400');
INSERT INTO `sys_cn_area` VALUES ('2870', '浪卡子县', '浪卡子', '2858', null, '中国,西藏自治区,山南地区,浪卡子县', '3', '851100', '0893', '542233', 'Langkazi', '90.4000200', '28.9694800');
INSERT INTO `sys_cn_area` VALUES ('2871', '那曲地区', '那曲', '2817', null, '中国,西藏自治区,那曲地区', '2', '852000', '0896', '542400', 'Nagqu', '92.0602140', '31.4760040');
INSERT INTO `sys_cn_area` VALUES ('2872', '那曲县', '那曲', '2871', null, '中国,西藏自治区,那曲地区,那曲县', '3', '852000', '0896', '542421', 'Naqu', '92.0535000', '31.4696400');
INSERT INTO `sys_cn_area` VALUES ('2873', '嘉黎县', '嘉黎', '2871', null, '中国,西藏自治区,那曲地区,嘉黎县', '3', '852400', '0896', '542422', 'Jiali', '93.2498700', '30.6423300');
INSERT INTO `sys_cn_area` VALUES ('2874', '比如县', '比如', '2871', null, '中国,西藏自治区,那曲地区,比如县', '3', '852300', '0896', '542423', 'Biru', '93.6868500', '31.4779000');
INSERT INTO `sys_cn_area` VALUES ('2875', '聂荣县', '聂荣', '2871', null, '中国,西藏自治区,那曲地区,聂荣县', '3', '853500', '0896', '542424', 'Nierong', '92.2957400', '32.1119300');
INSERT INTO `sys_cn_area` VALUES ('2876', '安多县', '安多', '2871', null, '中国,西藏自治区,那曲地区,安多县', '3', '853400', '0896', '542425', 'Anduo', '91.6795000', '32.2612500');
INSERT INTO `sys_cn_area` VALUES ('2877', '申扎县', '申扎', '2871', null, '中国,西藏自治区,那曲地区,申扎县', '3', '853100', '0896', '542426', 'Shenzha', '88.7077600', '30.9299500');
INSERT INTO `sys_cn_area` VALUES ('2878', '索县', '索县', '2871', null, '中国,西藏自治区,那曲地区,索县', '3', '852200', '0896', '542427', 'Suoxian', '93.7829500', '31.8842700');
INSERT INTO `sys_cn_area` VALUES ('2879', '班戈县', '班戈', '2871', null, '中国,西藏自治区,那曲地区,班戈县', '3', '852500', '0896', '542428', 'Bange', '90.0190700', '31.3614900');
INSERT INTO `sys_cn_area` VALUES ('2880', '巴青县', '巴青', '2871', null, '中国,西藏自治区,那曲地区,巴青县', '3', '852100', '0896', '542429', 'Baqing', '94.0531600', '31.9183300');
INSERT INTO `sys_cn_area` VALUES ('2881', '尼玛县', '尼玛', '2871', null, '中国,西藏自治区,那曲地区,尼玛县', '3', '852600', '0896', '542430', 'Nima', '87.2525600', '31.7965400');
INSERT INTO `sys_cn_area` VALUES ('2882', '双湖县', '双湖', '2871', null, '中国,西藏自治区,那曲地区,双湖县', '3', '852600', '0896', '542431', 'Shuanghu', '88.8377760', '33.1890320');
INSERT INTO `sys_cn_area` VALUES ('2883', '阿里地区', '阿里', '2817', null, '中国,西藏自治区,阿里地区', '2', '859000', '0897', '542500', 'Ngari', '80.1054980', '32.5031870');
INSERT INTO `sys_cn_area` VALUES ('2884', '普兰县', '普兰', '2883', null, '中国,西藏自治区,阿里地区,普兰县', '3', '859500', '0897', '542521', 'Pulan', '81.1770000', '30.3000200');
INSERT INTO `sys_cn_area` VALUES ('2885', '札达县', '札达', '2883', null, '中国,西藏自治区,阿里地区,札达县', '3', '859600', '0897', '542522', 'Zhada', '79.8025500', '31.4834500');
INSERT INTO `sys_cn_area` VALUES ('2886', '噶尔县', '噶尔', '2883', null, '中国,西藏自治区,阿里地区,噶尔县', '3', '859400', '0897', '542523', 'Gaer', '80.0957900', '32.5002400');
INSERT INTO `sys_cn_area` VALUES ('2887', '日土县', '日土', '2883', null, '中国,西藏自治区,阿里地区,日土县', '3', '859700', '0897', '542524', 'Ritu', '79.7131000', '33.3874100');
INSERT INTO `sys_cn_area` VALUES ('2888', '革吉县', '革吉', '2883', null, '中国,西藏自治区,阿里地区,革吉县', '3', '859100', '0897', '542525', 'Geji', '81.1510000', '32.3964000');
INSERT INTO `sys_cn_area` VALUES ('2889', '改则县', '改则', '2883', null, '中国,西藏自治区,阿里地区,改则县', '3', '859200', '0897', '542526', 'Gaize', '84.0629500', '32.3044600');
INSERT INTO `sys_cn_area` VALUES ('2890', '措勤县', '措勤', '2883', null, '中国,西藏自治区,阿里地区,措勤县', '3', '859300', '0897', '542527', 'Cuoqin', '85.1661600', '31.0209500');
INSERT INTO `sys_cn_area` VALUES ('2891', '林芝地区', '林芝', '2817', null, '中国,西藏自治区,林芝地区', '2', '850400', '0894', '542600', 'Nyingchi', '94.3623480', '29.6546930');
INSERT INTO `sys_cn_area` VALUES ('2892', '林芝县', '林芝', '2891', null, '中国,西藏自治区,林芝地区,林芝县', '3', '850400', '0894', '542621', 'Linzhi', '94.4839100', '29.5756200');
INSERT INTO `sys_cn_area` VALUES ('2893', '工布江达县', '工布江达', '2891', null, '中国,西藏自治区,林芝地区,工布江达县', '3', '850300', '0894', '542622', 'Gongbujiangda', '93.2452000', '29.8857600');
INSERT INTO `sys_cn_area` VALUES ('2894', '米林县', '米林', '2891', null, '中国,西藏自治区,林芝地区,米林县', '3', '850500', '0894', '542623', 'Milin', '94.2131600', '29.2153500');
INSERT INTO `sys_cn_area` VALUES ('2895', '墨脱县', '墨脱', '2891', null, '中国,西藏自治区,林芝地区,墨脱县', '3', '855300', '0894', '542624', 'Motuo', '95.3316000', '29.3269800');
INSERT INTO `sys_cn_area` VALUES ('2896', '波密县', '波密', '2891', null, '中国,西藏自治区,林芝地区,波密县', '3', '855200', '0894', '542625', 'Bomi', '95.7709600', '29.8590700');
INSERT INTO `sys_cn_area` VALUES ('2897', '察隅县', '察隅', '2891', null, '中国,西藏自治区,林芝地区,察隅县', '3', '855100', '0894', '542626', 'Chayu', '97.4667900', '28.6618000');
INSERT INTO `sys_cn_area` VALUES ('2898', '朗县', '朗县', '2891', null, '中国,西藏自治区,林芝地区,朗县', '3', '856500', '0894', '542627', 'Langxian', '93.0754000', '29.0454900');
INSERT INTO `sys_cn_area` VALUES ('2899', '陕西省', '陕西', '1', null, '中国,陕西省', '1', null, '', '610000', 'Shaanxi', '108.9480240', '34.2631610');
INSERT INTO `sys_cn_area` VALUES ('2900', '西安市', '西安', '2899', null, '中国,陕西省,西安市', '2', '710003', '029', '610100', 'Xi\'an', '108.9480240', '34.2631610');
INSERT INTO `sys_cn_area` VALUES ('2901', '新城区', '新城', '2900', null, '中国,陕西省,西安市,新城区', '3', '710004', '029', '610102', 'Xincheng', '108.9608000', '34.2664100');
INSERT INTO `sys_cn_area` VALUES ('2902', '碑林区', '碑林', '2900', null, '中国,陕西省,西安市,碑林区', '3', '710001', '029', '610103', 'Beilin', '108.9342600', '34.2304000');
INSERT INTO `sys_cn_area` VALUES ('2903', '莲湖区', '莲湖', '2900', null, '中国,陕西省,西安市,莲湖区', '3', '710003', '029', '610104', 'Lianhu', '108.9401000', '34.2670900');
INSERT INTO `sys_cn_area` VALUES ('2904', '灞桥区', '灞桥', '2900', null, '中国,陕西省,西安市,灞桥区', '3', '710038', '029', '610111', 'Baqiao', '109.0645100', '34.2726400');
INSERT INTO `sys_cn_area` VALUES ('2905', '未央区', '未央', '2900', null, '中国,陕西省,西安市,未央区', '3', '710014', '029', '610112', 'Weiyang', '108.9468300', '34.2929600');
INSERT INTO `sys_cn_area` VALUES ('2906', '雁塔区', '雁塔', '2900', null, '中国,陕西省,西安市,雁塔区', '3', '710061', '029', '610113', 'Yanta', '108.9486600', '34.2224500');
INSERT INTO `sys_cn_area` VALUES ('2907', '阎良区', '阎良', '2900', null, '中国,陕西省,西安市,阎良区', '3', '710087', '029', '610114', 'Yanliang', '109.2261600', '34.6622100');
INSERT INTO `sys_cn_area` VALUES ('2908', '临潼区', '临潼', '2900', null, '中国,陕西省,西安市,临潼区', '3', '710600', '029', '610115', 'Lintong', '109.2141700', '34.3666500');
INSERT INTO `sys_cn_area` VALUES ('2909', '长安区', '长安', '2900', null, '中国,陕西省,西安市,长安区', '3', '710100', '029', '610116', 'Chang\'an', '108.9458600', '34.1555900');
INSERT INTO `sys_cn_area` VALUES ('2910', '蓝田县', '蓝田', '2900', null, '中国,陕西省,西安市,蓝田县', '3', '710500', '029', '610122', 'Lantian', '109.3233900', '34.1512800');
INSERT INTO `sys_cn_area` VALUES ('2911', '周至县', '周至', '2900', null, '中国,陕西省,西安市,周至县', '3', '710400', '029', '610124', 'Zhouzhi', '108.2220700', '34.1633700');
INSERT INTO `sys_cn_area` VALUES ('2912', '户县', '户县', '2900', null, '中国,陕西省,西安市,户县', '3', '710300', '029', '610125', 'Huxian', '108.6051300', '34.1085600');
INSERT INTO `sys_cn_area` VALUES ('2913', '高陵区', '高陵', '2900', null, '中国,陕西省,西安市,高陵区', '3', '710200', '029', '610126', 'Gaoling', '109.0881600', '34.5348300');
INSERT INTO `sys_cn_area` VALUES ('2914', '铜川市', '铜川', '2899', null, '中国,陕西省,铜川市', '2', '727100', '0919', '610200', 'Tongchuan', '108.9631220', '34.9089200');
INSERT INTO `sys_cn_area` VALUES ('2915', '王益区', '王益', '2914', null, '中国,陕西省,铜川市,王益区', '3', '727000', '0919', '610202', 'Wangyi', '109.0756400', '35.0689600');
INSERT INTO `sys_cn_area` VALUES ('2916', '印台区', '印台', '2914', null, '中国,陕西省,铜川市,印台区', '3', '727007', '0919', '610203', 'Yintai', '109.1020800', '35.1169000');
INSERT INTO `sys_cn_area` VALUES ('2917', '耀州区', '耀州', '2914', null, '中国,陕西省,铜川市,耀州区', '3', '727100', '0919', '610204', 'Yaozhou', '108.9855600', '34.9130800');
INSERT INTO `sys_cn_area` VALUES ('2918', '宜君县', '宜君', '2914', null, '中国,陕西省,铜川市,宜君县', '3', '727200', '0919', '610222', 'Yijun', '109.1181300', '35.4010800');
INSERT INTO `sys_cn_area` VALUES ('2919', '宝鸡市', '宝鸡', '2899', null, '中国,陕西省,宝鸡市', '2', '721000', '0917', '610300', 'Baoji', '107.1448700', '34.3693150');
INSERT INTO `sys_cn_area` VALUES ('2920', '渭滨区', '渭滨', '2919', null, '中国,陕西省,宝鸡市,渭滨区', '3', '721000', '0917', '610302', 'Weibin', '107.1499100', '34.3711600');
INSERT INTO `sys_cn_area` VALUES ('2921', '金台区', '金台', '2919', null, '中国,陕西省,宝鸡市,金台区', '3', '721000', '0917', '610303', 'Jintai', '107.1469100', '34.3761200');
INSERT INTO `sys_cn_area` VALUES ('2922', '陈仓区', '陈仓', '2919', null, '中国,陕西省,宝鸡市,陈仓区', '3', '721300', '0917', '610304', 'Chencang', '107.3874200', '34.3545100');
INSERT INTO `sys_cn_area` VALUES ('2923', '凤翔县', '凤翔', '2919', null, '中国,陕西省,宝鸡市,凤翔县', '3', '721400', '0917', '610322', 'Fengxiang', '107.3964500', '34.5232100');
INSERT INTO `sys_cn_area` VALUES ('2924', '岐山县', '岐山', '2919', null, '中国,陕西省,宝鸡市,岐山县', '3', '722400', '0917', '610323', 'Qishan', '107.6217300', '34.4437800');
INSERT INTO `sys_cn_area` VALUES ('2925', '扶风县', '扶风', '2919', null, '中国,陕西省,宝鸡市,扶风县', '3', '722200', '0917', '610324', 'Fufeng', '107.9001700', '34.3752400');
INSERT INTO `sys_cn_area` VALUES ('2926', '眉县', '眉县', '2919', null, '中国,陕西省,宝鸡市,眉县', '3', '722300', '0917', '610326', 'Meixian', '107.7507900', '34.2756900');
INSERT INTO `sys_cn_area` VALUES ('2927', '陇县', '陇县', '2919', null, '中国,陕西省,宝鸡市,陇县', '3', '721200', '0917', '610327', 'Longxian', '106.8594600', '34.8940400');
INSERT INTO `sys_cn_area` VALUES ('2928', '千阳县', '千阳', '2919', null, '中国,陕西省,宝鸡市,千阳县', '3', '721100', '0917', '610328', 'Qianyang', '107.1304300', '34.6421900');
INSERT INTO `sys_cn_area` VALUES ('2929', '麟游县', '麟游', '2919', null, '中国,陕西省,宝鸡市,麟游县', '3', '721500', '0917', '610329', 'Linyou', '107.7962300', '34.6784400');
INSERT INTO `sys_cn_area` VALUES ('2930', '凤县', '凤县', '2919', null, '中国,陕西省,宝鸡市,凤县', '3', '721700', '0917', '610330', 'Fengxian', '106.5235600', '33.9117200');
INSERT INTO `sys_cn_area` VALUES ('2931', '太白县', '太白', '2919', null, '中国,陕西省,宝鸡市,太白县', '3', '721600', '0917', '610331', 'Taibai', '107.3164600', '34.0620700');
INSERT INTO `sys_cn_area` VALUES ('2932', '咸阳市', '咸阳', '2899', null, '中国,陕西省,咸阳市', '2', '712000', '029', '610400', 'Xianyang', '108.7051170', '34.3334390');
INSERT INTO `sys_cn_area` VALUES ('2933', '秦都区', '秦都', '2932', null, '中国,陕西省,咸阳市,秦都区', '3', '712000', '029', '610402', 'Qindu', '108.7149300', '34.3380400');
INSERT INTO `sys_cn_area` VALUES ('2934', '杨陵区', '杨陵', '2932', null, '中国,陕西省,咸阳市,杨陵区', '3', '712100', '029', '610403', 'Yangling', '108.0834810', '34.2704340');
INSERT INTO `sys_cn_area` VALUES ('2935', '渭城区', '渭城', '2932', null, '中国,陕西省,咸阳市,渭城区', '3', '712000', '029', '610404', 'Weicheng', '108.7222700', '34.3319800');
INSERT INTO `sys_cn_area` VALUES ('2936', '三原县', '三原', '2932', null, '中国,陕西省,咸阳市,三原县', '3', '713800', '029', '610422', 'Sanyuan', '108.9319400', '34.6155600');
INSERT INTO `sys_cn_area` VALUES ('2937', '泾阳县', '泾阳', '2932', null, '中国,陕西省,咸阳市,泾阳县', '3', '713700', '029', '610423', 'Jingyang', '108.8425900', '34.5270500');
INSERT INTO `sys_cn_area` VALUES ('2938', '乾县', '乾县', '2932', null, '中国,陕西省,咸阳市,乾县', '3', '713300', '029', '610424', 'Qianxian', '108.2423100', '34.5294600');
INSERT INTO `sys_cn_area` VALUES ('2939', '礼泉县', '礼泉', '2932', null, '中国,陕西省,咸阳市,礼泉县', '3', '713200', '029', '610425', 'Liquan', '108.4263000', '34.4845500');
INSERT INTO `sys_cn_area` VALUES ('2940', '永寿县', '永寿', '2932', null, '中国,陕西省,咸阳市,永寿县', '3', '713400', '029', '610426', 'Yongshou', '108.1447400', '34.6908100');
INSERT INTO `sys_cn_area` VALUES ('2941', '彬县', '彬县', '2932', null, '中国,陕西省,咸阳市,彬县', '3', '713500', '029', '610427', 'Binxian', '108.0846800', '35.0342000');
INSERT INTO `sys_cn_area` VALUES ('2942', '长武县', '长武', '2932', null, '中国,陕西省,咸阳市,长武县', '3', '713600', '029', '610428', 'Changwu', '107.7951000', '35.2067000');
INSERT INTO `sys_cn_area` VALUES ('2943', '旬邑县', '旬邑', '2932', null, '中国,陕西省,咸阳市,旬邑县', '3', '711300', '029', '610429', 'Xunyi', '108.3341000', '35.1133800');
INSERT INTO `sys_cn_area` VALUES ('2944', '淳化县', '淳化', '2932', null, '中国,陕西省,咸阳市,淳化县', '3', '711200', '029', '610430', 'Chunhua', '108.5802600', '34.7988600');
INSERT INTO `sys_cn_area` VALUES ('2945', '武功县', '武功', '2932', null, '中国,陕西省,咸阳市,武功县', '3', '712200', '029', '610431', 'Wugong', '108.2043400', '34.2600300');
INSERT INTO `sys_cn_area` VALUES ('2946', '兴平市', '兴平', '2932', null, '中国,陕西省,咸阳市,兴平市', '3', '713100', '029', '610481', 'Xingping', '108.4905700', '34.2978500');
INSERT INTO `sys_cn_area` VALUES ('2947', '渭南市', '渭南', '2899', null, '中国,陕西省,渭南市', '2', '714000', '0913', '610500', 'Weinan', '109.5028820', '34.4993810');
INSERT INTO `sys_cn_area` VALUES ('2948', '临渭区', '临渭', '2947', null, '中国,陕西省,渭南市,临渭区', '3', '714000', '0913', '610502', 'Linwei', '109.4929600', '34.4982200');
INSERT INTO `sys_cn_area` VALUES ('2949', '华县', '华县', '2947', null, '中国,陕西省,渭南市,华县', '3', '714100', '0913', '610521', 'Huaxian', '109.7718500', '34.5125500');
INSERT INTO `sys_cn_area` VALUES ('2950', '潼关县', '潼关', '2947', null, '中国,陕西省,渭南市,潼关县', '3', '714300', '0913', '610522', 'Tongguan', '110.2436200', '34.5428400');
INSERT INTO `sys_cn_area` VALUES ('2951', '大荔县', '大荔', '2947', null, '中国,陕西省,渭南市,大荔县', '3', '715100', '0913', '610523', 'Dali', '109.9421600', '34.7956500');
INSERT INTO `sys_cn_area` VALUES ('2952', '合阳县', '合阳', '2947', null, '中国,陕西省,渭南市,合阳县', '3', '715300', '0913', '610524', 'Heyang', '110.1486200', '35.2380500');
INSERT INTO `sys_cn_area` VALUES ('2953', '澄城县', '澄城', '2947', null, '中国,陕西省,渭南市,澄城县', '3', '715200', '0913', '610525', 'Chengcheng', '109.9344400', '35.1839600');
INSERT INTO `sys_cn_area` VALUES ('2954', '蒲城县', '蒲城', '2947', null, '中国,陕西省,渭南市,蒲城县', '3', '715500', '0913', '610526', 'Pucheng', '109.5903000', '34.9568000');
INSERT INTO `sys_cn_area` VALUES ('2955', '白水县', '白水', '2947', null, '中国,陕西省,渭南市,白水县', '3', '715600', '0913', '610527', 'Baishui', '109.5928600', '35.1786300');
INSERT INTO `sys_cn_area` VALUES ('2956', '富平县', '富平', '2947', null, '中国,陕西省,渭南市,富平县', '3', '711700', '0913', '610528', 'Fuping', '109.1802000', '34.7510900');
INSERT INTO `sys_cn_area` VALUES ('2957', '韩城市', '韩城', '2947', null, '中国,陕西省,渭南市,韩城市', '3', '715400', '0913', '610581', 'Hancheng', '110.4423800', '35.4792600');
INSERT INTO `sys_cn_area` VALUES ('2958', '华阴市', '华阴', '2947', null, '中国,陕西省,渭南市,华阴市', '3', '714200', '0913', '610582', 'Huayin', '110.0875200', '34.5660800');
INSERT INTO `sys_cn_area` VALUES ('2959', '延安市', '延安', '2899', null, '中国,陕西省,延安市', '2', '716000', '0911', '610600', 'Yan\'an', '109.4908100', '36.5965370');
INSERT INTO `sys_cn_area` VALUES ('2960', '宝塔区', '宝塔', '2959', null, '中国,陕西省,延安市,宝塔区', '3', '716000', '0911', '610602', 'Baota', '109.4933600', '36.5915400');
INSERT INTO `sys_cn_area` VALUES ('2961', '延长县', '延长', '2959', null, '中国,陕西省,延安市,延长县', '3', '717100', '0911', '610621', 'Yanchang', '110.0108300', '36.5790400');
INSERT INTO `sys_cn_area` VALUES ('2962', '延川县', '延川', '2959', null, '中国,陕西省,延安市,延川县', '3', '717200', '0911', '610622', 'Yanchuan', '110.1941500', '36.8781700');
INSERT INTO `sys_cn_area` VALUES ('2963', '子长县', '子长', '2959', null, '中国,陕西省,延安市,子长县', '3', '717300', '0911', '610623', 'Zichang', '109.6753200', '37.1425300');
INSERT INTO `sys_cn_area` VALUES ('2964', '安塞县', '安塞', '2959', null, '中国,陕西省,延安市,安塞县', '3', '717400', '0911', '610624', 'Ansai', '109.3270800', '36.8650700');
INSERT INTO `sys_cn_area` VALUES ('2965', '志丹县', '志丹', '2959', null, '中国,陕西省,延安市,志丹县', '3', '717500', '0911', '610625', 'Zhidan', '108.7681500', '36.8217700');
INSERT INTO `sys_cn_area` VALUES ('2966', '吴起县', '吴起', '2959', null, '中国,陕西省,延安市,吴起县', '3', '717600', '0911', '610626', 'Wuqi', '108.1761100', '36.9278500');
INSERT INTO `sys_cn_area` VALUES ('2967', '甘泉县', '甘泉', '2959', null, '中国,陕西省,延安市,甘泉县', '3', '716100', '0911', '610627', 'Ganquan', '109.3501200', '36.2775400');
INSERT INTO `sys_cn_area` VALUES ('2968', '富县', '富县', '2959', null, '中国,陕西省,延安市,富县', '3', '727500', '0911', '610628', 'Fuxian', '109.3792700', '35.9880300');
INSERT INTO `sys_cn_area` VALUES ('2969', '洛川县', '洛川', '2959', null, '中国,陕西省,延安市,洛川县', '3', '727400', '0911', '610629', 'Luochuan', '109.4328600', '35.7607600');
INSERT INTO `sys_cn_area` VALUES ('2970', '宜川县', '宜川', '2959', null, '中国,陕西省,延安市,宜川县', '3', '716200', '0911', '610630', 'Yichuan', '110.1719600', '36.0473200');
INSERT INTO `sys_cn_area` VALUES ('2971', '黄龙县', '黄龙', '2959', null, '中国,陕西省,延安市,黄龙县', '3', '715700', '0911', '610631', 'Huanglong', '109.8425900', '35.5834900');
INSERT INTO `sys_cn_area` VALUES ('2972', '黄陵县', '黄陵', '2959', null, '中国,陕西省,延安市,黄陵县', '3', '727300', '0911', '610632', 'Huangling', '109.2633300', '35.5835700');
INSERT INTO `sys_cn_area` VALUES ('2973', '汉中市', '汉中', '2899', null, '中国,陕西省,汉中市', '2', '723000', '0916', '610700', 'Hanzhong', '107.0286210', '33.0776680');
INSERT INTO `sys_cn_area` VALUES ('2974', '汉台区', '汉台', '2973', null, '中国,陕西省,汉中市,汉台区', '3', '723000', '0916', '610702', 'Hantai', '107.0318700', '33.0677400');
INSERT INTO `sys_cn_area` VALUES ('2975', '南郑县', '南郑', '2973', null, '中国,陕西省,汉中市,南郑县', '3', '723100', '0916', '610721', 'Nanzheng', '106.9402400', '33.0029900');
INSERT INTO `sys_cn_area` VALUES ('2976', '城固县', '城固', '2973', null, '中国,陕西省,汉中市,城固县', '3', '723200', '0916', '610722', 'Chenggu', '107.3336700', '33.1566100');
INSERT INTO `sys_cn_area` VALUES ('2977', '洋县', '洋县', '2973', null, '中国,陕西省,汉中市,洋县', '3', '723300', '0916', '610723', 'Yangxian', '107.5467200', '33.2210200');
INSERT INTO `sys_cn_area` VALUES ('2978', '西乡县', '西乡', '2973', null, '中国,陕西省,汉中市,西乡县', '3', '723500', '0916', '610724', 'Xixiang', '107.7686700', '32.9841100');
INSERT INTO `sys_cn_area` VALUES ('2979', '勉县', '勉县', '2973', null, '中国,陕西省,汉中市,勉县', '3', '724200', '0916', '610725', 'Mianxian', '106.6758400', '33.1527300');
INSERT INTO `sys_cn_area` VALUES ('2980', '宁强县', '宁强', '2973', null, '中国,陕西省,汉中市,宁强县', '3', '724400', '0916', '610726', 'Ningqiang', '106.2595800', '32.8288100');
INSERT INTO `sys_cn_area` VALUES ('2981', '略阳县', '略阳', '2973', null, '中国,陕西省,汉中市,略阳县', '3', '724300', '0916', '610727', 'Lueyang', '106.1539900', '33.3300900');
INSERT INTO `sys_cn_area` VALUES ('2982', '镇巴县', '镇巴', '2973', null, '中国,陕西省,汉中市,镇巴县', '3', '723600', '0916', '610728', 'Zhenba', '107.8964800', '32.5348700');
INSERT INTO `sys_cn_area` VALUES ('2983', '留坝县', '留坝', '2973', null, '中国,陕西省,汉中市,留坝县', '3', '724100', '0916', '610729', 'Liuba', '106.9223300', '33.6160600');
INSERT INTO `sys_cn_area` VALUES ('2984', '佛坪县', '佛坪', '2973', null, '中国,陕西省,汉中市,佛坪县', '3', '723400', '0916', '610730', 'Foping', '107.9897400', '33.5249600');
INSERT INTO `sys_cn_area` VALUES ('2985', '榆林市', '榆林', '2899', null, '中国,陕西省,榆林市', '2', '719000', '0912', '610800', 'Yulin', '109.7411930', '38.2901620');
INSERT INTO `sys_cn_area` VALUES ('2986', '榆阳区', '榆阳', '2985', null, '中国,陕西省,榆林市,榆阳区', '3', '719000', '0912', '610802', 'Yuyang', '109.7347300', '38.2784300');
INSERT INTO `sys_cn_area` VALUES ('2987', '神木县', '神木', '2985', null, '中国,陕西省,榆林市,神木县', '3', '719300', '0912', '610821', 'Shenmu', '110.4989000', '38.8423400');
INSERT INTO `sys_cn_area` VALUES ('2988', '府谷县', '府谷', '2985', null, '中国,陕西省,榆林市,府谷县', '3', '719400', '0912', '610822', 'Fugu', '111.0672300', '39.0280500');
INSERT INTO `sys_cn_area` VALUES ('2989', '横山县', '横山', '2985', null, '中国,陕西省,榆林市,横山县', '3', '719100', '0912', '610823', 'Hengshan', '109.2956800', '37.9580000');
INSERT INTO `sys_cn_area` VALUES ('2990', '靖边县', '靖边', '2985', null, '中国,陕西省,榆林市,靖边县', '3', '718500', '0912', '610824', 'Jingbian', '108.7941200', '37.5993800');
INSERT INTO `sys_cn_area` VALUES ('2991', '定边县', '定边', '2985', null, '中国,陕西省,榆林市,定边县', '3', '718600', '0912', '610825', 'Dingbian', '107.5979300', '37.5903700');
INSERT INTO `sys_cn_area` VALUES ('2992', '绥德县', '绥德', '2985', null, '中国,陕西省,榆林市,绥德县', '3', '718000', '0912', '610826', 'Suide', '110.2612600', '37.4977800');
INSERT INTO `sys_cn_area` VALUES ('2993', '米脂县', '米脂', '2985', null, '中国,陕西省,榆林市,米脂县', '3', '718100', '0912', '610827', 'Mizhi', '110.1841700', '37.7552900');
INSERT INTO `sys_cn_area` VALUES ('2994', '佳县', '佳县', '2985', null, '中国,陕西省,榆林市,佳县', '3', '719200', '0912', '610828', 'Jiaxian', '110.4936200', '38.0224800');
INSERT INTO `sys_cn_area` VALUES ('2995', '吴堡县', '吴堡', '2985', null, '中国,陕西省,榆林市,吴堡县', '3', '718200', '0912', '610829', 'Wubu', '110.7453300', '37.4570900');
INSERT INTO `sys_cn_area` VALUES ('2996', '清涧县', '清涧', '2985', null, '中国,陕西省,榆林市,清涧县', '3', '718300', '0912', '610830', 'Qingjian', '110.1217300', '37.0885400');
INSERT INTO `sys_cn_area` VALUES ('2997', '子洲县', '子洲', '2985', null, '中国,陕西省,榆林市,子洲县', '3', '718400', '0912', '610831', 'Zizhou', '110.0348800', '37.6123800');
INSERT INTO `sys_cn_area` VALUES ('2998', '安康市', '安康', '2899', null, '中国,陕西省,安康市', '2', '725000', '0915', '610900', 'Ankang', '109.0292730', '32.6903000');
INSERT INTO `sys_cn_area` VALUES ('2999', '汉滨区', '汉滨', '2998', null, '中国,陕西省,安康市,汉滨区', '3', '725000', '0915', '610902', 'Hanbin', '109.0268300', '32.6951700');
INSERT INTO `sys_cn_area` VALUES ('3000', '汉阴县', '汉阴', '2998', null, '中国,陕西省,安康市,汉阴县', '3', '725100', '0915', '610921', 'Hanyin', '108.5109800', '32.8912900');
INSERT INTO `sys_cn_area` VALUES ('3001', '石泉县', '石泉', '2998', null, '中国,陕西省,安康市,石泉县', '3', '725200', '0915', '610922', 'Shiquan', '108.2475500', '33.0397100');
INSERT INTO `sys_cn_area` VALUES ('3002', '宁陕县', '宁陕', '2998', null, '中国,陕西省,安康市,宁陕县', '3', '711600', '0915', '610923', 'Ningshan', '108.3151500', '33.3172600');
INSERT INTO `sys_cn_area` VALUES ('3003', '紫阳县', '紫阳', '2998', null, '中国,陕西省,安康市,紫阳县', '3', '725300', '0915', '610924', 'Ziyang', '108.5368000', '32.5211500');
INSERT INTO `sys_cn_area` VALUES ('3004', '岚皋县', '岚皋', '2998', null, '中国,陕西省,安康市,岚皋县', '3', '725400', '0915', '610925', 'Langao', '108.9028900', '32.3079400');
INSERT INTO `sys_cn_area` VALUES ('3005', '平利县', '平利', '2998', null, '中国,陕西省,安康市,平利县', '3', '725500', '0915', '610926', 'Pingli', '109.3577500', '32.3911100');
INSERT INTO `sys_cn_area` VALUES ('3006', '镇坪县', '镇坪', '2998', null, '中国,陕西省,安康市,镇坪县', '3', '725600', '0915', '610927', 'Zhenping', '109.5245600', '31.8833000');
INSERT INTO `sys_cn_area` VALUES ('3007', '旬阳县', '旬阳', '2998', null, '中国,陕西省,安康市,旬阳县', '3', '725700', '0915', '610928', 'Xunyang', '109.3619000', '32.8320700');
INSERT INTO `sys_cn_area` VALUES ('3008', '白河县', '白河', '2998', null, '中国,陕西省,安康市,白河县', '3', '725800', '0915', '610929', 'Baihe', '110.1131500', '32.8095500');
INSERT INTO `sys_cn_area` VALUES ('3009', '商洛市', '商洛', '2899', null, '中国,陕西省,商洛市', '2', '726000', '0914', '611000', 'Shangluo', '109.9397760', '33.8683190');
INSERT INTO `sys_cn_area` VALUES ('3010', '商州区', '商州', '3009', null, '中国,陕西省,商洛市,商州区', '3', '726000', '0914', '611002', 'Shangzhou', '109.9412600', '33.8627000');
INSERT INTO `sys_cn_area` VALUES ('3011', '洛南县', '洛南', '3009', null, '中国,陕西省,商洛市,洛南县', '3', '726100', '0914', '611021', 'Luonan', '110.1464500', '34.0899400');
INSERT INTO `sys_cn_area` VALUES ('3012', '丹凤县', '丹凤', '3009', null, '中国,陕西省,商洛市,丹凤县', '3', '726200', '0914', '611022', 'Danfeng', '110.3348600', '33.6946800');
INSERT INTO `sys_cn_area` VALUES ('3013', '商南县', '商南', '3009', null, '中国,陕西省,商洛市,商南县', '3', '726300', '0914', '611023', 'Shangnan', '110.8837500', '33.5258100');
INSERT INTO `sys_cn_area` VALUES ('3014', '山阳县', '山阳', '3009', null, '中国,陕西省,商洛市,山阳县', '3', '726400', '0914', '611024', 'Shanyang', '109.8878400', '33.5293100');
INSERT INTO `sys_cn_area` VALUES ('3015', '镇安县', '镇安', '3009', null, '中国,陕西省,商洛市,镇安县', '3', '711500', '0914', '611025', 'Zhen\'an', '109.1537400', '33.4236600');
INSERT INTO `sys_cn_area` VALUES ('3016', '柞水县', '柞水', '3009', null, '中国,陕西省,商洛市,柞水县', '3', '711400', '0914', '611026', 'Zhashui', '109.1110500', '33.6831000');
INSERT INTO `sys_cn_area` VALUES ('3017', '西咸新区', '西咸', '2899', null, '中国,陕西省,西咸新区', '2', '712000', '029', '611100', 'Xixian', '108.8106540', '34.3071440');
INSERT INTO `sys_cn_area` VALUES ('3018', '空港新城', '空港', '3017', null, '中国,陕西省,西咸新区,空港新城', '3', '461000', '0374', '611101', 'Konggang', '108.7605290', '34.4408940');
INSERT INTO `sys_cn_area` VALUES ('3019', '沣东新城', '沣东', '3017', null, '中国,陕西省,西咸新区,沣东新城', '3', '710000', '029', '611102', 'Fengdong', '108.8298800', '34.2674310');
INSERT INTO `sys_cn_area` VALUES ('3020', '秦汉新城', '秦汉', '3017', null, '中国,陕西省,西咸新区,秦汉新城', '3', '712000', '029', '611103', 'Qinhan', '108.8381200', '34.3865130');
INSERT INTO `sys_cn_area` VALUES ('3021', '沣西新城', '沣西', '3017', null, '中国,陕西省,西咸新区,沣西新城', '3', '710000', '029', '611104', 'Fengxi', '108.7121500', '34.1904530');
INSERT INTO `sys_cn_area` VALUES ('3022', '泾河新城', '泾河', '3017', null, '中国,陕西省,西咸新区,泾河新城', '3', '713700', '029', '611105', 'Jinghe', '109.0496030', '34.4605870');
INSERT INTO `sys_cn_area` VALUES ('3023', '甘肃省', '甘肃', '1', null, '中国,甘肃省', '1', null, '', '620000', 'Gansu', '103.8235570', '36.0580390');
INSERT INTO `sys_cn_area` VALUES ('3024', '兰州市', '兰州', '3023', null, '中国,甘肃省,兰州市', '2', '730030', '0931', '620100', 'Lanzhou', '103.8235570', '36.0580390');
INSERT INTO `sys_cn_area` VALUES ('3025', '城关区', '城关', '3024', null, '中国,甘肃省,兰州市,城关区', '3', '730030', '0931', '620102', 'Chengguan', '103.8252000', '36.0572500');
INSERT INTO `sys_cn_area` VALUES ('3026', '七里河区', '七里河', '3024', null, '中国,甘肃省,兰州市,七里河区', '3', '730050', '0931', '620103', 'Qilihe', '103.7856400', '36.0658500');
INSERT INTO `sys_cn_area` VALUES ('3027', '西固区', '西固', '3024', null, '中国,甘肃省,兰州市,西固区', '3', '730060', '0931', '620104', 'Xigu', '103.6281100', '36.0885800');
INSERT INTO `sys_cn_area` VALUES ('3028', '安宁区', '安宁', '3024', null, '中国,甘肃省,兰州市,安宁区', '3', '730070', '0931', '620105', 'Anning', '103.7189000', '36.1038400');
INSERT INTO `sys_cn_area` VALUES ('3029', '红古区', '红古', '3024', null, '中国,甘肃省,兰州市,红古区', '3', '730084', '0931', '620111', 'Honggu', '102.8595500', '36.3453700');
INSERT INTO `sys_cn_area` VALUES ('3030', '永登县', '永登', '3024', null, '中国,甘肃省,兰州市,永登县', '3', '730300', '0931', '620121', 'Yongdeng', '103.2605500', '36.7352200');
INSERT INTO `sys_cn_area` VALUES ('3031', '皋兰县', '皋兰', '3024', null, '中国,甘肃省,兰州市,皋兰县', '3', '730200', '0931', '620122', 'Gaolan', '103.9450600', '36.3321500');
INSERT INTO `sys_cn_area` VALUES ('3032', '榆中县', '榆中', '3024', null, '中国,甘肃省,兰州市,榆中县', '3', '730100', '0931', '620123', 'Yuzhong', '104.1145000', '35.8441500');
INSERT INTO `sys_cn_area` VALUES ('3033', '嘉峪关市', '嘉峪关', '3023', null, '中国,甘肃省,嘉峪关市', '2', '735100', '0937', '620200', 'Jiayuguan', '98.2773040', '39.7865290');
INSERT INTO `sys_cn_area` VALUES ('3034', '雄关区', '雄关', '3033', null, '中国,甘肃省,嘉峪关市,雄关区', '3', '735100', '0937', '620201', 'Xiongguan', '98.2773980', '39.7792500');
INSERT INTO `sys_cn_area` VALUES ('3035', '长城区', '长城', '3033', null, '中国,甘肃省,嘉峪关市,长城区', '3', '735106', '0937', '620202', 'Changcheng', '98.2735230', '39.7874310');
INSERT INTO `sys_cn_area` VALUES ('3036', '镜铁区', '镜铁', '3033', null, '中国,甘肃省,嘉峪关市,镜铁区', '3', '735100', '0937', '620203', 'Jingtie', '98.2773040', '39.7865290');
INSERT INTO `sys_cn_area` VALUES ('3037', '金昌市', '金昌', '3023', null, '中国,甘肃省,金昌市', '2', '737100', '0935', '620300', 'Jinchang', '102.1878880', '38.5142380');
INSERT INTO `sys_cn_area` VALUES ('3038', '金川区', '金川', '3037', null, '中国,甘肃省,金昌市,金川区', '3', '737100', '0935', '620302', 'Jinchuan', '102.1937600', '38.5210100');
INSERT INTO `sys_cn_area` VALUES ('3039', '永昌县', '永昌', '3037', null, '中国,甘肃省,金昌市,永昌县', '3', '737200', '0935', '620321', 'Yongchang', '101.9722200', '38.2471100');
INSERT INTO `sys_cn_area` VALUES ('3040', '白银市', '白银', '3023', null, '中国,甘肃省,白银市', '2', '730900', '0943', '620400', 'Baiyin', '104.1736060', '36.5456800');
INSERT INTO `sys_cn_area` VALUES ('3041', '白银区', '白银', '3040', null, '中国,甘肃省,白银市,白银区', '3', '730900', '0943', '620402', 'Baiyin', '104.1735500', '36.5441100');
INSERT INTO `sys_cn_area` VALUES ('3042', '平川区', '平川', '3040', null, '中国,甘肃省,白银市,平川区', '3', '730913', '0943', '620403', 'Pingchuan', '104.8249800', '36.7277000');
INSERT INTO `sys_cn_area` VALUES ('3043', '靖远县', '靖远', '3040', null, '中国,甘肃省,白银市,靖远县', '3', '730600', '0943', '620421', 'Jingyuan', '104.6832500', '36.5660200');
INSERT INTO `sys_cn_area` VALUES ('3044', '会宁县', '会宁', '3040', null, '中国,甘肃省,白银市,会宁县', '3', '730700', '0943', '620422', 'Huining', '105.0529700', '35.6962600');
INSERT INTO `sys_cn_area` VALUES ('3045', '景泰县', '景泰', '3040', null, '中国,甘肃省,白银市,景泰县', '3', '730400', '0943', '620423', 'Jingtai', '104.0629500', '37.1835900');
INSERT INTO `sys_cn_area` VALUES ('3046', '天水市', '天水', '3023', null, '中国,甘肃省,天水市', '2', '741000', '0938', '620500', 'Tianshui', '105.7249980', '34.5785290');
INSERT INTO `sys_cn_area` VALUES ('3047', '秦州区', '秦州', '3046', null, '中国,甘肃省,天水市,秦州区', '3', '741000', '0938', '620502', 'Qinzhou', '105.7242100', '34.5808900');
INSERT INTO `sys_cn_area` VALUES ('3048', '麦积区', '麦积', '3046', null, '中国,甘肃省,天水市,麦积区', '3', '741020', '0938', '620503', 'Maiji', '105.8901300', '34.5706900');
INSERT INTO `sys_cn_area` VALUES ('3049', '清水县', '清水', '3046', null, '中国,甘肃省,天水市,清水县', '3', '741400', '0938', '620521', 'Qingshui', '106.1367100', '34.7503200');
INSERT INTO `sys_cn_area` VALUES ('3050', '秦安县', '秦安', '3046', null, '中国,甘肃省,天水市,秦安县', '3', '741600', '0938', '620522', 'Qin\'an', '105.6695500', '34.8589400');
INSERT INTO `sys_cn_area` VALUES ('3051', '甘谷县', '甘谷', '3046', null, '中国,甘肃省,天水市,甘谷县', '3', '741200', '0938', '620523', 'Gangu', '105.3329100', '34.7366500');
INSERT INTO `sys_cn_area` VALUES ('3052', '武山县', '武山', '3046', null, '中国,甘肃省,天水市,武山县', '3', '741300', '0938', '620524', 'Wushan', '104.8838200', '34.7212300');
INSERT INTO `sys_cn_area` VALUES ('3053', '张家川回族自治县', '张家川', '3046', null, '中国,甘肃省,天水市,张家川回族自治县', '3', '741500', '0938', '620525', 'Zhangjiachuan', '106.2158200', '34.9958200');
INSERT INTO `sys_cn_area` VALUES ('3054', '武威市', '武威', '3023', null, '中国,甘肃省,武威市', '2', '733000', '0935', '620600', 'Wuwei', '102.6346970', '37.9299960');
INSERT INTO `sys_cn_area` VALUES ('3055', '凉州区', '凉州', '3054', null, '中国,甘肃省,武威市,凉州区', '3', '733000', '0935', '620602', 'Liangzhou', '102.6420300', '37.9283200');
INSERT INTO `sys_cn_area` VALUES ('3056', '民勤县', '民勤', '3054', null, '中国,甘肃省,武威市,民勤县', '3', '733300', '0935', '620621', 'Minqin', '103.0901100', '38.6248700');
INSERT INTO `sys_cn_area` VALUES ('3057', '古浪县', '古浪', '3054', null, '中国,甘肃省,武威市,古浪县', '3', '733100', '0935', '620622', 'Gulang', '102.8915400', '37.4650800');
INSERT INTO `sys_cn_area` VALUES ('3058', '天祝藏族自治县', '天祝', '3054', null, '中国,甘肃省,武威市,天祝藏族自治县', '3', '733200', '0935', '620623', 'Tianzhu', '103.1361000', '36.9771500');
INSERT INTO `sys_cn_area` VALUES ('3059', '张掖市', '张掖', '3023', null, '中国,甘肃省,张掖市', '2', '734000', '0936', '620700', 'Zhangye', '100.4554720', '38.9328970');
INSERT INTO `sys_cn_area` VALUES ('3060', '甘州区', '甘州', '3059', null, '中国,甘肃省,张掖市,甘州区', '3', '734000', '0936', '620702', 'Ganzhou', '100.4527000', '38.9294700');
INSERT INTO `sys_cn_area` VALUES ('3061', '肃南裕固族自治县', '肃南', '3059', null, '中国,甘肃省,张掖市,肃南裕固族自治县', '3', '734400', '0936', '620721', 'Sunan', '99.6140700', '38.8377600');
INSERT INTO `sys_cn_area` VALUES ('3062', '民乐县', '民乐', '3059', null, '中国,甘肃省,张掖市,民乐县', '3', '734500', '0936', '620722', 'Minle', '100.8109100', '38.4347900');
INSERT INTO `sys_cn_area` VALUES ('3063', '临泽县', '临泽', '3059', null, '中国,甘肃省,张掖市,临泽县', '3', '734200', '0936', '620723', 'Linze', '100.1644500', '39.1525200');
INSERT INTO `sys_cn_area` VALUES ('3064', '高台县', '高台', '3059', null, '中国,甘肃省,张掖市,高台县', '3', '734300', '0936', '620724', 'Gaotai', '99.8191800', '39.3782900');
INSERT INTO `sys_cn_area` VALUES ('3065', '山丹县', '山丹', '3059', null, '中国,甘肃省,张掖市,山丹县', '3', '734100', '0936', '620725', 'Shandan', '101.0935900', '38.7846800');
INSERT INTO `sys_cn_area` VALUES ('3066', '平凉市', '平凉', '3023', null, '中国,甘肃省,平凉市', '2', '744000', '0933', '620800', 'Pingliang', '106.6846910', '35.5427900');
INSERT INTO `sys_cn_area` VALUES ('3067', '崆峒区', '崆峒', '3066', null, '中国,甘肃省,平凉市,崆峒区', '3', '744000', '0933', '620802', 'Kongtong', '106.6748300', '35.5426200');
INSERT INTO `sys_cn_area` VALUES ('3068', '泾川县', '泾川', '3066', null, '中国,甘肃省,平凉市,泾川县', '3', '744300', '0933', '620821', 'Jingchuan', '107.3658100', '35.3322300');
INSERT INTO `sys_cn_area` VALUES ('3069', '灵台县', '灵台', '3066', null, '中国,甘肃省,平凉市,灵台县', '3', '744400', '0933', '620822', 'Lingtai', '107.6174000', '35.0676800');
INSERT INTO `sys_cn_area` VALUES ('3070', '崇信县', '崇信', '3066', null, '中国,甘肃省,平凉市,崇信县', '3', '744200', '0933', '620823', 'Chongxin', '107.0373800', '35.3034400');
INSERT INTO `sys_cn_area` VALUES ('3071', '华亭县', '华亭', '3066', null, '中国,甘肃省,平凉市,华亭县', '3', '744100', '0933', '620824', 'Huating', '106.6546300', '35.2183000');
INSERT INTO `sys_cn_area` VALUES ('3072', '庄浪县', '庄浪', '3066', null, '中国,甘肃省,平凉市,庄浪县', '3', '744600', '0933', '620825', 'Zhuanglang', '106.0366200', '35.2023500');
INSERT INTO `sys_cn_area` VALUES ('3073', '静宁县', '静宁', '3066', null, '中国,甘肃省,平凉市,静宁县', '3', '743400', '0933', '620826', 'Jingning', '105.7272300', '35.5199100');
INSERT INTO `sys_cn_area` VALUES ('3074', '酒泉市', '酒泉', '3023', null, '中国,甘肃省,酒泉市', '2', '735000', '0937', '620900', 'Jiuquan', '98.5107950', '39.7440230');
INSERT INTO `sys_cn_area` VALUES ('3075', '肃州区', '肃州', '3074', null, '中国,甘肃省,酒泉市,肃州区', '3', '735000', '0937', '620902', 'Suzhou', '98.5077500', '39.7450600');
INSERT INTO `sys_cn_area` VALUES ('3076', '金塔县', '金塔', '3074', null, '中国,甘肃省,酒泉市,金塔县', '3', '735300', '0937', '620921', 'Jinta', '98.9000200', '39.9773300');
INSERT INTO `sys_cn_area` VALUES ('3077', '瓜州县', '瓜州', '3074', null, '中国,甘肃省,酒泉市,瓜州县', '3', '736100', '0937', '620922', 'Guazhou', '95.7827100', '40.5154800');
INSERT INTO `sys_cn_area` VALUES ('3078', '肃北蒙古族自治县', '肃北', '3074', null, '中国,甘肃省,酒泉市,肃北蒙古族自治县', '3', '736300', '0937', '620923', 'Subei', '94.8764900', '39.5121400');
INSERT INTO `sys_cn_area` VALUES ('3079', '阿克塞哈萨克族自治县', '阿克塞', '3074', null, '中国,甘肃省,酒泉市,阿克塞哈萨克族自治县', '3', '736400', '0937', '620924', 'Akesai', '94.3409700', '39.6343500');
INSERT INTO `sys_cn_area` VALUES ('3080', '玉门市', '玉门', '3074', null, '中国,甘肃省,酒泉市,玉门市', '3', '735200', '0937', '620981', 'Yumen', '97.0453800', '40.2917200');
INSERT INTO `sys_cn_area` VALUES ('3081', '敦煌市', '敦煌', '3074', null, '中国,甘肃省,酒泉市,敦煌市', '3', '736200', '0937', '620982', 'Dunhuang', '94.6615900', '40.1421100');
INSERT INTO `sys_cn_area` VALUES ('3082', '庆阳市', '庆阳', '3023', null, '中国,甘肃省,庆阳市', '2', '745000', '0934', '621000', 'Qingyang', '107.6383720', '35.7342180');
INSERT INTO `sys_cn_area` VALUES ('3083', '西峰区', '西峰', '3082', null, '中国,甘肃省,庆阳市,西峰区', '3', '745000', '0934', '621002', 'Xifeng', '107.6510700', '35.7306500');
INSERT INTO `sys_cn_area` VALUES ('3084', '庆城县', '庆城', '3082', null, '中国,甘肃省,庆阳市,庆城县', '3', '745100', '0934', '621021', 'Qingcheng', '107.8827200', '36.0150700');
INSERT INTO `sys_cn_area` VALUES ('3085', '环县', '环县', '3082', null, '中国,甘肃省,庆阳市,环县', '3', '745700', '0934', '621022', 'Huanxian', '107.3083500', '36.5684600');
INSERT INTO `sys_cn_area` VALUES ('3086', '华池县', '华池', '3082', null, '中国,甘肃省,庆阳市,华池县', '3', '745600', '0934', '621023', 'Huachi', '107.9891000', '36.4610800');
INSERT INTO `sys_cn_area` VALUES ('3087', '合水县', '合水', '3082', null, '中国,甘肃省,庆阳市,合水县', '3', '745400', '0934', '621024', 'Heshui', '108.0203200', '35.8191100');
INSERT INTO `sys_cn_area` VALUES ('3088', '正宁县', '正宁', '3082', null, '中国,甘肃省,庆阳市,正宁县', '3', '745300', '0934', '621025', 'Zhengning', '108.3600700', '35.4917400');
INSERT INTO `sys_cn_area` VALUES ('3089', '宁县', '宁县', '3082', null, '中国,甘肃省,庆阳市,宁县', '3', '745200', '0934', '621026', 'Ningxian', '107.9251700', '35.5016400');
INSERT INTO `sys_cn_area` VALUES ('3090', '镇原县', '镇原', '3082', null, '中国,甘肃省,庆阳市,镇原县', '3', '744500', '0934', '621027', 'Zhenyuan', '107.1990000', '35.6771200');
INSERT INTO `sys_cn_area` VALUES ('3091', '定西市', '定西', '3023', null, '中国,甘肃省,定西市', '2', '743000', '0932', '621100', 'Dingxi', '104.6262940', '35.5795780');
INSERT INTO `sys_cn_area` VALUES ('3092', '安定区', '安定', '3091', null, '中国,甘肃省,定西市,安定区', '3', '743000', '0932', '621102', 'Anding', '104.6106000', '35.5806600');
INSERT INTO `sys_cn_area` VALUES ('3093', '通渭县', '通渭', '3091', null, '中国,甘肃省,定西市,通渭县', '3', '743300', '0932', '621121', 'Tongwei', '105.2422400', '35.2110100');
INSERT INTO `sys_cn_area` VALUES ('3094', '陇西县', '陇西', '3091', null, '中国,甘肃省,定西市,陇西县', '3', '748100', '0932', '621122', 'Longxi', '104.6344600', '35.0023800');
INSERT INTO `sys_cn_area` VALUES ('3095', '渭源县', '渭源', '3091', null, '中国,甘肃省,定西市,渭源县', '3', '748200', '0932', '621123', 'Weiyuan', '104.2143500', '35.1364900');
INSERT INTO `sys_cn_area` VALUES ('3096', '临洮县', '临洮', '3091', null, '中国,甘肃省,定西市,临洮县', '3', '730500', '0932', '621124', 'Lintao', '103.8619600', '35.3751000');
INSERT INTO `sys_cn_area` VALUES ('3097', '漳县', '漳县', '3091', null, '中国,甘肃省,定西市,漳县', '3', '748300', '0932', '621125', 'Zhangxian', '104.4670400', '34.8497700');
INSERT INTO `sys_cn_area` VALUES ('3098', '岷县', '岷县', '3091', null, '中国,甘肃省,定西市,岷县', '3', '748400', '0932', '621126', 'Minxian', '104.0377200', '34.4344400');
INSERT INTO `sys_cn_area` VALUES ('3099', '陇南市', '陇南', '3023', null, '中国,甘肃省,陇南市', '2', '746000', '0939', '621200', 'Longnan', '104.9293790', '33.3885980');
INSERT INTO `sys_cn_area` VALUES ('3100', '武都区', '武都', '3099', null, '中国,甘肃省,陇南市,武都区', '3', '746000', '0939', '621202', 'Wudu', '104.9265200', '33.3923900');
INSERT INTO `sys_cn_area` VALUES ('3101', '成县', '成县', '3099', null, '中国,甘肃省,陇南市,成县', '3', '742500', '0939', '621221', 'Chengxian', '105.7258600', '33.7392500');
INSERT INTO `sys_cn_area` VALUES ('3102', '文县', '文县', '3099', null, '中国,甘肃省,陇南市,文县', '3', '746400', '0939', '621222', 'Wenxian', '104.6836200', '32.9433700');
INSERT INTO `sys_cn_area` VALUES ('3103', '宕昌县', '宕昌', '3099', null, '中国,甘肃省,陇南市,宕昌县', '3', '748500', '0939', '621223', 'Dangchang', '104.3934900', '34.0473200');
INSERT INTO `sys_cn_area` VALUES ('3104', '康县', '康县', '3099', null, '中国,甘肃省,陇南市,康县', '3', '746500', '0939', '621224', 'Kangxian', '105.6071100', '33.3291200');
INSERT INTO `sys_cn_area` VALUES ('3105', '西和县', '西和', '3099', null, '中国,甘肃省,陇南市,西和县', '3', '742100', '0939', '621225', 'Xihe', '105.3009900', '34.0143200');
INSERT INTO `sys_cn_area` VALUES ('3106', '礼县', '礼县', '3099', null, '中国,甘肃省,陇南市,礼县', '3', '742200', '0939', '621226', 'Lixian', '105.1778500', '34.1893500');
INSERT INTO `sys_cn_area` VALUES ('3107', '徽县', '徽县', '3099', null, '中国,甘肃省,陇南市,徽县', '3', '742300', '0939', '621227', 'Huixian', '106.0852900', '33.7689800');
INSERT INTO `sys_cn_area` VALUES ('3108', '两当县', '两当', '3099', null, '中国,甘肃省,陇南市,两当县', '3', '742400', '0939', '621228', 'Liangdang', '106.3048400', '33.9096000');
INSERT INTO `sys_cn_area` VALUES ('3109', '临夏回族自治州', '临夏', '3023', null, '中国,甘肃省,临夏回族自治州', '2', '731100', '0930', '622900', 'Linxia', '103.2120060', '35.5994460');
INSERT INTO `sys_cn_area` VALUES ('3110', '临夏市', '临夏', '3109', null, '中国,甘肃省,临夏回族自治州,临夏市', '3', '731100', '0930', '622901', 'Linxia', '103.2100000', '35.5991600');
INSERT INTO `sys_cn_area` VALUES ('3111', '临夏县', '临夏', '3109', null, '中国,甘肃省,临夏回族自治州,临夏县', '3', '731800', '0930', '622921', 'Linxia', '102.9938000', '35.4951900');
INSERT INTO `sys_cn_area` VALUES ('3112', '康乐县', '康乐', '3109', null, '中国,甘肃省,临夏回族自治州,康乐县', '3', '731500', '0930', '622922', 'Kangle', '103.7109300', '35.3721900');
INSERT INTO `sys_cn_area` VALUES ('3113', '永靖县', '永靖', '3109', null, '中国,甘肃省,临夏回族自治州,永靖县', '3', '731600', '0930', '622923', 'Yongjing', '103.3204300', '35.9383500');
INSERT INTO `sys_cn_area` VALUES ('3114', '广河县', '广河', '3109', null, '中国,甘肃省,临夏回族自治州,广河县', '3', '731300', '0930', '622924', 'Guanghe', '103.5693300', '35.4809700');
INSERT INTO `sys_cn_area` VALUES ('3115', '和政县', '和政', '3109', null, '中国,甘肃省,临夏回族自治州,和政县', '3', '731200', '0930', '622925', 'Hezheng', '103.3493600', '35.4259200');
INSERT INTO `sys_cn_area` VALUES ('3116', '东乡族自治县', '东乡族', '3109', null, '中国,甘肃省,临夏回族自治州,东乡族自治县', '3', '731400', '0930', '622926', 'Dongxiangzu', '103.3947700', '35.6647100');
INSERT INTO `sys_cn_area` VALUES ('3117', '积石山保安族东乡族撒拉族自治县', '积石山', '3109', null, '中国,甘肃省,临夏回族自治州,积石山保安族东乡族撒拉族自治县', '3', '731700', '0930', '622927', 'Jishishan', '102.8737400', '35.7182000');
INSERT INTO `sys_cn_area` VALUES ('3118', '甘南藏族自治州', '甘南', '3023', null, '中国,甘肃省,甘南藏族自治州', '2', '747000', '0941', '623000', 'Gannan', '102.9110080', '34.9863540');
INSERT INTO `sys_cn_area` VALUES ('3119', '合作市', '合作', '3118', null, '中国,甘肃省,甘南藏族自治州,合作市', '3', '747000', '0941', '623001', 'Hezuo', '102.9108200', '35.0001600');
INSERT INTO `sys_cn_area` VALUES ('3120', '临潭县', '临潭', '3118', null, '中国,甘肃省,甘南藏族自治州,临潭县', '3', '747500', '0941', '623021', 'Lintan', '103.3528700', '34.6951500');
INSERT INTO `sys_cn_area` VALUES ('3121', '卓尼县', '卓尼', '3118', null, '中国,甘肃省,甘南藏族自治州,卓尼县', '3', '747600', '0941', '623022', 'Zhuoni', '103.5081100', '34.5891900');
INSERT INTO `sys_cn_area` VALUES ('3122', '舟曲县', '舟曲', '3118', null, '中国,甘肃省,甘南藏族自治州,舟曲县', '3', '746300', '0941', '623023', 'Zhouqu', '104.3715500', '33.7846800');
INSERT INTO `sys_cn_area` VALUES ('3123', '迭部县', '迭部', '3118', null, '中国,甘肃省,甘南藏族自治州,迭部县', '3', '747400', '0941', '623024', 'Diebu', '103.2227400', '34.0562300');
INSERT INTO `sys_cn_area` VALUES ('3124', '玛曲县', '玛曲', '3118', null, '中国,甘肃省,甘南藏族自治州,玛曲县', '3', '747300', '0941', '623025', 'Maqu', '102.0754000', '33.9970000');
INSERT INTO `sys_cn_area` VALUES ('3125', '碌曲县', '碌曲', '3118', null, '中国,甘肃省,甘南藏族自治州,碌曲县', '3', '747200', '0941', '623026', 'Luqu', '102.4917600', '34.5887200');
INSERT INTO `sys_cn_area` VALUES ('3126', '夏河县', '夏河', '3118', null, '中国,甘肃省,甘南藏族自治州,夏河县', '3', '747100', '0941', '623027', 'Xiahe', '102.5221500', '35.2048700');
INSERT INTO `sys_cn_area` VALUES ('3127', '青海省', '青海', '1', null, '中国,青海省', '1', null, '', '630000', 'Qinghai', '101.7789160', '36.6231780');
INSERT INTO `sys_cn_area` VALUES ('3128', '西宁市', '西宁', '3127', null, '中国,青海省,西宁市', '2', '810000', '0971', '630100', 'Xining', '101.7789160', '36.6231780');
INSERT INTO `sys_cn_area` VALUES ('3129', '城东区', '城东', '3128', null, '中国,青海省,西宁市,城东区', '3', '810007', '0971', '630102', 'Chengdong', '101.8037300', '36.5996900');
INSERT INTO `sys_cn_area` VALUES ('3130', '城中区', '城中', '3128', null, '中国,青海省,西宁市,城中区', '3', '810000', '0971', '630103', 'Chengzhong', '101.7839400', '36.6227900');
INSERT INTO `sys_cn_area` VALUES ('3131', '城西区', '城西', '3128', null, '中国,青海省,西宁市,城西区', '3', '810001', '0971', '630104', 'Chengxi', '101.7658800', '36.6282800');
INSERT INTO `sys_cn_area` VALUES ('3132', '城北区', '城北', '3128', null, '中国,青海省,西宁市,城北区', '3', '810003', '0971', '630105', 'Chengbei', '101.7662000', '36.6501400');
INSERT INTO `sys_cn_area` VALUES ('3133', '大通回族土族自治县', '大通', '3128', null, '中国,青海省,西宁市,大通回族土族自治县', '3', '810100', '0971', '630121', 'Datong', '101.7023600', '36.9348900');
INSERT INTO `sys_cn_area` VALUES ('3134', '湟中县', '湟中', '3128', null, '中国,青海省,西宁市,湟中县', '3', '811600', '0971', '630122', 'Huangzhong', '101.5715900', '36.5008300');
INSERT INTO `sys_cn_area` VALUES ('3135', '湟源县', '湟源', '3128', null, '中国,青海省,西宁市,湟源县', '3', '812100', '0971', '630123', 'Huangyuan', '101.2564300', '36.6824300');
INSERT INTO `sys_cn_area` VALUES ('3136', '海东市', '海东', '3127', null, '中国,青海省,海东市', '2', '810700', '0972', '630200', 'Haidong', '102.1032700', '36.5029160');
INSERT INTO `sys_cn_area` VALUES ('3137', '乐都区', '乐都', '3136', null, '中国,青海省,海东市,乐都区', '3', '810700', '0972', '630202', 'Ledu', '102.4024310', '36.4802910');
INSERT INTO `sys_cn_area` VALUES ('3138', '平安县', '平安', '3136', null, '中国,青海省,海东市,平安县', '3', '810600', '0972', '630221', 'Ping\'an', '102.1042950', '36.5027140');
INSERT INTO `sys_cn_area` VALUES ('3139', '民和回族土族自治县', '民和', '3136', null, '中国,青海省,海东市,民和回族土族自治县', '3', '810800', '0972', '630222', 'Minhe', '102.8042090', '36.3294510');
INSERT INTO `sys_cn_area` VALUES ('3140', '互助土族自治县', '互助', '3136', null, '中国,青海省,海东市,互助土族自治县', '3', '810500', '0972', '630223', 'Huzhu', '101.9567340', '36.8399400');
INSERT INTO `sys_cn_area` VALUES ('3141', '化隆回族自治县', '化隆', '3136', null, '中国,青海省,海东市,化隆回族自治县', '3', '810900', '0972', '630224', 'Hualong', '102.2623290', '36.0983220');
INSERT INTO `sys_cn_area` VALUES ('3142', '循化撒拉族自治县', '循化', '3136', null, '中国,青海省,海东市,循化撒拉族自治县', '3', '811100', '0972', '630225', 'Xunhua', '102.4865340', '35.8472470');
INSERT INTO `sys_cn_area` VALUES ('3143', '海北藏族自治州', '海北', '3127', null, '中国,青海省,海北藏族自治州', '2', '812200', '0970', '632200', 'Haibei', '100.9010590', '36.9594350');
INSERT INTO `sys_cn_area` VALUES ('3144', '门源回族自治县', '门源', '3143', null, '中国,青海省,海北藏族自治州,门源回族自治县', '3', '810300', '0970', '632221', 'Menyuan', '101.6222800', '37.3761100');
INSERT INTO `sys_cn_area` VALUES ('3145', '祁连县', '祁连', '3143', null, '中国,青海省,海北藏族自治州,祁连县', '3', '810400', '0970', '632222', 'Qilian', '100.2461800', '38.1790100');
INSERT INTO `sys_cn_area` VALUES ('3146', '海晏县', '海晏', '3143', null, '中国,青海省,海北藏族自治州,海晏县', '3', '812200', '0970', '632223', 'Haiyan', '100.9927000', '36.8990200');
INSERT INTO `sys_cn_area` VALUES ('3147', '刚察县', '刚察', '3143', null, '中国,青海省,海北藏族自治州,刚察县', '3', '812300', '0970', '632224', 'Gangcha', '100.1467500', '37.3216100');
INSERT INTO `sys_cn_area` VALUES ('3148', '黄南藏族自治州', '黄南', '3127', null, '中国,青海省,黄南藏族自治州', '2', '811300', '0973', '632300', 'Huangnan', '102.0199880', '35.5177440');
INSERT INTO `sys_cn_area` VALUES ('3149', '同仁县', '同仁', '3148', null, '中国,青海省,黄南藏族自治州,同仁县', '3', '811300', '0973', '632321', 'Tongren', '102.0184000', '35.5160300');
INSERT INTO `sys_cn_area` VALUES ('3150', '尖扎县', '尖扎', '3148', null, '中国,青海省,黄南藏族自治州,尖扎县', '3', '811200', '0973', '632322', 'Jianzha', '102.0341100', '35.9394700');
INSERT INTO `sys_cn_area` VALUES ('3151', '泽库县', '泽库', '3148', null, '中国,青海省,黄南藏族自治州,泽库县', '3', '811400', '0973', '632323', 'Zeku', '101.4644400', '35.0351900');
INSERT INTO `sys_cn_area` VALUES ('3152', '河南蒙古族自治县', '河南', '3148', null, '中国,青海省,黄南藏族自治州,河南蒙古族自治县', '3', '811500', '0973', '632324', 'Henan', '101.6086400', '34.7347600');
INSERT INTO `sys_cn_area` VALUES ('3153', '海南藏族自治州', '海南', '3127', null, '中国,青海省,海南藏族自治州', '2', '813000', '0974', '632500', 'Hainan', '100.6195420', '36.2803530');
INSERT INTO `sys_cn_area` VALUES ('3154', '共和县', '共和', '3153', null, '中国,青海省,海南藏族自治州,共和县', '3', '813000', '0974', '632521', 'Gonghe', '100.6200300', '36.2841000');
INSERT INTO `sys_cn_area` VALUES ('3155', '同德县', '同德', '3153', null, '中国,青海省,海南藏族自治州,同德县', '3', '813200', '0974', '632522', 'Tongde', '100.5715900', '35.2548800');
INSERT INTO `sys_cn_area` VALUES ('3156', '贵德县', '贵德', '3153', null, '中国,青海省,海南藏族自治州,贵德县', '3', '811700', '0974', '632523', 'Guide', '101.4320000', '36.0440000');
INSERT INTO `sys_cn_area` VALUES ('3157', '兴海县', '兴海', '3153', null, '中国,青海省,海南藏族自治州,兴海县', '3', '813300', '0974', '632524', 'Xinghai', '99.9884600', '35.5903100');
INSERT INTO `sys_cn_area` VALUES ('3158', '贵南县', '贵南', '3153', null, '中国,青海省,海南藏族自治州,贵南县', '3', '813100', '0974', '632525', 'Guinan', '100.7471600', '35.5866700');
INSERT INTO `sys_cn_area` VALUES ('3159', '果洛藏族自治州', '果洛', '3127', null, '中国,青海省,果洛藏族自治州', '2', '814000', '0975', '632600', 'Golog', '100.2421430', '34.4736000');
INSERT INTO `sys_cn_area` VALUES ('3160', '玛沁县', '玛沁', '3159', null, '中国,青海省,果洛藏族自治州,玛沁县', '3', '814000', '0975', '632621', 'Maqin', '100.2390100', '34.4774600');
INSERT INTO `sys_cn_area` VALUES ('3161', '班玛县', '班玛', '3159', null, '中国,青海省,果洛藏族自治州,班玛县', '3', '814300', '0975', '632622', 'Banma', '100.7374500', '32.9325300');
INSERT INTO `sys_cn_area` VALUES ('3162', '甘德县', '甘德', '3159', null, '中国,青海省,果洛藏族自治州,甘德县', '3', '814100', '0975', '632623', 'Gande', '99.9024600', '33.9683800');
INSERT INTO `sys_cn_area` VALUES ('3163', '达日县', '达日', '3159', null, '中国,青海省,果洛藏族自治州,达日县', '3', '814200', '0975', '632624', 'Dari', '99.6517900', '33.7519300');
INSERT INTO `sys_cn_area` VALUES ('3164', '久治县', '久治', '3159', null, '中国,青海省,果洛藏族自治州,久治县', '3', '624700', '0975', '632625', 'Jiuzhi', '101.4834200', '33.4298900');
INSERT INTO `sys_cn_area` VALUES ('3165', '玛多县', '玛多', '3159', null, '中国,青海省,果洛藏族自治州,玛多县', '3', '813500', '0975', '632626', 'Maduo', '98.2099600', '34.9156700');
INSERT INTO `sys_cn_area` VALUES ('3166', '玉树藏族自治州', '玉树', '3127', null, '中国,青海省,玉树藏族自治州', '2', '815000', '0976', '632700', 'Yushu', '97.0085220', '33.0040490');
INSERT INTO `sys_cn_area` VALUES ('3167', '玉树市', '玉树', '3166', null, '中国,青海省,玉树藏族自治州,玉树市', '3', '815000', '0976', '632701', 'Yushu', '97.0087620', '33.0039300');
INSERT INTO `sys_cn_area` VALUES ('3168', '杂多县', '杂多', '3166', null, '中国,青海省,玉树藏族自治州,杂多县', '3', '815300', '0976', '632722', 'Zaduo', '95.2986400', '32.8931800');
INSERT INTO `sys_cn_area` VALUES ('3169', '称多县', '称多', '3166', null, '中国,青海省,玉树藏族自治州,称多县', '3', '815100', '0976', '632723', 'Chenduo', '97.1078800', '33.3689900');
INSERT INTO `sys_cn_area` VALUES ('3170', '治多县', '治多', '3166', null, '中国,青海省,玉树藏族自治州,治多县', '3', '815400', '0976', '632724', 'Zhiduo', '95.6157200', '33.8528000');
INSERT INTO `sys_cn_area` VALUES ('3171', '囊谦县', '囊谦', '3166', null, '中国,青海省,玉树藏族自治州,囊谦县', '3', '815200', '0976', '632725', 'Nangqian', '96.4775300', '32.2035900');
INSERT INTO `sys_cn_area` VALUES ('3172', '曲麻莱县', '曲麻莱', '3166', null, '中国,青海省,玉树藏族自治州,曲麻莱县', '3', '815500', '0976', '632726', 'Qumalai', '95.7975700', '34.1260900');
INSERT INTO `sys_cn_area` VALUES ('3173', '海西蒙古族藏族自治州', '海西', '3127', null, '中国,青海省,海西蒙古族藏族自治州', '2', '817000', '0977', '632800', 'Haixi', '97.3707850', '37.3746630');
INSERT INTO `sys_cn_area` VALUES ('3174', '格尔木市', '格尔木', '3173', null, '中国,青海省,海西蒙古族藏族自治州,格尔木市', '3', '816000', '0977', '632801', 'Geermu', '94.9032900', '36.4023600');
INSERT INTO `sys_cn_area` VALUES ('3175', '德令哈市', '德令哈', '3173', null, '中国,青海省,海西蒙古族藏族自治州,德令哈市', '3', '817000', '0977', '632802', 'Delingha', '97.3608400', '37.3694600');
INSERT INTO `sys_cn_area` VALUES ('3176', '乌兰县', '乌兰', '3173', null, '中国,青海省,海西蒙古族藏族自治州,乌兰县', '3', '817100', '0977', '632821', 'Wulan', '98.4819600', '36.9347100');
INSERT INTO `sys_cn_area` VALUES ('3177', '都兰县', '都兰', '3173', null, '中国,青海省,海西蒙古族藏族自治州,都兰县', '3', '816100', '0977', '632822', 'Dulan', '98.0922800', '36.3013500');
INSERT INTO `sys_cn_area` VALUES ('3178', '天峻县', '天峻', '3173', null, '中国,青海省,海西蒙古族藏族自治州,天峻县', '3', '817200', '0977', '632823', 'Tianjun', '99.0245300', '37.3032600');
INSERT INTO `sys_cn_area` VALUES ('3179', '宁夏回族自治区', '宁夏', '1', null, '中国,宁夏回族自治区', '1', null, '', '640000', 'Ningxia', '106.2781790', '38.4663700');
INSERT INTO `sys_cn_area` VALUES ('3180', '银川市', '银川', '3179', null, '中国,宁夏回族自治区,银川市', '2', '750004', '0951', '640100', 'Yinchuan', '106.2781790', '38.4663700');
INSERT INTO `sys_cn_area` VALUES ('3181', '兴庆区', '兴庆', '3180', null, '中国,宁夏回族自治区,银川市,兴庆区', '3', '750001', '0951', '640104', 'Xingqing', '106.2887200', '38.4739200');
INSERT INTO `sys_cn_area` VALUES ('3182', '西夏区', '西夏', '3180', null, '中国,宁夏回族自治区,银川市,西夏区', '3', '750021', '0951', '640105', 'Xixia', '106.1502300', '38.4913700');
INSERT INTO `sys_cn_area` VALUES ('3183', '金凤区', '金凤', '3180', null, '中国,宁夏回族自治区,银川市,金凤区', '3', '750011', '0951', '640106', 'Jinfeng', '106.2426100', '38.4729400');
INSERT INTO `sys_cn_area` VALUES ('3184', '永宁县', '永宁', '3180', null, '中国,宁夏回族自治区,银川市,永宁县', '3', '750100', '0951', '640121', 'Yongning', '106.2517000', '38.2755900');
INSERT INTO `sys_cn_area` VALUES ('3185', '贺兰县', '贺兰', '3180', null, '中国,宁夏回族自治区,银川市,贺兰县', '3', '750200', '0951', '640122', 'Helan', '106.3498200', '38.5544000');
INSERT INTO `sys_cn_area` VALUES ('3186', '灵武市', '灵武', '3180', null, '中国,宁夏回族自治区,银川市,灵武市', '3', '750004', '0951', '640181', 'Lingwu', '106.3399900', '38.1026600');
INSERT INTO `sys_cn_area` VALUES ('3187', '石嘴山市', '石嘴山', '3179', null, '中国,宁夏回族自治区,石嘴山市', '2', '753000', '0952', '640200', 'Shizuishan', '106.3761730', '39.0133300');
INSERT INTO `sys_cn_area` VALUES ('3188', '大武口区', '大武口', '3187', null, '中国,宁夏回族自治区,石嘴山市,大武口区', '3', '753000', '0952', '640202', 'Dawukou', '106.3771700', '39.0122600');
INSERT INTO `sys_cn_area` VALUES ('3189', '惠农区', '惠农', '3187', null, '中国,宁夏回族自治区,石嘴山市,惠农区', '3', '753600', '0952', '640205', 'Huinong', '106.7114500', '39.1319300');
INSERT INTO `sys_cn_area` VALUES ('3190', '平罗县', '平罗', '3187', null, '中国,宁夏回族自治区,石嘴山市,平罗县', '3', '753400', '0952', '640221', 'Pingluo', '106.5453800', '38.9042900');
INSERT INTO `sys_cn_area` VALUES ('3191', '吴忠市', '吴忠', '3179', null, '中国,宁夏回族自治区,吴忠市', '2', '751100', '0953', '640300', 'Wuzhong', '106.1994090', '37.9861650');
INSERT INTO `sys_cn_area` VALUES ('3192', '利通区', '利通', '3191', null, '中国,宁夏回族自治区,吴忠市,利通区', '3', '751100', '0953', '640302', 'Litong', '106.2031100', '37.9851200');
INSERT INTO `sys_cn_area` VALUES ('3193', '红寺堡区', '红寺堡', '3191', null, '中国,宁夏回族自治区,吴忠市,红寺堡区', '3', '751900', '0953', '640303', 'Hongsibao', '106.1982200', '37.9974700');
INSERT INTO `sys_cn_area` VALUES ('3194', '盐池县', '盐池', '3191', null, '中国,宁夏回族自治区,吴忠市,盐池县', '3', '751500', '0953', '640323', 'Yanchi', '107.4070700', '37.7833000');
INSERT INTO `sys_cn_area` VALUES ('3195', '同心县', '同心', '3191', null, '中国,宁夏回族自治区,吴忠市,同心县', '3', '751300', '0953', '640324', 'Tongxin', '105.9141800', '36.9811600');
INSERT INTO `sys_cn_area` VALUES ('3196', '青铜峡市', '青铜峡', '3191', null, '中国,宁夏回族自治区,吴忠市,青铜峡市', '3', '751600', '0953', '640381', 'Qingtongxia', '106.0748900', '38.0200400');
INSERT INTO `sys_cn_area` VALUES ('3197', '固原市', '固原', '3179', null, '中国,宁夏回族自治区,固原市', '2', '756000', '0954', '640400', 'Guyuan', '106.2852410', '36.0045610');
INSERT INTO `sys_cn_area` VALUES ('3198', '原州区', '原州', '3197', null, '中国,宁夏回族自治区,固原市,原州区', '3', '756000', '0954', '640402', 'Yuanzhou', '106.2877800', '36.0037400');
INSERT INTO `sys_cn_area` VALUES ('3199', '西吉县', '西吉', '3197', null, '中国,宁夏回族自治区,固原市,西吉县', '3', '756200', '0954', '640422', 'Xiji', '105.7310700', '35.9661600');
INSERT INTO `sys_cn_area` VALUES ('3200', '隆德县', '隆德', '3197', null, '中国,宁夏回族自治区,固原市,隆德县', '3', '756300', '0954', '640423', 'Longde', '106.1242600', '35.6171800');
INSERT INTO `sys_cn_area` VALUES ('3201', '泾源县', '泾源', '3197', null, '中国,宁夏回族自治区,固原市,泾源县', '3', '756400', '0954', '640424', 'Jingyuan', '106.3390200', '35.4907200');
INSERT INTO `sys_cn_area` VALUES ('3202', '彭阳县', '彭阳', '3197', null, '中国,宁夏回族自治区,固原市,彭阳县', '3', '756500', '0954', '640425', 'Pengyang', '106.6446200', '35.8507600');
INSERT INTO `sys_cn_area` VALUES ('3203', '中卫市', '中卫', '3179', null, '中国,宁夏回族自治区,中卫市', '2', '751700', '0955', '640500', 'Zhongwei', '105.1895680', '37.5149510');
INSERT INTO `sys_cn_area` VALUES ('3204', '沙坡头区', '沙坡头', '3203', null, '中国,宁夏回族自治区,中卫市,沙坡头区', '3', '755000', '0955', '640502', 'Shapotou', '105.1896200', '37.5104400');
INSERT INTO `sys_cn_area` VALUES ('3205', '中宁县', '中宁', '3203', null, '中国,宁夏回族自治区,中卫市,中宁县', '3', '751200', '0955', '640521', 'Zhongning', '105.6851500', '37.4914900');
INSERT INTO `sys_cn_area` VALUES ('3206', '海原县', '海原', '3203', null, '中国,宁夏回族自治区,中卫市,海原县', '3', '751800', '0955', '640522', 'Haiyuan', '105.6471200', '36.5649800');
INSERT INTO `sys_cn_area` VALUES ('3207', '新疆维吾尔自治区', '新疆', '1', null, '中国,新疆维吾尔自治区', '1', null, '', '650000', 'Xinjiang', '87.6177330', '43.7928180');
INSERT INTO `sys_cn_area` VALUES ('3208', '乌鲁木齐市', '乌鲁木齐', '3207', null, '中国,新疆维吾尔自治区,乌鲁木齐市', '2', '830002', '0991', '650100', 'Urumqi', '87.6177330', '43.7928180');
INSERT INTO `sys_cn_area` VALUES ('3209', '天山区', '天山', '3208', null, '中国,新疆维吾尔自治区,乌鲁木齐市,天山区', '3', '830002', '0991', '650102', 'Tianshan', '87.6316700', '43.7943900');
INSERT INTO `sys_cn_area` VALUES ('3210', '沙依巴克区', '沙依巴克', '3208', null, '中国,新疆维吾尔自治区,乌鲁木齐市,沙依巴克区', '3', '830000', '0991', '650103', 'Shayibake', '87.5978800', '43.8011800');
INSERT INTO `sys_cn_area` VALUES ('3211', '新市区', '新市', '3208', null, '中国,新疆维吾尔自治区,乌鲁木齐市,新市区', '3', '830011', '0991', '650104', 'Xinshi', '87.5740600', '43.8434800');
INSERT INTO `sys_cn_area` VALUES ('3212', '水磨沟区', '水磨沟', '3208', null, '中国,新疆维吾尔自治区,乌鲁木齐市,水磨沟区', '3', '830017', '0991', '650105', 'Shuimogou', '87.6424900', '43.8324700');
INSERT INTO `sys_cn_area` VALUES ('3213', '头屯河区', '头屯河', '3208', null, '中国,新疆维吾尔自治区,乌鲁木齐市,头屯河区', '3', '830022', '0991', '650106', 'Toutunhe', '87.2913800', '43.8548700');
INSERT INTO `sys_cn_area` VALUES ('3214', '达坂城区', '达坂城', '3208', null, '中国,新疆维吾尔自治区,乌鲁木齐市,达坂城区', '3', '830039', '0991', '650107', 'Dabancheng', '88.3069700', '43.3579700');
INSERT INTO `sys_cn_area` VALUES ('3215', '米东区', '米东', '3208', null, '中国,新疆维吾尔自治区,乌鲁木齐市,米东区', '3', '830019', '0991', '650109', 'Midong', '87.6858300', '43.9473900');
INSERT INTO `sys_cn_area` VALUES ('3216', '乌鲁木齐县', '乌鲁木齐', '3208', null, '中国,新疆维吾尔自治区,乌鲁木齐市,乌鲁木齐县', '3', '830063', '0991', '650121', 'Wulumuqi', '87.4093900', '43.4712500');
INSERT INTO `sys_cn_area` VALUES ('3217', '克拉玛依市', '克拉玛依', '3207', null, '中国,新疆维吾尔自治区,克拉玛依市', '2', '834000', '0990', '650200', 'Karamay', '84.8739460', '45.5958860');
INSERT INTO `sys_cn_area` VALUES ('3218', '独山子区', '独山子', '3217', null, '中国,新疆维吾尔自治区,克拉玛依市,独山子区', '3', '834021', '0992', '650202', 'Dushanzi', '84.8867100', '44.3286700');
INSERT INTO `sys_cn_area` VALUES ('3219', '克拉玛依区', '克拉玛依', '3217', null, '中国,新疆维吾尔自治区,克拉玛依市,克拉玛依区', '3', '834000', '0990', '650203', 'Kelamayi', '84.8622500', '45.5908900');
INSERT INTO `sys_cn_area` VALUES ('3220', '白碱滩区', '白碱滩', '3217', null, '中国,新疆维吾尔自治区,克拉玛依市,白碱滩区', '3', '834008', '0990', '650204', 'Baijiantan', '85.1324400', '45.6876800');
INSERT INTO `sys_cn_area` VALUES ('3221', '乌尔禾区', '乌尔禾', '3217', null, '中国,新疆维吾尔自治区,克拉玛依市,乌尔禾区', '3', '834012', '0990', '650205', 'Wuerhe', '85.6914300', '46.0900600');
INSERT INTO `sys_cn_area` VALUES ('3222', '吐鲁番地区', '吐鲁番', '3207', null, '中国,新疆维吾尔自治区,吐鲁番地区', '2', '838000', '0995', '652100', 'Turpan', '89.1840780', '42.9476130');
INSERT INTO `sys_cn_area` VALUES ('3223', '吐鲁番市', '吐鲁番', '3222', null, '中国,新疆维吾尔自治区,吐鲁番地区,吐鲁番市', '3', '838000', '0995', '652101', 'Tulufan', '89.1857900', '42.9350500');
INSERT INTO `sys_cn_area` VALUES ('3224', '鄯善县', '鄯善', '3222', null, '中国,新疆维吾尔自治区,吐鲁番地区,鄯善县', '3', '838200', '0995', '652122', 'Shanshan', '90.2140200', '42.8635000');
INSERT INTO `sys_cn_area` VALUES ('3225', '托克逊县', '托克逊', '3222', null, '中国,新疆维吾尔自治区,吐鲁番地区,托克逊县', '3', '838100', '0995', '652123', 'Tuokexun', '88.6582300', '42.7923100');
INSERT INTO `sys_cn_area` VALUES ('3226', '哈密地区', '哈密', '3207', null, '中国,新疆维吾尔自治区,哈密地区', '2', '839000', '0902', '652200', 'Hami', '93.5131600', '42.8332480');
INSERT INTO `sys_cn_area` VALUES ('3227', '哈密市', '哈密', '3226', null, '中国,新疆维吾尔自治区,哈密地区,哈密市', '3', '839000', '0902', '652201', 'Hami', '93.5145200', '42.8269900');
INSERT INTO `sys_cn_area` VALUES ('3228', '巴里坤哈萨克自治县', '巴里坤', '3226', null, '中国,新疆维吾尔自治区,哈密地区,巴里坤哈萨克自治县', '3', '839200', '0902', '652222', 'Balikun', '93.0123600', '43.5999300');
INSERT INTO `sys_cn_area` VALUES ('3229', '伊吾县', '伊吾', '3226', null, '中国,新疆维吾尔自治区,哈密地区,伊吾县', '3', '839300', '0902', '652223', 'Yiwu', '94.6940300', '43.2537000');
INSERT INTO `sys_cn_area` VALUES ('3230', '昌吉回族自治州', '昌吉', '3207', null, '中国,新疆维吾尔自治区,昌吉回族自治州', '2', '831100', '0994', '652300', 'Changji', '87.3040120', '44.0145770');
INSERT INTO `sys_cn_area` VALUES ('3231', '昌吉市', '昌吉', '3230', null, '中国,新疆维吾尔自治区,昌吉回族自治州,昌吉市', '3', '831100', '0994', '652301', 'Changji', '87.3024900', '44.0126700');
INSERT INTO `sys_cn_area` VALUES ('3232', '阜康市', '阜康', '3230', null, '中国,新疆维吾尔自治区,昌吉回族自治州,阜康市', '3', '831500', '0994', '652302', 'Fukang', '87.9852900', '44.1584000');
INSERT INTO `sys_cn_area` VALUES ('3233', '呼图壁县', '呼图壁', '3230', null, '中国,新疆维吾尔自治区,昌吉回族自治州,呼图壁县', '3', '831200', '0994', '652323', 'Hutubi', '86.8989200', '44.1897700');
INSERT INTO `sys_cn_area` VALUES ('3234', '玛纳斯县', '玛纳斯', '3230', null, '中国,新疆维吾尔自治区,昌吉回族自治州,玛纳斯县', '3', '832200', '0994', '652324', 'Manasi', '86.2145000', '44.3043800');
INSERT INTO `sys_cn_area` VALUES ('3235', '奇台县', '奇台', '3230', null, '中国,新疆维吾尔自治区,昌吉回族自治州,奇台县', '3', '831800', '0994', '652325', 'Qitai', '89.5932000', '44.0222100');
INSERT INTO `sys_cn_area` VALUES ('3236', '吉木萨尔县', '吉木萨尔', '3230', null, '中国,新疆维吾尔自治区,昌吉回族自治州,吉木萨尔县', '3', '831700', '0994', '652327', 'Jimusaer', '89.1807800', '44.0004800');
INSERT INTO `sys_cn_area` VALUES ('3237', '木垒哈萨克自治县', '木垒', '3230', null, '中国,新疆维吾尔自治区,昌吉回族自治州,木垒哈萨克自治县', '3', '831900', '0994', '652328', 'Mulei', '90.2889700', '43.8350800');
INSERT INTO `sys_cn_area` VALUES ('3238', '博尔塔拉蒙古自治州', '博尔塔拉', '3207', null, '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州', '2', '833400', '0909', '652700', 'Bortala', '82.0747780', '44.9032580');
INSERT INTO `sys_cn_area` VALUES ('3239', '博乐市', '博乐', '3238', null, '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,博乐市', '3', '833400', '0909', '652701', 'Bole', '82.0713000', '44.9005200');
INSERT INTO `sys_cn_area` VALUES ('3240', '阿拉山口市', '阿拉山口', '3238', null, '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,阿拉山口市', '3', '833400', '0909', '652702', 'Alashankou', '82.5677210', '45.1706160');
INSERT INTO `sys_cn_area` VALUES ('3241', '精河县', '精河', '3238', null, '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,精河县', '3', '833300', '0909', '652722', 'Jinghe', '82.8941900', '44.6077400');
INSERT INTO `sys_cn_area` VALUES ('3242', '温泉县', '温泉', '3238', null, '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,温泉县', '3', '833500', '0909', '652723', 'Wenquan', '81.0313400', '44.9737300');
INSERT INTO `sys_cn_area` VALUES ('3243', '巴音郭楞蒙古自治州', '巴音郭楞', '3207', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州', '2', '841000', '0996', '652800', 'Bayingol', '86.1509690', '41.7685520');
INSERT INTO `sys_cn_area` VALUES ('3244', '库尔勒市', '库尔勒', '3243', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,库尔勒市', '3', '841000', '0996', '652801', 'Kuerle', '86.1552800', '41.7660200');
INSERT INTO `sys_cn_area` VALUES ('3245', '轮台县', '轮台', '3243', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,轮台县', '3', '841600', '0996', '652822', 'Luntai', '84.2610100', '41.7764200');
INSERT INTO `sys_cn_area` VALUES ('3246', '尉犁县', '尉犁', '3243', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,尉犁县', '3', '841500', '0996', '652823', 'Yuli', '86.2590300', '41.3363200');
INSERT INTO `sys_cn_area` VALUES ('3247', '若羌县', '若羌', '3243', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,若羌县', '3', '841800', '0996', '652824', 'Ruoqiang', '88.1681200', '39.0179000');
INSERT INTO `sys_cn_area` VALUES ('3248', '且末县', '且末', '3243', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,且末县', '3', '841900', '0996', '652825', 'Qiemo', '85.5297500', '38.1453400');
INSERT INTO `sys_cn_area` VALUES ('3249', '焉耆回族自治县', '焉耆', '3243', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,焉耆回族自治县', '3', '841100', '0996', '652826', 'Yanqi', '86.5744000', '42.0590000');
INSERT INTO `sys_cn_area` VALUES ('3250', '和静县', '和静', '3243', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,和静县', '3', '841300', '0996', '652827', 'Hejing', '86.3961100', '42.3183800');
INSERT INTO `sys_cn_area` VALUES ('3251', '和硕县', '和硕', '3243', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,和硕县', '3', '841200', '0996', '652828', 'Heshuo', '86.8639200', '42.2681400');
INSERT INTO `sys_cn_area` VALUES ('3252', '博湖县', '博湖', '3243', null, '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,博湖县', '3', '841400', '0996', '652829', 'Bohu', '86.6333300', '41.9801400');
INSERT INTO `sys_cn_area` VALUES ('3253', '阿克苏地区', '阿克苏', '3207', null, '中国,新疆维吾尔自治区,阿克苏地区', '2', '843000', '0997', '652900', 'Aksu', '80.2650680', '41.1707120');
INSERT INTO `sys_cn_area` VALUES ('3254', '阿克苏市', '阿克苏', '3253', null, '中国,新疆维吾尔自治区,阿克苏地区,阿克苏市', '3', '843000', '0997', '652901', 'Akesu', '80.2633800', '41.1675400');
INSERT INTO `sys_cn_area` VALUES ('3255', '温宿县', '温宿', '3253', null, '中国,新疆维吾尔自治区,阿克苏地区,温宿县', '3', '843100', '0997', '652922', 'Wensu', '80.2417300', '41.2767900');
INSERT INTO `sys_cn_area` VALUES ('3256', '库车县', '库车', '3253', null, '中国,新疆维吾尔自治区,阿克苏地区,库车县', '3', '842000', '0997', '652923', 'Kuche', '82.9620900', '41.7179300');
INSERT INTO `sys_cn_area` VALUES ('3257', '沙雅县', '沙雅', '3253', null, '中国,新疆维吾尔自治区,阿克苏地区,沙雅县', '3', '842200', '0997', '652924', 'Shaya', '82.7813100', '41.2249700');
INSERT INTO `sys_cn_area` VALUES ('3258', '新和县', '新和', '3253', null, '中国,新疆维吾尔自治区,阿克苏地区,新和县', '3', '842100', '0997', '652925', 'Xinhe', '82.6105300', '41.5496400');
INSERT INTO `sys_cn_area` VALUES ('3259', '拜城县', '拜城', '3253', null, '中国,新疆维吾尔自治区,阿克苏地区,拜城县', '3', '842300', '0997', '652926', 'Baicheng', '81.8756400', '41.7980100');
INSERT INTO `sys_cn_area` VALUES ('3260', '乌什县', '乌什', '3253', null, '中国,新疆维吾尔自治区,阿克苏地区,乌什县', '3', '843400', '0997', '652927', 'Wushi', '79.2293700', '41.2156900');
INSERT INTO `sys_cn_area` VALUES ('3261', '阿瓦提县', '阿瓦提', '3253', null, '中国,新疆维吾尔自治区,阿克苏地区,阿瓦提县', '3', '843200', '0997', '652928', 'Awati', '80.3833600', '40.6392600');
INSERT INTO `sys_cn_area` VALUES ('3262', '柯坪县', '柯坪', '3253', null, '中国,新疆维吾尔自治区,阿克苏地区,柯坪县', '3', '843600', '0997', '652929', 'Keping', '79.0475100', '40.5058500');
INSERT INTO `sys_cn_area` VALUES ('3263', '克孜勒苏柯尔克孜自治州', '克孜勒苏', '3207', null, '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州', '2', '845350', '0908', '653000', 'Kizilsu', '76.1728250', '39.7134310');
INSERT INTO `sys_cn_area` VALUES ('3264', '阿图什市', '阿图什', '3263', null, '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿图什市', '3', '845350', '0908', '653001', 'Atushi', '76.1682700', '39.7161500');
INSERT INTO `sys_cn_area` VALUES ('3265', '阿克陶县', '阿克陶', '3263', null, '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿克陶县', '3', '845550', '0908', '653022', 'Aketao', '75.9469200', '39.1489200');
INSERT INTO `sys_cn_area` VALUES ('3266', '阿合奇县', '阿合奇', '3263', null, '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿合奇县', '3', '843500', '0997', '653023', 'Aheqi', '78.4484800', '40.9394700');
INSERT INTO `sys_cn_area` VALUES ('3267', '乌恰县', '乌恰', '3263', null, '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,乌恰县', '3', '845450', '0908', '653024', 'Wuqia', '75.2583900', '39.7198400');
INSERT INTO `sys_cn_area` VALUES ('3268', '喀什地区', '喀什', '3207', null, '中国,新疆维吾尔自治区,喀什地区', '2', '844000', '0998', '653100', 'Kashgar', '75.9891380', '39.4676640');
INSERT INTO `sys_cn_area` VALUES ('3269', '喀什市', '喀什', '3268', null, '中国,新疆维吾尔自治区,喀什地区,喀什市', '3', '844000', '0998', '653101', 'Kashi', '75.9937900', '39.4676800');
INSERT INTO `sys_cn_area` VALUES ('3270', '疏附县', '疏附', '3268', null, '中国,新疆维吾尔自治区,喀什地区,疏附县', '3', '844100', '0998', '653121', 'Shufu', '75.8602900', '39.3753400');
INSERT INTO `sys_cn_area` VALUES ('3271', '疏勒县', '疏勒', '3268', null, '中国,新疆维吾尔自治区,喀什地区,疏勒县', '3', '844200', '0998', '653122', 'Shule', '76.0539800', '39.4062500');
INSERT INTO `sys_cn_area` VALUES ('3272', '英吉沙县', '英吉沙', '3268', null, '中国,新疆维吾尔自治区,喀什地区,英吉沙县', '3', '844500', '0998', '653123', 'Yingjisha', '76.1756500', '38.9296800');
INSERT INTO `sys_cn_area` VALUES ('3273', '泽普县', '泽普', '3268', null, '中国,新疆维吾尔自治区,喀什地区,泽普县', '3', '844800', '0998', '653124', 'Zepu', '77.2714500', '38.1893500');
INSERT INTO `sys_cn_area` VALUES ('3274', '莎车县', '莎车', '3268', null, '中国,新疆维吾尔自治区,喀什地区,莎车县', '3', '844700', '0998', '653125', 'Shache', '77.2431600', '38.4160100');
INSERT INTO `sys_cn_area` VALUES ('3275', '叶城县', '叶城', '3268', null, '中国,新疆维吾尔自治区,喀什地区,叶城县', '3', '844900', '0998', '653126', 'Yecheng', '77.4165900', '37.8832400');
INSERT INTO `sys_cn_area` VALUES ('3276', '麦盖提县', '麦盖提', '3268', null, '中国,新疆维吾尔自治区,喀什地区,麦盖提县', '3', '844600', '0998', '653127', 'Maigaiti', '77.6422400', '38.8966200');
INSERT INTO `sys_cn_area` VALUES ('3277', '岳普湖县', '岳普湖', '3268', null, '中国,新疆维吾尔自治区,喀什地区,岳普湖县', '3', '844400', '0998', '653128', 'Yuepuhu', '76.7723300', '39.2356100');
INSERT INTO `sys_cn_area` VALUES ('3278', '伽师县', '伽师', '3268', null, '中国,新疆维吾尔自治区,喀什地区,伽师县', '3', '844300', '0998', '653129', 'Jiashi', '76.7237200', '39.4880100');
INSERT INTO `sys_cn_area` VALUES ('3279', '巴楚县', '巴楚', '3268', null, '中国,新疆维吾尔自治区,喀什地区,巴楚县', '3', '843800', '0998', '653130', 'Bachu', '78.5488800', '39.7855000');
INSERT INTO `sys_cn_area` VALUES ('3280', '塔什库尔干塔吉克自治县', '塔什库尔干塔吉克', '3268', null, '中国,新疆维吾尔自治区,喀什地区,塔什库尔干塔吉克自治县', '3', '845250', '0998', '653131', 'Tashikuergantajike', '75.2319600', '37.7789300');
INSERT INTO `sys_cn_area` VALUES ('3281', '和田地区', '和田', '3207', null, '中国,新疆维吾尔自治区,和田地区', '2', '848000', '0903', '653200', 'Hotan', '79.9253300', '37.1106870');
INSERT INTO `sys_cn_area` VALUES ('3282', '和田市', '和田市', '3281', null, '中国,新疆维吾尔自治区,和田地区,和田市', '3', '848000', '0903', '653201', 'Hetianshi', '79.9135300', '37.1121400');
INSERT INTO `sys_cn_area` VALUES ('3283', '和田县', '和田县', '3281', null, '中国,新疆维吾尔自治区,和田地区,和田县', '3', '848000', '0903', '653221', 'Hetianxian', '79.8287400', '37.0892200');
INSERT INTO `sys_cn_area` VALUES ('3284', '墨玉县', '墨玉', '3281', null, '中国,新疆维吾尔自治区,和田地区,墨玉县', '3', '848100', '0903', '653222', 'Moyu', '79.7403500', '37.2724800');
INSERT INTO `sys_cn_area` VALUES ('3285', '皮山县', '皮山', '3281', null, '中国,新疆维吾尔自治区,和田地区,皮山县', '3', '845150', '0903', '653223', 'Pishan', '78.2812500', '37.6200700');
INSERT INTO `sys_cn_area` VALUES ('3286', '洛浦县', '洛浦', '3281', null, '中国,新疆维吾尔自治区,和田地区,洛浦县', '3', '848200', '0903', '653224', 'Luopu', '80.1853600', '37.0736400');
INSERT INTO `sys_cn_area` VALUES ('3287', '策勒县', '策勒', '3281', null, '中国,新疆维吾尔自治区,和田地区,策勒县', '3', '848300', '0903', '653225', 'Cele', '80.8099900', '36.9984300');
INSERT INTO `sys_cn_area` VALUES ('3288', '于田县', '于田', '3281', null, '中国,新疆维吾尔自治区,和田地区,于田县', '3', '848400', '0903', '653226', 'Yutian', '81.6671700', '36.8540000');
INSERT INTO `sys_cn_area` VALUES ('3289', '民丰县', '民丰', '3281', null, '中国,新疆维吾尔自治区,和田地区,民丰县', '3', '848500', '0903', '653227', 'Minfeng', '82.6844400', '37.0657700');
INSERT INTO `sys_cn_area` VALUES ('3290', '伊犁哈萨克自治州', '伊犁', '3207', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州', '2', '835100', '0999', '654000', 'Ili', '81.3179460', '43.9218600');
INSERT INTO `sys_cn_area` VALUES ('3291', '伊宁市', '伊宁', '3290', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,伊宁市', '3', '835000', '0999', '654002', 'Yining', '81.3293200', '43.9129400');
INSERT INTO `sys_cn_area` VALUES ('3292', '奎屯市', '奎屯', '3290', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,奎屯市', '3', '833200', '0992', '654003', 'Kuitun', '84.9022800', '44.4250000');
INSERT INTO `sys_cn_area` VALUES ('3293', '霍尔果斯市', '霍尔果斯', '3290', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,霍尔果斯市', '3', '835221', '0999', '654004', 'Huoerguosi', '80.4181890', '44.2057780');
INSERT INTO `sys_cn_area` VALUES ('3294', '伊宁县', '伊宁', '3290', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,伊宁县', '3', '835100', '0999', '654021', 'Yining', '81.5276400', '43.9786300');
INSERT INTO `sys_cn_area` VALUES ('3295', '察布查尔锡伯自治县', '察布查尔锡伯', '3290', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,察布查尔锡伯自治县', '3', '835300', '0999', '654022', 'Chabuchaerxibo', '81.1495600', '43.8402300');
INSERT INTO `sys_cn_area` VALUES ('3296', '霍城县', '霍城', '3290', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,霍城县', '3', '835200', '0999', '654023', 'Huocheng', '80.8782600', '44.0533000');
INSERT INTO `sys_cn_area` VALUES ('3297', '巩留县', '巩留', '3290', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,巩留县', '3', '835400', '0999', '654024', 'Gongliu', '82.2285100', '43.4842900');
INSERT INTO `sys_cn_area` VALUES ('3298', '新源县', '新源', '3290', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,新源县', '3', '835800', '0999', '654025', 'Xinyuan', '83.2609500', '43.4284000');
INSERT INTO `sys_cn_area` VALUES ('3299', '昭苏县', '昭苏', '3290', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,昭苏县', '3', '835600', '0999', '654026', 'Zhaosu', '81.1307000', '43.1582800');
INSERT INTO `sys_cn_area` VALUES ('3300', '特克斯县', '特克斯', '3290', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,特克斯县', '3', '835500', '0999', '654027', 'Tekesi', '81.8400500', '43.2193800');
INSERT INTO `sys_cn_area` VALUES ('3301', '尼勒克县', '尼勒克', '3290', null, '中国,新疆维吾尔自治区,伊犁哈萨克自治州,尼勒克县', '3', '835700', '0999', '654028', 'Nileke', '82.5118400', '43.7990100');
INSERT INTO `sys_cn_area` VALUES ('3302', '塔城地区', '塔城', '3207', null, '中国,新疆维吾尔自治区,塔城地区', '2', '834700', '0901', '654200', 'Qoqek', '82.9857320', '46.7463010');
INSERT INTO `sys_cn_area` VALUES ('3303', '塔城市', '塔城', '3302', null, '中国,新疆维吾尔自治区,塔城地区,塔城市', '3', '834700', '0901', '654201', 'Tacheng', '82.9789200', '46.7485200');
INSERT INTO `sys_cn_area` VALUES ('3304', '乌苏市', '乌苏', '3302', null, '中国,新疆维吾尔自治区,塔城地区,乌苏市', '3', '833000', '0992', '654202', 'Wusu', '84.6825800', '44.4372900');
INSERT INTO `sys_cn_area` VALUES ('3305', '额敏县', '额敏', '3302', null, '中国,新疆维吾尔自治区,塔城地区,额敏县', '3', '834600', '0901', '654221', 'Emin', '83.6287200', '46.5284000');
INSERT INTO `sys_cn_area` VALUES ('3306', '沙湾县', '沙湾', '3302', null, '中国,新疆维吾尔自治区,塔城地区,沙湾县', '3', '832100', '0993', '654223', 'Shawan', '85.6193200', '44.3314400');
INSERT INTO `sys_cn_area` VALUES ('3307', '托里县', '托里', '3302', null, '中国,新疆维吾尔自治区,塔城地区,托里县', '3', '834500', '0901', '654224', 'Tuoli', '83.6059200', '45.9362300');
INSERT INTO `sys_cn_area` VALUES ('3308', '裕民县', '裕民', '3302', null, '中国,新疆维吾尔自治区,塔城地区,裕民县', '3', '834800', '0901', '654225', 'Yumin', '82.9900200', '46.2037700');
INSERT INTO `sys_cn_area` VALUES ('3309', '和布克赛尔蒙古自治县', '和布克赛尔', '3302', null, '中国,新疆维吾尔自治区,塔城地区,和布克赛尔蒙古自治县', '3', '834400', '0990', '654226', 'Hebukesaier', '85.7266200', '46.7936200');
INSERT INTO `sys_cn_area` VALUES ('3310', '阿勒泰地区', '阿勒泰', '3207', null, '中国,新疆维吾尔自治区,阿勒泰地区', '2', '836500', '0906', '654300', 'Altay', '88.1396300', '47.8483930');
INSERT INTO `sys_cn_area` VALUES ('3311', '阿勒泰市', '阿勒泰', '3310', null, '中国,新疆维吾尔自治区,阿勒泰地区,阿勒泰市', '3', '836500', '0906', '654301', 'Aletai', '88.1391300', '47.8317000');
INSERT INTO `sys_cn_area` VALUES ('3312', '布尔津县', '布尔津', '3310', null, '中国,新疆维吾尔自治区,阿勒泰地区,布尔津县', '3', '836600', '0906', '654321', 'Buerjin', '86.8575100', '47.7006200');
INSERT INTO `sys_cn_area` VALUES ('3313', '富蕴县', '富蕴', '3310', null, '中国,新疆维吾尔自治区,阿勒泰地区,富蕴县', '3', '836100', '0906', '654322', 'Fuyun', '89.5267900', '46.9944400');
INSERT INTO `sys_cn_area` VALUES ('3314', '福海县', '福海', '3310', null, '中国,新疆维吾尔自治区,阿勒泰地区,福海县', '3', '836400', '0906', '654323', 'Fuhai', '87.4950800', '47.1106500');
INSERT INTO `sys_cn_area` VALUES ('3315', '哈巴河县', '哈巴河', '3310', null, '中国,新疆维吾尔自治区,阿勒泰地区,哈巴河县', '3', '836700', '0906', '654324', 'Habahe', '86.4209200', '48.0604600');
INSERT INTO `sys_cn_area` VALUES ('3316', '青河县', '青河', '3310', null, '中国,新疆维吾尔自治区,阿勒泰地区,青河县', '3', '836200', '0906', '654325', 'Qinghe', '90.3830500', '46.6738200');
INSERT INTO `sys_cn_area` VALUES ('3317', '吉木乃县', '吉木乃', '3310', null, '中国,新疆维吾尔自治区,阿勒泰地区,吉木乃县', '3', '836800', '0906', '654326', 'Jimunai', '85.8781400', '47.4335900');
INSERT INTO `sys_cn_area` VALUES ('3318', '直辖县级', ' ', '3207', null, '中国,新疆维吾尔自治区,直辖县级', '2', null, '', '659000', '', '91.1322120', '29.6603610');
INSERT INTO `sys_cn_area` VALUES ('3319', '石河子市', '石河子', '3318', null, '中国,新疆维吾尔自治区,直辖县级,石河子市', '3', '832000', '0993', '659001', 'Shihezi', '86.0410750', '44.3058860');
INSERT INTO `sys_cn_area` VALUES ('3320', '阿拉尔市', '阿拉尔', '3318', null, '中国,新疆维吾尔自治区,直辖县级,阿拉尔市', '3', '843300', '0997', '659002', 'Aral', '81.2858840', '40.5419140');
INSERT INTO `sys_cn_area` VALUES ('3321', '图木舒克市', '图木舒克', '3318', null, '中国,新疆维吾尔自治区,直辖县级,图木舒克市', '3', '843806', '0998', '659003', 'Tumxuk', '79.0779780', '39.8673160');
INSERT INTO `sys_cn_area` VALUES ('3322', '五家渠市', '五家渠', '3318', null, '中国,新疆维吾尔自治区,直辖县级,五家渠市', '3', '831300', '0994', '659004', 'Wujiaqu', '87.5268840', '44.1674010');
INSERT INTO `sys_cn_area` VALUES ('3323', '北屯市', '北屯', '3318', null, '中国,新疆维吾尔自治区,直辖县级,北屯市', '3', '836000', '0906', '659005', 'Beitun', '87.8084560', '47.3623080');
INSERT INTO `sys_cn_area` VALUES ('3324', '铁门关市', '铁门关', '3318', null, '中国,新疆维吾尔自治区,直辖县级,铁门关市', '3', '836000', '0906', '659006', 'Tiemenguan', '86.1946870', '41.8110070');
INSERT INTO `sys_cn_area` VALUES ('3325', '双河市', '双河', '3318', null, '中国,新疆维吾尔自治区,直辖县级,双河市', '3', '833408', '0909', '659007', 'Shuanghe', '91.1322120', '29.6603610');
INSERT INTO `sys_cn_area` VALUES ('3326', '台湾', '台湾', '1', null, '中国,台湾', '1', null, '', '710000', 'Taiwan', '121.5090620', '25.0443320');
INSERT INTO `sys_cn_area` VALUES ('3327', '台北市', '台北', '3326', null, '中国,台湾,台北市', '2', '1', '02', '710100', 'Taipei', '121.5651700', '25.0377980');
INSERT INTO `sys_cn_area` VALUES ('3328', '松山区', '松山', '3327', null, '中国,台湾,台北市,松山区', '3', '105', '02', '710101', 'Songshan', '121.5772060', '25.0496980');
INSERT INTO `sys_cn_area` VALUES ('3329', '信义区', '信义', '3327', null, '中国,台湾,台北市,信义区', '3', '110', '02', '710102', 'Xinyi', '121.7513810', '25.1294070');
INSERT INTO `sys_cn_area` VALUES ('3330', '大安区', '大安', '3327', null, '中国,台湾,台北市,大安区', '3', '106', '02', '710103', 'Da\'an', '121.5346480', '25.0264060');
INSERT INTO `sys_cn_area` VALUES ('3331', '中山区', '中山', '3327', null, '中国,台湾,台北市,中山区', '3', '104', '02', '710104', 'Zhongshan', '121.5334680', '25.0643610');
INSERT INTO `sys_cn_area` VALUES ('3332', '中正区', '中正', '3327', null, '中国,台湾,台北市,中正区', '3', '100', '02', '710105', 'Zhongzheng', '121.5182670', '25.0323610');
INSERT INTO `sys_cn_area` VALUES ('3333', '大同区', '大同', '3327', null, '中国,台湾,台北市,大同区', '3', '103', '02', '710106', 'Datong', '121.5155140', '25.0659860');
INSERT INTO `sys_cn_area` VALUES ('3334', '万华区', '万华', '3327', null, '中国,台湾,台北市,万华区', '3', '108', '02', '710107', 'Wanhua', '121.4993320', '25.0319330');
INSERT INTO `sys_cn_area` VALUES ('3335', '文山区', '文山', '3327', null, '中国,台湾,台北市,文山区', '3', '116', '02', '710108', 'Wenshan', '121.5704580', '24.9897860');
INSERT INTO `sys_cn_area` VALUES ('3336', '南港区', '南港', '3327', null, '中国,台湾,台北市,南港区', '3', '115', '02', '710109', 'Nangang', '121.6068580', '25.0546560');
INSERT INTO `sys_cn_area` VALUES ('3337', '内湖区', '内湖', '3327', null, '中国,台湾,台北市,内湖区', '3', '114', '02', '710110', 'Nahu', '121.5889980', '25.0696640');
INSERT INTO `sys_cn_area` VALUES ('3338', '士林区', '士林', '3327', null, '中国,台湾,台北市,士林区', '3', '111', '02', '710111', 'Shilin', '121.5198740', '25.0928220');
INSERT INTO `sys_cn_area` VALUES ('3339', '北投区', '北投', '3327', null, '中国,台湾,台北市,北投区', '3', '112', '02', '710112', 'Beitou', '121.5013790', '25.1324190');
INSERT INTO `sys_cn_area` VALUES ('3340', '高雄市', '高雄', '3326', null, '中国,台湾,高雄市', '2', '8', '07', '710200', 'Kaohsiung', '120.3119220', '22.6208560');
INSERT INTO `sys_cn_area` VALUES ('3341', '盐埕区', '盐埕', '3340', null, '中国,台湾,高雄市,盐埕区', '3', '803', '07', '710201', 'Yancheng', '120.2867950', '22.6246660');
INSERT INTO `sys_cn_area` VALUES ('3342', '鼓山区', '鼓山', '3340', null, '中国,台湾,高雄市,鼓山区', '3', '804', '07', '710202', 'Gushan', '120.2811540', '22.6367970');
INSERT INTO `sys_cn_area` VALUES ('3343', '左营区', '左营', '3340', null, '中国,台湾,高雄市,左营区', '3', '813', '07', '710203', 'Zuoying', '120.2949580', '22.6901240');
INSERT INTO `sys_cn_area` VALUES ('3344', '楠梓区', '楠梓', '3340', null, '中国,台湾,高雄市,楠梓区', '3', '811', '07', '710204', 'Nanzi', '120.3263140', '22.7284010');
INSERT INTO `sys_cn_area` VALUES ('3345', '三民区', '三民', '3340', null, '中国,台湾,高雄市,三民区', '3', '807', '07', '710205', 'Sanmin', '120.2996220', '22.6476950');
INSERT INTO `sys_cn_area` VALUES ('3346', '新兴区', '新兴', '3340', null, '中国,台湾,高雄市,新兴区', '3', '800', '07', '710206', 'Xinxing', '120.3095350', '22.6311470');
INSERT INTO `sys_cn_area` VALUES ('3347', '前金区', '前金', '3340', null, '中国,台湾,高雄市,前金区', '3', '801', '07', '710207', 'Qianjin', '120.2941590', '22.6274210');
INSERT INTO `sys_cn_area` VALUES ('3348', '苓雅区', '苓雅', '3340', null, '中国,台湾,高雄市,苓雅区', '3', '802', '07', '710208', 'Lingya', '120.3123470', '22.6217700');
INSERT INTO `sys_cn_area` VALUES ('3349', '前镇区', '前镇', '3340', null, '中国,台湾,高雄市,前镇区', '3', '806', '07', '710209', 'Qianzhen', '120.3185830', '22.5864250');
INSERT INTO `sys_cn_area` VALUES ('3350', '旗津区', '旗津', '3340', null, '中国,台湾,高雄市,旗津区', '3', '805', '07', '710210', 'Qijin', '120.2844290', '22.5905650');
INSERT INTO `sys_cn_area` VALUES ('3351', '小港区', '小港', '3340', null, '中国,台湾,高雄市,小港区', '3', '812', '07', '710211', 'Xiaogang', '120.3379700', '22.5653540');
INSERT INTO `sys_cn_area` VALUES ('3352', '凤山区', '凤山', '3340', null, '中国,台湾,高雄市,凤山区', '3', '830', '07', '710212', 'Fengshan', '120.3568920', '22.6269450');
INSERT INTO `sys_cn_area` VALUES ('3353', '林园区', '林园', '3340', null, '中国,台湾,高雄市,林园区', '3', '832', '07', '710213', 'Linyuan', '120.3959770', '22.5014900');
INSERT INTO `sys_cn_area` VALUES ('3354', '大寮区', '大寮', '3340', null, '中国,台湾,高雄市,大寮区', '3', '831', '07', '710214', 'Daliao', '120.3954220', '22.6053860');
INSERT INTO `sys_cn_area` VALUES ('3355', '大树区', '大树', '3340', null, '中国,台湾,高雄市,大树区', '3', '840', '07', '710215', 'Dashu', '120.4330950', '22.6933940');
INSERT INTO `sys_cn_area` VALUES ('3356', '大社区', '大社', '3340', null, '中国,台湾,高雄市,大社区', '3', '815', '07', '710216', 'Dashe', '120.3466350', '22.7299660');
INSERT INTO `sys_cn_area` VALUES ('3357', '仁武区', '仁武', '3340', null, '中国,台湾,高雄市,仁武区', '3', '814', '07', '710217', 'Renwu', '120.3477790', '22.7019010');
INSERT INTO `sys_cn_area` VALUES ('3358', '鸟松区', '鸟松', '3340', null, '中国,台湾,高雄市,鸟松区', '3', '833', '07', '710218', 'Niaosong', '120.3644020', '22.6593400');
INSERT INTO `sys_cn_area` VALUES ('3359', '冈山区', '冈山', '3340', null, '中国,台湾,高雄市,冈山区', '3', '820', '07', '710219', 'Gangshan', '120.2958200', '22.7967620');
INSERT INTO `sys_cn_area` VALUES ('3360', '桥头区', '桥头', '3340', null, '中国,台湾,高雄市,桥头区', '3', '825', '07', '710220', 'Qiaotou', '120.3057410', '22.7575010');
INSERT INTO `sys_cn_area` VALUES ('3361', '燕巢区', '燕巢', '3340', null, '中国,台湾,高雄市,燕巢区', '3', '824', '07', '710221', 'Yanchao', '120.3619560', '22.7933700');
INSERT INTO `sys_cn_area` VALUES ('3362', '田寮区', '田寮', '3340', null, '中国,台湾,高雄市,田寮区', '3', '823', '07', '710222', 'Tianliao', '120.3596360', '22.8693070');
INSERT INTO `sys_cn_area` VALUES ('3363', '阿莲区', '阿莲', '3340', null, '中国,台湾,高雄市,阿莲区', '3', '822', '07', '710223', 'Alian', '120.3270360', '22.8837030');
INSERT INTO `sys_cn_area` VALUES ('3364', '路竹区', '路竹', '3340', null, '中国,台湾,高雄市,路竹区', '3', '821', '07', '710224', 'Luzhu', '120.2618280', '22.8568510');
INSERT INTO `sys_cn_area` VALUES ('3365', '湖内区', '湖内', '3340', null, '中国,台湾,高雄市,湖内区', '3', '829', '07', '710225', 'Huna', '120.2115300', '22.9081880');
INSERT INTO `sys_cn_area` VALUES ('3366', '茄萣区', '茄萣', '3340', null, '中国,台湾,高雄市,茄萣区', '3', '852', '07', '710226', 'Qieding', '120.1828150', '22.9065560');
INSERT INTO `sys_cn_area` VALUES ('3367', '永安区', '永安', '3340', null, '中国,台湾,高雄市,永安区', '3', '828', '07', '710227', 'Yong\'an', '120.2253080', '22.8185800');
INSERT INTO `sys_cn_area` VALUES ('3368', '弥陀区', '弥陀', '3340', null, '中国,台湾,高雄市,弥陀区', '3', '827', '07', '710228', 'Mituo', '120.2473440', '22.7828790');
INSERT INTO `sys_cn_area` VALUES ('3369', '梓官区', '梓官', '3340', null, '中国,台湾,高雄市,梓官区', '3', '826', '07', '710229', 'Ziguan', '120.2673220', '22.7604750');
INSERT INTO `sys_cn_area` VALUES ('3370', '旗山区', '旗山', '3340', null, '中国,台湾,高雄市,旗山区', '3', '842', '07', '710230', 'Qishan', '120.4835500', '22.8884910');
INSERT INTO `sys_cn_area` VALUES ('3371', '美浓区', '美浓', '3340', null, '中国,台湾,高雄市,美浓区', '3', '843', '07', '710231', 'Meinong', '120.5415300', '22.8978800');
INSERT INTO `sys_cn_area` VALUES ('3372', '六龟区', '六龟', '3340', null, '中国,台湾,高雄市,六龟区', '3', '844', '07', '710232', 'Liugui', '120.6334180', '22.9979140');
INSERT INTO `sys_cn_area` VALUES ('3373', '甲仙区', '甲仙', '3340', null, '中国,台湾,高雄市,甲仙区', '3', '847', '07', '710233', 'Jiaxian', '120.5911850', '23.0846880');
INSERT INTO `sys_cn_area` VALUES ('3374', '杉林区', '杉林', '3340', null, '中国,台湾,高雄市,杉林区', '3', '846', '07', '710234', 'Shanlin', '120.5389800', '22.9707120');
INSERT INTO `sys_cn_area` VALUES ('3375', '内门区', '内门', '3340', null, '中国,台湾,高雄市,内门区', '3', '845', '07', '710235', 'Namen', '120.4623510', '22.9434370');
INSERT INTO `sys_cn_area` VALUES ('3376', '茂林区', '茂林', '3340', null, '中国,台湾,高雄市,茂林区', '3', '851', '07', '710236', 'Maolin', '120.6632170', '22.8862480');
INSERT INTO `sys_cn_area` VALUES ('3377', '桃源区', '桃源', '3340', null, '中国,台湾,高雄市,桃源区', '3', '848', '07', '710237', 'Taoyuan', '120.7600490', '23.1591370');
INSERT INTO `sys_cn_area` VALUES ('3378', '那玛夏区', '那玛夏', '3340', null, '中国,台湾,高雄市,那玛夏区', '3', '849', '07', '710238', 'Namaxia', '120.6927990', '23.2169640');
INSERT INTO `sys_cn_area` VALUES ('3379', '基隆市', '基隆', '3326', null, '中国,台湾,基隆市', '2', '2', '02', '710300', 'Keelung', '121.7462480', '25.1307410');
INSERT INTO `sys_cn_area` VALUES ('3380', '中正区', '中正', '3379', null, '中国,台湾,基隆市,中正区', '3', '202', '02', '710301', 'Zhongzheng', '121.5182670', '25.0323610');
INSERT INTO `sys_cn_area` VALUES ('3381', '七堵区', '七堵', '3379', null, '中国,台湾,基隆市,七堵区', '3', '206', '02', '710302', 'Qidu', '121.7130320', '25.0957390');
INSERT INTO `sys_cn_area` VALUES ('3382', '暖暖区', '暖暖', '3379', null, '中国,台湾,基隆市,暖暖区', '3', '205', '02', '710303', 'Nuannuan', '121.7361020', '25.0997770');
INSERT INTO `sys_cn_area` VALUES ('3383', '仁爱区', '仁爱', '3379', null, '中国,台湾,基隆市,仁爱区', '3', '200', '02', '710304', 'Renai', '121.7409400', '25.1275260');
INSERT INTO `sys_cn_area` VALUES ('3384', '中山区', '中山', '3379', null, '中国,台湾,基隆市,中山区', '3', '203', '02', '710305', 'Zhongshan', '121.7391320', '25.1339910');
INSERT INTO `sys_cn_area` VALUES ('3385', '安乐区', '安乐', '3379', null, '中国,台湾,基隆市,安乐区', '3', '204', '02', '710306', 'Anle', '121.7232030', '25.1209100');
INSERT INTO `sys_cn_area` VALUES ('3386', '信义区', '信义', '3379', null, '中国,台湾,基隆市,信义区', '3', '201', '02', '710307', 'Xinyi', '121.7513810', '25.1294070');
INSERT INTO `sys_cn_area` VALUES ('3387', '台中市', '台中', '3326', null, '中国,台湾,台中市', '2', '4', '04', '710400', 'Taichung', '120.6790400', '24.1386200');
INSERT INTO `sys_cn_area` VALUES ('3388', '中区', '中区', '3387', null, '中国,台湾,台中市,中区', '3', '400', '04', '710401', 'Zhongqu', '120.6795100', '24.1438300');
INSERT INTO `sys_cn_area` VALUES ('3389', '东区', '东区', '3387', null, '中国,台湾,台中市,东区', '3', '401', '04', '710402', 'Dongqu', '120.7040000', '24.1366200');
INSERT INTO `sys_cn_area` VALUES ('3390', '南区', '南区', '3387', null, '中国,台湾,台中市,南区', '3', '402', '04', '710403', 'Nanqu', '120.1886480', '22.9609440');
INSERT INTO `sys_cn_area` VALUES ('3391', '西区', '西区', '3387', null, '中国,台湾,台中市,西区', '3', '403', '04', '710404', 'Xiqu', '120.6710400', '24.1413800');
INSERT INTO `sys_cn_area` VALUES ('3392', '北区', '北区', '3387', null, '中国,台湾,台中市,北区', '3', '404', '04', '710405', 'Beiqu', '120.6824100', '24.1660400');
INSERT INTO `sys_cn_area` VALUES ('3393', '西屯区', '西屯', '3387', null, '中国,台湾,台中市,西屯区', '3', '407', '04', '710406', 'Xitun', '120.6398200', '24.1813400');
INSERT INTO `sys_cn_area` VALUES ('3394', '南屯区', '南屯', '3387', null, '中国,台湾,台中市,南屯区', '3', '408', '04', '710407', 'Nantun', '120.6430800', '24.1382700');
INSERT INTO `sys_cn_area` VALUES ('3395', '北屯区', '北屯', '3387', null, '中国,台湾,台中市,北屯区', '3', '406', '04', '710408', 'Beitun', '120.6862500', '24.1822200');
INSERT INTO `sys_cn_area` VALUES ('3396', '丰原区', '丰原', '3387', null, '中国,台湾,台中市,丰原区', '3', '420', '04', '710409', 'Fengyuan', '120.7184600', '24.2421900');
INSERT INTO `sys_cn_area` VALUES ('3397', '东势区', '东势', '3387', null, '中国,台湾,台中市,东势区', '3', '423', '04', '710410', 'Dongshi', '120.8277700', '24.2586100');
INSERT INTO `sys_cn_area` VALUES ('3398', '大甲区', '大甲', '3387', null, '中国,台湾,台中市,大甲区', '3', '437', '04', '710411', 'Dajia', '120.6223900', '24.3489200');
INSERT INTO `sys_cn_area` VALUES ('3399', '清水区', '清水', '3387', null, '中国,台湾,台中市,清水区', '3', '436', '04', '710412', 'Qingshui', '120.5597800', '24.2686500');
INSERT INTO `sys_cn_area` VALUES ('3400', '沙鹿区', '沙鹿', '3387', null, '中国,台湾,台中市,沙鹿区', '3', '433', '04', '710413', 'Shalu', '120.5657000', '24.2334800');
INSERT INTO `sys_cn_area` VALUES ('3401', '梧栖区', '梧栖', '3387', null, '中国,台湾,台中市,梧栖区', '3', '435', '04', '710414', 'Wuqi', '120.5315200', '24.2549600');
INSERT INTO `sys_cn_area` VALUES ('3402', '后里区', '后里', '3387', null, '中国,台湾,台中市,后里区', '3', '421', '04', '710415', 'Houli', '120.7107100', '24.3049100');
INSERT INTO `sys_cn_area` VALUES ('3403', '神冈区', '神冈', '3387', null, '中国,台湾,台中市,神冈区', '3', '429', '04', '710416', 'Shengang', '120.6615500', '24.2577700');
INSERT INTO `sys_cn_area` VALUES ('3404', '潭子区', '潭子', '3387', null, '中国,台湾,台中市,潭子区', '3', '427', '04', '710417', 'Tanzi', '120.7051600', '24.2095300');
INSERT INTO `sys_cn_area` VALUES ('3405', '大雅区', '大雅', '3387', null, '中国,台湾,台中市,大雅区', '3', '428', '04', '710418', 'Daya', '120.6477800', '24.2292300');
INSERT INTO `sys_cn_area` VALUES ('3406', '新社区', '新社', '3387', null, '中国,台湾,台中市,新社区', '3', '426', '04', '710419', 'Xinshe', '120.8095000', '24.2341400');
INSERT INTO `sys_cn_area` VALUES ('3407', '石冈区', '石冈', '3387', null, '中国,台湾,台中市,石冈区', '3', '422', '04', '710420', 'Shigang', '120.7804100', '24.2749800');
INSERT INTO `sys_cn_area` VALUES ('3408', '外埔区', '外埔', '3387', null, '中国,台湾,台中市,外埔区', '3', '438', '04', '710421', 'Waipu', '120.6543700', '24.3320100');
INSERT INTO `sys_cn_area` VALUES ('3409', '大安区', '大安', '3387', null, '中国,台湾,台中市,大安区', '3', '439', '04', '710422', 'Da\'an', '120.5865200', '24.3460700');
INSERT INTO `sys_cn_area` VALUES ('3410', '乌日区', '乌日', '3387', null, '中国,台湾,台中市,乌日区', '3', '414', '04', '710423', 'Wuri', '120.6238100', '24.1045000');
INSERT INTO `sys_cn_area` VALUES ('3411', '大肚区', '大肚', '3387', null, '中国,台湾,台中市,大肚区', '3', '432', '04', '710424', 'Dadu', '120.5409600', '24.1536600');
INSERT INTO `sys_cn_area` VALUES ('3412', '龙井区', '龙井', '3387', null, '中国,台湾,台中市,龙井区', '3', '434', '04', '710425', 'Longjing', '120.5459400', '24.1927100');
INSERT INTO `sys_cn_area` VALUES ('3413', '雾峰区', '雾峰', '3387', null, '中国,台湾,台中市,雾峰区', '3', '413', '04', '710426', 'Wufeng', '120.7002000', '24.0615200');
INSERT INTO `sys_cn_area` VALUES ('3414', '太平区', '太平', '3387', null, '中国,台湾,台中市,太平区', '3', '411', '04', '710427', 'Taiping', '120.7185230', '24.1264720');
INSERT INTO `sys_cn_area` VALUES ('3415', '大里区', '大里', '3387', null, '中国,台湾,台中市,大里区', '3', '412', '04', '710428', 'Dali', '120.6778600', '24.0993900');
INSERT INTO `sys_cn_area` VALUES ('3416', '和平区', '和平', '3387', null, '中国,台湾,台中市,和平区', '3', '424', '04', '710429', 'Heping', '120.8834900', '24.1747700');
INSERT INTO `sys_cn_area` VALUES ('3417', '台南市', '台南', '3326', null, '中国,台湾,台南市', '2', '7', '06', '710500', 'Tainan', '120.2793630', '23.1724780');
INSERT INTO `sys_cn_area` VALUES ('3418', '东区', '东区', '3417', null, '中国,台湾,台南市,东区', '3', '701', '06', '710501', 'Dongqu', '120.2241980', '22.9800720');
INSERT INTO `sys_cn_area` VALUES ('3419', '南区', '南区', '3417', null, '中国,台湾,台南市,南区', '3', '702', '06', '710502', 'Nanqu', '120.1886480', '22.9609440');
INSERT INTO `sys_cn_area` VALUES ('3420', '北区', '北区', '3417', null, '中国,台湾,台南市,北区', '3', '704', '06', '710504', 'Beiqu', '120.6824100', '24.1660400');
INSERT INTO `sys_cn_area` VALUES ('3421', '安南区', '安南', '3417', null, '中国,台湾,台南市,安南区', '3', '709', '06', '710506', 'Annan', '120.1846170', '23.0472300');
INSERT INTO `sys_cn_area` VALUES ('3422', '安平区', '安平', '3417', null, '中国,台湾,台南市,安平区', '3', '708', '06', '710507', 'Anping', '120.1668100', '23.0007630');
INSERT INTO `sys_cn_area` VALUES ('3423', '中西区', '中西', '3417', null, '中国,台湾,台南市,中西区', '3', '700', '06', '710508', 'Zhongxi', '120.2059570', '22.9921520');
INSERT INTO `sys_cn_area` VALUES ('3424', '新营区', '新营', '3417', null, '中国,台湾,台南市,新营区', '3', '730', '06', '710509', 'Xinying', '120.3166980', '23.3102740');
INSERT INTO `sys_cn_area` VALUES ('3425', '盐水区', '盐水', '3417', null, '中国,台湾,台南市,盐水区', '3', '737', '06', '710510', 'Yanshui', '120.2663980', '23.3198280');
INSERT INTO `sys_cn_area` VALUES ('3426', '白河区', '白河', '3417', null, '中国,台湾,台南市,白河区', '3', '732', '06', '710511', 'Baihe', '120.4158100', '23.3512210');
INSERT INTO `sys_cn_area` VALUES ('3427', '柳营区', '柳营', '3417', null, '中国,台湾,台南市,柳营区', '3', '736', '06', '710512', 'Liuying', '120.3112860', '23.2781330');
INSERT INTO `sys_cn_area` VALUES ('3428', '后壁区', '后壁', '3417', null, '中国,台湾,台南市,后壁区', '3', '731', '06', '710513', 'Houbi', '120.3627260', '23.3667210');
INSERT INTO `sys_cn_area` VALUES ('3429', '东山区', '东山', '3417', null, '中国,台湾,台南市,东山区', '3', '733', '06', '710514', 'Dongshan', '120.4039840', '23.3260920');
INSERT INTO `sys_cn_area` VALUES ('3430', '麻豆区', '麻豆', '3417', null, '中国,台湾,台南市,麻豆区', '3', '721', '06', '710515', 'Madou', '120.2481790', '23.1816800');
INSERT INTO `sys_cn_area` VALUES ('3431', '下营区', '下营', '3417', null, '中国,台湾,台南市,下营区', '3', '735', '06', '710516', 'Xiaying', '120.2644840', '23.2354130');
INSERT INTO `sys_cn_area` VALUES ('3432', '六甲区', '六甲', '3417', null, '中国,台湾,台南市,六甲区', '3', '734', '06', '710517', 'Liujia', '120.3476000', '23.2319310');
INSERT INTO `sys_cn_area` VALUES ('3433', '官田区', '官田', '3417', null, '中国,台湾,台南市,官田区', '3', '720', '06', '710518', 'Guantian', '120.3143740', '23.1946520');
INSERT INTO `sys_cn_area` VALUES ('3434', '大内区', '大内', '3417', null, '中国,台湾,台南市,大内区', '3', '742', '06', '710519', 'Dana', '120.3488530', '23.1194600');
INSERT INTO `sys_cn_area` VALUES ('3435', '佳里区', '佳里', '3417', null, '中国,台湾,台南市,佳里区', '3', '722', '06', '710520', 'Jiali', '120.1772110', '23.1651210');
INSERT INTO `sys_cn_area` VALUES ('3436', '学甲区', '学甲', '3417', null, '中国,台湾,台南市,学甲区', '3', '726', '06', '710521', 'Xuejia', '120.1802550', '23.2323480');
INSERT INTO `sys_cn_area` VALUES ('3437', '西港区', '西港', '3417', null, '中国,台湾,台南市,西港区', '3', '723', '06', '710522', 'Xigang', '120.2036180', '23.1230570');
INSERT INTO `sys_cn_area` VALUES ('3438', '七股区', '七股', '3417', null, '中国,台湾,台南市,七股区', '3', '724', '06', '710523', 'Qigu', '120.1400030', '23.1405450');
INSERT INTO `sys_cn_area` VALUES ('3439', '将军区', '将军', '3417', null, '中国,台湾,台南市,将军区', '3', '725', '06', '710524', 'Jiangjun', '120.1568710', '23.1995430');
INSERT INTO `sys_cn_area` VALUES ('3440', '北门区', '北门', '3417', null, '中国,台湾,台南市,北门区', '3', '727', '06', '710525', 'Beimen', '120.1258210', '23.2671480');
INSERT INTO `sys_cn_area` VALUES ('3441', '新化区', '新化', '3417', null, '中国,台湾,台南市,新化区', '3', '712', '06', '710526', 'Xinhua', '120.3108070', '23.0385330');
INSERT INTO `sys_cn_area` VALUES ('3442', '善化区', '善化', '3417', null, '中国,台湾,台南市,善化区', '3', '741', '06', '710527', 'Shanhua', '120.2968950', '23.1322610');
INSERT INTO `sys_cn_area` VALUES ('3443', '新市区', '新市', '3417', null, '中国,台湾,台南市,新市区', '3', '744', '06', '710528', 'Xinshi', '120.2951380', '23.0789700');
INSERT INTO `sys_cn_area` VALUES ('3444', '安定区', '安定', '3417', null, '中国,台湾,台南市,安定区', '3', '745', '06', '710529', 'Anding', '120.2370830', '23.1214980');
INSERT INTO `sys_cn_area` VALUES ('3445', '山上区', '山上', '3417', null, '中国,台湾,台南市,山上区', '3', '743', '06', '710530', 'Shanshang', '120.3529080', '23.1032230');
INSERT INTO `sys_cn_area` VALUES ('3446', '玉井区', '玉井', '3417', null, '中国,台湾,台南市,玉井区', '3', '714', '06', '710531', 'Yujing', '120.4601100', '23.1238590');
INSERT INTO `sys_cn_area` VALUES ('3447', '楠西区', '楠西', '3417', null, '中国,台湾,台南市,楠西区', '3', '715', '06', '710532', 'Nanxi', '120.4853960', '23.1734540');
INSERT INTO `sys_cn_area` VALUES ('3448', '南化区', '南化', '3417', null, '中国,台湾,台南市,南化区', '3', '716', '06', '710533', 'Nanhua', '120.4771160', '23.0426140');
INSERT INTO `sys_cn_area` VALUES ('3449', '左镇区', '左镇', '3417', null, '中国,台湾,台南市,左镇区', '3', '713', '06', '710534', 'Zuozhen', '120.4073090', '23.0579550');
INSERT INTO `sys_cn_area` VALUES ('3450', '仁德区', '仁德', '3417', null, '中国,台湾,台南市,仁德区', '3', '717', '06', '710535', 'Rende', '120.2515200', '22.9722120');
INSERT INTO `sys_cn_area` VALUES ('3451', '归仁区', '归仁', '3417', null, '中国,台湾,台南市,归仁区', '3', '711', '06', '710536', 'Guiren', '120.2937910', '22.9670810');
INSERT INTO `sys_cn_area` VALUES ('3452', '关庙区', '关庙', '3417', null, '中国,台湾,台南市,关庙区', '3', '718', '06', '710537', 'Guanmiao', '120.3276890', '22.9629490');
INSERT INTO `sys_cn_area` VALUES ('3453', '龙崎区', '龙崎', '3417', null, '中国,台湾,台南市,龙崎区', '3', '719', '06', '710538', 'Longqi', '120.3608240', '22.9656810');
INSERT INTO `sys_cn_area` VALUES ('3454', '永康区', '永康', '3417', null, '中国,台湾,台南市,永康区', '3', '710', '06', '710539', 'Yongkang', '120.2570690', '23.0260610');
INSERT INTO `sys_cn_area` VALUES ('3455', '新竹市', '新竹', '3326', null, '中国,台湾,新竹市', '2', '3', '03', '710600', 'Hsinchu', '120.9687980', '24.8067380');
INSERT INTO `sys_cn_area` VALUES ('3456', '东区', '东区', '3455', null, '中国,台湾,新竹市,东区', '3', '300', '03', '710601', 'Dongqu', '120.9702390', '24.8013370');
INSERT INTO `sys_cn_area` VALUES ('3457', '北区', '北区', '3455', null, '中国,台湾,新竹市,北区', '3', null, '03', '710602', 'Beiqu', '120.6824100', '24.1660400');
INSERT INTO `sys_cn_area` VALUES ('3458', '香山区', '香山', '3455', null, '中国,台湾,新竹市,香山区', '3', null, '03', '710603', 'Xiangshan', '120.9566790', '24.7689330');
INSERT INTO `sys_cn_area` VALUES ('3459', '嘉义市', '嘉义', '3326', null, '中国,台湾,嘉义市', '2', '6', '05', '710700', 'Chiayi', '120.4525380', '23.4815680');
INSERT INTO `sys_cn_area` VALUES ('3460', '东区', '东区', '3459', null, '中国,台湾,嘉义市,东区', '3', '600', '05', '710701', 'Dongqu', '120.4580090', '23.4862130');
INSERT INTO `sys_cn_area` VALUES ('3461', '西区', '西区', '3459', null, '中国,台湾,嘉义市,西区', '3', '600', '05', '710702', 'Xiqu', '120.4374930', '23.4730290');
INSERT INTO `sys_cn_area` VALUES ('3462', '新北市', '新北', '3326', null, '中国,台湾,新北市', '2', '2', '02', '710800', 'New Taipei', '121.4657460', '25.0123660');
INSERT INTO `sys_cn_area` VALUES ('3463', '板桥区', '板桥', '3462', null, '中国,台湾,新北市,板桥区', '3', '220', '02', '710801', 'Banqiao', '121.4590840', '25.0095780');
INSERT INTO `sys_cn_area` VALUES ('3464', '三重区', '三重', '3462', null, '中国,台湾,新北市,三重区', '3', '241', '02', '710802', 'Sanzhong', '121.4881020', '25.0614860');
INSERT INTO `sys_cn_area` VALUES ('3465', '中和区', '中和', '3462', null, '中国,台湾,新北市,中和区', '3', '235', '02', '710803', 'Zhonghe', '121.4989800', '24.9993970');
INSERT INTO `sys_cn_area` VALUES ('3466', '永和区', '永和', '3462', null, '中国,台湾,新北市,永和区', '3', '234', '02', '710804', 'Yonghe', '121.5136600', '25.0078020');
INSERT INTO `sys_cn_area` VALUES ('3467', '新庄区', '新庄', '3462', null, '中国,台湾,新北市,新庄区', '3', '242', '02', '710805', 'Xinzhuang', '121.4504130', '25.0359470');
INSERT INTO `sys_cn_area` VALUES ('3468', '新店区', '新店', '3462', null, '中国,台湾,新北市,新店区', '3', '231', '02', '710806', 'Xindian', '121.5417500', '24.9675580');
INSERT INTO `sys_cn_area` VALUES ('3469', '树林区', '树林', '3462', null, '中国,台湾,新北市,树林区', '3', '238', '02', '710807', 'Shulin', '121.4205330', '24.9907060');
INSERT INTO `sys_cn_area` VALUES ('3470', '莺歌区', '莺歌', '3462', null, '中国,台湾,新北市,莺歌区', '3', '239', '02', '710808', 'Yingge', '121.3545730', '24.9554130');
INSERT INTO `sys_cn_area` VALUES ('3471', '三峡区', '三峡', '3462', null, '中国,台湾,新北市,三峡区', '3', '237', '02', '710809', 'Sanxia', '121.3689050', '24.9343390');
INSERT INTO `sys_cn_area` VALUES ('3472', '淡水区', '淡水', '3462', null, '中国,台湾,新北市,淡水区', '3', '251', '02', '710810', 'Danshui', '121.4409150', '25.1694520');
INSERT INTO `sys_cn_area` VALUES ('3473', '汐止区', '汐止', '3462', null, '中国,台湾,新北市,汐止区', '3', '221', '02', '710811', 'Xizhi', '121.6294700', '25.0629990');
INSERT INTO `sys_cn_area` VALUES ('3474', '瑞芳区', '瑞芳', '3462', null, '中国,台湾,新北市,瑞芳区', '3', '224', '02', '710812', 'Ruifang', '121.8100610', '25.1088950');
INSERT INTO `sys_cn_area` VALUES ('3475', '土城区', '土城', '3462', null, '中国,台湾,新北市,土城区', '3', '236', '02', '710813', 'Tucheng', '121.4433480', '24.9722010');
INSERT INTO `sys_cn_area` VALUES ('3476', '芦洲区', '芦洲', '3462', null, '中国,台湾,新北市,芦洲区', '3', '247', '02', '710814', 'Luzhou', '121.4737000', '25.0849230');
INSERT INTO `sys_cn_area` VALUES ('3477', '五股区', '五股', '3462', null, '中国,台湾,新北市,五股区', '3', '248', '02', '710815', 'Wugu', '121.4381560', '25.0827430');
INSERT INTO `sys_cn_area` VALUES ('3478', '泰山区', '泰山', '3462', null, '中国,台湾,新北市,泰山区', '3', '243', '02', '710816', 'Taishan', '121.4308110', '25.0588640');
INSERT INTO `sys_cn_area` VALUES ('3479', '林口区', '林口', '3462', null, '中国,台湾,新北市,林口区', '3', '244', '02', '710817', 'Linkou', '121.3916020', '25.0775310');
INSERT INTO `sys_cn_area` VALUES ('3480', '深坑区', '深坑', '3462', null, '中国,台湾,新北市,深坑区', '3', '222', '02', '710818', 'Shenkeng', '121.6156700', '25.0023290');
INSERT INTO `sys_cn_area` VALUES ('3481', '石碇区', '石碇', '3462', null, '中国,台湾,新北市,石碇区', '3', '223', '02', '710819', 'Shiding', '121.6585670', '24.9916790');
INSERT INTO `sys_cn_area` VALUES ('3482', '坪林区', '坪林', '3462', null, '中国,台湾,新北市,坪林区', '3', '232', '02', '710820', 'Pinglin', '121.7111850', '24.9373880');
INSERT INTO `sys_cn_area` VALUES ('3483', '三芝区', '三芝', '3462', null, '中国,台湾,新北市,三芝区', '3', '252', '02', '710821', 'Sanzhi', '121.5008660', '25.2580470');
INSERT INTO `sys_cn_area` VALUES ('3484', '石门区', '石门', '3462', null, '中国,台湾,新北市,石门区', '3', '253', '02', '710822', 'Shimen', '121.5684910', '25.2904120');
INSERT INTO `sys_cn_area` VALUES ('3485', '八里区', '八里', '3462', null, '中国,台湾,新北市,八里区', '3', '249', '02', '710823', 'Bali', '121.3982270', '25.1466800');
INSERT INTO `sys_cn_area` VALUES ('3486', '平溪区', '平溪', '3462', null, '中国,台湾,新北市,平溪区', '3', '226', '02', '710824', 'Pingxi', '121.7382550', '25.0257250');
INSERT INTO `sys_cn_area` VALUES ('3487', '双溪区', '双溪', '3462', null, '中国,台湾,新北市,双溪区', '3', '227', '02', '710825', 'Shuangxi', '121.8656760', '25.0334090');
INSERT INTO `sys_cn_area` VALUES ('3488', '贡寮区', '贡寮', '3462', null, '中国,台湾,新北市,贡寮区', '3', '228', '02', '710826', 'Gongliao', '121.9081850', '25.0223880');
INSERT INTO `sys_cn_area` VALUES ('3489', '金山区', '金山', '3462', null, '中国,台湾,新北市,金山区', '3', '208', '02', '710827', 'Jinshan', '121.6364270', '25.2218830');
INSERT INTO `sys_cn_area` VALUES ('3490', '万里区', '万里', '3462', null, '中国,台湾,新北市,万里区', '3', '207', '02', '710828', 'Wanli', '121.6886870', '25.1812340');
INSERT INTO `sys_cn_area` VALUES ('3491', '乌来区', '乌来', '3462', null, '中国,台湾,新北市,乌来区', '3', '233', '02', '710829', 'Wulai', '121.5505310', '24.8652960');
INSERT INTO `sys_cn_area` VALUES ('3492', '宜兰县', '宜兰', '3326', null, '中国,台湾,宜兰县', '2', '2', '03', '712200', 'Yilan', '121.5000000', '24.6000000');
INSERT INTO `sys_cn_area` VALUES ('3493', '宜兰市', '宜兰', '3492', null, '中国,台湾,宜兰县,宜兰市', '3', '260', '03', '712201', 'Yilan', '121.7534760', '24.7516820');
INSERT INTO `sys_cn_area` VALUES ('3494', '罗东镇', '罗东', '3492', null, '中国,台湾,宜兰县,罗东镇', '3', '265', '03', '712221', 'Luodong', '121.7669190', '24.6770330');
INSERT INTO `sys_cn_area` VALUES ('3495', '苏澳镇', '苏澳', '3492', null, '中国,台湾,宜兰县,苏澳镇', '3', '270', '03', '712222', 'Suao', '121.8426560', '24.5946220');
INSERT INTO `sys_cn_area` VALUES ('3496', '头城镇', '头城', '3492', null, '中国,台湾,宜兰县,头城镇', '3', '261', '03', '712223', 'Toucheng', '121.8233070', '24.8592170');
INSERT INTO `sys_cn_area` VALUES ('3497', '礁溪乡', '礁溪', '3492', null, '中国,台湾,宜兰县,礁溪乡', '3', '262', '03', '712224', 'Jiaoxi', '121.7666800', '24.8223450');
INSERT INTO `sys_cn_area` VALUES ('3498', '壮围乡', '壮围', '3492', null, '中国,台湾,宜兰县,壮围乡', '3', '263', '03', '712225', 'Zhuangwei', '121.7816190', '24.7449490');
INSERT INTO `sys_cn_area` VALUES ('3499', '员山乡', '员山', '3492', null, '中国,台湾,宜兰县,员山乡', '3', '264', '03', '712226', 'Yuanshan', '121.7217330', '24.7417710');
INSERT INTO `sys_cn_area` VALUES ('3500', '冬山乡', '冬山', '3492', null, '中国,台湾,宜兰县,冬山乡', '3', '269', '03', '712227', 'Dongshan', '121.7922800', '24.6345140');
INSERT INTO `sys_cn_area` VALUES ('3501', '五结乡', '五结', '3492', null, '中国,台湾,宜兰县,五结乡', '3', '268', '03', '712228', 'Wujie', '121.7982970', '24.6846400');
INSERT INTO `sys_cn_area` VALUES ('3502', '三星乡', '三星', '3492', null, '中国,台湾,宜兰县,三星乡', '3', '266', '03', '712229', 'Sanxing', '121.0034180', '23.7752910');
INSERT INTO `sys_cn_area` VALUES ('3503', '大同乡', '大同', '3492', null, '中国,台湾,宜兰县,大同乡', '3', '267', '03', '712230', 'Datong', '121.6055570', '24.6759970');
INSERT INTO `sys_cn_area` VALUES ('3504', '南澳乡', '南澳', '3492', null, '中国,台湾,宜兰县,南澳乡', '3', '272', '03', '712231', 'Nanao', '121.7998100', '24.4653930');
INSERT INTO `sys_cn_area` VALUES ('3505', '桃园县', '桃园', '3326', null, '中国,台湾,桃园县', '2', '3', '03', '712300', 'Taoyuan', '121.0830000', '25.0000000');
INSERT INTO `sys_cn_area` VALUES ('3506', '桃园市', '桃园', '3505', null, '中国,台湾,桃园县,桃园市', '3', '330', '03', '712301', 'Taoyuan', '121.3013370', '24.9937770');
INSERT INTO `sys_cn_area` VALUES ('3507', '中坜市', '中坜', '3505', null, '中国,台湾,桃园县,中坜市', '3', '320', '03', '712302', 'Zhongli', '121.2249260', '24.9653530');
INSERT INTO `sys_cn_area` VALUES ('3508', '平镇市', '平镇', '3505', null, '中国,台湾,桃园县,平镇市', '3', '324', '03', '712303', 'Pingzhen', '121.2183590', '24.9457520');
INSERT INTO `sys_cn_area` VALUES ('3509', '八德市', '八德', '3505', null, '中国,台湾,桃园县,八德市', '3', '334', '03', '712304', 'Bade', '121.2846550', '24.9286510');
INSERT INTO `sys_cn_area` VALUES ('3510', '杨梅市', '杨梅', '3505', null, '中国,台湾,桃园县,杨梅市', '3', '326', '03', '712305', 'Yangmei', '121.1458730', '24.9075750');
INSERT INTO `sys_cn_area` VALUES ('3511', '芦竹市', '芦竹', '3505', null, '中国,台湾,桃园县,芦竹市', '3', '338', '03', '712306', 'Luzhu', '121.2920640', '25.0453920');
INSERT INTO `sys_cn_area` VALUES ('3512', '大溪镇', '大溪', '3505', null, '中国,台湾,桃园县,大溪镇', '3', '335', '03', '712321', 'Daxi', '121.2869620', '24.8805840');
INSERT INTO `sys_cn_area` VALUES ('3513', '大园乡', '大园', '3505', null, '中国,台湾,桃园县,大园乡', '3', '337', '03', '712324', 'Dayuan', '121.1962920', '25.0644710');
INSERT INTO `sys_cn_area` VALUES ('3514', '龟山乡', '龟山', '3505', null, '中国,台湾,桃园县,龟山乡', '3', '333', '03', '712325', 'Guishan', '121.3377670', '24.9925170');
INSERT INTO `sys_cn_area` VALUES ('3515', '龙潭乡', '龙潭', '3505', null, '中国,台湾,桃园县,龙潭乡', '3', '325', '03', '712327', 'Longtan', '121.2163920', '24.8638510');
INSERT INTO `sys_cn_area` VALUES ('3516', '新屋乡', '新屋', '3505', null, '中国,台湾,桃园县,新屋乡', '3', '327', '03', '712329', 'Xinwu', '121.1058010', '24.9722030');
INSERT INTO `sys_cn_area` VALUES ('3517', '观音乡', '观音', '3505', null, '中国,台湾,桃园县,观音乡', '3', '328', '03', '712330', 'Guanyin', '121.0775190', '25.0333030');
INSERT INTO `sys_cn_area` VALUES ('3518', '复兴乡', '复兴', '3505', null, '中国,台湾,桃园县,复兴乡', '3', '336', '03', '712331', 'Fuxing', '121.3526130', '24.8209080');
INSERT INTO `sys_cn_area` VALUES ('3519', '新竹县', '新竹', '3326', null, '中国,台湾,新竹县', '2', '3', '03', '712400', 'Hsinchu', '121.1600000', '24.6000000');
INSERT INTO `sys_cn_area` VALUES ('3520', '竹北市', '竹北', '3519', null, '中国,台湾,新竹县,竹北市', '3', '302', '03', '712401', 'Zhubei', '121.0043170', '24.8396520');
INSERT INTO `sys_cn_area` VALUES ('3521', '竹东镇', '竹东', '3519', null, '中国,台湾,新竹县,竹东镇', '3', '310', '03', '712421', 'Zhudong', '121.0864180', '24.7336010');
INSERT INTO `sys_cn_area` VALUES ('3522', '新埔镇', '新埔', '3519', null, '中国,台湾,新竹县,新埔镇', '3', '305', '03', '712422', 'Xinpu', '121.0728040', '24.8248200');
INSERT INTO `sys_cn_area` VALUES ('3523', '关西镇', '关西', '3519', null, '中国,台湾,新竹县,关西镇', '3', '306', '03', '712423', 'Guanxi', '121.1773010', '24.7888420');
INSERT INTO `sys_cn_area` VALUES ('3524', '湖口乡', '湖口', '3519', null, '中国,台湾,新竹县,湖口乡', '3', '303', '03', '712424', 'Hukou', '121.0436910', '24.9039430');
INSERT INTO `sys_cn_area` VALUES ('3525', '新丰乡', '新丰', '3519', null, '中国,台湾,新竹县,新丰乡', '3', '304', '03', '712425', 'Xinfeng', '120.9830060', '24.8996000');
INSERT INTO `sys_cn_area` VALUES ('3526', '芎林乡', '芎林', '3519', null, '中国,台湾,新竹县,芎林乡', '3', '307', '03', '712426', 'Xionglin', '121.0769240', '24.7744360');
INSERT INTO `sys_cn_area` VALUES ('3527', '横山乡', '横山', '3519', null, '中国,台湾,新竹县,横山乡', '3', '312', '03', '712427', 'Hengshan', '121.1162440', '24.7208070');
INSERT INTO `sys_cn_area` VALUES ('3528', '北埔乡', '北埔', '3519', null, '中国,台湾,新竹县,北埔乡', '3', '314', '03', '712428', 'Beipu', '121.0531560', '24.6971260');
INSERT INTO `sys_cn_area` VALUES ('3529', '宝山乡', '宝山', '3519', null, '中国,台湾,新竹县,宝山乡', '3', '308', '03', '712429', 'Baoshan', '120.9857520', '24.7609750');
INSERT INTO `sys_cn_area` VALUES ('3530', '峨眉乡', '峨眉', '3519', null, '中国,台湾,新竹县,峨眉乡', '3', '315', '03', '712430', 'Emei', '121.0152910', '24.6861270');
INSERT INTO `sys_cn_area` VALUES ('3531', '尖石乡', '尖石', '3519', null, '中国,台湾,新竹县,尖石乡', '3', '313', '03', '712431', 'Jianshi', '121.1978020', '24.7043600');
INSERT INTO `sys_cn_area` VALUES ('3532', '五峰乡', '五峰', '3519', null, '中国,台湾,新竹县,五峰乡', '3', '311', '03', '712432', 'Wufeng', '121.0034180', '23.7752910');
INSERT INTO `sys_cn_area` VALUES ('3533', '苗栗县', '苗栗', '3326', null, '中国,台湾,苗栗县', '2', '3', '037', '712500', 'Miaoli', '120.7500000', '24.5000000');
INSERT INTO `sys_cn_area` VALUES ('3534', '苗栗市', '苗栗', '3533', null, '中国,台湾,苗栗县,苗栗市', '3', '360', '037', '712501', 'Miaoli', '120.8188690', '24.5614720');
INSERT INTO `sys_cn_area` VALUES ('3535', '苑里镇', '苑里', '3533', null, '中国,台湾,苗栗县,苑里镇', '3', '358', '037', '712521', 'Yuanli', '120.6489070', '24.4417500');
INSERT INTO `sys_cn_area` VALUES ('3536', '通霄镇', '通霄', '3533', null, '中国,台湾,苗栗县,通霄镇', '3', '357', '037', '712522', 'Tongxiao', '120.6767000', '24.4890870');
INSERT INTO `sys_cn_area` VALUES ('3537', '竹南镇', '竹南', '3533', null, '中国,台湾,苗栗县,竹南镇', '3', '350', '037', '712523', 'Zhunan', '120.8726410', '24.6855130');
INSERT INTO `sys_cn_area` VALUES ('3538', '头份镇', '头份', '3533', null, '中国,台湾,苗栗县,头份镇', '3', '351', '037', '712524', 'Toufen', '120.8951880', '24.6879930');
INSERT INTO `sys_cn_area` VALUES ('3539', '后龙镇', '后龙', '3533', null, '中国,台湾,苗栗县,后龙镇', '3', '356', '037', '712525', 'Houlong', '120.7864800', '24.6126170');
INSERT INTO `sys_cn_area` VALUES ('3540', '卓兰镇', '卓兰', '3533', null, '中国,台湾,苗栗县,卓兰镇', '3', '369', '037', '712526', 'Zhuolan', '120.8234410', '24.3095090');
INSERT INTO `sys_cn_area` VALUES ('3541', '大湖乡', '大湖', '3533', null, '中国,台湾,苗栗县,大湖乡', '3', '364', '037', '712527', 'Dahu', '120.8636410', '24.4225470');
INSERT INTO `sys_cn_area` VALUES ('3542', '公馆乡', '公馆', '3533', null, '中国,台湾,苗栗县,公馆乡', '3', '363', '037', '712528', 'Gongguan', '120.8229830', '24.4991080');
INSERT INTO `sys_cn_area` VALUES ('3543', '铜锣乡', '铜锣', '3533', null, '中国,台湾,苗栗县,铜锣乡', '3', '366', '037', '712529', 'Tongluo', '121.0034180', '23.7752910');
INSERT INTO `sys_cn_area` VALUES ('3544', '南庄乡', '南庄', '3533', null, '中国,台湾,苗栗县,南庄乡', '3', '353', '037', '712530', 'Nanzhuang', '120.9949570', '24.5968350');
INSERT INTO `sys_cn_area` VALUES ('3545', '头屋乡', '头屋', '3533', null, '中国,台湾,苗栗县,头屋乡', '3', '362', '037', '712531', 'Touwu', '120.8466160', '24.5742490');
INSERT INTO `sys_cn_area` VALUES ('3546', '三义乡', '三义', '3533', null, '中国,台湾,苗栗县,三义乡', '3', '367', '037', '712532', 'Sanyi', '120.7423400', '24.3502700');
INSERT INTO `sys_cn_area` VALUES ('3547', '西湖乡', '西湖', '3533', null, '中国,台湾,苗栗县,西湖乡', '3', '368', '037', '712533', 'Xihu', '121.0034180', '23.7752910');
INSERT INTO `sys_cn_area` VALUES ('3548', '造桥乡', '造桥', '3533', null, '中国,台湾,苗栗县,造桥乡', '3', '361', '037', '712534', 'Zaoqiao', '120.8623990', '24.6375370');
INSERT INTO `sys_cn_area` VALUES ('3549', '三湾乡', '三湾', '3533', null, '中国,台湾,苗栗县,三湾乡', '3', '352', '037', '712535', 'Sanwan', '120.9514840', '24.6510510');
INSERT INTO `sys_cn_area` VALUES ('3550', '狮潭乡', '狮潭', '3533', null, '中国,台湾,苗栗县,狮潭乡', '3', '354', '037', '712536', 'Shitan', '120.9180240', '24.5400040');
INSERT INTO `sys_cn_area` VALUES ('3551', '泰安乡', '泰安', '3533', null, '中国,台湾,苗栗县,泰安乡', '3', '365', '037', '712537', 'Tai\'an', '120.9044410', '24.4426000');
INSERT INTO `sys_cn_area` VALUES ('3552', '彰化县', '彰化', '3326', null, '中国,台湾,彰化县', '2', '5', '04', '712700', 'Changhua', '120.4160000', '24.0000000');
INSERT INTO `sys_cn_area` VALUES ('3553', '彰化市', '彰化市', '3552', null, '中国,台湾,彰化县,彰化市', '3', '500', '04', '712701', 'Zhanghuashi', '120.5422940', '24.0809110');
INSERT INTO `sys_cn_area` VALUES ('3554', '鹿港镇', '鹿港', '3552', null, '中国,台湾,彰化县,鹿港镇', '3', '505', '04', '712721', 'Lugang', '120.4353920', '24.0569370');
INSERT INTO `sys_cn_area` VALUES ('3555', '和美镇', '和美', '3552', null, '中国,台湾,彰化县,和美镇', '3', '508', '04', '712722', 'Hemei', '120.5002650', '24.1109040');
INSERT INTO `sys_cn_area` VALUES ('3556', '线西乡', '线西', '3552', null, '中国,台湾,彰化县,线西乡', '3', '507', '04', '712723', 'Xianxi', '120.4659210', '24.1286530');
INSERT INTO `sys_cn_area` VALUES ('3557', '伸港乡', '伸港', '3552', null, '中国,台湾,彰化县,伸港乡', '3', '509', '04', '712724', 'Shengang', '120.4842240', '24.1460810');
INSERT INTO `sys_cn_area` VALUES ('3558', '福兴乡', '福兴', '3552', null, '中国,台湾,彰化县,福兴乡', '3', '506', '04', '712725', 'Fuxing', '120.4436820', '24.0478830');
INSERT INTO `sys_cn_area` VALUES ('3559', '秀水乡', '秀水', '3552', null, '中国,台湾,彰化县,秀水乡', '3', '504', '04', '712726', 'Xiushui', '120.5026580', '24.0352670');
INSERT INTO `sys_cn_area` VALUES ('3560', '花坛乡', '花坛', '3552', null, '中国,台湾,彰化县,花坛乡', '3', '503', '04', '712727', 'Huatan', '120.5384030', '24.0293990');
INSERT INTO `sys_cn_area` VALUES ('3561', '芬园乡', '芬园', '3552', null, '中国,台湾,彰化县,芬园乡', '3', '502', '04', '712728', 'Fenyuan', '120.6290240', '24.0136580');
INSERT INTO `sys_cn_area` VALUES ('3562', '员林镇', '员林', '3552', null, '中国,台湾,彰化县,员林镇', '3', '510', '04', '712729', 'Yuanlin', '120.5746250', '23.9589990');
INSERT INTO `sys_cn_area` VALUES ('3563', '溪湖镇', '溪湖', '3552', null, '中国,台湾,彰化县,溪湖镇', '3', '514', '04', '712730', 'Xihu', '120.4791440', '23.9623150');
INSERT INTO `sys_cn_area` VALUES ('3564', '田中镇', '田中', '3552', null, '中国,台湾,彰化县,田中镇', '3', '520', '04', '712731', 'Tianzhong', '120.5806290', '23.8617180');
INSERT INTO `sys_cn_area` VALUES ('3565', '大村乡', '大村', '3552', null, '中国,台湾,彰化县,大村乡', '3', '515', '04', '712732', 'Dacun', '120.5407130', '23.9937260');
INSERT INTO `sys_cn_area` VALUES ('3566', '埔盐乡', '埔盐', '3552', null, '中国,台湾,彰化县,埔盐乡', '3', '516', '04', '712733', 'Puyan', '120.4640440', '24.0003460');
INSERT INTO `sys_cn_area` VALUES ('3567', '埔心乡', '埔心', '3552', null, '中国,台湾,彰化县,埔心乡', '3', '513', '04', '712734', 'Puxin', '120.5435680', '23.9530190');
INSERT INTO `sys_cn_area` VALUES ('3568', '永靖乡', '永靖', '3552', null, '中国,台湾,彰化县,永靖乡', '3', '512', '04', '712735', 'Yongjing', '120.5477750', '23.9247030');
INSERT INTO `sys_cn_area` VALUES ('3569', '社头乡', '社头', '3552', null, '中国,台湾,彰化县,社头乡', '3', '511', '04', '712736', 'Shetou', '120.5826810', '23.8966860');
INSERT INTO `sys_cn_area` VALUES ('3570', '二水乡', '二水', '3552', null, '中国,台湾,彰化县,二水乡', '3', '530', '04', '712737', 'Ershui', '120.6187880', '23.8069950');
INSERT INTO `sys_cn_area` VALUES ('3571', '北斗镇', '北斗', '3552', null, '中国,台湾,彰化县,北斗镇', '3', '521', '04', '712738', 'Beidou', '120.5204490', '23.8709110');
INSERT INTO `sys_cn_area` VALUES ('3572', '二林镇', '二林', '3552', null, '中国,台湾,彰化县,二林镇', '3', '526', '04', '712739', 'Erlin', '120.3744680', '23.8997510');
INSERT INTO `sys_cn_area` VALUES ('3573', '田尾乡', '田尾', '3552', null, '中国,台湾,彰化县,田尾乡', '3', '522', '04', '712740', 'Tianwei', '120.5247170', '23.8907350');
INSERT INTO `sys_cn_area` VALUES ('3574', '埤头乡', '埤头', '3552', null, '中国,台湾,彰化县,埤头乡', '3', '523', '04', '712741', 'Pitou', '120.4625990', '23.8913240');
INSERT INTO `sys_cn_area` VALUES ('3575', '芳苑乡', '芳苑', '3552', null, '中国,台湾,彰化县,芳苑乡', '3', '528', '04', '712742', 'Fangyuan', '120.3203290', '23.9242220');
INSERT INTO `sys_cn_area` VALUES ('3576', '大城乡', '大城', '3552', null, '中国,台湾,彰化县,大城乡', '3', '527', '04', '712743', 'Dacheng', '120.3209340', '23.8523820');
INSERT INTO `sys_cn_area` VALUES ('3577', '竹塘乡', '竹塘', '3552', null, '中国,台湾,彰化县,竹塘乡', '3', '525', '04', '712744', 'Zhutang', '120.4274990', '23.8601120');
INSERT INTO `sys_cn_area` VALUES ('3578', '溪州乡', '溪州', '3552', null, '中国,台湾,彰化县,溪州乡', '3', '524', '04', '712745', 'Xizhou', '120.4987060', '23.8512290');
INSERT INTO `sys_cn_area` VALUES ('3579', '南投县', '南投', '3326', null, '中国,台湾,南投县', '2', '5', '049', '712800', 'Nantou', '120.8300000', '23.8300000');
INSERT INTO `sys_cn_area` VALUES ('3580', '南投市', '南投市', '3579', null, '中国,台湾,南投县,南投市', '3', '540', '049', '712801', 'Nantoushi', '120.6837060', '23.9099560');
INSERT INTO `sys_cn_area` VALUES ('3581', '埔里镇', '埔里', '3579', null, '中国,台湾,南投县,埔里镇', '3', '545', '049', '712821', 'Puli', '120.9646480', '23.9647890');
INSERT INTO `sys_cn_area` VALUES ('3582', '草屯镇', '草屯', '3579', null, '中国,台湾,南投县,草屯镇', '3', '542', '049', '712822', 'Caotun', '120.6803430', '23.9739470');
INSERT INTO `sys_cn_area` VALUES ('3583', '竹山镇', '竹山', '3579', null, '中国,台湾,南投县,竹山镇', '3', '557', '049', '712823', 'Zhushan', '120.6720070', '23.7576550');
INSERT INTO `sys_cn_area` VALUES ('3584', '集集镇', '集集', '3579', null, '中国,台湾,南投县,集集镇', '3', '552', '049', '712824', 'Jiji', '120.7836730', '23.8290130');
INSERT INTO `sys_cn_area` VALUES ('3585', '名间乡', '名间', '3579', null, '中国,台湾,南投县,名间乡', '3', '551', '049', '712825', 'Mingjian', '120.7027970', '23.8384270');
INSERT INTO `sys_cn_area` VALUES ('3586', '鹿谷乡', '鹿谷', '3579', null, '中国,台湾,南投县,鹿谷乡', '3', '558', '049', '712826', 'Lugu', '120.7527960', '23.7444710');
INSERT INTO `sys_cn_area` VALUES ('3587', '中寮乡', '中寮', '3579', null, '中国,台湾,南投县,中寮乡', '3', '541', '049', '712827', 'Zhongliao', '120.7666540', '23.8789350');
INSERT INTO `sys_cn_area` VALUES ('3588', '鱼池乡', '鱼池', '3579', null, '中国,台湾,南投县,鱼池乡', '3', '555', '049', '712828', 'Yuchi', '120.9360600', '23.8963560');
INSERT INTO `sys_cn_area` VALUES ('3589', '国姓乡', '国姓', '3579', null, '中国,台湾,南投县,国姓乡', '3', '544', '049', '712829', 'Guoxing', '120.8585410', '24.0422980');
INSERT INTO `sys_cn_area` VALUES ('3590', '水里乡', '水里', '3579', null, '中国,台湾,南投县,水里乡', '3', '553', '049', '712830', 'Shuili', '120.8559120', '23.8120860');
INSERT INTO `sys_cn_area` VALUES ('3591', '信义乡', '信义', '3579', null, '中国,台湾,南投县,信义乡', '3', '556', '049', '712831', 'Xinyi', '120.8552570', '23.6999220');
INSERT INTO `sys_cn_area` VALUES ('3592', '仁爱乡', '仁爱', '3579', null, '中国,台湾,南投县,仁爱乡', '3', '546', '049', '712832', 'Renai', '121.1335430', '24.0244290');
INSERT INTO `sys_cn_area` VALUES ('3593', '云林县', '云林', '3326', null, '中国,台湾,云林县', '2', '6', '05', '712900', 'Yunlin', '120.2500000', '23.7500000');
INSERT INTO `sys_cn_area` VALUES ('3594', '斗六市', '斗六', '3593', null, '中国,台湾,云林县,斗六市', '3', '640', '05', '712901', 'Douliu', '120.5273600', '23.6976510');
INSERT INTO `sys_cn_area` VALUES ('3595', '斗南镇', '斗南', '3593', null, '中国,台湾,云林县,斗南镇', '3', '630', '05', '712921', 'Dounan', '120.4790750', '23.6797310');
INSERT INTO `sys_cn_area` VALUES ('3596', '虎尾镇', '虎尾', '3593', null, '中国,台湾,云林县,虎尾镇', '3', '632', '05', '712922', 'Huwei', '120.4453390', '23.7081820');
INSERT INTO `sys_cn_area` VALUES ('3597', '西螺镇', '西螺', '3593', null, '中国,台湾,云林县,西螺镇', '3', '648', '05', '712923', 'Xiluo', '120.4660100', '23.7979840');
INSERT INTO `sys_cn_area` VALUES ('3598', '土库镇', '土库', '3593', null, '中国,台湾,云林县,土库镇', '3', '633', '05', '712924', 'Tuku', '120.3925720', '23.6778220');
INSERT INTO `sys_cn_area` VALUES ('3599', '北港镇', '北港', '3593', null, '中国,台湾,云林县,北港镇', '3', '651', '05', '712925', 'Beigang', '120.3023930', '23.5755250');
INSERT INTO `sys_cn_area` VALUES ('3600', '古坑乡', '古坑', '3593', null, '中国,台湾,云林县,古坑乡', '3', '646', '05', '712926', 'Gukeng', '120.5620430', '23.6425680');
INSERT INTO `sys_cn_area` VALUES ('3601', '大埤乡', '大埤', '3593', null, '中国,台湾,云林县,大埤乡', '3', '631', '05', '712927', 'Dapi', '120.4305160', '23.6459080');
INSERT INTO `sys_cn_area` VALUES ('3602', '莿桐乡', '莿桐', '3593', null, '中国,台湾,云林县,莿桐乡', '3', '647', '05', '712928', 'Citong', '120.5023740', '23.7607840');
INSERT INTO `sys_cn_area` VALUES ('3603', '林内乡', '林内', '3593', null, '中国,台湾,云林县,林内乡', '3', '643', '05', '712929', 'Linna', '120.6113650', '23.7587120');
INSERT INTO `sys_cn_area` VALUES ('3604', '二仑乡', '二仑', '3593', null, '中国,台湾,云林县,二仑乡', '3', '649', '05', '712930', 'Erlun', '120.4150770', '23.7712730');
INSERT INTO `sys_cn_area` VALUES ('3605', '仑背乡', '仑背', '3593', null, '中国,台湾,云林县,仑背乡', '3', '637', '05', '712931', 'Lunbei', '120.3538950', '23.7588400');
INSERT INTO `sys_cn_area` VALUES ('3606', '麦寮乡', '麦寮', '3593', null, '中国,台湾,云林县,麦寮乡', '3', '638', '05', '712932', 'Mailiao', '120.2520430', '23.7538410');
INSERT INTO `sys_cn_area` VALUES ('3607', '东势乡', '东势', '3593', null, '中国,台湾,云林县,东势乡', '3', '635', '05', '712933', 'Dongshi', '120.2526720', '23.6746790');
INSERT INTO `sys_cn_area` VALUES ('3608', '褒忠乡', '褒忠', '3593', null, '中国,台湾,云林县,褒忠乡', '3', '634', '05', '712934', 'Baozhong', '120.3104880', '23.6942450');
INSERT INTO `sys_cn_area` VALUES ('3609', '台西乡', '台西', '3593', null, '中国,台湾,云林县,台西乡', '3', '636', '05', '712935', 'Taixi', '120.1961410', '23.7028190');
INSERT INTO `sys_cn_area` VALUES ('3610', '元长乡', '元长', '3593', null, '中国,台湾,云林县,元长乡', '3', '655', '05', '712936', 'Yuanchang', '120.3151240', '23.6494580');
INSERT INTO `sys_cn_area` VALUES ('3611', '四湖乡', '四湖', '3593', null, '中国,台湾,云林县,四湖乡', '3', '654', '05', '712937', 'Sihu', '120.2257410', '23.6377400');
INSERT INTO `sys_cn_area` VALUES ('3612', '口湖乡', '口湖', '3593', null, '中国,台湾,云林县,口湖乡', '3', '653', '05', '712938', 'Kouhu', '120.1853700', '23.5824060');
INSERT INTO `sys_cn_area` VALUES ('3613', '水林乡', '水林', '3593', null, '中国,台湾,云林县,水林乡', '3', '652', '05', '712939', 'Shuilin', '120.2459480', '23.5726340');
INSERT INTO `sys_cn_area` VALUES ('3614', '嘉义县', '嘉义', '3326', null, '中国,台湾,嘉义县', '2', '6', '05', '713000', 'Chiayi', '120.3000000', '23.5000000');
INSERT INTO `sys_cn_area` VALUES ('3615', '太保市', '太保', '3614', null, '中国,台湾,嘉义县,太保市', '3', '612', '05', '713001', 'Taibao', '120.3328760', '23.4596470');
INSERT INTO `sys_cn_area` VALUES ('3616', '朴子市', '朴子', '3614', null, '中国,台湾,嘉义县,朴子市', '3', '613', '05', '713002', 'Puzi', '120.2470140', '23.4649610');
INSERT INTO `sys_cn_area` VALUES ('3617', '布袋镇', '布袋', '3614', null, '中国,台湾,嘉义县,布袋镇', '3', '625', '05', '713023', 'Budai', '120.1669360', '23.3779790');
INSERT INTO `sys_cn_area` VALUES ('3618', '大林镇', '大林', '3614', null, '中国,台湾,嘉义县,大林镇', '3', '622', '05', '713024', 'Dalin', '120.4713360', '23.6038150');
INSERT INTO `sys_cn_area` VALUES ('3619', '民雄乡', '民雄', '3614', null, '中国,台湾,嘉义县,民雄乡', '3', '621', '05', '713025', 'Minxiong', '120.4285770', '23.5514560');
INSERT INTO `sys_cn_area` VALUES ('3620', '溪口乡', '溪口', '3614', null, '中国,台湾,嘉义县,溪口乡', '3', '623', '05', '713026', 'Xikou', '120.3938220', '23.6022230');
INSERT INTO `sys_cn_area` VALUES ('3621', '新港乡', '新港', '3614', null, '中国,台湾,嘉义县,新港乡', '3', '616', '05', '713027', 'Xingang', '120.3476470', '23.5518060');
INSERT INTO `sys_cn_area` VALUES ('3622', '六脚乡', '六脚', '3614', null, '中国,台湾,嘉义县,六脚乡', '3', '615', '05', '713028', 'Liujiao', '120.2910830', '23.4939420');
INSERT INTO `sys_cn_area` VALUES ('3623', '东石乡', '东石', '3614', null, '中国,台湾,嘉义县,东石乡', '3', '614', '05', '713029', 'Dongshi', '120.1538220', '23.4592350');
INSERT INTO `sys_cn_area` VALUES ('3624', '义竹乡', '义竹', '3614', null, '中国,台湾,嘉义县,义竹乡', '3', '624', '05', '713030', 'Yizhu', '120.2434230', '23.3362770');
INSERT INTO `sys_cn_area` VALUES ('3625', '鹿草乡', '鹿草', '3614', null, '中国,台湾,嘉义县,鹿草乡', '3', '611', '05', '713031', 'Lucao', '120.3083700', '23.4107840');
INSERT INTO `sys_cn_area` VALUES ('3626', '水上乡', '水上', '3614', null, '中国,台湾,嘉义县,水上乡', '3', '608', '05', '713032', 'Shuishang', '120.3979360', '23.4281040');
INSERT INTO `sys_cn_area` VALUES ('3627', '中埔乡', '中埔', '3614', null, '中国,台湾,嘉义县,中埔乡', '3', '606', '05', '713033', 'Zhongpu', '120.5229480', '23.4251480');
INSERT INTO `sys_cn_area` VALUES ('3628', '竹崎乡', '竹崎', '3614', null, '中国,台湾,嘉义县,竹崎乡', '3', '604', '05', '713034', 'Zhuqi', '120.5514660', '23.5231840');
INSERT INTO `sys_cn_area` VALUES ('3629', '梅山乡', '梅山', '3614', null, '中国,台湾,嘉义县,梅山乡', '3', '603', '05', '713035', 'Meishan', '120.5571920', '23.5849150');
INSERT INTO `sys_cn_area` VALUES ('3630', '番路乡', '番路', '3614', null, '中国,台湾,嘉义县,番路乡', '3', '602', '05', '713036', 'Fanlu', '120.5550430', '23.4652220');
INSERT INTO `sys_cn_area` VALUES ('3631', '大埔乡', '大埔', '3614', null, '中国,台湾,嘉义县,大埔乡', '3', '607', '05', '713037', 'Dapu', '120.5937950', '23.2967150');
INSERT INTO `sys_cn_area` VALUES ('3632', '阿里山乡', '阿里山', '3614', null, '中国,台湾,嘉义县,阿里山乡', '3', '605', '05', '713038', 'Alishan', '120.7325200', '23.4679500');
INSERT INTO `sys_cn_area` VALUES ('3633', '屏东县', '屏东', '3326', null, '中国,台湾,屏东县', '2', '9', '08', '713300', 'Pingtung', '120.4879280', '22.6828020');
INSERT INTO `sys_cn_area` VALUES ('3634', '屏东市', '屏东', '3633', null, '中国,台湾,屏东县,屏东市', '3', '900', '08', '713301', 'Pingdong', '120.4884650', '22.6697230');
INSERT INTO `sys_cn_area` VALUES ('3635', '潮州镇', '潮州', '3633', null, '中国,台湾,屏东县,潮州镇', '3', '920', '08', '713321', 'Chaozhou', '120.5428540', '22.5505360');
INSERT INTO `sys_cn_area` VALUES ('3636', '东港镇', '东港', '3633', null, '中国,台湾,屏东县,东港镇', '3', '928', '08', '713322', 'Donggang', '120.4544890', '22.4666260');
INSERT INTO `sys_cn_area` VALUES ('3637', '恒春镇', '恒春', '3633', null, '中国,台湾,屏东县,恒春镇', '3', '946', '08', '713323', 'Hengchun', '120.7454510', '22.0023730');
INSERT INTO `sys_cn_area` VALUES ('3638', '万丹乡', '万丹', '3633', null, '中国,台湾,屏东县,万丹乡', '3', '913', '08', '713324', 'Wandan', '120.4845330', '22.5898390');
INSERT INTO `sys_cn_area` VALUES ('3639', '长治乡', '长治', '3633', null, '中国,台湾,屏东县,长治乡', '3', '908', '08', '713325', 'Changzhi', '120.5276140', '22.6770620');
INSERT INTO `sys_cn_area` VALUES ('3640', '麟洛乡', '麟洛', '3633', null, '中国,台湾,屏东县,麟洛乡', '3', '909', '08', '713326', 'Linluo', '120.5272830', '22.6506040');
INSERT INTO `sys_cn_area` VALUES ('3641', '九如乡', '九如', '3633', null, '中国,台湾,屏东县,九如乡', '3', '904', '08', '713327', 'Jiuru', '120.4901420', '22.7397780');
INSERT INTO `sys_cn_area` VALUES ('3642', '里港乡', '里港', '3633', null, '中国,台湾,屏东县,里港乡', '3', '905', '08', '713328', 'Ligang', '120.4944900', '22.7792200');
INSERT INTO `sys_cn_area` VALUES ('3643', '盐埔乡', '盐埔', '3633', null, '中国,台湾,屏东县,盐埔乡', '3', '907', '08', '713329', 'Yanpu', '120.5728490', '22.7547830');
INSERT INTO `sys_cn_area` VALUES ('3644', '高树乡', '高树', '3633', null, '中国,台湾,屏东县,高树乡', '3', '906', '08', '713330', 'Gaoshu', '120.6002140', '22.8267890');
INSERT INTO `sys_cn_area` VALUES ('3645', '万峦乡', '万峦', '3633', null, '中国,台湾,屏东县,万峦乡', '3', '923', '08', '713331', 'Wanluan', '120.5664770', '22.5719650');
INSERT INTO `sys_cn_area` VALUES ('3646', '内埔乡', '内埔', '3633', null, '中国,台湾,屏东县,内埔乡', '3', '912', '08', '713332', 'Napu', '120.5668650', '22.6119670');
INSERT INTO `sys_cn_area` VALUES ('3647', '竹田乡', '竹田', '3633', null, '中国,台湾,屏东县,竹田乡', '3', '911', '08', '713333', 'Zhutian', '120.5440380', '22.5846780');
INSERT INTO `sys_cn_area` VALUES ('3648', '新埤乡', '新埤', '3633', null, '中国,台湾,屏东县,新埤乡', '3', '925', '08', '713334', 'Xinpi', '120.5495460', '22.4699760');
INSERT INTO `sys_cn_area` VALUES ('3649', '枋寮乡', '枋寮', '3633', null, '中国,台湾,屏东县,枋寮乡', '3', '940', '08', '713335', 'Fangliao', '120.5934380', '22.3655600');
INSERT INTO `sys_cn_area` VALUES ('3650', '新园乡', '新园', '3633', null, '中国,台湾,屏东县,新园乡', '3', '932', '08', '713336', 'Xinyuan', '120.4617390', '22.5439520');
INSERT INTO `sys_cn_area` VALUES ('3651', '崁顶乡', '崁顶', '3633', null, '中国,台湾,屏东县,崁顶乡', '3', '924', '08', '713337', 'Kanding', '120.5145710', '22.5147950');
INSERT INTO `sys_cn_area` VALUES ('3652', '林边乡', '林边', '3633', null, '中国,台湾,屏东县,林边乡', '3', '927', '08', '713338', 'Linbian', '120.5150910', '22.4340150');
INSERT INTO `sys_cn_area` VALUES ('3653', '南州乡', '南州', '3633', null, '中国,台湾,屏东县,南州乡', '3', '926', '08', '713339', 'Nanzhou', '120.5098080', '22.4901920');
INSERT INTO `sys_cn_area` VALUES ('3654', '佳冬乡', '佳冬', '3633', null, '中国,台湾,屏东县,佳冬乡', '3', '931', '08', '713340', 'Jiadong', '120.5515440', '22.4176530');
INSERT INTO `sys_cn_area` VALUES ('3655', '琉球乡', '琉球', '3633', null, '中国,台湾,屏东县,琉球乡', '3', '929', '08', '713341', 'Liuqiu', '120.3690200', '22.3423660');
INSERT INTO `sys_cn_area` VALUES ('3656', '车城乡', '车城', '3633', null, '中国,台湾,屏东县,车城乡', '3', '944', '08', '713342', 'Checheng', '120.7109790', '22.0720770');
INSERT INTO `sys_cn_area` VALUES ('3657', '满州乡', '满州', '3633', null, '中国,台湾,屏东县,满州乡', '3', '947', '08', '713343', 'Manzhou', '120.8388430', '22.0208530');
INSERT INTO `sys_cn_area` VALUES ('3658', '枋山乡', '枋山', '3633', null, '中国,台湾,屏东县,枋山乡', '3', '941', '08', '713344', 'Fangshan', '120.6563560', '22.2603380');
INSERT INTO `sys_cn_area` VALUES ('3659', '三地门乡', '三地门', '3633', null, '中国,台湾,屏东县,三地门乡', '3', '901', '08', '713345', 'Sandimen', '120.6544860', '22.7138770');
INSERT INTO `sys_cn_area` VALUES ('3660', '雾台乡', '雾台', '3633', null, '中国,台湾,屏东县,雾台乡', '3', '902', '08', '713346', 'Wutai', '120.7323180', '22.7448770');
INSERT INTO `sys_cn_area` VALUES ('3661', '玛家乡', '玛家', '3633', null, '中国,台湾,屏东县,玛家乡', '3', '903', '08', '713347', 'Majia', '120.6441300', '22.7067180');
INSERT INTO `sys_cn_area` VALUES ('3662', '泰武乡', '泰武', '3633', null, '中国,台湾,屏东县,泰武乡', '3', '921', '08', '713348', 'Taiwu', '120.6328560', '22.5918190');
INSERT INTO `sys_cn_area` VALUES ('3663', '来义乡', '来义', '3633', null, '中国,台湾,屏东县,来义乡', '3', '922', '08', '713349', 'Laiyi', '120.6336010', '22.5258660');
INSERT INTO `sys_cn_area` VALUES ('3664', '春日乡', '春日', '3633', null, '中国,台湾,屏东县,春日乡', '3', '942', '08', '713350', 'Chunri', '120.6287930', '22.3706720');
INSERT INTO `sys_cn_area` VALUES ('3665', '狮子乡', '狮子', '3633', null, '中国,台湾,屏东县,狮子乡', '3', '943', '08', '713351', 'Shizi', '120.7046170', '22.2019170');
INSERT INTO `sys_cn_area` VALUES ('3666', '牡丹乡', '牡丹', '3633', null, '中国,台湾,屏东县,牡丹乡', '3', '945', '08', '713352', 'Mudan', '120.7701080', '22.1256870');
INSERT INTO `sys_cn_area` VALUES ('3667', '台东县', '台东', '3326', null, '中国,台湾,台东县', '2', '9', '089', '713400', 'Taitung', '120.9160000', '23.0000000');
INSERT INTO `sys_cn_area` VALUES ('3668', '台东市', '台东', '3667', null, '中国,台湾,台东县,台东市', '3', '950', '089', '713401', 'Taidong', '121.1456540', '22.7560450');
INSERT INTO `sys_cn_area` VALUES ('3669', '成功镇', '成功', '3667', null, '中国,台湾,台东县,成功镇', '3', '961', '089', '713421', 'Chenggong', '121.3795710', '23.1002230');
INSERT INTO `sys_cn_area` VALUES ('3670', '关山镇', '关山', '3667', null, '中国,台湾,台东县,关山镇', '3', '956', '089', '713422', 'Guanshan', '121.1631340', '23.0474500');
INSERT INTO `sys_cn_area` VALUES ('3671', '卑南乡', '卑南', '3667', null, '中国,台湾,台东县,卑南乡', '3', '954', '089', '713423', 'Beinan', '121.0835030', '22.7860390');
INSERT INTO `sys_cn_area` VALUES ('3672', '鹿野乡', '鹿野', '3667', null, '中国,台湾,台东县,鹿野乡', '3', '955', '089', '713424', 'Luye', '121.1359820', '22.9139510');
INSERT INTO `sys_cn_area` VALUES ('3673', '池上乡', '池上', '3667', null, '中国,台湾,台东县,池上乡', '3', '958', '089', '713425', 'Chishang', '121.2151390', '23.1223930');
INSERT INTO `sys_cn_area` VALUES ('3674', '东河乡', '东河', '3667', null, '中国,台湾,台东县,东河乡', '3', '959', '089', '713426', 'Donghe', '121.3003340', '22.9699340');
INSERT INTO `sys_cn_area` VALUES ('3675', '长滨乡', '长滨', '3667', null, '中国,台湾,台东县,长滨乡', '3', '962', '089', '713427', 'Changbin', '121.4515220', '23.3150410');
INSERT INTO `sys_cn_area` VALUES ('3676', '太麻里乡', '太麻里', '3667', null, '中国,台湾,台东县,太麻里乡', '3', '963', '089', '713428', 'Taimali', '121.0073940', '22.6153830');
INSERT INTO `sys_cn_area` VALUES ('3677', '大武乡', '大武', '3667', null, '中国,台湾,台东县,大武乡', '3', '965', '089', '713429', 'Dawu', '120.8899380', '22.3399190');
INSERT INTO `sys_cn_area` VALUES ('3678', '绿岛乡', '绿岛', '3667', null, '中国,台湾,台东县,绿岛乡', '3', '951', '089', '713430', 'Lvdao', '121.4925960', '22.6616760');
INSERT INTO `sys_cn_area` VALUES ('3679', '海端乡', '海端', '3667', null, '中国,台湾,台东县,海端乡', '3', '957', '089', '713431', 'Haiduan', '121.1720080', '23.1010740');
INSERT INTO `sys_cn_area` VALUES ('3680', '延平乡', '延平', '3667', null, '中国,台湾,台东县,延平乡', '3', '953', '089', '713432', 'Yanping', '121.0844990', '22.9023580');
INSERT INTO `sys_cn_area` VALUES ('3681', '金峰乡', '金峰', '3667', null, '中国,台湾,台东县,金峰乡', '3', '964', '089', '713433', 'Jinfeng', '120.9712920', '22.5955110');
INSERT INTO `sys_cn_area` VALUES ('3682', '达仁乡', '达仁', '3667', null, '中国,台湾,台东县,达仁乡', '3', '966', '089', '713434', 'Daren', '120.8841310', '22.2948690');
INSERT INTO `sys_cn_area` VALUES ('3683', '兰屿乡', '兰屿', '3667', null, '中国,台湾,台东县,兰屿乡', '3', '952', '089', '713435', 'Lanyu', '121.5324730', '22.0567360');
INSERT INTO `sys_cn_area` VALUES ('3684', '花莲县', '花莲', '3326', null, '中国,台湾,花莲县', '2', '9', '03', '713500', 'Hualien', '121.3000000', '23.8300000');
INSERT INTO `sys_cn_area` VALUES ('3685', '花莲市', '花莲', '3684', null, '中国,台湾,花莲县,花莲市', '3', '970', '03', '713501', 'Hualian', '121.6068100', '23.9820740');
INSERT INTO `sys_cn_area` VALUES ('3686', '凤林镇', '凤林', '3684', null, '中国,台湾,花莲县,凤林镇', '3', '975', '03', '713521', 'Fenglin', '121.4516870', '23.7446480');
INSERT INTO `sys_cn_area` VALUES ('3687', '玉里镇', '玉里', '3684', null, '中国,台湾,花莲县,玉里镇', '3', '981', '03', '713522', 'Yuli', '121.3164450', '23.3365090');
INSERT INTO `sys_cn_area` VALUES ('3688', '新城乡', '新城', '3684', null, '中国,台湾,花莲县,新城乡', '3', '971', '03', '713523', 'Xincheng', '121.6405120', '24.1281330');
INSERT INTO `sys_cn_area` VALUES ('3689', '吉安乡', '吉安', '3684', null, '中国,台湾,花莲县,吉安乡', '3', '973', '03', '713524', 'Ji\'an', '121.5680050', '23.9616350');
INSERT INTO `sys_cn_area` VALUES ('3690', '寿丰乡', '寿丰', '3684', null, '中国,台湾,花莲县,寿丰乡', '3', '974', '03', '713525', 'Shoufeng', '121.5089550', '23.8706800');
INSERT INTO `sys_cn_area` VALUES ('3691', '光复乡', '光复', '3684', null, '中国,台湾,花莲县,光复乡', '3', '976', '03', '713526', 'Guangfu', '121.4234960', '23.6690840');
INSERT INTO `sys_cn_area` VALUES ('3692', '丰滨乡', '丰滨', '3684', null, '中国,台湾,花莲县,丰滨乡', '3', '977', '03', '713527', 'Fengbin', '121.5186390', '23.5970800');
INSERT INTO `sys_cn_area` VALUES ('3693', '瑞穗乡', '瑞穗', '3684', null, '中国,台湾,花莲县,瑞穗乡', '3', '978', '03', '713528', 'Ruisui', '121.3759920', '23.4968170');
INSERT INTO `sys_cn_area` VALUES ('3694', '富里乡', '富里', '3684', null, '中国,台湾,花莲县,富里乡', '3', '983', '03', '713529', 'Fuli', '121.2501240', '23.1799840');
INSERT INTO `sys_cn_area` VALUES ('3695', '秀林乡', '秀林', '3684', null, '中国,台湾,花莲县,秀林乡', '3', '972', '03', '713530', 'Xiulin', '121.6203810', '24.1166420');
INSERT INTO `sys_cn_area` VALUES ('3696', '万荣乡', '万荣', '3684', null, '中国,台湾,花莲县,万荣乡', '3', '979', '03', '713531', 'Wanrong', '121.4074930', '23.7153460');
INSERT INTO `sys_cn_area` VALUES ('3697', '卓溪乡', '卓溪', '3684', null, '中国,台湾,花莲县,卓溪乡', '3', '982', '03', '713532', 'Zhuoxi', '121.3034220', '23.3463690');
INSERT INTO `sys_cn_area` VALUES ('3698', '澎湖县', '澎湖', '3326', null, '中国,台湾,澎湖县', '2', '8', '06', '713600', 'Penghu', '119.5664170', '23.5697330');
INSERT INTO `sys_cn_area` VALUES ('3699', '马公市', '马公', '3698', null, '中国,台湾,澎湖县,马公市', '3', '880', '06', '713601', 'Magong', '119.5664990', '23.5658450');
INSERT INTO `sys_cn_area` VALUES ('3700', '湖西乡', '湖西', '3698', null, '中国,台湾,澎湖县,湖西乡', '3', '885', '06', '713621', 'Huxi', '119.6596660', '23.5833580');
INSERT INTO `sys_cn_area` VALUES ('3701', '白沙乡', '白沙', '3698', null, '中国,台湾,澎湖县,白沙乡', '3', '884', '06', '713622', 'Baisha', '119.5979190', '23.6660600');
INSERT INTO `sys_cn_area` VALUES ('3702', '西屿乡', '西屿', '3698', null, '中国,台湾,澎湖县,西屿乡', '3', '881', '06', '713623', 'Xiyu', '119.5069740', '23.6008360');
INSERT INTO `sys_cn_area` VALUES ('3703', '望安乡', '望安', '3698', null, '中国,台湾,澎湖县,望安乡', '3', '882', '06', '713624', 'Wang\'an', '119.5005380', '23.3575310');
INSERT INTO `sys_cn_area` VALUES ('3704', '七美乡', '七美', '3698', null, '中国,台湾,澎湖县,七美乡', '3', '883', '06', '713625', 'Qimei', '119.4239290', '23.2060180');
INSERT INTO `sys_cn_area` VALUES ('3705', '金门县', '金门', '3326', null, '中国,台湾,金门县', '2', '8', '082', '713700', 'Jinmen', '118.3170890', '24.4327060');
INSERT INTO `sys_cn_area` VALUES ('3706', '金城镇', '金城', '3705', null, '中国,台湾,金门县,金城镇', '3', '893', '082', '713701', 'Jincheng', '118.3166670', '24.4166670');
INSERT INTO `sys_cn_area` VALUES ('3707', '金湖镇', '金湖', '3705', null, '中国,台湾,金门县,金湖镇', '3', '891', '082', '713702', 'Jinhu', '118.4197430', '24.4386330');
INSERT INTO `sys_cn_area` VALUES ('3708', '金沙镇', '金沙', '3705', null, '中国,台湾,金门县,金沙镇', '3', '890', '082', '713703', 'Jinsha', '118.4279930', '24.4811090');
INSERT INTO `sys_cn_area` VALUES ('3709', '金宁乡', '金宁', '3705', null, '中国,台湾,金门县,金宁乡', '3', '892', '082', '713704', 'Jinning', '118.3345060', '24.4567200');
INSERT INTO `sys_cn_area` VALUES ('3710', '烈屿乡', '烈屿', '3705', null, '中国,台湾,金门县,烈屿乡', '3', '894', '082', '713705', 'Lieyu', '118.2472550', '24.4331020');
INSERT INTO `sys_cn_area` VALUES ('3711', '乌丘乡', '乌丘', '3705', null, '中国,台湾,金门县,乌丘乡', '3', '896', '082', '713706', 'Wuqiu', '118.3195780', '24.4350380');
INSERT INTO `sys_cn_area` VALUES ('3712', '连江县', '连江', '3326', null, '中国,台湾,连江县', '2', '2', '0836', '713800', 'Lienchiang', '119.5397040', '26.1973640');
INSERT INTO `sys_cn_area` VALUES ('3713', '南竿乡', '南竿', '3712', null, '中国,台湾,连江县,南竿乡', '3', '209', '0836', '713801', 'Nangan', '119.9442670', '26.1440350');
INSERT INTO `sys_cn_area` VALUES ('3714', '北竿乡', '北竿', '3712', null, '中国,台湾,连江县,北竿乡', '3', '210', '0836', '713802', 'Beigan', '120.0005720', '26.2219830');
INSERT INTO `sys_cn_area` VALUES ('3715', '莒光乡', '莒光', '3712', null, '中国,台湾,连江县,莒光乡', '3', '211', '0836', '713803', 'Juguang', '119.9404050', '25.9762560');
INSERT INTO `sys_cn_area` VALUES ('3716', '东引乡', '东引', '3712', null, '中国,台湾,连江县,东引乡', '3', '212', '0836', '713804', 'Dongyin', '120.4939550', '26.3661640');
INSERT INTO `sys_cn_area` VALUES ('3717', '香港特别行政区', '香港', '1', null, '中国,香港特别行政区', '1', null, '', '810000', 'Hong Kong', '114.1733550', '22.3200480');
INSERT INTO `sys_cn_area` VALUES ('3718', '香港岛', '香港岛', '3717', null, '中国,香港特别行政区,香港岛', '2', '999077', '00852', '810100', 'Hong Kong Island', '114.1773140', '22.2664160');
INSERT INTO `sys_cn_area` VALUES ('3719', '中西区', '中西区', '3718', null, '中国,香港特别行政区,香港岛,中西区', '3', '999077', '00852', '810101', 'Central and Western District', '114.1543740', '22.2819810');
INSERT INTO `sys_cn_area` VALUES ('3720', '湾仔区', '湾仔区', '3718', null, '中国,香港特别行政区,香港岛,湾仔区', '3', '999077', '00852', '810102', 'Wan Chai District', '114.1829150', '22.2763890');
INSERT INTO `sys_cn_area` VALUES ('3721', '东区', '东区', '3718', null, '中国,香港特别行政区,香港岛,东区', '3', '999077', '00852', '810103', 'Eastern District', '114.2559930', '22.2627550');
INSERT INTO `sys_cn_area` VALUES ('3722', '南区', '南区', '3718', null, '中国,香港特别行政区,香港岛,南区', '3', '999077', '00852', '810104', 'Southern District', '114.1741340', '22.2467600');
INSERT INTO `sys_cn_area` VALUES ('3723', '九龙', '九龙', '3717', null, '中国,香港特别行政区,九龙', '2', '999077', '00852', '810200', 'Kowloon', '114.1749500', '22.3271150');
INSERT INTO `sys_cn_area` VALUES ('3724', '油尖旺区', '油尖旺', '3723', null, '中国,香港特别行政区,九龙,油尖旺区', '3', '999077', '00852', '810201', 'Yau Tsim Mong', '114.1733320', '22.3117040');
INSERT INTO `sys_cn_area` VALUES ('3725', '深水埗区', '深水埗', '3723', null, '中国,香港特别行政区,九龙,深水埗区', '3', '999077', '00852', '810202', 'Sham Shui Po', '114.1672100', '22.3281710');
INSERT INTO `sys_cn_area` VALUES ('3726', '九龙城区', '九龙城', '3723', null, '中国,香港特别行政区,九龙,九龙城区', '3', '999077', '00852', '810203', 'Jiulongcheng', '114.1950530', '22.3267300');
INSERT INTO `sys_cn_area` VALUES ('3727', '黄大仙区', '黄大仙', '3723', null, '中国,香港特别行政区,九龙,黄大仙区', '3', '999077', '00852', '810204', 'Wong Tai Sin', '114.1992400', '22.3363130');
INSERT INTO `sys_cn_area` VALUES ('3728', '观塘区', '观塘', '3723', null, '中国,香港特别行政区,九龙,观塘区', '3', '999077', '00852', '810205', 'Kwun Tong', '114.2312680', '22.3094300');
INSERT INTO `sys_cn_area` VALUES ('3729', '新界', '新界', '3717', null, '中国,香港特别行政区,新界', '2', '999077', '00852', '810300', 'New Territories', '114.2024080', '22.3417660');
INSERT INTO `sys_cn_area` VALUES ('3730', '荃湾区', '荃湾', '3729', null, '中国,香港特别行政区,新界,荃湾区', '3', '999077', '00852', '810301', 'Tsuen Wan', '114.1229520', '22.3709730');
INSERT INTO `sys_cn_area` VALUES ('3731', '屯门区', '屯门', '3729', null, '中国,香港特别行政区,新界,屯门区', '3', '999077', '00852', '810302', 'Tuen Mun', '113.9774160', '22.3910470');
INSERT INTO `sys_cn_area` VALUES ('3732', '元朗区', '元朗', '3729', null, '中国,香港特别行政区,新界,元朗区', '3', '999077', '00852', '810303', 'Yuen Long', '114.0397960', '22.4433420');
INSERT INTO `sys_cn_area` VALUES ('3733', '北区', '北区', '3729', null, '中国,香港特别行政区,新界,北区', '3', '999077', '00852', '810304', 'North District', '114.1489590', '22.4940860');
INSERT INTO `sys_cn_area` VALUES ('3734', '大埔区', '大埔', '3729', null, '中国,香港特别行政区,新界,大埔区', '3', '999077', '00852', '810305', 'Tai Po', '114.1717430', '22.4456530');
INSERT INTO `sys_cn_area` VALUES ('3735', '西贡区', '西贡', '3729', null, '中国,香港特别行政区,新界,西贡区', '3', '999077', '00852', '810306', 'Sai Kung', '114.2785400', '22.3794400');
INSERT INTO `sys_cn_area` VALUES ('3736', '沙田区', '沙田', '3729', null, '中国,香港特别行政区,新界,沙田区', '3', '999077', '00852', '810307', 'Sha Tin', '114.1919410', '22.3792940');
INSERT INTO `sys_cn_area` VALUES ('3737', '葵青区', '葵青', '3729', null, '中国,香港特别行政区,新界,葵青区', '3', '999077', '00852', '810308', 'Kwai Tsing', '114.1393200', '22.3638770');
INSERT INTO `sys_cn_area` VALUES ('3738', '离岛区', '离岛', '3729', null, '中国,香港特别行政区,新界,离岛区', '3', '999077', '00852', '810309', 'Outlying Islands', '113.9458420', '22.2815080');
INSERT INTO `sys_cn_area` VALUES ('3739', '澳门特别行政区', '澳门', '1', null, '中国,澳门特别行政区', '1', null, '', '820000', 'Macau', '113.5490900', '22.1989510');
INSERT INTO `sys_cn_area` VALUES ('3740', '澳门半岛', '澳门半岛', '3739', null, '中国,澳门特别行政区,澳门半岛', '2', '999078', '00853', '820100', 'MacauPeninsula', '113.5491340', '22.1987510');
INSERT INTO `sys_cn_area` VALUES ('3741', '花地玛堂区', '花地玛堂区', '3740', null, '中国,澳门特别行政区,澳门半岛,花地玛堂区', '3', '999078', '00853', '820101', 'Nossa Senhora de Fatima', '113.5522840', '22.2080670');
INSERT INTO `sys_cn_area` VALUES ('3742', '圣安多尼堂区', '圣安多尼堂区', '3740', null, '中国,澳门特别行政区,澳门半岛,圣安多尼堂区', '3', '999078', '00853', '820102', 'Santo Antonio', '113.5643010', '22.1238100');
INSERT INTO `sys_cn_area` VALUES ('3743', '大堂区', '大堂', '3740', null, '中国,澳门特别行政区,澳门半岛,大堂区', '3', '999078', '00853', '820103', 'Sé', '113.5529710', '22.1883590');
INSERT INTO `sys_cn_area` VALUES ('3744', '望德堂区', '望德堂区', '3740', null, '中国,澳门特别行政区,澳门半岛,望德堂区', '3', '999078', '00853', '820104', 'Sao Lazaro', '113.5505680', '22.1940810');
INSERT INTO `sys_cn_area` VALUES ('3745', '风顺堂区', '风顺堂区', '3740', null, '中国,澳门特别行政区,澳门半岛,风顺堂区', '3', '999078', '00853', '820105', 'Sao Lourenco', '113.5419280', '22.1873680');
INSERT INTO `sys_cn_area` VALUES ('3746', '氹仔岛', '氹仔岛', '3739', null, '中国,澳门特别行政区,氹仔岛', '2', '999078', '00853', '820200', 'Taipa', '113.5776690', '22.1568380');
INSERT INTO `sys_cn_area` VALUES ('3747', '嘉模堂区', '嘉模堂区', '3746', null, '中国,澳门特别行政区,氹仔岛,嘉模堂区', '3', '999078', '00853', '820201', 'Our Lady Of Carmel\'s Parish', '113.5653030', '22.1490290');
INSERT INTO `sys_cn_area` VALUES ('3748', '路环岛', '路环岛', '3739', null, '中国,澳门特别行政区,路环岛', '2', '999078', '00853', '820300', 'Coloane', '113.5648570', '22.1162260');
INSERT INTO `sys_cn_area` VALUES ('3749', '圣方济各堂区', '圣方济各堂区', '3748', null, '中国,澳门特别行政区,路环岛,圣方济各堂区', '3', '999078', '00853', '820301', 'St Francis Xavier\'s Parish', '113.5599540', '22.1234860');
INSERT INTO `sys_cn_area` VALUES ('3750', '钓鱼岛', '钓鱼岛', '1', null, '中国,钓鱼岛', '1', null, '', '900000', 'DiaoyuDao', '123.4780880', '25.7423850');
INSERT INTO `sys_cn_area` VALUES ('3751', '乌石镇', '乌石', '2242', '陆川县', null, '4', null, null, '450922', 'wushizhen', '110.2432050', '22.1686040');
INSERT INTO `sys_cn_area` VALUES ('3753', '徐村', '徐', '3751', '乌石镇', null, '5', '123456', '0775', null, 'xucun', null, null);
INSERT INTO `sys_cn_area` VALUES ('3754', '上旺', '上', '3751', '乌石镇', null, '5', '654321', '0775', null, 'shangwang', null, null);
INSERT INTO `sys_cn_area` VALUES ('3755', '谢鲁', '谢', '3751', '乌石镇', null, '5', '0', '0775', null, 'xielu', null, null);

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
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
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
INSERT INTO `sys_config` VALUES ('17', '文件存储方式', 'fileStorageType', 'local', '0', '', '0', '2020-04-26 16:57:43', '3', '2020-04-26 17:02:17', '3', '0');
INSERT INTO `sys_config` VALUES ('18', '平台设置', 'PlatformSetting', '{\"systemName\":\"magic4j开发平台\",\"systemLogo\":\"http://127.0.0.1:8888/uploadFile/498702980FFEF9D6B8C9B7D5425C786A.jpg\"}', null, null, '0', '2020-05-13 02:45:01', '3', '2020-05-13 02:45:01', '3', '0');
INSERT INTO `sys_config` VALUES ('19', '测试kEY', 'testKey', 'TESTval', '0', '测试', '0', '2020-07-08 23:25:51', '3', '2020-07-08 23:25:51', '3', '1');
INSERT INTO `sys_config` VALUES ('20', 'string', 'string', 'string', '0', '灌灌灌灌', '0', '2020-07-08 23:33:43', '3', '2020-07-08 23:34:32', '3', '1');

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
  `org_category` int(11) DEFAULT '0' COMMENT '机构类型(0:默认，1:公司，2:部门，3:小组，4:其他)',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` int(11) DEFAULT '0' COMMENT '删除标志（0:未删除 1:已删除）',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '', '元力云网络有限公司', '0', null, null, null, '0', null, '5', '0', '6', '2020-04-04 14:46:24', '6', '2020-04-04 15:00:41');
INSERT INTO `sys_dept` VALUES ('2', '1', '', '研发部', '0', null, null, null, '0', null, '5', '0', '6', '2020-04-04 14:54:16', '6', '2020-04-04 14:54:16');
INSERT INTO `sys_dept` VALUES ('3', '1', '', '运营部', '0', null, null, null, '0', null, '5', '0', '6', '2020-04-04 14:55:29', '6', '2020-04-04 14:55:29');
INSERT INTO `sys_dept` VALUES ('4', '1', '', '市场部', '0', null, null, null, '0', null, '5', '0', '6', '2020-04-04 14:55:38', '6', '2020-04-04 14:55:38');
INSERT INTO `sys_dept` VALUES ('5', '2', '', 'java服务端组', '1', '', '', '', '0', null, '6', '1', '6', '2020-04-04 14:56:49', '3', '2020-05-08 08:34:26');
INSERT INTO `sys_dept` VALUES ('6', '2', '', '大数据开发组', '2', '', '', '', '0', null, '5', '0', '6', '2020-04-04 14:57:01', '3', '2020-05-08 08:34:31');
INSERT INTO `sys_dept` VALUES ('8', '2', '', '物联网开发组', '3', '', '', '', '0', null, '5', '0', '6', '2020-04-04 15:01:33', '3', '2020-05-08 08:34:37');
INSERT INTO `sys_dept` VALUES ('9', '11', '', '行政部', '0', null, null, null, '0', null, '6', '1', '6', '2020-04-04 15:02:03', '6', '2020-04-04 15:03:33');
INSERT INTO `sys_dept` VALUES ('10', '11', '', '财务部', '0', null, null, null, '0', null, '6', '1', '6', '2020-04-04 15:02:20', '6', '2020-04-04 15:03:56');
INSERT INTO `sys_dept` VALUES ('11', '1', '', '综合部', '0', null, null, null, '0', null, '6', '1', '6', '2020-04-04 15:02:42', '6', '2020-04-04 15:02:42');
INSERT INTO `sys_dept` VALUES ('12', '2', '', '测试组', '4', '', '', '', '0', null, '6', '1', '10', '2020-04-05 20:23:54', '3', '2020-05-08 08:34:45');
INSERT INTO `sys_dept` VALUES ('13', '4', '', '销售部', '1', '张三', '13557591759', '123@qq.com', '0', null, '0', '1', '3', '2020-04-15 07:12:30', '3', '2020-04-15 07:12:30');
INSERT INTO `sys_dept` VALUES ('14', '4', '', '采购部', '2', '李四', '15177196635', '', '0', null, '0', '1', '3', '2020-04-15 07:15:10', '3', '2020-04-15 07:36:40');
INSERT INTO `sys_dept` VALUES ('15', '0', '', '迈傲科技', '1', '伍工', null, null, '0', null, '6', '0', '38', '2020-05-13 11:29:12', '38', '2020-05-13 11:29:12');
INSERT INTO `sys_dept` VALUES ('16', '15', '', '研发部', '1', '刘工', null, null, '0', null, '6', '0', '38', '2020-05-13 11:29:32', '38', '2020-05-13 11:29:32');
INSERT INTO `sys_dept` VALUES ('17', '15', '', '市场部', '2', '左工', null, null, '0', null, '6', '0', '38', '2020-05-13 11:30:53', '38', '2020-05-13 11:30:53');
INSERT INTO `sys_dept` VALUES ('18', '15', '', '综合部', '1', '傅工', null, null, '0', null, '6', '0', '38', '2020-05-13 11:31:19', '38', '2020-05-13 11:31:19');
INSERT INTO `sys_dept` VALUES ('19', '16', '', '产品工作室', '1', '高工', null, null, '0', null, '6', '0', '38', '2020-05-13 11:31:48', '38', '2020-05-13 11:31:48');
INSERT INTO `sys_dept` VALUES ('20', '16', '', '产品研发室', '2', '徐工', '13822290843', '290603672@qq.com', '0', null, '6', '0', '38', '2020-05-13 11:32:39', '38', '2020-05-13 11:33:05');
INSERT INTO `sys_dept` VALUES ('21', '0', '', '京信通信', '1', '张', null, null, '0', null, '4', '0', '37', '2020-05-13 11:52:55', '37', '2020-05-13 11:52:55');
INSERT INTO `sys_dept` VALUES ('22', '21', '', '研发部', '1', '李四', null, null, '0', null, '4', '0', '37', '2020-05-13 11:53:11', '37', '2020-05-13 11:53:11');
INSERT INTO `sys_dept` VALUES ('23', '21', '', '市场部', '1', '朱', null, null, '0', null, '4', '0', '37', '2020-05-13 11:53:27', '37', '2020-05-13 11:53:27');

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
  `create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` int(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_dc_dt` (`dict_type`,`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统字典表';

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
INSERT INTO `sys_dict` VALUES ('49', '0', '岗位类型', 'post_category', '1', '高层', '1', null, '3', '2020-09-08 12:21:03', '3', '2020-09-08 12:21:03', '0');
INSERT INTO `sys_dict` VALUES ('50', '0', '岗位类型', 'post_category', '2', '中层', '1', null, '3', '2020-09-08 12:21:04', '3', '2020-09-08 12:21:04', '0');
INSERT INTO `sys_dict` VALUES ('51', '0', '岗位类型', 'post_category', '3', '基层', '1', null, '3', '2020-09-08 12:21:04', '3', '2020-09-08 12:21:04', '0');
INSERT INTO `sys_dict` VALUES ('52', '0', '岗位类型', 'post_category', '4', '其他', '1', null, '3', '2020-09-08 12:21:04', '3', '2020-09-08 12:21:04', '0');
INSERT INTO `sys_dict` VALUES ('53', '0', '机构类型', 'org_type', '1', '公司', '1', null, '3', '2020-10-15 15:30:55', '3', '2020-09-08 14:17:05', '0');
INSERT INTO `sys_dict` VALUES ('54', '0', '机构类型', 'org_type', '2', '部门', '1', null, '3', '2020-10-15 15:31:00', '3', '2020-09-08 14:17:05', '0');
INSERT INTO `sys_dict` VALUES ('55', '0', '机构类型', 'org_type', '3', '小组', '1', null, '3', '2020-10-15 15:31:05', '3', '2020-09-08 14:17:05', '0');
INSERT INTO `sys_dict` VALUES ('56', '0', '机构类型', 'org_type', '4', '其他', '1', null, '3', '2020-10-15 15:31:10', '3', '2020-09-08 14:17:05', '0');
INSERT INTO `sys_dict` VALUES ('57', '0', '机构状态', 'org_status', '0', '正常', '1', null, '3', '2020-11-06 14:21:00', '3', '2020-11-06 14:21:00', '0');
INSERT INTO `sys_dict` VALUES ('58', '0', '机构状态', 'org_status', '1', '停用', '1', null, '3', '2020-11-06 14:21:00', '3', '2020-11-06 14:21:00', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COMMENT='文件管理';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('70', '6', '资产和设备关系.png', 'rBAACl64HLOATewUAABg_SMO31I123.png', 'group1/M00/00/00/rBAACl64HLOATewUAABg_SMO31I123.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64HLOATewUAABg_SMO31I123.png', 'png', 'fastdfs', '24829', 'afc3101196aa37fff6cee3cb7d0b348c', null, '2020-05-10 23:24:35', '30', '2020-05-10 23:24:35', '30', '1');
INSERT INTO `sys_file` VALUES ('71', '6', 'tb-gateway负载均衡_20200429153747.png', 'rBAACl64HLOAfNgVAAFLK2OYDo4760.png', 'group1/M00/00/00/rBAACl64HLOAfNgVAAFLK2OYDo4760.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64HLOAfNgVAAFLK2OYDo4760.png', 'png', 'fastdfs', '84779', '9f2f0ad85a6907e51ed72d7815e19459', null, '2020-05-10 23:24:35', '30', '2020-05-10 23:24:35', '30', '1');
INSERT INTO `sys_file` VALUES ('72', '0', '垃圾回收器2_20200319202259.png', 'rBAACl64njOAPBAUAAMVJyS_Ips857.png', 'group1/M00/00/00/rBAACl64njOAPBAUAAMVJyS_Ips857.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64njOAPBAUAAMVJyS_Ips857.png', 'png', 'fastdfs', '202023', '70d15e0cb0e34907bc2c0bb0962cea34', null, '2020-05-11 08:37:08', '32', '2020-05-11 08:37:08', '32', '1');
INSERT INTO `sys_file` VALUES ('73', '0', '垃圾回收器_20200319202259.png', 'rBAACl64njuAMIYYAAga-xBiWTQ653.png', 'group1/M00/00/00/rBAACl64njuAMIYYAAga-xBiWTQ653.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64njuAMIYYAAga-xBiWTQ653.png', 'png', 'fastdfs', '531195', '2f64687164e8d15608d879648eda6338', null, '2020-05-11 08:37:15', '32', '2020-05-11 08:37:15', '32', '1');
INSERT INTO `sys_file` VALUES ('74', '0', '狼.png', 'rBAACl64oimAF7FKAACDjkPoIfE888.png', 'group1/M00/00/00/rBAACl64oimAF7FKAACDjkPoIfE888.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64oimAF7FKAACDjkPoIfE888.png', 'png', 'fastdfs', '33678', '034c454458df34cc47b4e50058e78daa', null, '2020-05-11 08:54:01', '32', '2020-05-11 08:54:01', '32', '1');
INSERT INTO `sys_file` VALUES ('75', '0', '热水器.png', 'rBAACl64o2yAAhp8AACxijr734U232.png', 'group1/M00/00/00/rBAACl64o2yAAhp8AACxijr734U232.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64o2yAAhp8AACxijr734U232.png', 'png', 'fastdfs', '45450', '9c18954e0ffd84ea55a5c0a17ee8637b', null, '2020-05-11 08:59:24', '32', '2020-05-11 08:59:24', '32', '1');
INSERT INTO `sys_file` VALUES ('76', '0', '燃气灶.png', 'rBAACl64o2yAaru7AAC9g9Psqq8968.png', 'group1/M00/00/00/rBAACl64o2yAaru7AAC9g9Psqq8968.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64o2yAaru7AAC9g9Psqq8968.png', 'png', 'fastdfs', '48515', '643e6df27a9cdb48e18f341b0c6b8d8f', null, '2020-05-11 08:59:24', '32', '2020-05-11 08:59:24', '32', '1');
INSERT INTO `sys_file` VALUES ('77', '6', 'Iot_gateway_架构_20200226223934.png', 'rBAACl64pBiAXFcsAALINc5Ufyk291.png', 'group1/M00/00/00/rBAACl64pBiAXFcsAALINc5Ufyk291.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64pBiAXFcsAALINc5Ufyk291.png', 'png', 'fastdfs', '182325', 'ca161dd6883ed3b0220973b6becdc2f3', null, '2020-05-11 09:02:16', '30', '2020-05-11 09:02:16', '30', '1');
INSERT INTO `sys_file` VALUES ('78', '6', 'IOT网关架构图.png', 'rBAACl64pBmAIM1UAALHmRDmCT4153.png', 'group1/M00/00/00/rBAACl64pBmAIM1UAALHmRDmCT4153.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64pBmAIM1UAALHmRDmCT4153.png', 'png', 'fastdfs', '182169', '992b9370398674713233492a05a33aa0', null, '2020-05-11 09:02:17', '30', '2020-05-11 09:02:17', '30', '1');
INSERT INTO `sys_file` VALUES ('79', '6', 'jvm分代算法_20200319202120.png', 'rBAACl64pXyAWC15AAJEzhG3QBM279.png', 'group1/M00/00/00/rBAACl64pXyAWC15AAJEzhG3QBM279.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64pXyAWC15AAJEzhG3QBM279.png', 'png', 'fastdfs', '148686', '31348b50601073d04a2db93d771f5bfb', null, '2020-05-11 09:08:12', '30', '2020-05-11 09:08:12', '30', '1');
INSERT INTO `sys_file` VALUES ('80', '6', 'tbCEandPEcompare2.png', 'rBAACl64sE2ATcbkAACQ8rj4Y_Q821.png', 'group1/M00/00/00/rBAACl64sE2ATcbkAACQ8rj4Y_Q821.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64sE2ATcbkAACQ8rj4Y_Q821.png', 'png', 'fastdfs', '37106', '48d52ddb6478d196092f1e39c132a159', null, '2020-05-11 09:54:21', '30', '2020-05-11 09:54:21', '30', '1');
INSERT INTO `sys_file` VALUES ('81', '6', 'tbCEandPEcompare.png', 'rBAACl64sE2AT71bAAED87a3iQ4394.png', 'group1/M00/00/00/rBAACl64sE2AT71bAAED87a3iQ4394.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64sE2AT71bAAED87a3iQ4394.png', 'png', 'fastdfs', '66547', '35adcf0af62385d599f249633dc7a833', null, '2020-05-11 09:54:21', '30', '2020-05-11 09:54:21', '30', '1');
INSERT INTO `sys_file` VALUES ('82', '0', 'TB网关集群方案一.svg', 'rBAACl64sR-AWMLpAAJSpsIlFJQ630.svg', 'group1/M00/00/00/rBAACl64sR-AWMLpAAJSpsIlFJQ630.svg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64sR-AWMLpAAJSpsIlFJQ630.svg', 'svg', 'fastdfs', '152230', 'e31ef7bc273968fd5217ce8aee5b7f70', null, '2020-05-11 09:57:51', '32', '2020-05-11 09:57:51', '32', '1');
INSERT INTO `sys_file` VALUES ('83', '0', 'TB网关集群方案二.svg', 'rBAACl64sSmAQUVxAAIteMtGum8655.svg', 'group1/M00/00/00/rBAACl64sSmAQUVxAAIteMtGum8655.svg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl64sSmAQUVxAAIteMtGum8655.svg', 'svg', 'fastdfs', '142712', '01bbcaf42b7fd3af4237ea2995a316aa', null, '2020-05-11 09:58:01', '32', '2020-05-11 09:58:01', '32', '1');
INSERT INTO `sys_file` VALUES ('84', '0', 'timg.jpg', 'rBAACl667qeAV2q-AABsYmyDkDs957.jpg', 'group1/M00/00/00/rBAACl667qeAV2q-AABsYmyDkDs957.jpg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl667qeAV2q-AABsYmyDkDs957.jpg', 'jpg', 'fastdfs', '27746', '0b8678480f5ee3129305d3ac511a0b06', null, '2020-05-13 02:44:55', '3', '2020-05-13 02:44:55', '3', '1');
INSERT INTO `sys_file` VALUES ('85', '0', 'timg.jpg', 'rBAACl6674iAFTpUAABsYmyDkDs326.jpg', 'group1/M00/00/00/rBAACl6674iAFTpUAABsYmyDkDs326.jpg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl6674iAFTpUAABsYmyDkDs326.jpg', 'jpg', 'fastdfs', '27746', '0b8678480f5ee3129305d3ac511a0b06', null, '2020-05-13 02:48:41', '3', '2020-05-13 02:48:41', '3', '1');
INSERT INTO `sys_file` VALUES ('86', '0', 'timg.jpg', 'rBAACl668TmAXg31AABsYmyDkDs121.jpg', 'group1/M00/00/00/rBAACl668TmAXg31AABsYmyDkDs121.jpg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl668TmAXg31AABsYmyDkDs121.jpg', 'jpg', 'fastdfs', '27746', '0b8678480f5ee3129305d3ac511a0b06', null, '2020-05-13 02:55:54', '3', '2020-05-13 02:55:54', '3', '1');
INSERT INTO `sys_file` VALUES ('87', '0', 'timg.jpg', 'rBAACl668eqALkkMAABsYmyDkDs025.jpg', 'group1/M00/00/00/rBAACl668eqALkkMAABsYmyDkDs025.jpg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl668eqALkkMAABsYmyDkDs025.jpg', 'jpg', 'fastdfs', '27746', '0b8678480f5ee3129305d3ac511a0b06', null, '2020-05-13 02:58:51', '3', '2020-05-13 02:58:51', '3', '1');
INSERT INTO `sys_file` VALUES ('88', '0', 'me_20200228004143.jpg', 'rBAACl668mWAR5smAAI1pwHQmMo389.jpg', 'group1/M00/00/00/rBAACl668mWAR5smAAI1pwHQmMo389.jpg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl668mWAR5smAAI1pwHQmMo389.jpg', 'jpg', 'fastdfs', '144807', 'c48255f88be8595af449fc6ec4bdf1c3', null, '2020-05-13 03:00:54', '3', '2020-05-13 03:00:54', '3', '1');
INSERT INTO `sys_file` VALUES ('89', '0', '码出未来.jpg', 'rBAACl668ueAP8hrAAA0QPSWMD4901.jpg', 'group1/M00/00/00/rBAACl668ueAP8hrAAA0QPSWMD4901.jpg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl668ueAP8hrAAA0QPSWMD4901.jpg', 'jpg', 'fastdfs', '13376', '8d2af682f979c23e0652ccb99a8bcb69', null, '2020-05-13 03:03:04', '3', '2020-05-13 03:03:04', '3', '1');
INSERT INTO `sys_file` VALUES ('90', '6', 'mapout_LOGO.png', 'rBAACl66-Y6AGHDPAAAbUjZ6V8I587.png', 'group1/M00/00/00/rBAACl66-Y6AGHDPAAAbUjZ6V8I587.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl66-Y6AGHDPAAAbUjZ6V8I587.png', 'png', 'fastdfs', '6994', 'f29a98fd87af1ba6473de9359e74f147', null, '2020-05-13 03:31:27', '38', '2020-05-13 03:31:27', '38', '1');
INSERT INTO `sys_file` VALUES ('91', '0', 'IOT网关架构图.png', 'rBAACl66_fKAVWQ0AALHmRDmCT4670.png', 'group1/M00/00/00/rBAACl66_fKAVWQ0AALHmRDmCT4670.png', 'http://file.itgacl.com/group1/M00/00/00/rBAACl66_fKAVWQ0AALHmRDmCT4670.png', 'png', 'fastdfs', '182169', '992b9370398674713233492a05a33aa0', null, '2020-05-13 03:50:10', '32', '2020-05-13 03:50:10', '32', '1');
INSERT INTO `sys_file` VALUES ('92', '0', 'TB网关集群方案一.svg', 'rBAACl66_oyAFbl7AAJSpsIlFJQ142.svg', 'group1/M00/00/00/rBAACl66_oyAFbl7AAJSpsIlFJQ142.svg', 'http://file.itgacl.com/group1/M00/00/00/rBAACl66_oyAFbl7AAJSpsIlFJQ142.svg', 'svg', 'fastdfs', '152230', 'e31ef7bc273968fd5217ce8aee5b7f70', null, '2020-05-13 03:52:45', '32', '2020-05-13 03:52:45', '32', '1');
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
INSERT INTO `sys_file` VALUES ('135', '6', 'gc算法1_20200319201813.png', 'rBAACl67aPyAP-QUAAM30YGixgE557.png', 'group1/M00/00/01/rBAACl67aPyAP-QUAAM30YGixgE557.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67aPyAP-QUAAM30YGixgE557.png', 'png', 'fastdfs', '210897', 'c5a764e94227620f4bd0a11baa3a6dde', null, '2020-05-13 11:27:09', '38', '2020-05-13 11:27:09', '38', '1');
INSERT INTO `sys_file` VALUES ('136', '6', 'gc算法3_20200319201943.png', 'rBAACl67aQGAefSYAAQ2IdN3NY4795.png', 'group1/M00/00/01/rBAACl67aQGAefSYAAQ2IdN3NY4795.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67aQGAefSYAAQ2IdN3NY4795.png', 'png', 'fastdfs', '276001', 'bdf89853f4d659d12b015dac870ba2a3', null, '2020-05-13 11:27:09', '38', '2020-05-13 11:27:09', '38', '1');
INSERT INTO `sys_file` VALUES ('137', '6', 'gc回收算法_20200319201740.png', 'rBAACl67aQWAHOYOAAIhAUGU_B8958.png', 'group1/M00/00/01/rBAACl67aQWAHOYOAAIhAUGU_B8958.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67aQWAHOYOAAIhAUGU_B8958.png', 'png', 'fastdfs', '139521', '5c484ae76248ac00dcdeea38af733920', null, '2020-05-13 11:27:09', '38', '2020-05-13 11:27:09', '38', '1');
INSERT INTO `sys_file` VALUES ('138', '6', 'gc算法2_20200319201841.png', 'rBAACl67aQyAMAqkAAPD_54rF7U013.png', 'group1/M00/00/01/rBAACl67aQyAMAqkAAPD_54rF7U013.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67aQyAMAqkAAPD_54rF7U013.png', 'png', 'fastdfs', '246783', '4f623c4e7952525f850c3af7fc549ec1', null, '2020-05-13 11:27:09', '38', '2020-05-13 11:27:09', '38', '1');
INSERT INTO `sys_file` VALUES ('139', '0', 'magic4j项目结构_20200508151434.png', 'rBAACl67bX2AZM4OAAA0kXoP_b4673.png', 'group1/M00/00/01/rBAACl67bX2AZM4OAAA0kXoP_b4673.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67bX2AZM4OAAA0kXoP_b4673.png', 'png', 'fastdfs', '13457', '322b7cd2beba4c2976f866f52e9248ea', null, '2020-05-13 11:46:05', '32', '2020-05-13 11:46:05', '32', '1');
INSERT INTO `sys_file` VALUES ('140', '4', 'comba.png', 'rBAACl67blGAbMzEAAAGvZZdWIY806.png', 'group1/M00/00/01/rBAACl67blGAbMzEAAAGvZZdWIY806.png', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67blGAbMzEAAAGvZZdWIY806.png', 'png', 'fastdfs', '1725', 'd87a4cade042df2a0f06409a2e503aad', null, '2020-05-13 11:49:38', '37', '2020-05-13 11:49:38', '37', '1');
INSERT INTO `sys_file` VALUES ('141', '0', '码出未来.jpg', '4F883CC9126B4703CBD0088C3B22ECCA.jpg', '/home/magic4j/uploadFilesManager/4F883CC9126B4703CBD0088C3B22ECCA.jpg', 'http://file.itgacl.com/uploadFile/4F883CC9126B4703CBD0088C3B22ECCA.jpg', 'jpg', 'sftp', '13376', '8d2af682f979c23e0652ccb99a8bcb69', null, '2020-05-13 20:01:50', '3', '2020-05-13 20:01:50', '3', '1');
INSERT INTO `sys_file` VALUES ('142', '0', 'id.png', '455572225B578EB9BC0E9A36EBBC7474.png', 'magic4j/20200513/455572225B578EB9BC0E9A36EBBC7474.png', 'http://ossfile.itgacl.com/magic4j/20200513/455572225B578EB9BC0E9A36EBBC7474.png', 'png', 'oss', '8145', '6b844a5eeef64fff34ab405099e73e0a', null, '2020-05-13 20:44:26', '3', '2020-05-13 20:44:26', '3', '1');
INSERT INTO `sys_file` VALUES ('143', '0', 'dto.png', '9D2A889905A4E18741AC1DC428EF8EFE.png', 'magic4j/20200513/9D2A889905A4E18741AC1DC428EF8EFE.png', 'http://ossfile.itgacl.com/magic4j/20200513/9D2A889905A4E18741AC1DC428EF8EFE.png', 'png', 'oss', '5206', '1bcf9b12c1f6f76051df56b275ab70f8', null, '2020-05-13 20:44:26', '3', '2020-05-13 20:44:26', '3', '1');
INSERT INTO `sys_file` VALUES ('144', '0', 'logo.jpg', '5E489488DECA87E7032ACC8B7131C761.jpg', '/home/dddapp/uploadFilesManager/5E489488DECA87E7032ACC8B7131C761.jpg', 'http://file.jielongbuy.com/uploadFile/5E489488DECA87E7032ACC8B7131C761.jpg', 'jpg', 'sftp', '196258', '3edade6c7a4567e3f5aa931de8e7b155', null, '2020-06-05 15:57:40', '3', '2020-06-05 15:57:40', '3', '1');
INSERT INTO `sys_file` VALUES ('145', null, 'timg.jpg', 'E81155AA2296FF941634326086CF9ABF.jpg', 'dddjlapp/20200704/E81155AA2296FF941634326086CF9ABF.jpg', 'http://ossfile.jielongbuy.com/dddjlapp/20200704/E81155AA2296FF941634326086CF9ABF.jpg', 'jpg', 'oss', '27746', '0b8678480f5ee3129305d3ac511a0b06', null, '2020-07-04 08:31:21', '3', '2020-07-04 08:31:21', '3', '0');
INSERT INTO `sys_file` VALUES ('146', null, 'me_20200228004143.jpg', '081E1C2E6FA3F09F4084FF52C175E9D0.jpg', 'dddjlapp/20200704/081E1C2E6FA3F09F4084FF52C175E9D0.jpg', 'http://ossfile.jielongbuy.com/dddjlapp/20200704/081E1C2E6FA3F09F4084FF52C175E9D0.jpg', 'jpg', 'oss', '144807', 'c48255f88be8595af449fc6ec4bdf1c3', null, '2020-07-04 08:32:21', '3', '2020-07-04 08:32:21', '3', '0');
INSERT INTO `sys_file` VALUES ('147', null, '码出未来.jpg', '52CC74F0A93A8CEF314210CAE7BDCDF9.jpg', 'dddjlapp/20200704/52CC74F0A93A8CEF314210CAE7BDCDF9.jpg', 'http://ossfile.jielongbuy.com/dddjlapp/20200704/52CC74F0A93A8CEF314210CAE7BDCDF9.jpg', 'jpg', 'oss', '13376', '8d2af682f979c23e0652ccb99a8bcb69', null, '2020-07-04 08:32:21', '3', '2020-07-04 08:32:21', '3', '0');
INSERT INTO `sys_file` VALUES ('148', null, 'qrcode_for_gh_c20cbc16be76_258.jpg', '6AFDA050FA367111383E24949AA0946A.jpg', '/home/dddapp/uploadFilesManager/6AFDA050FA367111383E24949AA0946A.jpg', 'http://file.jielongbuy.com/uploadFile/6AFDA050FA367111383E24949AA0946A.jpg', 'jpg', 'sftp', '26805', '8ac1adb1b07b33049cc24a5896f6c8da', null, '2020-07-04 08:33:50', '3', '2020-07-04 08:33:50', '3', '0');
INSERT INTO `sys_file` VALUES ('149', null, 'wxPayQrCode.png', '65FE216D7BA4F5DAE181F99EBED9C795.png', '/home/dddapp/uploadFilesManager/65FE216D7BA4F5DAE181F99EBED9C795.png', 'http://file.jielongbuy.com/uploadFile/65FE216D7BA4F5DAE181F99EBED9C795.png', 'png', 'sftp', '31495', '497aceef43dfbe1d698b249521b2873b', null, '2020-07-04 08:33:50', '3', '2020-07-04 08:33:50', '3', '0');
INSERT INTO `sys_file` VALUES ('150', null, 'qrcode_for_gh_c20cbc16be76_258.jpg', 'E12B92DA838A8173BA2D03E185EAF4D5.jpg', 'C:/data/dddapp/uploadFilesManager/E12B92DA838A8173BA2D03E185EAF4D5.jpg', 'http://127.0.0.1:8888/uploadFile/E12B92DA838A8173BA2D03E185EAF4D5.jpg', '.jpg', 'local', '26805', '8ac1adb1b07b33049cc24a5896f6c8da', null, '2020-07-04 09:06:42', '3', '2020-07-04 09:06:42', '3', '0');
INSERT INTO `sys_file` VALUES ('151', null, '微信支付二维码_20200229140946.jpg', '14F41523929238BCFB7B28824ED71F37.jpg', '/home/dddapp/uploadFilesManager/14F41523929238BCFB7B28824ED71F37.jpg', 'http://file-test.jielongbuy.com/uploadFile/14F41523929238BCFB7B28824ED71F37.jpg', 'jpg', 'sftp', '108642', 'f547bc0dd476373219b37590703864e8', null, '2020-07-04 09:11:50', '3', '2020-07-04 09:11:50', '3', '0');
INSERT INTO `sys_file` VALUES ('152', null, '支付宝收款码_20200229140523.jpg', '480F3A6FAB5C227CA6CCC05DDCC020D9.jpg', '/home/dddapp/uploadFilesManager/480F3A6FAB5C227CA6CCC05DDCC020D9.jpg', 'http://file-test.jielongbuy.com/uploadFile/480F3A6FAB5C227CA6CCC05DDCC020D9.jpg', 'jpg', 'sftp', '68826', '4a9068675db0f7284850494f4ee877a3', null, '2020-07-04 09:11:50', '3', '2020-07-04 09:11:50', '3', '0');
INSERT INTO `sys_file` VALUES ('153', null, 'timg.jpg', '0C5616D653EC3E355774737AE215125D.jpg', '/home/dddapp/uploadFilesManager/0C5616D653EC3E355774737AE215125D.jpg', 'http://file-test.jielongbuy.com/uploadFile/0C5616D653EC3E355774737AE215125D.jpg', 'jpg', 'sftp', '27746', '0b8678480f5ee3129305d3ac511a0b06', null, '2020-07-04 09:12:49', '3', '2020-07-04 09:12:49', '3', '0');
INSERT INTO `sys_file` VALUES ('154', '0', 'me_20200228004143.jpg', 'rBAACl8FPKiAOGDuAAI1pwHQmMo653.jpg', 'group1/M00/00/08/rBAACl8FPKiAOGDuAAI1pwHQmMo653.jpg', 'http://file.itgacl.com/group1/M00/00/08/rBAACl8FPKiAOGDuAAI1pwHQmMo653.jpg', 'jpg', 'fastdfs', '144807', 'c48255f88be8595af449fc6ec4bdf1c3', null, '2020-07-08 11:25:40', '3', '2020-07-08 11:25:40', '3', '1');
INSERT INTO `sys_file` VALUES ('155', '0', '码出未来.jpg', 'rBAACl8FPL-AIZTFAAA0QPSWMD4263.jpg', 'group1/M00/00/08/rBAACl8FPL-AIZTFAAA0QPSWMD4263.jpg', 'http://file.itgacl.com/group1/M00/00/08/rBAACl8FPL-AIZTFAAA0QPSWMD4263.jpg', 'jpg', 'fastdfs', '13376', '8d2af682f979c23e0652ccb99a8bcb69', null, '2020-07-08 11:26:02', '3', '2020-07-08 11:26:02', '3', '1');
INSERT INTO `sys_file` VALUES ('156', '0', 'me_20200228004143.jpg', '1D08A2218121499937DF459CED9EB30F.jpg', 'magic4j/20200708/1D08A2218121499937DF459CED9EB30F.jpg', 'http://ossfile.itgacl.com/magic4j/20200708/1D08A2218121499937DF459CED9EB30F.jpg', 'jpg', 'oss', '144807', 'c48255f88be8595af449fc6ec4bdf1c3', null, '2020-07-08 16:15:38', '3', '2020-07-08 16:15:38', '3', '1');
INSERT INTO `sys_file` VALUES ('157', '0', 'me_20200228004143.jpg', 'A2F3CA849C6A3E9718AD07A560772EE8.jpg', '/home/magic4j/uploadFilesManager/A2F3CA849C6A3E9718AD07A560772EE8.jpg', 'http://file.itgacl.com/uploadFile/A2F3CA849C6A3E9718AD07A560772EE8.jpg', 'jpg', 'sftp', '144807', 'c48255f88be8595af449fc6ec4bdf1c3', null, '2020-07-08 16:25:15', '3', '2020-07-08 16:25:15', '3', '1');
INSERT INTO `sys_file` VALUES ('158', '0', 'timg.jpg', 'CF2E1F3DA43E6E3863A02BB3C9F376FC.jpg', '/home/magic4j/uploadFilesManager/CF2E1F3DA43E6E3863A02BB3C9F376FC.jpg', 'http://file.itgacl.com/uploadFile/CF2E1F3DA43E6E3863A02BB3C9F376FC.jpg', 'jpg', 'sftp', '27746', '0b8678480f5ee3129305d3ac511a0b06', null, '2020-07-08 16:25:15', '3', '2020-07-08 16:25:15', '3', '1');
INSERT INTO `sys_file` VALUES ('159', '0', 'qrcode_for_gh_c20cbc16be76_258.jpg', '4BECF463BEAC3A71B3812F0586296810.jpg', 'magic4j/20200708/4BECF463BEAC3A71B3812F0586296810.jpg', 'http://ossfile.itgacl.com/magic4j/20200708/4BECF463BEAC3A71B3812F0586296810.jpg', 'jpg', 'oss', '26805', '8ac1adb1b07b33049cc24a5896f6c8da', null, '2020-07-08 16:35:40', '3', '2020-07-08 16:35:40', '3', '1');
INSERT INTO `sys_file` VALUES ('160', '0', 'wxPayQrCode.png', 'D95B93B7150BCF7CA4FCD93E0CF51443.png', 'magic4j/20200708/D95B93B7150BCF7CA4FCD93E0CF51443.png', 'http://ossfile.itgacl.com/magic4j/20200708/D95B93B7150BCF7CA4FCD93E0CF51443.png', 'png', 'oss', '31495', '497aceef43dfbe1d698b249521b2873b', null, '2020-07-08 16:35:40', '3', '2020-07-08 16:35:40', '3', '1');
INSERT INTO `sys_file` VALUES ('161', '0', 'timg.jpg', 'C136E2416AC81AEF483F227170DD0D50.jpg', 'magic4j/20200708/C136E2416AC81AEF483F227170DD0D50.jpg', 'http://ossfile.itgacl.com/magic4j/20200708/C136E2416AC81AEF483F227170DD0D50.jpg', 'jpg', 'oss', '27746', '0b8678480f5ee3129305d3ac511a0b06', null, '2020-07-08 16:35:40', '3', '2020-07-08 16:35:40', '3', '1');
INSERT INTO `sys_file` VALUES ('162', '0', 'wxPayQrCode.png', '0E4F6B6191CCD486B8C3A90DA9F260DA.png', '/home/magic4j/uploadFilesManager/0E4F6B6191CCD486B8C3A90DA9F260DA.png', 'http://file.itgacl.com/uploadFile/0E4F6B6191CCD486B8C3A90DA9F260DA.png', 'png', 'sftp', '31495', '497aceef43dfbe1d698b249521b2873b', null, '2020-07-08 16:57:35', '3', '2020-07-08 16:57:35', '3', '1');
INSERT INTO `sys_file` VALUES ('163', '0', 'timg.jpg', 'E14DE82E7B3DB333C9C40E9102023A57.jpg', '/home/magic4j/uploadFilesManager/E14DE82E7B3DB333C9C40E9102023A57.jpg', 'http://file.itgacl.com/uploadFile/E14DE82E7B3DB333C9C40E9102023A57.jpg', 'jpg', 'sftp', '27746', '0b8678480f5ee3129305d3ac511a0b06', null, '2020-07-08 16:57:35', '3', '2020-07-08 16:57:35', '3', '1');
INSERT INTO `sys_file` VALUES ('164', '0', '公众号注册7_20200227232837.png', '20FCBA94510C23E5FE14D90EB7249DCE.png', 'magic4j/20200708/20FCBA94510C23E5FE14D90EB7249DCE.png', 'http://ossfile.itgacl.com/magic4j/20200708/20FCBA94510C23E5FE14D90EB7249DCE.png', 'png', 'oss', '29559', '46e24ecf0ea6bede119da99532d2e803', null, '2020-07-08 16:57:56', '3', '2020-07-08 16:57:56', '3', '1');
INSERT INTO `sys_file` VALUES ('165', '0', '公众号注册5_20200227230405.png', '9460CC0B649323EF64E2BA66820127BD.png', 'magic4j/20200708/9460CC0B649323EF64E2BA66820127BD.png', 'http://ossfile.itgacl.com/magic4j/20200708/9460CC0B649323EF64E2BA66820127BD.png', 'png', 'oss', '28956', '90bc3c59a10cfb6544a59d9472ecd440', null, '2020-07-08 16:57:56', '3', '2020-07-08 16:57:56', '3', '1');
INSERT INTO `sys_file` VALUES ('166', '0', '公众号注册6_20200227230432.png', '5F8CF076890DE7CB37F600F59ACC5F63.png', 'magic4j/20200708/5F8CF076890DE7CB37F600F59ACC5F63.png', 'http://ossfile.itgacl.com/magic4j/20200708/5F8CF076890DE7CB37F600F59ACC5F63.png', 'png', 'oss', '19459', '2f3ccbdc016bb4f814e28ab5c905dbb0', null, '2020-07-08 16:57:56', '3', '2020-07-08 16:57:56', '3', '1');
INSERT INTO `sys_file` VALUES ('167', '0', '码出未来.jpg', 'F2782FE155FFB296F06B56B352B5FED3.jpg', 'magic4j/20200708/F2782FE155FFB296F06B56B352B5FED3.jpg', 'http://ossfile.itgacl.com/magic4j/20200708/F2782FE155FFB296F06B56B352B5FED3.jpg', 'jpg', 'oss', '13376', '8d2af682f979c23e0652ccb99a8bcb69', null, '2020-07-08 16:57:56', '3', '2020-07-08 16:57:56', '3', '1');
INSERT INTO `sys_file` VALUES ('168', '0', 'me_20200228004143.jpg', 'C7BB4363F9A53E976C118DFE00599B5F.jpg', 'C:/data/magic4j/uploadFilesManager/C7BB4363F9A53E976C118DFE00599B5F.jpg', 'http://127.0.0.1:8888/uploadFile/C7BB4363F9A53E976C118DFE00599B5F.jpg', '.jpg', 'local', '144807', 'c48255f88be8595af449fc6ec4bdf1c3', null, '2020-07-08 17:10:28', '3', '2020-07-08 17:10:28', '3', '1');
INSERT INTO `sys_file` VALUES ('169', '0', 'alipayQrCode.png', '9CE102DC7A9865313BD5B5921ADA1B46.png', 'C:/data/magic4j/uploadFilesManager/9CE102DC7A9865313BD5B5921ADA1B46.png', 'http://127.0.0.1:8888/uploadFile/9CE102DC7A9865313BD5B5921ADA1B46.png', '.png', 'local', '67918', '053d74e8bdd649e11d8168aa0733f866', null, '2020-07-08 17:10:28', '3', '2020-07-08 17:10:28', '3', '1');
INSERT INTO `sys_file` VALUES ('170', '0', '公众号注册2_20200227230018.png', '3543D4C09F79DBA564E870804FC07689.png', '/home/magic4j/uploadFilesManager/3543D4C09F79DBA564E870804FC07689.png', 'http://file.itgacl.com/uploadFile/3543D4C09F79DBA564E870804FC07689.png', 'png', 'sftp', '7685', '3cee5c9839da9b638dc88c164bc5200a', null, '2020-07-08 17:13:19', '3', '2020-07-08 17:13:19', '3', '1');
INSERT INTO `sys_file` VALUES ('171', '0', '公众号注册1_20200227225939.png', '3ACC60C134C1343A8CCE625F4657A771.png', '/home/magic4j/uploadFilesManager/3ACC60C134C1343A8CCE625F4657A771.png', 'http://file.itgacl.com/uploadFile/3ACC60C134C1343A8CCE625F4657A771.png', 'png', 'sftp', '19560', '28b03f3104fb079899a7cf8d2832f49c', null, '2020-07-08 17:13:19', '3', '2020-07-08 17:13:19', '3', '1');
INSERT INTO `sys_file` VALUES ('172', '0', 'wxPayQrCode.png', 'rBAACl8FjjeAebmwAAB7B5oUirc444.png', 'group1/M00/00/08/rBAACl8FjjeAebmwAAB7B5oUirc444.png', 'http://file.itgacl.com/group1/M00/00/08/rBAACl8FjjeAebmwAAB7B5oUirc444.png', 'png', 'fastdfs', '31495', '497aceef43dfbe1d698b249521b2873b', null, '2020-07-08 17:13:39', '3', '2020-07-08 17:13:39', '3', '1');
INSERT INTO `sys_file` VALUES ('173', '0', 'me_20200228004143.jpg', 'rBAACl8FjjeAC-5oAAI1pwHQmMo109.jpg', 'group1/M00/00/08/rBAACl8FjjeAC-5oAAI1pwHQmMo109.jpg', 'http://file.itgacl.com/group1/M00/00/08/rBAACl8FjjeAC-5oAAI1pwHQmMo109.jpg', 'jpg', 'fastdfs', '144807', 'c48255f88be8595af449fc6ec4bdf1c3', null, '2020-07-08 17:13:39', '3', '2020-07-08 17:13:39', '3', '1');
INSERT INTO `sys_file` VALUES ('174', '0', '公众号注册5_20200227230405.png', 'D6B475A5DDD3AB410DC5DDE454F1EA90.png', 'magic4j/20200708/D6B475A5DDD3AB410DC5DDE454F1EA90.png', 'http://ossfile.itgacl.com/magic4j/20200708/D6B475A5DDD3AB410DC5DDE454F1EA90.png', 'png', 'oss', '28956', '90bc3c59a10cfb6544a59d9472ecd440', null, '2020-07-08 17:13:56', '3', '2020-07-08 17:13:56', '3', '1');
INSERT INTO `sys_file` VALUES ('175', '0', '公众号注册6_20200227230432.png', 'DF9B75DFCD4FDD0498CF05CC75DB11D1.png', 'magic4j/20200708/DF9B75DFCD4FDD0498CF05CC75DB11D1.png', 'http://ossfile.itgacl.com/magic4j/20200708/DF9B75DFCD4FDD0498CF05CC75DB11D1.png', 'png', 'oss', '19459', '2f3ccbdc016bb4f814e28ab5c905dbb0', null, '2020-07-08 17:13:56', '3', '2020-07-08 17:13:56', '3', '1');
INSERT INTO `sys_file` VALUES ('176', '0', '微信支付二维码_20200229140946.jpg', '4C80A31AC3EA91DF7925C3063AC8FE65.jpg', 'magic4j/20200708/4C80A31AC3EA91DF7925C3063AC8FE65.jpg', 'http://cosfile.itgacl.com/magic4j/20200708/4C80A31AC3EA91DF7925C3063AC8FE65.jpg', 'jpg', 'cos', '108642', 'f547bc0dd476373219b37590703864e8', null, '2020-07-08 17:14:09', '3', '2020-07-08 17:14:09', '3', '1');
INSERT INTO `sys_file` VALUES ('177', '0', '支付宝收款码_20200229140523.jpg', '90F390AC136B82A0D64A373C93A06427.jpg', 'magic4j/20200708/90F390AC136B82A0D64A373C93A06427.jpg', 'http://cosfile.itgacl.com/magic4j/20200708/90F390AC136B82A0D64A373C93A06427.jpg', 'jpg', 'cos', '68826', '4a9068675db0f7284850494f4ee877a3', null, '2020-07-08 17:14:09', '3', '2020-07-08 17:14:09', '3', '1');
INSERT INTO `sys_file` VALUES ('178', '0', '公众号注册4_20200227230156.png', 'D4F45BA5D6ACAFAB3EB7BEF9C8F73275.png', 'magic4j/20200708/D4F45BA5D6ACAFAB3EB7BEF9C8F73275.png', 'http://kodofile.itgacl.com/magic4j/20200708/D4F45BA5D6ACAFAB3EB7BEF9C8F73275.png', 'png', 'kodo', '8493', '72945c1df541017f2bdd30d4f50e99e5', null, '2020-07-08 17:14:44', '3', '2020-07-08 17:14:44', '3', '1');
INSERT INTO `sys_file` VALUES ('179', '0', '公众号注册3_20200227230134.png', 'D8B2338E6FF0D15249AFBF0E87CC5A4C.png', 'magic4j/20200708/D8B2338E6FF0D15249AFBF0E87CC5A4C.png', 'http://kodofile.itgacl.com/magic4j/20200708/D8B2338E6FF0D15249AFBF0E87CC5A4C.png', 'png', 'kodo', '32200', 'b248199b0728d555285455e48b2bfb11', null, '2020-07-08 17:14:44', '3', '2020-07-08 17:14:44', '3', '1');
INSERT INTO `sys_file` VALUES ('180', '0', 'me_20200228004143.jpg', '8830FAE26D6BA47AA7A551102F562185.jpg', 'magic4j/20200709/8830FAE26D6BA47AA7A551102F562185.jpg', 'http://kodofile.itgacl.com/magic4j/20200709/8830FAE26D6BA47AA7A551102F562185.jpg', 'jpg', 'kodo', '144807', 'c48255f88be8595af449fc6ec4bdf1c3', null, '2020-07-09 11:36:51', '3', '2020-07-09 11:36:51', '3', '0');
INSERT INTO `sys_file` VALUES ('181', '0', 'timg.jpg', '733A1B3C008003AA1BFEB83DAE38E955.jpg', '/home/magic4j/uploadFilesManager/733A1B3C008003AA1BFEB83DAE38E955.jpg', 'http://file.itgacl.com/uploadFile/733A1B3C008003AA1BFEB83DAE38E955.jpg', 'jpg', 'sftp', '27746', '0b8678480f5ee3129305d3ac511a0b06', null, '2020-07-09 11:39:03', '3', '2020-07-09 11:39:03', '3', '0');
INSERT INTO `sys_file` VALUES ('182', null, 'gxys_20200904224651.jpg', '683C5613EA21BFBC4188BC4C36C1F2E4.jpg', 'C:/data/magic4j/uploadFilesManager/683C5613EA21BFBC4188BC4C36C1F2E4.jpg', 'http://127.0.0.1:8888/uploadFile/683C5613EA21BFBC4188BC4C36C1F2E4.jpg', '.jpg', 'local', '126287', 'ba3e8899c87a02a9d7bb025cb80b5795', null, '2020-09-12 15:31:54', '3', '2020-09-12 15:31:54', '3', '1');
INSERT INTO `sys_file` VALUES ('183', null, 'jl_20200904224756.jpg', '21B985E94D7A29682FE72E8DC2D1356D.jpg', 'C:/data/magic4j/uploadFilesManager/21B985E94D7A29682FE72E8DC2D1356D.jpg', 'http://127.0.0.1:8888/uploadFile/21B985E94D7A29682FE72E8DC2D1356D.jpg', 'jpg', 'local', '151388', '6acbd80b263d04a92a529389ba3a7bcc', null, '2020-09-12 15:57:22', '3', '2020-09-12 15:57:22', '3', '0');
INSERT INTO `sys_file` VALUES ('184', null, 'jl_20200904224745.jpg', 'F3716C7A6E06FAF36048684AE2503EB2.jpg', 'C:/data/magic4j/uploadFilesManager/F3716C7A6E06FAF36048684AE2503EB2.jpg', 'http://127.0.0.1:8888/uploadFile/F3716C7A6E06FAF36048684AE2503EB2.jpg', 'jpg', 'local', '129017', '2b4892696fcf3bd37dcdde104e67127e', null, '2020-09-12 15:57:22', '3', '2020-09-12 15:57:22', '3', '0');
INSERT INTO `sys_file` VALUES ('185', null, '产品工作流_20200921155516.png', 'B6490574EDE4347EFBC9C16C0EA2873B.png', 'C:/data/magic4j/uploadFilesManager/B6490574EDE4347EFBC9C16C0EA2873B.png', 'http://127.0.0.1:8888/uploadFile/B6490574EDE4347EFBC9C16C0EA2873B.png', 'png', 'local', '56714', '0e8cd7dd062085ae6887d297b5fb2850', null, '2020-11-04 16:05:51', '3', '2020-11-04 16:05:51', '3', '0');
INSERT INTO `sys_file` VALUES ('186', null, 'defaultHeadImg.jpg', '498702980FFEF9D6B8C9B7D5425C786A.jpg', 'C:/data/magic4j/uploadFilesManager/498702980FFEF9D6B8C9B7D5425C786A.jpg', 'http://127.0.0.1:8888/uploadFile/498702980FFEF9D6B8C9B7D5425C786A.jpg', 'jpg', 'local', '5023', 'c88c2d9991cb16e179c976024cd9c943', null, '2020-11-14 11:25:12', '3', '2020-11-14 11:25:12', '3', '0');

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
  `lng` decimal(10,7) DEFAULT NULL COMMENT '经度',
  `lat` decimal(10,7) DEFAULT NULL COMMENT '纬度',
  `handle_server_ip` varchar(20) DEFAULT NULL COMMENT '处理请求的服务器IP',
  `status` int(1) DEFAULT NULL COMMENT '执行结果：0成功，1：失败',
  `json_result` varchar(3000) DEFAULT NULL COMMENT '响应结果，json字符串',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=565 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '1', '38', null, null, null, null, null, null, null, '27.47.194.101', null, null, '广东省-广州市-天河区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('2', '1', '38', null, null, null, null, null, null, null, '27.47.194.101', null, null, '广东省-广州市-天河区', '113.2643600', '23.1290800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('3', '1', '37', null, null, null, null, null, null, null, '27.47.194.101', null, null, '广东省-广州市-天河区', '113.2643600', '23.1290800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('4', '1', '3', null, null, null, null, null, null, null, '27.47.194.101', null, null, '广东省-广州市-天河区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('5', '1', '32', null, null, null, null, null, null, null, '27.47.194.101', null, null, '广东省-广州市-天河区', '113.2643600', '23.1290800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('6', '1', '3', null, null, null, null, null, null, null, '27.47.194.101', null, null, '广东省-广州市-天河区', '113.2643600', '23.1290800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('7', '1', '32', null, null, null, null, null, null, null, '27.47.194.101', null, null, '广东省-广州市-天河区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('8', '1', '3', null, null, null, null, null, null, null, '27.47.194.101', null, null, '广东省-广州市-天河区', '113.2643600', '23.1290800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('9', '1', '3', null, null, null, null, null, null, null, '27.47.194.101', null, null, '广东省-广州市-天河区', '113.2643600', '23.1290800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('10', '1', '32', null, null, null, null, null, null, null, '27.47.194.101', null, null, '广东省-广州市-天河区', '113.2643600', '23.1290800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('11', '1', '32', null, null, null, null, null, null, null, '121.35.103.202', null, null, '广东省-深圳市-南山区', '113.9304100', '22.5333200', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('12', '1', '32', null, null, null, null, null, null, null, '183.129.166.254', null, null, '浙江省-杭州市-江干区', '120.2052300', '30.2572700', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('13', '1', '3', null, null, null, null, null, null, null, '27.47.194.127', null, null, '广东省-广州市-天河区', '113.3619900', '23.1246300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('14', '1', '38', null, null, null, null, null, null, null, '27.47.194.127', null, null, '广东省-广州市-天河区', '113.3619900', '23.1246300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('15', '1', '37', null, null, null, null, null, null, null, '27.47.194.127', null, null, '广东省-广州市-天河区', '113.3619900', '23.1246300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('16', '1', '32', null, null, null, null, null, null, null, '113.111.186.85', null, null, '广东省-广州市-海珠区', '113.3172000', '23.0833100', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('17', '1', '32', null, null, null, null, null, null, null, '27.47.194.127', null, null, '广东省-广州市-天河区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('18', '1', '32', null, null, null, null, null, null, null, '111.41.13.251', null, null, '黑龙江省-牡丹江市-绥芬河市', '131.1501200', '44.4132000', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('19', '1', '32', null, null, null, null, null, null, null, '122.4.247.100', null, null, '山东省-潍坊市-奎文区', '119.1327900', '36.7086400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('20', '1', '3', null, null, null, null, null, null, null, '27.47.194.196', null, null, '广东省-广州市-天河区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('21', '1', '32', null, null, null, null, null, null, null, '180.164.93.104', null, null, '上海市-上海市-浦东新区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('22', '1', '38', null, null, null, null, null, null, null, '101.224.34.243', null, null, '上海市-上海市-浦东新区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('23', '1', '32', null, null, null, null, null, null, null, '101.224.34.243', null, null, '上海市-上海市-浦东新区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('24', '1', '3', null, null, null, null, null, null, null, '27.47.193.35', null, null, '广东省-广州市-天河区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('25', '1', '32', null, null, null, null, null, null, null, '14.117.185.188', null, null, '广东省-江门市-鹤山市', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('26', '1', '32', null, null, null, null, null, null, null, '60.2.221.106', null, null, '河北省-唐山市-丰南区', '118.0850500', '39.5748700', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('27', '1', '38', null, null, null, null, null, null, null, '60.2.221.106', null, null, '河北省-唐山市-丰南区', '118.0850500', '39.5748700', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('28', '1', '32', null, null, null, null, null, null, null, '60.2.221.106', null, null, '河北省-唐山市-丰南区', '118.0850500', '39.5748700', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('29', '1', '32', null, null, null, null, null, null, null, '60.2.221.106', null, null, '河北省-唐山市-丰南区', '118.0850500', '39.5748700', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('30', '1', '32', null, null, null, null, null, null, null, '60.2.221.106', null, null, '河北省-唐山市-丰南区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('31', '1', '32', null, null, null, null, null, null, null, '118.81.54.205', null, null, '山西省-太原市-小店区', '112.5656600', '37.7360500', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('32', '1', '32', null, null, null, null, null, null, null, '118.81.54.205', null, null, '山西省-太原市-小店区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('33', '1', '32', null, null, null, null, null, null, null, '112.94.4.81', null, null, '广东省-广州市-天河区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('34', '1', '3', null, null, null, null, null, null, null, '27.47.192.23', null, null, '广东省-广州市-天河区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('35', '1', '32', null, null, null, null, null, null, null, '124.72.40.42', null, null, '福建省-福州市-鼓楼区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('36', '1', '38', null, null, null, null, null, null, null, '124.72.40.42', null, null, '福建省-福州市-鼓楼区', '119.2964700', '26.0742100', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('37', '1', '32', null, null, null, null, null, null, null, '124.72.40.42', null, null, '福建省-福州市-鼓楼区', '119.2964700', '26.0742100', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('38', '1', '32', null, null, null, null, null, null, null, '61.48.214.65', null, null, '北京市-北京市-石景山区', '116.2229900', '39.9056900', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('39', '1', '32', null, null, null, null, null, null, null, '182.124.71.90', null, null, '河南省-安阳市-龙安区', '114.3008900', '36.0760900', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('40', '1', '3', null, null, null, null, null, null, null, '112.94.117.49', null, null, '广东省-广州市-天河区', '113.4806700', '23.1813900', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('41', '1', '32', null, null, null, null, null, null, null, '182.87.112.30', null, null, '江西省-赣州市-章贡区', '114.9208500', '25.8175100', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('42', '1', '32', null, null, null, null, null, null, null, '112.94.119.66', null, null, '广东省-广州市-天河区', '113.2643600', '23.1290800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('43', '1', '32', null, null, null, null, null, null, null, '182.111.206.53', null, null, '江西省-赣州市-南康区', '114.9347600', '25.8310900', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('44', '1', '32', null, null, null, null, null, null, null, '120.11.33.40', null, null, '河北省-沧州市-河间市', '116.0990000', '38.4454800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('45', '1', '32', null, null, null, null, null, null, null, '116.230.88.87', null, null, '上海市-上海市-虹口区', '121.5260900', '31.2595600', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('46', '1', '32', null, null, null, null, null, null, null, '223.87.35.144', null, null, '四川省-成都市', '104.0647600', '30.5702000', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('47', '1', '38', null, null, null, null, null, null, null, '223.87.35.144', null, null, '四川省-成都市', '104.0647600', '30.5702000', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('48', '1', '37', null, null, null, null, null, null, null, '223.87.35.144', null, null, '四川省-成都市', '104.0647600', '30.5702000', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('49', '1', '32', null, null, null, null, null, null, null, '60.2.221.106', null, null, '河北省-唐山市-丰南区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('50', '1', '3', null, null, null, null, null, null, null, '27.47.130.123', null, null, '广东省-广州市-天河区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('51', '1', '3', null, null, null, null, null, null, null, '27.47.130.123', null, null, '广东省-广州市-天河区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('52', '1', '32', null, null, null, null, null, null, null, '58.250.203.150', null, null, '广东省-深圳市-南山区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('53', '1', '32', null, null, null, null, null, null, null, '112.95.74.186', null, null, '广东省-深圳市-南山区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('54', '1', '32', null, null, null, null, null, null, null, '180.91.178.74', null, null, '广东省-广州市', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('55', '1', '38', null, null, null, null, null, null, null, '180.91.178.74', null, null, '广东省-广州市', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('56', '1', '32', null, null, null, null, null, null, null, '171.41.56.225', null, null, '湖北省-黄冈市-黄梅县', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('57', '1', '32', null, null, null, null, null, null, null, '175.160.141.70', null, null, '辽宁省-沈阳市-和平区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('58', '1', '38', null, null, null, null, null, null, null, '124.72.41.61', null, null, '福建省-福州市-鼓楼区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('59', '1', '32', null, null, null, null, null, null, null, '124.72.41.61', null, null, '福建省-福州市-鼓楼区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('60', '1', '32', null, null, null, null, null, null, null, '101.87.69.171', null, null, '上海市-上海市-宝山区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('61', '1', '32', null, null, null, null, null, null, null, '124.72.41.61', null, null, '福建省-福州市-鼓楼区', '119.3040500', '26.0819800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('62', '1', '38', null, null, null, null, null, null, null, '124.72.41.61', null, null, '福建省-福州市-鼓楼区', '119.3040500', '26.0819800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('63', '1', '42', null, null, null, null, null, null, null, '124.72.41.61', null, null, '福建省-福州市-鼓楼区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('64', '1', '38', null, null, null, null, null, null, null, '124.72.41.61', null, null, '福建省-福州市-鼓楼区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('65', '1', '3', null, null, null, null, null, null, null, '219.232.72.63', null, null, '广西壮族自治区-', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('66', '1', '32', null, null, null, null, null, null, null, '115.60.145.93', null, null, '河南省-郑州市', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('67', '1', '3', null, null, null, null, null, null, null, '120.85.77.188', null, null, '广东省-广州市-天河区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('68', '1', '32', null, null, null, null, null, null, null, '119.123.164.117', null, null, '广东省-深圳市-宝安区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('69', '1', '32', null, null, null, null, null, null, null, '101.87.69.171', null, null, '上海市-上海市-宝山区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('70', '1', '32', null, null, null, null, null, null, null, '101.87.69.171', null, null, '上海市-上海市-宝山区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('71', '1', '38', null, null, null, null, null, null, null, '101.87.69.171', null, null, '上海市-上海市-宝山区', '121.4894100', '31.4052700', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('72', '1', '37', null, null, null, null, null, null, null, '101.87.69.171', null, null, '上海市-上海市-宝山区', '121.4894100', '31.4052700', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('73', '1', '32', null, null, null, null, null, null, null, '61.162.193.26', null, null, '山东省-东营市-河口区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('74', '1', '32', null, null, null, null, null, null, null, '112.94.212.65', null, null, '广东省-广州市-天河区', '113.3619900', '23.1246300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('75', '1', '32', null, null, null, null, null, null, null, '14.25.34.202', null, null, '广东省-', '113.2662700', '23.1317100', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('76', '1', '32', null, null, null, null, null, null, null, '14.25.34.202', null, null, '广东省-', '113.2662700', '23.1317100', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('77', '1', '32', null, null, null, null, null, null, null, '112.94.212.65', null, null, '广东省-广州市-天河区', '113.3619900', '23.1246300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('78', '1', '32', null, null, null, null, null, null, null, '122.96.45.64', null, null, '江苏省-', '118.7629500', '32.0607100', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('79', '1', '32', null, null, null, null, null, null, null, '47.75.114.62', null, null, '上海市-上海市-普陀区', '114.1654600', '22.2753400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('80', '1', '32', null, null, null, null, null, null, null, '43.243.12.78', null, null, '北京市-北京市-朝阳区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('81', '1', '38', null, null, null, null, null, null, null, '43.243.12.78', null, null, '北京市-北京市-朝阳区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('82', '1', '32', null, null, null, null, null, null, null, '47.75.114.62', null, null, '上海市-上海市-普陀区', '114.1654600', '22.2753400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('83', '1', '32', null, null, null, null, null, null, null, '47.75.114.62', null, null, '上海市-上海市-普陀区', '114.1654600', '22.2753400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('84', '1', '32', null, null, null, null, null, null, null, '47.75.114.62', null, null, '上海市-上海市-普陀区', '114.1654600', '22.2753400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('85', '1', '32', null, null, null, null, null, null, null, '47.75.114.62', null, null, '上海市-上海市-普陀区', '114.1654600', '22.2753400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('86', '1', '32', null, null, null, null, null, null, null, '139.205.62.19', null, null, '四川省-德阳市-中江县', '104.6787200', '31.0330400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('87', '1', '32', null, null, null, null, null, null, null, '117.181.135.12', null, null, '广西壮族自治区-河池市-金城江区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('88', '1', '38', null, null, null, null, null, null, null, '117.181.135.12', null, null, '广西壮族自治区-河池市-金城江区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('89', '1', '32', null, null, null, null, null, null, null, '1.80.199.8', null, null, '陕西省-西安市', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('90', '1', '3', null, null, null, null, null, null, null, '27.47.130.195', null, null, '广东省-广州市', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('91', '1', '44', null, null, null, null, null, null, null, '47.75.114.62', null, null, '香港特别行政区-香港特别行政区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('92', '1', '44', null, null, null, null, null, null, null, '47.75.114.62', null, null, '香港特别行政区-香港特别行政区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('93', '1', '32', null, null, null, null, null, null, null, '117.60.187.209', null, null, '江苏省-苏州市-吴江区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('94', '1', '38', null, null, null, null, null, null, null, '117.60.187.209', null, null, '江苏省-苏州市-吴江区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('95', '1', '32', null, null, null, null, null, null, null, '117.60.187.209', null, null, '江苏省-苏州市-吴江区', '120.6451700', '31.1391400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('96', '1', '32', null, null, null, null, null, null, null, '117.60.187.209', null, null, '江苏省-苏州市-吴江区', '120.6451700', '31.1391400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('97', '1', '3', null, null, null, null, null, null, null, '112.94.212.13', null, null, '广东省-广州市-天河区', '113.2643600', '23.1290800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('98', '1', '32', null, null, null, null, null, null, null, '139.205.56.241', null, null, '四川省-德阳市-中江县', '104.6787200', '31.0330400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('99', '1', '32', null, null, null, null, null, null, null, '114.244.36.138', null, null, '北京市-北京市-海淀区', '116.2984500', '39.9593300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('100', '1', '32', null, null, null, null, null, null, null, '114.244.36.138', null, null, '北京市-北京市-海淀区', '116.2984500', '39.9593300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('101', '1', '32', null, null, null, null, null, null, null, '180.139.210.221', null, null, '广西壮族自治区-南宁市-青秀区', '108.3669000', '22.8167300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('102', '1', '32', null, null, null, null, null, null, null, '117.173.131.245', null, null, '四川省-成都市', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('103', '1', '32', null, null, null, null, null, null, null, '47.75.114.62', null, null, '香港特别行政区-香港特别行政区', '114.1654600', '22.2753400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('104', '1', '32', null, null, null, null, null, null, null, '47.75.114.62', null, null, '香港特别行政区-香港特别行政区', '114.1654600', '22.2753400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('105', '1', '32', null, null, null, null, null, null, null, '47.75.114.62', null, null, '香港特别行政区-香港特别行政区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('106', '1', '32', null, null, null, null, null, null, null, '47.75.114.62', null, null, '香港特别行政区-香港特别行政区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('107', '1', '3', null, null, null, null, null, null, null, '27.47.195.18', null, null, '广东省-广州市-天河区', '113.3619900', '23.1246300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('108', '1', '32', null, null, null, null, null, null, null, '47.75.114.62', null, null, '香港特别行政区-香港特别行政区', '114.1654600', '22.2753400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('109', '1', '32', null, null, null, null, null, null, null, '116.90.82.28', null, null, '北京市-北京市-朝阳区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('110', '1', '38', null, null, null, null, null, null, null, '116.90.82.28', null, null, '北京市-北京市-朝阳区', '116.4435500', '39.9219000', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('111', '1', '32', null, null, null, null, null, null, null, '117.173.134.190', null, null, '四川省-成都市', '104.0647600', '30.5702000', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('112', '1', '32', null, null, null, null, null, null, null, '220.198.244.107', null, null, '广东省-广州市', '113.3619900', '23.1246300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('113', '1', '32', null, null, null, null, null, null, null, '119.136.20.174', null, null, '广东省-深圳市-坪山区', '114.3463200', '22.6908400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('114', '1', '48', null, null, null, null, null, null, null, '119.136.20.174', null, null, '广东省-深圳市-坪山区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('115', '1', '48', null, null, null, null, null, null, null, '119.136.20.174', null, null, '广东省-深圳市-坪山区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('116', '1', '32', null, null, null, null, null, null, null, '119.136.20.174', null, null, '广东省-深圳市-坪山区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('117', '1', '49', null, null, null, null, null, null, null, '119.136.20.174', null, null, '广东省-深圳市-坪山区', '114.3463200', '22.6908400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('118', '1', '49', null, null, null, null, null, null, null, '119.136.20.174', null, null, '广东省-深圳市-坪山区', '114.3463200', '22.6908400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('119', '1', '32', null, null, null, null, null, null, null, '113.102.167.233', null, null, '广东省-深圳市-龙岗区', '114.2477900', '22.7199100', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('120', '1', '38', null, null, null, null, null, null, null, '113.102.167.233', null, null, '广东省-深圳市-龙岗区', '114.2477900', '22.7199100', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('121', '1', '37', null, null, null, null, null, null, null, '113.102.167.233', null, null, '广东省-深圳市-龙岗区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('122', '1', '32', null, null, null, null, null, null, null, '113.102.167.233', null, null, '广东省-深圳市-龙岗区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('123', '1', '32', null, null, null, null, null, null, null, '113.102.167.233', null, null, '广东省-深圳市-龙岗区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('124', '1', '32', null, null, null, null, null, null, null, '222.244.131.183', null, null, '湖南省-长沙市-浏阳市', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('125', '1', '32', null, null, null, null, null, null, null, '58.22.113.1', null, null, '-', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('126', '1', '32', null, null, null, null, null, null, null, '58.22.113.1', null, null, '福建省-', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('127', '1', '32', null, null, null, null, null, null, null, '58.22.113.1', null, null, '福建省-', '119.2964700', '26.0742100', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('128', '1', '38', null, null, null, null, null, null, null, '58.22.113.1', null, null, '福建省-', '119.2964700', '26.0742100', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('129', '1', '55', null, null, null, null, null, null, null, '58.22.113.1', null, null, '福建省-', '119.2964700', '26.0742100', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('130', '1', '32', null, null, null, null, null, null, null, '182.124.180.29', null, null, '河南省-安阳市', '114.3931000', '36.0977100', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('131', '1', '32', null, null, null, null, null, null, null, '223.87.243.158', null, null, '四川省-成都市', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('132', '1', '32', null, null, null, null, null, null, null, '171.15.166.70', null, null, '河南省-郑州市-管城回族区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('133', '1', '38', null, null, null, null, null, null, null, '171.15.166.70', null, null, '河南省-郑州市-管城回族区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('134', '1', '37', null, null, null, null, null, null, null, '171.15.166.70', null, null, '河南省-郑州市-管城回族区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('135', '1', '32', null, null, null, null, null, null, null, '171.15.166.70', null, null, '河南省-郑州市-管城回族区', '113.6773900', '34.7538100', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('136', '1', '3', null, null, null, null, null, null, null, '219.232.72.81', null, null, '广西壮族自治区-', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('137', '1', '32', null, null, null, null, null, null, null, '113.250.228.95', null, null, '重庆市-重庆市-南岸区', '106.5625600', '29.5216800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('138', '1', '56', null, null, null, null, null, null, null, '113.250.228.95', null, null, '重庆市-重庆市-南岸区', '106.5625600', '29.5216800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('139', '1', '32', null, null, null, null, null, null, null, '111.162.202.146', null, null, '天津市-天津市-武清区', '117.0443000', '39.3840800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('140', '1', '32', null, null, null, null, null, null, null, '114.244.36.138', null, null, '北京市-北京市-海淀区', '116.2984500', '39.9593300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('141', '1', '32', null, null, null, null, null, null, null, '115.238.84.250', null, null, '浙江省-杭州市-滨江区', '120.2120100', '30.2084000', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('142', '1', '32', null, null, null, null, null, null, null, '114.244.36.138', null, null, '北京市-北京市-海淀区', '116.2984500', '39.9593300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('143', '1', '38', null, null, null, null, null, null, null, '60.247.27.129', null, null, '北京市-北京市-大兴区', '116.3415900', '39.7268400', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('144', '1', '32', null, null, null, null, null, null, null, '114.244.36.138', null, null, '北京市-北京市-海淀区', '116.2984500', '39.9593300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('145', '1', '32', null, null, null, null, null, null, null, '112.94.119.175', null, null, '广东省-广州市-天河区', '113.3619900', '23.1246300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('146', '1', '32', null, null, null, null, null, null, null, '114.244.36.138', null, null, '北京市-北京市-海淀区', '116.2984500', '39.9593300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('147', '1', '3', null, null, null, null, null, null, null, '112.94.119.175', null, null, '广东省-广州市-天河区', '113.3619900', '23.1246300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('148', '1', '32', null, null, null, null, null, null, null, '221.221.139.14', null, null, '北京市-北京市-通州区', null, null, null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('149', '1', '32', null, null, null, null, null, null, null, '112.94.212.241', null, null, '广东省-广州市', '113.2643600', '23.1290800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('150', '1', '32', null, null, null, null, null, null, null, '221.221.139.14', null, null, '北京市-北京市-通州区', '116.6571400', '39.9099800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('151', '1', '32', null, null, null, null, null, null, null, '221.221.139.14', null, null, '北京市-北京市-通州区', '116.6571400', '39.9099800', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('152', '1', '32', null, null, null, null, null, null, null, '111.121.72.6', null, null, '贵州省-贵阳市-观山湖区', '106.6225400', '26.6015000', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('153', '1', '32', null, null, null, null, null, null, null, '114.244.36.138', null, null, '北京市-北京市-海淀区', '116.2984500', '39.9593300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('154', '1', '32', null, null, null, null, null, null, null, '171.107.69.12', null, null, '广西壮族自治区-河池市-金城江区', '108.0371900', '24.6898300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('155', '1', '32', null, null, null, null, null, null, null, '112.94.118.200', null, null, '广东省-广州市-天河区', '113.3619900', '23.1246300', null, null, null, null, null, '0');
INSERT INTO `sys_log` VALUES ('314', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiJiZDQzZjAyNC0yYjk2LTQ4YjMtODk2OS0wYWI2YzM1MGIzOWQiLCJpYXQiOjE1OTQwMDM4MzMsImV4cCI6MTU5NDYwODYzM30.lgjffqwahWqylJp9K3aG8Uoydj-ymQbgNV9SGKi1EEIh16VbXQy-iNMi4f0UNq56NnPBynIB3OiTElAjA85Xiw\"}', '566', null, null, null, null, null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiJmNWIzZGIyOC1iMmQzLTQzMDAtYmVmNC0xNzhmYWFhN2UyYWQiLCJpYXQiOjE1OTQxMDMyNzgsImV4cCI6MTU5NDcwODA3OH0.CsmCZleDpUSMhrWyZ38ggIgjtOqAbf2Kba7Jm7g3Ru8KMbewE1PKNWH4qOdStcOs8X9Qgha-7AZ9L-H98qotZQ\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNTk0MTAzMjc4LCJleHAiOjE1OTQxMTIyNzh9.DLh0Pa5raPVxh-to_hogUG1KTSpOpB6TUTn0UDpu4ChENB0HsVd27eb0NdbPMBbODoxlPcqCgMORKdPwCyrozw\",\"type\":\"Authorization\"},\"msg\":\"\"}', '刷新jwt验证Token', '2020-07-07 14:27:59', '0');
INSERT INTO `sys_log` VALUES ('315', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"WShHiMnMw0lv6w/trpFQeV1qifQxcz9+UM8zIYIux7UJ7GK+W3/2tQ/znnLoNk8sLDsCZ2oCQgiqQ23xipwcIbzP8sw7VxROlGJAxaqhnK8vFymqDhtwdcoRWVn5j+s90po+hh27Px8+Hhsxm8kDrIqAbx9JyE07SxXeafVxR5E=\",\"captcha\":\"nt71\",\"uuid\":\"efba3a2f-67b1-4ca9-af75-123b0dd6f2dd\",\"username\":\"magic4j\"}', '553', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-07-07 17:45:41', '0');
INSERT INTO `sys_log` VALUES ('316', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiJjNjM1ZmRkZS1kY2Y0LTQ5ZDktOGQyOS0zOTBjNzI0YzEzYzgiLCJpYXQiOjE1OTQxMTUxNDAsImV4cCI6MTU5NDcxOTk0MH0.gg525Z7-M_-apd2MyI-BbfOfRXBV5TZeZkzJxTTOIbGYjs47bE-PqoXzTSPJ7uNq4OBeYWL28PUfVg_UxyoOTA\"}', '341', null, null, null, null, null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI4ZWUxZGMyMC04MGVkLTQxZDctYmZkYi1kYzExNmIzN2NlYmYiLCJpYXQiOjE1OTQxMjQ3NzksImV4cCI6MTU5NDcyOTU3OX0.zTfefTmxLql3t_3W5BZosH5LyUfFHZW4PTnUlVPP-Cw1Qp0Y0QtiOz5Hpp8tZN17GFlGk_x6jBUtIkB_YM-hGg\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNTk0MTI0Nzc5LCJleHAiOjE1OTQxMzM3Nzl9.Lyte3gBa5PyejTg3S8EVJGpKc0LkCdLFmJRAgaDdsUBpxFYQeQCZ3NvEWYOfOct8Hn0ucYAz643Fw3bg-HAuPA\",\"type\":\"Authorization\"},\"msg\":\"\"}', '刷新jwt验证Token', '2020-07-07 20:26:20', null);
INSERT INTO `sys_log` VALUES ('317', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"crIBU+hVSNIthHUQNoRF4KALH/ti3MVbTa6Beu9JQ9AA/+vJ978EhCqlToE/NWR/NSTrFhnRR+foenaGWNd4ERDCFI0aBmuANHGd/bap/XtOsxcyYoemnEvbx8LL91Flil00sjTK5ATinW884NJRRe64zYeIo8OZegp2VEkVVdM=\",\"captcha\":\"rw7v\",\"uuid\":\"65dacee1-922f-4b8f-bc7b-ab30b054e2d2\",\"username\":\"magic4j\"}', '25515', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-07-07 23:36:33', '0');
INSERT INTO `sys_log` VALUES ('318', '0', '3', 'magic4j[孤傲苍狼]', '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '1', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '系统用户退出登录', '2020-07-07 23:37:16', '0');
INSERT INTO `sys_log` VALUES ('319', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"IilooxfGo64UvW6Oy/9clHSWTDW87xPP0M3ePExT+PmQlRMd3bZPrIURKeMX0XFw9UiMAC5sxCWeBs4MsT9aSB646bW81tzLrrYVB4elwPbWwYQ0FEQ+7QcNMmfw4y2MpTEV/KMPXChEGUn8q//1vgdp2rFMktxvI3bFLzhnoyc=\",\"captcha\":\"xpln\",\"uuid\":\"2a295a3f-5ca6-4b70-970a-ea75b3220d49\",\"username\":\"magic4j\"}', '120', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-07-07 23:37:55', '0');
INSERT INTO `sys_log` VALUES ('320', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiIyNDEzNmU4Zi0xODQ2LTQ5YWYtOGU3OC04NDhjNmNhNDRjMTAiLCJpYXQiOjE1OTQxMzYyNzQsImV4cCI6MTU5NDc0MTA3NH0.YFbbIFdv2gXfm1YJHIPh5KK0cijSAbeml_Sx33ZxkyXG2CUNt9RWpP3GVYyBKHFUsUc2KR23MQbS-7NQO5w5Rw\"}', '224', null, null, null, null, null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI5YzZhYzI4Zi00NDQ1LTQ3ZDgtYWQwMS0yMmUwZDMxNWFiNWQiLCJpYXQiOjE1OTQxNjUxMDMsImV4cCI6MTU5NDc2OTkwM30.NA8P88JVIVs68CaRTSSE380daYXKZVjZbfeyfe-dC3ENZYUPuhqvRv4vm6aoIAjKhAuP-uTpqL1mKN8EOGfnDQ\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNTk0MTY1MTAzLCJleHAiOjE1OTQxNzQxMDN9.Fba0gCVYtHj5VxhbXExqKa1krrJW0ihX5ErFjLx2F2-8nD2TgU-zWQ7vcoxXBuq1r7yV3KYzVf5Np_xuJMdRuQ\",\"type\":\"Authorization\"},\"msg\":\"\"}', '刷新jwt验证Token', '2020-07-08 07:38:24', null);
INSERT INTO `sys_log` VALUES ('321', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"KdDykMojjC4LKfvholFED3Fl0XrfIDNinuZ92JuwjwE5+ySy2l0VkMnUnkhb0hmO9uETgn0FAWnVQVJ31GCGT10u0/cxNBRO6iQ4WC9hWzZoIOtu2da6asgkAbI2Bq6nT1KvzrbNIQM+D1O8cQ8zqhPWirwues0JgX1qcFYFBYY=\",\"captcha\":\"xy99\",\"uuid\":\"8f373ad6-cb50-4eb2-82a5-7b5a4cb41e0d\",\"username\":\"magic4j\"}', '304', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-07-08 11:20:09', '0');
INSERT INTO `sys_log` VALUES ('322', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"fastdfs\"}', '49', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 11:20:24', '0');
INSERT INTO `sys_log` VALUES ('323', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '374', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"fileLength\":144807,\"fileMd5\":\"c48255f88be8595af449fc6ec4bdf1c3\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://file.itgacl.com/group1/M00/00/08/rBAACl8FPKiAOGDuAAI1pwHQmMo653.jpg\",\"newFileName\":\"rBAACl8FPKiAOGDuAAI1pwHQmMo653.jpg\",\"originalFileName\":\"me_20200228004143.jpg\",\"savePath\":\"group1/M00/00/08/rBAACl8FPKiAOGDuAAI1pwHQmMo653.jpg\",\"storageType\":\"fastdfs\",\"uploadSuccess\":true,\"useTime\":104},\"msg\":\"\"}', '上传文件', '2020-07-08 11:25:40', '0');
INSERT INTO `sys_log` VALUES ('324', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '71', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"fileLength\":13376,\"fileMd5\":\"8d2af682f979c23e0652ccb99a8bcb69\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://file.itgacl.com/group1/M00/00/08/rBAACl8FPL-AIZTFAAA0QPSWMD4263.jpg\",\"newFileName\":\"rBAACl8FPL-AIZTFAAA0QPSWMD4263.jpg\",\"originalFileName\":\"码出未来.jpg\",\"savePath\":\"group1/M00/00/08/rBAACl8FPL-AIZTFAAA0QPSWMD4263.jpg\",\"storageType\":\"fastdfs\",\"uploadSuccess\":true,\"useTime\":19},\"msg\":\"\"}', '上传文件', '2020-07-08 11:26:03', '0');
INSERT INTO `sys_log` VALUES ('325', '0', '3', 'magic4j[孤傲苍狼]', '系统配置', '平台设置', 'com.itgacl.magic4j.modules.sys.controller.SysConfigController', 'platformSetting', '{\"systemName\":\"magic4j开发平台\",\"systemLogo\":\"http://file.itgacl.com/group1/M00/00/08/rBAACl8FPL-AIZTFAAA0QPSWMD4263.jpg\"}', '55', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '保存平台设置', '2020-07-08 11:26:03', '0');
INSERT INTO `sys_log` VALUES ('326', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"GidX+XErMVbLCBDjbPXkdTN+NkQKdJjIp0CCSDtcyJRE5JBSbsd7bR7YZfCrxhBtg0YpEtpxwvCbzll70vQ2/Usny2q//JTL56yBoe9YPC2/IivbbopCr7fArT6BXr48MtyJlB0vqkHCmiT2hDd2Hq8v8xAZ0jLkE4OPM0NM57k=\",\"captcha\":\"736d\",\"uuid\":\"0c8ae900-59c4-4b98-9e64-b4df63d240e4\",\"username\":\"magic4j\"}', '277', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-07-08 15:31:04', '0');
INSERT INTO `sys_log` VALUES ('327', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"oss\"}', '50', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 15:31:53', '0');
INSERT INTO `sys_log` VALUES ('328', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '1536', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"fileLength\":144807,\"fileMd5\":\"c48255f88be8595af449fc6ec4bdf1c3\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://ossfile.itgacl.com/magic4j/20200708/1D08A2218121499937DF459CED9EB30F.jpg\",\"newFileName\":\"1D08A2218121499937DF459CED9EB30F.jpg\",\"originalFileName\":\"me_20200228004143.jpg\",\"savePath\":\"magic4j/20200708/1D08A2218121499937DF459CED9EB30F.jpg\",\"storageType\":\"oss\",\"uploadSuccess\":true,\"useTime\":1326},\"msg\":\"\"}', '上传文件', '2020-07-08 16:15:38', '0');
INSERT INTO `sys_log` VALUES ('329', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'delete', '{\"ids\":[156]}', '95', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '根据ID删除文件', '2020-07-08 16:16:01', '0');
INSERT INTO `sys_log` VALUES ('330', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'delete', '{\"ids\":[155,154]}', '51', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '根据ID删除文件', '2020-07-08 16:16:06', '0');
INSERT INTO `sys_log` VALUES ('331', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"sftp\"}', '71', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 16:24:54', '0');
INSERT INTO `sys_log` VALUES ('332', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '1105', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"list\":[{\"fileLength\":144807,\"fileMd5\":\"c48255f88be8595af449fc6ec4bdf1c3\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://file.itgacl.com/uploadFile/A2F3CA849C6A3E9718AD07A560772EE8.jpg\",\"newFileName\":\"A2F3CA849C6A3E9718AD07A560772EE8.jpg\",\"originalFileName\":\"me_20200228004143.jpg\",\"savePath\":\"/home/magic4j/uploadFilesManager/A2F3CA849C6A3E9718AD07A560772EE8.jpg\",\"storageType\":\"sftp\",\"uploadSuccess\":true,\"useTime\":714},{\"fileLength\":27746,\"fileMd5\":\"0b8678480f5ee3129305d3ac511a0b06\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://file.itgacl.com/uploadFile/CF2E1F3DA43E6E3863A02BB3C9F376FC.jpg\",\"newFileName\":\"CF2E1F3DA43E6E3863A02BB3C9F376FC.jpg\",\"originalFileName\":\"timg.jpg\",\"savePath\":\"/home/magic4j/uploadFilesManager/CF2E1F3DA43E6E3863A02BB3C9F376FC.jpg\",\"storageType\":\"sftp\",\"uploadSuccess\":true,\"useTime\":27}]},\"msg\":\"\"}', '上传文件', '2020-07-08 16:25:15', '0');
INSERT INTO `sys_log` VALUES ('333', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"oss\"}', '77', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 16:35:29', '0');
INSERT INTO `sys_log` VALUES ('334', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '721', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"list\":[{\"fileLength\":26805,\"fileMd5\":\"8ac1adb1b07b33049cc24a5896f6c8da\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://ossfile.itgacl.com/magic4j/20200708/4BECF463BEAC3A71B3812F0586296810.jpg\",\"newFileName\":\"4BECF463BEAC3A71B3812F0586296810.jpg\",\"originalFileName\":\"qrcode_for_gh_c20cbc16be76_258.jpg\",\"savePath\":\"magic4j/20200708/4BECF463BEAC3A71B3812F0586296810.jpg\",\"storageType\":\"oss\",\"uploadSuccess\":true,\"useTime\":376},{\"fileLength\":31495,\"fileMd5\":\"497aceef43dfbe1d698b249521b2873b\",\"fileSuffix\":\"png\",\"fileUrl\":\"http://ossfile.itgacl.com/magic4j/20200708/D95B93B7150BCF7CA4FCD93E0CF51443.png\",\"newFileName\":\"D95B93B7150BCF7CA4FCD93E0CF51443.png\",\"originalFileName\":\"wxPayQrCode.png\",\"savePath\":\"magic4j/20200708/D95B93B7150BCF7CA4FCD93E0CF51443.png\",\"storageType\":\"oss\",\"uploadSuccess\":true,\"useTime\":111},{\"fileLength\":27746,\"fileMd5\":\"0b8678480f5ee3129305d3ac511a0b06\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://ossfile.itgacl.com/magic4j/20200708/C136E2416AC81AEF483F227170DD0D50.jpg\",\"newFileName\":\"C136E2416AC81AEF483F227170DD0D50.jpg\",\"originalFileName\":\"timg.jpg\",\"savePath\":\"magic4j/20200708/C136E2416AC81AEF483F227170DD0D50.jpg\",\"storageType\":\"oss\",\"uploadSuccess\":true,\"useTime\":82}]},\"msg\":\"\"}', '上传文件', '2020-07-08 16:35:41', '0');
INSERT INTO `sys_log` VALUES ('335', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'delete', '{\"ids\":[159,160,161,157,158]}', '89', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '根据ID删除文件', '2020-07-08 16:57:21', '0');
INSERT INTO `sys_log` VALUES ('336', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"sftp\"}', '51', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 16:57:28', '0');
INSERT INTO `sys_log` VALUES ('337', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '543', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"list\":[{\"fileLength\":31495,\"fileMd5\":\"497aceef43dfbe1d698b249521b2873b\",\"fileSuffix\":\"png\",\"fileUrl\":\"http://file.itgacl.com/uploadFile/0E4F6B6191CCD486B8C3A90DA9F260DA.png\",\"newFileName\":\"0E4F6B6191CCD486B8C3A90DA9F260DA.png\",\"originalFileName\":\"wxPayQrCode.png\",\"savePath\":\"/home/magic4j/uploadFilesManager/0E4F6B6191CCD486B8C3A90DA9F260DA.png\",\"storageType\":\"sftp\",\"uploadSuccess\":true,\"useTime\":249},{\"fileLength\":27746,\"fileMd5\":\"0b8678480f5ee3129305d3ac511a0b06\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://file.itgacl.com/uploadFile/E14DE82E7B3DB333C9C40E9102023A57.jpg\",\"newFileName\":\"E14DE82E7B3DB333C9C40E9102023A57.jpg\",\"originalFileName\":\"timg.jpg\",\"savePath\":\"/home/magic4j/uploadFilesManager/E14DE82E7B3DB333C9C40E9102023A57.jpg\",\"storageType\":\"sftp\",\"uploadSuccess\":true,\"useTime\":28}]},\"msg\":\"\"}', '上传文件', '2020-07-08 16:57:35', '0');
INSERT INTO `sys_log` VALUES ('338', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"oss\"}', '46', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 16:57:47', '0');
INSERT INTO `sys_log` VALUES ('339', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '534', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"list\":[{\"fileLength\":29559,\"fileMd5\":\"46e24ecf0ea6bede119da99532d2e803\",\"fileSuffix\":\"png\",\"fileUrl\":\"http://ossfile.itgacl.com/magic4j/20200708/20FCBA94510C23E5FE14D90EB7249DCE.png\",\"newFileName\":\"20FCBA94510C23E5FE14D90EB7249DCE.png\",\"originalFileName\":\"公众号注册7_20200227232837.png\",\"savePath\":\"magic4j/20200708/20FCBA94510C23E5FE14D90EB7249DCE.png\",\"storageType\":\"oss\",\"uploadSuccess\":true,\"useTime\":165},{\"fileLength\":28956,\"fileMd5\":\"90bc3c59a10cfb6544a59d9472ecd440\",\"fileSuffix\":\"png\",\"fileUrl\":\"http://ossfile.itgacl.com/magic4j/20200708/9460CC0B649323EF64E2BA66820127BD.png\",\"newFileName\":\"9460CC0B649323EF64E2BA66820127BD.png\",\"originalFileName\":\"公众号注册5_20200227230405.png\",\"savePath\":\"magic4j/20200708/9460CC0B649323EF64E2BA66820127BD.png\",\"storageType\":\"oss\",\"uploadSuccess\":true,\"useTime\":92},{\"fileLength\":19459,\"fileMd5\":\"2f3ccbdc016bb4f814e28ab5c905dbb0\",\"fileSuffix\":\"png\",\"fileUrl\":\"http://ossfile.itgacl.com/magic4j/20200708/5F8CF076890DE7CB37F600F59ACC5F63.png\",\"newFileName\":\"5F8CF076890DE7CB37F600F59ACC5F63.png\",\"originalFileName\":\"公众号注册6_20200227230432.png\",\"savePath\":\"magic4j/20200708/5F8CF076890DE7CB37F600F59ACC5F63.png\",\"storageType\":\"oss\",\"uploadSuccess\":true,\"useTime\":76},{\"fileLength\":13376,\"fileMd5\":\"8d2af682f979c23e0652ccb99a8bcb69\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://ossfile.itgacl.com/magic4j/20200708/F2782FE155FFB296F06B56B352B5FED3.jpg\",\"newFileName\":\"F2782FE155FFB296F06B56B352B5FED3.jpg\",\"originalFileName\":\"码出未来.jpg\",\"savePath\":\"magic4j/20200708/F2782FE155FFB296F06B56B352B5FED3.jpg\",\"storageType\":\"oss\",\"uploadSuccess\":true,\"useTime\":94}]},\"msg\":\"\"}', '上传文件', '2020-07-08 16:57:57', '0');
INSERT INTO `sys_log` VALUES ('340', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"fastdfs\"}', '43', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 16:58:08', '0');
INSERT INTO `sys_log` VALUES ('341', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"sftp\"}', '167', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 17:09:05', '0');
INSERT INTO `sys_log` VALUES ('342', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"oss\"}', '46', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 17:09:15', '0');
INSERT INTO `sys_log` VALUES ('343', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"cos\"}', '47', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 17:09:37', '0');
INSERT INTO `sys_log` VALUES ('344', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"kodo\"}', '46', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 17:09:48', '0');
INSERT INTO `sys_log` VALUES ('345', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'delete', '{\"ids\":[164,165,166,167,162,163]}', '56', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '根据ID删除文件', '2020-07-08 17:10:01', '0');
INSERT INTO `sys_log` VALUES ('346', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"local\"}', '44', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 17:10:22', '0');
INSERT INTO `sys_log` VALUES ('347', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '194', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"list\":[{\"fileLength\":144807,\"fileMd5\":\"c48255f88be8595af449fc6ec4bdf1c3\",\"fileSuffix\":\".jpg\",\"fileUrl\":\"http://127.0.0.1:8888/uploadFile/C7BB4363F9A53E976C118DFE00599B5F.jpg\",\"newFileName\":\"C7BB4363F9A53E976C118DFE00599B5F.jpg\",\"originalFileName\":\"me_20200228004143.jpg\",\"savePath\":\"C:/data/magic4j/uploadFilesManager/C7BB4363F9A53E976C118DFE00599B5F.jpg\",\"storageType\":\"local\",\"uploadSuccess\":true,\"useTime\":47},{\"fileLength\":67918,\"fileMd5\":\"053d74e8bdd649e11d8168aa0733f866\",\"fileSuffix\":\".png\",\"fileUrl\":\"http://127.0.0.1:8888/uploadFile/9CE102DC7A9865313BD5B5921ADA1B46.png\",\"newFileName\":\"9CE102DC7A9865313BD5B5921ADA1B46.png\",\"originalFileName\":\"alipayQrCode.png\",\"savePath\":\"C:/data/magic4j/uploadFilesManager/9CE102DC7A9865313BD5B5921ADA1B46.png\",\"storageType\":\"local\",\"uploadSuccess\":true,\"useTime\":1}]},\"msg\":\"\"}', '上传文件', '2020-07-08 17:10:28', '0');
INSERT INTO `sys_log` VALUES ('348', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"sftp\"}', '82', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 17:13:11', '0');
INSERT INTO `sys_log` VALUES ('349', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '892', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"list\":[{\"fileLength\":7685,\"fileMd5\":\"3cee5c9839da9b638dc88c164bc5200a\",\"fileSuffix\":\"png\",\"fileUrl\":\"http://file.itgacl.com/uploadFile/3543D4C09F79DBA564E870804FC07689.png\",\"newFileName\":\"3543D4C09F79DBA564E870804FC07689.png\",\"originalFileName\":\"公众号注册2_20200227230018.png\",\"savePath\":\"/home/magic4j/uploadFilesManager/3543D4C09F79DBA564E870804FC07689.png\",\"storageType\":\"sftp\",\"uploadSuccess\":true,\"useTime\":490},{\"fileLength\":19560,\"fileMd5\":\"28b03f3104fb079899a7cf8d2832f49c\",\"fileSuffix\":\"png\",\"fileUrl\":\"http://file.itgacl.com/uploadFile/3ACC60C134C1343A8CCE625F4657A771.png\",\"newFileName\":\"3ACC60C134C1343A8CCE625F4657A771.png\",\"originalFileName\":\"公众号注册1_20200227225939.png\",\"savePath\":\"/home/magic4j/uploadFilesManager/3ACC60C134C1343A8CCE625F4657A771.png\",\"storageType\":\"sftp\",\"uploadSuccess\":true,\"useTime\":38}]},\"msg\":\"\"}', '上传文件', '2020-07-08 17:13:20', '0');
INSERT INTO `sys_log` VALUES ('350', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"fastdfs\"}', '46', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 17:13:32', '0');
INSERT INTO `sys_log` VALUES ('351', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '411', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"list\":[{\"fileLength\":31495,\"fileMd5\":\"497aceef43dfbe1d698b249521b2873b\",\"fileSuffix\":\"png\",\"fileUrl\":\"http://file.itgacl.com/group1/M00/00/08/rBAACl8FjjeAebmwAAB7B5oUirc444.png\",\"newFileName\":\"rBAACl8FjjeAebmwAAB7B5oUirc444.png\",\"originalFileName\":\"wxPayQrCode.png\",\"savePath\":\"group1/M00/00/08/rBAACl8FjjeAebmwAAB7B5oUirc444.png\",\"storageType\":\"fastdfs\",\"uploadSuccess\":true,\"useTime\":79},{\"fileLength\":144807,\"fileMd5\":\"c48255f88be8595af449fc6ec4bdf1c3\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://file.itgacl.com/group1/M00/00/08/rBAACl8FjjeAC-5oAAI1pwHQmMo109.jpg\",\"newFileName\":\"rBAACl8FjjeAC-5oAAI1pwHQmMo109.jpg\",\"originalFileName\":\"me_20200228004143.jpg\",\"savePath\":\"group1/M00/00/08/rBAACl8FjjeAC-5oAAI1pwHQmMo109.jpg\",\"storageType\":\"fastdfs\",\"uploadSuccess\":true,\"useTime\":36}]},\"msg\":\"\"}', '上传文件', '2020-07-08 17:13:39', '0');
INSERT INTO `sys_log` VALUES ('352', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"oss\"}', '48', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 17:13:45', '0');
INSERT INTO `sys_log` VALUES ('353', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '580', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"list\":[{\"fileLength\":28956,\"fileMd5\":\"90bc3c59a10cfb6544a59d9472ecd440\",\"fileSuffix\":\"png\",\"fileUrl\":\"http://ossfile.itgacl.com/magic4j/20200708/D6B475A5DDD3AB410DC5DDE454F1EA90.png\",\"newFileName\":\"D6B475A5DDD3AB410DC5DDE454F1EA90.png\",\"originalFileName\":\"公众号注册5_20200227230405.png\",\"savePath\":\"magic4j/20200708/D6B475A5DDD3AB410DC5DDE454F1EA90.png\",\"storageType\":\"oss\",\"uploadSuccess\":true,\"useTime\":380},{\"fileLength\":19459,\"fileMd5\":\"2f3ccbdc016bb4f814e28ab5c905dbb0\",\"fileSuffix\":\"png\",\"fileUrl\":\"http://ossfile.itgacl.com/magic4j/20200708/DF9B75DFCD4FDD0498CF05CC75DB11D1.png\",\"newFileName\":\"DF9B75DFCD4FDD0498CF05CC75DB11D1.png\",\"originalFileName\":\"公众号注册6_20200227230432.png\",\"savePath\":\"magic4j/20200708/DF9B75DFCD4FDD0498CF05CC75DB11D1.png\",\"storageType\":\"oss\",\"uploadSuccess\":true,\"useTime\":134}]},\"msg\":\"\"}', '上传文件', '2020-07-08 17:13:56', '0');
INSERT INTO `sys_log` VALUES ('354', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"cos\"}', '49', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 17:14:02', '0');
INSERT INTO `sys_log` VALUES ('355', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '492', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"list\":[{\"fileLength\":108642,\"fileMd5\":\"f547bc0dd476373219b37590703864e8\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://cosfile.itgacl.com/magic4j/20200708/4C80A31AC3EA91DF7925C3063AC8FE65.jpg\",\"newFileName\":\"4C80A31AC3EA91DF7925C3063AC8FE65.jpg\",\"originalFileName\":\"微信支付二维码_20200229140946.jpg\",\"savePath\":\"magic4j/20200708/4C80A31AC3EA91DF7925C3063AC8FE65.jpg\",\"storageType\":\"cos\",\"uploadSuccess\":true,\"useTime\":304},{\"fileLength\":68826,\"fileMd5\":\"4a9068675db0f7284850494f4ee877a3\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://cosfile.itgacl.com/magic4j/20200708/90F390AC136B82A0D64A373C93A06427.jpg\",\"newFileName\":\"90F390AC136B82A0D64A373C93A06427.jpg\",\"originalFileName\":\"支付宝收款码_20200229140523.jpg\",\"savePath\":\"magic4j/20200708/90F390AC136B82A0D64A373C93A06427.jpg\",\"storageType\":\"cos\",\"uploadSuccess\":true,\"useTime\":131}]},\"msg\":\"\"}', '上传文件', '2020-07-08 17:14:09', '0');
INSERT INTO `sys_log` VALUES ('356', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"kodo\"}', '56', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '存储方式设置', '2020-07-08 17:14:33', '0');
INSERT INTO `sys_log` VALUES ('357', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '1077', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"list\":[{\"fileLength\":8493,\"fileMd5\":\"72945c1df541017f2bdd30d4f50e99e5\",\"fileSuffix\":\"png\",\"fileUrl\":\"http://kodofile.itgacl.com/magic4j/20200708/D4F45BA5D6ACAFAB3EB7BEF9C8F73275.png\",\"newFileName\":\"D4F45BA5D6ACAFAB3EB7BEF9C8F73275.png\",\"originalFileName\":\"公众号注册4_20200227230156.png\",\"savePath\":\"magic4j/20200708/D4F45BA5D6ACAFAB3EB7BEF9C8F73275.png\",\"storageType\":\"kodo\",\"uploadSuccess\":true,\"useTime\":897},{\"fileLength\":32200,\"fileMd5\":\"b248199b0728d555285455e48b2bfb11\",\"fileSuffix\":\"png\",\"fileUrl\":\"http://kodofile.itgacl.com/magic4j/20200708/D8B2338E6FF0D15249AFBF0E87CC5A4C.png\",\"newFileName\":\"D8B2338E6FF0D15249AFBF0E87CC5A4C.png\",\"originalFileName\":\"公众号注册3_20200227230134.png\",\"savePath\":\"magic4j/20200708/D8B2338E6FF0D15249AFBF0E87CC5A4C.png\",\"storageType\":\"kodo\",\"uploadSuccess\":true,\"useTime\":122}]},\"msg\":\"\"}', '上传文件', '2020-07-08 17:14:44', '0');
INSERT INTO `sys_log` VALUES ('358', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'delete', '{\"ids\":[178,179,176,177,174,175,172,173,170,171]}', '76', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '根据ID删除文件', '2020-07-08 17:15:07', '0');
INSERT INTO `sys_log` VALUES ('359', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'delete', '{\"ids\":[168,169]}', '41', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '根据ID删除文件', '2020-07-08 17:15:13', '0');
INSERT INTO `sys_log` VALUES ('360', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiJlNzFiOTNlMC03NWEwLTQyM2ItOGNiMS1kM2Q3N2I4NTA4OGIiLCJpYXQiOjE1OTQxOTM0NjQsImV4cCI6MTU5NDc5ODI2NH0.bIcUPIK1L-3E9CtheXIp1TwYa541h6MTJIomgq9OXw_1OO17XPnEpi_yRBKubVjU9UfAJlSuxRY5wJ5ggH-crA\"}', '537', null, null, null, null, null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiIyZWU3ZTFjMy03NTkyLTQ3YzUtOTM5YS02NDQ4ZjQwNmRlNTEiLCJpYXQiOjE1OTQyMDgxMjUsImV4cCI6MTU5NDgxMjkyNX0.IpXi-dobYESwr-aQkTNaS4ND4lTBwLtxqkAzdDYmawCGhjts8lIwPBdORS1Ik9L1ePAtOnXR1jyM3Q13F1I0MQ\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNTk0MjA4MTI1LCJleHAiOjE1OTQyMTcxMjV9.GENjQSZNlOgusCVCESOkAAKYXV5sd1X2mz-_GQ0kQkbY7ViY28DR4MkGHr08vZb9mAyOIWhqk5WIZAWRNi1PPQ\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-07-08 19:35:26', null);
INSERT INTO `sys_log` VALUES ('361', '0', '3', 'magic4j[孤傲苍狼]', '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '0', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '系统用户退出登录', '2020-07-08 19:35:32', '0');
INSERT INTO `sys_log` VALUES ('362', '1', null, null, '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"I4UeSXenjKga2NKCaNSi8t7sPuCDeBpmBRDkr0+qw449T3/m1CfcKTacjENuLB7LULtnH80prA8ygFSjyD6J+4JA6whFUk/+FJNupABDEwMGrOcDUg05XfQ8Vl7R6u4bqgHyCgnZuDVjUlvSRuJraktFMKxHqH9H5/dUm91bZHc=\",\"captcha\":\"lre2\",\"uuid\":\"cac12dc1-e09d-4ded-9858-13d6db8ae78c\",\"username\":\"magic4j\"}', '6', null, null, null, null, null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-07-08 19:47:48', null);
INSERT INTO `sys_log` VALUES ('363', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"hbJfohH3WFA/QVNp4yTtpukhC4aFZNOVAz7Fsxq/vKN2ld7kHhz0+UPk/smRKh26Ku+bQyTb43s/2oK3uSu+KQyLta9yANLu2viDMnAQRvcp5314ZvrW52zXUvc91/had0sDntX/zphbuY8tkvt6AksqohCpP1xPbaG0C87vkLU=\",\"captcha\":\"m9vw\",\"uuid\":\"fd921441-d13b-4d03-9f1d-bda833a40b5c\",\"username\":\"magic4j\"}', '333', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-07-08 19:48:00', '0');
INSERT INTO `sys_log` VALUES ('364', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiIyYzQ1ZDJlMy0zYWVhLTQ5OWUtYTZjNy04NzFjMWIzZjVjM2IiLCJpYXQiOjE1OTQyMDg4NzksImV4cCI6MTU5NDgxMzY3OX0.rm6xyR6oydlJwRpsdKZDw4qFES2d7MqHVjmLWJR1FkCK-m2Hhqc151QPU5WXc14HwhNuTKNg21th5pfX3sJ_Cg\"}', '305', null, null, null, null, null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiJlMmUzZjY4Yy0yYzQ1LTRjYjMtYWZhMi1lYjJmY2UxNzdhODkiLCJpYXQiOjE1OTQyMjE5MTksImV4cCI6MTU5NDgyNjcxOX0.OyDANyAceuhRN_W1b04oXYXleqL9Ya7QdyYEOUOJR2XXrGoV9fDrlYF0YZEGkcUIocEKqdC_mKWE0jI8nEATjQ\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNTk0MjIxOTE4LCJleHAiOjE1OTQyMzA5MTh9.4Bz2BR8KcRYlusI0qeJPXDOSsFoEkhhn24LtdTBG5Sl8R9mSk3BSIfkuimAUGZAije2uW1YtV5i5f7OSRVbOkw\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-07-08 23:25:19', null);
INSERT INTO `sys_log` VALUES ('365', '0', '3', 'magic4j[孤傲苍狼]', '系统配置', '新增', 'com.itgacl.magic4j.modules.sys.controller.SysConfigController', 'create', '{\"sysConfig\":{\"configKey\":\"testKey\",\"configName\":\"测试kEY\",\"configValue\":\"TESTval\",\"remark\":\"测试\",\"status\":0}}', '67', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{},\"msg\":\"\"}', '新增配置', '2020-07-08 23:25:51', '0');
INSERT INTO `sys_log` VALUES ('366', '0', '3', 'magic4j[孤傲苍狼]', '系统配置', '新增', 'com.itgacl.magic4j.modules.sys.controller.SysConfigController', 'create', '{\"sysConfig\":{\"configKey\":\"stringconfigKey\",\"configName\":\"stringconfigName\",\"configValue\":\"stringconfigValue\",\"status\":1}}', '81', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '新增配置', '2020-07-08 23:33:43', '0');
INSERT INTO `sys_log` VALUES ('367', '0', '3', 'magic4j[孤傲苍狼]', '系统配置', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysConfigController', 'update', '{\"sysConfig\":{\"configKey\":\"string\",\"configName\":\"string\",\"configValue\":\"string\",\"id\":20,\"remark\":\"灌灌灌灌\",\"status\":0}}', '82', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改配置', '2020-07-08 23:34:32', '0');
INSERT INTO `sys_log` VALUES ('368', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"haXecggSiHJhiat4Tb/6udQxvC6z9zO0E1X42B3AW5E6UvB5Y+Fbp7IKBCibY5zDdzprahbkt6+b6mXDTPyu9yuW5FTfdi56yT2smOIRm3sd7A0K6SzNK/rNYjm/2hrsHSY/LQ/Cv/K8HsBEkOSKCixADyJp+/TWWnyGW9wAun4=\",\"captcha\":\"m4jg\",\"uuid\":\"6109b738-ee70-4ac9-ba7f-8d768a5a1e66\",\"username\":\"magic4j\"}', '378', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-07-09 09:34:18', '0');
INSERT INTO `sys_log` VALUES ('369', '0', '3', 'magic4j[孤傲苍狼]', '系统用户', '创建用户', 'com.itgacl.magic4j.modules.sys.controller.SysUserController', 'create', '{\"sysUser\":{\"cellphone\":\"15177193365\",\"email\":\"12456@163.com\",\"postIds\":[],\"roleIds\":[5],\"status\":0,\"username\":\"aaa\"}}', '128', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建系统用户', '2020-07-09 09:40:21', '0');
INSERT INTO `sys_log` VALUES ('370', '0', '3', 'magic4j[孤傲苍狼]', '系统用户', '删除用户', 'com.itgacl.magic4j.modules.sys.controller.SysUserController', 'delete', '{\"ids\":[44]}', '24', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据用户ID删除系统用户', '2020-07-09 09:40:29', '0');
INSERT INTO `sys_log` VALUES ('371', '0', '3', 'magic4j[孤傲苍狼]', '系统配置', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysConfigController', 'delete', '{\"ids\":[20,19]}', '37', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除配置', '2020-07-09 11:03:53', '0');
INSERT INTO `sys_log` VALUES ('372', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '1678', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"fileLength\":144807,\"fileMd5\":\"c48255f88be8595af449fc6ec4bdf1c3\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://kodofile.itgacl.com/magic4j/20200709/8830FAE26D6BA47AA7A551102F562185.jpg\",\"newFileName\":\"8830FAE26D6BA47AA7A551102F562185.jpg\",\"originalFileName\":\"me_20200228004143.jpg\",\"savePath\":\"magic4j/20200709/8830FAE26D6BA47AA7A551102F562185.jpg\",\"storageType\":\"kodo\",\"uploadSuccess\":true,\"useTime\":1524},\"msg\":\"success\"}', '上传文件', '2020-07-09 11:36:51', '0');
INSERT INTO `sys_log` VALUES ('373', '0', '3', 'magic4j[孤傲苍狼]', '系统配置', '平台设置', 'com.itgacl.magic4j.modules.sys.controller.SysConfigController', 'platformSetting', '{\"systemName\":\"magic4j develop\",\"systemLogo\":\"http://kodofile.itgacl.com/magic4j/20200709/8830FAE26D6BA47AA7A551102F562185.jpg\"}', '90', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '保存平台设置', '2020-07-09 11:36:52', '0');
INSERT INTO `sys_log` VALUES ('374', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '30209', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"fileLength\":27746,\"fileSuffix\":\"jpg\",\"newFileName\":\"668D2105CAC85FD0AF3B620B91F599D1.jpg\",\"originalFileName\":\"timg.jpg\",\"storageType\":\"kodo\",\"uploadSuccess\":false,\"useTime\":30209},\"msg\":\"success\"}', '上传文件', '2020-07-09 11:38:04', '0');
INSERT INTO `sys_log` VALUES ('375', '0', '3', 'magic4j[孤傲苍狼]', '系统配置', '平台设置', 'com.itgacl.magic4j.modules.sys.controller.SysConfigController', 'platformSetting', '{\"systemName\":\"magic4j开发平台\",\"systemLogo\":\"\"}', '49', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '保存平台设置', '2020-07-09 11:38:04', '0');
INSERT INTO `sys_log` VALUES ('376', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"sftp\"}', '42', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '存储方式设置', '2020-07-09 11:38:43', '0');
INSERT INTO `sys_log` VALUES ('377', '0', '3', 'magic4j[孤傲苍狼]', '系统配置', '平台设置', 'com.itgacl.magic4j.modules.sys.controller.SysConfigController', 'platformSetting', '{\"systemName\":\"magic4j开发平台\",\"systemLogo\":\"http://file.itgacl.com/uploadFile/733A1B3C008003AA1BFEB83DAE38E955.jpg\"}', '52', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '保存平台设置', '2020-07-09 11:39:03', '0');
INSERT INTO `sys_log` VALUES ('378', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '1435', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"fileLength\":27746,\"fileMd5\":\"0b8678480f5ee3129305d3ac511a0b06\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://file.itgacl.com/uploadFile/733A1B3C008003AA1BFEB83DAE38E955.jpg\",\"newFileName\":\"733A1B3C008003AA1BFEB83DAE38E955.jpg\",\"originalFileName\":\"timg.jpg\",\"savePath\":\"/home/magic4j/uploadFilesManager/733A1B3C008003AA1BFEB83DAE38E955.jpg\",\"storageType\":\"sftp\",\"uploadSuccess\":true,\"useTime\":1214},\"msg\":\"success\"}', '上传文件', '2020-07-09 11:39:03', '0');
INSERT INTO `sys_log` VALUES ('379', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiIxNzYyM2U1ZS0zNzcwLTRhMjYtYWUyNi02OWRkZWE3ZmNiZDgiLCJpYXQiOjE1OTQyNTg0NTgsImV4cCI6MTU5NDg2MzI1OH0.ddRHF1SJwmnadxG_6GQe0aRFpNYzkNXOKqntMCYA5LmPHxNyQLtQ8kyVM580ZOCs94Y5NmaADLpJvz6D4zymMQ\"}', '329', null, null, null, null, null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiJjOTdkZDRjNC04NGRhLTQzYjgtYTIyMi1hNGVmNmZkNWViOGUiLCJpYXQiOjE1OTQyNjg3MTIsImV4cCI6MTU5NDg3MzUxMn0.NoCGOO87q6GGrgvfqU9UCrwDBfE0RlGIj1xpRdqvcZHgwr-r8oQe93Zl-qj0iRgiDz0ia9an5ohstN_w4hlYFQ\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNTk0MjY4NzEyLCJleHAiOjE1OTQyNzc3MTJ9.wkeXEyvX4-i_k_7EMV6H6qcFMtpdo-stkGPN22d2GyilE_GareFlnTxED7lQEqGLP6BK0_g3ippZHQfYk7zigg\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-07-09 12:25:13', null);
INSERT INTO `sys_log` VALUES ('380', '0', '3', 'magic4j[孤傲苍狼]', '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '0', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '系统用户退出登录', '2020-07-09 12:25:13', '0');
INSERT INTO `sys_log` VALUES ('381', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"t+HCkvBREHcUrzN5tdR1ERcABiOj+VgPj3AZnh1R4jku5KiPoH9KX9skBsyeW+7lUgOZ5aAUDfL7xISQV+OVSJbnjkPsvXm5SRTaSlphmKhuKLy2tAgYIkVUEGQxb80IveW4PseDjM6ioB5KpaQZg7q9vU688km/WLuZNDdlay0=\",\"captcha\":\"2evr\",\"uuid\":\"7647c244-abef-419a-b99b-adfdca4fd850\",\"username\":\"magic4j\"}', '281', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-07-09 12:25:27', '0');
INSERT INTO `sys_log` VALUES ('382', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiJhNzc1YTJlNi0zODU1LTQ0NWItOWI5NC1iZTIzNzFhMjVhNWQiLCJpYXQiOjE1OTQyNjg3MjYsImV4cCI6MTU5NDg3MzUyNn0.DsFPkbCYUgCXdFGJ_fPstHXBViUNtDaIe5xmiosp-jPDM2xdw4QmCIZG8PqrHnQE8p6lA6VoHGN_fCGm9fgCEQ\"}', '333', null, null, null, null, null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI0ZWQwNjUxZi01ZTVlLTQ4NGEtYjY2My1lYWFhMmJhMTRhOTciLCJpYXQiOjE1OTQyNzg5NDYsImV4cCI6MTU5NDg4Mzc0Nn0._I8Al57LBRihasHplRXFskV3gPoPqUn7jchFvnGt2fc4dvPw4hxYYfQKFV6vOYRJnwqE9c8W8uKHtZtRHzfRuw\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNTk0Mjc4OTQ2LCJleHAiOjE1OTQyODc5NDZ9.1cho8vb5nO_j-ZWByyqnAlpYgdLEO6-7G6X9SEa-H8hricPw2EBME9kKus0-Sg3mRNiGmbcWrRyR_jhiG3Niuw\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-07-09 15:15:47', null);
INSERT INTO `sys_log` VALUES ('383', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"jAw/yueYDHZZJYrYBqOtR3ICV+z9iVNlpOBiSS8x6g/Q21lKzkvM8LbZs+1651dSqTBz61A9DzsqzJNC8kbDGLeUfQpya1fRmcp6t4vx+XeYfENGhjm0KBXHu2PUZz7ju3xXutk/Ap6HaflIFvIjEWrWFPGJmcAqzJhcjcd9fn8=\",\"captcha\":\"x11l\",\"uuid\":\"ca7a5177-c996-4fbf-959f-8162eabb8a52\",\"username\":\"magic4j\"}', '490', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', null, '系统用户进行登录', '2020-09-08 11:58:43', '0');
INSERT INTO `sys_log` VALUES ('384', '0', '3', 'magic4j[孤傲苍狼]', 'Device管理', '创建', 'com.itgacl.magic4j.modules.demo.controller.DeviceController', 'create', '{\"device\":{\"city\":\"深圳市\",\"country\":\"中国\",\"deviceArea\":\"广东省深圳市龙岗区\",\"deviceCode\":\"sz-test-001\",\"deviceName\":\"深圳-测试设备01\",\"devicePtName\":\"深圳北站\",\"district\":\"龙岗区\",\"gePoName\":\"广东省深圳市龙岗区\",\"latitude\":\"22.605113\",\"longitude\":\"114.07646\",\"province\":\"广东省\"}}', '46', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '创建Device', '2020-09-08 12:09:39', '0');
INSERT INTO `sys_log` VALUES ('385', '0', '3', 'magic4j[孤傲苍狼]', '字典管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysDictController', 'create', '{\"sysDict\":{\"dictCode\":\"4\",\"dictDataItems\":[{\"dictCode\":\"1\",\"dictLabel\":\"高层\"},{\"dictCode\":\"2\",\"dictLabel\":\"中层\"},{\"dictCode\":\"3\",\"dictLabel\":\"基层\"},{\"dictCode\":\"4\",\"dictLabel\":\"其他\"}],\"dictLabel\":\"其他\",\"dictName\":\"岗位类型\",\"dictType\":\"post_category\"}}', '186', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '创建字典', '2020-09-08 12:21:04', '0');
INSERT INTO `sys_log` VALUES ('386', '0', '3', 'magic4j[孤傲苍狼]', '岗位管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysPostController', 'update', '{\"sysPost\":{\"id\":6,\"orderNum\":6,\"postCategory\":2,\"postCode\":\"DM\",\"postName\":\"研发经理\",\"remark\":\"\",\"status\":0}}', '53', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '修改岗位', '2020-09-08 12:22:06', '0');
INSERT INTO `sys_log` VALUES ('387', '0', '3', 'magic4j[孤傲苍狼]', '岗位管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysPostController', 'update', '{\"sysPost\":{\"id\":5,\"orderNum\":2,\"postCategory\":2,\"postCode\":\"HR\",\"postName\":\"人力资源\",\"remark\":\"\",\"status\":1}}', '45', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '修改岗位', '2020-09-08 12:22:10', '0');
INSERT INTO `sys_log` VALUES ('388', '0', '3', 'magic4j[孤傲苍狼]', '岗位管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysPostController', 'update', '{\"sysPost\":{\"id\":4,\"orderNum\":4,\"postCategory\":1,\"postCode\":\"CFO\",\"postName\":\"财务总监\",\"remark\":\"\",\"status\":0}}', '47', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '修改岗位', '2020-09-08 12:22:15', '0');
INSERT INTO `sys_log` VALUES ('389', '0', '3', 'magic4j[孤傲苍狼]', '岗位管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysPostController', 'update', '{\"sysPost\":{\"id\":3,\"orderNum\":3,\"postCategory\":1,\"postCode\":\"CTO\",\"postName\":\"技术总监\",\"remark\":\"\",\"status\":0}}', '52', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '修改岗位', '2020-09-08 12:22:19', '0');
INSERT INTO `sys_log` VALUES ('390', '0', '3', 'magic4j[孤傲苍狼]', '岗位管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysPostController', 'update', '{\"sysPost\":{\"id\":2,\"orderNum\":2,\"postCategory\":2,\"postCode\":\"PM\",\"postName\":\"产品经理\",\"remark\":\"\",\"status\":0}}', '40', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '修改岗位', '2020-09-08 12:22:23', '0');
INSERT INTO `sys_log` VALUES ('391', '0', '3', 'magic4j[孤傲苍狼]', '岗位管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysPostController', 'update', '{\"sysPost\":{\"id\":1,\"orderNum\":1,\"postCategory\":1,\"postCode\":\"CEO\",\"postName\":\"董事长\",\"remark\":\"\",\"status\":0}}', '44', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '修改岗位', '2020-09-08 12:22:27', '0');
INSERT INTO `sys_log` VALUES ('392', '0', '3', 'magic4j[孤傲苍狼]', '岗位管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysPostController', 'update', '{\"sysPost\":{\"id\":5,\"orderNum\":2,\"postCategory\":3,\"postCode\":\"HR\",\"postName\":\"人力资源\",\"remark\":\"\",\"status\":1}}', '48', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '修改岗位', '2020-09-08 12:22:32', '0');
INSERT INTO `sys_log` VALUES ('393', '0', '3', 'magic4j[孤傲苍狼]', 'SysCnArea管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysCnAreaController', 'create', '{\"sysCnArea\":{\"areaCode\":\"450922\",\"lat\":22.168604,\"level\":4,\"lng\":110.243205,\"name\":\"乌石镇\",\"parentId\":2242,\"parentName\":\"陆川县\",\"pinyin\":\"wushizhen\",\"shortName\":\"乌石\"}}', '445', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysCnArea', '2020-09-08 12:31:58', '0');
INSERT INTO `sys_log` VALUES ('394', '0', '3', 'magic4j[孤傲苍狼]', 'SysCnArea管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysCnAreaController', 'create', '{\"sysCnArea\":{\"level\":5,\"name\":\"徐村\",\"parentId\":3751,\"parentName\":\"乌石镇\",\"pinyin\":\"xucun\"}}', '535', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysCnArea', '2020-09-08 12:32:46', '0');
INSERT INTO `sys_log` VALUES ('395', '0', '3', 'magic4j[孤傲苍狼]', 'SysCnArea管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysCnAreaController', 'delete', '{\"ids\":[3752]}', '26', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysCnArea', '2020-09-08 12:33:51', '0');
INSERT INTO `sys_log` VALUES ('396', '0', '3', 'magic4j[孤傲苍狼]', '字典管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysDictController', 'create', '{\"sysDict\":{\"dictCode\":\"4\",\"dictDataItems\":[{\"dictCode\":\"1\",\"dictLabel\":\"公司\"},{\"dictCode\":\"2\",\"dictLabel\":\"部门\"},{\"dictCode\":\"3\",\"dictLabel\":\"小组\"},{\"dictCode\":\"4\",\"dictLabel\":\"其他\"}],\"dictLabel\":\"其他\",\"dictName\":\"机构类型\",\"dictType\":\"org_category\"}}', '186', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '创建字典', '2020-09-08 14:17:06', '0');
INSERT INTO `sys_log` VALUES ('397', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI2MGNmN2QxNS1iMjFhLTQ0MGMtODY2ZC01Y2RiMDMxY2Q2YTciLCJpYXQiOjE1OTk1Mzc1MjIsImV4cCI6MTYwMDE0MjMyMn0.LcqVCa5LgVAijoUp0D8W7G4GsJcE8MCotgMSrPKwVmmcf5LK6-Q_ZSMuBnhADD5uxaJ_qUojjRwmmnClbRHyMw\"}', '445', null, null, null, null, null, null, '192.168.1.102', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI5YjlmOGZiMS00ZjFjLTRjZWYtYjdmNy00ZGFkZDJmZmMxZGQiLCJpYXQiOjE1OTk1NDY1NDAsImV4cCI6MTYwMDE1MTM0MH0.RSHIa4ft64wMK-7gSEkL8TpxY19LOBnBaDhNS94MpvPiU_XdaKQm89Lxft-OpFDJTU9BiA1j8yMbo2vOHGekXg\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNTk5NTQ2NTM5LCJleHAiOjE1OTk1NTU1Mzl9.RzRjpkl1ki7SLybeathfbGR0csg5B9YrmPPVPi7iZXFKv-FHHDoUycaeQ4eKM1PvKNrnYLQnE1DHksycBIk5wQ\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-09-08 14:29:00', null);
INSERT INTO `sys_log` VALUES ('398', '0', null, null, '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '0', null, null, null, null, null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '系统用户退出登录', '2020-09-09 23:43:35', null);
INSERT INTO `sys_log` VALUES ('399', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"hJh4lrvZ1S+8r+/2RTcXK9naKsG8hgUwcOXBwAuya9jS1XjcZj23HiUctQo0wyQlUOKAySclHNSRpAs9ax3SYHTBWZgtAP5fY2nGEETSR8JhyLleW6itLQYJ1m9uxk1E7TCNI15dYuk3p7P8HHOFF0/E8uvN2caBAwxohxHYH5w=\",\"captcha\":\"afrm\",\"uuid\":\"d04fbca4-8d59-4888-91c7-11aef64fc68a\",\"username\":\"magic4j\"}', '1560', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', null, '系统用户进行登录', '2020-09-09 23:43:49', '0');
INSERT INTO `sys_log` VALUES ('400', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI2YzgzYTdkYS1iYmExLTQwYjEtYmQ1MC00YzQ5MWQ3M2Y2MDMiLCJpYXQiOjE1OTk2NjYyMjgsImV4cCI6MTYwMDI3MTAyOH0.Ad-nAEG-ySsQs-WWsipDCz5qLt9f5nsQAeIAlxbwC9a9FTenxdVSPCqPy0DjKKlLyWvvbeSAIYi93R4D1YB-HA\"}', '1271', null, null, null, null, null, null, '192.168.1.102', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI3ZDQxZWJlMS0wMmVkLTRhMTItYmU3Ny0xZWE2MTFlYzYwNzAiLCJpYXQiOjE1OTk3MDQ4NDAsImV4cCI6MTYwMDMwOTY0MH0.HfiONs9MUo2EjzOPzsCcs5771W4yIn_Y-BJaySMyhGD9_X-idJEPk4vs9q4J9fsEF-uzWJex8fYpaUmnUbSTyA\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNTk5NzA0ODQwLCJleHAiOjE1OTk3MTM4NDB9.nR2kn-hxLLtZGaKrXV662RMBiKVuqYsPN2jLEIAL4RTh8_73HDL72z23Qvr13GVIqu_UIghlj4ZnmmTP9D-tAg\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-09-10 10:27:21', null);
INSERT INTO `sys_log` VALUES ('401', '0', null, null, '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '0', null, null, null, null, null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '系统用户退出登录', '2020-09-10 14:15:39', null);
INSERT INTO `sys_log` VALUES ('402', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"pUM4TIKOhuhJ6VHplUNHuc0gjR4l1GWT6g7ggyn97snj/IeTTctG32H2x7fGGSBZzd7yDmOXSn0wWPlq2PgBMlxTaHUm5nS4qpc/BQczXpvO8kDxd6yR5ucNznYmPASPqQjuNJO7vN86NPQS+Fj6T0cTVeIIDkkn1+5mYq/685I=\",\"captcha\":\"qe1g\",\"uuid\":\"53339685-8a41-4c1d-9cf5-f837f787f8e7\",\"username\":\"magic4j\"}', '527', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', null, '系统用户进行登录', '2020-09-10 14:15:51', '0');
INSERT INTO `sys_log` VALUES ('403', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI2ZDMzMjc3My0wZWQ3LTQ3ZWMtODc5OC0wOTEwNzYwNmIzZTYiLCJpYXQiOjE1OTk3MTg1NTAsImV4cCI6MTYwMDMyMzM1MH0.jMHUVnCABM-CkLilWV-imQl0tErlnZVufCuRvBGRe8wk8EhajWGVtFHMD6LazRq8-BcSQOGqgCMDO7583yvE2A\"}', '1301', null, null, null, null, null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiJmNjMyMzg1Mi1iODNkLTQ5MTgtOGFlZS02YWY2OWYyYjkwYTMiLCJpYXQiOjE1OTk4OTU0NjQsImV4cCI6MTYwMDUwMDI2NH0.7x6Fvyp71PNjQFidMdiRDETsa7mUK_CeX1W9iMn3_JYe9gMLn6evup4LUfYnn20uJnCfUedKFY_XGOS-CkarcA\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNTk5ODk1NDY0LCJleHAiOjE1OTk5MDQ0NjR9.Rs1Dj9RJ_cZE6ZXuu64t8N7uIVxFJpyCvR4a7auy3q511L2HC4bnLa9nAmJWWKSnow6PiRWfNjq4dnGU1SfAvQ\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-09-12 15:24:25', null);
INSERT INTO `sys_log` VALUES ('404', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"local\"}', '93', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '存储方式设置', '2020-09-12 15:30:54', '0');
INSERT INTO `sys_log` VALUES ('405', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '3363', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":[{\"fileLength\":126287,\"fileMd5\":\"ba3e8899c87a02a9d7bb025cb80b5795\",\"fileSuffix\":\".jpg\",\"fileUrl\":\"http://127.0.0.1:8888/uploadFile/683C5613EA21BFBC4188BC4C36C1F2E4.jpg\",\"newFileName\":\"683C5613EA21BFBC4188BC4C36C1F2E4.jpg\",\"originalFileName\":\"gxys_20200904224651.jpg\",\"savePath\":\"C:/data/magic4j/uploadFilesManager/683C5613EA21BFBC4188BC4C36C1F2E4.jpg\",\"storageType\":\"local\",\"uploadSuccess\":true,\"useTime\":1085}],\"msg\":\"success\"}', '上传文件', '2020-09-12 15:31:54', '0');
INSERT INTO `sys_log` VALUES ('406', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'delete', '{\"ids\":[182]}', '71', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除文件', '2020-09-12 15:56:29', '0');
INSERT INTO `sys_log` VALUES ('407', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '211', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":[{\"fileLength\":151388,\"fileMd5\":\"6acbd80b263d04a92a529389ba3a7bcc\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://127.0.0.1:8888/uploadFile/21B985E94D7A29682FE72E8DC2D1356D.jpg\",\"newFileName\":\"21B985E94D7A29682FE72E8DC2D1356D.jpg\",\"originalFileName\":\"jl_20200904224756.jpg\",\"savePath\":\"C:/data/magic4j/uploadFilesManager/21B985E94D7A29682FE72E8DC2D1356D.jpg\",\"storageType\":\"local\",\"uploadSuccess\":true,\"useTime\":19},{\"fileLength\":129017,\"fileMd5\":\"2b4892696fcf3bd37dcdde104e67127e\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://127.0.0.1:8888/uploadFile/F3716C7A6E06FAF36048684AE2503EB2.jpg\",\"newFileName\":\"F3716C7A6E06FAF36048684AE2503EB2.jpg\",\"originalFileName\":\"jl_20200904224745.jpg\",\"savePath\":\"C:/data/magic4j/uploadFilesManager/F3716C7A6E06FAF36048684AE2503EB2.jpg\",\"storageType\":\"local\",\"uploadSuccess\":true,\"useTime\":4}],\"msg\":\"success\"}', '上传文件', '2020-09-12 15:57:22', '0');
INSERT INTO `sys_log` VALUES ('408', '0', null, null, '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '0', null, null, null, null, null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '系统用户退出登录', '2020-09-12 17:55:40', null);
INSERT INTO `sys_log` VALUES ('409', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"SIrsZxN+8Co/3QZoE/RtQC0bkmegPdLDZwM4v4BjJJ9+HvXtp/WdcDv2GlbN7A6sf6ssA3r2xzgJnhHW9gHgZjLWa2jTgZG3alY9fsuGxiJiFueXIVB+6KrT96EExdi6OrD3JZuDKgmWlTpFnVg4EUgxnIoV/zl7u0XxjJxnQEs=\",\"captcha\":\"wnv7\",\"uuid\":\"4903cd72-aa62-449c-a3ff-ebb7f2a56c30\",\"username\":\"magic4j\"}', '320', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-09-12 17:55:56', '0');
INSERT INTO `sys_log` VALUES ('410', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI0NjZhNTRlMi1hOGRkLTRkN2QtYWU5NS0yZjNkNjZkMDVjZmEiLCJpYXQiOjE1OTk5MDQ1NTYsImV4cCI6MTYwMDUwOTM1Nn0.c_Xon-2v2HM4U2R4zN22cwKyWYcUH45iI44ZS5JgfJOfyIJrBlgyO0wlbCoZxQ-pxs1b1WUpx8qBdg0Ks9EH2g\"}', '361', null, null, null, null, null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI5NWQ4YzBmZS04YWQ1LTRkOWItYmE4Ny0xN2JmZjhlOGVmNTQiLCJpYXQiOjE1OTk5MTM5NTIsImV4cCI6MTYwMDUxODc1Mn0.F9N1EuaK-FdizpeZsR2rOXKdbjH6T57LYinTv4r_HwEOTqXW3gr0QcDtUzhW46b0fw53gfQ4lHkT0F-xIHA1xg\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNTk5OTEzOTUyLCJleHAiOjE1OTk5MjI5NTJ9.h824YkSKrfGZPkwTwh-Og1OU4-VQVmPgeO2eHShW3aXOF13gJYLutnLvqVZwWtniPtwc-1HsLENrYlA0FRjQFw\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-09-12 20:32:33', null);
INSERT INTO `sys_log` VALUES ('411', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"DObnCVf/jFK37pe1EsZ4k6/2HV2J/FfMFGzoDIMzkxQv3fcDLN8RlAV3YEgBUOLHo8HALmDNj9qts0fF4lW++nUKFSo3VAn8a9VuzBjUIC7t/L7w0/1HchF0aoxo0/3enZn7V4gCHNWfsKk2sDlFBO/POnaBH0Nf40bqi2DAVgQ=\",\"captcha\":\"w1mg\",\"uuid\":\"66f4637e-cdf8-4546-a657-a508f4445a0b\",\"username\":\"magic4j\"}', '750', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-09-13 12:05:59', '0');
INSERT INTO `sys_log` VALUES ('412', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiIzZjgzMTdkNi00Yzk4LTRhOTMtYjk2YS00MjI3YzU4MGQwODEiLCJpYXQiOjE1OTk5Njk5NTgsImV4cCI6MTYwMDU3NDc1OH0.YFTJKugAH2EaSkB4ENWozhxniJ36dEKn3AjFXNH_Zuo2kU8eSxggBYcVOrPkOfia8A8FodPkteIa1vr_G7hmJg\"}', '349', null, null, null, null, null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiIyNWIxNzJiNS03NTQwLTQ3OTUtYjgyZC1iODQzYzBlYjRmYWMiLCJpYXQiOjE1OTk5Nzk0NjUsImV4cCI6MTYwMDU4NDI2NX0.8zNBD2FJcHyxDZpnsNMK4gNZ-LgbnPg6AKYZxRQ9MVIxagZDCPetmY5yjtNE1TtKSz4jyVb0NYOCw7KcQP7wyg\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNTk5OTc5NDY1LCJleHAiOjE1OTk5ODg0NjV9.ItStk--C9QffNKS5aHbVWdNtNJWPubVcyq3KJnew-qsonclSG85EA9Qll-5tJlM79ywRwQZV1tppsMbAGCtlwA\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-09-13 14:44:25', null);
INSERT INTO `sys_log` VALUES ('413', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"123456@163.com\",\"leader\":\"a\",\"name\":\"测试01\",\"orderNum\":1,\"phone\":\"13822290543\"}}', '55', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 16:34:48', '0');
INSERT INTO `sys_log` VALUES ('414', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[1]}', '36', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-13 16:42:40', '0');
INSERT INTO `sys_log` VALUES ('415', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"11\",\"leader\":\"11\",\"name\":\"测试\",\"orderNum\":1,\"phone\":\"11\"}}', '38', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 16:44:57', '0');
INSERT INTO `sys_log` VALUES ('416', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"33\",\"leader\":\"33\",\"name\":\"测试2\",\"orderNum\":2,\"parentId\":2,\"phone\":\"33\"}}', '37', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 16:45:11', '0');
INSERT INTO `sys_log` VALUES ('417', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"290603672@qq.com\",\"leader\":\"李四\",\"name\":\"测试3\",\"orderNum\":3,\"parentId\":3,\"phone\":\"13822290843\"}}', '34', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 16:45:52', '0');
INSERT INTO `sys_log` VALUES ('418', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"123456@163.com\",\"leader\":\"王八\",\"name\":\"测试4\",\"orderNum\":4,\"parentId\":4,\"phone\":\"15177196635\"}}', '37', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 16:47:12', '0');
INSERT INTO `sys_log` VALUES ('419', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"290603672@qq.com\",\"id\":4,\"leader\":\"李四aa\",\"name\":\"测试3\",\"orderNum\":35,\"orgCategory\":0,\"parentId\":3,\"parentName\":\"\",\"phone\":\"13822290843\",\"status\":0}}', '55', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-13 17:00:35', '0');
INSERT INTO `sys_log` VALUES ('420', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[5,4]}', '60', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-13 17:02:07', '0');
INSERT INTO `sys_log` VALUES ('421', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[2,3]}', '29', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-13 17:03:25', '0');
INSERT INTO `sys_log` VALUES ('422', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"12\",\"leader\":\"的订单\",\"name\":\"aa吖吖\",\"orderNum\":1,\"phone\":\"123\"}}', '39', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 17:11:32', '0');
INSERT INTO `sys_log` VALUES ('423', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"1\",\"leader\":\"11所示\",\"name\":\"发发发\",\"orderNum\":2,\"parentId\":6,\"phone\":\"14\"}}', '33', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 17:11:53', '0');
INSERT INTO `sys_log` VALUES ('424', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"2\",\"leader\":\"呃呃呃\",\"name\":\"哈哈哈\",\"orderNum\":3,\"parentId\":6,\"phone\":\"1\"}}', '33', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 17:12:20', '0');
INSERT INTO `sys_log` VALUES ('425', '0', null, null, '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '1', null, null, null, null, null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '系统用户退出登录', '2020-09-13 17:35:57', null);
INSERT INTO `sys_log` VALUES ('426', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"H/CNv2fOS1Hm2r8QeVmNV6ICpXeijq/PeiCbXq78/lzgaKqit/gqY9crE5U579J9Q3c0mPh2ndwRhGZ1Jj0rXJdqTbB4kXzMe1hrOOmIRWbFpqRBJ/8frwOBhgaL5srcajBxlx9lfy+8ayf5DaxweJ9WA7RXKA3Yrmru7J+zNUU=\",\"captcha\":\"5sqw\",\"uuid\":\"d38086c3-2726-46a1-90b2-78a10e4ca94a\",\"username\":\"magic4j\"}', '708', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-09-13 22:59:23', '0');
INSERT INTO `sys_log` VALUES ('427', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[8]}', '33', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-13 22:59:50', '0');
INSERT INTO `sys_log` VALUES ('428', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[7]}', '31', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-13 23:00:37', '0');
INSERT INTO `sys_log` VALUES ('429', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"1\",\"leader\":\"1\",\"name\":\"fff所示\",\"orderNum\":1,\"parentId\":6,\"phone\":\"1\"}}', '31', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 23:02:13', '0');
INSERT INTO `sys_log` VALUES ('430', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[9]}', '32', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-13 23:02:27', '0');
INSERT INTO `sys_log` VALUES ('431', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"3\",\"leader\":\"1\",\"name\":\"搞个鬼\",\"orderNum\":2,\"parentId\":6,\"phone\":\"3\"}}', '585', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 23:04:05', '0');
INSERT INTO `sys_log` VALUES ('432', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[10]}', '30', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-13 23:04:18', '0');
INSERT INTO `sys_log` VALUES ('433', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"3\",\"leader\":\"3\",\"name\":\"肉肉\",\"orderNum\":3,\"parentId\":6,\"phone\":\"3\"}}', '38', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 23:04:42', '0');
INSERT INTO `sys_log` VALUES ('434', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"4\",\"leader\":\"4\",\"name\":\"防守打法\",\"orderNum\":4,\"parentId\":11,\"phone\":\"4\"}}', '36', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 23:05:25', '0');
INSERT INTO `sys_log` VALUES ('435', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"5\",\"leader\":\"5\",\"name\":\"哈哈哈\",\"orderNum\":5,\"parentId\":12,\"phone\":\"5\"}}', '33', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 23:05:44', '0');
INSERT INTO `sys_log` VALUES ('436', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"1\",\"leader\":\"放松放松\",\"name\":\"股份的股份的\",\"orderNum\":5,\"parentId\":13,\"phone\":\"1\"}}', '34', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 23:06:14', '0');
INSERT INTO `sys_log` VALUES ('437', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[14]}', '32', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-13 23:06:36', '0');
INSERT INTO `sys_log` VALUES ('438', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[13]}', '29', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-13 23:06:51', '0');
INSERT INTO `sys_log` VALUES ('439', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"1\",\"leader\":\"多少个\",\"name\":\"吖吖刚刚\",\"orderNum\":2,\"phone\":\"1\"}}', '32', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 23:18:15', '0');
INSERT INTO `sys_log` VALUES ('440', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"1\",\"leader\":\"222ddd订单\",\"name\":\"辅导费\",\"orderNum\":1,\"parentId\":15,\"phone\":\"1\"}}', '34', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 23:18:49', '0');
INSERT INTO `sys_log` VALUES ('441', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"1\",\"id\":15,\"leader\":\"多少个\",\"name\":\"刚刚\",\"orderNum\":2,\"orgCategory\":0,\"parentName\":\"\",\"phone\":\"1\",\"status\":0}}', '57', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-13 23:29:29', '0');
INSERT INTO `sys_log` VALUES ('442', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[12]}', '35', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-13 23:31:56', '0');
INSERT INTO `sys_log` VALUES ('443', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"2\",\"leader\":\"2\",\"name\":\"无法\",\"orderNum\":1,\"parentId\":11,\"phone\":\"2\"}}', '39', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 23:32:32', '0');
INSERT INTO `sys_log` VALUES ('444', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"3\",\"leader\":\"3\",\"name\":\"的发顺丰\",\"orderNum\":3,\"parentId\":11,\"phone\":\"3\"}}', '36', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 23:37:01', '0');
INSERT INTO `sys_log` VALUES ('445', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"3\",\"leader\":\"3\",\"name\":\"方法\",\"orderNum\":3,\"parentId\":6,\"phone\":\"3\"}}', '33', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-13 23:37:34', '0');
INSERT INTO `sys_log` VALUES ('446', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"3\",\"id\":19,\"leader\":\"3\",\"name\":\"方法\",\"orderNum\":3,\"orgCategory\":0,\"parentId\":16,\"parentName\":\"\",\"phone\":\"3\",\"status\":0}}', '38', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-13 23:38:03', '0');
INSERT INTO `sys_log` VALUES ('447', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"3\",\"id\":11,\"leader\":\"3\",\"name\":\"肉肉\",\"orderNum\":3,\"orgCategory\":0,\"parentId\":15,\"parentName\":\"\",\"phone\":\"3\",\"status\":0}}', '37', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-13 23:40:57', '0');
INSERT INTO `sys_log` VALUES ('448', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"1\",\"id\":16,\"leader\":\"222ddd订单\",\"name\":\"辅导费\",\"orderNum\":1,\"orgCategory\":0,\"parentId\":6,\"parentName\":\"\",\"phone\":\"1\",\"status\":0}}', '40', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-13 23:56:14', '0');
INSERT INTO `sys_log` VALUES ('449', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"3\",\"id\":18,\"leader\":\"3\",\"name\":\"顺丰\",\"orderNum\":3,\"orgCategory\":0,\"parentId\":16,\"parentName\":\"\",\"phone\":\"3\",\"status\":0}}', '35', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 00:00:02', '0');
INSERT INTO `sys_log` VALUES ('450', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"1\",\"leader\":\"1\",\"name\":\"反反复复\",\"orderNum\":2,\"parentId\":16,\"phone\":\"1\"}}', '36', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 00:00:43', '0');
INSERT INTO `sys_log` VALUES ('451', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"1\",\"id\":20,\"leader\":\"1刚刚\",\"name\":\"反复\",\"orderNum\":2,\"orgCategory\":0,\"parentId\":17,\"parentName\":\"\",\"phone\":\"1\",\"status\":0}}', '32', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 00:01:49', '0');
INSERT INTO `sys_log` VALUES ('452', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[19]}', '32', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 00:02:56', '0');
INSERT INTO `sys_log` VALUES ('453', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[20]}', '32', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 00:03:13', '0');
INSERT INTO `sys_log` VALUES ('454', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"1\",\"leader\":\"1\",\"name\":\"测试01\",\"orderNum\":1,\"phone\":\"1\"}}', '40', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 00:14:08', '0');
INSERT INTO `sys_log` VALUES ('455', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"2\",\"leader\":\"2\",\"name\":\"测试1-1\",\"orderNum\":2,\"parentId\":21,\"phone\":\"2\"}}', '35', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 00:14:30', '0');
INSERT INTO `sys_log` VALUES ('456', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"3\",\"leader\":\"3\",\"name\":\"测试1-1-1\",\"orderNum\":3,\"parentId\":22,\"phone\":\"3\"}}', '34', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 00:14:55', '0');
INSERT INTO `sys_log` VALUES ('457', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"4\",\"leader\":\"4\",\"name\":\"测试1-1-2\",\"orderNum\":4,\"parentId\":22,\"phone\":\"4\"}}', '33', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 00:15:21', '0');
INSERT INTO `sys_log` VALUES ('458', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"2\",\"id\":17,\"leader\":\"2\",\"name\":\"无法\",\"orderNum\":1,\"orgCategory\":0,\"parentId\":24,\"parentName\":\"\",\"phone\":\"2\",\"status\":0}}', '31', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 00:16:30', '0');
INSERT INTO `sys_log` VALUES ('459', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiJmZGI1M2Q2Yy1lYmNmLTQ2ZGYtOWQ3OC0yYjAwZDVhNWNkNTAiLCJpYXQiOjE2MDAwMDkxNjIsImV4cCI6MTYwMDYxMzk2Mn0.yNp7baS1PlIwFwqyQoH772FqoJkX4HLcvFB1pY_RAX48tT4WZVFJuL6GE9ZEUl1li8xACYhoVpN9VqEtrXIg_A\"}', '610', null, null, null, null, null, null, '192.168.1.101', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI4NTY5NDBmYi0zNjFiLTRiMzYtOGVjOC1kNzk0MTFhOWI0OWYiLCJpYXQiOjE2MDAwNDAwNTUsImV4cCI6MTYwMDY0NDg1NX0.RnJgnieTKSqnkYEc6i8u-Xp9y9HrbyQdqDwdSI6n89nKI1V7fK8x2NCMEhg1olq3QPwE-tGtX5yYwV-uyTP1AQ\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNjAwMDQwMDU1LCJleHAiOjE2MDAwNDkwNTV9.7lw9BDbbb5wd4ubnN2u_t2wFr4HO0ZwRbbObCTilxg8rFUnuoZ_2ZH2Ts3osKPgoMXPMWKGm7oclditNvRfDBw\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-09-14 07:34:16', null);
INSERT INTO `sys_log` VALUES ('460', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[17]}', '30', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 07:35:23', '0');
INSERT INTO `sys_log` VALUES ('461', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"4\",\"id\":24,\"leader\":\"4\",\"name\":\"测试1-1-2\",\"orderNum\":4,\"orgCategory\":0,\"parentId\":11,\"parentName\":\"\",\"phone\":\"4\",\"status\":0}}', '35', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 07:36:53', '0');
INSERT INTO `sys_log` VALUES ('462', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"2\",\"id\":22,\"leader\":\"2\",\"name\":\"测试1-1\",\"orderNum\":2,\"orgCategory\":0,\"parentId\":6,\"parentName\":\"\",\"phone\":\"2\",\"status\":0}}', '37', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 07:37:53', '0');
INSERT INTO `sys_log` VALUES ('463', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"1\",\"id\":21,\"leader\":\"1\",\"name\":\"测试01\",\"orderNum\":1,\"orgCategory\":0,\"parentId\":6,\"parentName\":\"\",\"phone\":\"1\",\"status\":0}}', '31', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 07:38:31', '0');
INSERT INTO `sys_log` VALUES ('464', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"1\",\"leader\":\"1\",\"name\":\"测速\",\"orderNum\":1,\"phone\":\"1\"}}', '31', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 07:39:32', '0');
INSERT INTO `sys_log` VALUES ('465', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"2\",\"leader\":\"2\",\"name\":\"搞个鬼\",\"orderNum\":2,\"parentId\":25,\"phone\":\"2\"}}', '29', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 07:39:44', '0');
INSERT INTO `sys_log` VALUES ('466', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"2\",\"leader\":\"2\",\"name\":\"城市\",\"orderNum\":1,\"phone\":\"2\"}}', '37', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 07:44:08', '0');
INSERT INTO `sys_log` VALUES ('467', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"5\",\"leader\":\"5\",\"name\":\"单多多\",\"orderNum\":5,\"parentId\":27,\"phone\":\"5\"}}', '37', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 07:49:21', '0');
INSERT INTO `sys_log` VALUES ('468', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"2\",\"id\":27,\"leader\":\"2\",\"name\":\"城市\",\"orderNum\":1,\"orgCategory\":0,\"parentId\":25,\"parentName\":\"\",\"phone\":\"2\",\"status\":0}}', '34', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 07:49:40', '0');
INSERT INTO `sys_log` VALUES ('469', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"2\",\"id\":27,\"leader\":\"2\",\"name\":\"城市\",\"orderNum\":1,\"orgCategory\":0,\"parentName\":\"\",\"phone\":\"2\",\"status\":0}}', '33', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 07:58:28', '0');
INSERT INTO `sys_log` VALUES ('470', '0', null, null, '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '1', null, null, null, null, null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '系统用户退出登录', '2020-09-14 14:18:02', null);
INSERT INTO `sys_log` VALUES ('471', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"PuvM3HSJfsr0IilNQCV3Lo0PE5P/eKrTdV47B5JBOD4m0Wim908TrjWtZcL9ETmKnV3edltw1Q0XNwgdnNgjPzLdpQjAAqP1w+fK5G9s9M8dBKHDvQ2pJxWT4Bnlb94ItNmvS8HNyAuK9KRqEvoWH8AbfwWNZladbM5pEbA1uPA=\",\"captcha\":\"enlm\",\"uuid\":\"c7fce9d0-d8a6-489a-bf55-536d8d7846c0\",\"username\":\"magic4j\"}', '622', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-09-14 14:18:18', '0');
INSERT INTO `sys_log` VALUES ('472', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"NEFRxSwB+LeHk/3guGHWaCwgek5FlpCCQj10dJklVty5aFZq5mCTS/T3NrrbxzqZ/jQP7VzKo7q9+IFKJEdo1XNoLmV2WkkXRfZmCcbEdRxTvbX3NjfM4lFT0rMW0kngt63Ide4qkEOQH5FkefSGedFX31wtdRLkhIU2jyIpx3g=\",\"captcha\":\"9jrw\",\"uuid\":\"65525ab3-c077-4d99-954b-7cfa0a3d6418\",\"username\":\"magic4j\"}', '338', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-09-14 15:20:28', '0');
INSERT INTO `sys_log` VALUES ('473', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[18]}', '35', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 15:21:59', '0');
INSERT INTO `sys_log` VALUES ('474', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[16]}', '32', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 15:22:17', '0');
INSERT INTO `sys_log` VALUES ('475', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"1\",\"leader\":\"1\",\"name\":\"测试01-1\",\"orderNum\":1,\"parentId\":21,\"phone\":\"1\"}}', '40', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 15:31:01', '0');
INSERT INTO `sys_log` VALUES ('476', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"2\",\"leader\":\"2\",\"name\":\"测试01-2\",\"orderNum\":2,\"parentId\":21,\"phone\":\"2\"}}', '32', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 15:31:30', '0');
INSERT INTO `sys_log` VALUES ('477', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"1\",\"id\":29,\"leader\":\"1\",\"name\":\"测试01-1\",\"orderNum\":1,\"orgCategory\":0,\"parentId\":6,\"parentName\":\"\",\"phone\":\"1\",\"status\":0}}', '35', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 15:33:19', '0');
INSERT INTO `sys_log` VALUES ('478', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"2\",\"id\":30,\"leader\":\"2\",\"name\":\"测试01-2\",\"orderNum\":2,\"orgCategory\":0,\"parentId\":6,\"parentName\":\"\",\"phone\":\"2\",\"status\":0}}', '32', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 15:34:14', '0');
INSERT INTO `sys_log` VALUES ('479', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"1\",\"id\":29,\"leader\":\"1\",\"name\":\"测试01-1\",\"orderNum\":1,\"orgCategory\":0,\"parentId\":21,\"parentName\":\"\",\"phone\":\"1\",\"status\":0}}', '39', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 15:35:35', '0');
INSERT INTO `sys_log` VALUES ('480', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"3\",\"id\":23,\"leader\":\"3\",\"name\":\"测试1-1-1\",\"orderNum\":3,\"orgCategory\":0,\"parentId\":6,\"parentName\":\"\",\"phone\":\"3\",\"status\":0}}', '32', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 15:40:41', '0');
INSERT INTO `sys_log` VALUES ('481', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"2\",\"id\":30,\"leader\":\"2\",\"name\":\"测试01-2\",\"orderNum\":2,\"orgCategory\":0,\"parentId\":15,\"parentName\":\"\",\"phone\":\"2\",\"status\":0}}', '306', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 15:44:12', '0');
INSERT INTO `sys_log` VALUES ('482', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[28]}', '34', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 15:48:41', '0');
INSERT INTO `sys_log` VALUES ('483', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[27]}', '37', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 15:48:45', '0');
INSERT INTO `sys_log` VALUES ('484', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[26]}', '36', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 15:48:50', '0');
INSERT INTO `sys_log` VALUES ('485', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[25]}', '34', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 15:48:53', '0');
INSERT INTO `sys_log` VALUES ('486', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[30]}', '37', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 15:49:09', '0');
INSERT INTO `sys_log` VALUES ('487', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[24]}', '35', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 15:49:14', '0');
INSERT INTO `sys_log` VALUES ('488', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[11]}', '36', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 15:49:17', '0');
INSERT INTO `sys_log` VALUES ('489', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[15]}', '36', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 15:49:20', '0');
INSERT INTO `sys_log` VALUES ('490', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[23]}', '36', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 15:49:42', '0');
INSERT INTO `sys_log` VALUES ('491', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[22]}', '34', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 15:49:44', '0');
INSERT INTO `sys_log` VALUES ('492', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[21]}', '34', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 15:49:47', '0');
INSERT INTO `sys_log` VALUES ('493', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[6]}', '38', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 15:49:50', '0');
INSERT INTO `sys_log` VALUES ('494', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"name\":\"测试1\"}}', '36', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 15:53:04', '0');
INSERT INTO `sys_log` VALUES ('495', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"name\":\"测试2\"}}', '33', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 15:53:16', '0');
INSERT INTO `sys_log` VALUES ('496', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"name\":\"测试3\"}}', '43', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 15:53:22', '0');
INSERT INTO `sys_log` VALUES ('497', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"name\":\"测试1-1\",\"parentId\":1}}', '41', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 15:53:37', '0');
INSERT INTO `sys_log` VALUES ('498', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"name\":\"测试2-1\",\"parentId\":2}}', '35', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 15:53:51', '0');
INSERT INTO `sys_log` VALUES ('499', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"name\":\"测试3-1\",\"parentId\":3}}', '36', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 15:54:05', '0');
INSERT INTO `sys_log` VALUES ('500', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"\",\"id\":4,\"leader\":\"\",\"name\":\"测试1-1\",\"orderNum\":0,\"orgCategory\":0,\"parentId\":2,\"parentName\":\"\",\"phone\":\"\",\"status\":0}}', '34', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 15:54:29', '0');
INSERT INTO `sys_log` VALUES ('501', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"\",\"id\":4,\"leader\":\"\",\"name\":\"测试1-1\",\"orderNum\":0,\"orgCategory\":0,\"parentId\":1,\"parentName\":\"\",\"phone\":\"\",\"status\":0}}', '35', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 15:56:37', '0');
INSERT INTO `sys_log` VALUES ('502', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"name\":\"测试2-1-1\",\"parentId\":5}}', '44', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 15:57:16', '0');
INSERT INTO `sys_log` VALUES ('503', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"\",\"id\":7,\"leader\":\"\",\"name\":\"测试2-1-1\",\"orderNum\":0,\"orgCategory\":0,\"parentId\":2,\"parentName\":\"\",\"phone\":\"\",\"status\":0}}', '35', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 15:57:30', '0');
INSERT INTO `sys_log` VALUES ('504', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"\",\"id\":6,\"leader\":\"\",\"name\":\"测试3-1\",\"orderNum\":0,\"orgCategory\":0,\"parentId\":7,\"parentName\":\"\",\"phone\":\"\",\"status\":0}}', '33', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 15:58:12', '0');
INSERT INTO `sys_log` VALUES ('505', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"\",\"id\":2,\"leader\":\"\",\"name\":\"测试2\",\"orderNum\":0,\"orgCategory\":0,\"parentId\":3,\"parentName\":\"\",\"phone\":\"\",\"status\":0}}', '38', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 15:59:10', '0');
INSERT INTO `sys_log` VALUES ('506', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"\",\"id\":5,\"leader\":\"\",\"name\":\"测试2-1\",\"orderNum\":0,\"orgCategory\":0,\"parentId\":1,\"parentName\":\"\",\"phone\":\"\",\"status\":0}}', '56', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 16:14:17', '0');
INSERT INTO `sys_log` VALUES ('507', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[6]}', '36', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 16:14:37', '0');
INSERT INTO `sys_log` VALUES ('508', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"\",\"id\":4,\"leader\":\"\",\"name\":\"测试1-1\",\"orderNum\":0,\"orgCategory\":0,\"parentId\":2,\"parentName\":\"\",\"phone\":\"\",\"status\":0}}', '34', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 16:15:32', '0');
INSERT INTO `sys_log` VALUES ('509', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"name\":\"测试1-1\",\"parentId\":1}}', '39', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-09-14 16:16:11', '0');
INSERT INTO `sys_log` VALUES ('510', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '修改', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'update', '{\"sysOrg\":{\"email\":\"\",\"id\":4,\"leader\":\"\",\"name\":\"测试1-1add\",\"orderNum\":0,\"orgCategory\":0,\"parentId\":2,\"parentName\":\"\",\"phone\":\"\",\"status\":0}}', '35', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '修改SysOrg', '2020-09-14 16:16:23', '0');
INSERT INTO `sys_log` VALUES ('511', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[35]}', '39', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 16:45:52', '0');
INSERT INTO `sys_log` VALUES ('512', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[36]}', '33', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 16:46:01', '0');
INSERT INTO `sys_log` VALUES ('513', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[37]}', '38', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 16:46:13', '0');
INSERT INTO `sys_log` VALUES ('514', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[38]}', '36', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 16:46:16', '0');
INSERT INTO `sys_log` VALUES ('515', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[39]}', '32', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 16:46:19', '0');
INSERT INTO `sys_log` VALUES ('516', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[40]}', '37', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 16:46:23', '0');
INSERT INTO `sys_log` VALUES ('517', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[41]}', '37', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 16:46:25', '0');
INSERT INTO `sys_log` VALUES ('518', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[42]}', '34', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 16:46:28', '0');
INSERT INTO `sys_log` VALUES ('519', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[43]}', '32', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 16:46:32', '0');
INSERT INTO `sys_log` VALUES ('520', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[46]}', '34', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 16:46:37', '0');
INSERT INTO `sys_log` VALUES ('521', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[44]}', '33', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 16:46:40', '0');
INSERT INTO `sys_log` VALUES ('522', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[45]}', '32', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 16:46:44', '0');
INSERT INTO `sys_log` VALUES ('523', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[47]}', '48', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-09-14 16:48:07', '0');
INSERT INTO `sys_log` VALUES ('524', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"hh14PW//ni4VAprf9pyQmAUpAuckkhwf3xU5YtjY2fBf1H4Zyun7KoqU8npPqFxO5QUN1YEkkZVVdTxV3xrLSeZxH2jwVhesWAukWo6SyodEO4kdMFEJcfvu6sciELgXDTPS+B3FPQV0mSwbCpOUN+z3mGnVl0yLAXjt9E+kqJQ=\",\"captcha\":\"3ll4\",\"uuid\":\"bb2e24f4-80fc-44fa-9bef-6c8e44654a6b\",\"username\":\"magic4j\"}', '716', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-09-14 17:43:12', '0');
INSERT INTO `sys_log` VALUES ('525', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"EdL34q5FxKi8Km+47nXXLwTqMAS34QZgIVgKTnzY6lnrVu3mcacpgn1LQOtn2Ht3sDgl99zwdKWpgelQOqQJzrQsxTAnb3UUyf3lSTb7WOdKAmtCFnhggyssf77kWqebKBrombPC6jj4it5L60t9pWwyQPiouYMRGtEXZx7EQWc=\",\"captcha\":\"qu1r\",\"uuid\":\"f5fa99ae-97c3-4885-9c61-c96cf90659f7\",\"username\":\"magic4j\"}', '566', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-09-14 18:05:32', '0');
INSERT INTO `sys_log` VALUES ('526', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"Mymmy4tku6aXeRJ/RouqGjI7Mlb2ipemFNDeXauiG8tAfuI2bm6N/gOWe1JjSkq7asiBHG1W9/qxabnKf7AnDfwDIBE3oTdrLx5UNhCmoLM4a9jirN9HradTPwGp9rTF6EtFTCe9DKr+Ob1IuCdsVuFrP/bHLyEL1K665U2fTCc=\",\"captcha\":\"6bw1\",\"uuid\":\"6c6e0849-84f4-4e16-8b68-cfb5953cc879\",\"username\":\"magic4j\"}', '388', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.101', '0', null, '系统用户进行登录', '2020-09-14 19:45:17', '0');
INSERT INTO `sys_log` VALUES ('527', '1', null, null, '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"Pd9f2T4jQNLixg3H9SXAY1xOaw/NoD1fbwiWle8HyK/v9D0UHGFF1nBkDwMt+uhO08sWSvnr0i21NYp01Yf9feNIj2EgTXBAwphPGZqVTirKOcwEkmFRL8sdmUFGEm79D00yKN5SD/LrxHQli4yrt7wvW2IMedA7C5YjkVLufBA=\",\"captcha\":\"atkt\",\"uuid\":\"a9ad6e42-370b-4f7b-9e5c-89c1e83658f1\",\"username\":\"magic4j\"}', '20', null, null, null, null, null, null, '192.168.1.102', '1', null, '系统用户进行登录', '2020-10-06 11:19:32', null);
INSERT INTO `sys_log` VALUES ('528', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"ka5hToB6oGZJjjyCS3KXYViL5IiHmxaFXgT5kWYmg/I9x10wsRpr+GPgpyAPmd9pkau/1VObAeHzRzx2a+XKOth1jLBbIIksxU9sOl4mAvxvDuUcn0vt2jBSWnGM+LO9dQth/IsCPTv5+JDr4f6qU96C8p0uVMd6tBb7bQP1t4s=\",\"captcha\":\"wf55\",\"uuid\":\"fb9f331f-fc77-4a70-857e-433d48e49315\",\"username\":\"magic4j\"}', '1127', '192.168.133.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', null, '系统用户进行登录', '2020-10-06 11:19:42', '0');
INSERT INTO `sys_log` VALUES ('529', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI0ZTYxYjZmMy1iZjIzLTRhZmEtYTUwNC1kNjY0MjA2MDU5NWMiLCJpYXQiOjE2MDE5NTQzODEsImV4cCI6MTYwMjU1OTE4MX0.etutfl5eNVoQOjPaxecyYpzwOjPiQrcpYeK5W1pc7ZTarOnuHClfwMPvP72AvC_1aMwCQCByRPFiCcb7O8iwGQ\"}', '421', null, null, null, null, null, null, '192.168.1.102', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiIzYzA0OGU3My0xODc3LTQzMmUtODliOC1lNDVmNzFkMTI3NTciLCJpYXQiOjE2MDE5NzAyMTQsImV4cCI6MTYwMjU3NTAxNH0.ZlCCIHuV4NX7_WnInvYHL7U7YojKkHTByu6IUQfR_qff82acUv737isfQ65sm72VqJDW0L_A3JUoHBsC8sJgvw\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNjAxOTcwMjE0LCJleHAiOjE2MDE5NzkyMTR9._J1oVW6BMzI0Cm5niRkjbrY0q-_VF0TL9WM_wddzveEyz2Cdt2GcFk-6IqNfgtOvzw9LbIcrQlSk88m7aEl7oA\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-10-06 15:43:36', null);
INSERT INTO `sys_log` VALUES ('530', '0', null, null, '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '0', null, null, null, null, null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '系统用户退出登录', '2020-10-11 09:19:41', null);
INSERT INTO `sys_log` VALUES ('531', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"WFSchUK0/Wj4SJWVdbr5hHylDfUUt7E2D2ZcGcNwu7y2aHv3krQfU1ESvwPEfgKCCOAkrAQ8BCGmW6EOZjXSweU0UhPLvoCmOwSR6x33hz0cTBd8q+CqozXxKdN2wMP9/5AQlUrU5Ocqf9KOfJJkKXvcHvtevWGl4vz4PGrvHRU=\",\"captcha\":\"cvab\",\"uuid\":\"0bb88784-6033-42f8-8fc1-57ba85bd2c7b\",\"username\":\"magic4j\"}', '317', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', null, '系统用户进行登录', '2020-10-11 09:19:54', '0');
INSERT INTO `sys_log` VALUES ('532', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"oq5+3NeAf2qkSDWBUBpHOh890NwWHWJRe0v2+XOmnNwYVu5AkeHWnZcYRrdMyWJQ052vrFp6bj6n8aQAckpDiiZsWdJjYIqORjAF9E+esgzsiJh95pFkVAn7HWBZFw9hW2CY8reEaMm8sT6+dKk/VLoKfwjgaK7L/zxJv6cCnWA=\",\"captcha\":\"6asl\",\"uuid\":\"795e4b9c-e93b-4bcd-87bf-0e322a03f993\",\"username\":\"magic4j\"}', '369', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', null, '系统用户进行登录', '2020-10-11 16:57:48', '0');
INSERT INTO `sys_log` VALUES ('533', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiJkYzI0NTcyOC1kNWQ2LTQ3ZmEtOTYyYi1hMDkyMzU3ZjE3MjAiLCJpYXQiOjE2MDI0MDY2NjcsImV4cCI6MTYwMzAxMTQ2N30.noi4mnligX47N2AbrewGOykISn5_C08hMA_GrHcKsH8a1_uAZwCN_mxL3hXe0jVQ4YO92-DVLGkni1nZldz5lA\"}', '173', null, null, null, null, null, null, '192.168.1.102', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI4OGJiZDk3Zi0yNTZhLTRkNzUtYTE0OC03MzZiZWZiY2QzZGUiLCJpYXQiOjE2MDI0OTI4OTksImV4cCI6MTYwMzA5NzY5OX0.xtN2uzUmuYi7NbNmZwIv1yDQmiVR9nrtO9tO7OVKlzuuhOLUz7bIze86Iyk3SR-UEKsTv-XEwewtorMX_4uB9w\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNjAyNDkyODk5LCJleHAiOjE2MDI1MDE4OTl9.kl5HWFcwJUcIOthiXNICvaDmkxyEmlEtsIdFUYAgrNfjlBlH7ixriZ8nXa644P-W_dYdAAT3ib_N0xroEZ3i3w\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-10-12 16:55:00', null);
INSERT INTO `sys_log` VALUES ('534', '0', null, null, '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '1', null, null, null, null, null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '系统用户退出登录', '2020-10-12 20:08:08', null);
INSERT INTO `sys_log` VALUES ('535', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"RKfYnK6RBJMJF45HlOEGBjvKWFNgcI+SqjVNhFXtZ3vYB/haXs0+06QazHhRbEmuaMV7dABdQnKp59Rw5DIWovABDjf5E7CMmR4hv9tJF0tUwwjLppPv3RSlPloHqKPJ22DIJV5nq5AbAh3S9IK1qRhkhc7epKpK1Y1L0rEG/lk=\",\"captcha\":\"y91b\",\"uuid\":\"a0b7172b-897b-4b3c-81c3-a13b446c5cd1\",\"username\":\"magic4j\"}', '244', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', null, '系统用户进行登录', '2020-10-12 20:08:22', '0');
INSERT INTO `sys_log` VALUES ('536', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI1N2Y0ZTI5Yy03OTdiLTQyODEtOGVhNy04YTBlNDdiNTlkZTAiLCJpYXQiOjE2MDI1MDQ1MDEsImV4cCI6MTYwMzEwOTMwMX0.x6Mt-F0fDDIizI7W84ss_hAUj4CXYSgPXxWQS03ykJsavLFv7xUDHR8ce5kS5TSO9w-alP3WbXmqY4ySSLEKBA\"}', '957', null, null, null, null, null, null, '192.168.1.102', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiIxNmZmZTAyZi05ZjQyLTQxNmMtYmRjNC1lYzk0YmUzM2RkZDQiLCJpYXQiOjE2MDI3NDUzNDMsImV4cCI6MTYwMzM1MDE0M30.OB5jR-riwa-sTUnI5_p0HoXv7H-oPIHcj83am8PiDw-cVBTEa-TdPZWQwUixhb6hv5BJLpLhZZOvhAldETfrCg\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNjAyNzQ1MzQzLCJleHAiOjE2MDI3NTQzNDN9.Tt_gOrAIm2YwHX_xgZ9yAjEVp-aSGZ6u6HtA7ydGmH-PTHoUcUqdoZ_X9y7-gG_17XBud3yXbW-Gb3DvQwiVMQ\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-10-15 15:02:24', null);
INSERT INTO `sys_log` VALUES ('537', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzbWFydHdhdGVyIiwidXNlcklkIjozLCJpc3MiOiJzbWFydHdhdGVyLml0Z2FjbC5jb20iLCJqdGkiOiI0ZjdmYWIyYS00MjFkLTQ4ZjQtODVlZi1mNTA1OWMwN2MzNDYiLCJpYXQiOjE2MDQwMTkzNTksImV4cCI6MTYwNDYyNDE1OX0.xVvHBcqlWPqbMwOPAa6OWLCfg7NeKBU-sTifEnZn6uv2z3N35uxHUxm5XCSsiNDVWfLgVdRKw_7H7CwSwrY7MA\"}', '937', null, null, null, null, null, null, '192.168.40.57', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI5YzI5NTFiOC1jMzI4LTQ0ZGEtYjhjNy0wYTY1ZWZlZjE3NjYiLCJpYXQiOjE2MDQ0NzcwOTYsImV4cCI6MTYwNTA4MTg5Nn0.sBrBqP-KadpOfLoGH5FiBoOGS5T4VbwY0r1CmU4GNDLc1F1knW3g8D2OmbVH3IQXwHZbQf5JTzy9qq-2vqG4Yg\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNjA0NDc3MDk2LCJleHAiOjE2MDQ0ODYwOTZ9.RDiqy8P6aCklZmVKVcl6493tzuzaLMbGgGlbbxZmetjC6fAZoRZtt1SHRWWIJn1P5DYGFeQ3w7avINafaM5XiA\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-11-04 16:04:57', null);
INSERT INTO `sys_log` VALUES ('538', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '存储设置', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'storageTypeSetting', '{\"storageType\":\"local\"}', '57', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.40.57', '0', '{\"code\":0,\"msg\":\"success\"}', '存储方式设置', '2020-11-04 16:05:25', '0');
INSERT INTO `sys_log` VALUES ('539', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '161', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.40.57', '0', '{\"code\":0,\"data\":[{\"fileLength\":56714,\"fileMd5\":\"0e8cd7dd062085ae6887d297b5fb2850\",\"fileSuffix\":\"png\",\"fileUrl\":\"http://127.0.0.1:8888/uploadFile/B6490574EDE4347EFBC9C16C0EA2873B.png\",\"newFileName\":\"B6490574EDE4347EFBC9C16C0EA2873B.png\",\"originalFileName\":\"产品工作流_20200921155516.png\",\"savePath\":\"C:/data/magic4j/uploadFilesManager/B6490574EDE4347EFBC9C16C0EA2873B.png\",\"storageType\":\"local\",\"uploadSuccess\":true,\"useTime\":54}],\"msg\":\"success\"}', '上传文件', '2020-11-04 16:05:51', '0');
INSERT INTO `sys_log` VALUES ('540', '0', null, null, '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '1', null, null, null, null, null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '系统用户退出登录', '2020-11-04 21:29:10', null);
INSERT INTO `sys_log` VALUES ('541', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"OpLDuX6Nnc9/vWPcdnFyr6nfvPBLn47WBXCa4Hy4zPNBgofLD4Mgk/nK6Q0xSRx/AfiqarLcfqCxWIWStFGxcfWGFMDWJIWpdf8YVVUenni0l/76fEyfhNVTIYlI6D3eT/SrfsdSy4LZ27vP+mBQcDwflNB0frwZFUoUY8LZmok=\",\"captcha\":\"28rc\",\"uuid\":\"d5a64707-9bc5-4e9a-a1d4-2756eed0a9d8\",\"username\":\"magic4j\"}', '473', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', null, '系统用户进行登录', '2020-11-04 21:29:25', '0');
INSERT INTO `sys_log` VALUES ('542', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiJmZmVkNzdiYy1hYmQxLTQzOTItOWViNy1hNThmYzIwYTQxZDEiLCJpYXQiOjE2MDQ0OTY1NjQsImV4cCI6MTYwNTEwMTM2NH0.u61rw2QFSY0SQdZ4xL5oeMfMydJ_77PuYQ-Npjakp2YHYshs1c6vzX5UACI4cr6yIRnlcI9Irno1Apcm5KaXiw\"}', '1608', null, null, null, null, null, null, '192.168.40.145', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiJlNThiYmY5NS1hMDE0LTRhMzctOWEzNy01MDNlYTBlMTBlOTMiLCJpYXQiOjE2MDQ1NjA5NTksImV4cCI6MTYwNTE2NTc1OX0.M9wupkGzLHSVVqjwgiSXbubkjE4zsudYn_jG_tvcTCmvsFihP6WdRJnZVYn_dwdFsOdEneplG4E4tW3gn863Ug\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNjA0NTYwOTU5LCJleHAiOjE2MDQ1Njk5NTl9._2h6azbIdmMV4ATYWJRQAh6tf-UrG_ulvLbH-eBGR4JuV7PR3-oyhDZ0lP7ff5BCl5qcx8SrHsM8dUOPk_1Ocg\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-11-05 15:22:40', null);
INSERT INTO `sys_log` VALUES ('543', '0', null, null, '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '0', null, null, null, null, null, null, '192.168.40.145', '0', '{\"code\":0,\"msg\":\"success\"}', '系统用户退出登录', '2020-11-05 16:31:15', null);
INSERT INTO `sys_log` VALUES ('544', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"HkaK4nAS7t2SJEFDITUZBm5a6MA/UpZTp7frTfKaNzsLcCZdPl2qyRyXS/ZM9yvJOhqu3T1QWLQz3xhRaUWuvVhMJclJfKsnCSxEp3xFcyHAGncNfBd/QMsdHRm6kNMW8vvVF5stoaE8+4CxmjbYEI21ckIyfGeiFVKwJKz2B5c=\",\"captcha\":\"3fja\",\"uuid\":\"562c0dde-88a2-476a-b9b3-db980f68d3be\",\"username\":\"magic4j\"}', '1192', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.40.145', '0', null, '系统用户进行登录', '2020-11-05 16:31:30', '0');
INSERT INTO `sys_log` VALUES ('545', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI1MGQ4ZTkxZC05M2VkLTQ0ODQtOWY2My02NDcyM2M3YmZkNGIiLCJpYXQiOjE2MDQ1NjUwODksImV4cCI6MTYwNTE2OTg4OX0.rmVVAObd_zQUsMKLUcS0a_xQnzpSrxFyq7bCTBKIIMCytFDU7JUIR1BNVxPBlgC0aOD2aRZnbB4GLoGhZuEQbw\"}', '784', null, null, null, null, null, null, '192.168.40.145', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiIxMDVmZWFlZC1lZjhhLTRmZjMtODVkYy1jYWIxNzYyZmNiOWYiLCJpYXQiOjE2MDQ2Mjk5MDUsImV4cCI6MTYwNTIzNDcwNX0.bXwz1qS_QMamQv0yhzdu22SgmJUbzivVTnm17cGAEEHbHNfOhrRPTmVT_ON97W5snopaMFoaTYLmgLDRuBYwGQ\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNjA0NjI5OTA1LCJleHAiOjE2MDQ2Mzg5MDV9.uT4e5TKhoeMBh3bOuuR80Y7jSu8lqywgizaCLIzOqA94aneeOzxnyjj-6W6zaIo-djlH9Gj3zRFygVgnQva18A\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-11-06 10:31:46', null);
INSERT INTO `sys_log` VALUES ('546', '0', null, null, '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '0', null, null, null, null, null, null, '192.168.40.145', '0', '{\"code\":0,\"msg\":\"success\"}', '系统用户退出登录', '2020-11-06 14:05:47', null);
INSERT INTO `sys_log` VALUES ('547', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"EO7e+moxfT3yD2Lw23F8A1+M2dL5NH5dVPCqWmcZy+S2RWUf1OuBM05ObAHgmwQ5Rli+DlnByU6pL/7s3xFfM27NztZlJ/HdmryhN1hoX7cc7aJbnzSuZNVMtF6IEkjwIWXkTrybcDfhFlhd8bcnLssUc8LoES1Irh3nZwNVS+g=\",\"captcha\":\"mflg\",\"uuid\":\"5d141f41-b675-427b-87f6-3ce89c39f843\",\"username\":\"magic4j\"}', '272', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.40.145', '0', null, '系统用户进行登录', '2020-11-06 14:05:57', '0');
INSERT INTO `sys_log` VALUES ('548', '0', '3', 'magic4j[孤傲苍狼]', '字典管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysDictController', 'create', '{\"sysDict\":{\"dictCode\":\"1\",\"dictDataItems\":[{\"dictCode\":\"0\",\"dictLabel\":\"正常\"},{\"dictCode\":\"1\",\"dictLabel\":\"停用\"}],\"dictLabel\":\"停用\",\"dictName\":\"机构状态\",\"dictType\":\"org_status\"}}', '1828', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.40.145', '0', '{\"code\":0,\"msg\":\"success\"}', '创建字典', '2020-11-06 14:21:02', '0');
INSERT INTO `sys_log` VALUES ('549', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI1YWRiNTVhMi1lMzkxLTQzZWQtYmU1MC00NGI0ZGNkMWFiNTgiLCJpYXQiOjE2MDQ2NDI3NTcsImV4cCI6MTYwNTI0NzU1N30.Ly62mXJVZXqdT6VnNuSl3KPzUTcw0YtTBIwPU8lPaDc6PSZDap2Ubkkyj7dnnczH2f4avdxGHIdU54MLYoYn4w\"}', '159', null, null, null, null, null, null, '192.168.40.145', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiIxYzY0YzZhNS02MzcxLTQxNTktYTI5My00NThkMTY2MzU0MDUiLCJpYXQiOjE2MDQ2NTQ3OTUsImV4cCI6MTYwNTI1OTU5NX0.TaR8gG_1ljGBX8vsibPNM0zvetMNzp_MTmmJkIyGF5sixRgCe5qHIAeUh3B0dpa3TB-aoN-bUS3jV3oVyxT0VA\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNjA0NjU0Nzk1LCJleHAiOjE2MDQ2NjM3OTV9.rtuJhKRgYtG8Fs0Sjw9p7TPe6z5hTLfuSMl3SnhATJG6ocij3QrRi9VVAfZuwjnCSX_-V3lHhtUwj64YFKvzRw\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-11-06 17:26:36', null);
INSERT INTO `sys_log` VALUES ('550', '0', null, null, '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '0', null, null, null, null, null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '系统用户退出登录', '2020-11-07 15:56:38', null);
INSERT INTO `sys_log` VALUES ('551', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"MjM3rbIk95JLhWWUdEFEojDB1aY2OJKzaatYEXvNXU47zMXT7v1vu+YfeuJXotUmh9OxhXXapWGhsRFs9U+fQII8CxiCMBTMpim13ypUZjczWN393/fQV9vYNKSCqyDwbydXGcWNujU6s/t3tIyVs9bvYhxr17gpGSRKXsnhjlM=\",\"captcha\":\"pjck\",\"uuid\":\"19227456-8633-4e1c-ae06-722b85b6aadd\",\"username\":\"magic4j\"}', '458', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', null, '系统用户进行登录', '2020-11-07 15:56:49', '0');
INSERT INTO `sys_log` VALUES ('552', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"leader\":\"陈生\",\"name\":\"广州恒通智联科技有限公司\",\"orderNum\":1,\"phone\":\"18922301308\",\"regionId\":1972,\"status\":0}}', '55', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-11-07 16:06:44', '0');
INSERT INTO `sys_log` VALUES ('553', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"290603672@qq.com\",\"leader\":\"徐达沛\",\"name\":\"研发部\",\"orderNum\":1,\"phone\":\"13822290843\",\"status\":0}}', '32', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-11-07 16:07:31', '0');
INSERT INTO `sys_log` VALUES ('554', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"leader\":\"陈杰\",\"name\":\"市场部\",\"orderNum\":1,\"parentId\":1,\"status\":0}}', '33', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-11-07 16:10:15', '0');
INSERT INTO `sys_log` VALUES ('555', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '删除', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'delete', '{\"ids\":[2]}', '33', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '根据ID删除SysOrg', '2020-11-07 16:14:18', '0');
INSERT INTO `sys_log` VALUES ('556', '0', '3', 'magic4j[孤傲苍狼]', 'SysOrg管理', '创建', 'com.itgacl.magic4j.modules.sys.controller.SysOrgController', 'create', '{\"sysOrg\":{\"email\":\"290603672@qq.com\",\"leader\":\"孤傲苍狼\",\"name\":\"研发部\",\"orderNum\":1,\"parentId\":1,\"phone\":\"13822290843\",\"status\":0}}', '36', '127.0.0.1', 'Chrome', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '创建SysOrg', '2020-11-07 16:15:20', '0');
INSERT INTO `sys_log` VALUES ('557', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI4NzVjZWU1OC04NTIyLTQ3ZTUtYTg5OS1jZmVmYzBhMmVhMjMiLCJpYXQiOjE2MDQ3MzU4MDgsImV4cCI6MTYwNTM0MDYwOH0.VghFWzYmrolMA_IqBGr4k2yE3063Vk6U3HC4oUqiz76KKy3WjubRfvgdjv7guaRkINkTCTkVJS6_dwrbvaW4gg\"}', '895', null, null, null, null, null, null, '192.168.1.102', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiJkNzExNmQzMS1kNjFhLTRjMTQtOGRlNC00ZGEzYmQ4OTI4Y2IiLCJpYXQiOjE2MDQ4MDQ5MTYsImV4cCI6MTYwNTQwOTcxNn0.IcJymlY7x1P60b72VYE_Mkt9d-7KR6sGeiv-rpgg4I7RMCSPdcRtTna9yawH1vvEOBkK4jS0OMRdkSnwWcxL0Q\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNjA0ODA0OTE2LCJleHAiOjE2MDQ4MTM5MTZ9.FjbRGv7FmuRnlK9rKnpxRW6lzp8M1eEFMZy4xbhQckx5wUQ268ARXAizgNwmivpYpi32czv1mlMAT2D0sZDOag\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-11-08 11:08:37', null);
INSERT INTO `sys_log` VALUES ('558', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"KYVwrVp5uAQjkV6LkKVZqe8nxDLRyObRbBdoKEqv8MINijm7t4R6KMPjPz5C/waMoeZI1fEuBlIZX83miSSQg/dTAiZ5jqOcaqADeLBBnQyaKX9AZqaTliynXUbHYL0h7UOoRRbnt5n83btM8O32SUz6wH6Q4lziAvdvKL/onN0=\",\"captcha\":\"9jan\",\"uuid\":\"2ef32b6e-ff51-4165-9a5b-82c2261b19a3\",\"username\":\"magic4j\"}', '465', '192.168.1.102', 'Chrome 8', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', null, '系统用户进行登录', '2020-11-14 11:02:57', '0');
INSERT INTO `sys_log` VALUES ('559', '0', '3', 'magic4j[孤傲苍狼]', '文件管理', '上传', 'com.itgacl.magic4j.modules.sys.controller.SysFileController', 'upload', null, '563', '192.168.1.102', 'Chrome 8', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"data\":[{\"fileLength\":5023,\"fileMd5\":\"c88c2d9991cb16e179c976024cd9c943\",\"fileSuffix\":\"jpg\",\"fileUrl\":\"http://127.0.0.1:8888/uploadFile/498702980FFEF9D6B8C9B7D5425C786A.jpg\",\"newFileName\":\"498702980FFEF9D6B8C9B7D5425C786A.jpg\",\"originalFileName\":\"defaultHeadImg.jpg\",\"savePath\":\"C:/data/magic4j/uploadFilesManager/498702980FFEF9D6B8C9B7D5425C786A.jpg\",\"storageType\":\"local\",\"uploadSuccess\":true,\"useTime\":92}],\"msg\":\"success\"}', '上传文件', '2020-11-14 11:25:13', '0');
INSERT INTO `sys_log` VALUES ('560', '0', '3', 'magic4j[孤傲苍狼]', '系统配置', '平台设置', 'com.itgacl.magic4j.modules.sys.controller.SysConfigController', 'platformSetting', '{\"systemName\":\"magic4j开发平台\",\"systemLogo\":\"http://127.0.0.1:8888/uploadFile/498702980FFEF9D6B8C9B7D5425C786A.jpg\"}', '96', '192.168.1.102', 'Chrome 8', 'Windows 10', '内网IP', null, null, '192.168.1.102', '0', '{\"code\":0,\"msg\":\"success\"}', '保存平台设置', '2020-11-14 11:25:13', '0');
INSERT INTO `sys_log` VALUES ('561', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiJhNjkwMmRmMS05ZjIwLTQ5NjgtYWE1ZS0wMzM1NTRlMDE0NjYiLCJpYXQiOjE2MDUzMjI5NzcsImV4cCI6MTYwNTkyNzc3N30.kevuJTV3qK-AFdgjOhdwIya_Yn-mrXoddNFernoHn3pvThMDTY1lra0r1Y7TKJ_3VIc7Wcggag0uh2LGWewQfw\"}', '142', null, null, null, null, null, null, '192.168.1.102', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiI5MTVlZjQ5Mi0zNTQwLTQ3YjMtOGQ1MC01YjIzMjY1YjQ5OTYiLCJpYXQiOjE2MDUzMzM3NDUsImV4cCI6MTYwNTkzODU0NX0.IKiGdj0pOgsmKCJJOpd0eI5JRn1hV-ww2rnNfECmREpvz7ulhYCaCxvyDAblk9PwKVWvh77QwPQIGL0HJS2dlw\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNjA1MzMzNzQ1LCJleHAiOjE2MDUzNDI3NDV9.U2H6naPDfuACFVNSwN2FHCiSd_d5JK6h27Oga1EJ_b19JeS_cVElGppOTqicuthSgl-JKOZf5-Aw1W36WEh96A\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-11-14 14:02:25', null);
INSERT INTO `sys_log` VALUES ('562', '0', null, null, '', '刷新Token', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'refreshAuthToken', '{\"refreshToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzbWFydHdhdGVyIiwidXNlcklkIjozLCJpc3MiOiJzbWFydHdhdGVyLml0Z2FjbC5jb20iLCJqdGkiOiJhNjEwNWM5ZC1jOWZmLTQ2NDEtODk2NS04YTI5ZWE5NjJkMzgiLCJpYXQiOjE2MDUxNjMzNDUsImV4cCI6MTYwNTc2ODE0NX0.w24mi2WirAJw1B-w7bOH_-QXsq__M6joGx3Kr6a2o58ERD0UcS6LvndAj0EVJBAEV8qPAfYrbsnJFTvUucHpeQ\"}', '1819', null, null, null, null, null, null, '192.168.3.20', '0', '{\"code\":0,\"data\":{\"refreshToken\":\"BearerToken\",\"reqHeaderKey\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJpc3MiOiJtYWdpYzRqLml0Z2FjbC5jb20iLCJqdGkiOiIxYTFhNWFmYi1jYjJmLTRhYmYtOGQ5Mi00NmI5MWEwZWYxODUiLCJpYXQiOjE2MDU0OTIwMTksImV4cCI6MTYwNjA5NjgxOX0.vFBsWHzu8KVJlF9ANkvW7rHWrMtvc8I_6i4EyQW5XP0U5TUR3K8S3dulNWien7NMqeyZxjkpt4TsWTh7n2zBaQ\",\"token\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYWdpYzRqIiwidXNlcklkIjozLCJ0ZW5hbnRJZCI6MCwicmVhbE5hbWUiOiLlraTlgrLoi43ni7wiLCJjZWxscGhvbmUiOiIxMzgyMjI5MDg0MyIsImhlYWRJbWciOiJodHRwOi8vZmlsZS10ZXN0LmppZWxvbmdidXkuY29tL3VwbG9hZEZpbGUvNUU5RkFDRDE4QjVCNzhCNTRCMkQ0N0E3RTQ3RjI3QTQuanBnIiwiZW1haWwiOiIyOTA2MDM2NzJAcXEuY29tIiwicm9sZUxpc3QiOlt7InJvbGVJZCI6NCwicm9sZU5hbWUiOiLotoXnuqfnrqHnkIblkZgiLCJyb2xlQ29kZSI6Im1hZ2ljNGpfYWRtaW4iLCJkYXRhU2NvcGUiOjF9XSwiaXNzIjoibWFnaWM0ai5pdGdhY2wuY29tIiwiaWF0IjoxNjA1NDkyMDE3LCJleHAiOjE2MDU1MDEwMTd9.igJmKA7Bijg5s7DkaSGbWkDAAOjOeO0Zxl9wS0wEKgnh9BUl2tV4LfBYVZm2m1hZF0DHzAvvhghvS3L9mY5sig\",\"type\":\"Authorization\"},\"msg\":\"success\"}', '刷新jwt验证Token', '2020-11-16 10:00:19', null);
INSERT INTO `sys_log` VALUES ('563', '0', null, null, '', '退出系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'logout', null, '0', null, null, null, null, null, null, '192.168.3.20', '0', '{\"code\":0,\"msg\":\"success\"}', '系统用户退出登录', '2020-11-17 10:37:11', null);
INSERT INTO `sys_log` VALUES ('564', '1', '3', 'magic4j[孤傲苍狼]', '', '登录系统', 'com.itgacl.magic4j.modules.sys.controller.LoginController', 'login', '{\"password\":\"Z3ftoKjgpGEMcmo1jCGq/Vwuw1DbieO9BgrxvIs1QauTf/2E3lyFA4zVjRxFg5BTkGsG8tylZP6kTbiqWlmPf+UbEHYs0RH3O6EJzQKnj4EPmZDbUihTK1JGBT4hZ7uTBIxD759CDQu+Mgn5IaXoSRbIuNyg8CZF3AwZJk/fEtk=\",\"captcha\":\"l9r5\",\"uuid\":\"c5e5abf4-3846-4830-b856-ef807ea838f0\",\"username\":\"magic4j\"}', '700', '127.0.0.1', 'Chrome 8', 'Windows 10', '内网IP', null, null, '192.168.3.20', '0', null, '系统用户进行登录', '2020-11-17 10:37:25', '0');

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
  `post_category` int(11) DEFAULT NULL COMMENT '岗位分类：1：高层，2：中层，3：基层，4：其他',
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
INSERT INTO `sys_post` VALUES ('1', '董事长', 'CEO', '1', '0', '1', '0', '', '3', '2020-04-08 15:18:45', '3', '2020-09-08 12:22:27', '0');
INSERT INTO `sys_post` VALUES ('2', '产品经理', 'PM', '2', '0', '2', '0', '', '3', '2020-04-08 15:20:26', '3', '2020-09-08 12:22:23', '0');
INSERT INTO `sys_post` VALUES ('3', '技术总监', 'CTO', '3', '0', '1', '0', '', '3', '2020-04-08 15:20:40', '3', '2020-09-08 12:22:18', '0');
INSERT INTO `sys_post` VALUES ('4', '财务总监', 'CFO', '4', '0', '1', '0', '', '3', '2020-04-08 15:20:50', '3', '2020-09-08 12:22:15', '0');
INSERT INTO `sys_post` VALUES ('5', '人力资源', 'HR', '2', '1', '3', '0', '', '3', '2020-04-08 15:21:10', '3', '2020-09-08 12:22:32', '0');
INSERT INTO `sys_post` VALUES ('6', '研发经理', 'DM', '6', '0', '2', '0', '', '3', '2020-04-08 15:21:49', '3', '2020-09-08 12:22:05', '0');
INSERT INTO `sys_post` VALUES ('7', '部门经理', 'deptManager', '3', '0', null, '0', '部门经理', '3', '2020-04-15 10:34:36', '3', '2020-04-15 10:34:36', '1');
INSERT INTO `sys_post` VALUES ('8', '董事长1', 'CEO2', '1', '0', null, '0', null, '3', '2020-04-15 10:35:45', '3', '2020-04-15 10:35:45', '1');
INSERT INTO `sys_post` VALUES ('9', 'aa', 'aa', '1', '1', null, '0', null, '3', '2020-04-15 10:35:54', '3', '2020-04-15 10:35:54', '1');
INSERT INTO `sys_post` VALUES ('10', 'bbb', 'aab', '1', '0', null, '0', null, '3', '2020-04-15 10:36:03', '3', '2020-04-15 10:36:03', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=1851 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统资源';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('87', '系统管理', null, '', '', 'system', '', '1', '1', '1', '', '3', '2020-04-07 16:29:55', '3', '2020-05-07 17:54:40', '0', null);
INSERT INTO `sys_resource` VALUES ('88', '用户管理', '87', '系统管理', 'sys/user/index', 'user', '', '1', '1', '2', '', '3', '2020-04-07 16:31:15', '3', '2020-11-05 15:44:20', '0', null);
INSERT INTO `sys_resource` VALUES ('89', '角色管理', '87', '系统管理', 'sys/role/index', 'peoples', '', '1', '2', '2', '', '3', '2020-04-07 16:31:47', '3', '2020-11-05 15:46:36', '0', null);
INSERT INTO `sys_resource` VALUES ('90', '菜单管理', '87', '系统管理', 'sys/menu/index', 'tree-table', '', '1', '3', '2', '', '3', '2020-04-07 16:32:24', '3', '2020-11-05 15:46:43', '0', null);
INSERT INTO `sys_resource` VALUES ('681', '数据字典', '87', '系统管理', 'system/dict/index', 'dict', '', '1', '5', '2', '', '3', '2020-04-11 08:12:52', '3', '2020-04-11 08:27:27', '1', null);
INSERT INTO `sys_resource` VALUES ('682', '部门管理', '87', '系统管理', 'system/dept/index', 'tree', '', '1', '4', '2', '', '3', '2020-04-11 08:15:30', '3', '2020-04-11 08:26:47', '1', null);
INSERT INTO `sys_resource` VALUES ('689', '系统工具', null, '', '', 'tool', '', '1', '3', null, '', '3', '2020-04-13 15:41:29', '3', '2020-05-07 17:54:52', '0', null);
INSERT INTO `sys_resource` VALUES ('690', '表单构建', '689', '系统工具', 'tool/build/index', 'form', '', '1', '1', null, '', '3', '2020-04-13 15:43:55', '3', '2020-05-07 18:11:29', '0', null);
INSERT INTO `sys_resource` VALUES ('691', '系统配置', '87', '系统管理', 'sys/config/index', 'guide', '', '1', '4', '2', '', '3', '2020-04-13 17:44:20', '3', '2020-11-05 15:46:52', '0', null);
INSERT INTO `sys_resource` VALUES ('698', '数据字典', '87', '系统管理', 'sys/dict/index', 'dict', '', '1', '5', '2', '', '3', '2020-04-13 22:26:06', '3', '2020-11-05 16:28:20', '0', null);
INSERT INTO `sys_resource` VALUES ('699', '系统日志', '87', '系统管理', 'sys/log/index', 'log', '', '1', '11', '2', '', '3', '2020-04-14 11:28:22', '3', '2020-11-05 16:30:51', '0', null);
INSERT INTO `sys_resource` VALUES ('700', '登录日志', '699', '系统日志', 'sys/log/login/index', 'logininfor', '', '1', '1', '3', '', '3', '2020-04-14 11:30:37', '3', '2020-11-14 11:05:52', '0', null);
INSERT INTO `sys_resource` VALUES ('701', '操作日志', '699', '系统日志', 'sys/log/opera/index', 'monitor', '', '1', '2', '3', '', '3', '2020-04-14 11:36:17', '3', '2020-11-14 11:05:58', '0', null);
INSERT INTO `sys_resource` VALUES ('723', '组织机构', '87', '系统管理', 'sys/dept/index', 'tree', '', '1', '8', '2', '', '3', '2020-04-15 00:05:46', '3', '2020-11-05 16:30:30', '0', null);
INSERT INTO `sys_resource` VALUES ('726', '岗位管理', '87', '系统管理', 'sys/post/index', 'post', '', '1', '9', '2', '', '3', '2020-04-15 10:32:26', '3', '2020-11-05 16:30:37', '0', null);
INSERT INTO `sys_resource` VALUES ('727', '租户管理', '87', '系统管理', 'sys/tenant/index', 'nested', '', '1', '7', '2', '', '3', '2020-04-15 19:24:40', '3', '2020-11-05 16:30:01', '0', null);
INSERT INTO `sys_resource` VALUES ('730', '调度管理', null, '', '', 'job', '', '1', '2', null, '', '3', '2020-04-15 22:02:01', '3', '2020-05-07 17:54:47', '0', null);
INSERT INTO `sys_resource` VALUES ('759', '任务管理', '730', '调度管理', 'schedule/job/index', 'skill', null, '1', '1', null, null, '3', '2020-04-17 14:45:38', '3', '2020-04-17 14:45:38', '0', null);
INSERT INTO `sys_resource` VALUES ('760', '调度日志', '730', '调度管理', 'schedule/log/index', 'log', null, '1', '2', null, null, '3', '2020-04-17 14:46:18', '3', '2020-04-17 14:46:18', '0', null);
INSERT INTO `sys_resource` VALUES ('770', '安全设置', '1774', '系统设置', 'sys/setting/security/index', 'skill', '', '1', '1', '3', '', '3', '2020-04-22 15:24:11', '3', '2020-11-14 11:05:32', '0', null);
INSERT INTO `sys_resource` VALUES ('783', '文件管理', '87', '系统管理', 'sys/file/index', 'upload', '', '1', '10', '2', '', '3', '2020-05-06 14:10:55', '3', '2020-11-05 16:30:44', '0', null);
INSERT INTO `sys_resource` VALUES ('1391', '资源管理', '87', '系统管理', 'sys/authRes/index', 'tree-table', '', '1', '1', '2', '', '32', '2020-05-11 14:01:17', '3', '2020-11-05 15:44:13', '0', null);
INSERT INTO `sys_resource` VALUES ('1398', '租户信息', '727', '租户管理', 'sys/tenant/info/index', 'list', '', '1', '1', '3', '', '3', '2020-05-12 09:02:01', '3', '2020-11-05 16:30:09', '0', null);
INSERT INTO `sys_resource` VALUES ('1399', '租户用户', '727', '租户管理', 'sys/tenant/user/index', 'peoples', '', '1', '2', '3', '', '3', '2020-05-12 09:02:42', '3', '2020-11-05 16:30:17', '0', null);
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
INSERT INTO `sys_resource` VALUES ('1774', '系统设置', '87', '系统管理', 'sys/setting/index', 'server', '', '1', '6', '2', '', '3', '2020-05-13 02:11:25', '3', '2020-11-05 16:28:28', '0', null);
INSERT INTO `sys_resource` VALUES ('1775', '平台设置', '1774', '系统设置', 'sys/setting/platform/index', 'example', '', '1', '2', '3', '', '3', '2020-05-13 02:13:25', '3', '2020-11-14 11:05:39', '0', null);
INSERT INTO `sys_resource` VALUES ('1776', '保存平台设置', '1721', '系统配置', '/api/sys/config/platformSetting', null, 'post:sys:config:platformSetting', '0', '0', '2', null, '1', '2020-05-13 03:10:48', '3', '2020-05-13 03:16:51', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1778', '接龙管理', null, null, null, 'money', null, '1', '2', null, null, '3', '2020-06-23 12:02:32', '3', '2020-06-23 12:02:32', '1', null);
INSERT INTO `sys_resource` VALUES ('1779', '微信用户', '1778', '接龙管理', 'jielong/miniAppUser/index', 'user', null, '1', '1', null, null, '3', '2020-06-23 12:04:27', '3', '2020-06-23 12:04:27', '1', null);
INSERT INTO `sys_resource` VALUES ('1781', '接龙商品', null, null, '#接龙商品#', null, '#', '0', '0', '1', null, '1', '2020-07-03 14:46:05', '1', '2020-07-03 14:46:05', '1', '#');
INSERT INTO `sys_resource` VALUES ('1782', '用户钱包', null, null, '#用户钱包#', null, '#', '0', '0', '1', null, '1', '2020-07-03 14:46:05', '1', '2020-07-03 14:46:05', '1', '#');
INSERT INTO `sys_resource` VALUES ('1783', '支付流水', null, null, '#支付流水#', null, '#', '0', '0', '1', null, '1', '2020-07-03 14:46:06', '1', '2020-07-03 14:46:06', '1', '#');
INSERT INTO `sys_resource` VALUES ('1784', '接龙管理', null, null, '#接龙管理#', null, '#', '0', '0', '1', null, '1', '2020-07-03 14:46:06', '1', '2020-07-03 14:46:06', '1', '#');
INSERT INTO `sys_resource` VALUES ('1785', '商品管理', null, null, '#商品管理#', null, '#', '0', '0', '1', null, '1', '2020-07-03 14:46:06', '1', '2020-07-03 14:46:06', '1', '#');
INSERT INTO `sys_resource` VALUES ('1786', '结算订单', null, null, '#结算订单#', null, '#', '0', '0', '1', null, '1', '2020-07-03 14:46:06', '1', '2020-07-03 14:46:06', '1', '#');
INSERT INTO `sys_resource` VALUES ('1787', '接龙订单', null, null, '#接龙订单#', null, '#', '0', '0', '1', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', '#');
INSERT INTO `sys_resource` VALUES ('1788', '微信用户', null, null, '#微信用户#', null, '#', '0', '0', '1', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', '#');
INSERT INTO `sys_resource` VALUES ('1789', '订单日志', null, null, '#订单日志#', null, '#', '0', '0', '1', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', '#');
INSERT INTO `sys_resource` VALUES ('1790', '结算账单', null, null, '#结算账单#', null, '#', '0', '0', '1', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', '#');
INSERT INTO `sys_resource` VALUES ('1791', '参与用户', null, null, '#参与用户#', null, '#', '0', '0', '1', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', '#');
INSERT INTO `sys_resource` VALUES ('1792', '收货地址', null, null, '#收货地址#', null, '#', '0', '0', '1', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', '#');
INSERT INTO `sys_resource` VALUES ('1805', '删除', '1781', '接龙商品', '/api/jielong/solitaireGoods/{ids}', null, 'delete:jielong:solitaireGoods', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1806', '启用', '1782', '用户钱包', '/api/jielong/userWallet/enable/{ids}', null, 'put:jielong:userWallet:enable', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', 'PUT');
INSERT INTO `sys_resource` VALUES ('1807', '删除', '1782', '用户钱包', '/api/jielong/userWallet/{ids}', null, 'delete:jielong:userWallet', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1808', '冻结', '1782', '用户钱包', '/api/jielong/userWallet/freeze/{ids}', null, 'put:jielong:userWallet:freeze', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '3', '2020-07-03 14:49:05', '1', 'PUT');
INSERT INTO `sys_resource` VALUES ('1809', '删除', '1783', '支付流水', '/api/jielong/orderPayment/{ids}', null, 'delete:jielong:orderPayment', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1810', '删除', '1784', '接龙管理', '/api/jielong/solitaire/{ids}', null, 'delete:jielong:solitaire', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1811', '恢复', '1784', '接龙管理', '/api/jielong/solitaire/resume/{ids}', null, 'post:jielong:solitaire:resume', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', 'POST');
INSERT INTO `sys_resource` VALUES ('1812', '屏蔽', '1784', '接龙管理', '/api/jielong/solitaire/shield/{ids}', null, 'post:jielong:solitaire:shield', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '3', '2020-07-03 14:49:20', '1', 'POST');
INSERT INTO `sys_resource` VALUES ('1813', '暂停', '1784', '接龙管理', '/api/jielong/solitaire/pause/{ids}', null, 'post:jielong:solitaire:pause', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', 'POST');
INSERT INTO `sys_resource` VALUES ('1814', '删除', '1785', '商品管理', '/api/jielong/goods/{ids}', null, 'delete:jielong:goods', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1815', '上架', '1785', '商品管理', '/api/jielong/goods/putOn/{ids}', null, 'post:jielong:goods:putOn', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '3', '2020-07-03 14:49:31', '1', 'POST');
INSERT INTO `sys_resource` VALUES ('1816', '下架', '1785', '商品管理', '/api/jielong/goods/pullOff/{ids}', null, 'post:jielong:goods:pullOff', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '3', '2020-07-03 14:49:38', '1', 'POST');
INSERT INTO `sys_resource` VALUES ('1817', '删除', '1786', '结算订单', '/api/jielong/settlementOrder/{ids}', null, 'delete:jielong:settlementOrder', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1818', '删除', '1787', '接龙订单', '/api/jielong/order/{ids}', null, 'delete:jielong:order', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1819', '接龙发布授权', '1788', '微信用户', '/api/jielong/miniappUser/publish/authority/{userIds}', null, 'post:jielong:miniappUser:publish:authority', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '3', '2020-07-03 14:49:58', '1', 'POST');
INSERT INTO `sys_resource` VALUES ('1820', '删除', '1789', '订单日志', '/api/jielong/orderOperaLog/{ids}', null, 'delete:jielong:orderOperaLog', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1821', '删除', '1790', '结算账单', '/api/jielong/settlementBill/{ids}', null, 'delete:jielong:settlementBill', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1822', '删除', '1791', '参与用户', '/api/jielong/solitaireJoin/{ids}', null, 'delete:jielong:solitaireJoin', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1823', '删除', '1792', '收货地址', '/api/jielong/location/{ids}', null, 'delete:jielong:location', '0', '0', '2', null, '1', '2020-07-03 14:46:07', '1', '2020-07-03 14:46:07', '1', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1824', '数据中心', null, '', 'dashboard/index', 'dashboard', '', '1', '1', null, '', '3', '2020-07-05 23:32:57', '3', '2020-07-06 10:50:04', '1', null);
INSERT INTO `sys_resource` VALUES ('1825', null, null, null, '#null#', null, '#', '0', '0', '1', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '1', '#');
INSERT INTO `sys_resource` VALUES ('1826', '区域管理', null, null, '#区域管理#', null, '#', '0', '0', '1', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', '#');
INSERT INTO `sys_resource` VALUES ('1827', 'export', '1715', '字典管理', '/api/sys/dict/export', null, 'get:sys:dict:export', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', 'GET');
INSERT INTO `sys_resource` VALUES ('1828', 'getImportTemplate', '1715', '字典管理', '/api/sys/dict/import/template', null, 'get:sys:dict:import:template', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', 'GET');
INSERT INTO `sys_resource` VALUES ('1829', 'importDict', '1715', '字典管理', '/api/sys/dict/import', null, 'post:sys:dict:import', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1830', '区域管理', '1825', null, '#区域管理#', null, '#', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '1', '#');
INSERT INTO `sys_resource` VALUES ('1831', '修改', '1826', '区域管理', '/api/sys/cnArea', null, 'put:sys:cnArea', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', 'PUT');
INSERT INTO `sys_resource` VALUES ('1832', '删除', '1826', '区域管理', '/api/sys/cnArea/{ids}', null, 'delete:sys:cnArea', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', 'DELETE');
INSERT INTO `sys_resource` VALUES ('1833', '新增', '1826', '区域管理', '/api/sys/cnArea', null, 'post:sys:cnArea', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1834', 'exportData', '1826', '区域管理', '/api/sys/cnArea/exportData', null, 'post:sys:cnArea:exportData', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '1', 'POST');
INSERT INTO `sys_resource` VALUES ('1835', 'exportData', '1826', '区域管理', '/api/sys/cnArea/exportData', null, 'get:sys:cnArea:exportData', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '1', 'GET');
INSERT INTO `sys_resource` VALUES ('1836', 'importData', '1826', '区域管理', '/api/sys/cnArea/importData', null, 'post:sys:cnArea:importData', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1837', 'getImportTemplate', '1826', '区域管理', '/api/sys/cnArea/import/template', null, 'get:sys:cnArea:import:template', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', 'GET');
INSERT INTO `sys_resource` VALUES ('1838', 'getImportTemplate', '1717', '岗位管理', '/api/sys/post/import/template', null, 'get:sys:post:import:template', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', 'GET');
INSERT INTO `sys_resource` VALUES ('1839', 'exportExcel', '1717', '岗位管理', '/api/sys/post/export', null, 'post:sys:post:export', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1840', 'importExcel', '1717', '岗位管理', '/api/sys/post/import', null, 'post:sys:post:import', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1841', 'export', '1719', '系统用户', '/api/sys/user/export', null, 'get:sys:user:export', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', 'GET');
INSERT INTO `sys_resource` VALUES ('1842', 'getImportTemplate', '1719', '系统用户', '/api/sys/user/import/template', null, 'get:sys:user:import:template', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', 'GET');
INSERT INTO `sys_resource` VALUES ('1843', 'importUser', '1719', '系统用户', '/api/sys/user/import', null, 'post:sys:user:import', '0', '0', '2', null, '1', '2020-09-08 11:58:04', '1', '2020-09-08 11:58:04', '0', 'POST');
INSERT INTO `sys_resource` VALUES ('1844', '接口文档', '689', '系统工具', 'tool/swagger/index', 'swagger', null, '1', '2', null, null, '3', '2020-09-08 12:01:03', '3', '2020-09-08 12:01:03', '0', null);
INSERT INTO `sys_resource` VALUES ('1845', '二维码生成', '689', '系统工具', 'tool/qrCode/index', 'code', null, '1', '3', null, null, '3', '2020-09-08 12:02:20', '3', '2020-09-08 12:02:20', '0', null);
INSERT INTO `sys_resource` VALUES ('1846', '实用案例', null, '', '', 'example', '', '1', '4', null, '', '3', '2020-09-08 12:04:54', '3', '2020-09-08 12:05:04', '0', null);
INSERT INTO `sys_resource` VALUES ('1847', '设备管理', '1846', '实用案例', 'demo/device/list/index', 'list', null, '1', '1', null, null, '3', '2020-09-08 12:06:27', '3', '2020-09-08 12:06:27', '0', null);
INSERT INTO `sys_resource` VALUES ('1848', '设备地图', '1846', '实用案例', 'demo/device/map/index', 'international', null, '1', '2', null, null, '3', '2020-09-08 12:07:05', '3', '2020-09-08 12:07:05', '0', null);
INSERT INTO `sys_resource` VALUES ('1849', '区域管理', '87', '系统管理', 'sys/cnArea/index', 'row', '', '1', '6', '2', '', '3', '2020-09-08 12:13:00', '3', '2020-11-05 16:28:39', '0', null);
INSERT INTO `sys_resource` VALUES ('1850', '机构管理', '87', '系统管理', 'sys/org/index', 'bug', null, '1', '1', '2', null, '3', '2020-09-13 16:23:29', '3', '2020-09-13 16:23:29', '1', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('4', '超级管理员', 'magic4j_admin', '1', '系统的超级管理员，拥有最高权限', '0', '1', '2020-04-03 23:52:58', '3', '2020-04-11 14:05:46', '0');
INSERT INTO `sys_role` VALUES ('5', '租户管理员', 'tenant_admin', '1', '租户管理员', '0', '32', '2020-04-04 08:01:20', '32', '2020-05-13 03:56:51', '0');
INSERT INTO `sys_role` VALUES ('10', '系统管理员', 'sys_admin', '4', '系统普通管理员', '0', '3', '2020-04-11 11:51:32', '3', '2020-05-13 03:43:36', '0');
INSERT INTO `sys_role` VALUES ('13', '管理员', 'sys_admin', '1', null, '6', '38', '2020-05-13 11:36:02', '38', '2020-05-13 11:36:02', '0');
INSERT INTO `sys_role` VALUES ('14', '普通用户', 'dept_admin', '1', null, '6', '38', '2020-05-13 11:38:43', '38', '2020-05-13 11:38:43', '0');
INSERT INTO `sys_role` VALUES ('15', '系统管理员', 'sys_admin', '1', null, '4', '37', '2020-05-13 11:51:35', '37', '2020-05-13 11:51:35', '0');
INSERT INTO `sys_role` VALUES ('16', 'magic管理员', 'swjiot_admin', null, '系统的超级管理员，拥有最高权限', '0', '1', '2020-11-09 10:37:09', '1', '2020-11-09 10:37:09', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=4873 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色与资源对应关系表';

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
INSERT INTO `sys_role_resource` VALUES ('4815', '4', '1793');
INSERT INTO `sys_role_resource` VALUES ('4816', '4', '1794');
INSERT INTO `sys_role_resource` VALUES ('4817', '4', '1795');
INSERT INTO `sys_role_resource` VALUES ('4818', '4', '1796');
INSERT INTO `sys_role_resource` VALUES ('4819', '4', '1797');
INSERT INTO `sys_role_resource` VALUES ('4820', '4', '1798');
INSERT INTO `sys_role_resource` VALUES ('4821', '4', '1799');
INSERT INTO `sys_role_resource` VALUES ('4822', '4', '1800');
INSERT INTO `sys_role_resource` VALUES ('4823', '4', '1801');
INSERT INTO `sys_role_resource` VALUES ('4824', '4', '1802');
INSERT INTO `sys_role_resource` VALUES ('4825', '4', '1803');
INSERT INTO `sys_role_resource` VALUES ('4826', '4', '1804');
INSERT INTO `sys_role_resource` VALUES ('4846', '4', '1780');
INSERT INTO `sys_role_resource` VALUES ('4847', '4', '1827');
INSERT INTO `sys_role_resource` VALUES ('4848', '4', '1828');
INSERT INTO `sys_role_resource` VALUES ('4849', '4', '1829');
INSERT INTO `sys_role_resource` VALUES ('4851', '4', '1831');
INSERT INTO `sys_role_resource` VALUES ('4852', '4', '1832');
INSERT INTO `sys_role_resource` VALUES ('4853', '4', '1833');
INSERT INTO `sys_role_resource` VALUES ('4856', '4', '1836');
INSERT INTO `sys_role_resource` VALUES ('4857', '4', '1837');
INSERT INTO `sys_role_resource` VALUES ('4858', '4', '1838');
INSERT INTO `sys_role_resource` VALUES ('4859', '4', '1839');
INSERT INTO `sys_role_resource` VALUES ('4860', '4', '1840');
INSERT INTO `sys_role_resource` VALUES ('4861', '4', '1841');
INSERT INTO `sys_role_resource` VALUES ('4862', '4', '1842');
INSERT INTO `sys_role_resource` VALUES ('4863', '4', '1843');
INSERT INTO `sys_role_resource` VALUES ('4865', '4', '1826');
INSERT INTO `sys_role_resource` VALUES ('4866', '4', '1844');
INSERT INTO `sys_role_resource` VALUES ('4867', '4', '1845');
INSERT INTO `sys_role_resource` VALUES ('4868', '4', '1846');
INSERT INTO `sys_role_resource` VALUES ('4869', '4', '1847');
INSERT INTO `sys_role_resource` VALUES ('4870', '4', '1848');
INSERT INTO `sys_role_resource` VALUES ('4871', '4', '1849');

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
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('3', 'magic4j', 'a283ab284e5be02e3a47533efad2032af01bc4500b447bfec3ab5373b9ec92cc', '孤傲苍狼', 'UST6mJPFuw5aTIiMRwAf', '290603672@qq.com', '13822290843', 'http://file-test.jielongbuy.com/uploadFile/5E9FACD18B5B78B54B2D47A7E47F27A4.jpg', '0', null, '0', '{\"lastLoginTs\":1605580644540,\"failedLoginAttempts\":0}', '超级管理员，拥有系统最高权限', '1', '2020-04-03 23:52:58', '3', '2020-07-04 09:13:28', '0');
INSERT INTO `sys_user` VALUES ('32', 'xdp', '09bb74576d4e3665c9513b16e876816af1de24f5d9893920738fccdae3b964b3', '徐达沛', '91v5ulygdkafCM0jgkra', 'xdp@163.com', '13598765432', 'http://file.itgacl.com/group1/M00/00/00/rBAACl66-8-Aej4QAACISF88lxk480.png', '0', '8', '0', '{\"lastLoginTs\":1589371250226,\"failedLoginAttempts\":0}', '', '3', '2020-05-10 20:21:44', '32', '2020-05-13 03:41:04', '0');
INSERT INTO `sys_user` VALUES ('37', 'comba', 'ce9534e3c679db0167d2bce72cc3c315a8032f9a9d3596960a7849229e2f768c', '京信', '4TQOXMSRgUB62xnLCU88', 'comba@comba.com', '13412345678', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67bmqAP-TuAAArJS4Lrww348.png', '0', null, '4', '{\"lastLoginTs\":1589347958525,\"failedLoginAttempts\":0}', '京信租户管理员帐号', '32', '2020-05-12 14:34:05', '37', '2020-05-13 11:50:03', '0');
INSERT INTO `sys_user` VALUES ('38', 'mapout', '5859255342f89bd2a429057f946bdd3d7d4a8ff58723f3a6bd86647eaee61389', '迈傲', 'c8khhbEKX1ClB8YN7gdh', 'mapout@service.net', '13812345678', 'http://file.itgacl.com/group1/M00/00/01/rBAACl67aM-AQoXqAAA_S67JgJc568.png', '0', null, '6', '{\"lastLoginTs\":1589347914464,\"failedLoginAttempts\":0}', '', '32', '2020-05-12 14:35:27', '38', '2020-05-13 11:26:07', '0');
INSERT INTO `sys_user` VALUES ('41', 'user1', '502aa9485a05b75f639f8eb64dbce7ff9c62c5db088681f689edcdbde1405831', '迈傲管理员', '40IQWoCUVQTUIZ2YOiin', 'www@abc.com', '13512349876', null, '0', null, '6', '{\"lastLoginTs\":1589341322710,\"failedLoginAttempts\":0}', null, '38', '2020-05-13 11:40:34', '38', '2020-05-13 11:40:34', '0');
INSERT INTO `sys_user` VALUES ('42', 'user2', '3ab3b92728e21822b711d1c0673fb0d8d4bdc83ae19e99aeb56c378f20bfef3e', '张三', 'oOhYEoLE9127nzrzMQBY', '13412347896@163.com', '13412347896', null, '0', '20', '6', '{\"lastLoginTs\":1589341350981,\"failedLoginAttempts\":0}', null, '38', '2020-05-13 11:41:21', '38', '2020-05-13 11:41:21', '0');
INSERT INTO `sys_user` VALUES ('43', 'cb1', 'd116cf45a87dcadd5bf634fb068392f487edb5de78d20c48144f892948783b0d', '鲸鱼', 'apPZt5lnRdzyE7qQMPvm', '13498763214@163.com', '13498763214', null, '0', '22', '4', '{\"lastLoginTs\":1589342154978,\"failedLoginAttempts\":0}', null, '37', '2020-05-13 11:55:22', '37', '2020-05-13 11:55:22', '0');
INSERT INTO `sys_user` VALUES ('44', 'aaa', '0c616d074e6254fd1f41854ce7ea3ba2e43f6921ec390420628f5be34e209ee4', null, 'J8rTqccWdgf2SmsL2BB7', '12456@163.com', '15177193365', null, '0', null, '0', null, null, '3', '2020-07-09 09:40:20', '3', '2020-07-09 09:40:20', '1');
INSERT INTO `sys_user` VALUES ('45', 'swjiot', '0883ec3376e0bd9d54dff87456d3e825f0481ea887105138d19d7548d8b9cf14', '孤傲苍狼', 'TYOl87P0TuaGqEmwrLhD', null, null, null, '0', null, '0', null, null, '1', '2020-11-09 10:37:09', '1', '2020-11-09 10:37:09', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户与角色对应关系';

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
INSERT INTO `sys_user_role` VALUES ('61', '44', '5');
INSERT INTO `sys_user_role` VALUES ('62', '45', '16');
