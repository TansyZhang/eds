<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends EdsController {

	public function __construct(){
		parent::__construct();
		$this->more = '更多>>';
		$this->rrole_manager_level = 25;
	}
	
    public function index(){
        $this->display();
    }

    public function login(){
    	$this->show('login ok!','utf-8');
    }
}

?>