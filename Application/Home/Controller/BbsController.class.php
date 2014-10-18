<?php
namespace Home\Controller;
use Think\Controller;
class BbsController extends EdsController {

    public function __construct(){
        parent::__construct();
        $this->cond_logined = true;
    }

    public function index($page=0){

        $this->post_list = array();
        if(session('g_logined')!='logined'){//未登录
            $this->display();
            return;
        }
    	$m = M('PostListView');
        $lim['tstate'] = array('eq', '20');//20-置顶
    	$list1 = $m->where($lim)->order('tlast_edited_time desc')->select();
        if($list1){
            $this->post_list = $list1;
        }
        $lim['tstate'] = array('eq', '10');//10-发布
        $list2 = $m->where($lim)->order('tlast_edited_time desc')->select();
        if($list2){
            $this->post_list = array_merge($this->post_list,$list2);
        }
        //dump($list1);
        //dump($list2);

        //$this->topN_list = array();
        $mtopN = M('BbsTopView');
        $this->topN_list = $mtopN->limit(10)->select();

        $this->display();
    }

    public function post_list($cid=-1){
        if(session('g_logined')!='logined'){//未登录
            $this->display();
            return;
        }
    	$cid = I('cid');
    	if($cid == ''){
    		$cid = 1;
    	}
    	$m = M('Bbs');
        $m2 = M('Bbs');
    	$lim['ttopic'] = $cid;
    	$lim['tstate'] = 20;//20-置顶
    	$post_list1 = $m->where($lim)->order('tlast_edited_time desc')->select();
        if($post_list1){
            $this->post_list = $post_list1;
        } else{
            $this->post_list = array();
        }
        $lim2['ttopic'] = $cid;
        $lim2['tstate'] = 10;//10-发布
        $post_list2 = $m2->where($lim2)->order('tlast_edited_time desc')->select();
    	//echo $m->_sql();return;
        if($post_list2){
            $this->post_list = array_merge($this->post_list,$post_list2);
        }
    	$this->cid = $cid;
        //dump($post_list1);
        //dump($post_list2);
    	$this->display();
    }

    public function post_dtl($tid=-1,$vid='',$vkey=''){
        if(session('g_logined')!='logined'){//未登录
            $this->redirect('/Home/Bbs?url=/Home/Bbs/post_dtl?tid='.$tid,0,0,'');
            $this->display();
            return;
        }
    	$tid = I('tid');
    	if($tid == ''){
    		$this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
    	}
        $vid= I('vid');
        $vkey = I('vkey');
        //echo '$vid='.$vid.'<br />';
        //echo '$vkey='.$vkey.'<br />';
        if($vid != '' && $vkey != ''){
            $lim_event['vid'] = $vid;
            $lim_event['vkey'] = $vkey;
            $lim_event['vstate'] = 20;//已查看
            $m_ev = M('Event');
            $m_ev->save($lim_event);//ignore error
            //echo $m_ev->_sql();
        }
    	$m = M('Bbs');
    	$lim['tid'] = $tid;
    	$record = $m->where($lim)->find();
    	if($record){
            if(session('tscan_count'.$record['tid'])==null){
                session('tscan_count'.$record['tid'], true);
                $record['tscan_count'] += 1;
                $m->where('tid='.$record['tid'])->setInc('tscan_count');
            }

    		$this->tid = $tid;
            $this->trid = $record['trid'];
    		$this->ttopic = $record['ttopic'];
    		$this->ttitle = $record['ttitle'];
    		$this->tsummary = $record['tsummary'];
    		$this->tcontent = htmlspecialchars_decode($record['tcontent'], ENT_QUOTES);
    		$this->tcreated_time = $record['tcreated_time'];
    		$this->tstate = $record['tstate'];
    		$this->tscan_count = $record['tscan_count'];
    		$this->cid = $record['ttopic'];

            $regm = M('Register');
            $reg_lim['rid'] = $record['trid'];
            $reg_rec = $regm->where($reg_lim)->field('rnickname,rhead_photo')->find();
            if($reg_rec){
                $this->rid = $record['trid'];
                $this->rnickname = $reg_rec['rnickname'];
                $this->rhead_photo = $reg_rec['rhead_photo'];
            }

    		$replym = M('PostReplyView');
    		$lim2['treply_id'] = $tid;
    		$this->reply_list = $replym->where($lim2)->select();
    		$this->treply_count = count($this->reply_list);
    	} else {
    		$this->show('{"result":1,"msg":"unknown id."}', 'utf-8');
            return;
    	}
    	$this->display();
    }
    public function post_reply($tid=-1,$tsummary='',$tcontent=''){
        if(session('g_logined')!='logined'){//未登录
            $this->display();
            return;
        }
    	$tid = I('tid');
    	$tsummary = I('tsummary');
    	$tcontent = I('tcontent');
    	if($tid == ''||$tsummary==''||$tcontent==''){
    		$this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
    	}
    	$m = M('Bbs');
		$data['treply_id'] = $tid;
    	$data['trid'] = session('rid');//TODO
		$data['tsummary'] = $tsummary;
		$data['tcontent'] = $tcontent;
    	$data['tstate'] = 10;//发布
    	$data['tcreated_time'] = date('Y-m-d H:i:s',time());
		if($m->add($data)){
            $postm = M('Bbs');
            $postdata['tid'] = $tid;
            $postrec = $postm->where($postdata)->find();
            if($postrec){
                $evm = M('Event');
                $evdata['vrid'] = $postrec['trid'];
                $evdata['vtitle'] = $postrec['ttitle'];
                $evdata['vtype'] = 1;//帖子回复
                $evdata['vurl'] = '/Home/Bbs/post_dtl?tid='.$postrec['treply_id'].'#start';
                $evdata['vcreated_time'] = date('Y-m-d H:i:s',time());
                $evdata['vstate'] = 0;//0-未查看
                $evdata['vref'] = session('rid');
                $evdata['vkey'] = $this->get_rand_str(20);
                $evm->add($evdata);
                //echo $evm->_sql();
            }
			$this->show('{"result":0,"msg":"adding succeed."}', 'utf-8');
		}else{
			$this->show('{"result":1,"msg":"'.($m->getDbError()).'"}', 'utf-8');
		}
    }
    private function get_rand_str($length){
        $str = '';
        $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
        $max = strlen($strPol)-1;
        for($i=0;$i<$length;$i++){
            $str.=$strPol[rand(0,$max)];//rand($min,$max)生成介于min和max两个数之间的一个随机整数
        }
        return $str;
    }


    public function post($tid=-1){
        if(session('g_logined')!='logined'){//未登录
            $this->display();
            return;
        }
    	$tid = I('tid');
    	if($tid == ''){
    		$tid = -1;
    	}
    	if($tid != -1){
    		$m = M('Bbs');
            $lim['tid'] = $tid;
            $record = $m->where($lim)->find();
            $this->tid = $tid;
            $this->ttitle = $record['ttitle'];
            $this->tsummary = $record['tsummary'];
            $this->tcontent = $record['tcontent'];
            $this->ttopic = $record['ttopic'];
            $this->cid = $record['ttopic'];
            $this->tstate = $record['tstate'];
            $this->tcreated_time = $record['tcreated_time'];
    	}
    	$this->display();
    }


    public function post_img_upload(){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $upload = new \Think\Upload();
        $upload->maxSize = 1024*1024;
        $upload->exts = array('png','gif','jpg','jpeg');
        $upload->rootPath = './Public/uploads'; 
        $upload->savePath = '/image/';
        $upload->autoSub = false;
        $upload->saveName = date('Y_m_d_H_i_s', time()).'_'.mt_rand();
        
        $info = $upload->upload();
        if($info){
            $flag = '';
            foreach($info as $file){
                $flag .= $file['savepath'].$file['savename'];
                break;
            }
            $this->show('{"result":0,"msg":"succeed","flag":"'.$flag.'"}');
        } else{
            $error = $upload->getError();
            $error = str_replace('"', '&', $error);
            $this->show('{"result":1,"msg":"'.$error.'"}', 'utf-8');
        }
        return;
    }

    public function post_release($zid=-1,$zsub_type='',$ztitle='',$zflag='',$zsummary='',$zcontent=''){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $zid = I('zid');
        $zsub_type = I('zsub_type');
        $ztitle = I('ztitle');
        $zflag = I('zflag');
        $zsummary = I('zsummary');
        $zcontent = I('zcontent');
        if($zsub_type==''||$ztitle==''||$zsummary==''||$zcontent==''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $this->p_post_save($zid,$zsub_type,$ztitle,$zflag,$zsummary,$zcontent,10);//10-发布
    }
    public function post_save($zid=-1,$zsub_type='',$ztitle='',$zflag='',$zsummary='',$zcontent=''){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $zid = I('zid');
        $zsub_type = I('zsub_type');
        $ztitle = I('ztitle');
        $zflag = I('zflag');
        $zsummary = I('zsummary');
        $zcontent = I('zcontent');
        if($zsub_type==''||$ztitle==''||$zsummary==''||$zcontent==''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $this->p_post_save($zid,$zsub_type,$ztitle,$zflag,$zsummary,$zcontent,0);//0-编辑中
    }
    private function p_post_save($zid,$zsub_type,$ztitle,$zflag,$zsummary,$zcontent,$tstate){
        $data['ttopic'] = $zsub_type;
        $data['ttitle'] = $ztitle;
        $data['tflag'] = $zflag;
        $data['tsummary'] = $zsummary;
        $data['tcontent'] = $zcontent;
        $data['tstate'] = $tstate;
        $data['tlast_edited_time'] = date('Y-m-d H:i:s',time());
        if($zid == '' || $zid == -1){
            $m = M('Bbs');
            $data['trid'] = session('rid');
            $data['tcreated_time'] = $data['tlast_edited_time'];
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
            if($m->save($data)){
                $this->show('{"result":0,"msg":"adding succeed."}', 'utf-8');
                return;
            }else{
                $this->show('{"result":1,"msg":"'.($m->getDbError()).'"}', 'utf-8');
                return;
            }
        }
    }

    public function post_top($tid=-1,$ttop=0){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $tid = I('tid');
        $ttop = I('ttop');
        if($tid != ''){
            if($ttop == 0){//取消置顶
                $m = M('Bbs');
                $data['tid'] = $tid;
                $data['tstate'] = 10;
                $data['ttop_time'] = date('Y-m-d H:i:s',time());
                if($m->save($data)){
                    $this->show('{"result":0,"msg":"succeed."}', 'utf-8');
                    return;
                } else {
                    $this->show('{"result":1,"msg":"db error."}', 'utf-8');
                    return;
                }
            } else if($ttop == 1){//置顶
                $m = M('Bbs');
                $data['tid'] = $tid;
                $data['tstate'] = 20;
                $data['ttop_time'] = date('Y-m-d H:i:s',time());
                if($m->save($data)){
                    $this->show('{"result":0,"msg":"succeed."}', 'utf-8');
                    return;
                } else {
                    $this->show('{"result":1,"msg":"db error.'.$m->_sql().'"}', 'utf-8');
                    return;
                }

            }
        }
        $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
    }
    public function post_delete($tid = -1){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $tid = I('tid');
        if($tid == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
        }
        $m = M('Bbs');
        $data['tid'] = $tid;
        $data['tstate'] = 30;//被原作者删除
        if($m->save($data)){
            $this->show('{"result":0,"msg":"succeed."}', 'utf-8');
        } else{
            $this->show('{"result":1,"msg":"db error."}', 'utf-8');
        }
    }

    public function my_post(){
        if(session('g_logined')!='logined'){//未登录
            //$this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            $this->display();
            return;
        }
        //
        $m = M('Bbs');
        $lim['tstate'] = array('in', '0,10,20');//0-编辑中,10-发布,20-置顶
        $lim['trid'] = session('rid');
        $lim['treply_id'] = array('exp', ' is null ');
        $this->post_list = $m->where($lim)->order('tstate')->select();
        //echo $m->_sql();return;
        //dump($this->post_list);
        //echo session('rid');
        $this->display();
    }


	public function acc(){
        if(session('g_logined')!='logined'){//未登录
            //$this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            $this->display();
            return;
        }
        if(session('rid') > 10){//非系统管理员不能查看
            $this->show('{"result":1,"msg":"permission error."}', 'utf-8');
            return;
        }
		$m = M('RegisterManagerView');
		$lim['rstate'] = array('in', '(0,10)');
		$lim['rrole'] = array('elt', 25);
		$this->acc_list = $m->where($lim)->field(true)->select();
		$this->display();
	}
    public function acc_save($rid = -1,$raccount='',$rpassword='',$rnickname='',
    	$rstate='',
		$mpcreate_teacher='',
		$mpcreate_news='',
		$mpcreate_act='',
		$mpcreate_plan_project='',
		$mpedit_league_college='',
		$mpcreate_notice='',
		$mpcheck_ex_note='',
		$mpcreate_ex_trend='',
		$mpcreate_ex_project='',
		$mpcheck_courseware='',
		$mpcreate_topic='',
		$mpcreate_post='',
		$mpcreate_reply='',
		$mpcreate_msg='',
		$mpmanager_user='',
		$mpmanager_bbs=''
    	){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        if(strlen($raccount)<6 || strpos($raccount, 's',0)!==0){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        if(session('rrole')>10){//只有角色<=10才能创建/修改账户信息
            $this->show('{"result":1,"msg":"permission error."}', 'utf-8');
            return;
        }
    	$rid = I('rid');
    	$raccount = I('raccount');
    	$rpassword = I('rpassword');
    	$rnickname = I('rnickname');

    	$m = M('Register');
    	$lim['raccount'] = $raccount;
    	if($m->where($lim)->find()){
    		if($m->data()['rid'] != $rid){
    			$this->show('{"result":1,"msg":"account(\''.$raccount.'\') error."}', 'utf-8');return;
    		}
    	}
    	$m->create();
    	if($rid == -1 || $rid == ''){
    		$data['raccount'] = $raccount;
    		$data['rpassword'] = sha1(md5($rpassword));
    		$data['rnickname'] = $rnickname;
    		$data['rrole'] = 20;//普管
    		$data['rstate'] = $rstate=='true'?0:10;//0-正常
    		$data['rcreated_time'] = date('Y-m-d H:i:s',time());
    		$data['rlast_edited_time']  = $data['rcreated_time'];
    		$data['rhead_photo'] = '/assets/image/headphoto/default.png';
    		$rid = $m->add($data);
    		if($rid){
    			$data2['mrid'] = $rid;
				$data2['mpcreate_teacher']=$mpcreate_teacher=='true'?1:0;
				$data2['mpcreate_news']=$mpcreate_news=='true'?1:0;
				$data2['mpcreate_act']=$mpcreate_act=='true'?1:0;
				$data2['mpcreate_plan_project']=$mpcreate_plan_project=='true'?1:0;
				$data2['mpedit_league_college']=$mpedit_league_college=='true'?1:0;
				$data2['mpcreate_notice']=$mpcreate_notice=='true'?1:0;
				$data2['mpcheck_ex_note']=$mpcheck_ex_note=='true'?1:0;
				$data2['mpcreate_ex_trend']=$mpcreate_ex_trend=='true'?1:0;
				$data2['mpcreate_ex_project']=$mpcreate_ex_project=='true'?1:0;
				$data2['mpcheck_courseware']=$mpcheck_courseware=='true'?1:0;
				$data2['mpcreate_topic']=$mpcreate_topic=='true'?1:0;
				$data2['mpcreate_post']=$mpcreate_post=='true'?1:0;
				$data2['mpcreate_reply']=$mpcreate_reply=='true'?1:0;
				$data2['mpcreate_msg']=$mpcreate_msg=='true'?1:0;
				$data2['mpmanager_user']=$mpmanager_user=='true'?1:0;
				$data2['mpmanager_bbs']=$mpmanager_bbs=='true'?1:0;
                $data2['mlast_edited_time']  = $data['rlast_edited_time'];
    			
    			$m2 = M('Manager');
    			if($m2->add($data2)){
    				$this->show('{"result":0,"msg":"adding succeed."}', 'utf-8');
    			} else{
    				$this->show('{"result":1,"msg":"error1."}', 'utf-8');
    			}
    		}else{
    			$this->show('{"result":1,"msg":"'.htmlspecialchars($m->_sql(),ENT_QUOTES).'"}', 'utf-8');
    		}
    	} else {
    		$data['rid'] = $rid;
    		$data['raccount'] = $raccount;
    		//$data['rpassword'] = sha1(md5($rpassword));
    		$data['rnickname'] = $rnickname;
    		//$data['rrole'] = 20;//普管
    		$data['rstate'] = $rstate=='true'?0:10;//0-正常
    		$data['rlast_edited_time']  = date('Y-m-d H:i:s',time());
    		if($m->save($data)){
				$data2['mpcreate_teacher']=$mpcreate_teacher=='true'?1:0;
				$data2['mpcreate_news']=$mpcreate_news=='true'?1:0;
				$data2['mpcreate_act']=$mpcreate_act=='true'?1:0;
				$data2['mpcreate_plan_project']=$mpcreate_plan_project=='true'?1:0;
				$data2['mpedit_league_college']=$mpedit_league_college=='true'?1:0;
				$data2['mpcreate_notice']=$mpcreate_notice=='true'?1:0;
				$data2['mpcheck_ex_note']=$mpcheck_ex_note=='true'?1:0;
				$data2['mpcreate_ex_trend']=$mpcreate_ex_trend=='true'?1:0;
				$data2['mpcreate_ex_project']=$mpcreate_ex_project=='true'?1:0;
				$data2['mpcheck_courseware']=$mpcheck_courseware=='true'?1:0;
				$data2['mpcreate_topic']=$mpcreate_topic=='true'?1:0;
				$data2['mpcreate_post']=$mpcreate_post=='true'?1:0;
				$data2['mpcreate_reply']=$mpcreate_reply=='true'?1:0;
				$data2['mpcreate_msg']=$mpcreate_msg=='true'?1:0;
				$data2['mpmanager_user']=$mpmanager_user=='true'?1:0;
				$data2['mpmanager_bbs']=$mpmanager_bbs=='true'?1:0;
                $data2['mlast_edited_time']  = $data['rlast_edited_time'];
				$m2 = M('Manager');
				if($m2->where(" `mrid`=$rid")->save($data2)){
					$this->show('{"result":0,"msg":"succeed."}', 'utf-8');
				} else{
					$this->show('{"result":1,"msg":"'.$m2->_sql().'."}', 'utf-8');
				}
    		}else{
    			$this->show('{"result":1,"msg":"error3."}', 'utf-8');
    		}
    	}
    }

    public function acc_dtl($rid=-1){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        if(session('rid') > 10){//非系统管理员不能查看
            $this->show('{"result":1,"msg":"permission error."}', 'utf-8');
            return;
        }
    	$m = M('ManagerView');
    	$lim['rid'] = I('rid');
    	$register = $m->where($lim)->find();
    	if(!$register){
    		$this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
    	}
    	$this->rid = $register['rid'];
    	$this->raccount = $register['raccount'];
    	$this->rnickname = $register['rnickname'];
    	$this->rcreated_time = $register['rcreated_time'];
    	$this->rlast_edited_time = $register['rlast_edited_time'];
    	$this->rstate = $register['rstate'];
    	$this->rstate_name = $register['rstate_name'];

		$this->mpcreate_teacher=$register['mpcreate_teacher'];
		$this->mpcreate_news=$register['mpcreate_news'];
		$this->mpcreate_act=$register['mpcreate_act'];
		$this->mpcreate_plan_project=$register['mpcreate_plan_project'];
		$this->mpedit_league_college=$register['mpedit_league_college'];
		$this->mpcreate_notice=$register['mpcreate_notice'];
		$this->mpcheck_ex_note=$register['mpcheck_ex_note'];
		$this->mpcreate_ex_trend=$register['mpcreate_ex_trend'];
		$this->mpcreate_ex_project=$register['mpcreate_ex_project'];
		$this->mpcheck_courseware=$register['mpcheck_courseware'];
		$this->mpcreate_topic=$register['mpcreate_topic'];
		$this->mpcreate_post=$register['mpcreate_post'];
		$this->mpcreate_reply=$register['mpcreate_reply'];
		$this->mpcreate_msg=$register['mpcreate_msg'];
		$this->mpmanager_user=$register['mpmanager_user'];
		$this->mpmanager_bbs=$register['mpmanager_bbs'];


    	$this->display();
    }
    public function acc_edit($rid=-1){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        if(session('rid') > 10){//非系统管理员不能查看
            $this->show('{"result":1,"msg":"permission error."}', 'utf-8');
            return;
        }
    	$m = M('ManagerView');
    	$lim['rid'] = I('rid');
    	$register = $m->where($lim)->find();
    	if(!$register){
    		$this->rid = -1;
    		$this->display();
            return;
    	}
    	$this->rid = $register['rid'];
    	$this->raccount = $register['raccount'];
    	$this->rnickname = $register['rnickname'];
    	$this->rcreated_time = $register['rcreated_time'];
    	$this->rlast_edited_time = $register['rlast_edited_time'];
    	$this->rstate = $register['rstate'];
    	$this->rstate_name = $register['rstate_name'];

		$this->mpcreate_teacher=$register['mpcreate_teacher'];
		$this->mpcreate_news=$register['mpcreate_news'];
		$this->mpcreate_act=$register['mpcreate_act'];
		$this->mpcreate_plan_project=$register['mpcreate_plan_project'];
		$this->mpedit_league_college=$register['mpedit_league_college'];
		$this->mpcreate_notice=$register['mpcreate_notice'];
		$this->mpcheck_ex_note=$register['mpcheck_ex_note'];
		$this->mpcreate_ex_trend=$register['mpcreate_ex_trend'];
		$this->mpcreate_ex_project=$register['mpcreate_ex_project'];
		$this->mpcheck_courseware=$register['mpcheck_courseware'];
		$this->mpcreate_topic=$register['mpcreate_topic'];
		$this->mpcreate_post=$register['mpcreate_post'];
		$this->mpcreate_reply=$register['mpcreate_reply'];
		$this->mpcreate_msg=$register['mpcreate_msg'];
		$this->mpmanager_user=$register['mpmanager_user'];
		$this->mpmanager_bbs=$register['mpmanager_bbs'];


    	$this->display();

    }
    public function acc_restrict($rid=-1,$state=0){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
    	$rid = I('rid');
    	$state = I('state');
    	if($rid == -1 || $rid == ''){
    		$this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
    		return;
    	}
        if($rid == 1 || session('rid') > 10){//系统管理员账号不能被禁止登录，非系统管理员不能操作
            $this->show('{"result":1,"msg":"permission error."}', 'utf-8');
            return;
        }
    	$m = M('Register');
    	$data['rid'] = $rid;
    	$data['rstate'] = $state == 1?0:10;
        $data['rlast_edited_time'] = date('Y-m-d H:i:s',time());
    	if($m->save($data)){
    		$this->show('{"result":0,"msg":"succeed."}', 'utf-8');
    	} else{
    		$this->show('{"result":1,"msg":"error."}', 'utf-8');
    	}
    }
    public function acc_reset_password($rid=-1){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
    	if($rid == -1){
    		$this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
    		return;
    	}
        if(session('rid') != 1 && session('rid') != $rid){//只有系统才能重置
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
    	$m = M('Register');
    	$data['rid'] = $rid;
    	$data['rpassword'] = sha1(md5('000000'));
        $data['rlast_edited_time'] = date('Y-m-d H:i:s', time());
    	if($m->save($data)){
			$this->show('{"result":0,"msg":"succeed."}', 'utf-8');
    	} else {
    		$this->show('{"result":1,"msg":"error."}', 'utf-8');
    	}
    }
    public function acc_delete($rid = -1){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
    	if($rid == -1){
    		$this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
    		return;
    	}
    	//<!--在此插入权限检查-->
    	if($rid == 1){//系统管理员不能被删除
    		$this->show('{"result":1,"msg":"permission error."}', 'utf-8');
    		return;
    	}
        if($rid == 1 || session('rid') > 10){//系统管理员账号不能被删除，非系统管理员不能操作
            $this->show('{"result":1,"msg":"permission error."}', 'utf-8');
            return;
        }

    	$m = M('Register');
    	$data['rid'] = $rid;
    	$data['rstate'] = 20;//删除
        $data['rlast_edited_time'] = date('Y-m-d H:i:s',time());
    	if($m->save($data)){
			$this->show('{"result":0,"msg":"succeed."}', 'utf-8');
    	} else {
    		$this->show('{"result":1,"msg":"error."}', 'utf-8');
    	}
    }


	public function tah(){
        if(session('g_logined')!='logined'){//未登录
            //$this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            $this->display();
            return;
        }
		$m = M('RegisterUserView');
		$lim['rstate'] = array('in', '0,10');
		$lim['rrole'] = array(array('gt', 25),array('neq', '35'));//使用25作为分界线
		$this->tah_list = $m->where($lim)->field(true)->select();
		//echo $m->_sql();
		$this->display();
	}

	public function tah_dtl($rid = ''){
        if(session('g_logined')!='logined'){//未登录
            //$this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            $this->display();
            return;
        }
		$rid = I('rid');
		if($rid == ''){
    		$this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
		}
    	$m = M('UserView');
    	$lim['rid'] = I('rid');
    	$register = $m->where($lim)->find();
    	if($register == false){
    		$this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
    	}
        $this->rid = $register['rid'];
        $this->raccount = $register['raccount'];
        $this->rrole = $register['rrole'];
        $this->rnickname = $register['rnickname'];
        $this->rcreated_time = $register['rcreated_time'];
        $this->rlast_edited_time = $register['rlast_edited_time'];
        $this->rstate = $register['rstate'];
        $this->rstate_name = $register['rstate_name'];

        $this->gname = $register['gname'];
        $this->uname = $register['uname'];
        $this->uchar = $register['uchar'];
        $this->uchar_name = $register['uchar_name'];

        $this->rstate = $register['rstate'];
        $this->ucreate_post = $register['ucreate_post'];
        $this->ucreate_reply = $register['ucreate_reply'];
        $this->ucreate_msg = $register['ucreate_msg'];
        $this->ucreate_ex_note = $register['ucreate_ex_note'];
        $this->ucreate_ex_trend = $register['ucreate_ex_trend'];
        $this->ucreate_ex_project = $register['ucreate_ex_project'];
        $this->uupload_courseware = $register['uupload_courseware'];
        $this->udownload_courseware = $register['udownload_courseware'];
        $this->umanage_student = $register['umanage_student'];

        //$this->mpcreate_teacher=$register['mpcreate_teacher'];
        //dump($register);
        if($this->rrole == 40){
            $this->display('stu_dtl');
        } else {
            $this->display();
        }
	}

	public function tah_edit($rid = -1){
        if(session('g_logined')!='logined'){//未登录
            //$this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            $this->display();
            return;
        }
		$cm = M('College');
		$this->college_list = $cm->select();
		$dicm = M('Dic');
		$limuchar['dic_type'] = 'uchar';
		$this->uchar_list = $dicm->where($limuchar)->order('dic_key desc')->select();
		$rid = I('rid');
		if($rid == '' || $rid == -1){
			$this->rid = -1;
			$this->display();
			return;
		}

        $m = M('UserView');
        $lim['rid'] = $rid;
        $register = $m->where($lim)->find();
        if($register == false){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $this->rid = $register['rid'];
        $this->raccount = $register['raccount'];
        $this->rnickname = $register['rnickname'];
        $this->rcreated_time = $register['rcreated_time'];
        $this->rlast_edited_time = $register['rlast_edited_time'];
        $this->rstate = $register['rstate'];
        $this->rstate_name = $register['rstate_name'];

        $this->uchar = $register['uchar'];

        $this->rstate = $register['rstate'];
        $this->ucreate_post = $register['ucreate_post'];
        $this->ucreate_reply = $register['ucreate_reply'];
        $this->ucreate_msg = $register['ucreate_msg'];
        $this->ucreate_ex_note = $register['ucreate_ex_note'];
        $this->ucreate_ex_trend = $register['ucreate_ex_trend'];
        $this->ucreate_ex_project = $register['ucreate_ex_project'];
        $this->uupload_courseware = $register['uupload_courseware'];
        $this->udownload_courseware = $register['udownload_courseware'];
        $this->umanage_student = $register['umanage_student'];

        //dump($register);
        $this->display();
	}
    public function tah_save($rid = -1,$ugid=-1,$uchar=-1,$raccount='',$rpassword='',$rnickname='',
    	$rstate='',
		$ucreate_post='',
		$ucreate_reply='',
		$ucreate_msg='',
		$ucreate_ex_note='',
		$ucreate_ex_trend='',
		$ucreate_ex_project='',
		$uupload_courseware='',
		$udownload_courseware='',
		$umanage_student=''
    	){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
		$rid = I('rid');
		$ugid = I('ugid');
    	$raccount = I('raccount');
    	$rpassword = I('rpassword');
    	$rnickname = I('rnickname');
    	if($ugid == '' || $raccount == ''){
    		$this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
    		return;
    	}

		$m = M('Register');
    	$lim['raccount'] = $ugid.$raccount;
    	if($m->where($lim)->find()){
    		if($m->data()['rid'] != $rid){
    			$this->show('{"result":1,"msg":"account(\''.$lim['raccount'].'\') error."}', 'utf-8');return;
    		}
    	}
    	if($rid == -1 || $rid == ''){
    		$data['raccount'] = $ugid.$raccount;
    		$data['rpassword'] = sha1(md5($rpassword));
    		$data['rnickname'] = $rnickname;
    		$data['rrole'] = 30;//教师级别
    		$data['rstate'] = $rstate=='true'?0:10;//0-正常
    		$data['rcreated_time'] = date('Y-m-d H:i:s',time());
    		$data['rlast_edited_time']  = $data['rcreated_time'];
    		$data['rhead_photo'] = '/assets/image/headphoto/default.png';
			$rid = $m->add($data);
    		if($rid){
    			$data2['urid'] = $rid;
    			$data2['uchar'] = $uchar;
    			$data2['uno'] = $raccount;
    			$data2['uname'] = $rnickname;
    			$data2['udisplay_name'] = $rnickname;
    			$data2['usender'] = 0;//0-未知
    			$data2['uuid'] = session('uid'); if(is_null($data2['uuid']))$data2['uuid'] = 0;
    			$data2['uhead_photo'] = '/assets/image/headphoto/default.png';
    			$data2['ucreate_post']=$ucreate_post=='true'?1:0;
				$data2['ucreate_reply']=$ucreate_reply=='true'?1:0;
				$data2['ucreate_msg']=$ucreate_msg=='true'?1:0;
				$data2['ucreate_ex_note']=$ucreate_ex_note=='true'?1:0;
				$data2['ucreate_ex_trend']=$ucreate_ex_trend=='true'?1:0;
				$data2['ucreate_ex_project']=$ucreate_ex_project=='true'?1:0;
				$data2['uupload_courseware']=$uupload_courseware=='true'?1:0;
				$data2['udownload_courseware']=$udownload_courseware=='true'?1:0;
				$data2['umanage_student']=$umanage_student=='true'?1:0;
                $data2['ulast_edited_time']=date('Y-m-d H:i:s',time());
    			$m2 = M('User');
    			if($m2->add($data2)){
    				$this->show('{"result":0,"msg":"adding succeed.","rid":"'.$rid.'"}', 'utf-8');
    			} else{
    				$this->show('{"result":1,"msg":"error1.'.$m2->getDbError().'"}', 'utf-8');
    			}
    		}else{
    			$this->show('{"result":1,"msg":"'.$m->getDbError().'"}', 'utf-8');
    		}
    	} else {
    		$data['rid'] = $rid;
			$data['raccount'] = $ugid.$raccount;
    		//$data['rpassword'] = sha1(md5($rpassword));
    		$data['rnickname'] = $rnickname;
    		//$data['rrole'] = 30;//教师级别
    		$data['rstate'] = $rstate=='true'?0:10;//0-正常
    		//$data['rcreated_time'] = date('Y-m-d H:i:s',time());
    		$data['rlast_edited_time']  = date('Y-m-d H:i:s',time());
    		$data['rhead_photo'] = '/assets/image/headphoto/default.png';
    		if($m->save($data)){
    			$data2['urid'] = $rid;
    			$data2['uchar'] = $uchar;
    			$data2['uno'] = $raccount;
    			$data2['uname'] = $rnickname;
    			$data2['udisplay_name'] = $rnickname;
    			//$data2['usender'] = 0;//0-未知
    			//$data2['uuid'] = session('uid');
    			$data2['uhead_photo'] = '/assets/image/headphoto/default.png';
    			$data2['ucreate_post']=$ucreate_post=='true'?1:0;
				$data2['ucreate_reply']=$ucreate_reply=='true'?1:0;
				$data2['ucreate_msg']=$ucreate_msg=='true'?1:0;
				$data2['ucreate_ex_note']=$ucreate_ex_note=='true'?1:0;
				$data2['ucreate_ex_trend']=$ucreate_ex_trend=='true'?1:0;
				$data2['ucreate_ex_project']=$ucreate_ex_project=='true'?1:0;
				$data2['uupload_courseware']=$uupload_courseware=='true'?1:0;
				$data2['udownload_courseware']=$udownload_courseware=='true'?1:0;
				$data2['umanage_student']=$umanage_student=='true'?1:0;
                $data2['ulast_edited_time']=date('Y-m-d H:i:s',time());
    			$m2 = M('User');
                $data2['uid'] = $m2->where('`urid`='.$rid)->find()['uid'];
                $result = $m2->save($data2);
                //echo $m2->_sql();
    			if($result){
    				$this->show('{"result":0,"msg":"saving succeed.","rid":"'.$rid.'"}', 'utf-8');
    			} else{
    				$this->show('{"result":1,"msg":"'.$m2->getDbError().'"}', 'utf-8');
    			}
    		}else{
    			$this->show('{"result":1,"msg":"'.htmlspecialchars($m->getDbError(),ENT_QUOTES).'"}', 'utf-8');
    		}
    	}
    }



    public function cw(){
        if(session('g_logined')!='logined'){//未登录
            //$this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            $this->display();
            return;
        }
        $m = M('CourseView');
        $lim['fcreator'] = session('rid');
        $lim['fstate'] = array('in', '0,10,20');
        $this->course_list = $m->where($lim)->select();
        $this->display();
    }
    public function cw_dtl($fid = -1){
        if(session('g_logined')!='logined'){//未登录
            //$this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            $this->display();
            return;
        }
        $fid = I('fid');
        if($fid == '' || $fid == -1){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $m = M('CourseView');
        $lim['fid'] = $fid;
        $course = $m->where($lim)->find();
        if($course == false){
            $this->show('{"result":1,"msg":"parameters error2."}', 'utf-8');
            return;
        }
        //dump($course);
        $this->fid = $course['fid'];
        $this->fname = $course['fname'];
        $this->fgrade = $course['fgrade'];
        $this->faddr = $course['faddr'];
        $this->fteacher = $course['fteacher'];
        $this->fterm_name = $course['fterm_name'];


        $m2 = M('Courseware');
        $lim2['efid'] = $fid;
        $lim2['estate'] = array('in','10,20');//10-审核中,20-审核通过
        $this->cw_list = $m2->where($lim2)->order('estate asc,elast_edited_time asc')->select();

        //session('uid',1);
        $m3 = M('CourseTaView');
        $lim3['pfid'] = $fid;
        //$lim3['uuid'] = session('uid');
        $this->ta_c_list = $m3->where($lim3)->select();
        //dump($this->ta_c_list);

        $m4 = M('TaView');
        $lim4['uuid'] = session('uid');
        $lim4['rstate'] = array('in', '0');//0是正常
        $this->ta_list = $m4->where($lim4)->select();


        $this->display();
    }
    public function cw_edit($fid=-1){
        if(session('g_logined')!='logined'){//未登录
            //$this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            $this->display();
            return;
        }
        $fid = I('fid');

        $mterm = M('Dic');
        $limterm['dic_type'] = 'fterm';
        $this->term_list = $mterm->where($limterm)->select();
        //dump($this->term_list);
        if($fid == '' || $fid == -1){
            $this->fid = -1;
            $this->display();
            return;
        }
        $m = M('CourseView');
        $lim['fid'] = $fid;
        $record = $m->where($lim)->find();
        if($record == false){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $this->fid = $record['fid'];
        $this->fname = $record['fname'];
        $this->faddr = $record['faddr'];
        $this->fgrade = $record['fgrade'];
        $this->fterm = $record['fterm'];
        $this->fteacher = $record['fteacher'];
        $this->flast_edited_time = $record['flast_edited_time'];


        $this->display();
    }
    public function cw_save($fid=-1,$fname='',$fteacher='',$fgrade='',$faddr='',$fterm='',$release=0){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $fid = I('fid');
        $fname = I('fname');
        $fteacher = I('fteacher');
        $fgrade = I('fgrade');
        $faddr = I('faddr');
        $fterm = I('fterm');
        $release = I('release');
        if($fname == '' || $fteacher == '' || $fgrade==''||$fterm==''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        if($fid == -1 || $fid == ''){//add
            $m = M('Course');
            $data['fname'] = $fname;
            $data['fcreator'] = session('rid');
            $data['fteacher'] = $fteacher;
            $data['fgrade'] = $fgrade;
            $data['faddr'] = $faddr;
            $data['fterm'] = $fterm;
            $data['fstate'] = $release==1?10:0;
            $data['fcreated_time'] = date('Y-m-d H:i:s', time());
            $data['flast_edited_time'] = $data['fcreated_time'];
            if($m->add($data)){
                $this->show('{"result":0,"msg":"adding succeed.","fid":"'.$fid.'"}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"error1.'.$m->getDbError().'"}', 'utf-8');
            }
        }  else {//modify
            $m = M('Course');
            $data['fid'] = $fid;
            $data['fname'] = $fname;
            $data['fteacher'] = $fteacher;
            $data['fgrade'] = $fgrade;
            $data['faddr'] = $faddr;
            $data['fterm'] = $fterm;
            $data['fstate'] = $release==1?10:0;
            $data['flast_edited_time'] = date('Y-m-d H:i:s', time());
            if($m->save($data)){
                $this->show('{"result":0,"msg":"saving succeed.","fid":"'.$fid.'"}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"error2.'.$m->getDbError().'"}', 'utf-8');
            }
        }
    }
    //课程删除
    public function cw_delete($fid=-1,$close=0){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $fid = I('fid');
        $close = I('close');
        if($fid == '' || $close == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $m = M('Course');
        $data['fid'] = $fid;
        $data['fstate'] = $close==1?20:30;//20-关闭，30-被删除
        $data['flast_edited_time'] = date('Y-m-d H:i:s', time());
        if($m->save($data)){
            $this->show('{"result":0,"msg":"deleting succeed.","fid":"'.$fid.'"}', 'utf-8');
        } else {
            $this->show('{"result":1,"msg":"error.'.$m->getDbError().'"}', 'utf-8');
        }
    }
    public function cw_release($fid=-1){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $fid = I('fid');
        if($fid == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $m = M('Course');
        $data['fid'] = $fid;
        $data['fstate'] = 10;//10-已发布
        $data['flast_edited_time'] = date('Y-m-d H:i:s', time());
        if($m->save($data)){
            $this->show('{"result":0,"msg":"succeed.","fid":"'.$fid.'"}', 'utf-8');
        } else {
            $this->show('{"result":1,"msg":"error.'.$m->getDbError().'"}', 'utf-8');
        }
    }
    public function cw_upload($etitle='',$efid=-1){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $etitle = I('etitle');
        $efid = I('efid');
        if($efid == ''){
            $this->show('{"result":1,"msg":"parameter `efid` error"}', 'utf-8');
            return;
        }
        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize = 20*1024*1024;// 设置附件上传大小 20M
        //$upload->exts = null;// 设置附件上传类型
        $upload->rootPath = './Private/uploads'; // 设置附件上传目录    
        $upload->savePath = '/cw/'; // 设置附件上传目录    
        $upload->autoSub = false;//不使用子目录
        $upload->saveName = date('Y_m_d_H_i_s', time()).'_'.mt_rand();
        
        $info = $upload->upload();// 上传文件
        if($info){
            $hint = '';
            foreach ($info as $file) {
                //$hint = ',"etitle":"'.$etitle.'"';
                $hint.= ',"key":"'.$file['key'].'"';
                $hint.= ',"savepath":"'.$file['savepath'].'"';
                $hint.= ',"name":"'.$file['name'].'"';
                $hint.= ',"savename":"'.$file['savename'].'"';
                $hint.= ',"size":"'.$file['size'].'"';
                $hint.= ',"ext":"'.$file['ext'].'"';
                if($etitle == ''){
                    $etitle = $file['name'];
                    $index = strripos($etitle,".");
                    $etitle = substr($etitle,0,$index);
                }
                if($etitle == ''){
                    $this->show('{"result":1,"msg":"parameter `etitle` error"}', 'utf-8');
                    return;
                }
                //插入数据库
                $m = M("Courseware");
                $data['eattr'] = 30;//30-内部课件
                $data['etitle'] = $etitle;
                $data['esummary'] = $file['name'];
                $data['econtent'] = $file['name'];
                $data['escan_count'] = 0;
                $data['edownload_count'] = 0;
                $data['epath'] = $file['savepath'].$file['savename'];
                $data['efid'] = $efid;
                $data['ecreated_time'] = date('Y-m-d H:i:s',time());
                $data['elast_edited_time'] = $data['ecreated_time'];
                $data['estate'] = 20;//20-（直接）审核通过
                $result = $m->add($data);
                if($result == false){
                    $error = $m->getDbError();
                    $error = str_replace('"', '&', $error);
                    $this->show('{"result":1,"msg":"'.$error.'"}', 'utf-8');
                }
                break;
            }
            $this->show('{"result":0,"msg":"succeed."}', 'utf-8');
            return;
        } else {
            $error = $upload->getError();
            $error = str_replace('"', '&', $error);
            $this->show('{"result":1,"msg":"'.$error.'"}', 'utf-8');
            return;
        }
    }
    //课件删除
    public function cw_e_delete($eid=-1){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $eid = I('eid');
        if($eid == '' || $eid == -1){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $m = M('Courseware');
        $data['eid'] = $eid;
        $data['estate'] = 40;//40-已下架
        $data['elast_edited_time'] = date('Y-m-d H:i:s', time());
        if($m->save($data)){
            $this->show('{"result":0,"msg":"deleting succeed.","eid":"'.$eid.'"}', 'utf-8');
        } else {
            $this->show('{"result":1,"msg":"error.'.$m->getDbError().'"}', 'utf-8');
        }
    }
    public function cw_ta_delete($pid=-1){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $pid = I('pid');
        if($pid == -1 || $pid == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $m = M('Teach');
        if($m->delete($pid)){
            $this->show('{"result":0,"msg":"deleting succeed.","pid":"'.$pid.'"}', 'utf-8');
        } else {
            $this->show('{"result":1,"msg":"error.'.$m->getDbError().'"}', 'utf-8');
        }
    }
    public function cw_ta_add($fid=-1,$rid=-1){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $fid = I('fid');
        $rid = I('rid');
        if($fid == '' || $fid == -1 || $rid == '' || $rid == -1){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $m = M('Teach');
        $lim['prid'] = $rid;
        $lim['pfid'] = $fid;
        if($m->where($lim)->find()){
            $this->show('{"result":0,"msg":"succeed."}', 'utf-8');
            return;
        }
        $data['prid'] = $rid;
        $data['pfid'] = $fid;
        $data['pcreated_time'] = date('Y-m-d H:i:s',time());
        $data['plast_edited_time'] = $data['pcreated_time'];
        $data['prole'] = 1;//1-助教
        if($m->add($data)){
            $this->show('{"result":0,"msg":"succeed."}', 'utf-8');
            return;
        } else {
            $this->show('{"result":1,"msg":"'.$m->getDbError().'"}', 'utf-8');
            return;
        }
    }



    public function ta_edit($rid=-1){
        if(session('g_logined')!='logined'){//未登录
            //$this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            $this->display();
            return;
        }
        //session('uchar',80);
        $rid = I('rid');
        $mchar = M('Dic');
        $limchar['dic_type'] = 'uchar';
        if(!is_null(session('uchar'))){
            $limchar['dic_key'] = array('lt',session('uchar'));
        }
        $this->uchar_list = $mchar->where($limchar)->order('dic_key desc')->select();
        if($rid == -1 || $rid == ''){
            $this->rid = -1;
            $this->display();
            return;
        }
        $m = M('TaView');
        $lim['rid'] = $rid;
        $record = $m->where($lim)->find();
        if($record == false){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $this->rid = $rid;
        $this->uname = $record['uname'];
        $this->uchar = $record['uchar'];
        $this->utel = $record['utel'];
        $this->uemail = $record['uemail'];
        $this->uoffice_addr = $record['uoffice_addr'];
        $this->uphoto = $record['uphoto'];

        $this->display();
    }
    public function ta(){
        if(session('g_logined')!='logined'){//未登录
            //$this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            $this->display();
            return;
        }
        session('uid',1);
        $m = M('TaView');
        $lim['uuid'] = session('uid');
        $lim['rstate'] = array('in', '0');//0是正常
        $this->ta_list = $m->where($lim)->select();
        $this->display();
    }

    public function ta_save($rid='',$uname='',$utel='',$uoffice_addr='',$uemail='',$uchar=''){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $rid=I('rid');
        $uname = I('uname');
        $utel = I('utel');
        $uoffice_addr = I('uoffice_addr');
        $uemail = I('uemail');
        $uchar = I('uchar');
        if($uname == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }


        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize = 1024*1024;// 设置附件上传大小 1M
        //$upload->exts = null;// 设置附件上传类型
        $upload->rootPath = './Public/uploads'; // 设置附件上传目录    
        $upload->savePath = '/image/'; // 设置附件上传目录    
        $upload->autoSub = false;//不使用子目录
        $upload->saveName = date('Y_m_d_H_i_s', time()).'_'.mt_rand();
        
        $uphoto = '';
        $info = $upload->upload();// 上传文件
        if($info){
            foreach ($info as $file) {
                $uphoto .= $file['savepath'].$file['savename'];
                break;
            }
        }
        


        $m = M('Register');
        if($rid == '' || $rid == -1){//add
            $data['raccount'] = 'TA'.date('YmdHis',time()).rand(10000,99999);//TODO
            $data['rpassword'] = sha1(md5('000000'));//默认是6个0
            $data['rnickname'] = $uname;
            $data['rrole'] = 35;//
            $data['rstate'] = 0;//0-正常
            $data['rcreated_time'] = date('Y-m-d H:i:s',time());
            $data['rlast_edited_time']  = $data['rcreated_time'];
            $data['rhead_photo'] = '/assets/image/headphoto/default.png';
            $rid = $m->add($data);
            if($rid){
                $data2['urid'] = $rid;
                $data2['uchar'] = $uchar;
                $data2['uno'] = $data['raccount'];
                $data2['uname'] = $uname;
                $data2['udisplay_name'] = $uname;
                $data2['uemail'] = $uemail;
                $data2['uphoto'] = $uphoto;
                $data2['uoffice_addr'] = $uoffice_addr;
                $data2['utel'] = $utel;
                $data2['usender'] = 0;//0-未知
                $data2['uuid'] = session('uid'); if(is_null($data2['uuid']))$data2['uuid'] = 0;
                $data2['uhead_photo'] = '/assets/image/headphoto/default.png';
                $data2['ucreate_post']=0;
                $data2['ucreate_reply']=0;
                $data2['ucreate_msg']=0;
                $data2['ucreate_ex_note']=0;
                $data2['ucreate_ex_trend']=0;
                $data2['ucreate_ex_project']=0;
                $data2['uupload_courseware']=1;
                $data2['udownload_courseware']=1;
                $data2['umanage_student']=0;
                $data2['ulast_edited_time']= $data['rcreated_time'];
                
                $m2 = M('User');
                if($m2->add($data2)){
                    $this->show('{"result":0,"msg":"adding succeed."}', 'utf-8');
                } else{
                    $this->show('{"result":1,"msg":"error1."}', 'utf-8');
                }
            }else{
                $this->show('{"result":1,"msg":"'.htmlspecialchars($m->_sql(),ENT_QUOTES).'"}', 'utf-8');
            }
        } else {

            $m2 = M('User');
            $data2['uid'] = $m2->where('`urid`='.$rid)->find()['uid'];
            $data2['uname'] = $uname;
            $data2['udisplay_name'] = $uname;
            $data2['uemail'] = $uemail;
            $data2['uchar'] = $uchar;
            $data2['ulast_edited_time'] = date('Y-m-d H:i:s',time());
            if($uphoto != ''){
                $data2['uphoto'] = $uphoto;
            }
            $data2['uoffice_addr'] = $uoffice_addr;
            $data2['utel'] = $utel;
            $result = $m2->save($data2);
            if($result){
                $this->show('{"result":0,"msg":"saving succeed.","rid":"'.$rid.'"}', 'utf-8');
            } else{
                $this->show('{"result":1,"msg":"'.$m2->getDbError().'"}', 'utf-8');
            }
        }
    }

    public function stu(){
        if(session('g_logined')!='logined'){//未登录
            //$this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            $this->redirect('/Home/Bbs',0,0,'');
            $this->display();
            return;
        }
        $m = M('RegisterUserView');
        $lim['rstate'] = array('in', '0,10');
        $lim['rrole'] = 40;//
        $this->stu_list = $m->where($lim)->field(true)->select();
        //echo $m->_sql();
        //dump($this->stu_list);
        $this->display();
    }

    public function stu_edit(){
        if(session('g_logined')!='logined'){//未登录
            //$this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            $this->display();
            return;
        }
        $cm = M('College');
        $this->college_list = $cm->select();
        $dicm = M('Dic');
        $limuchar['dic_type'] = 'uchar';
        $this->uchar_list = $dicm->where($limuchar)->order('dic_key desc')->select();
        $rid = I('rid');
        if($rid == '' || $rid == -1){
            $this->rid = -1;
            $this->display();
            return;
        }

        $m = M('UserView');
        $lim['rid'] = $rid;
        $register = $m->where($lim)->find();
        if($register == false){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $this->rid = $register['rid'];
        $this->raccount = $register['raccount'];
        $this->rnickname = $register['rnickname'];
        $this->uname = $register['uname'];
        $this->rcreated_time = $register['rcreated_time'];
        $this->rlast_edited_time = $register['rlast_edited_time'];
        $this->rstate = $register['rstate'];
        $this->rstate_name = $register['rstate_name'];

        $this->uchar = $register['uchar'];

        $this->rstate = $register['rstate'];
        $this->ucreate_post = $register['ucreate_post'];
        $this->ucreate_reply = $register['ucreate_reply'];
        $this->ucreate_msg = $register['ucreate_msg'];
        $this->ucreate_ex_note = $register['ucreate_ex_note'];
        $this->ucreate_ex_trend = $register['ucreate_ex_trend'];
        $this->ucreate_ex_project = $register['ucreate_ex_project'];
        $this->uupload_courseware = $register['uupload_courseware'];
        $this->udownload_courseware = $register['udownload_courseware'];
        $this->display();
    }
    public function stu_save($rid = -1,$ugid=-1,$uchar=-1,$raccount='',$rpassword='',$rnickname='',$ugrade='',$uname='',
        $rstate='',
        $ucreate_post='',
        $ucreate_reply='',
        $ucreate_msg='',
        $ucreate_ex_note='',
        //$ucreate_ex_trend='',
        //$ucreate_ex_project='',
        //$uupload_courseware='',
        $udownload_courseware=''//,$umanage_student=''
        ){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $rid = I('rid');
        $ugid = I('ugid');
        $raccount = I('raccount');
        $rpassword = I('rpassword');
        $rnickname = I('rnickname');
        $uname = I('uname');
        $ugrade = I('ugrade');
        if($ugid == '' || $raccount == '' || $ugrade == '' || $uname == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }

        $m = M('Register');
        $lim['raccount'] = $ugid.$raccount;
        if($m->where($lim)->find()){
            if($m->data()['rid'] != $rid){
                $this->show('{"result":1,"msg":"account(\''.$lim['raccount'].'\') error."}', 'utf-8');return;
            }
        }
        if($rid == -1 || $rid == ''){
            $data['raccount'] = $ugid.$raccount;
            $data['rpassword'] = sha1(md5($rpassword));
            $data['rnickname'] = $rnickname;
            $data['rrole'] = 40;//学生级别
            $data['rstate'] = $rstate=='true'?0:10;//0-正常
            $data['rcreated_time'] = date('Y-m-d H:i:s',time());
            $data['rlast_edited_time']  = $data['rcreated_time'];
            $data['rhead_photo'] = '/assets/image/headphoto/default.png';
            $rid = $m->add($data);
            if($rid){
                $data2['urid'] = $rid;
                $data2['uchar'] = $uchar;
                $data2['uno'] = $raccount;
                $data2['uname'] = $uname;
                $data2['udisplay_name'] = $rnickname;
                $data2['ugrade'] = $ugrade;
                $data2['usender'] = 0;//0-未知
                $data2['uuid'] = session('uid'); if(is_null($data2['uuid']))$data2['uuid'] = 0;
                $data2['uhead_photo'] = '/assets/image/headphoto/default.png';
                $data2['ucreate_post']=$ucreate_post=='true'?1:0;
                $data2['ucreate_reply']=$ucreate_reply=='true'?1:0;
                $data2['ucreate_msg']=$ucreate_msg=='true'?1:0;
                $data2['ucreate_ex_note']=$ucreate_ex_note=='true'?1:0;
                $data2['ucreate_ex_trend']=0;
                $data2['ucreate_ex_project']=0;
                $data2['uupload_courseware']=0;
                $data2['udownload_courseware']=$udownload_courseware=='true'?1:0;
                $data2['umanage_student']=0;
                $data2['ulast_edited_time']=date('Y-m-d H:i:s',time());
                $m2 = M('User');
                if($m2->add($data2)){
                    $this->show('{"result":0,"msg":"adding succeed.","rid":"'.$rid.'"}', 'utf-8');
                } else{
                    $this->show('{"result":1,"msg":"error1.'.$m2->getDbError().'"}', 'utf-8');
                }
            }else{
                $this->show('{"result":1,"msg":"'.$m->getDbError().'"}', 'utf-8');
            }
        } else {
            $data['rid'] = $rid;
            $data['raccount'] = $ugid.$raccount;
            //$data['rpassword'] = sha1(md5($rpassword));
            $data['rnickname'] = $rnickname;
            //$data['rrole'] = 40;//学生级别
            $data['rstate'] = $rstate=='true'?0:10;//0-正常
            //$data['rcreated_time'] = date('Y-m-d H:i:s',time());
            $data['rlast_edited_time']  = date('Y-m-d H:i:s',time());
            $data['rhead_photo'] = '/assets/image/headphoto/default.png';
            if($m->save($data)){
                $data2['urid'] = $rid;
                $data2['uchar'] = $uchar;
                $data2['uno'] = $raccount;
                $data2['uname'] = $uname;
                $data2['udisplay_name'] = $rnickname;
                $data2['ugrade'] = $ugrade;
                //$data2['usender'] = 0;//0-未知
                //$data2['uuid'] = session('uid');
                $data2['uhead_photo'] = '/assets/image/headphoto/default.png';
                $data2['ucreate_post']=$ucreate_post=='true'?1:0;
                $data2['ucreate_reply']=$ucreate_reply=='true'?1:0;
                $data2['ucreate_msg']=$ucreate_msg=='true'?1:0;
                $data2['ucreate_ex_note']=$ucreate_ex_note=='true'?1:0;
                $data2['ucreate_ex_trend']=0;
                $data2['ucreate_ex_project']=0;
                $data2['uupload_courseware']=0;
                $data2['udownload_courseware']=$udownload_courseware=='true'?1:0;
                $data2['umanage_student']=0;
                $data2['ulast_edited_time']=date('Y-m-d H:i:s',time());
                $m2 = M('User');
                $data2['uid'] = $m2->where('`urid`='.$rid)->find()['uid'];
                $result = $m2->save($data2);
                //echo $m2->_sql();
                if($result){
                    $this->show('{"result":0,"msg":"saving succeed.","rid":"'.$rid.'"}', 'utf-8');
                } else{
                    $this->show('{"result":1,"msg":"'.$m2->getDbError().'"}', 'utf-8');
                }
            }else{
                $this->show('{"result":1,"msg":"'.htmlspecialchars($m->getDbError(),ENT_QUOTES).'"}', 'utf-8');
            }
        }
    }

    public function center(){
        if(session('g_logined')!='logined'){//未登录
            //$this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            $this->display();
            return;
        }
        echo session('rid');
        $this->cond_logined = false;
        $event = M('EventView');
        $lim['vrid'] = session('rid');
        $lim['vstate'] = 0;//0-未查看
        $lim['vtype'] = 1;//1-帖子回复
        $this->event_list = $event->where($lim)->order('vcreated_time desc')->select();
        //dump($this->event_list);
        $this->display();
    }

    public function ev_ignore($vid=-1,$vkey=''){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $vid = I('vid');
        $vkey = I('vkey');
        if($vid==''||$vid==-1 || $vkey=''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $m = M('Event');
        $data['vid'] = $vid;
        $data['vkey'] = $vkey;
        $data['vstate'] = 10;//10-已忽略
        if($m->save($data)){
            $this->show('{"result":0,"msg":"adding succeed."}', 'utf-8');
        }else{
            $this->show('{"result":1,"msg":"'.($m->getDbError()).'"}', 'utf-8');
        }
    }

    public function info(){
        $this->display();
    }


    public function ex_note(){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            return;
        }
        $m = M('ExNoteView');
        $lim['zcreator'] = session('rid');
        $lim['zstate'] = array('in','0,10,20,30,40');
        $this->ex_note_list = $m->where($lim)->select();
        $this->display();
    }
    public function ex_note_edit($zid=-1){
        $zid = I('zid');
        if($zid == -1 || $zid == ''){//new
            $this->zid = -1;
            $this->display();
            return;
        }
        $m = M('Z');
        $lim['zid'] = $zid;
        $lim['zcreator'] = session('rid');
        $lim['ztype'] = 5;//5-交流札记
        $rec = $m->where($lim)->find();
        if($rec){
            $this->zid = $zid;
            $this->ztitle = $rec['ztitle'];
            $this->zcontent = $rec['zcontent'];
            $this->display();
        } else {
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
        }
    }

    public function ex_note_save($zid=-1,$ztitle='',$zcontent='',$zsummary='',$zsubmit=''){
        if(session('g_logined')!='logined'){//未登录
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            //$this->display();
            return;
        }
        $zid = I('zid');
        $ztitle = I('ztitle');
        $zcontent = I('zcontent');
        $zsummary = I('zsummary');
        $zsubmit = I('zsubmit');
        if($zsubmit == 1){
            if($zcontent == '' || $ztitle == '' || $zsummary == ''){
                $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
                return;
            }
        }
        $m = M('Z');
        $data['ztitle'] = $ztitle;
        $data['zcontent'] = $zcontent;
        $data['zsummary'] = $zsummary;
        $data['ztype'] = 5;
        $data['zlast_edited_time'] = date('Y-m-d H:i:s',time());
        $data['zstate'] = $zsubmit==1?10:0;
        if($zid == '' || $zid == -1){
            $data['zcreated_time'] = $data['zlast_edited_time'];
            $data['zscan_count'] = 0;
            $data['zcreator'] = session('rid');
            if($m->add($data)){
                $this->show('{"result":0,"msg":"saving succeed.","rid":"'.$rid.'"}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"'.$m->getDbError().'"}', 'utf-8');
            }
        } else {
            $lim['zid'] = $zid;
            $rec = $m->where($lim)->find();
            if($rec){
                if($rec['zcreator'] != session('rid')){
                    $this->show('{"result":1,"msg":"permission error."}', 'utf-8');
                    return;
                }
            } else {
                $this->show('{"result":1,"msg":"permission error."}', 'utf-8');
                return;
            }
            $data['zid'] = $zid;
            if($m->save($data)){
                $this->show('{"result":0,"msg":"saving succeed.","rid":"'.$rid.'"}', 'utf-8');
            } else {
                $this->show('{"result":1,"msg":"'.$m->getDbError().'"}', 'utf-8');
            }
        }
    }
    public function ex_note_del($zid=-1){
        if(session('g_logined')!='logined'){
            $this->show('{"result":1,"msg":"validation error."}', 'utf-8');
            return;
        }
        $zid = I('zid');
        if($zid == -1 || $zid == ''){
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
            return;
        }
        $m = M('Z');
        $lim['ztype'] = 5;//5-
        $lim['zid'] = $zid;
        $rec = $m->where($lim)->find();
        if($rec){
            if($rec['zcreator'] == session('rid') || session('rid') == 1/*system*/){
                $data['zid'] = $zid;
                $data['zstate'] = 60;//deleted
                if($m->save($data)){
                    $this->show('{"result":0,"msg":"deleting succeed."}', 'utf-8');
                } else{
                    $this->show('{"result":1,"msg":"'.($m->getDbError()).'"}', 'utf-8');
                }
            } else {
                $this->show('{"result":1,"msg":"permission error."}', 'utf-8');
            }
        } else {
            $this->show('{"result":1,"msg":"parameters error."}', 'utf-8');
        }
    }

}

?>