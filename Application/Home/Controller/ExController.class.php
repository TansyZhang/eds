<?php
namespace Home\Controller;
use Think\Controller;
class ExController extends EdsController {
    public function index(){

    	$COUNT = 4;
    	$m_ex_note = M('ExNoteView');
    	$lim_ex_note['zstate'] = 40;
    	$this->ex_note_list = array();
    	$ex_note_top_list = $m_ex_note->where($lim_ex_note)->limit($COUNT)->select();
    	if($ex_note_top_list){
    		$this->ex_note_list = $ex_note_top_list;
    	}
    	if(count($this->ex_note_list) < $COUNT){
    		$lim_ex_note['zstate'] = 30;
    		$ex_note_list = $m_ex_note->where($lim_ex_note)->limit($COUNT-count($this->ex_note_list))->select();
	    	if($ex_note_list){
	    		$this->ex_note_list = array_merge($this->ex_note_list,$ex_note_list);
	    	}
    	}

    	//dump($this->ex_note_list);

        $this->display();
    }

    public function exlist($ztype = 5){
    	$ztype = I('ztype');
    	if($ztype == -1 || $ztype == ''){
    		$ztype = 5;
    	}
    	$this->ztype = $ztype;
    	if($ztype == 5){
    		$this->sub_title = "交流札记";
    		$m_ex_note = M('ExView');
	    	$lim_ex_note['ztype'] = 5;
	    	$lim_ex_note['zstate'] = 40;
	    	$this->ex_note_list = array();
	    	$ex_note_top_list = $m_ex_note->where($lim_ex_note)->select();
	    	if($ex_note_top_list){
	    		$this->ex_note_list = $ex_note_top_list;
	    	}
	    	$lim_ex_note['zstate'] = 30;
    		$ex_note_list = $m_ex_note->where($lim_ex_note)->select();
	    	if($ex_note_list){
	    		$this->ex_note_list = array_merge($this->ex_note_list,$ex_note_list);
	    	}
    	} elseif($ztype == 6){
    		$this->sub_title = "留学动态";

    	} else if($ztype == 9){
    		$this->sub_title = "交换项目";

    	}
    	//dump($this->ex_note_list);
    	$this->display();
    }

    public function detail($zid = -1,$check = -1){
    	$zid = I('zid');
    	$check = I('check');
    	if($zid == -1 || $zid == ''){
    		$this->display();
            return;
    	}
    	$m = M('ExView');
    	$lim['zid'] = $zid;
    	$rec = $m->where($lim)->find();
    	if($rec){
    		$this->zid = $zid;
    		$this->ztype = $rec['ztype'];
    		$this->ztype_name = $this->sub_title = $rec['ztype_name'];
    		$this->ztitle = $rec['ztitle'];
    		$this->zauthor = $rec['zauthor'];
    		$this->zlast_edited_time = $rec['zlast_edited_time'];
    		$this->zreleased_time = $rec['zreleased_time'];
    		$this->ztop_time = $rec['ztop_time'];
    		$this->zcontent = $rec['zcontent'];
    		$this->zsummary = $rec['zsummary'];
	    	if(session('?rrole') && session('rrole')<25 && $check == 1 && $rec['zstate'] == 10/*审核中*/){
	    		$this->check = true;
	    	}
    		$this->display();
    	} else {
    		$this->show('{"result":1,"msg":"parameters error(zid)."}', 'utf-8');
            return;
    	}
    }
}

?>