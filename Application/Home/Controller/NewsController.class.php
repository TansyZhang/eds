<?php
namespace Home\Controller;
use Think\Controller;
class NewsController extends Controller {
    public function index(){
        $this->display();
    }


    public function newslist($sub_type=-1){
    	$this->main_title = "中国科学网";
    	$this->display();
    }
    public function detail($zid=-1){
    	$this->main_title = "中国科学网";
    	$this->display();
    }
}

?>