$(document).ready(function(){
	hljs.initHighlightingOnLoad();
	initAnchors();
	initStars();
})
// initialize smooth anchor links
function initAnchors() {
	new SmoothScroll({
		anchorLinks: '.nav > li > a',
		extraOffset: function() {
			var totalHeight = 0;
			jQuery('.navbar-fixed-top').each(function(){
				totalHeight += jQuery(this).outerHeight();
			});
			return totalHeight;
		},
		activeClasses: 'link'
	});
}

// initialize stars
function initStars() {	

	$('.body').jstars({
		image_path: 'images',
		style: 'yellow',
		frequency: 19,
		
		//delay: 300
	});
	
}
