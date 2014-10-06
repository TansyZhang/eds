/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : eds

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2014-10-06 20:06:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_bbs`
-- ----------------------------
DROP TABLE IF EXISTS `t_bbs`;
CREATE TABLE `t_bbs` (
  `tid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tflag` varchar(250) DEFAULT NULL COMMENT '帖子图标，如果该帖子出现在首页则显示此图标',
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bbs
-- ----------------------------
INSERT INTO `t_bbs` VALUES ('1', null, '太阳系边界现神秘“彩带” 粒子被困环形区域', '1', '【科技讯】8月29日消息，据媒体报道，在太阳系的边缘，科学家发现了一处神秘的边界层，是太阳系物质与银河系介质相互作用的地方，处于日光层的边缘，NASA星际边界探测器发现了一种奇怪的现象，太阳系内部粒子', '&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;【&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科技&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;讯】8月29日消息，据媒体报道，在太阳系的边缘，&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;家发现了一处神秘的边界层，是太阳系物质与银河系介质相互作用的地方，处于日光层的边缘，NASA星际边界探测器发现了一种奇怪的现象，太阳系内部粒子在这一区域中似乎碰到一层壁垒，使得太阳系外围出现类似“边界指纹”的结构，绘制太阳系边界图像体现了这处神秘的区域，但无法对其进行解释。&lt;/span&gt;\n&lt;/p&gt;\n&lt;p style=&quot;text-align:center;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;img src=&quot;/eds/Public/kindeditor-4.1.10/attached/image/20140830/20140830144420_14273.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;\n	&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n		&amp;nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; 太阳系边界处神秘结构酷似巨大的“彩带”飘舞，产生更多高能中性原子，&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;家不清楚是什么原因导致中性原子数量出现增加。科学家设计出相关模拟和理论试图解释彩带的存在原因，彩带存在于一个特殊的位置上，太阳的中性氢原子穿过银河系的磁场，中性原子不受磁场的影响，使得该过程中的运行方向仍然保持原有指向。\n	&lt;/p&gt;\n	&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n		&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 科学家认为，新的理论嵌入了太阳系边缘波动以及磁场震动的因子，使得这些粒子被困于一个环形区域中。科学家认为其中还隐藏了太阳系磁场与银河系磁场的关系，如果这一理论是正确的，太阳系边界的环形色带将告诉我们星际介质与磁场的作用关系，以及这些磁场是如何影响我们的空间环境。\n	&lt;/p&gt;\n&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;', '6', '20', null, '2014-08-30 20:44:26', '2014-08-30 20:44:26', null, null, '2014-09-10 23:26:52', null, '16', '0');
INSERT INTO `t_bbs` VALUES ('2', null, null, '1', '阿三，你又来胡思乱想了，药不能停啊！！！还挺有意思~', '&lt;pre&gt;阿三，你又来胡思乱想了，药不能停啊！！！还挺有意思~&lt;/pre&gt;', null, '0', null, '2014-08-30 20:46:03', null, null, null, null, '1', '0', '0');
INSERT INTO `t_bbs` VALUES ('3', null, null, '1', '阿三，你又来胡思乱想了，药不能停啊！！！还挺有意思~', '&lt;pre&gt;阿三，你又来胡思乱想了，药不能停啊！！！还挺有意思~&lt;/pre&gt;', null, '20', null, '2014-08-30 21:12:49', null, null, null, null, '1', '0', '0');
INSERT INTO `t_bbs` VALUES ('4', null, null, '1', '阿三，你又来胡思乱想了，药不能停啊！！！还挺有意思~', '&lt;strong&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;阿三，你又来胡思乱想了，药不能停啊！！！还挺有意思~&lt;/span&gt;&lt;/strong&gt;', null, '0', null, '2014-08-30 21:16:48', null, null, null, null, '1', '0', '0');
INSERT INTO `t_bbs` VALUES ('5', null, null, '1', '&lt;img src=&quot;/eds/Public/kindeditor-4.1.10/attached/image/20140830/20140830154027_16871.jpg&quot; alt=&quot;&quot; /&gt;', '&lt;div style=&quot;text-align:center;&quot;&gt;\n	&lt;span style=&quot;font-family:NSimSun;line-height:1.5;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-family:NSimSun;font-size:24px;&quot;&gt;&lt;img src=&quot;/eds/Public/kindeditor-4.1.10/attached/image/20140830/20140830154027_16871.jpg&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\n&lt;/div&gt;', null, '10', null, '2014-08-30 21:40:33', null, null, null, null, '1', '0', '0');
INSERT INTO `t_bbs` VALUES ('6', null, '罕见超长伽玛射线暴 或源于神秘大质量恒星', '1', '【科技讯】8月29日消息，据媒体报道，伽玛射线暴被认为是宇宙中最强大的爆炸之一，大部分的伽玛射线暴在一分钟左右，科学家提出的新型伽玛暴可持续几个小时。英国研究小组通过观测提出了一种新型伽玛射线暴理论，', '&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp;【&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科技&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;讯】8月29日消息，据媒体报道，伽玛射线暴被认为是宇宙中最强大的爆炸之一，大部分的伽玛射线暴在一分钟左右，&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;家提出的新型伽玛暴可持续几个小时。英国研究小组通过观测提出了一种新型伽玛射线暴理论，其形成于质量更大的超巨星。&lt;/span&gt;\n&lt;/p&gt;\n&lt;p style=&quot;text-align:center;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;img src=&quot;/eds/Public/kindeditor-4.1.10/attached/image/20140830/20140830155625_89689.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;\n	&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n		&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 宇宙中存在的大质量恒星，该型恒星的“燃烧”速度非常快，其寿命很短，可形成能量异常高的伽玛射线。&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;家小组观测到不寻常的新型伽玛暴，超长伽玛暴的红移值达到0.847，大约在70亿光年左右，认为其爆炸产生于超巨星，一种质量达到太阳质量20倍以上的天体，爆发瞬间可变成宇宙中最大最亮的恒星之一，半径可达到太阳的1000倍左右。\n	&lt;/p&gt;\n	&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n		&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 恒星演化的最后阶段，其自身会在引力作用下坍缩形成一个黑洞，当物质被吸入黑洞时，会在两个垂直方向上形成伽玛射线喷流，其速度可接近光速，一般情况下这个伽玛射线暴仅会持续数秒，发现的恒星质量较大，形成伽玛射线喷流的持续时间也较长。\n	&lt;/p&gt;\n&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;', '2', '30', null, '2014-08-30 21:56:30', '2014-08-30 21:56:30', null, null, null, null, '1', '0');
INSERT INTO `t_bbs` VALUES ('7', null, '试试看', '1', '好吧，我就试试看看而发生大法师打发斯蒂芬', '&lt;div style=&quot;text-align:center;&quot;&gt;\n	&lt;span style=&quot;line-height:1.5;&quot;&gt;好吧，我就试试&lt;/span&gt;&lt;span style=&quot;line-height:1.5;&quot;&gt;看看而发生大法师打发斯蒂芬&lt;/span&gt;\n&lt;/div&gt;', '1', '10', null, '2014-08-30 22:42:55', '2014-09-10 22:47:54', null, null, '2014-09-10 23:27:25', null, '1', '0');
INSERT INTO `t_bbs` VALUES ('8', null, '按时打算', '1', '阿瑟大声道v24534', '阿瑟大声道v24534', '3', '30', null, '2014-09-10 22:01:23', '2014-09-10 22:40:32', null, null, null, null, '0', '0');
INSERT INTO `t_bbs` VALUES ('9', null, '我就发个帖', '1', '好久没有发帖了 看看这个功能有木有受影响', '好久没有发帖了 看看这个功能有木有受影响', '1', '10', null, '2014-09-11 22:52:03', '2014-09-11 22:52:03', null, null, null, null, '3', '0');
INSERT INTO `t_bbs` VALUES ('10', null, null, '1', '看来是没有咦', '看来是没有咦', null, '10', null, '2014-09-11 22:54:30', null, null, null, null, '9', '0', '0');
INSERT INTO `t_bbs` VALUES ('11', null, null, '1', '这楼层怎么算', '这楼层怎么算', null, '10', null, '2014-09-11 22:54:45', null, null, null, null, '9', '0', '0');
INSERT INTO `t_bbs` VALUES ('12', '/image/2014_09_21_09_46_19_569334634.png', '测试帖子图标', '1', '只是测试一下帖子图标', '只是测试一下帖子图标', '1', '10', null, '2014-09-21 09:47:00', '2014-09-21 09:47:00', null, null, null, null, '3', '0');
INSERT INTO `t_bbs` VALUES ('13', null, null, '1', '回复一下', '回复一下', null, '10', null, '2014-09-21 09:47:46', null, null, null, null, '12', '0', '0');
INSERT INTO `t_bbs` VALUES ('19', null, null, '1', 'werwerwrweeere', 'werwerwrweeere', null, '10', null, '2014-09-21 12:35:26', null, null, null, null, '7', '0', '0');
INSERT INTO `t_bbs` VALUES ('20', null, null, '1', 'afasdfasdf', 'afasdfasdf', null, '10', null, '2014-09-21 12:36:00', null, null, null, null, '7', '0', '0');
INSERT INTO `t_bbs` VALUES ('21', null, null, '1', 'afasdfasdf', 'afasdfasdf', null, '10', null, '2014-09-21 12:37:36', null, null, null, null, '7', '0', '0');
INSERT INTO `t_bbs` VALUES ('22', null, null, '1', 'wochao', 'wochao&amp;nbsp;', null, '10', null, '2014-09-21 12:38:00', null, null, null, null, '7', '0', '0');
INSERT INTO `t_bbs` VALUES ('23', '', 'asdfasdfaa', '23', 'sfsdfsd', 'sfsdfsd', '1', '10', null, '2014-09-21 12:59:43', '2014-09-21 12:59:43', null, null, null, null, '1', '0');
INSERT INTO `t_bbs` VALUES ('24', null, null, '23', '回复帖子：罕见超长伽玛射线暴 或源于神秘大质量恒星', '&lt;span style=&quot;color:#434A54;font-family:\'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:24px;line-height:20px;background-color:#4C33E5;&quot;&gt;&lt;strong&gt;回复帖子：罕见超长伽玛射线暴 或源于神秘大质量恒星&lt;/strong&gt;&lt;/span&gt;', null, '10', null, '2014-10-04 11:39:40', null, null, null, null, '6', '0', '0');
INSERT INTO `t_bbs` VALUES ('25', null, null, '23', '我也回复一下', '我也回复一下', null, '10', null, '2014-10-04 11:43:08', null, null, null, null, '12', '0', '0');
INSERT INTO `t_bbs` VALUES ('26', null, null, '23', '再回复一下', '再回复一下', null, '10', null, '2014-10-04 11:43:42', null, null, null, null, '12', '0', '0');
INSERT INTO `t_bbs` VALUES ('27', '', '新人报到', '40', '大家好 我是新来的张三同学 请大家多多关照！', '&lt;span style=&quot;font-family:NSimSun;color:#E53333;font-size:14px;&quot;&gt;&lt;strong&gt;大家好 我是新来的张三同学 请大家多多关照！&lt;/strong&gt;&lt;/span&gt;', '6', '10', null, '2014-10-06 19:36:00', '2014-10-06 19:36:00', null, null, null, null, '1', '0');
INSERT INTO `t_bbs` VALUES ('28', null, null, '1', '你好！', '你好！', null, '10', null, '2014-10-06 19:38:02', null, null, null, null, '27', '0', '0');

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
  `glast_edited_time` datetime NOT NULL,
  `gcreated_time` datetime NOT NULL COMMENT '在本系统中的创建时间/加入拔尖计划时间',
  `glogo` varchar(250) DEFAULT NULL COMMENT '学校logo，用于列表展示的左侧',
  `gflag` varchar(250) DEFAULT NULL COMMENT '学校标志性图片，用于列表展示的右侧',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_college
-- ----------------------------
INSERT INTO `t_college` VALUES ('NJU', '南京大学', '1', '1', '亲爱的各位同学，相信你们在高中的时候就听说过“钱学森之问”，这是大师生前的疑问，不解“为什么我们的学校总是培养不出杰出人才？”而你们肯定也经常听到很多人议论：为什么中国一直拿不到诺贝尔奖？\n　　面对这些问题和困惑，我们国家也在思考，也在努力，也在想办法，希望能够培养出世界一流人才，培养出大师级人物。教育部正是在这个背景下出台了“基础学科拔尖学生培养计划”，希望率先在物理学、化学、数学、生物学、计算机科学等五个基础学科领域配备一流的师资，创造一流的条件，开辟绿色通道，培养出一流的科学家！ \n　　该计划首先在全国十余所高校推行，而我们南京大学即是其中之一。这也就意味着，刚跨入南大的各位同学将有机会', '&lt;span style=&quot;font-size:16px;background-color:#FFFFFF;&quot;&gt;亲爱的各位同学，相信你们在高中的时候就听说过“钱学森之问”，这是大师生前的疑问，不解“为什么我们的学校总是培养不出杰出人才？”而你们肯定也经常听到很多人议论：为什么中国一直拿不到诺贝尔奖？\n　　面对这些问题和困惑，我们国家也在思考，也在努力，也在想办法，希望能够培养出世界一流人才，培养出大师级人物。教育部正是在这个背景下出台了“基础学科拔尖学生培养计划”，希望率先在物理学、化学、数学、生物学、计算机科学等五个基础学科领域配备一流的师资，创造一流的条件，开辟绿色通道，培养出一流的科学家！ \n　　该计划首先在全国十余所高校推行，而我们南京大学即是其中之一。这也就意味着，刚跨入南大的各位同学将有机会进入这个计划，追逐自己攀登科学顶峰的梦想，成为解答“钱学森之问”的关键人物！\n 那么，南京大学开展这个计划有何优势？ \n　　“基础学科拔尖学生培养计划”主要是在基础学科领域开展的，而我们最大的特点即在于基础学科领域的雄厚实力和培养基础学科人才的悠久历史。\n　　目前，南京大学在理工科基础学科领域有7个一级学科国家重点学科和9个理科基础学科人才培养基地，实力超群，成绩斐然。尤其是匡亚明学院强化部（大理科班），它作为国家理科基础学科人才培养基地中唯一的多学科综合点，两次获得了国家级教学成果一等奖，它所创造和推行的大理科人才培养模式被北大、复旦等其他高校效仿，成为基础学科人才培养的重要模式之一。可以说，南京大学重视基础学科建设和基础学科人才培养所累积的丰富经验和底子，为这个计划的推行奠定了非常深厚的基础。\n 接着，可能你还想知道，南大如何开展这项计划呢？ \n　　简而言之，南京大学将以理科基础学科人才培养基地为基础，在物理学、化学、数学、生物学、计算机科学、天文学六个学科开展“拔尖计划”。学校将对进入“拔尖计划”的学生前两年实施大理科人才培养模式，为学生打下宽厚扎实的基础，后两年进行“精而深”的专业培养。\n　　可能你还想进一步追问，“我进了拔尖计划后有可以享受到何种权利呢？”\n　　首先，你将享有专门的导师指导。学校会按照师生比不低于1:5的比例为每位学生配备品德兼优的学术导师，院士、长江学者、杰出青年基金获得者都很可能成为你今后的导师，他们将不再是你原先觉得遥不可及的或者“传说中的人物”，他们将成为你学术上的引领者，带你走进科研的殿堂，你在学术上遇到什么困惑也可以随时向他们去请教。\n　　其次，你可以在导师的指导下，根据自己的特长和爱好来决定上哪些课。你可以进行跨年级、跨学科选课，部分课程可以免修，高年级阶段还能选修研究生课程。\n　　而在考核方面，你也不用对经历了十几年的考试心存阴影。我们不会单纯地看你考分，而是推行“柔性评估”，强调你在学习、研究过程中体现出来的创新性和发展潜力、你发现问题和解决问题的能力。我们提倡快乐学习，灵活考核。考核的内容以实验考核、科研课题考核为主，考核形式多种多样。\n　　你还有机会获得各种奖助学金，免除你生活的后顾之忧。学校专门设立了“基础学科拔尖英才助学金”、“基础学科拔尖英才奖学金”、“基础学科拔尖英才创造力专项奖”，每年根据同学们的考核表现，奖励当年度的杰出学生。\n　　除此之外，你还可以优先享受海外学习、境外实践、学术会议等国际交流机会，你还可以优先获得直博的机会，提前进入实验室……\n　　看到这里，你可能已经怦然心动，希望能够加入这个充满巨大诱惑力的计划。那么，请来教务处主页瞧一瞧。我们热忱欢迎每一位有志于基础学科研究同学申请加入“拔尖计划”，我们诚意协助你追逐自己的科学梦想！&lt;/span&gt;', '30', '2014-09-20 09:41:31', '2014-08-30 16:32:15', '/image/2014_09_20_09_41_22_1132582806.png', '/image/2014_09_20_09_41_28_1794665388.png');

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
INSERT INTO `t_courseware` VALUES ('1', '0', '3D打印火箭喷射器的测试', '[摘要]美国宇航局马歇尔太空飞行中心的工程师完成了3D打印火箭喷射器的测试，燃烧温度可达到3315摄氏度，展示了3D打印技术制造零部件的性能。 \n\n\n	&lt;img src=&quot;http://image.t', '&lt;p&gt;\n	&lt;span style=&quot;font-family:Simsun;font-size:14px;line-height:25px;&quot;&gt;[摘要]美国宇航局马歇尔太空飞行中心的工程师完成了3D打印火箭喷射器的测试，燃烧温度可达到3315摄氏度，展示了3D打印技术制造零部件的性能。&lt;/span&gt; \n&lt;/p&gt;\n&lt;p style=&quot;text-align:center;&quot;&gt;\n	&lt;span style=&quot;font-family:Simsun;font-size:14px;line-height:25px;&quot;&gt;&lt;img src=&quot;http://image.techweb.com.cn/upload/roll/2014/08/31/201408315579_6696.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\n&lt;/span&gt; \n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;font-family:Simsun;font-size:14px;line-height:25px;&quot;&gt; &lt;/span&gt;\n&lt;/p&gt;\n&lt;p style=&quot;text-indent:2em;font-size:14px;font-family:Simsun;&quot;&gt;\n	腾讯科学讯 据国外媒体报道，美国宇航局的工程师们刚刚完成了3D打印火箭喷射器的测试，本项研究在于提高火箭发动机某个组件的性能，由于喷射器内液态氧和气态氢一起混合反应，这里的燃烧温度可达到6000华氏度，大约为3315摄氏度，可产生2万磅的推力，约为9吨左右，验证了3D打印技术在火箭发动机制造上的可行性。本项测试工作位于阿拉巴马亨茨维尔的美国宇航局马歇尔太空飞行中心，这里拥有较为完善的火箭发动机测试条件，工程师可验证3D打印部件在点火环境中的性能。\n&lt;/p&gt;\n&lt;p style=&quot;text-indent:2em;font-size:14px;font-family:Simsun;&quot;&gt;\n	制造火箭发动机的喷射器需要精度较高的加工技术，如果使用3D打印技术，就可以降低制造上的复杂程度，在计算机中建立喷射器的三维图像，打印的材料为金属粉末和激光，在较高的温度下，金属粉末可被重新塑造成我们需要的样子。火箭发动机中的喷射器内有数十个喷射元件，要建造大小相似的元件需要一定的加工精度，该技术测试成功后将用于制造RS-25发动机，其作为美国宇航局未来太空发射系统的主要动力，该火箭可运载宇航员超越近地轨道，进入更遥远的深空。\n&lt;/p&gt;\n&lt;p style=&quot;text-indent:2em;font-size:14px;font-family:Simsun;&quot;&gt;\n	马歇尔中心的工程部主任克里斯认为3D打印技术在火箭发动机喷油器上应用只是第一步，我们的目的在于测试3D打印部件如何能彻底改变火箭的设计与制造，并提高系统的性能，更重要的是可以节省时间和成本，不太容易出现故障。本次测试中，两具火箭喷射器进行了点火，每次5秒，设计人员创建的复杂几何流体模型允许氧气和氢气充分混合，压力为每平方英寸1400磅。美国宇航局还与其他公司进行合作，比如位于得克萨斯州的制造商，其目的在于建立3D打印火箭发动机部件的标准和制造工艺。\n&lt;/p&gt;\n&lt;p style=&quot;text-indent:2em;font-size:14px;font-family:Simsun;&quot;&gt;\n	可以预见，3D打印技术除了应用于制造火箭发动机部件外，还可用于制造其他航天器组件，其特点是快速建造，几乎所有的航天器部件都可以被3D打印，这就减少了一些设计上的风险，并有效控制项目成本。（罗辑/编译）\n&lt;/p&gt;\n&lt;br /&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;', '/image/2014_08_31_12_32_27_2054952973.png', '系统管理员', '职称', '学校', '/image/2014_08_31_12_32_32_733543381.png', '0', '0', null, null, null, null, '2014-09-20 10:57:26', '20');
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
INSERT INTO `t_dic` VALUES ('0', 'lgresult', '登录成功', null);
INSERT INTO `t_dic` VALUES ('0', 'rrole', '系统', null);
INSERT INTO `t_dic` VALUES ('0', 'rstate', '正常', null);
INSERT INTO `t_dic` VALUES ('0', 'tstate', '编辑中', null);
INSERT INTO `t_dic` VALUES ('0', 'uchar', '其他', null);
INSERT INTO `t_dic` VALUES ('0', 'usender', '未知', null);
INSERT INTO `t_dic` VALUES ('0', 'vstate', '未查看', null);
INSERT INTO `t_dic` VALUES ('0', 'zstate', '编辑中', null);
INSERT INTO `t_dic` VALUES ('0', 'zsub_type', '中国科学网', '0');
INSERT INTO `t_dic` VALUES ('0', 'ztype', '资讯', null);
INSERT INTO `t_dic` VALUES ('1', 'dic_city', '南京市', '1');
INSERT INTO `t_dic` VALUES ('1', 'dic_province', '江苏省', null);
INSERT INTO `t_dic` VALUES ('1', 'etype', '物理力学', '1');
INSERT INTO `t_dic` VALUES ('1', 'fterm', '2014-2015年秋季（第一）学期', '2014');
INSERT INTO `t_dic` VALUES ('1', 'vtype', '帖子回复', null);
INSERT INTO `t_dic` VALUES ('1', 'zsub_type', 'Science专区', '0');
INSERT INTO `t_dic` VALUES ('1', 'ztype', '活动', null);
INSERT INTO `t_dic` VALUES ('2', 'fterm', '2014-2015年春季（第二）学期', '2014');
INSERT INTO `t_dic` VALUES ('2', 'lgresult', '用户不存在', null);
INSERT INTO `t_dic` VALUES ('2', 'zsub_type', 'Nature专区', '0');
INSERT INTO `t_dic` VALUES ('3', 'lgresult', '密码错误', null);
INSERT INTO `t_dic` VALUES ('3', 'zsub_type', '拔尖计划专区', '0');
INSERT INTO `t_dic` VALUES ('3', 'ztype', '成果', null);
INSERT INTO `t_dic` VALUES ('4', 'lgresult', '登录受限', null);
INSERT INTO `t_dic` VALUES ('4', 'ztype', '通知', null);
INSERT INTO `t_dic` VALUES ('5', 'lgresult', '状态异常', null);
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
INSERT INTO `t_dic` VALUES ('10', 'vstate', '已忽略', null);
INSERT INTO `t_dic` VALUES ('10', 'zstate', '提交/审核中', null);
INSERT INTO `t_dic` VALUES ('20', 'eattr', '公共课件', null);
INSERT INTO `t_dic` VALUES ('20', 'estate', '审核通过', null);
INSERT INTO `t_dic` VALUES ('20', 'fstate', '已关闭', null);
INSERT INTO `t_dic` VALUES ('20', 'gstate', '被退回', null);
INSERT INTO `t_dic` VALUES ('20', 'rrole', '普通管理员', null);
INSERT INTO `t_dic` VALUES ('20', 'rstate', '已删除', null);
INSERT INTO `t_dic` VALUES ('20', 'tstate', '置顶', null);
INSERT INTO `t_dic` VALUES ('20', 'usender', '男', null);
INSERT INTO `t_dic` VALUES ('20', 'vstate', '已查看', null);
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
INSERT INTO `t_dic` VALUES ('50', 'zstate', '已屏蔽', null);
INSERT INTO `t_dic` VALUES ('60', 'zstate', '已删除', null);
INSERT INTO `t_dic` VALUES ('70', 'uchar', '助教', null);
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
  `vurl` varchar(500) DEFAULT NULL COMMENT '点击该代办事件，跳转到的url',
  `vcreated_time` datetime NOT NULL,
  `vstate` int(11) NOT NULL COMMENT '事件状态：0-未查看，1-已忽略，2-已查看，引用自字典表vstate',
  `vref` int(11) DEFAULT NULL COMMENT '引用',
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_event
-- ----------------------------
INSERT INTO `t_event` VALUES ('1', '1', '这里是标题', null, '1', '/Home/Bbs/post_dtl?tid=1#start', '2014-09-07 12:03:24', '10', '1');
INSERT INTO `t_event` VALUES ('2', '1', '试试看', null, '1', '2014-09-21 12:37:36', '0000-00-00 00:00:00', '10', '1');
INSERT INTO `t_event` VALUES ('3', '1', '试试看', null, '1', '2014-09-21 12:38:00', '0000-00-00 00:00:00', '10', '1');
INSERT INTO `t_event` VALUES ('4', '1', '罕见超长伽玛射线暴 或源于神秘大质量恒星', null, '1', '/Home/Bbs/post_dtl?tid=1#start', '2014-10-04 11:39:40', '0', '23');
INSERT INTO `t_event` VALUES ('5', '1', '测试帖子图标', null, '1', '/Home/Bbs/post_dtl?tid=1#start', '2014-10-04 11:43:09', '10', '23');
INSERT INTO `t_event` VALUES ('6', '1', '测试帖子图标', null, '1', '/Home/Bbs/post_dtl?tid=1#start', '2014-10-04 11:43:43', '0', '23');
INSERT INTO `t_event` VALUES ('7', '40', '新人报到', null, '1', '/Home/Bbs/post_dtl?tid=40#start', '2014-10-06 19:38:02', '0', '1');

-- ----------------------------
-- Table structure for `t_login`
-- ----------------------------
DROP TABLE IF EXISTS `t_login`;
CREATE TABLE `t_login` (
  `lgid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `lgrid` int(11) NOT NULL COMMENT '尝试登录者id，引用自r表',
  `lgpassword` varchar(128) DEFAULT NULL COMMENT '登录密码，成功时该字段为null',
  `lgtime` datetime NOT NULL COMMENT '登录时间',
  `lgip` varchar(20) DEFAULT NULL COMMENT '登录ip',
  `lgmac` varchar(30) DEFAULT NULL COMMENT '登录mac地址',
  `lgbrowser` varchar(200) DEFAULT NULL COMMENT '登录浏览器/代理',
  `lgos` varchar(200) DEFAULT NULL COMMENT '登录操作系统',
  `lgresult` int(2) NOT NULL COMMENT '登录结果：0-失败，1-成功，引用字典表lgresult',
  PRIMARY KEY (`lgid`),
  KEY `ilgrid` (`lgrid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_login
-- ----------------------------
INSERT INTO `t_login` VALUES ('1', '1', null, '2014-10-05 09:33:09', '0.0.0.0', null, 'Unknown ', 'Unknown', '0');
INSERT INTO `t_login` VALUES ('2', '1', null, '2014-10-05 09:39:08', '0.0.0.0', null, 'Unknown ', 'Unknown', '0');
INSERT INTO `t_login` VALUES ('3', '39', null, '2014-10-05 09:40:41', '0.0.0.0', null, 'Chrome 29.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('4', '1', null, '2014-10-05 09:44:35', '0.0.0.0', null, 'Chrome 29.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('5', '1', null, '2014-10-05 09:44:56', '0.0.0.0', null, 'Chrome 29.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('6', '39', null, '2014-10-05 10:33:39', '0.0.0.0', null, 'Chrome 29.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('7', '1', null, '2014-10-05 10:42:11', '0.0.0.0', null, 'Chrome 29.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('8', '1', null, '2014-10-05 10:49:03', '0.0.0.0', null, 'Chrome 29.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('9', '1', null, '2014-10-05 10:52:39', '0.0.0.0', null, 'Chrome 29.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('10', '1', null, '2014-10-05 10:53:03', '0.0.0.0', null, 'Chrome 29.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('11', '39', null, '2014-10-05 11:28:41', '0.0.0.0', null, 'Chrome 29.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('12', '1', null, '2014-10-06 11:15:57', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('13', '1', null, '2014-10-06 11:17:32', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('14', '1', null, '2014-10-06 11:17:54', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('15', '1', null, '2014-10-06 11:19:23', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('16', '1', null, '2014-10-06 11:27:03', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('17', '1', null, '2014-10-06 11:31:53', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('18', '1', null, '2014-10-06 11:32:25', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('19', '1', null, '2014-10-06 11:32:51', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('20', '1', null, '2014-10-06 11:32:59', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('21', '1', null, '2014-10-06 19:31:33', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('22', '1', null, '2014-10-06 19:32:41', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('23', '40', null, '2014-10-06 19:33:26', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('24', '1', null, '2014-10-06 19:36:29', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('25', '1', null, '2014-10-06 19:40:25', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');
INSERT INTO `t_login` VALUES ('26', '1', null, '2014-10-06 19:58:50', '0.0.0.0', null, 'Chrome 34.', 'Windows 7', '0');

-- ----------------------------
-- Table structure for `t_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `mid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mrid` int(11) NOT NULL COMMENT '登录账号，外键引用自r表',
  `mlast_edited_time` datetime NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('1', '1', '2014-10-05 10:48:50', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_manager` VALUES ('11', '20', '2014-10-05 11:20:34', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0');
INSERT INTO `t_manager` VALUES ('12', '21', '2014-10-03 19:17:06', '1', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_manager` VALUES ('13', '22', '2014-10-03 19:17:10', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1', '1', '0', '1');
INSERT INTO `t_manager` VALUES ('14', '39', '2014-10-03 19:20:23', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_register
-- ----------------------------
INSERT INTO `t_register` VALUES ('1', 'system', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '系统管理员', '/assets/image/headphoto/default.png', '0', '0', '0', null, null, null, '2014-10-05 10:48:50', '2014-08-31 19:34:13', null);
INSERT INTO `t_register` VALUES ('20', 's3423423434234', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', 'nick', '/assets/image/headphoto/default.png', '0', '0', '20', null, null, null, '2014-10-05 11:21:08', '2014-08-31 20:11:06', null);
INSERT INTO `t_register` VALUES ('23', 'NJU123', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '张三', '/assets/image/headphoto/default.png', '0', '0', '30', null, null, null, '2014-10-03 12:23:55', '2014-09-06 14:13:20', null);
INSERT INTO `t_register` VALUES ('28', 'NJU100', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '李四', '/assets/image/headphoto/default.png', '0', '0', '30', null, null, null, '2014-09-10 20:00:27', '2014-09-10 20:00:27', null);
INSERT INTO `t_register` VALUES ('29', 'NJU10', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '王五', '/assets/image/headphoto/default.png', '0', '0', '30', null, null, null, '2014-10-06 14:17:25', '2014-09-10 20:12:07', null);
INSERT INTO `t_register` VALUES ('30', 'TA201409131608432747', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名1', '/assets/image/headphoto/default.png', '0', '10', '35', null, null, null, '2014-09-13 16:08:43', '2014-09-13 16:08:43', null);
INSERT INTO `t_register` VALUES ('31', 'TA201409131611124448', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名2', '/assets/image/headphoto/default.png', '0', '0', '35', null, null, null, '2014-09-13 16:11:12', '2014-09-13 16:11:12', null);
INSERT INTO `t_register` VALUES ('32', 'TA201409131613271921', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名3', '/assets/image/headphoto/default.png', '0', '0', '35', null, null, null, '2014-09-13 16:13:27', '2014-09-13 16:13:27', null);
INSERT INTO `t_register` VALUES ('33', 'TA201409131614036380', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名4', '/assets/image/headphoto/default.png', '0', '20', '35', null, null, null, '2014-09-13 16:14:03', '2014-09-13 16:14:03', null);
INSERT INTO `t_register` VALUES ('34', 'TA201409131618208587', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名5', '/assets/image/headphoto/default.png', '0', '20', '35', null, null, null, '2014-09-13 16:18:20', '2014-09-13 16:18:20', null);
INSERT INTO `t_register` VALUES ('35', 'TA201409131633387607', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名6', '/assets/image/headphoto/default.png', '0', '20', '35', null, null, null, '2014-09-13 16:33:38', '2014-09-13 16:33:38', null);
INSERT INTO `t_register` VALUES ('36', 'TA201409131636416765', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名7', '/assets/image/headphoto/default.png', '0', '20', '35', null, null, null, '2014-10-06 14:19:11', '2014-09-13 16:36:41', null);
INSERT INTO `t_register` VALUES ('37', 'TA201409131654548358', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '张三', '/assets/image/headphoto/default.png', '0', '0', '35', null, null, null, '2014-09-13 16:54:54', '2014-09-13 16:54:54', null);
INSERT INTO `t_register` VALUES ('38', 'TA201409131733395301', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '姓名8', '/assets/image/headphoto/default.png', '0', '20', '35', null, null, null, '2014-10-06 19:27:41', '2014-09-13 17:33:39', null);
INSERT INTO `t_register` VALUES ('39', 's00001', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '管理员①', '/assets/image/headphoto/default.png', '0', '0', '20', null, null, null, '2014-10-03 19:20:23', '2014-10-03 12:29:25', null);
INSERT INTO `t_register` VALUES ('40', 'NJU141090105', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '张三同学', '/assets/image/headphoto/default.png', '0', '0', '40', null, null, null, '2014-10-06 19:25:30', '2014-10-06 14:21:00', null);
INSERT INTO `t_register` VALUES ('41', 'NJU141090106', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '张四同学', '/assets/image/headphoto/default.png', '0', '0', '40', null, null, null, '2014-10-06 19:20:52', '2014-10-06 14:36:27', null);
INSERT INTO `t_register` VALUES ('42', 'NJU141090107', '1f604490cbdd4ec35cfa681bcf3df8fac26e0cb5', '赵同学', '/assets/image/headphoto/default.png', '0', '0', '40', null, null, null, '2014-10-06 19:26:04', '2014-10-06 19:26:04', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '23', '100', '0', 'NJU123', '张三', null, '0', '0', null, '0', null, null, null, null, null, null, '/assets/image/headphoto/default.png', null, null, null, '1', '1', '1', '1', '1', '1', '1', '0', '0', '2014-09-10 19:50:25');
INSERT INTO `t_user` VALUES ('2', '28', '100', '0', '100', '李四', null, '0', '0', null, '0', null, null, null, null, null, null, '/assets/image/headphoto/default.png', null, null, null, '1', '1', '1', '1', '1', '1', '1', '0', '1', '2014-09-10 20:00:27');
INSERT INTO `t_user` VALUES ('3', '29', '70', '0', '10', '王五', null, '0', '0', null, '0', null, null, null, null, null, null, '/assets/image/headphoto/default.png', null, null, null, '1', '1', '1', '1', '1', '1', '1', '0', '0', '2014-09-10 20:34:53');
INSERT INTO `t_user` VALUES ('4', '33', '70', '0', 'TA201409131614036380', '姓名1', null, '0', '0', null, '1', null, null, null, null, null, null, '/assets/image/headphoto/default.png', null, null, null, '0', '0', '0', '0', '0', '0', '1', '0', '1', '2014-09-13 16:14:03');
INSERT INTO `t_user` VALUES ('5', '34', '70', '0', 'TA201409131618208587', '姓名9', null, '0', '0', null, '1', '邮箱', null, '联系电话', null, '办公室', null, '/assets/image/headphoto/default.png', null, null, null, '0', '0', '0', '0', '0', '0', '1', '0', '1', '2014-09-13 16:18:20');
INSERT INTO `t_user` VALUES ('6', '35', '70', '0', 'TA201409131633387607', '姓名2', null, '0', '0', null, '1', '2343453@ww.com', null, '联系电话2', null, '办公室2', '/image/2014_09_13_17_31_05_1952154255.jpg', '/assets/image/headphoto/default.png', null, null, null, '0', '0', '0', '0', '0', '0', '1', '0', '1', '2014-09-13 16:33:38');
INSERT INTO `t_user` VALUES ('7', '36', '70', '0', 'TA201409131636416765', '张XX', null, '0', '0', null, '1', '123456@nju.com', null, '联系电话', null, '办公室', '', '/assets/image/headphoto/default.png', null, null, null, '0', '0', '0', '0', '0', '0', '1', '0', '1', '2014-10-06 14:18:52');
INSERT INTO `t_user` VALUES ('8', '37', '70', '0', 'TA201409131654548358', '张助教', null, '0', '0', null, '1', 'zhangsan@nju.edu.cn', null, '15900001236', null, '系楼233', '/image/2014_09_13_18_25_37_2122758271.png', '/assets/image/headphoto/default.png', null, null, null, '0', '0', '0', '0', '0', '0', '1', '0', '1', '2014-10-06 19:29:52');
INSERT INTO `t_user` VALUES ('9', '38', '70', '0', 'TA201409131733395301', '姓名11', null, '0', '0', null, '1', '邮箱', null, '联系电话', null, '办公室', '', '/assets/image/headphoto/default.png', null, null, null, '0', '0', '0', '0', '0', '0', '1', '0', '1', '2014-09-13 17:33:39');
INSERT INTO `t_user` VALUES ('10', '40', '0', '0', '141090105', '张三同学', null, '0', '0', null, '1', null, null, null, null, null, null, '/assets/image/headphoto/default.png', null, null, '2014', '1', '1', '1', '1', '0', '0', '0', '0', '1', '2014-10-06 19:19:42');
INSERT INTO `t_user` VALUES ('11', '41', '0', '0', '141090106', '张四同学', null, '0', '0', null, '1', null, null, null, null, null, null, '/assets/image/headphoto/default.png', null, null, '2014', '1', '1', '1', '1', '0', '0', '0', '0', '1', '2014-10-06 19:20:52');
INSERT INTO `t_user` VALUES ('12', '42', '0', '0', '141090107', '赵同学', null, '0', '0', null, '1', null, null, null, null, null, null, '/assets/image/headphoto/default.png', null, null, '2014', '1', '1', '1', '1', '0', '0', '0', '0', '1', '2014-10-06 19:26:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_z
-- ----------------------------
INSERT INTO `t_z` VALUES ('1', '1', '0', '2014-08-29 20:19:41', '2014-09-18 21:54:29', null, '2014-09-18 21:54:29', null, '科学家首次发现恒星级黑洞 距离地球600光年', '【科技讯】9月18日消息，据媒体报道，天文学家在距离地球600万光年处首次发现恒星级黑洞，这个数据刷新了以往所发现恒星级黑洞的距离。 \n\n\n	&lt;img src=&quot;http://img.kejixun.', '&lt;p&gt;\n	&lt;span&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 【科技讯】9&lt;/span&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;月18日消息，据媒体报道，天文学家在距离地球600万光年处首次发现恒星级黑洞，这个数据刷新了以往所发现恒星级黑洞的距离。&lt;/span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;/span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;/span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;/span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;/span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;/span&gt;&lt;span&gt;&lt;span&gt;&lt;/span&gt;&lt;span&gt;&lt;span&gt;&lt;/span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;/span&gt;&lt;span&gt;&lt;span&gt;&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;em&gt;&lt;/em&gt; \n&lt;/p&gt;\n&lt;p style=&quot;text-align:center;&quot;&gt;\n	&lt;span&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;img src=&quot;http://img.kejixun.com/2014/0918/20140918084930439.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\n&lt;/span&gt;&lt;/span&gt; \n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt; &lt;/span&gt;&lt;/span&gt; \n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&amp;nbsp;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;最新公布的数据表明，这个远离地球600万光年的黑洞位于一个螺旋状星系内，即NGC300。谢菲尔德大学天文学教授称，它是我们迄今观测到的最远的恒星级黑洞，也是人类第一次在银河系周边范围之外发现这个级别的黑洞。早在2007年，美国国家航空航天局使用X射线探测器对NGC300内部最强烈的X射线源进行了观测，这个研究项目要早于欧洲空间局XMM-牛顿X射线空间天文台的观测。\n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 欧空局的相关人员解释道：“我们将定期对强烈的X射线源进行记录，有迹象表明黑洞会隐藏在这个区域。”我们知道，由于物质在被黑洞吸积过程中，引力势能转化为物质的动能，在转化为热能，在离黑洞最近的吸积盘内区，X射线的辐射是最强的，所以通过对X射线辐射量的观测，可以得到一些黑洞的行为特性。\n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 在对这个黑洞的观测中，天文学家发现它的伴星质量达到了20倍太阳质量，而且他们相互之间剧烈的旋转，就像绚丽的华尔兹，一个周期只有32个小时。同时，这颗伴星上的大量物质也被剥离，吸入黑洞，由此形成吸积盘。\n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 以往在银河系内发现的恒星级黑洞质量达到10倍太阳质量，这个级别的黑洞的银河系外可能也只算个轻量级的。像一个黑洞和一个伴星组成的系统在以往的观测中被发现过，所以天文学家对这类的天体系统还是比较了解，基于这个天体系统，天文学家可以发现黑洞的物质与星系化学之间的关系，他们相信高浓度的重元素将影响一个大质量恒星的演化。\n&lt;/p&gt;\n&lt;br /&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;', '30', '0', '2', '/image/2014_09_18_21_34_44_646429260.jpg', null, '0');
INSERT INTO `t_z` VALUES ('3', '1', '0', '2014-08-30 10:56:29', '2014-08-31 12:00:38', null, '2014-08-30 11:15:35', null, '光速可能没那么快 相对论错了吗', '【科技讯】8月29日消息，据国外媒体报道，爱因斯坦的相对论告诉我们光的速度是宇宙中最快的，而且没有物体的运动速度能超过光速，光在真空中的速度为每秒186282英里，大约为每秒299791公里，来自马里兰大学的研究人员詹姆斯·福兰森博士认为光速可能没有达到这个速度值，真实的光速可能要慢一些，这可能是真', '&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;【&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科技&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;讯】8月29日消息，据国外媒体报道，爱因斯坦的相对论告诉我们光的速度是宇宙中最快的，而且没有物体的运动速度能超过光速，光在真空中的速度为每秒186282英里，大约为每秒299791公里，来自马里兰大学的研究人员詹姆斯·福兰森博士认为光速可能没有达到这个速度值，真实的光速可能要慢一些，这可能是真空的缘故使得光速会变慢一些。福兰森博士还列举了一项研究发现，根据对1987年超新星的观测研究，发现这颗超新星的光子抵达地球的时间慢了4.7个小时。&lt;/span&gt; \n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt; &lt;/span&gt; \n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	如果福兰森博士的研究结论是正确的，那么就意味着我们对光速的认识是错误的，同时也标志着我们以前对太阳系外天体的距离估算都是不准确的，尤其是一些距离银河系非常遥远的宇宙早期星系。爱因斯坦的光速理论已经被世人所接受，早在1905年，爱因斯坦就提出了这个影响人类&lt;a href=&quot;http://www.kejixun.com/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科技&lt;/a&gt;史的物理理论，但是一百多年后马里兰大学博士的研究结论认为真实光速比我们所知的要慢一些。\n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 福兰森博士对SN 1987a超新星进行了研究，试图对恒星爆发后的中微子进行调查，这是一种呈电中性的亚原子粒子，但是抵达地球的时间却晚了4.7个小时。针对这个结论，马里兰大学的物理学家认为光的速度出现变化可能是由于真空极化的问题，该现象与光子被分解成正电子与电子有关，从量子力学的角度上看，在虚粒子对之间还存在引力势，该机制可能造成了光速变慢的现象。\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;&amp;nbsp;如果这一推测是正确的，那么就意味着在16.8万光年上会出现大约5小时的延迟，我们目前对太阳系外天体的距离估算也会进行重新调整，目前福兰森博士的论文已经提交给《新物理学》杂志。根据爱因斯坦的相对论，真空中光速是恒定的，如果一位旅行者以光速移动，那么他可以在一秒内环游赤道7.5圈，相比之下，乘坐喷气式飞机的旅客穿越美国大陆需要4个小时。爱因斯坦的相对论也指出，宇宙中没有任何物体的速度能够超过光速，如果光速确实变慢了，那么太阳系之外的天体距离可能需要重新估算了。&lt;/span&gt; \n&lt;/p&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;', '0', '3', '0', '/image/2014_08_30_11_13_44_927688553.png', null, '0');
INSERT INTO `t_z` VALUES ('4', '1', '0', '2014-08-30 11:18:50', '2014-08-30 11:53:05', null, '2014-08-30 11:53:05', null, '美航空局观察到光逃出了黑洞', '【科技讯】8月30日消息，据国外媒体报道，美国宇航局核频谱望远镜阵列已经观测到超大质量黑洞周围罕见的X射线致密光源，位于黑洞附近，科学家将其称为X射线光冕，这是在黑洞周围出现的极端事件。如图中所示，艺术家绘制了超大质量黑洞周围的辐射环境，强烈的X射线将黑洞周围的时空照得通明，这种辐射来自黑洞周围的吸', '&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;【&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科技&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;讯】8月30日消息，据国外媒体报道，美国宇航局核频谱望远镜阵列已经观测到超大质量黑洞周围罕见的X射线致密光源，位于黑洞附近，&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;家将其称为X射线光冕，这是在黑洞周围出现的极端事件。如图中所示，艺术家绘制了超大质量黑洞周围的辐射环境，强烈的X射线将黑洞周围的时空照得通明，这种辐射来自黑洞周围的吸积盘，&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;家将系统命名为Mrk 335，但其实际的形状到目前为止仍然不是非常清晰。&lt;/span&gt; \n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 来自英国剑桥天文学研究所科学家迈克尔·帕克认为在黑洞的引力作用下，所有光线都被引导向黑洞周围的吸积盘上，一些物质则以螺旋状落入黑洞之中，由于光冕的位置较为靠近黑洞，在黑洞的引力作用下，X射线的行为变得非常怪异，似乎与引力之间产生了拉锯战，结果形成了罕见拉伸状的X射线，虽然这样的事件此前已经被观察过，但从来没有看到如此极端的X射线扭曲现象，而且X射线的细节比此前更加清楚。\n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;超大质量黑洞被认为存在于几乎所有的星系中央附近，有些黑洞的质量更大、旋转速度也比其他黑洞要快得多，本次观测到的黑洞极端行为位于飞马座方向上，距离我们大约3.24亿光年，该黑洞的致密程度相当于将1000万倍的太阳质量集中在30倍太阳直径的空间中，由于其自转速度极快，周围的时空也被拖拽，形成了极端的黑洞周围空间环境。&lt;/span&gt; \n&lt;/p&gt;\n&lt;p style=&quot;text-align:center;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;img src=&quot;/eds/Public/kindeditor-4.1.10/attached/image/20140830/20140830055257_93240.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\n&lt;/span&gt;\n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:22px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;美国宇航局核频谱望远镜阵列通过观测发现，尽管一些光会落入黑洞之中，无法逃脱黑洞的引力控制，但是黑洞仍然可辐射出高能量的“光”，其主要来自光冕和周围被加速至接近光速的物质，虽然科学家不确定光冕的形状和温度，但我们已经知道这些物质粒子的运行速度接近光速。&lt;/span&gt; \n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:22px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;NASA的“雨燕”探测器已经对Mrk 335系统监视了多年，最近发现其X射电亮度出现了有趣的变化，其高能X射线位于3至79千电子伏，这个特殊的能量区间为天文学家提供了较好的观测时机，可以了解到黑洞事件视界边缘所发生的现象，核频谱望远镜阵列的观测表明，Mrk 335黑洞系统光冕区所发出的“光”被黑洞的引力拉回，并投射到致密的物质盘，就好像有人用手电筒照亮了黑洞周围。&lt;/span&gt; \n&lt;/p&gt;', '30', '3', '0', '/image/2014_08_30_11_18_48_1732713233.png', null, '2');
INSERT INTO `t_z` VALUES ('5', '1', '0', '2014-08-30 12:39:09', '2014-08-30 13:02:19', null, null, null, '科学家揭示宇宙起源新解释 或从崩塌中反弹而生', '8月29日消息，据媒体报道，科学家使用南极Bicep2 探测器发现支持宇宙大爆炸的证据的时候，但很多问题慢慢开始浮现出来。这其中不仅包括其精确性，还包括这项发现对科学整体本身究竟具有何种意义。一部分科', '&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;8月29日消息，据媒体报道，科学家&lt;/span&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;使用南极Bicep2 探测器发现支持宇宙大爆炸的证据的时候，但很多问题慢慢开始浮现出来。这其中不仅包括其精确性，还包括这项发现对科学整体&lt;/span&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;本身究竟具有何种意义。一部分科学家指出，其开端可能并非一次大爆炸，而是一次“大反弹”。&lt;/span&gt;', '60', '0', '0', '', null, '0');
INSERT INTO `t_z` VALUES ('6', '1', '0', '2014-08-30 12:39:14', '2014-09-18 21:52:40', null, '2014-09-18 21:52:40', null, '科学家揭示宇宙起源新解释 或从崩塌中反弹而生', '【科技讯】8月29日消息，据媒体报道，科学家使用南极Bicep2 探测器发现支持宇宙大爆炸的证据的时候，但很多问题慢慢开始浮现出来。这其中不仅包括其精确性，还包括这项发现对科学整体本身究竟具有何种意义', '&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;【&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科技&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;讯】8月29日消息，据媒体报道，&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;家使用南极Bicep2 探测器发现支持宇宙大爆炸的证据的时候，但很多问题慢慢开始浮现出来。这其中不仅包括其精确性，还包括这项发现对&lt;/span&gt;&lt;a href=&quot;http://www.kejixun.com/kexue/&quot; target=&quot;_blank&quot; class=&quot;keylink&quot;&gt;科学&lt;/a&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;整体本身究竟具有何种意义。一部分科学家指出，其开端可能并非一次大爆炸，而是一次“大反弹”。&lt;/span&gt; \n&lt;/p&gt;\n&lt;p style=&quot;text-align:center;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;img src=&quot;/eds/Public/kindeditor-4.1.10/attached/image/20140830/20140830075446_32521.png&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\n&lt;/span&gt; \n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;这项研究是对此前部分科学家研究成果的继承和推进，“大反弹”理论认为宇宙并非一定要从一个所谓的“奇点”诞生，而是从上一个宇宙的崩塌中反弹而生。他们认为，很显然可以证明这样一次事件曾经发生的证据就隐藏在此次Bicep2试验所获得的数据之中。&lt;/span&gt;&lt;br /&gt;\n&lt;/span&gt; \n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;研究人员提出，如果大反弹理论是正确的，那么后者的可能性或许会更高一些。这项理论基于所谓“圈量子引力”，这是统一量子力学与广义相对论的一项尝试，而它本身便是引力对宇宙产生作用的表现形式。其基本内涵是认为宇宙可被视作是许多缠绕的圈环，从而赋予空间本身一种类似原子的结构，使其成为类似物质的东西。&lt;/span&gt;&lt;/span&gt; \n&lt;/p&gt;\n&lt;p&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt; &lt;/span&gt;\n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;在LQG理论下，引力可以随着宇宙密度的上升而成为一种反弹力，就像弹簧被压缩到一定的程度之后就会变得更难继续进一步压缩。如果宇宙的确曾经塌缩，当它达到某一临界尺度，最终还将会再次反弹。这一扩张过程就是所谓“暴涨”，也就是此次在Bicep2的数据中找到的证据所代表的结果。\n&lt;/p&gt;\n&lt;p style=&quot;text-align:center;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&lt;img src=&quot;/eds/Public/kindeditor-4.1.10/attached/image/20140830/20140830075619_57551.png&quot; alt=&quot;&quot; /&gt; \n&lt;/p&gt;\n&lt;p style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 这一新的理论将解决一些棘手的问题，如宇宙大爆炸之前是什么？一个正在收缩中，尚未抵达其最小尺度的宇宙。随后宇宙便再次膨胀，未来还将需要借助Bicep2和其他望远镜设备的观测结果，才能最终判断这一理论的正确与否。\n&lt;/p&gt;\n&lt;br /&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;', '30', '0', '0', '/image/2014_08_30_13_50_31_1447562998.png', null, '0');
INSERT INTO `t_z` VALUES ('7', '1', '0', '2014-08-30 15:53:08', '2014-09-06 10:09:34', null, '2014-09-06 10:09:34', null, '大反弹理论', '研究人员提出，如果大反弹理论是正确的，那么后者的可能性或许会更高一些。这项理论基于所谓“圈量子引力”，这是统一量子力学与广义相对论的一项尝试，而它本身便是引力对宇宙产生作用的表现形式。其基本内涵是认为', '&lt;span style=&quot;color:#333333;font-family:\'Microsoft YaHei\', MingLiu, Georgia, sans-serif;font-size:15px;line-height:26px;&quot;&gt;&amp;nbsp;研究人员提出，如果大反弹理论是正确的，那么后者的可能性或许会更高一些。这项理论基于所谓“圈量子引力”，这是统一量子力学与广义相对论的一项尝试，而它本身便是引力对宇宙产生作用的表现形式。其基本内涵是认为宇宙可被视作是许多缠绕的圈环，从而赋予空间本身一种类似原子的结构，使其成为类似物质的东西。&lt;/span&gt;', '30', '4', '0', null, null, '0');
INSERT INTO `t_z` VALUES ('8', '1', '0', '2014-08-30 15:54:33', '2014-08-30 16:13:57', null, '2014-08-30 16:13:57', null, '南京大学2013年物理学院拔尖选拔结果', '经过笔试、面试，并综合高考成绩（参考），物理学院初步遴选以下30位同学进入拔尖计划。请名单中各位同学于明天（9月15日）中午12:00在仙林校区教学楼仙II-217签名确认（带校园卡）。今天不需要在网', '经过笔试、面试，并综合高考成绩（参考），物理学院初步遴选以下30位同学进入拔尖计划。请名单中各位同学于明天（9月15日）中午12:00在仙林校区教学楼仙II-217签名确认（带校园卡）。今天不需要在网上审核确认。&amp;nbsp;&lt;br /&gt;\n&lt;br /&gt;\n如果以下名单中的同学提出放弃物理学院拔尖计划，请尽快用电话与我联系。并填写放弃拔尖计划承诺书，签名后于明天中午一并在仙II-217给我。&amp;nbsp;&lt;br /&gt;\n&lt;br /&gt;\n&lt;br /&gt;\n&lt;br /&gt;\n朱敏超 131150057 &amp;nbsp; 地球科学与工程学院&amp;nbsp;&lt;br /&gt;\n周子恒 131120155 &amp;nbsp; 物理学院&amp;nbsp;&lt;br /&gt;\n张雪琪 131160069 &amp;nbsp; 地理与海洋科学学院&amp;nbsp;&lt;br /&gt;\n张楠 &amp;nbsp; &amp;nbsp; 131170043 &amp;nbsp; 大气科学学院&amp;nbsp;&lt;br /&gt;\n张杰同 131180019 &amp;nbsp; 电子科学与工程学院&amp;nbsp;&lt;br /&gt;\n张光耀 131120159 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n易伟柱 131120078 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n杨王飞 131170036 &amp;nbsp; &amp;nbsp;大气科学学院&amp;nbsp;&lt;br /&gt;\n杨硕 &amp;nbsp; &amp;nbsp; 131120112 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n许凡 &amp;nbsp; &amp;nbsp; 131250121 &amp;nbsp; &amp;nbsp;软件学院&amp;nbsp;&lt;br /&gt;\n邢奕飞 131120011 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n魏博超 131120142 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n王泽俊 131130054 &amp;nbsp; &amp;nbsp;化学化工学院&amp;nbsp;&lt;br /&gt;\n王伟 &amp;nbsp; &amp;nbsp; 131270016 &amp;nbsp; &amp;nbsp;工程管理学院&amp;nbsp;&lt;br /&gt;\n王沛宇 131140037 &amp;nbsp; &amp;nbsp;生命科学学院&amp;nbsp;&lt;br /&gt;\n孙泽维 131220096 &amp;nbsp; &amp;nbsp;计算机科学与技术系&amp;nbsp;&lt;br /&gt;\n宋谦 &amp;nbsp; &amp;nbsp; 131120018 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n钱祉源 131120006 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n马同川 131150016 &amp;nbsp; &amp;nbsp;地球科学与工程学院&amp;nbsp;&lt;br /&gt;\n林泽勋 131160056 &amp;nbsp; &amp;nbsp;地理与海洋科学学院&amp;nbsp;&lt;br /&gt;\n连震 &amp;nbsp; &amp;nbsp; 131120075 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n纪宵宇 131120198 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n李昊阳 131120191 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n黄贤雷 131130091 &amp;nbsp; &amp;nbsp;化学化工学院&amp;nbsp;&lt;br /&gt;\n黄诗华 131120144 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n胡博伦 131120202 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n高凡 &amp;nbsp; &amp;nbsp; 131190051 &amp;nbsp; &amp;nbsp;现代工程与应用科学学院&amp;nbsp;&lt;br /&gt;\n程恩泽 131120025 &amp;nbsp; &amp;nbsp;物理学院&amp;nbsp;&lt;br /&gt;\n陈天宇 131150053 &amp;nbsp; &amp;nbsp;地球科学与工程学院&amp;nbsp;&lt;br /&gt;\n陈墨雨 131130128 &amp;nbsp; &amp;nbsp;化学化工学院&amp;nbsp;&lt;br /&gt;\n&lt;br /&gt;', '60', '4', '0', null, null, '0');
INSERT INTO `t_z` VALUES ('9', '1', '0', '2014-08-30 15:59:07', '2014-08-30 15:59:07', null, '2014-08-30 15:59:07', null, 'asdfsdfasdf', 'asfasfasdfasgasdfgdfgasdfa', 'asfasfasdfasgasdfgdfgasdfa', '60', '4', '0', null, null, '0');
INSERT INTO `t_z` VALUES ('10', '1', '0', '2014-08-30 16:18:49', '2014-08-30 16:19:32', null, '2014-08-30 16:19:32', null, '“基础学科拔尖学生培养试验计划”阶段性总结交流会将在清华举行', '“基础学科拔尖学生培养试验计划”（以下简称“拔尖计划”）阶段性总结交流会在主楼接待厅举行。时间定在9月26号，欢迎参加拔尖计划的各校老师莅临指导。', '&lt;span style=&quot;color:#006600;font-size:24px;&quot;&gt;&amp;nbsp;&lt;span style=&quot;font-size:32px;&quot;&gt;“基础学科拔尖学生培养试验计划”（以下简称“拔尖计划”）阶段性总结交流会在主楼接待厅举行。时间定在9月26号，欢迎参加拔尖计划的各校老师莅临指导。&lt;/span&gt;&lt;/span&gt;', '30', '4', '0', null, null, '0');
INSERT INTO `t_z` VALUES ('11', '1', '0', '2014-09-20 10:32:39', '2014-09-20 10:32:39', null, '2014-09-20 10:32:39', null, '太阳中微子失踪之迷', '1\n\n\n	 \n\n\n	       非常有幸，转了四次飞机，穿梭近一万公里，来到西半球靠近北极的地方，深入到地下两千一百多公尺，观察的却是一亿四千九百六十万公里之外，来自太阳的秘密。\n\n\n	      ', '&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;text-align:center;&quot;&gt;\n	1\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;text-align:center;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;非常有幸，转了四次飞机，穿梭近一万公里，来到西半球靠近北极的地方，深入到地下两千一百多公尺，观察的却是一亿四千九百六十万公里之外，来自太阳的秘密。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;爱尔兰籍加拿大教授，我的项目合作伙伴克劳伦斯，当他一大清早打电话来说，要带我去萨德伯里中微子天文台（Sudbury Neutrino Observatory，SNO），确实让人喜出望外。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;加拿大安大略省北部中心城市萨德伯里，位于美国与加拿大交界的五大湖区，与北极著名的哈德逊湾，只隔了一道劳伦琴低高原。虽说已是初夏，却还纷纷扬扬，下起五月的第二场雪。放暑假也有十多天了，却还在校园RAMSEY湖边，看见薄薄的一层冰。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;高寒地区的学校，布局都非常紧凑，建筑物几乎紧挨着。区域和区域之间，用密闭的连廊相通。为了防寒，连廊被分成好几段，不少岔路口，钻在里边像迷宫，不经意就会走错。分隔每个空间的门上，都装有锁紧装置，要用很大的劲，才能够推开。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;text-align:center;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; 2\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;真准时啊，才刚过八点，大门的玻璃方窗孔上，就出现了克劳伦斯，被冻得发红的脸庞。他那高耸的鼻梁，被玻璃压得有些扁平。褐色的眼睛眯缝着，笑容可掬。灰白头发，还挂着几片雪花。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;我推开门，见他手里拎一包东西，像是午餐用的，像上次去诺斯贝，在休伦湖边租一个炉子，烤的生肉和熏肠，还有芥末和咖喱粉。当然少不了巧克力，和这里特有的一种枫糖。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;克劳伦斯身体非常棒，一米八六个头，四十六岁年纪。只是这一头银发啊，原以为他是天生的，却在一次询问时，听见他的叹息：“这个该死的项目啊，开始还不到一年，就把我的头发，由棕色变成白色”。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;看来国外的教授，也不像传说中那样轻松，何况他们，正从事着世界级的项目研究。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;text-align:center;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; 3\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;中微子，一种不带电、穿透力极强的基本粒子，质量非常轻（小于电子的百万分之一），以接近光速运动，存在三种类型：电子中微子、μ子中微子和τ子中微子。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;恒星的热核反应，会释放大量的电子中微子。科学家从20世纪70年代开始测算，却发现，从太阳到达地球的电子中微子数量，仅为根据太阳活动理论推算出的三分之一，所谓“中微子失踪之谜”，意味着目前的太阳活动理论，或中微子物理模型，至少有一个存在偏差。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;为了弄清这个问题，科学家在世界各地建造了多个观测站，萨德伯里就是最重要的站点之一。正是这里，在我们到来前不久，向世界发布了研究取得的重大进展。证实了太阳热核反应释放的电子中微子，在辐射到地球的路上，部分转变成了其它类型（μ子和τ子）。这与太阳活动理论的预期非常吻合，却与现代物理学的中微子标准模型相悖。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;美国《科学》杂志，随即评选该发现为年度世界十大科技突破，这也导致美国人戴维斯和日本人小柴昌俊，获得了当年的诺贝尔物理学奖。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;text-align:center;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; 4\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;克劳伦斯开一辆银白色尼桑车，带着我从劳伦琴大学校园出发。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;天色尚早，风呼呼吹，车开在林间小路，荡起一路的雪片。克劳伦斯饶有兴致，停车撕下一张桦树皮，给我讲述他们的先人，曾在这薄薄的桦树皮上写情书。随即他坐上车，一脚油门，让无数银白色的树干，在眼前急速闪过。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;走出美丽的桦树林，眼前出现了清澈湖泊，湖边有连片的木屋别墅，更有长满苔藓的黑色土壤。这里位于休伦湖北岸，空气弥散着臭氧的味道。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;渐渐地，天又下起了雪，让通向SNO的道路，变得泥泞起来。克劳伦斯不得不紧踩油门，用发动机最大声的轰鸣，驱动汽车一路上行。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;坡上的土地有些荒凉，呈现出极地的地貌特征。一个烟囱高耸在前方，招呼我们停下车来，这是到了国际镍业公司(Inco)的一个矿井。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;text-align:center;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; 5\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;史前的宇宙大爆炸，使地球表面，残存着大量的电子中微子，每立方厘米约100个。太阳辐射到达地球的中微子，很容易被这些杂散粒子所湮没。正是这个原因，使得对太阳中微子的研究，不能选择在地表进行。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;好在太阳热核反应，所发散的电子中微子，具有最强的穿透力。穿越地球直径厚的物质，100亿个中微子中，只有1个会与其它物质反应，余下的将如数通过。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;这也就是能在地球深处，研究太阳中微子的原因。在南极洲的冰层下，地中海的海底，贝加尔湖的深处，还有北美极地的矿井，这些地方没有散射中微子的干扰，太阳辐射的电子中微子，却能准确到达。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;萨德伯里中微子天文台（SNO），就建在一座，19世纪开始投入开采的镍矿深处，这里距地表约2公里（6800英尺），宇宙大爆炸残留的电子中微子含量稀少，几乎可以忽略不计。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;text-align:center;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; 6\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;要去萨德伯里中微子天文台（SNO），必须首先经过国际镍业公司(Inco)的矿井。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;镍矿含放射性物质，在进入矿井之前，必须穿戴防护用具：红色头盔（前边有灯的那种），蓝色工作服（具有防辐射的金属夹层），棕色皮靴，还有眼镜、口罩和手套。等浑身上下的皮带扎紧之后，才能同上班的矿工一道，到矿井入口排队。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;先乘坐20分钟吊笼，下降到两公里深处，再用20分钟，走了近3公里的隧道。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;这是一条宽敞的矿道，每隔50米，才有一盏橘黄色路灯。灰暗的岩壁上，不时闪烁银光，这是金属镍所发出的。走在此处，就像走在密闭的金属盒子里，有一种要窒息的感觉。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;到了天文台门口，隧道亮堂起来。别急，在进入实验室前，还有更复杂的程序。先用强风鼓去身上的放射性尘埃，再脱光衣服进到浴室里沐浴，洗净后用强风吹干，换上白大褂，戴好帽子和眼镜。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;自动门徐徐打开，终于见到了传说中的SNO，复杂地让人目瞪口呆。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;text-align:center;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; 7\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;这是目前世界上，唯一的重水介质实验室，称为重水契仑可夫探测器，设备有10层楼高。造价嘛，先不说别的，就说这1000吨的重水，就价值16亿加元（约96亿人民币）。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;中微子通过重水（含有氢的同位素氘），当速度大于光在这种介质中的传播速度时，就会被氘核吸收，释放2个质子和1个电子，产生切伦科夫辐射的蓝色闪光。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;根据这种效应，科学家们建造了太阳中微子观测站，其主要部分是直径12米的球形容器，装有1000吨重水，容器壁用丙烯酸树脂制成，厚度5厘米，容器周围安装了9600个光电倍增管，用于探测和放大伦科夫辐射的微弱光线。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;这座探测器，被浸泡在30米高的圆柱形容器中（充满了轻水），使得这座中微子观测站，像一个深埋在地心的庞然大物，配上些蓝色或红色的射线，仿佛神话中的冥界。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;text-align:center;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; 8\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;克劳伦斯在项目里，负责同步测量系统，这也是他，想让我熟悉的主要部分。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;通过同时测量三维多向到达的微弱光信号，计算中微子与重水反应产生的瞬时质子数。并根据多个传感器信息的综合，确定出辐射路径，进而区分产生蓝光的中微子，究竟来自那一个天体？\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;这是一个庞大的系统，有高精度的铷时钟源，伪随机编码的9600个传感器，9600套光电倍增设备，还有热控制仪、测量指令系统和信息处理终端等。涉及到小信号处理、抗杂散干扰和同步精准测量等多项技术，复杂地让人一时反应不过来。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;工作在实验室里，克劳伦斯非常自豪，他说：“这里集中了目前世界上，最顶级的天体物理学家和核物理学家，他们夜以继日地工作，研究已取得重大进展。”\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;我不知道戴维斯和小柴昌俊（诺贝尔物理学奖获得者），是否也在这一群人当中？\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;text-align:center;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; 9\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;午餐时候，见到一个女孩，像来自我们中国，清秀模样，微笑表情，看一眼就觉得亲切。她穿一件白大褂，戴一顶蓝色橱帽，推一辆金属橱柜车，彬彬有礼，走进走出，为我们送点心和咖啡。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;我好奇地打量这位“同胞”，心里在想：中国人真不简单，洋打工，干粗活的，都能走这么远的距离，到这种神秘的地方来。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;趁她为我收拾餐具，我询问了她，却见她笑笑，说：“我是日本人，来自东京都，剑桥大学博士毕业后，选择到这里实习。”\n&lt;/p&gt;\n&lt;p style=&quot;font-family:Tahoma, Helvetica, SimSun, sans-serif, Hei;font-size:14px;background-color:#FFFFFF;&quot;&gt;\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;这让我倒抽了一口凉气，端水和送饭，都用剑桥的博士，这个地方，真叫卧虎藏龙！\n&lt;/p&gt;', '30', '0', '0', '', null, '0');
INSERT INTO `t_z` VALUES ('12', '1', '0', '2014-09-20 10:37:36', '2014-09-20 10:43:53', null, '2014-09-20 10:43:53', null, '丁肇中公布最新研究成果显示暗物质可能存在', '新华网日内瓦９月１８日电（记者张淼　施建国）诺贝尔奖得主、美籍华人物理学家丁肇中１８日公布阿尔法磁谱仪项目最新研究成果，进一步显示宇宙射线中过量的正电子可能来自暗物质。\n\n\n	２０１１年升空的阿尔法磁', '&lt;p style=&quot;font-family:宋体;font-size:14px;background-color:#F8F9F4;text-indent:2em;&quot;&gt;\n	新华网日内瓦９月１８日电（记者张淼　施建国）诺贝尔奖得主、美籍华人物理学家丁肇中１８日公布阿尔法磁谱仪项目最新研究成果，进一步显示宇宙射线中过量的正电子可能来自暗物质。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:宋体;font-size:14px;background-color:#F8F9F4;text-indent:2em;&quot;&gt;\n	２０１１年升空的阿尔法磁谱仪由国际空间站搭载，任务是寻找暗物质并探寻其起源。根据现有理论，宇宙中的暗物质远远多于普通物质，暗物质碰撞会产生过量的正电子，阿尔法磁谱仪可对宇宙射线中的正电子进行精密观测。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:宋体;font-size:14px;background-color:#F8F9F4;text-indent:2em;&quot;&gt;\n	根据研究小组在最新一期美国&lt;a href=&quot;http://journals.aps.org/prl/abstract/10.1103/PhysRevLett.113.121102&quot; target=&quot;_blank&quot;&gt;&lt;strong&gt;《物理评论快报》&lt;/strong&gt;&lt;/a&gt;上发布的数据，阿尔法磁谱仪观察到的４１０亿个宇宙射线事件中，约有１０００万个是电子或正电子。从８吉电子伏特（１吉等于１０亿）的能量开始，正电子占电子与正电子总数的比例快速增加，在２７５吉电子伏特左右停止增长。比例上升的过程较为均衡，没有明显峰值。此外，正电子似乎来源于宇宙空间的各个方向，而不是某个特定方向。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:宋体;font-size:14px;background-color:#F8F9F4;text-indent:2em;&quot;&gt;\n	研究人员说，观测到的正电子分布特征与暗物质理论的某个模型一致，该模型认为暗物质由一种称为“中轻微子”的粒子组成。不过，这些过量的正电子到底是来源于暗物质，还是来源于脉冲星等天文现象，还需要进一步分析确认。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:宋体;font-size:14px;background-color:#F8F9F4;text-indent:2em;&quot;&gt;\n	项目首席科学家丁肇中教授１８日晚对新华社记者说，暗物质碰撞产生过量正电子有６个特征，开始点、上升速率、最高点等５个特征都已被阿尔法磁谱仪测量到，最后一个特征就是测量正电子产生率会不会突然下降。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:宋体;font-size:14px;background-color:#F8F9F4;text-indent:2em;&quot;&gt;\n	“怎么样下降，慢慢地下降还是很快地下降？很快地下降就一定是暗物质，”丁肇中说。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:宋体;font-size:14px;background-color:#F8F9F4;text-indent:2em;&quot;&gt;\n	&lt;a href=&quot;http://journals.aps.org/prl/abstract/10.1103/PhysRevLett.113.121101&quot; target=&quot;_blank&quot;&gt;&lt;u&gt;&lt;strong&gt;研究小组在同一期杂志上发表的另一篇论文&lt;/strong&gt;&lt;/u&gt;&lt;/a&gt;认为，宇宙射线中电子与正电子的通量（即单位时间里通过单位面积的粒子数量）分布显著不同，其特征也显示，过量的高能正电子有可能来自暗物质碰撞。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:宋体;font-size:14px;background-color:#F8F9F4;text-indent:2em;&quot;&gt;\n	研究结果显示，电子通量与正电子通量均无法由单一不变的谱指数描述（通量随能量的变化由谱指数决定，通常是正比于能量的谱指数次方），特别是在２０吉到２００吉电子伏特间，正电子通量随能量变化的速率高于电子通量，这可被视为正电子比例增加来源于过量高能正电子而非高能电子损失的重要证明。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:宋体;font-size:14px;background-color:#F8F9F4;text-indent:2em;&quot;&gt;\n	研究人员认为，对正电子占电子与正电子总数的比例、电子与正电子各自通量以及总通量的精密测量互为补充，或帮助科学界更为深入地了解高能宇宙射线的来源及暗物质的存在。\n&lt;/p&gt;\n&lt;p style=&quot;font-family:宋体;font-size:14px;background-color:#F8F9F4;text-indent:2em;&quot;&gt;\n	阿尔法磁谱仪项目由来自全球１５个国家和地区的５６个科研机构参与，首要目的是寻找宇宙中的暗物质及其起源。２０１１年５月，美国“奋进”号航天飞机将太空粒子探测器“阿尔法磁谱仪２”送至国际空间站。（原标题：新线索显示暗物质可能存在）\n&lt;/p&gt;', '30', '0', '3', '/image/2014_09_20_10_43_19_1036746449.png', null, '0');

-- ----------------------------
-- View structure for `t_bbs_top_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_bbs_top_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_bbs_top_view` AS select `t_bbs`.`tid` AS `tid`,`t_bbs`.`tflag` AS `tflag`,`t_bbs`.`ttitle` AS `ttitle`,`t_bbs`.`trid` AS `trid`,`t_bbs`.`tsummary` AS `tsummary`,`t_bbs`.`ttopic` AS `ttopic`,`t_bbs`.`tstate` AS `tstate`,`t_bbs`.`tshielder` AS `tshielder`,`t_bbs`.`tcreated_time` AS `tcreated_time`,`t_bbs`.`tlast_edited_time` AS `tlast_edited_time`,`t_bbs`.`treleased_time` AS `treleased_time`,`t_bbs`.`tshielded_time` AS `tshielded_time`,`t_bbs`.`ttop_time` AS `ttop_time`,`t_bbs`.`treply_id` AS `treply_id`,`t_bbs`.`tscan_count` AS `tscan_count`,`t_bbs`.`tfloor` AS `tfloor`,count(`t_reply`.`tid`) AS `treply_count` from (`t_bbs` left join `t_bbs` `t_reply` on((`t_reply`.`treply_id` = `t_bbs`.`tid`))) where isnull(`t_bbs`.`treply_id`) group by `t_reply`.`treply_id` order by count(`t_reply`.`tid`) desc ;

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
-- View structure for `t_event_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_event_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_event_view` AS select `t_event`.`vid` AS `vid`,`t_event`.`vrid` AS `vrid`,`t_event`.`vtitle` AS `vtitle`,`t_event`.`vcontent` AS `vcontent`,`t_event`.`vtype` AS `vtype`,`t_event`.`vurl` AS `vurl`,`t_event`.`vcreated_time` AS `vcreated_time`,`t_event`.`vstate` AS `vstate`,`t_event`.`vref` AS `vref`,`t_register`.`rnickname` AS `rnickname` from (`t_event` join `t_register`) where (`t_event`.`vref` = `t_register`.`rid`) ;

-- ----------------------------
-- View structure for `t_login_distinct_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_login_distinct_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_login_distinct_view` AS select distinct `a`.`lgrid` AS `lgrid`,`a`.`lgid` AS `lgid`,`a`.`lgpassword` AS `lgpassword`,max(`a`.`lgtime`) AS `lgtime`,`a`.`lgip` AS `lgip`,`a`.`lgmac` AS `lgmac`,`a`.`lgbrowser` AS `lgbrowser`,`a`.`lgos` AS `lgos`,`a`.`lgresult` AS `lgresult` from `t_login` `a` group by `a`.`lgrid` ;

-- ----------------------------
-- View structure for `t_manager_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_manager_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_manager_view` AS select `t_register`.`rid` AS `rid`,`t_register`.`raccount` AS `raccount`,`t_register`.`rpassword` AS `rpassword`,`t_register`.`rnickname` AS `rnickname`,`t_register`.`rhead_photo` AS `rhead_photo`,`t_register`.`rlast_lgid` AS `rlast_lgid`,`t_register`.`rstate` AS `rstate`,`t_register`.`rrole` AS `rrole`,`t_register`.`rshield_role` AS `rshield_role`,`t_register`.`rshielded_time` AS `rshielded_time`,`t_register`.`rshielded_type` AS `rshielded_type`,`t_register`.`rlast_edited_time` AS `rlast_edited_time`,`t_register`.`rcreated_time` AS `rcreated_time`,`t_register`.`rshielded_tick` AS `rshielded_tick`,`t_manager`.`mpcreate_teacher` AS `mpcreate_teacher`,`t_manager`.`mpcreate_news` AS `mpcreate_news`,`t_manager`.`mpcreate_act` AS `mpcreate_act`,`t_manager`.`mpcreate_plan_project` AS `mpcreate_plan_project`,`t_manager`.`mpedit_league_college` AS `mpedit_league_college`,`t_manager`.`mpcreate_notice` AS `mpcreate_notice`,`t_manager`.`mpcheck_ex_note` AS `mpcheck_ex_note`,`t_manager`.`mpcreate_ex_trend` AS `mpcreate_ex_trend`,`t_manager`.`mpcreate_ex_project` AS `mpcreate_ex_project`,`t_manager`.`mpcheck_courseware` AS `mpcheck_courseware`,`t_manager`.`mpcreate_topic` AS `mpcreate_topic`,`t_manager`.`mpcreate_post` AS `mpcreate_post`,`t_manager`.`mpcreate_reply` AS `mpcreate_reply`,`t_manager`.`mpcreate_msg` AS `mpcreate_msg`,`t_manager`.`mpmanager_user` AS `mpmanager_user`,`t_manager`.`mpmanager_bbs` AS `mpmanager_bbs`,`dic_a`.`dic_value` AS `rstate_name` from ((`t_register` join `t_manager`) join `t_dic` `dic_a`) where ((`t_register`.`rid` = `t_manager`.`mrid`) and (`t_register`.`rstate` = `dic_a`.`dic_key`) and (`dic_a`.`dic_type` = 'rstate')) ;

-- ----------------------------
-- View structure for `t_news_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_news_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_news_view` AS select `t_z`.`zid` AS `zid`,`t_z`.`zcreator` AS `zcreator`,`t_z`.`zgid` AS `zgid`,`t_z`.`zcreated_time` AS `zcreated_time`,`t_z`.`zlast_edited_time` AS `zlast_edited_time`,`t_z`.`zchecked_time` AS `zchecked_time`,`t_z`.`zreleased_time` AS `zreleased_time`,`t_z`.`ztop_time` AS `ztop_time`,`t_z`.`ztitle` AS `ztitle`,`t_z`.`zsummary` AS `zsummary`,`t_z`.`zcontent` AS `zcontent`,`t_z`.`zstate` AS `zstate`,`t_z`.`ztype` AS `ztype`,`t_z`.`zsub_type` AS `zsub_type`,`t_z`.`zflag` AS `zflag`,`t_z`.`zcheckor` AS `zcheckor`,`t_z`.`zscan_count` AS `zscan_count`,`dic_sub_type`.`dic_value` AS `zsub_type_name` from (`t_z` join `t_dic` `dic_sub_type`) where ((`t_z`.`ztype` = 0) and (`t_z`.`zsub_type` = `dic_sub_type`.`dic_key`) and (`dic_sub_type`.`dic_type` = 'zsub_type')) ;

-- ----------------------------
-- View structure for `t_post_list_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_post_list_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_post_list_view` AS select `t_bbs`.`tid` AS `tid`,`t_bbs`.`ttitle` AS `ttitle`,`t_bbs`.`trid` AS `trid`,`t_bbs`.`tsummary` AS `tsummary`,`t_bbs`.`tcontent` AS `tcontent`,`t_bbs`.`ttopic` AS `ttopic`,`t_bbs`.`tstate` AS `tstate`,`t_bbs`.`tshielder` AS `tshielder`,`t_bbs`.`tcreated_time` AS `tcreated_time`,`t_bbs`.`treleased_time` AS `treleased_time`,`t_bbs`.`tshielded_time` AS `tshielded_time`,`t_bbs`.`ttop_time` AS `ttop_time`,`t_bbs`.`treply_id` AS `treply_id`,`t_bbs`.`tscan_count` AS `tscan_count`,`t_bbs`.`tfloor` AS `tfloor`,`t_register`.`rhead_photo` AS `rhead_photo`,`t_register`.`rnickname` AS `rnickname`,`t_topic`.`cname` AS `cname`,`t_bbs`.`tlast_edited_time` AS `tlast_edited_time`,`t_bbs`.`tflag` AS `tflag` from ((`t_bbs` join `t_register`) join `t_topic`) where ((`t_bbs`.`trid` = `t_register`.`rid`) and (`t_bbs`.`ttopic` = `t_topic`.`cid`)) ;

-- ----------------------------
-- View structure for `t_post_reply_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_post_reply_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_post_reply_view` AS select `t_bbs`.`tid` AS `tid`,`t_bbs`.`ttitle` AS `ttitle`,`t_bbs`.`trid` AS `trid`,`t_bbs`.`tsummary` AS `tsummary`,`t_bbs`.`tcontent` AS `tcontent`,`t_bbs`.`ttopic` AS `ttopic`,`t_bbs`.`tstate` AS `tstate`,`t_bbs`.`tshielder` AS `tshielder`,`t_bbs`.`tcreated_time` AS `tcreated_time`,`t_bbs`.`treleased_time` AS `treleased_time`,`t_bbs`.`tshielded_time` AS `tshielded_time`,`t_bbs`.`ttop_time` AS `ttop_time`,`t_bbs`.`treply_id` AS `treply_id`,`t_bbs`.`tscan_count` AS `tscan_count`,`t_bbs`.`tfloor` AS `tfloor`,`t_register`.`raccount` AS `raccount`,`t_register`.`rnickname` AS `rnickname`,`t_register`.`rhead_photo` AS `rhead_photo`,`t_register`.`rrole` AS `rrole`,`t_register`.`rstate` AS `rstate` from (`t_bbs` join `t_register`) where ((`t_bbs`.`trid` = `t_register`.`rid`) and (`t_bbs`.`treply_id` is not null)) ;

-- ----------------------------
-- View structure for `t_register_manager_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_register_manager_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_register_manager_view` AS select `t_register`.`rid` AS `rid`,`t_register`.`raccount` AS `raccount`,`t_register`.`rpassword` AS `rpassword`,`t_register`.`rnickname` AS `rnickname`,`t_register`.`rhead_photo` AS `rhead_photo`,`t_register`.`rlast_lgid` AS `rlast_lgid`,`t_register`.`rstate` AS `rstate`,`t_register`.`rrole` AS `rrole`,`t_register`.`rshield_role` AS `rshield_role`,`t_register`.`rshielded_time` AS `rshielded_time`,`t_register`.`rshielded_type` AS `rshielded_type`,`t_register`.`rlast_edited_time` AS `rlast_edited_time`,`t_register`.`rcreated_time` AS `rcreated_time`,`t_register`.`rshielded_tick` AS `rshielded_tick`,`t_manager`.`mid` AS `mid`,`t_manager`.`mrid` AS `mrid`,`t_manager`.`mpcreate_teacher` AS `mpcreate_teacher`,`t_manager`.`mpcreate_news` AS `mpcreate_news`,`t_manager`.`mpcreate_act` AS `mpcreate_act`,`t_manager`.`mpcreate_plan_project` AS `mpcreate_plan_project`,`t_manager`.`mpedit_league_college` AS `mpedit_league_college`,`t_manager`.`mpcreate_notice` AS `mpcreate_notice`,`t_manager`.`mpcheck_ex_note` AS `mpcheck_ex_note`,`t_manager`.`mpcreate_ex_trend` AS `mpcreate_ex_trend`,`t_manager`.`mpcreate_ex_project` AS `mpcreate_ex_project`,`t_manager`.`mpcheck_courseware` AS `mpcheck_courseware`,`t_manager`.`mpcreate_topic` AS `mpcreate_topic`,`t_manager`.`mpcreate_post` AS `mpcreate_post`,`t_manager`.`mpcreate_reply` AS `mpcreate_reply`,`t_manager`.`mpcreate_msg` AS `mpcreate_msg`,`t_manager`.`mpmanager_user` AS `mpmanager_user`,`t_manager`.`mpmanager_bbs` AS `mpmanager_bbs`,`t_login_distinct_view`.`lgrid` AS `lgrid`,`t_login_distinct_view`.`lgid` AS `lgid`,`t_login_distinct_view`.`lgpassword` AS `lgpassword`,`t_login_distinct_view`.`lgtime` AS `lgtime`,`t_login_distinct_view`.`lgip` AS `lgip`,`t_login_distinct_view`.`lgmac` AS `lgmac`,`t_login_distinct_view`.`lgbrowser` AS `lgbrowser`,`t_login_distinct_view`.`lgos` AS `lgos`,`t_login_distinct_view`.`lgresult` AS `lgresult` from ((`t_register` join `t_manager`) left join `t_login_distinct_view` on((`t_login_distinct_view`.`lgrid` = `t_register`.`rid`))) where (`t_register`.`rid` = `t_manager`.`mrid`) ;

-- ----------------------------
-- View structure for `t_register_user_view`
-- ----------------------------
DROP VIEW IF EXISTS `t_register_user_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `t_register_user_view` AS select `t_register`.`rid` AS `rid`,`t_register`.`raccount` AS `raccount`,`t_register`.`rpassword` AS `rpassword`,`t_register`.`rnickname` AS `rnickname`,`t_register`.`rhead_photo` AS `rhead_photo`,`t_register`.`rlast_lgid` AS `rlast_lgid`,`t_register`.`rstate` AS `rstate`,`t_register`.`rrole` AS `rrole`,`t_register`.`rshield_role` AS `rshield_role`,`t_register`.`rshielded_time` AS `rshielded_time`,`t_register`.`rshielded_type` AS `rshielded_type`,`t_register`.`rlast_edited_time` AS `rlast_edited_time`,`t_register`.`rcreated_time` AS `rcreated_time`,`t_register`.`rshielded_tick` AS `rshielded_tick`,`t_user`.`uid` AS `uid`,`t_user`.`urid` AS `urid`,`t_user`.`uchar` AS `uchar`,`t_user`.`ugid` AS `ugid`,`t_user`.`uno` AS `uno`,`t_user`.`uname` AS `uname`,`t_user`.`uen_name` AS `uen_name`,`t_user`.`udisplay_name` AS `udisplay_name`,`t_user`.`usender` AS `usender`,`t_user`.`ubirthday` AS `ubirthday`,`t_user`.`uuid` AS `uuid`,`t_user`.`uemail` AS `uemail`,`t_user`.`umobile_phone` AS `umobile_phone`,`t_user`.`utel` AS `utel`,`t_user`.`uqq` AS `uqq`,`t_user`.`uoffice_addr` AS `uoffice_addr`,`t_user`.`uphoto` AS `uphoto`,`t_user`.`uhead_photo` AS `uhead_photo`,`t_user`.`uprofile` AS `uprofile`,`t_user`.`uconstellation` AS `uconstellation`,`t_user`.`ugrade` AS `ugrade`,`t_user`.`ucreate_post` AS `ucreate_post`,`t_user`.`ucreate_reply` AS `ucreate_reply`,`t_user`.`ucreate_msg` AS `ucreate_msg`,`t_user`.`ucreate_ex_note` AS `ucreate_ex_note`,`t_user`.`ucreate_ex_trend` AS `ucreate_ex_trend`,`t_user`.`ucreate_ex_project` AS `ucreate_ex_project`,`t_user`.`uupload_courseware` AS `uupload_courseware`,`t_user`.`umanage_student` AS `umanage_student`,`t_user`.`udownload_courseware` AS `udownload_courseware`,`t_user`.`ulast_edited_time` AS `ulast_edited_time`,`dic_rstate`.`dic_value` AS `rstate_name` from ((`t_register` join `t_user`) join `t_dic` `dic_rstate`) where ((`t_register`.`rid` = `t_user`.`urid`) and (`t_register`.`rstate` = `dic_rstate`.`dic_key`) and (`dic_rstate`.`dic_type` = 'rstate')) ;

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
