
function append(detail){
	
	$("#table").html("<tr><td width='60'>排名</td><td width='80'>影片</td><td width='70'>上映天数</td><td width='80'>累计票房</td><td width='80'>实时票房</td></tr>");
	var htmlTmp = "";

	for (var i = 0; i <= 12; i++) {
		if(detail[i].movieName.length>6){
			//console.log(detail[i].movieName);
			detail[i].movieName = "<marquee width='100%' scrollamount=3>"+detail[i].movieName+"</marquee>";
		}
		htmlTmp = "<tr><td><img src='/img/images/nuomi/first.png'></td><td>"+detail[i].movieName+"</td><td>"+detail[i].attribute[1].attrValue+"</td><td>"+detail[i].attribute[2].attrValue+"</td><td>"+detail[i].attribute[3].attrValue+"</td></tr>";
		$("#table").append(htmlTmp);
	}
}
