<?php
namespace Home\Controller;
use Think\Controller;
class EdsController extends Controller {

	public function __construct(){
		parent::__construct();
    	$this->page_title = '全国物理拔尖人才培养计划';
    	$this->MORE = '更多>>';
	}

	public function show_msg($result,$msg){
		$this->show("{\"result\":$result,\"msg\":\"$msg\"}", 'utf-8');
	}
	protected function show_parameters_error(){
		$this->show_msg(1,"parameters error.");
	}
	
}

?>