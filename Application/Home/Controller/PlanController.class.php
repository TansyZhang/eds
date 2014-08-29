<?php
namespace Home\Controller;
use Think\Controller;
class PlanController extends EdsController {

	public function __construct(){
		parent::__construct();
		$this->qianxuesheng = false;
	}

    public function index(){
		$this->qianxuesheng = true;
        $this->display();
    }
    //实施
    public function effect(){
    	$this->display();
    }
    //高校
    public function college(){
    	$this->display();
    }
    //改革
    public function reform(){
    	$this->display();
    }
    //成果
    public function project(){
    	$this->display();
    }
    //成果详细页面
    public function project_dtl($zid=-1){
        $zid = I('zid');
        if($zid == -1){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $m = M('Z');
        $lim['zid'] = $zid;
        $record = $m->where($lim)->find();
        if($record){
            $this->zid = $zid;
            $this->ztitle = $record['ztitle'];
            $this->zcontent = htmlspecialchars_decode($record['zcontent'], ENT_QUOTES);
        } else {
            $this->zid = -1;
        }
		$this->display();
    }

    public function project_edit($zid = -1){
        $zid = I('zid');
        if($zid == -1){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $m = M('Z');
        $lim['zid'] = $zid;
        $record = $m->where($lim)->find();
        if($record){
            $this->zid = $zid;
            $this->ztitle = $record['ztitle'];
            $this->zcontent = $record['zcontent'];
        } else {
            $this->zid = -1;
        }
        $this->display();
    }


    public function project_save_handler($zid = -2,$ztitle='',$zcontent=''){
        if(I('zid') == -2 || I('ztitle') == ''||I('zcontent') == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $zid = I('zid');
        $ztitle = I('ztitle');
        $zcontent = I('zcontent');
        if($zid == -1){//新建
            $m = M('Z');
            $record['zcreator'] = 1;//TODO
            $record['ztitle'] = $ztitle;
            $record['zcontent'] = $zcontent;
            $record['zcreated_time'] = $record['zlast_edited_time'] = date('Y-m-d H:i:s', time());
            $record['zstate'] = 0;//編輯中
            $record['ztype'] = 3;//成果
            $record['zflag'] = '';
            $record['zscan_count'] = 0;
            if($m->add($record)){
                $this->show('{"result":0,"msg":"creating succeed."}', 'utf-8');
                return;
            } else {
                $this->show('{"result":1,"msg":"inserting error."}', 'utf-8');
                return;
            }
        } else {
            $m = M('Z');
            $record['zid'] = $zid;
            $record['ztitle'] = $ztitle;
            $record['zcontent'] = $zcontent;
            if($m->save($record)){
                $this->show('{"result":0,"msg":"saving succeed."}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            }
            return;
        }
    }
}

?>