
window.onload = function() {
	ajax();
	setIntervalAJAX();
	//movieRealDay();
}

/*ajax*/
function setIntervalAJAX() {
	setInterval(ajax,1000*10);
}
/*实际应用中有问题
 * 	同时刻100个ip访问,会每次发起100个ajax请求,服务器响应回来的数据是100份不同的数据,应该返10秒时爬取的回同一份数据
 * 	解决:应该在服务器端每隔十秒向数据库存储一次爬取的数据,
 * 		编写一个读取数据库的应用,写一个接口,ajax访问接口,每次访问都会执行查询数据库操作,
 * 		数据来源是自己的服务器数据库中,如果还是糯米的,会被定义为异常访问,拉黑ip
 * */
function ajax() {
	//http://***http://localhost:8090/MyProject/NuomiJson
	$.ajax({
	     type : "GET", //提交方式
	     url : "/NuomiJson",//路径
	     dataType : "text",//
	     success: dataResult
	 });
}
function dataResult(result) {//返回数据根据结果进行相应的处理
	//获取后台返回数据,处理
	var data = eval("("+result+")");
	//获取数据的real节点数据
	var real = data.real;
	//
	var movieData = real.data;
	//判断是否成功
	if ( real.errorMsg === "Success" ) {
		//获取成功,接收电影数据
        var movieData = real.data;
        var detail = movieData.detail;
        var movieName = new Array();
        var movieNameNum = new Array();
        var ticketPersentD = new Array();
        var avprice = new Array();
        if(detail.length == 0){
        	console.log("获取成功,暂无数据");
        	return;
        }
        for(var i = 0; i<detail.length; i++){
        	
        	movieName[i] = detail[i].movieName;//电影名称
        	movieNameNum[i] = parseInt(detail[i].attribute[3].attrValue);//实时票房
        	ticketPersentD[i] = detail[i].attribute[4].attrValue;//票房占比
        	avprice[i] = detail[i].attribute[12].attrValue;//平均售价
        	var attribute = detail[i].attribute;

        }
        append(detail);//top12
        avgPrice(movieName,avprice);
        var movieTotal = movieData.total;
        headereCharts(movieTotal);//总票房统计
        ticketPersent(movieName,ticketPersentD);//票房占比
        movieRealDay(movieName,movieNameNum);//实时票房
 
	    $("#dataNums").rollNumDaq({//数字滚动
	    	
	       deVal:movieTotal.boxNum.toFixed(2),
	      // digit:movieTotal.boxNum.toFixed(2).length+1    //默认显示几位数字
	    });
	    //更改插件功能,适用小数和整数
	    var index = document.getElementsByTagName("li");
        //console.log(index.length-3);
        var n = index.length-3;
        $("li:eq("+n+") .tt span:first").html(".");

        
    }else {
        console.log("获取数据失败!");
        //获取失败,跳转404页面
        //location.reload();//刷新本页面
    }
}
 

