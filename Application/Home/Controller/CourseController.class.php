<?php
namespace Home\Controller;
use Think\Controller;
class CourseController extends Controller {
    public function index($subtype=0){
        $this->display();
    }

    //网络课程
    public function netcourse($page=0){
    	 $this->display();
    }

    //网络课程详细
    public function netcourse_dtl($eid=0){
    	$this->display();
    }
    //物理图书馆
    public function pl($page=0){
    	$this->display();
    }
    //物馆图书详细
    public function pl_detail($eid=0){
    	$this->display();
    }
    public function download($eid=0){
    	$this->show('暂不提供下载！', 'utf-8');
    }
}

?>