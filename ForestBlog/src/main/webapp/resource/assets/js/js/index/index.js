var navbar = document.getElementById("navbar");
var leftnav = document.getElementById("leftnav");
var navclose = document.getElementById("navclose");
navbar.onclick = function(){
    this.style.display = "none";
    leftnav.style.visibility = "visible";
    leftnav.style.height = "100%";
    navclose.style.display = "block";
}
navclose.onclick = function(){
    this.style.display = "none";
    leftnav.style.height = "0%";
    leftnav.style.visibility = "hidden";
    navbar.style.display = "block";
}

// 根据屏幕宽度改变另一个window对象中的大小
function doc(){
   var iframeWindow =  document.getElementById("iframe").contentWindow;
   setTimeout(function(){
	   var body = iframeWindow.document.getElementById("body");
	   var canvas = iframeWindow.document.getElementsByClassName("canvas3D")[0];
	   canvas.style.position = "absolute";
	   canvas.style.left = "-13%";
	   canvas.style.top = "-16.4%";
	   body.style.zoom = "1.2";
   },30);
}
if(window.screen.width>=1200&&window.screen.width<=1366){
    doc();
}
fullscreen();
function fullscreen () {
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