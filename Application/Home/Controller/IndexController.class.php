<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends EdsController {

	public function __construct(){
		parent::__construct();
		$this->phy_news_title = '物理前沿';
		$this->hot_act_title = '热门活动';
		$this->hot_post_title = '学生社区热点';
		$this->recmd_course_title = '推荐课程';
		$this->more = '更多>>';
	}
	
    public function index(){
        $this->display();
    }
}

?>