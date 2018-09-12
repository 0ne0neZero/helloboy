<%@ page language="java" contentType="text/html;"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="/css/css/bookshelf/bookshelf.css">
	<link rel="stylesheet" href="/js/common/swiper.min.css">
	<title>我的书架</title>
</head>
<style>
	.bookshelf {
		background: url(/img/images/bookshelf/groundback.png);
		background-size: 100% 100%;
		background-repeat: no-repeat;
		position: relative;
    	top: 4%;
	}
	.swiper-container {
		width: 70%;
	    height: 50%;
	    margin-top: 29%;
	}
	.imgg {
		width: 40%;
		display: inline-block;
		vertical-align: top;
	}
	.textt {
		display: inline-block;
		vertical-align: top;
		text-align: center;
		color: #fff;
		line-height: 2;
		margin-left: 1%;
		width: 59%;
		
	}
</style>
<body>
	<div class="container">
		<div class="bookshelf">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					
				</div>
			</div>
			
		</div>
		<div class="windows-box">
		<div class="windows">
			<div class="stars">
				<!-- 待开发 -->
			</div>
			<div class="moon"></div>
			<div class="cloud" id="cloud"></div>
			<div class="windowBox"></div>
		</div>
		</div>
		<div class="sofa">
			<img class="robat" src="/img/images/bookshelf/robat.gif" alt="">
		</div>
	</div>
	<script src="/js/common/swiper.min.js"></script>
	<script src="/js/common/jquery-1.8.3.min.js"></script>
	<script src="/js/js/bookshelf/bookshelf.js"></script>
</body>
</html>