function getTime() {
	var myDate = new Date();
	var year = myDate.getFullYear();
	var month = parseInt(myDate.getMonth())+1;
	var date = myDate.getDate();
	var hour = myDate.getHours();
	var minute = myDate.getMinutes();
	var second = myDate.getSeconds();
	var newdate = year+"-"+strDate(month)+"-"+strDate(date)+" "+strDate(hour)+":"+strDate(minute)+":"+strDate(second);
	time.innerHTML = newdate;
}
function strDate(date) {
	var newdate = "";

	if(date.toString().length==1) {
		newdate = "0"+date.toString();
	}else {
		newdate = date;
	}
	return newdate;
}
var time = document.getElementById("time");
setInterval(getTime,1000);