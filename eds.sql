/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : eds

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2014-09-16 23:23:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_bbs`
-- ----------------------------
DROP TABLE IF EXISTS `t_bbs`;
CREATE TABLE `t_bbs` (
  `tid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ttitle` varchar(50) DEFAULT NULL COMMENT '如果是跟帖，则为空',
  `trid` int(11) NOT NULL,
  `tsummary` text NOT NULL COMMENT '简介',
  `tcontent` text,
  `ttopic` int(11) DEFAULT NULL COMMENT '帖子所属主题，引用自c表',
  `tstate` int(11) NOT NULL COMMENT '帖子状态：0-编辑中，1-已发布，2-已发布并被置顶3-已被原作者删除，4-已被管理员屏蔽，引用自字典表tstate',
  `tshielder` int(11) DEFAULT NULL COMMENT '屏蔽者，引用自r表',
  `tcreated_time` datetime NOT NULL,
  `tlast_edited_time` datetime DEFAULT NULL,
  `treleased_time` datetime DEFAULT NULL,
  `tshielded_time` datetime DEFAULT NULL,
  `ttop_time` datetime DEFAULT NULL,
  `treply_id` int(11) DEFAULT NULL COMMENT '被跟帖id，非跟帖此字段无效，楼主的帖子该字段为-1',
  `tscan_count` int(11) NOT NULL DEFAULT '0' COMMENT '帖子被查看次数',
  `tfloor` int(11) DEFAULT '0' COMMENT '帖子楼层，帖子楼层，楼主该字段为0，沙发为1',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bbs
-- ----------------------------
INSERT INTO `t_bbs` VALUES ('1', '太阳系边界现神秘“彩带” 粒子被困环形区域', '1', '【科技讯】8月29日消息，据媒体报道，在太阳系的边缘，科学家发现了一处神秘的边界层，是太阳系物质与银河系介质相互作用的地方，处于日光层的边缘，NASA星际边界探测器发现了一种奇怪的现象，太阳系内部粒子', '&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;【&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科技&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;讯】8月29日消息，据媒体报道，在太阳系的边缘，&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;家发现了一处神秘的边界层，是太阳系物质与银河系介质相互作用的地方，处于日光层的边缘，NASA星际边界探测器发现了一种奇怪的现象，太阳系内部粒子在这一区域中似乎碰到一层壁垒，使得太阳系外围出现类似“边界指纹”的结构，绘制太阳系边界图像体现了这处神秘的区域，但无法对其进行解释。&lt;/span&gt;\n&lt;/p&gt;\n&lt;p style=&quot;text-align:center;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;img src=&quot;/eds/Public/kindeditor-4.1.10/attached/image/20140830/20140830144420_14273.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;\n	&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n		&amp;nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; 太阳系边界处神秘结构酷似巨大的“彩带”飘舞，产生更多高能中性原子，&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;家不清楚是什么原因导致中性原子数量出现增加。科学家设计出相关模拟和理论试图解释彩带的存在原因，彩带存在于一个特殊的位置上，太阳的中性氢原子穿过银河系的磁场，中性原子不受磁场的影响，使得该过程中的运行方向仍然保持原有指向。\n	&lt;/p&gt;\n	&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n		&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 科学家认为，新的理论嵌入了太阳系边缘波动以及磁场震动的因子，使得这些粒子被困于一个环形区域中。科学家认为其中还隐藏了太阳系磁场与银河系磁场的关系，如果这一理论是正确的，太阳系边界的环形色带将告诉我们星际介质与磁场的作用关系，以及这些磁场是如何影响我们的空间环境。\n	&lt;/p&gt;\n&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;', '6', '20', null, '2014-08-30 20:44:26', '2014-08-30 20:44:26', null, null, '2014-09-10 23:26:52', null, '13', '0');
INSERT INTO `t_bbs` VALUES ('2', null, '1', '阿三，你又来胡思乱想了，药不能停啊！！！还挺有意思~', '&lt;pre&gt;阿三，你又来胡思乱想了，药不能停啊！！！还挺有意思~&lt;/pre&gt;', null, '0', null, '2014-08-30 20:46:03', null, null, null, null, '1', '0', '0');
INSERT INTO `t_bbs` VALUES ('3', null, '1', '阿三，你又来胡思乱想了，药不能停啊！！！还挺有意思~', '&lt;pre&gt;阿三，你又来胡思乱想了，药不能停啊！！！还挺有意思~&lt;/pre&gt;', null, '20', null, '2014-08-30 21:12:49', null, null, null, null, '1', '0', '0');
INSERT INTO `t_bbs` VALUES ('4', null, '1', '阿三，你又来胡思乱想了，药不能停啊！！！还挺有意思~', '&lt;strong&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;阿三，你又来胡思乱想了，药不能停啊！！！还挺有意思~&lt;/span&gt;&lt;/strong&gt;', null, '0', null, '2014-08-30 21:16:48', null, null, null, null, '1', '0', '0');
INSERT INTO `t_bbs` VALUES ('5', null, '1', '&lt;img src=&quot;/eds/Public/kindeditor-4.1.10/attached/image/20140830/20140830154027_16871.jpg&quot; alt=&quot;&quot; /&gt;', '&lt;div style=&quot;text-align:center;&quot;&gt;\n	&lt;span style=&quot;font-family:NSimSun;line-height:1.5;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-family:NSimSun;font-size:24px;&quot;&gt;&lt;img src=&quot;/eds/Public/kindeditor-4.1.10/attached/image/20140830/20140830154027_16871.jpg&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\n&lt;/div&gt;', null, '10', null, '2014-08-30 21:40:33', null, null, null, null, '1', '0', '0');
INSERT INTO `t_bbs` VALUES ('6', '罕见超长伽玛射线暴 或源于神秘大质量恒星', '1', '【科技讯】8月29日消息，据媒体报道，伽玛射线暴被认为是宇宙中最强大的爆炸之一，大部分的伽玛射线暴在一分钟左右，科学家提出的新型伽玛暴可持续几个小时。英国研究小组通过观测提出了一种新型伽玛射线暴理论，', '&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp;【&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科技&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;讯】8月29日消息，据媒体报道，伽玛射线暴被认为是宇宙中最强大的爆炸之一，大部分的伽玛射线暴在一分钟左右，&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;家提出的新型伽玛暴可持续几个小时。英国研究小组通过观测提出了一种新型伽玛射线暴理论，其形成于质量更大的超巨星。&lt;/span&gt;\n&lt;/p&gt;\n&lt;p style=&quot;text-align:center;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;img src=&quot;/eds/Public/kindeditor-4.1.10/attached/image/20140830/20140830155625_89689.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;\n	&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n		&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 宇宙中存在的大质量恒星，该型恒星的“燃烧”速度非常快，其寿命很短，可形成能量异常高的伽玛射线。&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;家小组观测到不寻常的新型伽玛暴，超长伽玛暴的红移值达到0.847，大约在70亿光年左右，认为其爆炸产生于超巨星，一种质量达到太阳质量20倍以上的天体，爆发瞬间可变成宇宙中最大最亮的恒星之一，半径可达到太阳的1000倍左右。\n	&lt;/p&gt;\n	&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n		&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 恒星演化的最后阶段，其自身会在引力作用下坍缩形成一个黑洞，当物质被吸入黑洞时，会在两个垂直方向上形成伽玛射线喷流，其速度可接近光速，一般情况下这个伽玛射线暴仅会持续数秒，发现的恒星质量较大，形成伽玛射线喷流的持续时间也较长。\n	&lt;/p&gt;\n&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;', '2', '30', null, '2014-08-30 21:56:30', '2014-08-30 21:56:30', null, null, null, null, '0', '0');
INSERT INTO `t_bbs` VALUES ('7', '试试看', '1', '好吧，我就试试看看而发生大法师打发斯蒂芬', '&lt;div style=&quot;text-align:center;&quot;&gt;\n	&lt;span style=&quot;line-height:1.5;&quot;&gt;好吧，我就试试&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;看看而发生大法师打发斯蒂芬&lt;/span&gt;\n&lt;/div&gt;', '1', '10', null, '2014-08-30 22:42:55', '2014-09-10 22:47:54', null, null, '2014-09-10 23:27:25', null, '0', '0');
INSERT INTO `t_bbs` VALUES ('8', '按时打算', '1', '阿瑟大声道v24534', '阿瑟大声道v24534', '3', '30', null, '2014-09-10 22:01:23', '2014-09-10 22:40:32', null, null, null, null, '0', '0');
INSERT INTO `t_bbs` VALUES ('9', '我就发个帖', '1', '好久没有发帖了 看看这个功能有木有受影响', '好久没有发帖了 看看这个功能有木有受影响', '1', '10', null, '2014-09-11 22:52:03', '2014-09-11 22:52:03', null, null, null, null, '0', '0');
INSERT INTO `t_bbs` VALUES ('10', null, '1', '看来是没有咦', '看来是没有咦', null, '10', null, '2014-09-11 22:54:30', null, null, null, null, '9', '0', '0');
INSERT INTO `t_bbs` VALUES ('11', null, '1', '这楼层怎么算', '这楼层怎么算', null, '10', null, '2014-09-11 22:54:45', null, null, null, null, '9', '0', '0');

-- ----------------------------
-- Table structure for `t_college`
-- ----------------------------
DROP TABLE IF EXISTS `t_college`;
CREATE TABLE `t_college` (
  `gid` varchar(10) NOT NULL COMMENT '学校代号，创建者赋值',
  `gname` varchar(30) NOT NULL,
  `gprovince` int(11) DEFAULT NULL COMMENT '学校所在省份，引用自字典表dic_province',
  `gcity` int(11) NOT NULL COMMENT '学校所在城市，引用自字典表dic_city',
  `gsummary` text COMMENT '学校简介，用于列表展示时的文字说明',
  `gprofile` text NOT NULL COMMENT '学校简介',
  `gstate` int(11) NOT NULL COMMENT '状态：0-编辑中，1-审核中，2-被退回，3-发布，引用自字典表gstate',
  `gcreate_time` datetime NOT NULL COMMENT '在本系统中的创建时间/加入拔尖计划时间',
  `glogo` varchar(250) DEFAULT NULL COMMENT '学校logo，用于列表展示的左侧',
  `gflag` varchar(250) DEFAULT NULL COMMENT '学校标志性图片，用于列表展示的右侧',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_college
-- ----------------------------
INSERT INTO `t_college` VALUES ('NJU', '南京大学', '1', '1', '亲爱的各位同学，相信你们在高中的时候就听说过“钱学森之问”，这是大师生前的疑问，不解“为什么我们的学校总是培养不出杰出人才？”而你们肯定也经常听到很多人议论：为什么中国一直拿不到诺贝尔奖？面对这些问题和困惑，我们国家也在思考，也在努力，也在想办法，希望能够培养出世界一流人才，培养出大师级人物。教育部正是在这个背景下出台了“基础学科拔尖学生培养计划”，希望率先在物理学、化学、数学、生物学、计算机科学等五个基础学科领域配备一流的师资，创造一流的条件，开辟绿色通道，培养出一流的科学家！ \r\n				', '亲爱的各位同学，相信你们在高中的时候就听说过“钱学森之问”，这是大师生前的疑问，不解“为什么我们的学校总是培养不出杰出人才？”而你们肯定也经常听到很多人议论：为什么中国一直拿不到诺贝尔奖？\r\n　　面对这些问题和困惑，我们国家也在思考，也在努力，也在想办法，希望能够培养出世界一流人才，培养出大师级人物。教育部正是在这个背景下出台了“基础学科拔尖学生培养计划”，希望率先在物理学、化学、数学、生物学、计算机科学等五个基础学科领域配备一流的师资，创造一流的条件，开辟绿色通道，培养出一流的科学家！ \r\n　　该计划首先在全国十余所高校推行，而我们南京大学即是其中之一。这也就意味着，刚跨入南大的各位同学将有机会进入这个计划，追逐自己攀登科学顶峰的梦想，成为解答“钱学森之问”的关键人物！\r\n 那么，南京大学开展这个计划有何优势？ \r\n　　“基础学科拔尖学生培养计划”主要是在基础学科领域开展的，而我们最大的特点即在于基础学科领域的雄厚实力和培养基础学科人才的悠久历史。\r\n　　目前，南京大学在理工科基础学科领域有7个一级学科国家重点学科和9个理科基础学科人才培养基地，实力超群，成绩斐然。尤其是匡亚明学院强化部（大理科班），它作为国家理科基础学科人才培养基地中唯一的多学科综合点，两次获得了国家级教学成果一等奖，它所创造和推行的大理科人才培养模式被北大、复旦等其他高校效仿，成为基础学科人才培养的重要模式之一。可以说，南京大学重视基础学科建设和基础学科人才培养所累积的丰富经验和底子，为这个计划的推行奠定了非常深厚的基础。\r\n 接着，可能你还想知道，南大如何开展这项计划呢？ \r\n　　简而言之，南京大学将以理科基础学科人才培养基地为基础，在物理学、化学、数学、生物学、计算机科学、天文学六个学科开展“拔尖计划”。学校将对进入“拔尖计划”的学生前两年实施大理科人才培养模式，为学生打下宽厚扎实的基础，后两年进行“精而深”的专业培养。\r\n　　可能你还想进一步追问，“我进了拔尖计划后有可以享受到何种权利呢？”\r\n \r\n　　首先，你将享有专门的导师指导。学校会按照师生比不低于1:5的比例为每位学生配备品德兼优的学术导师，院士、长江学者、杰出青年基金获得者都很可能成为你今后的导师，他们将不再是你原先觉得遥不可及的或者“传说中的人物”，他们将成为你学术上的引领者，带你走进科研的殿堂，你在学术上遇到什么困惑也可以随时向他们去请教。\r\n　　其次，你可以在导师的指导下，根据自己的特长和爱好来决定上哪些课。你可以进行跨年级、跨学科选课，部分课程可以免修，高年级阶段还能选修研究生课程。\r\n　　而在考核方面，你也不用对经历了十几年的考试心存阴影。我们不会单纯地看你考分，而是推行“柔性评估”，强调你在学习、研究过程中体现出来的创新性和发展潜力、你发现问题和解决问题的能力。我们提倡快乐学习，灵活考核。考核的内容以实验考核、科研课题考核为主，考核形式多种多样。\r\n　　你还有机会获得各种奖助学金，免除你生活的后顾之忧。学校专门设立了“基础学科拔尖英才助学金”、“基础学科拔尖英才奖学金”、“基础学科拔尖英才创造力专项奖”，每年根据同学们的考核表现，奖励当年度的杰出学生。\r\n　　除此之外，你还可以优先享受海外学习、境外实践、学术会议等国际交流机会，你还可以优先获得直博的机会，提前进入实验室……\r\n　　看到这里，你可能已经怦然心动，希望能够加入这个充满巨大诱惑力的计划。那么，请来教务处主页瞧一瞧。我们热忱欢迎每一位有志于基础学科研究同学申请加入“拔尖计划”，我们诚意协助你追逐自己的科学梦想！', '30', '2014-08-30 16:32:15', '/assets/image/glogo_nju.png', '/assets/image/gflag_nju.png');

-- ----------------------------
-- Table structure for `t_course`
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `fid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `fcollege` int(11) NOT NULL COMMENT '开课学校',
  `fgrade` int(11) NOT NULL COMMENT '课程面向年级，引用自字典表dic_grade',
  `fterm` int(11) NOT NULL COMMENT '开课学期，引用自字典表fterm',
  `faddr` varchar(50) DEFAULT NULL COMMENT '上课地点',
  `fcreator` int(11) NOT NULL COMMENT '课程创建者',
  `flast_edited_time` datetime NOT NULL,
  `fcreated_time` datetime NOT NULL COMMENT '被创建时间',
  `fstate` int(11) NOT NULL,
  `fflag` varchar(250) DEFAULT NULL COMMENT '课程图标',
  `fteacher` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('1', '物理力学', '1', '2014', '1', '仙一教学楼233', '1', '2014-09-16 23:03:43', '2014-09-11 20:17:19', '10', null, '吴教授');
INSERT INTO `t_course` VALUES ('2', '物理力学2', '1', '2014', '2', '仙二教学楼207', '1', '2014-09-11 23:03:07', '2014-09-11 20:33:47', '20', null, '张教授');
INSERT INTO `t_course` VALUES ('3', '高等数学', '0', '2014', '2', '系楼233', '1', '2014-09-11 23:11:09', '2014-09-11 22:18:00', '10', null, '王老师');
INSERT INTO `t_course` VALUES ('4', '高等数学1', '0', '2015', '1', '仙二教学楼302', '1', '2014-09-11 22:25:07', '2014-09-11 22:25:07', '10', null, '李老师');
INSERT INTO `t_course` VALUES ('5', '课程三', '0', '2015', '2', '大法师打发', '1', '2014-09-11 22:50:53', '2014-09-11 22:33:16', '30', null, '老师');

-- ----------------------------
-- Table structure for `t_courseware`
-- ----------------------------
DROP TABLE IF EXISTS `t_courseware`;
CREATE TABLE `t_courseware` (
  `eid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eattr` int(11) NOT NULL COMMENT '类型：0-网络课程，1-图书馆，2-课件，引用自字典表eattr',
  `etitle` varchar(50) NOT NULL,
  `esummary` text,
  `econtent` text COMMENT '课件介绍/内容',
  `eflag` varchar(250) DEFAULT NULL COMMENT '标志图片',
  `eauthor_name` varchar(100) DEFAULT NULL,
  `elevel` varchar(20) DEFAULT NULL COMMENT '作者职称，网络课程需要此字段，因为网络课程的author信息一般不在本系统中',
  `eauthor_college` varchar(100) DEFAULT NULL COMMENT '作者所在学校，网络课程需要此字段',
  `eauthor_photo` varchar(250) DEFAULT NULL,
  `escan_count` int(11) NOT NULL DEFAULT '0' COMMENT '被查看次数',
  `edownload_count` int(11) NOT NULL DEFAULT '0' COMMENT '被下载次数',
  `epath` varchar(250) DEFAULT NULL COMMENT '下载路径',
  `etype` int(11) DEFAULT NULL COMMENT '课件类别，公共课件有效，引用自字典表etype',
  `efid` int(11) DEFAULT NULL COMMENT '课件所属课程，仅用于非公共课件，引用自f表',
  `ecreated_time` datetime DEFAULT NULL COMMENT '创建时间',
  `elast_edited_time` datetime NOT NULL COMMENT '最后编辑时间',
  `estate` int(11) NOT NULL COMMENT '课件状态：10-审核中，20-审核通过，30-退回，引用自字典表estate',
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_courseware
-- ----------------------------
INSERT INTO `t_courseware` VALUES ('1', '0', '标题', '[摘要]美国宇航局马歇尔太空飞行中心的工程师完成了3D打印火箭喷射器的测试，燃烧温度可达到3315摄氏度，展示了3D打印技术制造零部件的性能。\n\n\n	&lt;img src=&quot;http://image.te', '&lt;p&gt;\n	&lt;span style=&quot;font-family:Simsun;font-size:14px;line-height:25px;&quot;&gt;[摘要]美国宇航局马歇尔太空飞行中心的工程师完成了3D打印火箭喷射器的测试，燃烧温度可达到3315摄氏度，展示了3D打印技术制造零部件的性能。&lt;/span&gt;\n&lt;/p&gt;\n&lt;p style=&quot;text-align:center;&quot;&gt;\n	&lt;span style=&quot;font-family:Simsun;font-size:14px;line-height:25px;&quot;&gt;&lt;img src=&quot;http://image.techweb.com.cn/upload/roll/2014/08/31/201408315579_6696.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;font-family:Simsun;font-size:14px;line-height:25px;&quot;&gt;\n	&lt;p style=&quot;text-indent:2em;font-size:14px;font-family:Simsun;&quot;&gt;\n		腾讯科学讯 据国外媒体报道，美国宇航局的工程师们刚刚完成了3D打印火箭喷射器的测试，本项研究在于提高火箭发动机某个组件的性能，由于喷射器内液态氧和气态氢一起混合反应，这里的燃烧温度可达到6000华氏度，大约为3315摄氏度，可产生2万磅的推力，约为9吨左右，验证了3D打印技术在火箭发动机制造上的可行性。本项测试工作位于阿拉巴马亨茨维尔的美国宇航局马歇尔太空飞行中心，这里拥有较为完善的火箭发动机测试条件，工程师可验证3D打印部件在点火环境中的性能。\n	&lt;/p&gt;\n	&lt;p style=&quot;text-indent:2em;font-size:14px;font-family:Simsun;&quot;&gt;\n		制造火箭发动机的喷射器需要精度较高的加工技术，如果使用3D打印技术，就可以降低制造上的复杂程度，在计算机中建立喷射器的三维图像，打印的材料为金属粉末和激光，在较高的温度下，金属粉末可被重新塑造成我们需要的样子。火箭发动机中的喷射器内有数十个喷射元件，要建造大小相似的元件需要一定的加工精度，该技术测试成功后将用于制造RS-25发动机，其作为美国宇航局未来太空发射系统的主要动力，该火箭可运载宇航员超越近地轨道，进入更遥远的深空。\n	&lt;/p&gt;\n	&lt;p style=&quot;text-indent:2em;font-size:14px;font-family:Simsun;&quot;&gt;\n		马歇尔中心的工程部主任克里斯认为3D打印技术在火箭发动机喷油器上应用只是第一步，我们的目的在于测试3D打印部件如何能彻底改变火箭的设计与制造，并提高系统的性能，更重要的是可以节省时间和成本，不太容易出现故障。本次测试中，两具火箭喷射器进行了点火，每次5秒，设计人员创建的复杂几何流体模型允许氧气和氢气充分混合，压力为每平方英寸1400磅。美国宇航局还与其他公司进行合作，比如位于得克萨斯州的制造商，其目的在于建立3D打印火箭发动机部件的标准和制造工艺。\n	&lt;/p&gt;\n	&lt;p style=&quot;text-indent:2em;font-size:14px;font-family:Simsun;&quot;&gt;\n		可以预见，3D打印技术除了应用于制造火箭发动机部件外，还可用于制造其他航天器组件，其特点是快速建造，几乎所有的航天器部件都可以被3D打印，这就减少了一些设计上的风险，并有效控制项目成本。（罗辑/编译）\n	&lt;/p&gt;\n&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;', '/image/2014_08_31_12_32_27_2054952973.png', '作者', '职称', '学校', '/image/2014_08_31_12_32_32_733543381.png', '0', '0', null, null, null, null, '2014-08-31 12:35:56', '20');
INSERT INTO `t_courseware` VALUES ('2', '0', '标题', '据科学家估计，在距离地球不超过60光年的范围内存在很多潜在的可居行星，其数量超过了2000多颗。\nn\nn 门罗是美国宇航局前机器人学家，他利用现有数据，直观表达出这些潜在的可居行星的大小和数量。地球位', '&lt;span style=&quot;font-size:14px;&quot;&gt;据科学家估计，在距离地球不超过60光年的范围内存在很多潜在的可居行星，其数量超过了2000多颗。&lt;/span&gt;&lt;br /&gt;\nn&lt;br /&gt;\nn&lt;span style=&quot;font-size:14px;&quot;&gt; 门罗是美国宇航局前机器人学家，他利用现有数据，直观表达出这些潜在的可居行星的大小和数量。地球位于信息图的中心，提供一个尺度感，所有这些行星都是根据近似大小的原则组织在一起的。虽然它无法提供一个距离感或者是位置感，但是这张信息图显示，外星生命可能并不像我们想象的距离人类那么遥远。&lt;/span&gt;&lt;br /&gt;\nn&lt;br /&gt;\nn&lt;span style=&quot;font-size:14px;&quot;&gt; 科学家利用开普勒望远镜收集的数据进行研究，该望远镜在4年时间里，每隔30分钟就为15万颗恒星拍照一次。然后对这些图片中的恒星光的微小，但是非常有规律的突然下降进行分析，这是一颗行星从这颗恒星前方飞过的确凿证据。&lt;/span&gt;&lt;br /&gt;\nn&lt;br /&gt;\nn&lt;span style=&quot;font-size:14px;&quot;&gt; 它观测的恒星中大约有4.2万颗与我们的太阳温度一样，或者稍低一些，科学家在这些恒星周围发现603颗行星。其中有十几颗是类地行星，即与我们的地球大小差不多，而且位于恒星的合适位置，它距离主星既不太远，也不太近，正好适合生命生存。&lt;/span&gt;&lt;br /&gt;\nn&lt;br /&gt;\nn&lt;span style=&quot;font-size:14px;&quot;&gt; 排除数据中存在的错误后，据他们估计，在像太阳的所有恒星中，有22%拥有一颗适合生命生存的行星。美国夏威夷大学的霍华德博士说：“在我们的星系中有400亿个机会可供生命诞生和演变。现在可供我们寻找智能生命的目标比以往任何时候都更多。”&lt;/span&gt;&lt;br /&gt;', '/image/2014_08_31_11_58_17_236201045.png', '教授：Larry Randles', '诺贝尔奖得主', '斯坦福大学', '/image/2014_08_31_12_07_36_497259074.png', '0', '0', null, null, null, null, '2014-08-31 12:31:23', '0');
INSERT INTO `t_courseware` VALUES ('3', '20', 'AjaxFileUploaderV2.1', null, 'AjaxFileUploaderV2.1AjaxFileUploaderV2.1AjaxFileUploaderV2.1AjaxFileUploaderV2.1AjaxFileUploaderV2.1AjaxFileUploaderV2.1AjaxFileUploaderV2.1AjaxFileUploaderV2.1', null, null, null, null, null, '0', '0', '/pi/2014_08_31_14_48_14_834946616.zip', null, null, '2014-08-31 14:50:09', '2014-08-31 15:01:22', '20');
INSERT INTO `t_courseware` VALUES ('4', '20', '更新的图片', null, '这里面是更新的图片这里面是更新的图片', null, null, null, null, null, '0', '0', '/pi/2014_08_31_15_12_34_550220040.zip', null, null, '2014-08-31 15:12:48', '2014-08-31 15:13:17', '20');
INSERT INTO `t_courseware` VALUES ('5', '20', '图标', null, '这里是一些图标', null, null, null, null, null, '0', '0', '/pi/2014_08_31_15_13_42_1661736225.zip', null, null, '2014-08-31 15:14:02', '2014-08-31 15:14:02', '20');
INSERT INTO `t_courseware` VALUES ('6', '30', 'easyuichm', 'easyuichm.zip', 'easyuichm.zip', null, null, null, null, null, '0', '0', '/cw/2014_09_13_11_35_22_1868685495.zip', null, '1', '2014-09-13 11:35:23', '2014-09-13 12:34:45', '20');
INSERT INTO `t_courseware` VALUES ('7', '30', 'database_03_2', 'database_03_2.ppt', 'database_03_2.ppt', null, null, null, null, null, '0', '0', '/cw/2014_09_13_12_01_23_885878773.ppt', null, '1', '2014-09-13 12:01:25', '2014-09-13 12:37:36', '20');
INSERT INTO `t_courseware` VALUES ('8', '30', 'ExtJs2.0学习系列', 'ExtJs2.0学习系列.pdf', 'ExtJs2.0学习系列.pdf', null, null, null, null, null, '0', '0', '/cw/2014_09_13_12_03_05_753270438.pdf', null, '1', '2014-09-13 12:03:06', '2014-09-16 23:04:26', '40');
INSERT INTO `t_courseware` VALUES ('9', '30', '数据库第三章第2节', 'database_03_2.ppt', 'database_03_2.ppt', null, null, null, null, null, '0', '0', '/cw/2014_09_16_23_05_15_506659704.ppt', null, '1', '2014-09-16 23:05:16', '2014-09-16 23:05:16', '20');

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
INSERT INTO `t_dic` VALUES ('0', 'eattr', '网络课程', null);
INSERT INTO `t_dic` VALUES ('0', 'fstate', '编辑中', null);
INSERT INTO `t_dic` VALUES ('0', 'gstate', '编辑中', null);
INSERT INTO `t_dic` VALUES ('0', 'rrole', '系统', null);
INSERT INTO `t_dic` VALUES ('0', 'rstate', '正常', null);
INSERT INTO `t_dic` VALUES ('0', 'tstate', '编辑中', null);
INSERT INTO `t_dic` VALUES ('0', 'uchar', '其他', null);
INSERT INTO `t_dic` VALUES ('0', 'usender', '未知', null);
INSERT INTO `t_dic` VALUES ('0', 'zstate', '编辑中', null);
INSERT INTO `t_dic` VALUES ('0', 'zsub_type', '中国科学网', '0');
INSERT INTO `t_dic` VALUES ('0', 'ztype', '资讯', null);
INSERT INTO `t_dic` VALUES ('1', 'dic_city', '南京市', '1');
INSERT INTO `t_dic` VALUES ('1', 'dic_province', '江苏省', null);
INSERT INTO `t_dic` VALUES ('1', 'etype', '物理力学', '1');
INSERT INTO `t_dic` VALUES ('1', 'fterm', '2014-2015年秋季（第一）学期', '2014');
INSERT INTO `t_dic` VALUES ('1', 'zsub_type', 'Science专区', '0');
INSERT INTO `t_dic` VALUES ('1', 'ztype', '活动', null);
INSERT INTO `t_dic` VALUES ('2', 'fterm', '2014-2015年春季（第二）学期', '2014');
INSERT INTO `t_dic` VALUES ('2', 'zsub_type', 'Nature专区', '0');
INSERT INTO `t_dic` VALUES ('3', 'zsub_type', '拔尖计划专区', '0');
INSERT INTO `t_dic` VALUES ('3', 'ztype', '成果', null);
INSERT INTO `t_dic` VALUES ('4', 'ztype', '通知', null);
INSERT INTO `t_dic` VALUES ('5', 'ztype', '交流札记', null);
INSERT INTO `t_dic` VALUES ('6', 'ztype', '留学动态', null);
INSERT INTO `t_dic` VALUES ('9', 'ztype', '交换项目', null);
INSERT INTO `t_dic` VALUES ('10', 'eattr', '物理图书馆', null);
INSERT INTO `t_dic` VALUES ('10', 'estate', '审核中', null);
INSERT INTO `t_dic` VALUES ('10', 'fstate', '已发布', null);
INSERT INTO `t_dic` VALUES ('10', 'gstate', '审核中', null);
INSERT INTO `t_dic` VALUES ('10', 'rrole', '超级管理员', null);
INSERT INTO `t_dic` VALUES ('10', 'rstate', '登录受限', null);
INSERT INTO `t_dic` VALUES ('10', 'tstate', '已发布', null);
INSERT INTO `t_dic` VALUES ('10', 'usender', '女', null);
INSERT INTO `t_dic` VALUES ('10', 'zstate', '提交/审核中', null);
INSERT INTO `t_dic` VALUES ('20', 'eattr', '公共课件', null);
INSERT INTO `t_dic` VALUES ('20', 'estate', '审核通过', null);
INSERT INTO `t_dic` VALUES ('20', 'fstate', '已关闭', null);
INSERT INTO `t_dic` VALUES ('20', 'gstate', '被退回', null);
INSERT INTO `t_dic` VALUES ('20', 'rrole', '普通管理员', null);
INSERT INTO `t_dic` VALUES ('20', 'rstate', '已删除', null);
INSERT INTO `t_dic` VALUES ('20', 'tstate', '置顶', null);
INSERT INTO `t_dic` VALUES ('20', 'usender', '男', null);
INSERT INTO `t_dic` VALUES ('20', 'zstate', '被退回', null);
INSERT INTO `t_dic` VALUES ('30', 'eattr', '内部课件', null);
INSERT INTO `t_dic` VALUES ('30', 'estate', '被退回', null);
INSERT INTO `t_dic` VALUES ('30', 'fstate', '已删除', null);
INSERT INTO `t_dic` VALUES ('30', 'gstate', '发布', null);
INSERT INTO `t_dic` VALUES ('30', 'rrole', '老师', null);
INSERT INTO `t_dic` VALUES ('30', 'tstate', '被删除', null);
INSERT INTO `t_dic` VALUES ('30', 'zstate', '已发布', null);
INSERT INTO `t_dic` VALUES ('35', 'rrole', '助教', null);
INSERT INTO `t_dic` VALUES ('40', 'estate', '已下架', null);
INSERT INTO `t_dic` VALUES ('40', 'fstate', '已被管理员屏蔽', null);
INSERT INTO `t_dic` VALUES ('40', 'gstate', '关闭', null);
INSERT INTO `t_dic` VALUES ('40', 'rrole', '学生', null);
INSERT INTO `t_dic` VALUES ('40', 'tstate', '被屏蔽', null);
INSERT INTO `t_dic` VALUES ('40', 'zstate', '置顶', null);
INSERT INTO `t_dic` VALUES ('50', 'tstate', '被管理员删除', null);
INSERT INTO `t_dic` VALUES ('50', 'uchar', '学士', null);
INSERT INTO `t_dic` VALUES ('50', 'zstate', '已屏蔽', null);
INSERT INTO `t_dic` VALUES ('60', 'uchar', '硕士', null);
INSERT INTO `t_dic` VALUES ('60', 'zstate', '已删除', null);
INSERT INTO `t_dic` VALUES ('70', 'uchar', '博士', null);
INSERT INTO `t_dic` VALUES ('80', 'uchar', '讲师', null);
INSERT INTO `t_dic` VALUES ('90', 'uchar', '副教授', null);
INSERT INTO `t_dic` VALUES ('100', 'uchar', '教授', null);
INSERT INTO `t_dic` VALUES ('2009', 'fgrade', '2009级', null);
INSERT INTO `t_dic` VALUES ('2010', 'fgrade', '2010级', null);
INSERT INTO `t_dic` VALUES ('2011', 'fgrade', '2011级', null);
INSERT INTO `t_dic` VALUES ('2012', 'fgrade', '2012级', null);
INSERT INTO `t_dic` VALUES ('2013', 'fgrade', '2013级', null);
INSERT INTO `t_dic` VALUES ('2014', 'fgrade', '2014级', null);
INSERT INTO `t_dic` VALUES ('2015', 'fgrade', '2015级', null);
INSERT INTO `t_dic` VALUES ('2016', 'fgrade', '2016级', null);
INSERT INTO `t_dic` VALUES ('2017', 'fgrade', '2017级', null);
INSERT INTO `t_dic` VALUES ('2018', 'fgrade', '2018级', null);
INSERT INTO `t_dic` VALUES ('2019', 'fgrade', '2019级', null);
INSERT INTO `t_dic` VALUES ('2020', 'fgrade', '2020级', null);

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
  `mpcreate_plan_project` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权创建拔尖计划成果',
  `mpedit_league_college` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权编辑本校高校联盟简介',
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_manager` VALUES ('11', '20', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_manager` VALUES ('12', '21', '1', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_manager` VALUES ('13', '22', '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '0', '0', '1', '1', '0', '0');

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
  `rhead_photo` varchar(250) NOT NULL COMMENT '头像',
  `rlast_lgid` int(11) NOT NULL COMMENT '上次登录id，引用自lg表，默认0',
  `rstate` int(11) NOT NULL COMMENT '账号状态：0-正常，10-禁止登录，引用自字典表rstate',
  `rrole` int(11) NOT NULL COMMENT '账号角色：0-系统，10-超管，20-普管，30-老师，40-学生，引用 自字典表rrole',
  `rshield_role` int(11) DEFAULT NULL COMMENT '被禁止的角色：0-系统，1-超管，2-普管，引用自字典表rrole',
  `rshielded_time` datetime DEFAULT NULL COMMENT '被禁止登录时间',
  `rshielded_type` int(11) DEFAULT NULL COMMENT '被禁止登录的类型：0-一天，1-一周，2-一个月，3-一年，4-永久，引用自字典表rshielded_type',
  `rlast_edited_time` datetime DEFAULT NULL,
  `rcreated_time` datetime DEFAULT NULL,
  `rshielded_tick` int(11) DEFAULT NULL COMMENT '被禁止的时长，以秒为单位',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_register
-- ----------------------------
INSERT INTO `t_register` VALUES ('1', 'system', '10470c3b4b1fed12c3baac014be15fac67c6e815', '系统管理员', '/assets/image/headphoto/default.png', '0', '0', '0', null, null, null, null, '2014-08-31 19:34:13', null);
INSERT INTO `t_register` VALUES ('20', 's1234', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', 'nick', '/assets/image/headphoto/default.png', '0', '0', '20', null, null, null, '2014-08-31 21:14:30', '2014-08-31 20:11:06', null);
INSERT INTO `t_register` VALUES ('21', 's', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '', '/assets/image/headphoto/default.png', '0', '0', '20', null, null, null, '2014-08-31 21:00:55', '2014-08-31 21:00:55', null);
INSERT INTO `t_register` VALUES ('22', 's123', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '任人人', '/assets/image/headphoto/default.png', '0', '0', '20', null, null, null, '2014-08-31 21:30:45', '2014-08-31 21:30:45', null);
INSERT INTO `t_register` VALUES ('23', 'NJU123', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '张三', '/assets/image/headphoto/default.png', '0', '0', '30', null, null, null, '2014-09-10 19:50:25', '2014-09-06 14:13:20', null);
INSERT INTO `t_register` VALUES ('28', 'NJU100', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '李四', '/assets/image/headphoto/default.png', '0', '0', '30', null, null, null, '2014-09-10 20:00:27', '2014-09-10 20:00:27', null);
INSERT INTO `t_register` VALUES ('29', 'NJU10', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '王五', '/assets/image/headphoto/default.png', '0', '10', '30', null, null, null, '2014-09-10 20:34:53', '2014-09-10 20:12:07', null);
INSERT INTO `t_register` VALUES ('30', 'TA201409131608432747', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名', '/assets/image/headphoto/default.png', '0', '10', '35', null, null, null, '2014-09-13 16:08:43', '2014-09-13 16:08:43', null);
INSERT INTO `t_register` VALUES ('31', 'TA201409131611124448', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名', '/assets/image/headphoto/default.png', '0', '0', '35', null, null, null, '2014-09-13 16:11:12', '2014-09-13 16:11:12', null);
INSERT INTO `t_register` VALUES ('32', 'TA201409131613271921', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名', '/assets/image/headphoto/default.png', '0', '0', '35', null, null, null, '2014-09-13 16:13:27', '2014-09-13 16:13:27', null);
INSERT INTO `t_register` VALUES ('33', 'TA201409131614036380', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名', '/assets/image/headphoto/default.png', '0', '20', '35', null, null, null, '2014-09-13 16:14:03', '2014-09-13 16:14:03', null);
INSERT INTO `t_register` VALUES ('34', 'TA201409131618208587', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名', '/assets/image/headphoto/default.png', '0', '20', '35', null, null, null, '2014-09-13 16:18:20', '2014-09-13 16:18:20', null);
INSERT INTO `t_register` VALUES ('35', 'TA201409131633387607', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名', '/assets/image/headphoto/default.png', '0', '20', '35', null, null, null, '2014-09-13 16:33:38', '2014-09-13 16:33:38', null);
INSERT INTO `t_register` VALUES ('36', 'TA201409131636416765', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名', '/assets/image/headphoto/default.png', '0', '0', '35', null, null, null, '2014-09-13 16:36:41', '2014-09-13 16:36:41', null);
INSERT INTO `t_register` VALUES ('37', 'TA201409131654548358', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '张三', '/assets/image/headphoto/default.png', '0', '0', '35', null, null, null, '2014-09-13 16:54:54', '2014-09-13 16:54:54', null);
INSERT INTO `t_register` VALUES ('38', 'TA201409131733395301', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名', '/assets/image/headphoto/default.png', '0', '0', '35', null, null, null, '2014-09-13 17:33:39', '2014-09-13 17:33:39', null);

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
  `pid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prid` int(11) NOT NULL,
  `pfid` int(11) NOT NULL,
  `prole` int(11) NOT NULL COMMENT '课程角色：0-主讲教师，1-“猪脚”，引用自字典表prole',
  `pcreated_time` datetime NOT NULL,
  `plast_edited_time` datetime NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teach
-- ----------------------------
INSERT INTO `t_teach` VALUES ('1', '37', '1', '1', '2014-09-13 18:01:11', '2014-09-13 18:01:11');

-- ----------------------------
-- Table structure for `t_topic`
-- ----------------------------
DROP TABLE IF EXISTS `t_topic`;
CREATE TABLE `t_topic` (
  `cid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  `cpic` varchar(250) DEFAULT NULL,
  `cstate` int(11) NOT NULL COMMENT '状态：0-编辑中，1-发布，2-关闭，引用自字典表cstate',
  `cshielded_time` datetime DEFAULT NULL,
  `cshielder` int(11) DEFAULT NULL,
  `ccreated_time` datetime NOT NULL,
  `creleased_time` datetime DEFAULT NULL,
  `cclosed_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_topic
-- ----------------------------
INSERT INTO `t_topic` VALUES ('1', '师生答疑区', 'bbs_nav_1.png', '10', null, null, '2014-08-30 20:53:00', null, null);
INSERT INTO `t_topic` VALUES ('2', '研究讨论区', 'bbs_nav_2.png', '10', null, null, '2014-08-30 20:54:13', null, null);
INSERT INTO `t_topic` VALUES ('3', '书籍推荐区', 'bbs_nav_3.png', '10', null, null, '2014-08-30 20:54:40', null, null);
INSERT INTO `t_topic` VALUES ('4', '课程交流区', 'bbs_nav_4.png', '10', null, null, '2014-08-30 20:55:00', null, null);
INSERT INTO `t_topic` VALUES ('5', 'idea狂想区', 'bbs_nav_5.png', '10', null, null, '2014-08-30 20:55:40', null, null);
INSERT INTO `t_topic` VALUES ('6', '谈天说地区', 'bbs_nav_6.png', '10', null, null, '2014-08-30 20:56:00', null, null);

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `urid` int(11) NOT NULL COMMENT '登录账号，外键引用自r表',
  `uchar` int(11) NOT NULL COMMENT '职称：0-教授，1-副教授，2-讲师，3-博士，4-硕士，5-学徒/学士，6-其他，引用自字典表uchar',
  `ugid` int(11) NOT NULL COMMENT '学校代号',
  `uno` varchar(20) DEFAULT NULL COMMENT '学工号',
  `uname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `uen_name` varchar(100) DEFAULT NULL COMMENT '英文名',
  `udisplay_name` int(2) DEFAULT NULL COMMENT '显示名：0-uname，1-en_name',
  `usender` int(2) DEFAULT NULL COMMENT '性别，0-男，1-女，引用自字典表usender',
  `ubirthday` date DEFAULT NULL COMMENT '出生日期',
  `uuid` int(11) NOT NULL COMMENT '创建的老师',
  `uemail` varchar(50) DEFAULT NULL,
  `umobile_phone` varchar(16) DEFAULT NULL,
  `utel` varchar(16) DEFAULT NULL,
  `uqq` varchar(16) DEFAULT NULL,
  `uoffice_addr` varchar(100) DEFAULT NULL COMMENT '办公地址',
  `uphoto` varchar(250) DEFAULT NULL COMMENT '照片',
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
  `umanage_student` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权创建学生',
  `udownload_courseware` int(2) NOT NULL DEFAULT '1' COMMENT '是否有权下载[登录才允许下载的]课件',
  `ulast_edited_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '23', '100', '0', 'NJU123', '张三', null, '0', '0', null, '0', null, null, null, null, null, null, '/assets/image/headphoto/default.png', null, null, null, '1', '1', '1', '1', '1', '1', '1', '0', '0', '2014-09-10 19:50:25');
INSERT INTO `t_user` VALUES ('2', '28', '100', '0', '100', '李四', null, '0', '0', null, '0', null, null, null, null, null, null, '/assets/image/headphoto/default.png', null, null, null, '1', '1', '1', '1', '1', '1', '1', '0', '1', '2014-09-10 20:00:27');
INSERT INTO `t_user` VALUES ('3', '29', '70', '0', '10', '王五', null, '0', '0', null, '0', null, null, null, null, null, null, '/assets/image/headphoto/default.png', null, null, null, '1', '1', '1', '1', '1', '1', '1', '0', '0', '2014-09-10 20:34:53');
INSERT INTO `t_user` VALUES ('4', '33', '70', '0', 'TA201409131614036380', '姓名', null, '0', '0', null, '1', null, null, null, null, null, null, '/assets/image/headphoto/default.png', null, null, null, '0', '0', '0', '0', '0', '0', '1', '0', '1', '2014-09-13 16:14:03');
INSERT INTO `t_user` VALUES ('5', '34', '70', '0', 'TA201409131618208587', '姓名', null, '0', '0', null, '1', '邮箱', null, '联系电话', null, '办公室', null, '/assets/image/headphoto/default.png', null, null, null, '0', '0', '0', '0', '0', '0', '1', '0', '1', '2014-09-13 16:18:20');
INSERT INTO `t_user` VALUES ('6', '35', '70', '0', 'TA201409131633387607', '姓名2', null, '0', '0', null, '1', '2343453@ww.com', null, '联系电话2', null, '办公室2', '/image/2014_09_13_17_31_05_1952154255.jpg', '/assets/image/headphoto/default.png', null, null, null, '0', '0', '0', '0', '0', '0', '1', '0', '1', '2014-09-13 16:33:38');
INSERT INTO `t_user` VALUES ('7', '36', '70', '0', 'TA201409131636416765', '姓名', null, '0', '0', null, '1', '邮箱', null, '联系电话', null, '办公室', '', '/assets/image/headphoto/default.png', null, null, null, '0', '0', '0', '0', '0', '0', '1', '0', '1', '2014-09-13 16:36:41');
INSERT INTO `t_user` VALUES ('8', '37', '60', '0', 'TA201409131654548358', '张三', null, '0', '0', null, '1', 'zhangsan@nju.edu.cn', null, '15900001234', null, '系楼233', '/image/2014_09_13_18_25_37_2122758271.png', '/assets/image/headphoto/default.png', null, null, null, '0', '0', '0', '0', '0', '0', '1', '0', '1', '2014-09-13 16:54:54');
INSERT INTO `t_user` VALUES ('9', '38', '70', '0', 'TA201409131733395301', '姓名', null, '0', '0', null, '1', '邮箱', null, '联系电话', null, '办公室', '', '/assets/image/headphoto/default.png', null, null, null, '0', '0', '0', '0', '0', '0', '1', '0', '1', '2014-09-13 17:33:39');

-- ----------------------------
-- Table structure for `t_z`
-- ----------------------------
DROP TABLE IF EXISTS `t_z`;
CREATE TABLE `t_z` (
  `zid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `zcreator` int(11) NOT NULL COMMENT '创建者id，引用自注册表r',
  `zgid` int(11) NOT NULL COMMENT '内容所属学校，一般来说，该值与创建者id所属学校同，但可能后期加入全局管理员，这类管理员不隶属于任何学校',
  `zcreated_time` datetime NOT NULL,
  `zlast_edited_time` datetime NOT NULL,
  `zchecked_time` datetime DEFAULT NULL,
  `zreleased_time` datetime DEFAULT NULL,
  `ztop_time` datetime DEFAULT NULL,
  `ztitle` varchar(50) NOT NULL,
  `zsummary` text COMMENT '简介',
  `zcontent` text NOT NULL,
  `zstate` int(11) NOT NULL COMMENT '状态：0-编辑中，10-提交/审核中，20-被退回，30-发布，40-发布且置顶，50-被屏蔽，60-被删除，引用自字典表zstate',
  `ztype` int(11) NOT NULL COMMENT '类型：0-资讯，1-活动，3-成果，4-通知，5-交流札记，6-留学动态，9-交换项目，引用自字典表ztype',
  `zsub_type` int(11) NOT NULL COMMENT '子类型，对于资讯来说，就是0-中国科学网，1-science专区，2-nature专区，3-拔尖专区，引用自字典表zsub_type',
  `zflag` varchar(250) DEFAULT NULL COMMENT '标志图片',
  `zcheckor` int(11) DEFAULT NULL COMMENT '审核者ID，引用自r表',
  `zscan_count` int(11) NOT NULL DEFAULT '0' COMMENT '被浏览的次数',
  PRIMARY KEY (`zid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_z
-- ----------------------------
INSERT INTO `t_z` VALUES ('1', '1', '0', '2014-08-29 20:19:41', '2014-08-30 10:47:21', null, '2014-08-30 10:44:34', null, 'XX同学研究了什么神呢么', '发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰发顺丰', '&lt;p&gt;\n	&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;/span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;/span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;/span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;/span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;/span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;/span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;/span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;/span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;span&gt;发顺丰&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;em&gt;&lt;/em&gt; \n&lt;/p&gt;', '0', '3', '0', '/image/2014_08_29_22_23_56_1367662390.png', null, '0');
INSERT INTO `t_z` VALUES ('3', '1', '0', '2014-08-30 10:56:29', '2014-08-31 12:00:38', null, '2014-08-30 11:15:35', null, '光速可能没那么快 相对论错了吗', '【科技讯】8月29日消息，据国外媒体报道，爱因斯坦的相对论告诉我们光的速度是宇宙中最快的，而且没有物体的运动速度能超过光速，光在真空中的速度为每秒186282英里，大约为每秒299791公里，来自马里兰大学的研究人员詹姆斯·福兰森博士认为光速可能没有达到这个速度值，真实的光速可能要慢一些，这可能是真', '&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;【&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科技&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;讯】8月29日消息，据国外媒体报道，爱因斯坦的相对论告诉我们光的速度是宇宙中最快的，而且没有物体的运动速度能超过光速，光在真空中的速度为每秒186282英里，大约为每秒299791公里，来自马里兰大学的研究人员詹姆斯·福兰森博士认为光速可能没有达到这个速度值，真实的光速可能要慢一些，这可能是真空的缘故使得光速会变慢一些。福兰森博士还列举了一项研究发现，根据对1987年超新星的观测研究，发现这颗超新星的光子抵达地球的时间慢了4.7个小时。&lt;/span&gt; \n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt; &lt;/span&gt; \n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	如果福兰森博士的研究结论是正确的，那么就意味着我们对光速的认识是错误的，同时也标志着我们以前对太阳系外天体的距离估算都是不准确的，尤其是一些距离银河系非常遥远的宇宙早期星系。爱因斯坦的光速理论已经被世人所接受，早在1905年，爱因斯坦就提出了这个影响人类&lt;a href=&quot;http://www.kejixun.com/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科技&lt;/a&gt;史的物理理论，但是一百多年后马里兰大学博士的研究结论认为真实光速比我们所知的要慢一些。\n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 福兰森博士对SN 1987a超新星进行了研究，试图对恒星爆发后的中微子进行调查，这是一种呈电中性的亚原子粒子，但是抵达地球的时间却晚了4.7个小时。针对这个结论，马里兰大学的物理学家认为光的速度出现变化可能是由于真空极化的问题，该现象与光子被分解成正电子与电子有关，从量子力学的角度上看，在虚粒子对之间还存在引力势，该机制可能造成了光速变慢的现象。\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;&amp;nbsp;如果这一推测是正确的，那么就意味着在16.8万光年上会出现大约5小时的延迟，我们目前对太阳系外天体的距离估算也会进行重新调整，目前福兰森博士的论文已经提交给《新物理学》杂志。根据爱因斯坦的相对论，真空中光速是恒定的，如果一位旅行者以光速移动，那么他可以在一秒内环游赤道7.5圈，相比之下，乘坐喷气式飞机的旅客穿越美国大陆需要4个小时。爱因斯坦的相对论也指出，宇宙中没有任何物体的速度能够超过光速，如果光速确实变慢了，那么太阳系之外的天体距离可能需要重新估算了。&lt;/span&gt; \n&lt;/p&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;', '0', '3', '0', '/image/2014_08_30_11_13_44_927688553.png', null, '0');
INSERT INTO `t_z` VALUES ('4', '1', '0', '2014-08-30 11:18:50', '2014-08-30 11:53:05', null, '2014-08-30 11:53:05', null, '美航空局观察到光逃出了黑洞', '【科技讯】8月30日消息，据国外媒体报道，美国宇航局核频谱望远镜阵列已经观测到超大质量黑洞周围罕见的X射线致密光源，位于黑洞附近，科学家将其称为X射线光冕，这是在黑洞周围出现的极端事件。如图中所示，艺术家绘制了超大质量黑洞周围的辐射环境，强烈的X射线将黑洞周围的时空照得通明，这种辐射来自黑洞周围的吸', '&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;【&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科技&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;讯】8月30日消息，据国外媒体报道，美国宇航局核频谱望远镜阵列已经观测到超大质量黑洞周围罕见的X射线致密光源，位于黑洞附近，&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;家将其称为X射线光冕，这是在黑洞周围出现的极端事件。如图中所示，艺术家绘制了超大质量黑洞周围的辐射环境，强烈的X射线将黑洞周围的时空照得通明，这种辐射来自黑洞周围的吸积盘，&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;家将系统命名为Mrk 335，但其实际的形状到目前为止仍然不是非常清晰。&lt;/span&gt; \n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 来自英国剑桥天文学研究所科学家迈克尔·帕克认为在黑洞的引力作用下，所有光线都被引导向黑洞周围的吸积盘上，一些物质则以螺旋状落入黑洞之中，由于光冕的位置较为靠近黑洞，在黑洞的引力作用下，X射线的行为变得非常怪异，似乎与引力之间产生了拉锯战，结果形成了罕见拉伸状的X射线，虽然这样的事件此前已经被观察过，但从来没有看到如此极端的X射线扭曲现象，而且X射线的细节比此前更加清楚。\n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;超大质量黑洞被认为存在于几乎所有的星系中央附近，有些黑洞的质量更大、旋转速度也比其他黑洞要快得多，本次观测到的黑洞极端行为位于飞马座方向上，距离我们大约3.24亿光年，该黑洞的致密程度相当于将1000万倍的太阳质量集中在30倍太阳直径的空间中，由于其自转速度极快，周围的时空也被拖拽，形成了极端的黑洞周围空间环境。&lt;/span&gt; \n&lt;/p&gt;\n&lt;p style=&quot;text-align:center;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;img src=&quot;/eds/Public/kindeditor-4.1.10/attached/image/20140830/20140830055257_93240.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:22px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;美国宇航局核频谱望远镜阵列通过观测发现，尽管一些光会落入黑洞之中，无法逃脱黑洞的引力控制，但是黑洞仍然可辐射出高能量的“光”，其主要来自光冕和周围被加速至接近光速的物质，虽然科学家不确定光冕的形状和温度，但我们已经知道这些物质粒子的运行速度接近光速。&lt;/span&gt; \n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:22px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;NASA的“雨燕”探测器已经对Mrk 335系统监视了多年，最近发现其X射电亮度出现了有趣的变化，其高能X射线位于3至79千电子伏，这个特殊的能量区间为天文学家提供了较好的观测时机，可以了解到黑洞事件视界边缘所发生的现象，核频谱望远镜阵列的观测表明，Mrk 335黑洞系统光冕区所发出的“光”被黑洞的引力拉回，并投射到致密的物质盘，就好像有人用手电筒照亮了黑洞周围。&lt;/span&gt; \n&lt;/p&gt;', '30', '3', '0', '/image/2014_08_30_11_18_48_1732713233.png', null, '0');
INSERT INTO `t_z` VALUES ('5', '1', '0', '2014-08-30 12:39:09', '2014-08-30 13:02:19', null, null, null, '科学家揭示宇宙起源新解释 或从崩塌中反弹而生', '8月29日消息，据媒体报道，科学家使用南极Bicep2 探测器发现支持宇宙大爆炸的证据的时候，但很多问题慢慢开始浮现出来。这其中不仅包括其精确性，还包括这项发现对科学整体本身究竟具有何种意义。一部分科', '&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;8月29日消息，据媒体报道，科学家&lt;/span&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;使用南极Bicep2 探测器发现支持宇宙大爆炸的证据的时候，但很多问题慢慢开始浮现出来。这其中不仅包括其精确性，还包括这项发现对科学整体&lt;/span&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;本身究竟具有何种意义。一部分科学家指出，其开端可能并非一次大爆炸，而是一次“大反弹”。&lt;/span&gt;', '60', '0', '0', '', null, '0');
INSERT INTO `t_z` VALUES ('6', '1', '0', '2014-08-30 12:39:14', '2014-08-30 13:56:24', null, '2014-08-30 13:56:24', null, '科学家揭示宇宙起源新解释 或从崩塌中反弹而生', '【科技讯】8月29日消息，据媒体报道，科学家使用南极Bicep2 探测器发现支持宇宙大爆炸的证据的时候，但很多问题慢慢开始浮现出来。这其中不仅包括其精确性，还包括这项发现对科学整体本身究竟具有何种意义', '&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;【&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科技&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;讯】8月29日消息，据媒体报道，&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;家使用南极Bicep2 探测器发现支持宇宙大爆炸的证据的时候，但很多问题慢慢开始浮现出来。这其中不仅包括其精确性，还包括这项发现对&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;整体本身究竟具有何种意义。一部分科学家指出，其开端可能并非一次大爆炸，而是一次“大反弹”。&lt;/span&gt;\n&lt;/p&gt;\n&lt;p style=&quot;text-align:center;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;img src=&quot;/eds/Public/kindeditor-4.1.10/attached/image/20140830/20140830075446_32521.png&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;这项研究是对此前部分科学家研究成果的继承和推进，“大反弹”理论认为宇宙并非一定要从一个所谓的“奇点”诞生，而是从上一个宇宙的崩塌中反弹而生。他们认为，很显然可以证明这样一次事件曾经发生的证据就隐藏在此次Bicep2试验所获得的数据之中。&lt;/span&gt;&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;研究人员提出，如果大反弹理论是正确的，那么后者的可能性或许会更高一些。这项理论基于所谓“圈量子引力”，这是统一量子力学与广义相对论的一项尝试，而它本身便是引力对宇宙产生作用的表现形式。其基本内涵是认为宇宙可被视作是许多缠绕的圈环，从而赋予空间本身一种类似原子的结构，使其成为类似物质的东西。&lt;/span&gt;&lt;/span&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;\n	&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n		&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;在LQG理论下，引力可以随着宇宙密度的上升而成为一种反弹力，就像弹簧被压缩到一定的程度之后就会变得更难继续进一步压缩。如果宇宙的确曾经塌缩，当它达到某一临界尺度，最终还将会再次反弹。这一扩张过程就是所谓“暴涨”，也就是此次在Bicep2的数据中找到的证据所代表的结果。\n	&lt;/p&gt;\n	&lt;p style=&quot;text-align:center;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n		&lt;img src=&quot;/eds/Public/kindeditor-4.1.10/attached/image/20140830/20140830075619_57551.png&quot; alt=&quot;&quot; /&gt;\n	&lt;/p&gt;\n	&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n		&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 这一新的理论将解决一些棘手的问题，如宇宙大爆炸之前是什么？一个正在收缩中，尚未抵达其最小尺度的宇宙。随后宇宙便再次膨胀，未来还将需要借助Bicep2和其他望远镜设备的观测结果，才能最终判断这一理论的正确与否。\n	&lt;/p&gt;\n&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;', '30', '0', '0', '/image/2014_08_30_13_50_31_1447562998.png', null, '0');
INSERT INTO `t_z` VALUES ('7', '1', '0', '2014-08-30 15:53:08', '2014-09-06 10:09:34', null, '2014-09-06 10:09:34', null, '大反弹理论', '研究人员提出，如果大反弹理论是正确的，那么后者的可能性或许会更高一些。这项理论基于所谓“圈量子引力”，这是统一量子力学与广义相对论的一项尝试，而它本身便是引力对宇宙产生作用的表现形式。其基本内涵是认为', '&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp;研究人员提出，如果大反弹理论是正确的，那么后者的可能性或许会更高一些。这项理论基于所谓“圈量子引力”，这是统一量子力学与广义相对论的一项尝试，而它本身便是引力对宇宙产生作用的表现形式。其基本内涵是认为宇宙可被视作是许多缠绕的圈环，从而赋予空间本身一种类似原子的结构，使其成为类似物质的东西。&lt;/span&gt;', '30', '4', '0', null, null, '0');
INSERT INTO `t_z` VALUES ('8', '1', '0', '2014-08-30 15:54:33', '2014-08-30 16:13:57', null, '2014-08-30 16:13:57', null, '南京大学2013年物理学院拔尖选拔结果', '经过笔试、面试，并综合高考成绩（参考），物理学院初步遴选以下30位同学进入拔尖计划。请名单中各位同学于明天（9月15日）中午12:00在仙林校区教学楼仙II-217签名确认（带校园卡）。今天不需要在网', '经过笔试、面试，并综合高考成绩（参考），物理学院初步遴选以下30位同学进入拔尖计划。请名单中各位同学于明天（9月15日）中午12:00在仙林校区教学楼仙II-217签名确认（带校园卡）。今天不需要在网上审核确认。&amp;nbsp;&lt;br /&gt;\n&lt;br /&gt;\n如果以下名单中的同学提出放弃物理学院拔尖计划，请尽快用电话与我联系。并填写放弃拔尖计划承诺书，签名后于明天中午一并在仙II-217给我。&amp;nbsp;&lt;br /&gt;\n&lt;br /&gt;\n&lt;br /&gt;\n&lt;br /&gt;\n朱敏超 131150057 &amp;nbsp; 地球科学与工程学院&amp;nbsp;&lt;br /&gt;\n周子恒 131120155 &amp;nbsp; 物理学院&amp;nbsp;&lt;br /&gt;\n张雪琪 131160069 &amp;nbsp; 地理与海洋科学学院&amp;nbsp;&lt;br /&gt;\n张楠 &amp;nbsp; &amp;nbsp; 131170043 &amp;nbsp; 大气科学学院&amp;nbsp;&lt;br /&gt;\n张杰同 131180019 &amp;nbsp; 电子科学与工程学院&amp;nbsp;&lt;br /&gt;\n张光耀 131120159 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n易伟柱 131120078 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n杨王飞 131170036 &amp;nbsp; &amp;nbsp;大气科学学院&amp;nbsp;&lt;br /&gt;\n杨硕 &amp;nbsp; &amp;nbsp; 131120112 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n许凡 &amp;nbsp; &amp;nbsp; 131250121 &amp;nbsp; &amp;nbsp;软件学院&amp;nbsp;&lt;br /&gt;\n邢奕飞 131120011 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n魏博超 131120142 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n王泽俊 131130054 &amp;nbsp; &amp;nbsp;化学化工学院&amp;nbsp;&lt;br /&gt;\n王伟 &amp;nbsp; &amp;nbsp; 131270016 &amp;nbsp; &amp;nbsp;工程管理学院&amp;nbsp;&lt;br /&gt;\n王沛宇 131140037 &amp;nbsp; &amp;nbsp;生命科学学院&amp;nbsp;&lt;br /&gt;\n孙泽维 131220096 &amp;nbsp; &amp;nbsp;计算机科学与技术系&amp;nbsp;&lt;br /&gt;\n宋谦 &amp;nbsp; &amp;nbsp; 131120018 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n钱祉源 131120006 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n马同川 131150016 &amp;nbsp; &amp;nbsp;地球科学与工程学院&amp;nbsp;&lt;br /&gt;\n林泽勋 131160056 &amp;nbsp; &amp;nbsp;地理与海洋科学学院&amp;nbsp;&lt;br /&gt;\n连震 &amp;nbsp; &amp;nbsp; 131120075 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n纪宵宇 131120198 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n李昊阳 131120191 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n黄贤雷 131130091 &amp;nbsp; &amp;nbsp;化学化工学院&amp;nbsp;&lt;br /&gt;\n黄诗华 131120144 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n胡博伦 131120202 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n高凡 &amp;nbsp; &amp;nbsp; 131190051 &amp;nbsp; &amp;nbsp;现代工程与应用科学学院&amp;nbsp;&lt;br /&gt;\n程恩泽 131120025 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n陈天宇 131150053 &amp;nbsp; &amp;nbsp;地球科学与工程学院&amp;nbsp;&lt;br /&gt;\n陈墨雨 131130128 &amp;nbsp; &amp;nbsp;化学化工学院&amp;nbsp;&lt;br /&gt;\n&lt;br /&gt;', '60', '4', '0', null, null, '0');
INSERT INTO `t_z` VALUES ('9', '1', '0', '2014-08-30 15:59:07', '2014-08-30 15:59:07', null, '2014-08-30 15:59:07', null, 'asdfsdfasdf', 'asfasfasdfasgasdfgdfgasdfa', 'asfasfasdfasgasdfgdfgasdfa', '60', '4', '0', null, null, '0');
INSERT INTO `t_z` VALUES ('10', '1', '0', '2014-08-30 16:18:49', '2014-08-30 16:19:32', null, '2014-08-30 16:19:32', null, '“基础学科拔尖学生培养试验计划”阶段性总结交流会将在清华举行', '“基础学科拔尖学生培养试验计划”（以下简称“拔尖计划”）阶段性总结交流会在主楼接待厅举行。时间定在9月26号，欢迎参加拔尖计划的各校老师莅临指导。', '&lt;span style=&quot;color:#006600;font-size:24px;&quot;&gt;&amp;nbsp;&lt;span style=&quot;font-size:32px;&quot;&gt;“基础学科拔尖学生培养试验计划”（以下简称“拔尖计划”）阶段性总结交流会在主楼接待厅举行。时间定在9月26号，欢迎参加拔尖计划的各校老师莅临指导。&lt;/span&gt;&lt;/span&gt;', '30', '4', '0', null, null, '0');

-- ----------------------------
-- View structure for `t_course_ta_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_course_ta_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_course_ta_view` AS select `t_teach`.`pid` AS `pid`,`t_teach`.`prid` AS `prid`,`t_teach`.`pfid` AS `pfid`,`t_teach`.`prole` AS `prole`,`t_teach`.`pcreated_time` AS `pcreated_time`,`t_teach`.`plast_edited_time` AS `plast_edited_time`,`t_ta_view`.`rid` AS `rid`,`t_ta_view`.`raccount` AS `raccount`,`t_ta_view`.`rpassword` AS `rpassword`,`t_ta_view`.`rnickname` AS `rnickname`,`t_ta_view`.`rhead_photo` AS `rhead_photo`,`t_ta_view`.`rlast_lgid` AS `rlast_lgid`,`t_ta_view`.`rstate` AS `rstate`,`t_ta_view`.`rrole` AS `rrole`,`t_ta_view`.`rshield_role` AS `rshield_role`,`t_ta_view`.`rshielded_time` AS `rshielded_time`,`t_ta_view`.`rshielded_type` AS `rshielded_type`,`t_ta_view`.`rlast_edited_time` AS `rlast_edited_time`,`t_ta_view`.`rcreated_time` AS `rcreated_time`,`t_ta_view`.`rshielded_tick` AS `rshielded_tick`,`t_ta_view`.`uid` AS `uid`,`t_ta_view`.`urid` AS `urid`,`t_ta_view`.`uchar` AS `uchar`,`t_ta_view`.`ugid` AS `ugid`,`t_ta_view`.`uno` AS `uno`,`t_ta_view`.`uname` AS `uname`,`t_ta_view`.`uen_name` AS `uen_name`,`t_ta_view`.`udisplay_name` AS `udisplay_name`,`t_ta_view`.`usender` AS `usender`,`t_ta_view`.`ubirthday` AS `ubirthday`,`t_ta_view`.`uuid` AS `uuid`,`t_ta_view`.`uemail` AS `uemail`,`t_ta_view`.`umobile_phone` AS `umobile_phone`,`t_ta_view`.`utel` AS `utel`,`t_ta_view`.`uqq` AS `uqq`,`t_ta_view`.`uoffice_addr` AS `uoffice_addr`,`t_ta_view`.`uphoto` AS `uphoto`,`t_ta_view`.`uhead_photo` AS `uhead_photo`,`t_ta_view`.`uprofile` AS `uprofile`,`t_ta_view`.`uconstellation` AS `uconstellation`,`t_ta_view`.`ugrade` AS `ugrade`,`t_ta_view`.`ucreate_post` AS `ucreate_post`,`t_ta_view`.`ucreate_reply` AS `ucreate_reply`,`t_ta_view`.`ucreate_msg` AS `ucreate_msg`,`t_ta_view`.`ucreate_ex_note` AS `ucreate_ex_note`,`t_ta_view`.`ucreate_ex_trend` AS `ucreate_ex_trend`,`t_ta_view`.`ucreate_ex_project` AS `ucreate_ex_project`,`t_ta_view`.`uupload_courseware` AS `uupload_courseware`,`t_ta_view`.`umanage_student` AS `umanage_student`,`t_ta_view`.`udownload_courseware` AS `udownload_courseware`,`t_ta_view`.`ulast_edited_time` AS `ulast_edited_time`,`t_ta_view`.`uchar_name` AS `uchar_name`,`t_ta_view`.`rstate_name` AS `rstate_name`,`t_course`.`fid` AS `fid`,`t_course`.`fname` AS `fname`,`t_course`.`fcollege` AS `fcollege`,`t_course`.`fgrade` AS `fgrade`,`t_course`.`fterm` AS `fterm`,`t_course`.`faddr` AS `faddr`,`t_course`.`fcreator` AS `fcreator`,`t_course`.`flast_edited_time` AS `flast_edited_time`,`t_course`.`fcreated_time` AS `fcreated_time`,`t_course`.`fstate` AS `fstate`,`t_course`.`fflag` AS `fflag`,`t_course`.`fteacher` AS `fteacher` from ((`t_teach` join `t_ta_view`) join `t_course`) where ((`t_teach`.`prid` = `t_ta_view`.`rid`) and (`t_teach`.`pfid` = `t_course`.`fid`) and (`t_ta_view`.`rstate` = 0)) ;

-- ----------------------------
-- View structure for `t_course_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_course_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_course_view` AS select `t_course`.`fid` AS `fid`,`t_course`.`fname` AS `fname`,`t_course`.`fcollege` AS `fcollege`,`t_course`.`fgrade` AS `fgrade`,`t_course`.`fterm` AS `fterm`,`t_course`.`faddr` AS `faddr`,`t_course`.`fcreator` AS `fcreator`,`t_course`.`flast_edited_time` AS `flast_edited_time`,`t_course`.`fcreated_time` AS `fcreated_time`,`t_course`.`fstate` AS `fstate`,`t_course`.`fflag` AS `fflag`,`dic_a`.`dic_value` AS `fstate_name`,`dic_b`.`dic_value` AS `fterm_name`,`t_course`.`fteacher` AS `fteacher`,`dic_fgrade`.`dic_value` AS `fgrade_name` from (((`t_course` join `t_dic` `dic_a`) join `t_dic` `dic_b`) join `t_dic` `dic_fgrade`) where ((`t_course`.`fstate` = `dic_a`.`dic_key`) and (`dic_a`.`dic_type` = 'fstate') and (`t_course`.`fterm` = `dic_b`.`dic_key`) and (`dic_b`.`dic_type` = 'fterm') and (`t_course`.`fgrade` = `dic_fgrade`.`dic_key`) and (`dic_fgrade`.`dic_type` = 'fgrade')) ;

-- ----------------------------
-- View structure for `t_manager_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_manager_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_manager_view` AS select `t_register`.`rid` AS `rid`,`t_register`.`raccount` AS `raccount`,`t_register`.`rpassword` AS `rpassword`,`t_register`.`rnickname` AS `rnickname`,`t_register`.`rhead_photo` AS `rhead_photo`,`t_register`.`rlast_lgid` AS `rlast_lgid`,`t_register`.`rstate` AS `rstate`,`t_register`.`rrole` AS `rrole`,`t_register`.`rshield_role` AS `rshield_role`,`t_register`.`rshielded_time` AS `rshielded_time`,`t_register`.`rshielded_type` AS `rshielded_type`,`t_register`.`rlast_edited_time` AS `rlast_edited_time`,`t_register`.`rcreated_time` AS `rcreated_time`,`t_register`.`rshielded_tick` AS `rshielded_tick`,`t_manager`.`mpcreate_teacher` AS `mpcreate_teacher`,`t_manager`.`mpcreate_news` AS `mpcreate_news`,`t_manager`.`mpcreate_act` AS `mpcreate_act`,`t_manager`.`mpcreate_plan_project` AS `mpcreate_plan_project`,`t_manager`.`mpedit_league_college` AS `mpedit_league_college`,`t_manager`.`mpcreate_notice` AS `mpcreate_notice`,`t_manager`.`mpcheck_ex_note` AS `mpcheck_ex_note`,`t_manager`.`mpcreate_ex_trend` AS `mpcreate_ex_trend`,`t_manager`.`mpcreate_ex_project` AS `mpcreate_ex_project`,`t_manager`.`mpcheck_courseware` AS `mpcheck_courseware`,`t_manager`.`mpcreate_topic` AS `mpcreate_topic`,`t_manager`.`mpcreate_post` AS `mpcreate_post`,`t_manager`.`mpcreate_reply` AS `mpcreate_reply`,`t_manager`.`mpcreate_msg` AS `mpcreate_msg`,`t_manager`.`mpmanager_user` AS `mpmanager_user`,`t_manager`.`mpmanager_bbs` AS `mpmanager_bbs`,`dic_a`.`dic_value` AS `rstate_name` from ((`t_register` join `t_manager`) join `t_dic` `dic_a`) where ((`t_register`.`rid` = `t_manager`.`mrid`) and (`t_register`.`rstate` = `dic_a`.`dic_key`) and (`dic_a`.`dic_type` = 'rstate')) ;

-- ----------------------------
-- View structure for `t_post_list_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_post_list_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_post_list_view` AS select `t_bbs`.`tid` AS `tid`,`t_bbs`.`ttitle` AS `ttitle`,`t_bbs`.`trid` AS `trid`,`t_bbs`.`tsummary` AS `tsummary`,`t_bbs`.`tcontent` AS `tcontent`,`t_bbs`.`ttopic` AS `ttopic`,`t_bbs`.`tstate` AS `tstate`,`t_bbs`.`tshielder` AS `tshielder`,`t_bbs`.`tcreated_time` AS `tcreated_time`,`t_bbs`.`treleased_time` AS `treleased_time`,`t_bbs`.`tshielded_time` AS `tshielded_time`,`t_bbs`.`ttop_time` AS `ttop_time`,`t_bbs`.`treply_id` AS `treply_id`,`t_bbs`.`tscan_count` AS `tscan_count`,`t_bbs`.`tfloor` AS `tfloor`,`t_register`.`rhead_photo` AS `rhead_photo`,`t_register`.`rnickname` AS `rnickname`,`t_topic`.`cname` AS `cname`,`t_bbs`.`tlast_edited_time` AS `tlast_edited_time` from ((`t_bbs` join `t_register`) join `t_topic`) where ((`t_bbs`.`trid` = `t_register`.`rid`) and (`t_bbs`.`ttopic` = `t_topic`.`cid`)) ;

-- ----------------------------
-- View structure for `t_post_reply_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_post_reply_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_post_reply_view` AS select `t_bbs`.`tid` AS `tid`,`t_bbs`.`ttitle` AS `ttitle`,`t_bbs`.`trid` AS `trid`,`t_bbs`.`tsummary` AS `tsummary`,`t_bbs`.`tcontent` AS `tcontent`,`t_bbs`.`ttopic` AS `ttopic`,`t_bbs`.`tstate` AS `tstate`,`t_bbs`.`tshielder` AS `tshielder`,`t_bbs`.`tcreated_time` AS `tcreated_time`,`t_bbs`.`treleased_time` AS `treleased_time`,`t_bbs`.`tshielded_time` AS `tshielded_time`,`t_bbs`.`ttop_time` AS `ttop_time`,`t_bbs`.`treply_id` AS `treply_id`,`t_bbs`.`tscan_count` AS `tscan_count`,`t_bbs`.`tfloor` AS `tfloor`,`t_register`.`raccount` AS `raccount`,`t_register`.`rnickname` AS `rnickname`,`t_register`.`rhead_photo` AS `rhead_photo`,`t_register`.`rrole` AS `rrole`,`t_register`.`rstate` AS `rstate` from (`t_bbs` join `t_register`) where ((`t_bbs`.`trid` = `t_register`.`rid`) and (`t_bbs`.`treply_id` is not null)) ;

-- ----------------------------
-- View structure for `t_ta_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_ta_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_ta_view` AS select `t_register`.`rid` AS `rid`,`t_register`.`raccount` AS `raccount`,`t_register`.`rpassword` AS `rpassword`,`t_register`.`rnickname` AS `rnickname`,`t_register`.`rhead_photo` AS `rhead_photo`,`t_register`.`rlast_lgid` AS `rlast_lgid`,`t_register`.`rstate` AS `rstate`,`t_register`.`rrole` AS `rrole`,`t_register`.`rshield_role` AS `rshield_role`,`t_register`.`rshielded_time` AS `rshielded_time`,`t_register`.`rshielded_type` AS `rshielded_type`,`t_register`.`rlast_edited_time` AS `rlast_edited_time`,`t_register`.`rcreated_time` AS `rcreated_time`,`t_register`.`rshielded_tick` AS `rshielded_tick`,`t_user`.`uid` AS `uid`,`t_user`.`urid` AS `urid`,`t_user`.`uchar` AS `uchar`,`t_user`.`ugid` AS `ugid`,`t_user`.`uno` AS `uno`,`t_user`.`uname` AS `uname`,`t_user`.`uen_name` AS `uen_name`,`t_user`.`udisplay_name` AS `udisplay_name`,`t_user`.`usender` AS `usender`,`t_user`.`ubirthday` AS `ubirthday`,`t_user`.`uuid` AS `uuid`,`t_user`.`uemail` AS `uemail`,`t_user`.`umobile_phone` AS `umobile_phone`,`t_user`.`utel` AS `utel`,`t_user`.`uqq` AS `uqq`,`t_user`.`uoffice_addr` AS `uoffice_addr`,`t_user`.`uphoto` AS `uphoto`,`t_user`.`uhead_photo` AS `uhead_photo`,`t_user`.`uprofile` AS `uprofile`,`t_user`.`uconstellation` AS `uconstellation`,`t_user`.`ugrade` AS `ugrade`,`t_user`.`ucreate_post` AS `ucreate_post`,`t_user`.`ucreate_reply` AS `ucreate_reply`,`t_user`.`ucreate_msg` AS `ucreate_msg`,`t_user`.`ucreate_ex_note` AS `ucreate_ex_note`,`t_user`.`ucreate_ex_trend` AS `ucreate_ex_trend`,`t_user`.`ucreate_ex_project` AS `ucreate_ex_project`,`t_user`.`uupload_courseware` AS `uupload_courseware`,`t_user`.`umanage_student` AS `umanage_student`,`t_user`.`udownload_courseware` AS `udownload_courseware`,`t_user`.`ulast_edited_time` AS `ulast_edited_time`,`dic_uchar`.`dic_value` AS `uchar_name`,`dic_rstate`.`dic_value` AS `rstate_name` from (((`t_register` join `t_user`) join `t_dic` `dic_uchar`) join `t_dic` `dic_rstate`) where ((`t_register`.`rrole` = 35) and (`t_register`.`rid` = `t_user`.`urid`) and (`t_user`.`uchar` = `dic_uchar`.`dic_key`) and (`dic_uchar`.`dic_type` = 'uchar') and (`t_register`.`rstate` = `dic_rstate`.`dic_key`) and (`dic_rstate`.`dic_type` = 'rstate')) ;

-- ----------------------------
-- View structure for `t_user_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_user_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_user_view` AS select `t_register`.`rid` AS `rid`,`t_register`.`raccount` AS `raccount`,`t_register`.`rpassword` AS `rpassword`,`t_register`.`rnickname` AS `rnickname`,`t_register`.`rhead_photo` AS `rhead_photo`,`t_register`.`rlast_lgid` AS `rlast_lgid`,`t_register`.`rstate` AS `rstate`,`t_register`.`rrole` AS `rrole`,`t_register`.`rshield_role` AS `rshield_role`,`t_register`.`rshielded_time` AS `rshielded_time`,`t_register`.`rshielded_type` AS `rshielded_type`,`t_register`.`rlast_edited_time` AS `rlast_edited_time`,`t_register`.`rcreated_time` AS `rcreated_time`,`t_register`.`rshielded_tick` AS `rshielded_tick`,`t_user`.`uchar` AS `uchar`,`t_user`.`ugid` AS `ugid`,`t_user`.`uno` AS `uno`,`t_user`.`uname` AS `uname`,`t_user`.`uen_name` AS `uen_name`,`t_user`.`udisplay_name` AS `udisplay_name`,`t_user`.`usender` AS `usender`,`t_user`.`ubirthday` AS `ubirthday`,`t_user`.`uuid` AS `uuid`,`t_user`.`uemail` AS `uemail`,`t_user`.`umobile_phone` AS `umobile_phone`,`t_user`.`utel` AS `utel`,`t_user`.`uqq` AS `uqq`,`t_user`.`uoffice_addr` AS `uoffice_addr`,`t_user`.`uhead_photo` AS `uhead_photo`,`t_user`.`uprofile` AS `uprofile`,`t_user`.`uconstellation` AS `uconstellation`,`t_user`.`ugrade` AS `ugrade`,`t_user`.`ucreate_post` AS `ucreate_post`,`t_user`.`ucreate_reply` AS `ucreate_reply`,`t_user`.`ucreate_msg` AS `ucreate_msg`,`t_user`.`ucreate_ex_note` AS `ucreate_ex_note`,`t_user`.`ucreate_ex_trend` AS `ucreate_ex_trend`,`t_user`.`ucreate_ex_project` AS `ucreate_ex_project`,`t_user`.`uupload_courseware` AS `uupload_courseware`,`t_user`.`umanage_student` AS `umanage_student`,`t_user`.`udownload_courseware` AS `udownload_courseware`,`dic_a`.`dic_value` AS `rstate_name`,`dic_b`.`dic_value` AS `usender_name`,`dic_c`.`dic_value` AS `uchar_name`,`t_college`.`gname` AS `gname`,`t_college`.`gstate` AS `gstate` from (((((`t_register` join `t_user`) join `t_dic` `dic_a`) join `t_dic` `dic_b`) join `t_dic` `dic_c`) join `t_college`) where ((`t_register`.`rid` = `t_user`.`urid`) and (`t_register`.`rstate` = `dic_a`.`dic_key`) and (`dic_a`.`dic_type` = 'rstate') and (`dic_b`.`dic_key` = `t_user`.`usender`) and (`dic_b`.`dic_type` = 'usender') and (`t_user`.`uchar` = `dic_c`.`dic_key`) and (`dic_c`.`dic_type` = 'uchar') and (`t_user`.`ugid` = `t_college`.`gid`)) ;
