<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>后台登录系统</title>
<link href="/css1/default.css" rel="stylesheet" type="text/css" />
<!--必要样式-->
<link href="/css1/styles.css" rel="stylesheet" type="text/css" />
<link href="/css1/demo.css" rel="stylesheet" type="text/css" />
<link href="/css1/loaders.css" rel="stylesheet" type="text/css" />
<link href="/css1/normalize.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class='login'>
		<div class='login_title'>
			<span>管理员登录</span>
		</div>
		<div class='login_fields'>
			<div class='login_fields__user'>
				<div class='icon'>
					<img alt="" src='/img1/user_icon_copy.png'>
				</div>
				<input name="login" placeholder='用户名' maxlength="16" type='text'
					autocomplete="off" value="123456" />
				<div class='validation'>
					<img alt="" src='/img1/tick.png'>
				</div>
			</div>
			<div class='login_fields__password'>
				<div class='icon'>
					<img alt="" src='/img1/lock_icon_copy.png'>
				</div>
				<input name="pwd" placeholder='密码' maxlength="16" type='text'
					autocomplete="off">
				<div class='validation'>
					<img alt="" src='/img1/tick.png'>
				</div>
			</div>
			<div class='login_fields__password'>
				<div class='icon'>
					<img alt="" src='/img1/key.png'>
				</div>
				<input name="code" placeholder='验证码' maxlength="4" type='text'
					name="ValidateNum" autocomplete="off">
				<div class='validation' style="opacity: 1; right: -5px; top: -3px;">
					<canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
				</div>
			</div>
			<div class='login_fields__submit'>
				<input type='button' value='登录'>
			</div>
		</div>
		<div class='success'></div>
		<div class='disclaimer'>
			<p>
				欢迎登录后台管理系统 更多源码：<a href="http://www.mycodes.net/" target="_blank">源码之家</a>
			</p>
		</div>
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

	<link href="/layui1/css/layui.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="/js1/jquery.min.js"></script>
	<script type="text/javascript" src="/js1/jquery-ui.min.js"></script>
	<script type="text/javascript" src='/js1/stopExecutionOnTimeout.js?t=1'></script>
	<script type="text/javascript" src="/layui1/layui.js"></script>
	<script type="text/javascript" src="/js1/Particleground.js"></script>
	<script type="text/javascript" src="/js1/Treatment.js"></script>
	<script type="text/javascript" src="/js1/jquery.mockjax.js"></script>
	<script type="text/javascript">
		var canGetCookie = 0;//是否支持存储Cookie 0 不支持 1 支持
		var ajaxmockjax = 1;//是否启用虚拟Ajax的请求响 0 不启用  1 启用
		//默认账号密码

		var truelogin = "123456";
		var truepwd = "123456";

		var CodeVal = 0;
		Code();
		function Code() {
			if (canGetCookie == 1) {
				createCode("AdminCode");
				var AdminCode = getCookieValue("AdminCode");
				showCheck(AdminCode);
			} else {
				showCheck(createCode(""));
			}
		}
		function showCheck(a) {
			CodeVal = a;
			var c = document.getElementById("myCanvas");
			var ctx = c.getContext("2d");
			ctx.clearRect(0, 0, 1000, 1000);
			ctx.font = "80px 'Hiragino Sans GB'";
			ctx.fillStyle = "#E8DFE8";
			ctx.fillText(a, 0, 100);
		}
		$(document).keypress(function(e) {
			// 回车键事件  
			if (e.which == 13) {
				$('input[type="button"]').click();
			}
		});
		//粒子背景特效
		$('body').particleground({
			dotColor : '#E8DFE8',
			lineColor : '#133b88'
		});
		$('input[name="pwd"]').focus(function() {
			$(this).attr('type', 'password');
		});
		$('input[type="text"]').focus(function() {
			$(this).prev().animate({
				'opacity' : '1'
			}, 200);
		});
		$('input[type="text"],input[type="password"]').blur(function() {
			$(this).prev().animate({
				'opacity' : '.5'
			}, 200);
		});
		$('input[name="login"],input[name="pwd"]').keyup(function() {
			var Len = $(this).val().length;
			if (!$(this).val() == '' && Len >= 5) {
				$(this).next().animate({
					'opacity' : '1',
					'right' : '30'
				}, 200);
			} else {
				$(this).next().animate({
					'opacity' : '0',
					'right' : '20'
				}, 200);
			}
		});
		var open = 0;
		/* layui.use('layer', function() {
			var msgalert = '默认账号:' + truelogin + '<br/> 默认密码:' + truepwd;
			var index = layer.alert(msgalert, {
				icon : 6,
				time : 4000,
				offset : 't',
				closeBtn : 0,
				title : '友情提示',
				btn : [],
				anim : 2,
				shade : 0
			});
			layer.style(index, {
				color : '#777'
			}); */
		//非空验证
		$('input[type="button"]').click(
				function() {
					var username = $('input[name="login"]').val();
					var password = $('input[name="pwd"]').val();
					var code = $('input[name="code"]').val();
					if (username == '') {
						ErroAlert('请输入您的账号');
					} else if (password == '') {
						ErroAlert('请输入密码');
					} else if (code == '' || code.length != 4) {
						ErroAlert('输入验证码');
					} else {
						//认证中..
						fullscreen();
						$('.login').addClass('test'); //倾斜特效
						setTimeout(function() {
							$('.login').addClass('testtwo'); //平移特效
						}, 300);
						setTimeout(function() {
							$('.authent').show().animate({
								right : -320
							}, {
								easing : 'easeOutQuint',
								duration : 600,
								queue : false
							});
							$('.authent').animate({
								opacity : 1
							}, {
								duration : 200,
								queue : false
							}).addClass('visible');
						}, 500);

						var data = {
							"username" : username,
							"password" : password,
							"code" : code
						};

						if (data.username != ''
								&& data.password != ''
								&& data.code.toUpperCase() == CodeVal
										.toUpperCase()) {
							url = "findUserPass.do";
						} else {
							url = "Ajax/LoginFalse";
						}

						/* //登录
						var JsonData = {
							login : login,
							pwd : pwd,
							code : code
						};
						//此处做为ajax内部判断
						var url = "";
						if (JsonData.login == truelogin
								&& JsonData.pwd == truepwd
								&& JsonData.code.toUpperCase() == CodeVal
										.toUpperCase()) {
							url = "findUserPass.do";
						} else {
							url = "Ajax/LoginFalse";
						} */

						AjaxPost(url, data, function() {
							//ajax加载中
						}, function(user) {
							alert(user.username + ";" + user.password);
							//ajax返回 
							//认证完成
							setTimeout(function() {
								$('.authent').show().animate({
									right : 90
								}, {
									easing : 'easeOutQuint',
									duration : 600,
									queue : false
								});
								$('.authent').animate({
									opacity : 0
								}, {
									duration : 200,
									queue : false
								}).addClass('visible');
								$('.login').removeClass('testtwo'); //平移特效
							}, 2000);
							setTimeout(function() {
								$('.authent').hide();
								$('.login').removeClass('test');
								if (data.username == user.username
										&& data.password == user.password
										&& data.code.toUpperCase() == CodeVal
												.toUpperCase()) {
									//登录成功
									$('.login div').fadeOut(100);
									$('.success').fadeIn(1000);
									$('.success').html("登陆成功");
									//跳转操作

								} else {
									AjaxErro("失败");
								}
							}, 2400);
						})
					}
				})

		var fullscreen = function() {
			elem = document.body;
			if (elem.webkitRequestFullScreen) {
				elem.webkitRequestFullScreen();
			} else if (elem.mozRequestFullScreen) {
				elem.mozRequestFullScreen();
			} else if (elem.requestFullScreen) {
				elem.requestFullscreen();
			} else {
				//浏览器不支持全屏API或已被禁用  
			}
		}
		if (ajaxmockjax == 1) {
			$.mockjax({
				url : 'Ajax/Login',
				status : 200,
				responseTime : 50,
				responseText : {
					"Status" : "ok",
					"Text" : "登录成功<br /><br />欢迎回来"
				}
			});
			$.mockjax({
				url : 'Ajax/LoginFalse',
				status : 200,
				responseTime : 50,
				responseText : {
					"Status" : "Erro",
					"Erro" : "账号名或密码或验证码有误"
				}
			});
		}
	</script>
</body>
</html>