<?php
namespace Home\Controller;
use Think\Controller;
class NewsController extends EdsController {
    public function index(){

        $m = M('Z');
        $lim['ztype'] = 0;//资讯
        $lim['zstate'] = 30;//发布
        $lim['zsub_type'] = 0;//中国科学网
        $this->news_list1 = $m->where($lim)->field('zsummary,zcontent',true)->order('zreleased_time')->limit(2)->select();
        $lim['zsub_type'] = 1;//science
        $this->news_list2 = $m->where($lim)->field('zsummary,zcontent',true)->order('zreleased_time')->limit(2)->select();
        $lim['zsub_type'] = 2;//nature
        $this->news_list3 = $m->where($lim)->field('zsummary,zcontent',true)->order('zreleased_time')->limit(2)->select();
        $lim['zsub_type'] = 3;//拔尖专区
        $this->news_list4 = $m->where($lim)->field('zcontent',true)->order('zreleased_time')->limit(2)->select();
        //echo $m->_sql();
        //dump($this->news_list1);
        $this->display();
    }


    public function newslist($zsub_type=-1,$page=0){
        $zsub_type = I('zsub_type');
        if($zsub_type == '') $zsub_type = 3;//拔尖专区
        $m = M('Z');
        $lim['ztype'] = 0;//资讯
        $lim['zstate'] = 30;//发布
        $lim['zsub_type'] = $zsub_type;
        $list = $m->where($lim)->select();
        $this->news_list = $list;
        //echo $m->_sql();

        //查找资讯子类名称
        $m2 = M('Dic');
        $lim2['dic_type'] = 'zsub_type';
        $lim2['dic_key'] = $zsub_type;
        $lim2['dic_parent'] = 0;//资讯
        $newstype = $m2->where($lim2)->find();
    	$this->main_title = $newstype['dic_value'];
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
            $this->zflag = $record['zflag'];
            $this->zcontent = htmlspecialchars_decode($record['zcontent'],ENT_QUOTES);
            $this->zreleased_time = $record['zreleased_time'];

            //查找资讯子类名称
            $m2 = M('Dic');
            $lim2['dic_type'] = 'zsub_type';
            $lim2['dic_key'] = $record['zsub_type'];
            $lim2['dic_parent'] = 0;//资讯
            $newstype = $m2->where($lim2)->find();
            $this->zsub_type = $newstype['dic_value'];
        } else {
            $this->show('{"result":1,"msg":"unknown zid."}', 'utf-8');
            return;
        }
        $this->display();
    }

    public function edit($zid=-1){
        $zid = I('zid');
        if($zid == ''){
            $this->zid = -1;
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        if($zid == -1){//新建
            $this->display();return;
        }
        $m = M('Z');
        $lim['zid'] = $zid;
        $record = $m->where($lim)->find();
        if($record){
            $this->zid = $zid;
            $this->ztitle = $record['ztitle'];
            $this->zflag = $record['zflag'];
            $this->zcontent = $record['zcontent'];
            $this->zsub_type = $record['zsub_type'];
        } else {
            $this->show('{"result":1,"msg":"unknown zid."}', 'utf-8');
            return;
        }
        $this->display();
    }

    //保存
    public function save($zid = -2,$ztitle='',$zsub_type='',$zsummary='',$zcontent='',$zflag=''){
        $zid = I('zid');
        $ztitle = I('ztitle');
        $zcontent = I('zcontent');
        $zflag = I('zflag');
        $zsummary = I('zsummary');
        $zsub_type = I('zsub_type');
        if($zid == -2 || $ztitle == ''|| $zcontent == ''||$zsummary == ''||$zsub_type==''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        if($zid == -1){//新建
            if($this->_create($zid,$ztitle,$zsummary,$zcontent,$zflag,$zsub_type)){
                $this->show('{"result":0,"msg":"creating succeed."}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"inserting occurs error."}', 'utf-8');
            }
        } else {//保存
            if($this->_save($zid,$ztitle,$zsummary,$zcontent,$zflag,$zsub_type)){
                //$this->show('{"result":1,"msg":"['.$zsummary.']"}', 'utf-8');return;
                $this->show('{"result":0,"msg":"saving succeed."}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"saving occurs error."}', 'utf-8');
            }
        }
    }
    public function release($zid = -2,$ztitle='',$zsub_type='',$zsummary='',$zcontent='',$zflag=''){
        $zid = I('zid');
        $ztitle = I('ztitle');
        $zcontent = I('zcontent');
        $zsummary = I('zsummary');
        $zsub_type = I('zsub_type');
        if($zid == -2 || $ztitle == ''|| $zcontent == ''||$zsummary == ''||$zsub_type == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        if($zid == '' || $zid == -1){//新建
            if($this->_create($zid,$ztitle,$zsummary,$zcontent,$zflag,$zsub_type,true)){
                $this->show('{"result":0,"msg":"creating succeed."}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"inserting occurs error."}', 'utf-8');
            }
        } else {//保存
            if($this->_save($zid,$ztitle,$zsummary,$zcontent,$zflag,$zsub_type,true)){
                $this->show('{"result":0,"msg":"saving succeed."}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"saving occurs error."}', 'utf-8');
            }
        }
    }
    private function _create($zid,$ztitle,$zsummary,$zcontent,$zflag,$zsub_type,$release = false){
        $m = M('Z');
        $record['zcreator'] = 1;//TODO
        $record['ztitle'] = $ztitle;
        $record['zcontent'] = $zcontent;
        $record['zsub_type'] = $zsub_type;
        $record['zcreated_time'] = $record['zlast_edited_time'] = date('Y-m-d H:i:s', time());
        $record['zstate'] = 0;//编辑中
        $record['ztype'] = 0;//资讯
        $record['zflag'] = $zflag;
        $record['zsummary'] = $zsummary;
        $record['zscan_count'] = 0;
        if($release){
            $record['zstate'] = 30;//已发布
            $record['zreleased_time'] = $record['zlast_edited_time'];
        }
        return $m->add($record);
    }
    private function _save($zid,$ztitle,$zsummary,$zcontent,$zflag,$zsub_type,$release = false){
        $m = M('Z');
        $record['zid'] = $zid;
        $record['ztitle'] = $ztitle;
        $record['zcontent'] = $zcontent;
        $record['zsummary'] = $zsummary;
        $record['zsub_type'] = $zsub_type;
        $record['zstate'] = 0;////编辑中
        $record['zlast_edited_time'] = date('Y-m-d H:i:s', time());
        if($zflag != ''){
            $record['zflag'] = $zflag;
        }
        if($release){
            $record['zstate'] = 30;//已发布
            $record['zreleased_time'] = $record['zlast_edited_time'];
        }
        $t = $m->save($record);
        if($t==false){
            //$this->show('{"result":1,"msg":"'.$m->_sql().'"}', 'utf-8');return;
            //echo $m->getDbError();
        }
        //echo $m->_sql();
        //echo '艹';
        return $t;
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

    public function dtl_img(){
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