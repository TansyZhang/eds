<?php
namespace Home\Controller;
use Think\Controller;
class OthersController extends EdsController {


	public function help(){
		$m = M('College');
		$lim['gstate'] = 30;//发布
		$this->college_list = $m->where($lim)->field('gid,gname')->select();
		$this->display();
	}
}

?>