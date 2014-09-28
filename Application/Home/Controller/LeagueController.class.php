<?php
namespace Home\Controller;
use Think\Controller;
class LeagueController extends Controller {

    public function index(){
    	$m = M('College');
    	$this->league_list = $m->field('gprofile',true)->select();

    	$leftm = M('College');
    	$this->left_list = $leftm->field('gid,gname,glogo')->select();

        $this->display();
    }

    public function dtl($gid = -1){
    	$gid = I('gid');
    	if($gid == '' || $gid == -1){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
    	}
    	$m = M('College');
    	$lim['gid'] = $gid;
    	$record = $m->where($lim)->find();
    	if($record == false){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
    	}
    	$this->gid = $record['gid'];
    	$this->gname = $record['gname'];
    	$this->gprovince = $record['gprovince'];
    	$this->gcity = $record['gcity'];
    	$this->gsummary = $record['gsummary'];
    	$this->gstate = $record['gstate'];
    	$this->gcreated_time = $record['gcreated_time'];
    	$this->glogo = $record['glogo'];
    	$this->gflag = $record['gflag'];
    	$this->gprofile = $record['gprofile'];

    	$leftm = M('College');
    	$this->left_list = $leftm->field('gid,gname,glogo')->select();
    	//dump($this->left_list);
    	$this->display();
    }

    public function edit($gid = -1){
    	$gid = I('gid');
    	if($gid == '' || $gid == -1){
    		$this->gid = -1;
    		$this->display();
    		return;
    	}

    	$m = M('College');
    	$lim['gid'] = $gid;
    	$record = $m->where($lim)->find();
    	if($record == false){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
    	}
    	$this->gid = $record['gid'];
    	$this->gname = $record['gname'];
    	$this->gprovince = $record['gprovince'];
    	$this->gcity = $record['gcity'];
    	$this->gsummary = $record['gsummary'];
    	$this->gstate = $record['gstate'];
    	$this->gcreated_time = $record['gcreated_time'];
    	$this->glogo = $record['glogo'];
    	$this->gflag = $record['gflag'];
    	$this->gprofile = $record['gprofile'];


    	$leftm = M('College');
    	$this->left_list = $leftm->field('gid,gname,glogo')->select();

    	$this->display();
    }



    public function save($gid = -1,$gname='',$gprovince='',
    	$gcity='',$summary='',$gcreated_time='',$glogo='',$gflag='',$gprofile=''){
		$gid = I('gid');
		$gname = I('gname');
		$gprovince = I('gprovince');
		$gcity = I('gcity');
		$gsummary = I('gsummary');
		$gprofile = I('gprofile');

		if($gname == '' || $gsummary == '' || $gprofile == ''){
        	$this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
        	return;
		}
    	$m = M('College');
    	$data['gname'] = $gname;
    	$data['glogo'] = $glogo;
    	$data['gflag'] = $gflag;
    	$data['gsummary'] = $gsummary;
    	$data['gprofile'] = $gprofile;
    	$data['glast_edited_time'] = date('Y-m-d H:i:s',time());
    	
    	if($gid == '' || $gid == -1){
        	$this->show('{"result":1,"msg":"version unsupported."}', 'utf-8');
    		$data['gcreated_time'] = $data['glast_edited_time'];
    		//$m->add($data);
        	return;
    	} else {
    		$data['gid'] = $gid;
    		if($m->save($data)){
    			$this->show('{"result":0,"msg":"saving succeed."}', 'utf-8');
        		return;
    		} else {
    			$error = $m->getDbError();
    			$error = str_replace('\'', '&', $error);
    			$this->show('{"result":0,"msg":"'.$error.'"}', 'utf-8');
        		return;
    		}
    	}

    }

    public function save_pic(){
    	$upload = new \Think\Upload();
        $upload->maxSize = 1024*1024;
        $upload->exts = array('png','gif','jpg','jpeg');
        $upload->rootPath = './Public/uploads';   
        $upload->savePath = '/image/';
        $upload->autoSub = false;
        $upload->saveName = date('Y_m_d_H_i_s', time()).'_'.mt_rand();
        
        $info = $upload->upload();// 上传文件
        if(!$info) {// 上传错误提示错误信息
            $err = $upload->getError();
            //$err = str_replace('"', '_', $err);
            $this->show('{"result":1,"msg":"'.$err.'"}');
        }else{// 上传成功
            $hint = '';
            foreach($info as $file){
                $hint.= ',"key":"'.$file['key'].'"';
                $hint.= ',"savepath":"'.$file['savepath'].'"';
                $hint.= ',"name":"'.$file['name'].'"';
                $hint.= ',"savename":"'.$file['savename'].'"';
                $hint.= ',"size":"'.$file['size'].'"';
                $hint.= ',"ext":"'.$file['ext'].'"';
                break;
            }
            $this->show('{"result":0,"msg":"保存成功","pathname":"'.($file['savepath'].$file['savename']).'"}');
        }
        return;
    }
}

?>