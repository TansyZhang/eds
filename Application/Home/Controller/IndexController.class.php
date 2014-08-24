<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {

	
    public function index(){
    	$this->page_title = "全国物理拔尖人才培养计划";
        $this->display();
    }
}

?>