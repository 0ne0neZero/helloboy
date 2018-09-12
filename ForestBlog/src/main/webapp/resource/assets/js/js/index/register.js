$(function(){
	$(".register").css("display","none");
	//注册
	$(".o_register").click(function(){
		console.log("注册");
		$("#login").addClass("animated rollOut");
		setTimeout(showRegister,500);
	});
	
	function showRegister() {
		$("#register").css("display","block")
			.addClass("animated rollIn");
		$("#zcname").attr("yz",false);
	}
	//失去焦点时验证当前选项
	$(".inputbox input").focus(function(){
		$(this).attr("placeholder","");
		$(this).blur(function(){
			if($(this).val()!=""){
				//console.log("执行了几次");
				reg(this);
			}else {
				if($(this).attr("name")=="zcname"){
					
					$(this).attr("placeholder","请输入姓名").parent()
					.find(".sign").html("6-20位字符").css("color","green");
					
				}else if($(this).attr("name")=="zcpassword"){
					
					$(this).attr("placeholder","请输入密码").parent()
					.find(".sign").html("6-20位字符").css("color","green");
					
				}else if($(this).attr("name")=="zcpasswordrp"){
					
					$(this).attr("placeholder","请再次输入密码").parent()
					.find(".sign").html("再次输入").css("color","green");
					
				}
			}
		});
	});
	//失去焦点时验证当前选项//验证格式以后有需要的话再改
	function reg(ele) {
		if($(ele).attr("name")=="zcname"){
			
			if($(ele).val().trim().length < 6 || $(ele).val().trim().length > 20) {
				$(ele).parent().find(".sign").html("用户名格式错误!").css("color","red");
				$(ele).attr("yz",false);
			}else {
				addStatus(ele);
				
				
			}
		}else if($(ele).attr("name")=="zcpassword"){
			if($(ele).val().trim().length < 6 || $(ele).val().trim().length > 20) {
				$(ele).parent().find(".sign").html("密码名格式错误!").css("color","red");
				$(ele).attr("yz",false);
			}else {
				addStatus(ele);
				
			}
		}else if($(ele).attr("name")=="zcpasswordrp"){
			if($(ele).val().trim() != $(".pass").val().trim()) {
				$(ele).parent().find(".sign").html("密码不一致!").css("color","red");
				$(ele).attr("yz",false);
			}else {
			
				addStatus(ele);
			}
		}
		
	}
	function addStatus(ele) {
		$(ele).parent().find(".sign").html("<img src='/img/images/index/img/yes.png'>");
		$(ele).attr("yz",true);
	}
	function registerSubmit(e){
		//如果input状态不为true的话,禁止提交
		console.log(typeof($("input[name='zcname']").attr("yz")));
		console.log(typeof($("input[name='zcpassword']").attr("yz")));
		console.log(typeof($("input[name='zcpasswordrp']").attr("yz")));
		if( $("input[name='zcname']").attr("yz")=="true" 
			&& $("input[name='zcpassword']").attr("yz")=="true" 
				&& $("input[name='zcpasswordrp']").attr("yz")=="true") {
			console.log("可以提交");
			var param = {
					userName : $("#zcname").val(),
					password : $(".pass").val()
			}
			//ajax...
			$.ajax({
				type: 'POST',
				url: '/zcregister',
				contentType: 'application/json',
				data: JSON.stringify(param),
				success: function result(data){
					console.log(data);
					if(data.message == "注册成功!") {
						setTimeout(function() {
							
							$("#register").removeClass("rollIn").addClass("fadeOutLeftBig");
							
							$("input[name='zcname']").val("").attr("placeholder","请输入姓名").parent()
								.find(".sign").html("6-20位字符")
								.css("color","green");
								console.log($("input[name='zcname']").attr("yz")+"asdfasd");
							$("input[name='zcpassword']").val("").attr("placeholder","请输入密码").parent()
								.find(".sign").html("6-20位字符")
								.css("color","green");
								
							$("input[name='zcpasswordrp']").val("").attr("placeholder","请再次输入密码").parent()
								.find(".sign").html("再次输入")
								.css("color","green");
							
							$("#login").removeClass("rollOut").addClass("fadeInLeftBig");
						},200);
					}else {
						//提示用户注册失败,重试
					}
				}
			});
			
		}else {
			alert("输入有误!重新输入");
			e.preventDefault();
		}
		
		//如果用户名或者密码格式错误
		
		//else提交
	}
	$(".zhuce").click(registerSubmit);
	//失去焦点时的ajax
	function nameblur() {
		if($('#zcname').val().trim().length < 6 || $('#zcname').val().trim().length > 20) {
			return;
		}
		console.log("重写的ajax执行了几次");
		var zcname = $("#zcname").val();
		console.log("执行ajax之前获取的姓名:"+zcname);
		//添加ajax验证
		$.ajax({
			type: 'GET',
			url: '/findUserNameByName/'+zcname,
			success: function result(data){
				console.log(data);
				if(data.message == '用户名已存在') {
					$("#zcname").parent().find(".sign").html("用户名已存在!").css("color","red");
					$("#zcname").attr("yz",false);
				}
			}
		});
	}
	$('#zcname').blur(nameblur);
	
})