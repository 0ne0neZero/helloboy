<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid"%>
<rapid:override name="title">
    - 书籍列表
</rapid:override>
<rapid:override name="header-style">
	<style>
/*覆盖 layui*/
.layui-input {
	display: inline-block;
	width: 70% !important;
}

.layui-input-block {
	margin: 0px 10px;
}

layui-tab-item {
	position: relative;
}

.zzc {
	width: 60%;
	height: 50%;
	border: 1px solid #ddd;
	box-shadow: 0 0 30px 4px #000;
	border-radius: 10px;
	background: #fff;
	z-index: 10;
	position: absolute;
	top: 31%;
	left: 20%;
	display: none;
}
</style>
</rapid:override>

<rapid:override name="content">
	<blockquote class="layui-elem-quote">
		<span class="layui-breadcrumb" lay-separator="/"> <a
			href="/admin">首页</a> <a><cite>书籍列表</cite></a>
		</span>
	</blockquote>

	<div class="layui-tab layui-tab-card">
		<ul class="layui-tab-title">
			<li class="layui-this">已发布(${books.totalCount})</li>
			<!-- <li>草稿()</li> -->
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
				<input type="hidden" id="hiddenInput">
				<div id="zzc" class="zzc">
					<div class="layui-form-item" style="padding-top: 7%;">
						<label class="layui-form-label">书名</label>
						<div class="layui-input-block">
							<input type="text" name="bookName" required lay-verify="required"
								placeholder="请输入书名" autocomplete="off" class="layui-input">
						</div>
						<br> <label class="layui-form-label">作者</label>
						<div class="layui-input-block">
							<input type="text" name="bookAuthor" required
								lay-verify="required" placeholder="请输入作者" autocomplete="off"
								class="layui-input">
						</div>
						<div class="layui-form-item">
							<input type="hidden" id="userId" value="0"> <label
								class="layui-form-label">书籍图片</label>
							<div class="layui-input-inline" style="width: 320px;">
								<div class="layui-upload">
									<div class="layui-upload-list" style="display: inline-block;">
										<img class="layui-upload-img" src="" id="demo1" width="100"
											height="100">
										<p id="demoText"></p>
									</div>
									<button type="button" class="layui-btn" id="test1" style="display: inline-block;margin-left: 13% !important">上传图片</button>
								</div>
							</div>
							<input type="hidden" name="userAvatar" id="userAvatar" value="">
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block"
								style="margin-top: 4%; text-align: center;">
								<button id="qx" class="layui-btn" lay-submit
									lay-filter="formDemo">取消</button>
								<button id="bc" style="margin-left: 8% !important"
									class="layui-btn" onclick="save()">保存</button>
							</div>
						</div>
					</div>
				</div>
				<form id="bookForm" method="post">
					<div class="layui-form-item">
						<div class="layui-input-block">
							<input type="text" name="query" placeholder="请输入关键词"
								autocomplete="off" class="layui-input">
							<button class="layui-btn" lay-filter="formDemo"
								onclick="queryBook()">搜索</button>
<!-- 								onclick="queryBook()">搜索</button> -->
							<button class="layui-btn" lay-filter="formDemo"
								style="float: right;" onclick="confirmDeleteBookBatch()">批量删除
							</button>
						</div>
					</div>
					<input type="hidden" name="currentUrl" id="currentUrl" value="">
					<table class="layui-table">
						<colgroup>
							<col width="50">
							<col width="50">
							<col width="300">
							<col width="200">
							<col width="200">
							<col width="50">
							<col width="150">
							<col width="100">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" id="allSelect"
									onclick="javascript:DoCheck()"></th>
								<th>id</th>
								<th>封面</th>
								<th>书名</th>
								<th>作者</th>
								<th>上传时间</th>
								<!--                             <td>order</td>
                            <th>发布时间</th> -->
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="tbody">

							<c:forEach items="${books.books}" var="i">
								<%-- <tr>
									<td><input type="checkbox" name="ids" value="${i.bookId}"></td>
									<td id="${i.bookId}">${i.bookId}</td>
									<td id="${i.bookName}">${i.bookName}</td>
									<td id="${i.bookAuthor}">${i.bookAuthor}</td>
									<td>
										<fmt:formatDate value="${i.bookPostTime}" pattern="YY年MM月dd日 HH:mm"/>
                                    </td>
									
									<td>
										<a href="javascript:void(0)"
										   id="bj" class="layui-btn layui-btn-mini"
										   onclick="bj(${i.bookId},${i.bookName},${i.bookAuthor})">编辑</a> 
										<a href="javascript:void(0)"
										   onclick="deleteBook(${i.bookId})"
										   class="layui-btn layui-btn-danger layui-btn-mini">删除</a>
								    </td>
								</tr> --%>
							</c:forEach>
						</tbody>
					</table>
				</form>

				<!-- 分页 -->
				<div id="pages"></div>
			</div>
			<!-- tab切换页 -->
		</div>
	</div>


</rapid:override>
<rapid:override name="footer-script">
	<script>
	/********图片上床**********/
	layui.use('upload', function () {
		var $ = layui.jquery,
		upload = layui.upload;
		var uploadInst = upload.render({
			elem: '#test1',
			url: '/uploadFile',
			before: function (obj) {
				obj.preview(function (index, file, result) {
					//console.log(result);//result存储的本地的图片地址
					$('#demo1').attr('src', result);
				});
			},
			done: function (res) {
				$("#userAvatar").attr("value", res.data.src);
				console.log(res.data.src);//上传成功后返回的数据库存储的地址
				if (res.code > 0) {
					return layer.msg('上传失败');
				}
			},
			error: function () {
				var demoText = $('#demoText');
				demoText.html('' +
						'<span style="color: #FF5722;">上传失败</span>' +
				' <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
				demoText.find('.demo-reload').on('click', function () {
					uploadInst.upload();
				});
			}
		});

	});
	layui.use('laypage', function(){
		  var laypage = layui.laypage;
		  
		  //执行一个laypage实例
		  laypage.render({
		    elem: 'pages', //注意，这里的 test1 是 ID，不用加 # 号
		    count: ${books.totalCount}, //数据总数，从服务端得到
		    limit: 5,
		    jump: function(obj, first){
		        //obj包含了当前分页的所有参数，比如：
		        //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
		        //console.log(obj.limit); //得到每页显示的条数
		        var name = $("input[name='query']").val();
		        //console.log(name);
		        var pageCurrent = obj.curr;
		        var pageSize = obj.limit;
		        $.ajax({
		        	type: "GET",
		        	url: "/admin/bookshelf/doFindPageObjects?pageCurrent="+pageCurrent+"&name="+name,
		        	dataType: "json",
		        	success: success
		        });
		        //首次不执行
		        if(!first){
		          //do something
		        }
		     }
		  });
		  function success(result) {
			  //console.log(result);
			  var records = result.data.records;
			  //console.log(data);
			  setTable(records);
		  }
		  function setTable(records) {
			  console.log(records);
			  var tbody = $("#tbody");
			  tbody.empty();
			  var tr;
			  var tds = "";
			 // console.log(1);
			  for (var i = 0; i < records.length; i++) {
				tr=$("<tr></tr>");  
			  	tds = '<td><input type="checkbox" name="ids" value='+records[i].bookId+'></td>'
			  		 +'<td id='+records[i].bookId+'>'+records[i].bookId+'</td>'
			  		 +'<td id='+records[i].imageUrl+'><img src="'+records[i].imageUrl+'"/></td>'
			  		 +'<td id='+records[i].bookName+'>'+records[i].bookName+'</td>'
			  		 +'<td id='+records[i].bookAuthor+'>'+records[i].bookAuthor+'</td>'
			  		 +'<td>'+new Date(records[i].bookPostTime).toLocaleString()+'</td>'
			  		 +'<td>'
			  		 	+'<a href="javascript:void(0)" id="bj" class="layui-btn layui-btn-mini" onclick="bj('+records[i].bookId+','+records[i].bookName+','+records[i].bookAuthor+')">编辑</a>'
			  		 	+'<a href="javascript:void(0)" onclick="deleteBook('+records[i].bookId+')" class="layui-btn layui-btn-danger layui-btn-mini">删除</a>';
				tr.append(tds);
			    tbody.append(tr);
			  }
			  
			  
		  }
	});

    </script>
</rapid:override>
<%@ include file="../Public/framework.jsp"%>
