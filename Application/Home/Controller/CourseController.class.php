<?php
namespace Home\Controller;
use Think\Controller;
class CourseController extends Controller {
    public function index($subtype=0){

        $m = M('Courseware');
        $lim['eattr'] = 0;
        $lim['estate'] = array('in','20,0');//审核通过/发布中
        $this->netcourse_list = $m->where($lim)->field('econtent',true)->limit(5)->select();

        $m2 = M('Courseware');
        $lim2['eattr'] = 20;//公共课件
        $lim2['estate'] = 20;//发布
        $this->pi_list = $m2->where($lim2)->field('esummary,econtent',true)->limit(4)->select();


        $m3 = M('CourseView');
        $lim3['fstate'] = 10;//发布中
        $this->cw_list = $m3->where($lim3)->field('fname,fteacher')->limit(4)->select();

        $this->display();
    }

    //网络课程
    public function netcourse($page=0){
        $m = M('Courseware');
        $lim['eattr'] = 0;
        $lim['estate'] = array('in','20,0');//审核通过/发布中
        $this->netcourse_list = $m->where($lim)->select();
    	$this->display();
    }

    //网络课程详细
    public function netcourse_dtl($eid=-1){
        $eid = I('eid');
        if($eid == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');return;
        }
        $m = M('Courseware');
        $lim['eid'] = $eid;
        $record = $m->where($lim)->find();
        if($record){
            $this->eid = $record['eid'];
            $this->etitle = $record['etitle'];
            $this->eflag = $record['eflag'];
            $this->econtent = htmlspecialchars_decode($record['econtent'],ENT_QUOTES);
            $this->esummary = $record['esummary'];
            $this->eauthor_college = $record['eauthor_college'];
            $this->eauthor_name = $record['eauthor_name'];
            $this->elevel = $record['elevel'];
        } else {
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');return;
        }
    	$this->display();
    }
    //物理图书馆
    public function pl($page=0){
    	$this->display();
    }
    //物馆图书详细
    public function pl_detail($eid=0){
    	$this->display();
    }
    public function download($eid=0){
    	$this->show('暂不提供下载！', 'utf-8');
    }

    public function pi($page=0){
        $m = M('Courseware');
        $lim['eattr'] = 20;//公共课件
        $lim['estate'] = 20;//发布
        $this->pi_list = $m->where($lim)->select();
        $this->display();
    }


    public function netcourse_save($eid=-1,$etitle='',$eauthor_name='',
        $elevel='',$eauthor_college='',$eauthor_photo='',$eflag='',$econtent='',$esummary='',$release=0){
        $eid = I('eid');
        $etitle = I('etitle');
        $eauthor_name = I('eauthor_name');
        $elevel = I('elevel');
        $eauthor_college = I('eauthor_college');
        $eauthor_photo = I('eauthor_photo');
        $eflag = I('eflag');
        $econtent = I('econtent');
        $esummary = I('esummary');
        $release = I('release');

        $m = M('Courseware');
        $data['etitle'] = $etitle;
        $data['eauthor_name'] = $eauthor_name;
        $data['elevel'] = $elevel;
        $data['eauthor_college'] = $eauthor_college;
        $data['eauthor_photo'] = $eauthor_photo;
        $data['eflag'] = $eflag;
        $data['econtent'] = $econtent;
        $data['eattr'] = 0;//0-网络课程
        $data['esummary'] = $esummary;
        $data['estate'] = ($release !=0)?20:0;//20-审核通过，0-编辑中
        if($data['estate'] == 20){
            if($etitle == '' || $eauthor_name == '' || $eauthor_photo == '' || $eflag == ''){
                $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
                return;
            }
        }
        $data['elast_edited_time'] = date('Y-m-d H:i:s',time());
        if($eid == ''){//新建
            $data['ecreated_time'] = $data['elast_edited_time'];
            if($m->add($data)){
                $this->show('{"result":0,"msg":"saving succeed."}', 'utf-8');return;
            } else {
                $this->show('{"result":1,"msg":"dberror1:'.($m->getDbError()).'"}', 'utf-8');return;
            }
        } else {
            $data['eid'] = $eid;
            $r = $m->save($data);
            if($r){
                $this->show('{"result":0,"msg":"saving succeed."}', 'utf-8');return;
            } else {
                $this->show('{"result":1,"msg":"dberror: '.$m->_sql().($m->getDbError()).'"}', 'utf-8');return;
            }
        }
    }
    public function netcourse_edit($eid=-1){
        $eid = I('eid');
        if($eid == ''){
            $this->eid = -1;
            $this->display();
            return;
        }
        $m = M('Courseware');
        $lim['eid'] = $eid;
        $record = $m->where($lim)->find();
        if($record){
            $this->eid = $eid;
            $this->etitle = $record['etitle'];
            $this->eauthor_name = $record['eauthor_name'];
            $this->elevel = $record['elevel'];
            $this->eauthor_college = $record['eauthor_college'];
            $this->eauthor_photo = $record['eauthor_photo'];
            $this->eflag = $record['eflag'];
            $this->econtent = $record['econtent'];
            $this->esummary = $record['esummary'];
            $this->estate = $record['estate'];
            $this->display();
        } else {
            $this->eid = -1;
            $this->display();
        }
    }

    public function netcourse_upload($type=''){
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
            $this->show('{"result":0,"msg":"保存成功","pathname":"'.($file['savepath'].$file['savename']).'"}');
        }
        return;
    }

    public function pi_edit($eid = -1){
        $eid = I('eid');
        if($eid == ''){
            $this->eid = -1;$this->display();return;
        }
        $m = M('Courseware');
        $lim['eid'] = $eid;
        $record = $m->where($lim)->find();
        if($record){
            $this->eid = $record['eid'];
            $this->etitle = $record['etitle'];
            $this->econtent = $record['econtent'];
            $this->epath = $record['epath'];
            $this->display();
        } else{
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
        }
    }

    public function pi_save($eid=-1,$etitle='',$econtent='',$epath=''){
        $eid = I('eid');
        $etitle = I('etitle');
        $econtent = I('econtent');
        $epath = I('epath');
        if($etitle == '' || $econtent == '' || $epath == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');return;
        }
        if($eid == '' || $eid == -1){
            $m = M('Courseware');
            $data['etitle'] = $etitle;
            $data['econtent'] = $econtent;
            $data['eattr'] = 20;//公共课件
            $data['epath'] = $epath;
            $data['estate'] = 20;//发布
            $data['ecreated_time'] = date('Y-m-d H:i:s',time());
            $data['elast_edited_time'] = $data['ecreated_time'];
            if($m->add($data)){
                $this->show('{"result":0,"msg":"saving succeed."}', 'utf-8');return;
            } else{
                $this->show('{"result":1,"msg":"error"}', 'utf-8');return;
            }
        } else {
            $m = M('Courseware');
            $data['eid'] = $eid;
            $data['etitle'] = $etitle;
            $data['econtent'] = $econtent;
            $data['epath'] = $epath;
            $data['estate'] = 20;//发布
            $data['elast_edited_time'] = date('Y-m-d H:i:s',time());
            if($m->save($data)){
                $this->show('{"result":0,"msg":"saving succeed."}', 'utf-8');return;
            } else{
                $this->show('{"result":1,"msg":"error2."}', 'utf-8');return;
            }
        }
    }

    public function pi_upload(){

        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize = 1024*1024;// 设置附件上传大小 1M
        $upload->exts = array('zip', 'rar', 'gz', 'ppt','pdf','doc','docx','pptx');// 设置附件上传类型
        $upload->rootPath = './Public/uploads'; // 设置附件上传目录    
        $upload->savePath = '/pi/'; // 设置附件上传目录
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
            $this->show('{"result":0,"msg":"保存成功","pathname":"'.($file['savepath'].$file['savename']).'"}');
        }
        return;
    }



    public function cw(){
        $now_year = date('Y');
        $now_month = date('m');
        if($now_month >= 8){
            $now_year += 1;
        }echo $now_year;
        $m = M('CourseView');
        $lim['fstate'] = 10;//发布中
        $lim['fgrade'] = $now_year;
        $this->cw1_list = $m->where($lim)->select();

        $lim['fgrade'] = $now_year-1;
        $this->cw2_list = $m->where($lim)->select();
        $lim['fgrade'] = $now_year-2;
        $this->cw3_list = $m->where($lim)->select();
        $lim['fgrade'] = $now_year-3;
        $this->cw4_list = $m->where($lim)->select();


        $mgrade = M('Dic');
        $limgrade['dic_type'] = 'fgrade';
        $limgrade['dic_key'] = $now_year;
        $now_grade = $mgrade->where($limgrade)->find();
        $this->now_grade = $now_grade['dic_value'];
        $limgrade['dic_key'] = $now_year - 1;
        $last_grade = $mgrade->where($limgrade)->find();
        $this->last_grade = $last_grade['dic_value'];
        $limgrade['dic_key'] = $now_year - 2;
        $last2_grade = $mgrade->where($limgrade)->find();
        $this->last2_grade = $last2_grade['dic_value'];
        $limgrade['dic_key'] = $now_year - 3;
        $last3_grade = $mgrade->where($limgrade)->find();
        $this->last3_grade = $last3_grade['dic_value'];

        $this->display();
    }
    public function cw_dtl($fid=-1){
        $fid = I('fid');
        if($fid == '' || $fid == -1){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');return;
        }
        $m = M('CourseView');
        $lim['fid'] = $fid;
        $course = $m->where($lim)->find();
        $this->fname = $course['fname'];
        $this->faddr = $course['faddr'];
        $this->fterm_name = $course['fterm_name'];

        $m2 = M('Courseware');
        $lim2['efid'] = $fid;
        $this->cw_list = $m2->where($lim2)->order('elast_edited_time asc')->select();

        $m3 = M('CourseTaView');
        $lim3['pfid'] = $fid;
        $this->ta_list = $m3->where($lim3)->select();

        //dump($course);
        $this->display();
    }

}

?>