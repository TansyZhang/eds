<?php
namespace Home\Controller;
use Think\Controller;
class LeagueController extends Controller {

    public function index(){
    	$m = M('College');
    	$this->league_list = $m->field('gprofile',true)->select();
        $this->display();
    }
}

?>