<?php
namespace Home\Controller;
use Think\Controller;
class NoticeController extends Controller {

	//列表
    public function index($page=0){
        $this->display();
    }

    public function detail($zid=-1){
    	$this->display();
    }
}

?>