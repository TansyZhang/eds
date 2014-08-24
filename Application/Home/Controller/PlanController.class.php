<?php
namespace Home\Controller;
use Think\Controller;
class PlanController extends Controller {

	public function __construct(){
		parent::__construct();
		$this->qianxuesheng = false;
	}

    public function index(){
		$this->qianxuesheng = true;
        $this->display();
    }
    //实施
    public function effect(){
    	$this->display();
    }
    //高校
    public function college(){
    	$this->display();
    }
    //改革
    public function reform(){
    	$this->display();
    }
    //成果
    public function project(){
    	$this->display();
    }
    //成果详细页面
    public function project_detail($zid=-1){
		$this->display();
    }
}

?>