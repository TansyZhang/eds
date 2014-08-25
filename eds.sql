/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : eds

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2014-08-26 07:51:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_bbs`
-- ----------------------------
DROP TABLE IF EXISTS `t_bbs`;
CREATE TABLE `t_bbs` (
  `tid` int(11) NOT NULL,
  `ttitle` varchar(50) DEFAULT NULL COMMENT '如果是跟帖，则为空',
  `tuid` int(11) NOT NULL,
  `tcontent` text,
  `ttopic` int(11) DEFAULT NULL COMMENT '帖子所属主题，引用自c表',
  `tstate` int(11) NOT NULL COMMENT '帖子状态：0-编辑中，1-已发布，2-已发布并被置顶3-已被原作者删除，4-已被管理员屏蔽，引用自字典表tstate',
  `tshielder` int(11) DEFAULT NULL COMMENT '屏蔽者，引用自r表',
  `tcreated_time` datetime NOT NULL,
  `treleased_time` datetime DEFAULT NULL,
  `tshielded_time` datetime DEFAULT NULL,
  `ttop_time` datetime DEFAULT NULL,
  `treply_id` int(11) DEFAULT NULL COMMENT '被跟帖id，非跟帖此字段无效，楼主的帖子该字段为-1',
  `tscan_count` int(11) NOT NULL DEFAULT '0' COMMENT '帖子被查看次数',
  `tfloor` int(11) DEFAULT NULL COMMENT '帖子楼层，帖子楼层，楼主该字段为0，沙发为1',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bbs
-- ----------------------------

-- ----------------------------
-- Table structure for `t_college`
-- ----------------------------
DROP TABLE IF EXISTS `t_college`;
CREATE TABLE `t_college` (
  `gid` varchar(10) NOT NULL COMMENT '学校代号，创建者赋值',
  `gname` varchar(30) NOT NULL,
  `gprovince` int(11) NOT NULL COMMENT '学校所在省份，引用自字典表dic_province',
  `gcity` int(11) NOT NULL COMMENT '学校所在城市，引用自字典表dic_city',
  `gprofile` text NOT NULL COMMENT '学校简介',
  `gstate` int(11) NOT NULL COMMENT '状态：0-编辑中，1-审核中，2-被退回，3-发布，引用自字典表gstate',
  `gcreate_time` datetime NOT NULL COMMENT '在本系统中的创建时间/加入拔尖计划时间',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_college
-- ----------------------------

-- ----------------------------
-- Table structure for `t_course`
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `fid` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `fcollege` int(11) NOT NULL COMMENT '开课学校',
  `fgrade` int(11) NOT NULL COMMENT '课程面向年级，引用自字典表dic_grade',
  `fterm` int(11) NOT NULL COMMENT '开课学期，引用自字典表fterm',
  `faddr` varchar(50) DEFAULT NULL COMMENT '上课地点',
  `fcreator` int(11) NOT NULL COMMENT '课程创建者',
  `fcreated_time` datetime NOT NULL COMMENT '被创建时间',
  `fflag` varchar(250) DEFAULT NULL COMMENT '课程图标',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------

-- ----------------------------
-- Table structure for `t_courseware`
-- ----------------------------
DROP TABLE IF EXISTS `t_courseware`;
CREATE TABLE `t_courseware` (
  `eid` int(11) NOT NULL,
  `eattr` int(11) NOT NULL COMMENT '类型：0-网络课程，1-图书馆，2-课件，引用自字典表eattr',
  `etitle` varchar(50) NOT NULL,
  `econtent` text COMMENT '课件介绍/内容',
  `eflag` varchar(250) DEFAULT NULL COMMENT '标志图片',
  `eauthor_name` varchar(100) NOT NULL,
  `elevel` varchar(20) DEFAULT NULL COMMENT '作者职称，网络课程需要此字段，因为网络课程的author信息一般不在本系统中',
  `eauthor_college` varchar(100) DEFAULT NULL COMMENT '作者所在学校，网络课程需要此字段',
  `eauthor_photo` varchar(250) DEFAULT NULL,
  `escan_count` int(11) NOT NULL DEFAULT '0' COMMENT '被查看次数',
  `edownload_count` int(11) NOT NULL DEFAULT '0' COMMENT '被下载次数',
  `epath` varchar(250) DEFAULT NULL,
  `etype` int(11) DEFAULT NULL COMMENT '课件类别，公共课件有效，引用自字典表etype',
  `efid` int(11) DEFAULT NULL COMMENT '课件所属课程，仅用于非公共课件，引用自f表',
  `estate` int(11) NOT NULL COMMENT '课件状态：10-审核中，20-审核通过，30-退回，引用自字典表estate',
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_courseware
-- ----------------------------

-- ----------------------------
-- Table structure for `t_dic`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic`;
CREATE TABLE `t_dic` (
  `dic_key` int(11) NOT NULL,
  `dic_type` varchar(20) NOT NULL,
  `dic_value` varchar(100) DEFAULT NULL,
  `dic_parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`dic_key`,`dic_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dic
-- ----------------------------
INSERT INTO `t_dic` VALUES ('0', 'gstate', '编辑中', null);
INSERT INTO `t_dic` VALUES ('0', 'rrole', '系统', null);
INSERT INTO `t_dic` VALUES ('0', 'rstate', '正常', null);
INSERT INTO `t_dic` VALUES ('0', 'uchar', '其他', null);
INSERT INTO `t_dic` VALUES ('0', 'usender', '未知', null);
INSERT INTO `t_dic` VALUES ('10', 'gstate', '审核中', null);
INSERT INTO `t_dic` VALUES ('10', 'rrole', '超级管理员', null);
INSERT INTO `t_dic` VALUES ('10', 'rstate', '登录受限', null);
INSERT INTO `t_dic` VALUES ('10', 'usender', '女', null);
INSERT INTO `t_dic` VALUES ('20', 'gstate', '被退回', null);
INSERT INTO `t_dic` VALUES ('20', 'rrole', '普通管理员', null);
INSERT INTO `t_dic` VALUES ('20', 'usender', '男', null);
INSERT INTO `t_dic` VALUES ('30', 'gstate', '发布', null);
INSERT INTO `t_dic` VALUES ('30', 'rrole', '老师', null);
INSERT INTO `t_dic` VALUES ('40', 'gstate', '关闭', null);
INSERT INTO `t_dic` VALUES ('40', 'rrole', '学生', null);
INSERT INTO `t_dic` VALUES ('50', 'uchar', '学士', null);
INSERT INTO `t_dic` VALUES ('60', 'uchar', '硕士', null);
INSERT INTO `t_dic` VALUES ('70', 'uchar', '博士', null);
INSERT INTO `t_dic` VALUES ('80', 'uchar', '讲师', null);
INSERT INTO `t_dic` VALUES ('90', 'uchar', '副教授', null);
INSERT INTO `t_dic` VALUES ('100', 'uchar', '教授', null);

-- ----------------------------
-- Table structure for `t_download`
-- ----------------------------
DROP TABLE IF EXISTS `t_download`;
CREATE TABLE `t_download` (
  `did` int(11) NOT NULL,
  `duid` int(11) NOT NULL COMMENT '下载者id',
  `deid` int(11) NOT NULL COMMENT '下载课件id',
  `dtime` datetime NOT NULL COMMENT '下载时间',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_download
-- ----------------------------

-- ----------------------------
-- Table structure for `t_event`
-- ----------------------------
DROP TABLE IF EXISTS `t_event`;
CREATE TABLE `t_event` (
  `vid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vrid` int(11) NOT NULL COMMENT '代办负责人',
  `vtitle` varchar(50) NOT NULL COMMENT '代办事项标题',
  `vcontent` varchar(300) DEFAULT NULL COMMENT '代办事项具体内容',
  `vtype` int(11) NOT NULL COMMENT '代办类型，引用自字典表vtype',
  `vurl` varchar(500) NOT NULL COMMENT '点击该代办事件，跳转到的url',
  `vstate` int(11) NOT NULL COMMENT '事件状态：0-未查看，1-已忽略，2-已查看，引用自字典表vstate',
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_event
-- ----------------------------

-- ----------------------------
-- Table structure for `t_login`
-- ----------------------------
DROP TABLE IF EXISTS `t_login`;
CREATE TABLE `t_login` (
  `lgid` int(11) NOT NULL COMMENT '表id',
  `lgrid` int(11) NOT NULL COMMENT '尝试登录者id，引用自r表',
  `lgpassword` varchar(128) NOT NULL COMMENT '登录密码，成功时该字段为null',
  `lgtime` datetime NOT NULL COMMENT '登录时间',
  `lgip` varchar(20) DEFAULT NULL COMMENT '登录ip',
  `lgmac` varchar(30) DEFAULT NULL COMMENT '登录mac地址',
  `lgbrowser` varchar(200) DEFAULT NULL COMMENT '登录浏览器/代理',
  `lgos` varchar(200) DEFAULT NULL COMMENT '登录操作系统',
  `lgresult` int(2) NOT NULL COMMENT '登录结果：0-失败，1-成功，引用字典表lgresult',
  PRIMARY KEY (`lgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_login
-- ----------------------------

-- ----------------------------
-- Table structure for `t_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `mid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mrid` int(11) NOT NULL COMMENT '登录账号，外键引用自r表',
  `mpcreate_teacher` int(2) NOT NULL DEFAULT '1' COMMENT '是否允许创建老师账号',
  `mpcreate_news` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权创建资讯',
  `mpcreate_act` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权创建活动',
  `mpcreate_ plan_project` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权创建拔尖计划成果',
  `mpedit_ league_college` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权编辑本校高校联盟简介',
  `mpcreate_notice` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权创建通知',
  `mpcheck_ex_note` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权审核交换札记',
  `mpcreate_ex_trend` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权创建留学动态',
  `mpcreate_ex_project` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权创建交换项目',
  `mpcheck_courseware` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权审核课件，包括网络课程，电子书，课件',
  `mpcreate_topic` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权创建帖子主题',
  `mpcreate_post` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权发帖',
  `mpcreate_reply` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权回复',
  `mpcreate_msg` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权发送站内信',
  `mpmanager_user` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权对师生进行权限管理',
  `mpmanager_bbs` int(2) NOT NULL DEFAULT '1' COMMENT '是否可以管理帖子及回帖',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------

-- ----------------------------
-- Table structure for `t_msg`
-- ----------------------------
DROP TABLE IF EXISTS `t_msg`;
CREATE TABLE `t_msg` (
  `sid` int(11) NOT NULL,
  `stitle` varchar(50) NOT NULL,
  `scontent` text,
  `ssender` int(11) NOT NULL,
  `srece_type` int(11) DEFAULT NULL,
  `sreceiver` int(11) DEFAULT NULL COMMENT '接收者id或类型id，当sreceiver_type为1时，该字段无效',
  `screate_time` datetime NOT NULL,
  `ssend_time` datetime DEFAULT NULL,
  `sread_time` datetime DEFAULT NULL COMMENT '被阅读时间，当一对一发送时有效',
  `sshielded_time` datetime DEFAULT NULL COMMENT '被屏蔽时间',
  `sstate` int(11) NOT NULL COMMENT '状态：0-编辑中，1-已发送，2-已被管理员屏蔽，引用自字典表sstate',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `t_operation`
-- ----------------------------
DROP TABLE IF EXISTS `t_operation`;
CREATE TABLE `t_operation` (
  `oid` int(11) NOT NULL,
  `otime` datetime NOT NULL,
  `ouid` int(11) NOT NULL,
  `otype` int(11) NOT NULL COMMENT '操作类型：0-权限管理，1-帖子管理，2-用户管理，3-敏感词管理，引用自字典表otype',
  `oraw` varchar(100) DEFAULT NULL COMMENT '操作原内容',
  `ocontent` varchar(200) DEFAULT NULL COMMENT '操作格式化后的内容',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_operation
-- ----------------------------

-- ----------------------------
-- Table structure for `t_picmotto`
-- ----------------------------
DROP TABLE IF EXISTS `t_picmotto`;
CREATE TABLE `t_picmotto` (
  `iid` int(11) NOT NULL,
  `ipic` varchar(250) NOT NULL,
  `imotto` varchar(500) NOT NULL COMMENT '格言内容，不含引号',
  `idisplay_start_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '显示的起始时间',
  `idisplay_stop_time` datetime DEFAULT NULL COMMENT '显示的结束时间，只有在这段时间内，该箴言才会显示',
  `istate` int(11) NOT NULL COMMENT '状态：0-编辑中，1-提交/审核中，2-审核通过，3被退回，4-被屏蔽状态，引用自字典表istate',
  `icreate_time` datetime NOT NULL,
  `ishielded_time` datetime DEFAULT NULL,
  `icreate_id` int(11) DEFAULT NULL,
  `isubmit_time` datetime DEFAULT NULL,
  `ichecked_time` datetime DEFAULT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_picmotto
-- ----------------------------

-- ----------------------------
-- Table structure for `t_register`
-- ----------------------------
DROP TABLE IF EXISTS `t_register`;
CREATE TABLE `t_register` (
  `rid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `raccount` varchar(20) NOT NULL COMMENT '登录账号',
  `rpassword` varchar(128) NOT NULL COMMENT '登录密码，加密方式待定',
  `rnickname` varchar(20) DEFAULT NULL COMMENT '账户昵称',
  `rlast_lgid` int(11) NOT NULL COMMENT '上次登录id，引用自lg表，默认0',
  `rstate` int(11) NOT NULL COMMENT '账号状态：0-正常，1-禁止登录，引用自字典表rstate',
  `rrole` int(11) NOT NULL COMMENT '账号角色：0-系统，1-超管，2-普管，3-老师，4-学生，引用 自字典表rrole',
  `rshielded_role` int(11) DEFAULT NULL COMMENT '被禁止的角色：0-系统，1-超管，2-普管，引用自字典表rrole',
  `rshielded_time` datetime DEFAULT NULL COMMENT '被禁止登录时间',
  `rshielded_type` int(11) DEFAULT NULL COMMENT '被禁止登录的类型：0-一天，1-一周，2-一个月，3-一年，4-永久，引用自字典表rshielded_type',
  `rshielded_tick` int(11) DEFAULT NULL COMMENT '被禁止的时长，以秒为单位',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_register
-- ----------------------------

-- ----------------------------
-- Table structure for `t_reply`
-- ----------------------------
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply` (
  `yid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `yreplier` int(11) NOT NULL COMMENT '回复者id',
  `yrepliee` int(11) NOT NULL COMMENT '被回复者id',
  `ytid` int(11) NOT NULL COMMENT '回复的帖子id',
  `ycontent` text NOT NULL COMMENT '帖子内容',
  `ytime` datetime NOT NULL COMMENT '回复时间',
  `ystate` int(11) NOT NULL COMMENT '回复状态：0-已回复，1-被原作者删除，2-被楼主删除，3-被管理员屏蔽，引用自字典表ystate',
  `yshield_id` int(11) DEFAULT NULL COMMENT '屏蔽回复的id',
  `yshielded_time` datetime DEFAULT NULL COMMENT '被屏蔽/删除的时间',
  PRIMARY KEY (`yid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `t_teach`
-- ----------------------------
DROP TABLE IF EXISTS `t_teach`;
CREATE TABLE `t_teach` (
  `pid` int(11) NOT NULL,
  `puid` int(11) NOT NULL,
  `pfid` int(11) NOT NULL,
  `prole` int(11) NOT NULL COMMENT '课程角色：0-主讲教师，1-“猪脚”，引用自字典表prole',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teach
-- ----------------------------

-- ----------------------------
-- Table structure for `t_topic`
-- ----------------------------
DROP TABLE IF EXISTS `t_topic`;
CREATE TABLE `t_topic` (
  `cid` int(11) NOT NULL,
  `cname` varchar(20) NOT NULL,
  `cpic` varchar(250) DEFAULT NULL,
  `cstate` int(11) NOT NULL COMMENT '状态：0-编辑中，1-发布，2-关闭，引用自字典表cstate',
  `cshielded_time` datetime DEFAULT NULL,
  `cshielder` int(11) DEFAULT NULL,
  `ccreated_time` datetime NOT NULL,
  `creleased_time` datetime DEFAULT NULL,
  `cclosed_time` datetime NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_topic
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `urid` int(11) NOT NULL COMMENT '登录账号，外键引用自r表',
  `uchar` int(11) NOT NULL COMMENT '职称：0-教授，1-副教授，2-讲师，3-博士，4-硕士，5-学徒/学士，6-其他，引用自字典表uchar',
  `ugid` int(11) NOT NULL COMMENT '学校代号',
  `uno` varchar(20) NOT NULL COMMENT '学工号',
  `uname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `uen_name` varchar(100) DEFAULT NULL COMMENT '英文名',
  `udisplay_name` int(2) NOT NULL COMMENT '显示名：0-uname，1-en_name',
  `usender` int(2) NOT NULL COMMENT '性别，0-男，1-女，引用自字典表usender',
  `ubirthday` date DEFAULT NULL COMMENT '出生日期',
  `uuid` int(11) NOT NULL COMMENT '创建的老师',
  `uemail` varchar(50) DEFAULT NULL,
  `umobile_phone` varchar(16) DEFAULT NULL,
  `utel` varchar(16) DEFAULT NULL,
  `uqq` varchar(16) DEFAULT NULL,
  `uoffice_addr` varchar(100) DEFAULT NULL COMMENT '办公地址',
  `uhead_photo` varchar(250) DEFAULT NULL COMMENT '头像路径',
  `uprofile` text COMMENT '个人说明',
  `uconstellation` int(11) DEFAULT NULL COMMENT '星座，引用自字典表uconstellation',
  `ugrade` int(11) DEFAULT NULL COMMENT '入学年份/年级，引用自字典表dic_grade',
  `ucreate_post` int(2) NOT NULL DEFAULT '1',
  `ucreate_reply` int(2) NOT NULL DEFAULT '1',
  `ucreate_msg` int(2) NOT NULL DEFAULT '1',
  `ucreate_ex_note` int(2) NOT NULL DEFAULT '1',
  `ucreate_ex_trend` int(2) NOT NULL DEFAULT '1',
  `ucreate_ex_project` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权创建留学动态',
  `uupload_courseware` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权上传课件',
  `ucreate_student` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权创建学生',
  `udownload_courseware` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权下载[登录才允许下载的]课件',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for `t_z`
-- ----------------------------
DROP TABLE IF EXISTS `t_z`;
CREATE TABLE `t_z` (
  `zid` int(11) NOT NULL,
  `zcreator` int(11) NOT NULL COMMENT '创建者id，引用自注册表r',
  `zgid` int(11) NOT NULL COMMENT '内容所属学校，一般来说，该值与创建者id所属学校同，但可能后期加入全局管理员，这类管理员不隶属于任何学校',
  `zcreated_time` datetime NOT NULL,
  `zlast_edited_time` datetime NOT NULL,
  `zchecked_time` datetime DEFAULT NULL,
  `zreleased_time` datetime DEFAULT NULL,
  `ztop_time` datetime DEFAULT NULL,
  `ztitle` varchar(50) NOT NULL,
  `zcontent` text NOT NULL,
  `zstate` int(11) NOT NULL COMMENT '状态：0-编辑中，1-提交/审核中，2-被退回，3-发布，4发布且置顶，5-被屏蔽，6-被删除，引用自字典表zstate',
  `ztype` int(11) NOT NULL COMMENT '类型：0-资讯，1-活动，3-成果，4-通知，5-交流札记，6-留学动态，9-交换项目，引用自字典表ztype',
  `zsub_type` int(11) NOT NULL COMMENT '子类型，对于资讯来说，就是0-中国科学网，1-science专区，2-nature专区，3-拔尖专区，引用自字典表zsub_type',
  `zflag` varchar(250) DEFAULT NULL COMMENT '标志图片',
  `zcheckor` int(11) DEFAULT NULL COMMENT '审核者ID，引用自r表',
  `zscan_count` int(11) NOT NULL DEFAULT '0' COMMENT '被浏览的次数',
  PRIMARY KEY (`zid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_z
-- ----------------------------
