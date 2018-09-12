<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/css/earth/common.css">
<link rel="stylesheet" href="/css/css/earth/index.css">

<title>20180519</title>
</head>
<body>
	<!-- 左上角的面包屑 -->
	<div class="navbar" id="navbar">
		<img src="/img/images/index/nav.png" width="38">
	</div>

	<!-- 左侧的导航 -->
	<div class="leftnav" id="leftnav">
		<div class="navclose" id="navclose">
			<img src="/img/images/index/close.png" width="38">
		</div>
		<div class="navlist">
			<!-- robot -->
			<img class="robot" src="/img/images/index/robat.png" height="662"
				width="289">
			<!-- 此处以后添加导航列表 -->
		</div>
	</div>
	<!-- 流星 -->
	<img class="star1" src="/img/images/index/star.png">
	<img class="star2" src="/img/images/index/star.png">
	<img class="star3" src="/img/images/index/star.png">
	<!-- star ball -->
	<div class="ballbox">
		<!-- 大地球 -->
		<div class="iframebox">
			<iframe id="iframe" src="static.jsp" width="100%" height="100%"
				scrolling="no" frameborder="0"></iframe>
		</div>
		<!-- 自我介绍 -->
		<div id="zwjs" class="zwjs">
			<p style="text-align: center;">博客</p>
			<img src="/img/images/index/persional.png" height="69" width="67"
				alt="">
		</div>
		<!-- crawler -->
		<div id="crawler" class="crawler">
			<p style="text-align: center;">书架</p>
			<img src="/img/images/index/crawler.png" height="69" width="67"
				alt="">
		</div>
		<!-- trip -->
		<div id="nuomi" class="trip">
			<p style="text-align: center;">
				糯米<br>实时票房
			</p>
			<img src="/img/images/index/mytrip.png" height="69" width="67" alt="">
		</div>
	</div>
	<!-- 登陆弹出框 -->
	<div style="color: #fff;font-size: 16px;position: absolute;top: 20px;right: 70px;font-weight: blod;cursor: pointer;"><a href="/dl" style="color: #fff;">登陆</a></div>
	<div style="color: #fff;font-size: 16px;position: absolute;top: 20px;right: 20px;font-weight: blod;cursor: pointer;">注册</div>
	<script src="/js/common/jquery-1.8.3.min.js"></script>
	<script src="/js/js/index/index.js"></script>
	
	<script>
    	var crawler = document.getElementById("crawler");
    	crawler.onclick = function() {
    		window.location.href="/book";
    	}
    	
		var zwjs = document.getElementById("zwjs");
		zwjs.onclick = function() {
    		window.location.href="/blog";
    	}
		
		var nuomi = document.getElementById("nuomi");
		nuomi.onclick = function() {
    		window.location.href="/nuomi";
    	}
    </script>
</body>
</html>