/*各电影当日实时票房统计表*/
function movieRealDay(realDayJson,realDayJsonNum) {
	var movieRealDay = echarts.init(document.getElementById("movieRealDay"));
	option = {
		    color: ['#3398DB'],
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    grid: {
		    	top: '7%',
		        left: '3%',
		        right: '8%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis : [//xAxis.axisLabel.color xAxis.axisLabel.show
		        {
		            type : 'category',
		            data : realDayJson,
		            axisTick: {
		                alignWithLabel: true
		            },
		            axisLabel: {
		            	show : false,
		            	color: '#fff',
		            	rotate: 10
		            }
		        }
		    ],
		    yAxis : [//yAxis.splitLine.show
		        {
		            type : 'value',
		            axisLabel: {
		            	color: '#fff',
		            	//rotate: 30
		            },
		            splitLine : {
		            	show: false,
		            }
		        }
		    ],
		    
		    series : [
		        {
		        	itemStyle :{
		        		normal : {
			        		label : {
			        			show: true,
			                    textStyle: {
			                    	color : '#fff',
			                        fontWeight: 'bolder',
			                        fontSize: '12',
			                        fontFamily: '微软雅黑'
			                    },
			                    position: 'top'		
			    		    },
			        	}
		        	},
		            name:'实时票房',
		            type:'bar',
		            barWidth: '70%',
		            data:realDayJsonNum
		        }
		    ]
		};

	movieRealDay.setOption(option,true);
}