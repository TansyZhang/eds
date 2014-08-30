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

    public function user_conscise_info(){
        //$this->show('{"result":1,"msg":"error"}');
        $this->show('{"result":0,"msg":"succeed","data":{"mode":"系统管理员","rnickname":"系统管理员"}}');
    }

    public function login($raccount='',$rpassword=''){
    	$raccount = I('raccount');
    	$rpassword = I('rpassword');
    	if($raccount == '' || $rpassword == ''){
    		$this->show('{"result":1,"msg":"parameters error."}','utf-8');
    		return;
    	}
    	$m = M('Register');
    	$cond['raccount'] = $raccount;
    	$resultset = $m->where($cond)->field('rpassword')->find();
    	if($resultset){
    		$rpassword = sha1(md5($rpassword));
    		if($rpassword == $resultset['rpassword']){//123456->10470c3b4b1fed12c3baac014be15fac67c6e815
    			$this->show('{"result":"0","msg":"succeed."}','utf-8');
    		}else {
    			$this->show('{"result":3,"msg":"password error."}','utf-8');
    		}
    	} else {
    		$this->show('{"result":2,"msg":"account error!"}'.$raccount,'utf-8');
    	}
    	//以下设置session
    	$mv = M('RegisterView');
    	$resultset = $mv->where($cond)->field(true)->find();
    	session('g_logined', 'logined');
        session('rid',$resultset['rid']);
        session('raccount',$resultset['raccount']);
        session('rnickname',$resultset['rnickname']);
    	session('register', $resultset);
    }
}

?>