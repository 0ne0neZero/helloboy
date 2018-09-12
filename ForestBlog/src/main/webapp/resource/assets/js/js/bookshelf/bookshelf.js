var cloud = document.getElementById("cloud");
var x = 0;
setInterval(function(){
	x -= 4;
	cloud.style.backgroundPositionX = x+"px";
},2000);

window.onload = function(){
	$.ajax({
		url : "/home/index",
		success : doFounction
	})
}

function doFounction(result) {
	var data = result.data;
	setBookShelf(data);
	//console.log(result.data)
}
function setBookShelf(data) {
	var templ = "";
	for(var i in data) {
		console.log(data[i].bookName);
		templ += '<div class="swiper-slide">'+
		'<img src="'+data[i].imageUrl+'" class="imgg">'+
		'<div class="textt">'+
		'<p class="bookname">书名:'+data[i].bookName+'</p>'+
		'<p class="author">作者:'+data[i].bookAuthor+'</p>'+
		'<p class="author">上传时间:<br>'+new Date(data[i].bookPostTime).toLocaleString()+'</p>'+
		'</div>'+
		'</div>';

	}
	$('.swiper-wrapper').append(templ);
	initSwiper();
}
function initSwiper(){
	var swiper = new Swiper('.swiper-container', {

		loop: true,
		autoplay: true,
		speed: 2000
	});
}









