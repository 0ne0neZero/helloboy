<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Clay - A 3D engine on canvas</title>

	<script type="text/javascript" src="/js/js/index/clay.min.js"></script>


	<script type="text/javascript">

	function Earth() {

		var stage = new Clay.Stage(800, 600);

		var world = stage.getWorld();
		var camera = stage.getCamera();

		camera.set(0,0,0);
		camera.setResolution(0,0);
		//camera.setTarget(new Clay.Vector(-100,0,100));//Clay.Vector.ZERO
		camera.setTarget(new Clay.Vector(-100,0,100));

		window.onresize = function() {
			stage.resizeTo(
				window.innerWidth || document.documentElement.clientWidth,
				window.innerHeight || document.documentElement.clientHeight
			);
		};

		window.onresize();

		Clay.Collada.load('/img/images/img/earth.xml', function(scene) {
			scene.init(stage);

			var earth = new Clay.Texture('/img/images/img/earthmap1k.jpg', stage);

			var clouds = new Image();
			clouds.src = '/img/images/img/earthclouds1k.png';

			var dark = new Image();
			dark.src = '/img/images/img/darkside.png';

			var waiting = setInterval(function(){
				if (earth.complete && clouds.complete && dark.complete){
					clearInterval(waiting);
					play();
				}
			}, 1000);

			function play() {
				var shape = world.getShapes()[0];
				shape.setMaterial(earth);

				var x, y, z, t = Math.PI/4, r = 0, tick = 0.01, radius = 100;
				var ttx = earth.canvas.getContext('2d');

				var base = earth.image;
				var wind = 0;

				stage.addEvent('enterframe', function(){

					var positionX = -100 + Math.sin(t) * radius;
					var positionY = Math.cos(t/3) * 50;
					ttx.drawImage(base, positionX,positionY);
					var pos = (++wind)%1000;
					ttx.drawImage(clouds, pos, 0);
					ttx.drawImage(clouds, pos-1000, 0);
					//ttx.drawImage(dark, positionX,positionY);
					ttx.drawImage(dark, 0,0);

					t += tick;
					//x = -100 + Math.sin(t) * radius;
					x = 0
					//z = 100 + Math.cos(t) * radius;
					z = 0;
					//y = Math.cos(t/3) * 50
					y = 0;
					camera.set(x, y, z);
				});

				stage.run();
			}
		});
	}

	window.addEventListener('load', function(){
		new Earth();
	}, false);


	</script>

	<style type="text/css">
	html,body {
		width:100%;
		height:100%;
		margin:0;
		padding:0;
		position:relative;
		background:transparent;
	}

	.canvas3D {
		background:transparent;
		position:absolute;
    left: -17%;
    top: -25.4%;

	}

	</style>

</head>
<body id="body" style="zoom: 1.5;">



</body>
</html>