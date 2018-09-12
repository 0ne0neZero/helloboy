var canGetCookie = 0;//是否支持存储Cookie 0 不支持 1 支持
//粒子背景特效
$('body').particleground({
	dotColor: '#E8DFE8',
	lineColor: '#133b88'
});
//输入框特效//为何attr无效果,版本问题
$('input[name="pwd"]').focus(function () {
	console.log(123);
	$(this).prop('type', 'password');
});
$('input[type="text"]').focus(function () {
	$(this).prev().animate({ 'opacity': '1' }, 200);
});
$('input[type="text"],input[type="password"]').blur(function () {
	$(this).prev().animate({ 'opacity': '.5' }, 200);
});
//验证码
function showCheck(a) {
	CodeVal = a;
	var c = document.getElementById("myCanvas");
	var ctx = c.getContext("2d");
	ctx.clearRect(0, 0, 1000, 1000);
	ctx.font = "80px 'Hiragino Sans GB'";
	ctx.fillStyle = "#E8DFE8";
	ctx.fillText(a, 0, 100);
}
Code();
function Code() {
	if(canGetCookie == 1){
		createCode("AdminCode");
		var AdminCode = getCookieValue("AdminCode");
		showCheck(AdminCode);
	}else{
		showCheck(createCode(""));
	}
}

//
$('input[name="login"],input[name="pwd"]').keyup(function () {
	var Len = $(this).val().length;
	if (!$(this).val() == '' && Len >= 5) {
		$(this).next().animate({
			'opacity': '1',
			'right': '30'
		}, 200);
	} else {
		$(this).next().animate({
			'opacity': '0',
			'right': '20'
		}, 200);
	}
});

//认证中...
function  rzz() {
	$('.login').addClass('test'); //倾斜特效
	setTimeout(function () {
		$('.login').addClass('testtwo'); //平移特效
	}, 300);
	setTimeout(function () {
		$('.authent').show().animate({ right: -320 }, {
			easing: 'easeOutQuint',
			duration: 600,
			queue: false
		});
		$('.authent').animate({ opacity: 1 }, {
			duration: 200,
			queue: false
		}).addClass('visible');
	}, 500);
}
$(".login_fields__submit").click(rzz);