/*总票房统计图表*/
function headereCharts(Josndata) {
	//console.log(Josndata.scheNum);
	var headerTotal = echarts.init(document.getElementById("headerTotal"));

	option = {
	    tooltip : {
	    	show : true,
	    	trigger : 'item',
	    	showContent : true,
	        formatter: "{a} <br/>{c} {b}",
	        alwaysShowContent : true
	    },
//	    toolbox: {
//	        show: true,
//	        feature: {
//	            restore: {show: true},
//	            saveAsImage: {show: true}
//	        }
//	    },
	    series : [
	        {
	            name: '票房预测:万',
	            type: 'gauge',
	            z: 3,
	            min: 0,
	            max: 10000,
	            splitNumber: 5,
	            radius: '70%',
	            axisLine: {            // 坐标轴线
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    width: 6
	                }
	            },
	            axisTick: {            // 坐标轴小标记
	                length: 10,        // 属性length控制线长,刻度
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    color: 'auto'
	                }
	            },
	            splitLine: {           // 分隔线
	                length: 20,         // 属性length控制线长
	                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
	                    color: 'auto'
	                }
	            },
	            axisLabel: {
	                backgroundColor: 'auto',
	                borderRadius: 2,
	                color: '#eee',
	                padding: 3,
	                textShadowBlur: 2,
	                textShadowOffsetX: 1,
	                textShadowOffsetY: 1,
	                textShadowColor: '#222'
	            },
	            title : {
	                // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                fontWeight: 'bolder',
	                fontSize: 20,
	                fontStyle: 'italic',
	                color: '#fff',
	                offsetCenter: [0, '-25%'], 
	            },
	            detail : {
	                // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                formatter: function (value) {
	                    // value = (value + '').split('.');
	                    // value.length < 2 && (value.push('00'));
	                    return value;
	                },
	                fontWeight: 'bolder',
	                borderRadius: 3,
	                backgroundColor: '#f2dcd2',
	                borderColor: '#aaa',
	                shadowBlur: 5,
	                shadowColor: '#333',
	                shadowOffsetX: 0,
	                shadowOffsetY: 3,
	                borderWidth: 2,
	                textBorderColor: '#000',
	                textBorderWidth: 2,
	                textShadowBlur: 2,
	                textShadowColor: '#fff',
	                textShadowOffsetX: 0,
	                textShadowOffsetY: 0,
	                fontFamily: 'Arial',
	                fontSize: 20,
	                width: 100,
	                color: '#eee',
	                rich: {}
	            },
	            data:[{value: Josndata.boxNum, name: '万'}]//在这里传入票房统计数据
	        },
	        {
	            name: '人次',
	            type: 'gauge',
	            center: ['20%', '55%'],    // 默认全局居中
	            radius: '50%',
	            min:0,
	            max:400,
	            endAngle:45,
	            splitNumber:4,
	            axisLine: {            // 坐标轴线
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    width: 6
	                }
	            },
	            axisTick: {            // 坐标轴小标记
	                length:10,        // 属性length控制线长
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    color: 'auto'
	                }
	            },
	            splitLine: {           // 分隔线
	                length:20,         // 属性length控制线长
	                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
	                    color: 'auto'
	                }
	            },
	            pointer: {
	                width:5
	            },
	            title: {
	                offsetCenter: [0, '-25%'],       // x, y，单位px
	                color: '#fff'
	            },
	            detail: {
	                // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                fontWeight: 'bolder',
	                fontSize: 18
	            },
	            data:[{value: Josndata.ticketNum, name: '万'}]//场次数据
	        },
	        {
	            name: '场次',
	            type: 'gauge',
	            center: ['77%', '50%'],    // 默认全局居中
	            radius: '40%',
	            min: 0,
	            max: 60,//最大场次
	            startAngle: 135,
	            endAngle: 45,
	            splitNumber: 4,
	            axisLine: {            // 坐标轴线
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    width: 6
	                }
	            },
	            axisTick: {            // 坐标轴小标记
	                splitNumber: 5,
	                length: 10,        // 属性length控制线长
	                lineStyle: {        // 属性lineStyle控制线条样式
	                    color: 'auto'
	                }
	            },
	            axisLabel: {
	                formatter:function(v){
	                    switch (v + '') {
	                        case '0' : return 'E';
	                        case '1' : return 'Gas';
	                        case '2' : return 'F';
	                    }
	                }
	            },
	            splitLine: {           // 分隔线
	                length: 15,         // 属性length控制线长
	                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
	                    color: 'auto'
	                }
	            },
	            pointer: {
	                width:2
	            },
	            title : {
	                show: false,
	            },
	            detail : {
	                show: true,
	                fontSize: 12,
	                offsetCenter: [0, '-40%'], 
	            },
	            data:[{value: Josndata.scheNum, name: '万'}]
	        },
	        {
	            name: '平均票价',
	            type: 'gauge',
	            center : ['77%', '50%'],    // 默认全局居中
	            radius : '40%',
	            min: 0,
	            max: 100,
	            startAngle: 315,
	            endAngle: 225,
	            splitNumber: 5,
	            axisLine: {            // 坐标轴线
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    width: 6
	                }
	            },
	            axisTick: {            // 坐标轴小标记
	                show: false
	            },
	            axisLabel: {
	                formatter:function(v){
	                    switch (v + '') {
	                        case '0' : return 'H';
	                        case '1' : return 'Water';
	                        case '2' : return 'C';
	                    }
	                }
	            },
	            splitLine: {           // 分隔线
	                length: 10,         // 属性length控制线长
	                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
	                    color: 'auto'
	                }
	            },
	            pointer: {
	                width:2
	            },
	            title: {
	                show: false
	            },
	            detail: {
	                show: true,//和场次都设置为true 在配置项里边找位置设置 一个在上一个在下显示
	                fontSize: 12
	            },
	            data:[{value: Josndata.avgPrice, name: '元'}]
	        }
	    ]
	};
	headerTotal.setOption(option,true);
}