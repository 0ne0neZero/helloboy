<%--保留此处 start--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid"%>
<%--保留此处 end--%>
<rapid:override name="title">
        - 新建书籍
    </rapid:override>

<rapid:override name="content">
	<blockquote class="layui-elem-quote">
		<span class="layui-breadcrumb" lay-separator="/"> <a
			href="/admin">首页</a> <a href="/admin/bookshelf">书籍列表</a> <a><cite>添加书籍</cite></a>
		</span>
	</blockquote>

	<form class="layui-form" method="post" id="myForm"
		action="/admin/bookshelf/insertSubmit">
		<div class="layui-form-item">
			<label class="layui-form-label">书名</label>
			<div class="layui-input-block">
				<input type="text" name="bookName" required lay-verify="required"
					placeholder="请输入书名" autocomplete="off" class="layui-input">
			</div>
			<br> <label class="layui-form-label">作者</label>
			<div class="layui-input-block">
				<input type="text" name="bookAuthor" required lay-verify="required"
					placeholder="请输入作者" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">备注</label>
			<div class="layui-input-block">
				<textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">单选框</label>
			<div class="layui-input-block">
				<input type="radio" name="readStatus" value="阅读中" title="阅读中">
				<input type="radio" name="readStatus" value="已读完" title="已读完"
					checked>
			</div>
			<input type="hidden" name="imageUrl" id="userAvatar" value="">
		</div>
		<div class="layui-form-item">
            <input type="hidden" id="userId" value="0">
            <label class="layui-form-label">书籍图片</label>
            <div class="layui-input-inline">
                <div class="layui-upload">
                    <div class="layui-upload-list" style="">
                        <img class="layui-upload-img" src="" id="demo1" width="100"
                             height="100">
                        <p id="demoText"></p>
                    </div>
                    <button type="button" class="layui-btn" id="test1">上传图片</button>
                </div>
            </div>
            <input type="hidden" name="userAvatar" id="userAvatar" value="">
        </div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button id="insertSubmit" class="layui-btn" lay-submit
					lay-filter="formDemo">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
</rapid:override>

<rapid:override name="footer-script">

	<script>
        //上传图片
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
    </script>

	<script>
/* 		var insertSubmit = document.getElementById("insertSubmit");
		insertSubmit.onclick = function() {
			console.log(123);
		/* 	window.location.href = " ";
		} */
        layui.use(['form', 'layedit', 'laydate'], function() {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;


            //上传图片,必须放在 创建一个编辑器前面
            layedit.set({
                uploadImage: {
                     url: '/uploadFile' //接口url
                    ,type: 'post' //默认post
                }
            });

            //创建一个编辑器
            var editIndex = layedit.build('content',{
                    height:350,
                }
            );

            //自定义验证规则
            form.verify({
                title: function (value) {
                    if (value.length < 5) {
                        return '标题至少得5个字符啊';
                    }
                }
                , pass: [/(.+){6,12}$/, '密码必须6到12位']
                , content: function (value) {
                    layedit.sync(editIndex);
                }
            });

            layedit.build('content', {
                tool: [
                    'strong' //加粗
                    ,'italic' //斜体
                    ,'underline' //下划线
                    ,'del' //删除线

                    ,'|' //分割线

                    ,'left' //左对齐
                    ,'center' //居中对齐
                    ,'right' //右对齐
                    ,'link' //超链接
                    ,'unlink' //清除链接
                    ,'face' //表情
                    ,'image' //插入图片
                    ,'code'
                ]
            });

            layui.use('code', function(){ //加载code模块
                layui.code();
            });

            //二级联动
            form.on("select(articleParentCategoryId)",function () {
                var optionstring = "";
                var articleParentCategoryId = $("#articleParentCategoryId").val();
                <c:forEach items="${categoryCustomList}" var="c">
                if(articleParentCategoryId==${c.categoryPid}) {
                    optionstring += "<option name='childCategory' value='${c.categoryId}'>${c.categoryName}</option>";
                }
                </c:forEach>
                $("#articleChildCategoryId").html("<option value=''selected>二级分类</option>"+optionstring);
                form.render('select'); //这个很重要
            })

//end
     });
//        window.onbeforeunload = function() {
//            return "确认离开当前页面吗？未保存的数据将会丢失";
//        }
 */


    </script>

</rapid:override>


<%--此句必须放在最后--%>
<%@ include file="../Public/framework.jsp"%>

