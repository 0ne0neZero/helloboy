/*票房占比*/
function ticketPersent(realDayJson,ticketPersentData) {
	//echats中的数据循环,入栈
	var asdata = [];
	for(var i = 0;i<6;i++){
		asdata.push({"value":ticketPersentData[i],"name":realDayJson[i]});
	}
	var ticketPersentt = echarts.init(document.getElementById("ticketPersent"));
	option = {
//		    title : {
//		        text: '票房占比',
//		        subtext: '百度糯米电影',
//		        x:'center'
//		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} :({d}%)"
		    },
//		    legend: {
//		        orient: 'vertical',
//		        left: 'right',
//		        data: realDayJson
//		    },
		    series : [
		        {
		            name: '票房占比',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data: asdata,
//		            data:[
//		                  {value:ticketPersentData, name:realDayJson},
////		                  {value:310, name:'邮件营销'},
////		                  {value:234, name:'联盟广告'},
////		                  {value:135, name:'视频广告'},
////		                  {value:1548, name:'搜索引擎'}
//		              ],
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
	ticketPersentt.setOption(option,true);
}