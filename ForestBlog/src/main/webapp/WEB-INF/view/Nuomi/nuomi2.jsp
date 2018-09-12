<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/css/css/nuomi/nuomi.css">
<!-- <link rel="stylesheet" href="css/nuomi/media.css"> -->
<link rel="stylesheet" href="/css/css/nuomi/txtstyle.css">
<link rel="stylesheet" href="/css/css/nuomi/globle.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>百度糯米电影统计</title>
</head>
<body>
	<!-- title -->
	<div class="title">
		<x-sign>糯米电影票房数据实时统计</x-sign>
	</div>
	<!-- 左侧box -->
	<div class="leftBox border">
		<div class="leftFirst">
			<h3 class="smtitle">
				<x-sign>今日大盘</x-sign>
			</h3>
			<div id="headerTotal" class="header"></div>
		</div>
		<div class="leftSecond">
			<h3 class="smtitle">
				<x-sign>影片TOP12明细</x-sign>
			</h3>
			<table id="table" class="table">
				<tr>
					<td class="td" width="38">排名</td>
					<td width="80">影片</td>
					<td width="60">上映天数</td>
					<td width="60">累计票房</td>
					<td width="60">实时票房</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 中间box -->
	<div class="centerBox border">
		<div class="centerFirst">
			 <div class="knum">
			 	<p>截止目前票房预测--<span>万元</span></p>
			 	<div id="dataNums"> </div>
    		    <div id="dataNums2"> </div>
			 </div>
			 <div id="map" class="map"></div>
		</div>
		<div id="time" class="centerTime"></div>
	</div>

	<!-- 右侧box -->
	<div class="rightBox border">
		<div class="rightFirst">
			<h3 class="smtitle">
				<x-sign>TOP20实时票房</x-sign>
			</h3>
			<div id="movieRealDay" class="movieRealDay"></div>
		</div>
		<div class="rightFirst" style="margin-top: 5%;">
			<h3 class="smtitle">
				<x-sign>TOP6票房占比</x-sign>
			</h3>
			<div id="ticketPersent" class="ticketPersent"></div>
		</div>
		<div class="rightFirst" style="margin-top: 5%;">
			<h3 class="smtitle">
				<x-sign>TOP20平均售价</x-sign>
			</h3>
			<div id="avgPrice" class="avgprice"></div>
		</div>
	</div>
	<script src="/js/common/jquery-1.8.3.min.js"></script>
	<script src="/js/js/nuomi/txt.js"></script>
	<script src="/js/js/nuomi/getTime.js"></script>	
	<script src="/js/common/echarts.min.js"></script>
	<script src="/js/common/echarts-gl.min.js"></script>
	<script src="/js/js/nuomi/num.js"></script>
	<script src="/js/js/nuomi/nuomi.js"></script>
	<script src="/js/js/nuomi/headereCharts.js"></script>
	<script src="/js/js/nuomi/movieRealDay.js"></script>
	<script src="/js/js/nuomi/ticketPersent.js"></script>
	<script src="/js/js/nuomi/top12.js"></script>
	<script src="/js/js/nuomi/avgPrice.js"></script>
	<script src="/js/js/nuomi/map.js"></script>
	
	
	
</body>
</html>