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
        //$this->show('{"result":0,"msg":"succeed","data":{"mode":"系统管理员","rnickname":"'.session('rnickname').'"}}');
        //return;
        if(session('g_logined') == 'logined'){
            $modestr = '';
            if(session('rrole') == 0){
                $modestr = '系统';
            } else if(session('rrole') == 10){
                $modestr = '超级管理员';
            } else if(session('rrole') == 20){
                $modestr = '普通管理员';
            }
            $this->show('{"result":0,"msg":"succeed","data":{"mode":"'.$modestr.'","rnickname":"'.session('rnickname').'"}}');
        } else {
            $this->show('{"result":0,"msg":"validation error.","data":{"mode":null,"rnickname":null}}');
        }
    }

    public function mphynews(){
        $m = M('NewsView');
        $lim['ztype'] = 0;//资讯
        $this->news_list = $m->where($lim)->field('zsummary,zcontent',true)->order('zreleased_time')->limit(4)->select();
        $this->display();
    }

    public function mrecmdcourse(){
        $m = M('Courseware');
        $lim['eattr'] = 0;
        $lim['estate'] = array('in','20,0');//审核通过/发布中
        $this->netcourse_list = $m->where($lim)->field('esummary,econtent',true)->select();
        $this->display();
    }

    public function mhotpost(){
        $this->post_list = array();
        if(session('g_logined')!='logined'){
            $this->result = 1;
            $this->msg = "请先登录！";
            $this->display();
            return;
        }
        $this->result = 0;
        $this->msg = "succeed";
        $m = M('PostListView');
        $lim['tstate'] = array('eq', '20');//20-置顶
        $list1 = $m->where($lim)->field('tsummary,tcontent',true)->order('tlast_edited_time desc')->limit(4)->select();
        if($list1){
            $this->post_list = $list1;
        }
        $c = count($this->post_list);
        if($c < 4){
            $lim['tstate'] = array('eq', '10');//10-发布
            $list2 = $m->where($lim)->order('tscan_count desc,tlast_edited_time desc')->limit(4-$c)->select();
            if($list2){
                $this->post_list = array_merge($this->post_list,$list2);
            }
            //dump($list2);
        }
        //echo 'asdfas';return;
        //dump($this->post_list);
        $this->display();
    }

    public function logoff(){
        session(null);
        $this->show('{"result":"0","msg":"succeed'.__CONTROLLER__.'."}','utf-8');
        return;
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
    	$resultset = $m->where($cond)->field('rid,rpassword,rrole,rstate,rshielded_time')->find();
    	if($resultset == false){
            $this->show('{"result":2,"msg":"用户不存在！"}'.$raccount,'utf-8');
            return;
    	}
        $rpassword = sha1(md5($rpassword));
        if($rpassword != $resultset['rpassword']){//123456->10470c3b4b1fed12c3baac014be15fac67c6e815
            $this->show('{"result":3,"msg":"密码错误！"}','utf-8');
            return;
        }
        if($resultset['rstate'] == 10){//10-登录受限
            $this->show('{"result":4,"msg":"登录受限！"}','utf-8');
            return;
        }
        if($resultset['rstate'] == 20){//20-已删除
            $this->show('{"result":5,"msg":"状态异常！"}','utf-8');
            return;
        }
        $this->show('{"result":"0","msg":"succeed."}','utf-8');

        $mlogin = M('Login');
        $datalogin['lgrid'] = $resultset['rid'];
        $datalogin['lgtime'] = date('Y-m-d H:i:s',time());
        $datalogin['lgip'] = get_client_ip();
        $datalogin['lgbrowser'] = $this->determine_browser($_SERVER['HTTP_USER_AGENT']);
        $datalogin['lgos'] = $this->determine_platform($_SERVER['HTTP_USER_AGENT']);
        $datalogin['lgresult'] = 0;//succeed
        $mlogin->add($datalogin);

    	//以下设置session
        session('g_logined', 'logined');
        session('rrole', $resultset['rrole']);
        session('rid',$resultset['rid']);
        //echo $resultset['rid'];
        if($resultset['rrole'] < 25){//小于25为管理员
        	$mv = M('RegisterManagerView');
        	$resultset = $mv->where($cond)->field(true)->find();
            
            session('raccount',$resultset['raccount']);
            session('rnickname',$resultset['rnickname']);
        	session('rhead_photo', $resultset['rhead_photo']);
            session('rstate', $resultset['rstate']);
            session('rshield_role', $resultset['rshield_role']);
            session('rshielded_time', $resultset['rshielded_time']);

            session('pcreate_teacher', $resultset['mpcreate_teacher']);
            session('pcreate_news', $resultset['mpcreate_news']);
            session('pcreate_act', $resultset['pcreate_act']);
            session('pcreate_plan_project', $resultset['mpcreate_plan_project']);
            session('pedit_league_college', $resultset['mpedit_league_college']);
            session('pcreate_notice', $resultset['mpcreate_notice']);
            session('pcheck_ex_note', $resultset['mpcheck_ex_note']);
            session('pcreate_ex_trend', $resultset['mpcreate_ex_trend']);
            session('pcreate_ex_project', $resultset['mpcreate_ex_project']);
            session('pcheck_courseware', $resultset['mpcheck_courseware']);
            session('pcreate_topic', $resultset['mpcreate_topic']);
            session('pcreate_post', $resultset['mpcreate_post']);
            session('pcreate_reply', $resultset['mpcreate_reply']);
            session('pcreate_msg', $resultset['mpcreate_msg']);
            session('pmanager_user', $resultset['mpmanager_user']);
            session('pmanager_bbs', $resultset['mpmanager_bbs']);

            session('pdownload_courseware', '1');
        } else {
            $uv = M('RegisterUserView');
            $resultset = $uv->where($cond)->field(true)->find();
            //session('rid',$resultset['rid']);
            session('raccount',$resultset['raccount']);
            session('rnickname',$resultset['rnickname']);
            session('rhead_photo', $resultset['rhead_photo']);
            session('rstate', $resultset['rstate']);
            session('rshield_role', $resultset['rshield_role']);
            session('rshielded_time', $resultset['rshielded_time']);

            session('pcreate_post', $resultset['ucreate_post']);
            session('pcreate_reply', $resultset['ucreate_reply']);
            session('pcreate_msg', $resultset['ucreate_msg']);
            session('pcreate_ex_note', $resultset['ucreate_ex_note']);
            session('pcreate_ex_trend', $resultset['ucreate_ex_trend']);
            session('pcreate_ex_project', $resultset['ucreate_ex_project']);
            session('pupload_courseware', $resultset['uupload_courseware']);
            session('pmanage_student', $resultset['umanage_student']);
            session('pdownload_courseware', $resultset['udownload_courseware']);

            session('uname',$resultset['uname']);
            session('usender',$resultset['usender']);
            session('uno',$resultset['uno']);
            session('ugrade',$resultset['ugrade']);
            session('ucollege_name','南京大学');
            session('uoffice_addr',$resultset['uoffice_addr']);
        }
        //dump($resultset);
    }

    //private 
    private function determine_browser ($agent) {
        $browseragent="Unknown";   //浏览器
        $browserversion=""; //浏览器的版本
        if(ereg('MSIE ([0-9].[0-9]{1,2})',$agent,$version)) {
            $browserversion=$version[1];
            $browseragent="Internet Explorer";
        } else if (ereg( 'Opera/([0-9]{1,2}.[0-9]{1,2})',$agent,$version)) {
            $browserversion=$version[1];
            $browseragent="Opera";
        } else if (ereg( 'Firefox/([0-9.]{1,5})',$agent,$version)) {
            $browserversion=$version[1];
            $browseragent="Firefox";
        } else if (ereg( 'Chrome/([0-9.]{1,3})',$agent,$version)) {
            $browserversion=$version[1];
            $browseragent="Chrome";
        } else if (ereg( 'Safari/([0-9.]{1,3})',$agent,$version)) {
            $browseragent="Safari";
            $browserversion="";
        }
        return $browseragent." ".$browserversion;
    }
    private function determine_platform ($Agent) {
        $browserplatform = "Unknown";
        if (eregi('win',$Agent) && strpos($Agent, '95')) {
            $browserplatform="Windows 95";
        } else if (eregi('win 9x',$Agent) && strpos($Agent, '4.90')) {
            $browserplatform="Windows ME";
        } elseif (eregi('win',$Agent) && ereg('98',$Agent)) {
            $browserplatform="Windows 98";
        } elseif (eregi('win',$Agent) && eregi('nt 5.0',$Agent)) {
            $browserplatform="Windows 2000";
        } elseif (eregi('win',$Agent) && eregi('nt 5.1',$Agent)) {
            $browserplatform="Windows XP";
        } elseif (eregi('win',$Agent) && eregi('nt 6.0',$Agent)) {
            $browserplatform="Windows Vista";
        } elseif (eregi('win',$Agent) && eregi('nt 6.1',$Agent)) {
            $browserplatform="Windows 7";
        } elseif (eregi('win',$Agent) && ereg('32',$Agent)) {
            $browserplatform="Windows 32";
        } elseif (eregi('win',$Agent) && eregi('nt',$Agent)) {
            $browserplatform="Windows NT";
        } elseif (eregi('Mac OS',$Agent)) {
            $browserplatform="Mac OS";
        } elseif (eregi('linux',$Agent)) {
            $browserplatform="Linux";
        } elseif (eregi('unix',$Agent)) {
            $browserplatform="Unix";
        } elseif (eregi('sun',$Agent) && eregi('os',$Agent)) {
            $browserplatform="SunOS";
        } elseif (eregi('ibm',$Agent) && eregi('os',$Agent)) {
            $browserplatform="IBM OS/2";
        } elseif (eregi('Mac',$Agent) && eregi('PC',$Agent)) {
            $browserplatform="Macintosh";
        } elseif (eregi('PowerPC',$Agent)) {
            $browserplatform="PowerPC";
        } elseif (eregi('AIX',$Agent)) {
            $browserplatform="AIX";
        } elseif (eregi('HPUX',$Agent)) {
            $browserplatform="HPUX";
        } elseif (eregi('NetBSD',$Agent)) {
            $browserplatform="NetBSD";
        } elseif (eregi('BSD',$Agent)) {
            $browserplatform="BSD";
        } elseif (ereg('OSF1',$Agent)) {
            $browserplatform="OSF1";
        } elseif (ereg('IRIX',$Agent)) {
            $browserplatform="IRIX";
        } elseif (eregi('FreeBSD',$Agent)) {
            $browserplatform="FreeBSD";
        }
        return $browserplatform;
    }

}

?>