/*平均占比*/
function avgPrice(movieName,avprice) {
	
	var avgPrice = echarts.init(document.getElementById("avgPrice"));
	option = {
			grid: {
		    	top: '7%',
		        left: '3%',
		        right: '8%',
		        bottom: '0%',
		        containLabel: true
		    },
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'cross'
		        }
		    },
		    xAxis: {
		        type: 'category',
		        boundaryGap: false,
		        data: movieName,
		        axisLabel: {
	            	color: '#fff',
	            	//rotate: 30
	            },
		    },
		    yAxis: {
		        type: 'value',
		        axisLabel: {
	            	color: '#fff',
	            	//rotate: 30
	            },
		    },
		    series: [{
		        data: avprice,
		        type: 'line',
		        areaStyle: {
	                normal: {
	                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                        offset: 0,
	                        color: '#d68262'
	                    }, {
	                        offset: 1,
	                        color: '#ffe'
	                    }])
	                }
	            },
		    }]
		};

	avgPrice.setOption(option,true);
}