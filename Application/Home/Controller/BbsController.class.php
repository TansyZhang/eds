<?php
namespace Home\Controller;
use Think\Controller;
class BbsController extends Controller {
    public function index(){
        $this->display();
    }

    public function post($zid=-1){
    	$zid = I('zid');
    	if($zid == ''){
    		$zid = -1;
    	}
    	if($zid != -1){
    		$m = M('');
    	}
    	$this->display();
    }

    public function post_release($zid=-1,$zsub_type='',$ztitle='',$zsummary='',$zcontent=''){
    	$zid = I('zid');
    	$zsub_type = I('zsub_type');
    	$ztitle = I('ztitle');
    	$zsummary = I('zsummary');
    	$zcontent = I('zcontent');
    	if($zsub_type==''||$ztitle==''||$zsummary==''||$zcontent==''){
    		$this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
    	}
    	if($zid == ''){
    		$m = M('Bbs');
    		$data['ttopic'] = $zsub_type;
    		$data['ttitle'] = $ztitle;
    		$data['tsummary'] = $zsummary;
    		$data['tcontent'] = $zcontent;
    		$data['tstate'] = 10;//发布
    		$data['tcreated_time'] = date('Y-m-d H:i:s',time());
    		if($m->add($data)){
    			$this->show('{"result":0,"msg":"adding succeed."}', 'utf-8');
            	return;
    		}else{
    			$this->show('{"result":1,"msg":"'.($m->getDbError()).'"}', 'utf-8');
            	return;
    		}
    	} else {
    		$m = M('Bbs');
    		$data['tid'] = $zid;
    		$data['trid'] = 10;//TODO
    		$data['ttopic'] = $zsub_type;
    		$data['ttitle'] = $ztitle;
    		$data['tsummary'] = $zsummary;
    		$data['tcontent'] = $zcontent;
    		$data['tstate'] = 10;//发布
    		if($m->save($data)){
    			$this->show('{"result":0,"msg":"adding succeed."}', 'utf-8');
            	return;
    		}else{
    			$this->show('{"result":1,"msg":"'.($m->getDbError()).'"}', 'utf-8');
            	return;
    		}
    	}

    }
}

?>