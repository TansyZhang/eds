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
        $this->qianxuesheng = true;
    	$this->display();
    }
    //成果
    public function project($page=0){
        $m = M('Z');
        $lim['ztype'] = 3;//成果
        $lim['zstate'] = 30;//发布
        $list = $m->where($lim)->select();
        //echo $m->_sql();
        $this->project_list = $list;
    	$this->display();
    }


    //成果详细页面
    public function project_dtl($zid=-1,$op_edit=0){
        $zid = I('zid');
        $op_edit = I('op_edit');
        if($zid==''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $m = M('Z');
        $lim['zid'] = $zid;
        $record = $m->where($lim)->find();
        if($record){
            if(session('zscan_count'.$record['zid'])==null){
                session('zscan_count'.$record['zid'], true);
                $record['zscan_count'] += 1;
                $m->where('zid='.$record['zid'])->setInc('zscan_count');
            }
            $this->zid = $zid;
            $this->ztitle = $record['ztitle'];
            $this->zflag = $record['zflag'];
            if($op_edit == 0){//不是编辑
                $this->zcontent = htmlspecialchars_decode($record['zcontent'], ENT_QUOTES);
            } else {
                $this->zcontent = $record['zcontent'];
            }
        } else {
            $this->zid = -1;
            $this->edit = 1;
            //$this->show('{"result":2,"msg":"parameters error."}', 'utf-8');
        }
        $this->edit = $op_edit;
		$this->display();
    }
    //保存
    public function project_save($zid = -2,$ztitle='',$zsummary='12343',$zcontent='',$zflag=''){
        $zid = I('zid');
        $ztitle = I('ztitle');
        $zcontent = I('zcontent');
        $zflag = I('zflag');
        $zsummary = I('zsummary');
        if($zid == -2 || $ztitle == ''|| $zcontent == ''||$zsummary == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        if($zid == -1){//新建
            if($this->_project_create($zid,$ztitle,$zsummary,$zcontent,$zflag)){
                $this->show('{"result":0,"msg":"creating succeed."}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"inserting occurs error."}', 'utf-8');
            }
        } else {//保存
            if($this->_project_save($zid,$ztitle,$zsummary,$zcontent,$zflag)){
                //$this->show('{"result":1,"msg":"['.$zsummary.']"}', 'utf-8');return;
                $this->show('{"result":0,"msg":"saving succeed."}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"saving occurs error."}', 'utf-8');
            }
        }
    }
    //发布
    public function project_release($zid = -2,$ztitle='',$zsummary='',$zcontent='',$zflag=''){
        $zid = I('zid');
        $ztitle = I('ztitle');
        $zcontent = I('zcontent');
        $zsummary = I('zsummary');
        if($zid == -2 || $ztitle == ''|| $zcontent == ''||$zsummary == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        if($zid == -1){//新建
            if($this->_project_create($zid,$ztitle,$zsummary,$zcontent,$zflag,true)){
                $this->show('{"result":0,"msg":"creating succeed."}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"inserting occurs error."}', 'utf-8');
            }
        } else {//保存
            if($this->_project_save($zid,$ztitle,$zsummary,$zcontent,$zflag,true)){
                $this->show('{"result":0,"msg":"saving succeed."}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"saving occurs error."}', 'utf-8');
            }
        }
    }
    public function project_delete($zid=-1){
        if($zid == -1){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $zid = I('zid');
        $m = M('Z');
        $lim['zid'] = $zid;
        if($m->where($lim)->delete()){
            $this->show('{"result":0,"msg":"deleting succeed."}', 'utf-8');
        } else {
            $this->show('{"result":1,"msg":"deleting occurs error."}', 'utf-8');
        }
    }
    private function _project_create($zid,$ztitle,$zsummary,$zcontent,$zflag,$release = false){
        $m = M('Z');
        $record['zcreator'] = 1;//TODO
        $record['ztitle'] = $ztitle;
        $record['zcontent'] = $zcontent;
        $record['zcreated_time'] = $record['zlast_edited_time'] = date('Y-m-d H:i:s', time());
        $record['zstate'] = 0;//编辑中
        $record['ztype'] = 3;//成果
        $record['zflag'] = $zflag;
        $record['zsummary'] = $zsummary;
        $record['zscan_count'] = 0;
        if($release){
            $record['zstate'] = 30;//已发布
            $record['zreleased_time'] = $record['zlast_edited_time'];
        }
        return $m->add($record);
    }
    private function _project_save($zid,$ztitle,$zsummary,$zcontent,$zflag,$release = false){
        $m = M('Z');
        $record['zid'] = $zid;
        $record['ztitle'] = $ztitle;
        $record['zcontent'] = $zcontent;
        $record['zsummary'] = $zsummary;
        $record['zstate'] = 0;////编辑中
        $record['zlast_edited_time'] = date('Y-m-d H:i:s', time());
        if($zflag != ''){
            $record['zflag'] = $zflag;
        }
        if($release){
            $record['zstate'] = 30;//已发布
            $record['zreleased_time'] = $record['zlast_edited_time'];
        }
        return $m->save($record);
    }


    public function project_dtl_img(){
        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize = 1024*1024;// 设置附件上传大小 1M
        $upload->exts = array('jpg', 'jpeg', 'bmp', 'png');// 设置附件上传类型
        $upload->rootPath = './Public/uploads'; // 设置附件上传目录    
        $upload->savePath = '/image/'; // 设置附件上传目录    
        $upload->autoSub = false;//不使用子目录
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
            $this->show('{"result":0,"msg":"保存成功"'.$hint.'}');
        }
        return;
    }
}

?>