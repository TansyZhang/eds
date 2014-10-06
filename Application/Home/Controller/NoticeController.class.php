<?php
namespace Home\Controller;
use Think\Controller;
class NoticeController extends EdsController {

	//列表
    public function index($page=0){
    	$m = M('Z');
        $lim['ztype'] = 4;//通知
        $lim['zstate'] = 30;//发布
        $list = $m->where($lim)->select();
        $this->notice_list = $list;
        $this->display();
    }

    public function detail($zid=-1){
        $zid = I('zid');
        if($zid == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }

        $m = M('Z');
        $lim['zid'] = $zid;
        $record = $m->where($lim)->find();
        if($record){
        	$this->zid = $zid;
        	$this->ztitle = $record['ztitle'];
        	$this->zcontent = htmlspecialchars_decode($record['zcontent'],ENT_QUOTES);
        	$this->zreleased_time = $record['zreleased_time'];
        } else {
        	$this->zid = -1;
        	$this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
        	return;
        }
    	$this->display();
    }
    
    public function delete($zid=-1){
        if($zid == -1){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $zid = I('zid');
        $m = M('Z');
        $lim['zid'] = $zid;
        $lim['zstate'] = 60;//已删除
        if($m->save($lim)){
            $this->show('{"result":0,"msg":"deleting succeed."}', 'utf-8');
        } else {
            $this->show('{"result":1,"msg":"deleting occurs error."}', 'utf-8');
        }
    }

    public function edit($zid=-1){
		$zid = I('zid');
        if($zid == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        if($zid == -1){//新建
        	$this->zid = $zid;
            $this->display();return;
        }
        $m = M('Z');
        $lim['zid'] = $zid;
        $record = $m->where($lim)->find();
        if($record){
            $this->zid = $zid;
            $this->ztitle = $record['ztitle'];
            $this->zcontent = $record['zcontent'];
        } else {
            $this->show('{"result":1,"msg":"unknown zid."}', 'utf-8');
            return;
        }
        $this->display();
    }


    //保存
    public function save($zid = -2,$ztitle='',$zsummary='',$zcontent=''){
        $zid = I('zid');
        $ztitle = I('ztitle');
        $zcontent = I('zcontent');
        $zsummary = I('zsummary');
        if($zid == -2 || $ztitle == ''|| $zcontent == ''||$zsummary == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        if($zid == -1){//新建
            if($this->_create($zid,$ztitle,$zsummary,$zcontent)){
                $this->show('{"result":0,"msg":"creating succeed."}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"inserting occurs error."}', 'utf-8');
            }
        } else {//保存
            if($this->_save($zid,$ztitle,$zsummary,$zcontent)){
                //$this->show('{"result":1,"msg":"['.$zsummary.']"}', 'utf-8');return;
                $this->show('{"result":0,"msg":"saving succeed."}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"saving occurs error."}', 'utf-8');
            }
        }
    }
    public function release($zid = -2,$ztitle='',$zsummary='',$zcontent=''){
        $zid = I('zid');
        $ztitle = I('ztitle');
        $zcontent = I('zcontent');
        $zsummary = I('zsummary');
        //$zsub_type = I('zsub_type');
        if($zid == -2 || $ztitle == ''|| $zcontent == ''||$zsummary == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        if($zid == -1){//新建
            if($this->_create($zid,$ztitle,$zsummary,$zcontent,true)){
                $this->show('{"result":0,"msg":"creating succeed."}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"inserting occurs error."}', 'utf-8');
            }
        } else {//保存
            if($this->_save($zid,$ztitle,$zsummary,$zcontent,true)){
                $this->show('{"result":0,"msg":"saving succeed."}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"saving occurs error."}', 'utf-8');
            }
        }
    }


    private function _create($zid,$ztitle,$zsummary,$zcontent,$release = false){
        $m = M('Z');
        $record['zcreator'] = 1;//TODO
        $record['ztitle'] = $ztitle;
        $record['zcontent'] = $zcontent;
        //$record['zsub_type'] = $zsub_type;
        $record['zcreated_time'] = $record['zlast_edited_time'] = date('Y-m-d H:i:s', time());
        $record['zstate'] = 0;//编辑中
        $record['ztype'] = 4;//资讯
        //$record['zflag'] = $zflag;
        $record['zsummary'] = $zsummary;
        $record['zscan_count'] = 0;
        if($release){
            $record['zstate'] = 30;//已发布
            $record['zreleased_time'] = $record['zlast_edited_time'];
        }
        $t = $m->add($record);
        //$this->show('{"result":1,"msg":"'.$m->_sql().'"}', 'utf-8');
        return $t;
    }
    private function _save($zid,$ztitle,$zsummary,$zcontent,$release = false){
        $m = M('Z');
        $record['zid'] = $zid;
        $record['ztitle'] = $ztitle;
        $record['zcontent'] = $zcontent;
        $record['zsummary'] = $zsummary;
        $record['zstate'] = 0;////编辑中
        $record['zlast_edited_time'] = date('Y-m-d H:i:s', time());
        if($release){
            $record['zstate'] = 30;//已发布
            $record['zreleased_time'] = $record['zlast_edited_time'];
        }
        $t = $m->save($record);

        return $t;
    }
}

?>