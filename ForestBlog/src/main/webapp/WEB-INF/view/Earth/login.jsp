<%@ page language="java" contentType="text/html;" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- 登陆央视 -->
<link href="/css/css/earth/default.css" rel="stylesheet" type="text/css" />
<!--必要样式-->
<link href="/css/css/earth/styles.css" rel="stylesheet" type="text/css" />
<link href="/css/css/earth/demo.css" rel="stylesheet" type="text/css" />
<link href="/css/css/earth/loaders.css" rel="stylesheet" type="text/css" />
<link href="/css/animate.min.css" rel="stylesheet" type="text/css" />
<title>登陆/注册</title>
</head>
<body>
	<div class='login' id="login">
		<div class='login_title' style="margin-top: -30px;">
			<span>用户登录</span>
		</div>
		<div class='login_fields'>
			<div class='login_fields__user'>
				<div class='icon'>
					<img alt="" src='/img/images/index/img/user_icon_copy.png'>
				</div>
				<input name="login" placeholder='用户名' maxlength="16" type='text'
					autocomplete="off" value="" />
				<div class='validation'>
					<img alt="" src='/img/images/index/img/tick.png'>
				</div>
			</div>
			<div class='login_fields__password'>
				<div class='icon'>
					<img alt="" src='/img/images/index/img/lock_icon_copy.png'>
				</div>
				<input name="pwd" placeholder='密码' maxlength="16" type='text'
					autocomplete="off">
				<div class='validation'>
					<img alt="" src='/img/images/index/img/tick.png'>
				</div>
			</div>
			<div class='login_fields__password'>
				<div class='icon'>
					<img alt="" src='/img/images/index/img/key.png'>
				</div>
				<input name="code" placeholder='验证码' maxlength="4" type='text'
					name="ValidateNum" autocomplete="off">
				<div class='validation' style="opacity: 1; right: 38px; top: -3px;">
					<canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
				</div>
			</div>
			<div class='login_fields__submit'>
				<input type='button' value='登录'>
			</div>
			<div class='o_register'>
				<span>注册</span>
			</div>
		</div>
		<div class="login_untils">
			<img alt="" src="/img/images/index/img/qq.png">
			<img alt="" src="/img/images/index/img/github.png">
			<img alt="" src="/img/images/index/img/sina.png">
		</div>
		<div class='success'></div>
		<div class='disclaimer'>
			<p>
				<span class="forget">忘记密码?</span>
			</p>
		</div>
	</div>
	<div class='login register' id='register'>
		<div class='login_title' style="text-align: center;">
			<span>用户注册</span>
		</div>
		<form action="" method="POST">
			<div class="inputbox">
				<span>用户名 <i class="sign">6-20位字符</i></span>
				<input id='zcname' name="zcname" placeholder="请输入用户名" autocomplete="off" type="text">
			</div>
			<div class="inputbox">
				<span>密码 <i class="sign">6-20位字符</i></span>
				<input class="pass" name="zcpassword" placeholder="请输入密码" autocomplete="off" type="password">
			</div>
			<div class="inputbox">
				<span>密码 <i class="sign">验证密码</i></span>
				<input name="zcpasswordrp" placeholder="请输再次输入密码" autocomplete="off" type="password">
			</div>
			<div class="zhuce">注册</div>
		</form>
		
	</div>
	<div class='authent'>
		<div class="loader"
			style="height: 44px; width: 44px; margin-left: 28px;">
			<div class="loader-inner ball-clip-rotate-multiple">
				<div></div>
				<div></div>
				<div></div>
			</div>
		</div>
		<p>认证中...</p>
	</div>
	<div class="OverWindows"></div>
	<script src="/js/common/jquery-1.8.3.min.js"></script>
	<script src="/js/common/jquery-ui.min.js"></script>
	<link href="/js/common/layui/css/layui.css" rel="stylesheet"
		type="text/css" />

	<script type="text/javascript"
		src='/js/js/index/stopExecutionOnTimeout.js?t=1'></script>
	<script type="text/javascript" src="/js/common/layui/layui.js"></script>
	<script type="text/javascript" src="/js/js/index/Particleground.js"></script>
	<script type="text/javascript" src="/js/js/index/Treatment.js"></script>
	<!-- <script src="/js/js/index/dl.js"></script> -->
	<script type="text/javascript" src="/js/js/index/jquery.mockjax.js"></script>
	<script type="text/javascript" src="/js/js/index/login.js"></script> 
	<script type="text/javascript" src="/js/js/index/register.js"></script> 

</body>
</html>