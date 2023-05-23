<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더 예제페이지</title>


</head>

<body>
	<h2>캘린더 예제</h2>
	
	<p>예약일을 선택해보세요: <input type="text" id="datepicker"></p>
	
	<div id="get-date-val" style="margin-bottom:3%;"></div>
	
	<div>--- 예약한 날짜가 10개 이상인 날짜들을 받아온 데이터 --- </div>
	<div>
		<c:forEach var="vals" items="${dtList}">
			<p>${vals} </p>
		</c:forEach>
	</div>
	<div style="margin-bottom:3%;">------------------------------------------------------------- </div>
	
	<div>------------ 데이터 베이스에서 받아온 데이터 ------------ </div>
	<div>
		<c:forEach var="vals" items="${rsvList}">
			<p>${vals.rsvId} | ${vals.uid} | ${vals.ctg} | ${vals.startDt} | ${vals.endDt}</p>
		</c:forEach>
	</div>
	<div>------------------------------------------------------------- </div>
	
</body>
</html>

<script type="text/javascript">
// var dtList = [];
var fullDtList = [];

$(function(){	
	//getTwoWeeks(); // 예제데이터 확인용
	getDtList();
	
	calendarSet();
});

function getDtList(){
	var callDtList = '${dtList}';
	callDtList = callDtList.replace('[', '');
	callDtList = callDtList.replace(']', '');
	callDtList = callDtList.replace(/ /g, '');
	
	var callDtRep = [];
	callDtRep = callDtList.split(',');
	
	for(var i=0, len=callDtRep.length; i<len; i++){
		var sstr = callDtRep[i].substr(0, 4) + '-' + callDtRep[i].substr(4, 2) + '-' + callDtRep[i].substr(6);
		fullDtList.push(sstr);
	}
}


function getTwoWeeks(){
	var getToday = new Date();
	
	var yearVal = getToday.getFullYear();
	var monVal = getToday.getMonth()+1;
	var dayVal = getToday.getDate();
	
	for(var i=0, len=14; i < len; i++){
		var monTemp = monVal;
		if(monTemp < 10) monTemp = '0' + monTemp;
		
		var dayTemp = dayVal+i;
		if(dayTemp < 10) dayTemp = '0' + dayTemp;
		
		dtList.push(yearVal+'-'+monTemp+'-'+dayTemp);
		
		console.log(dtList[i]); // 추가된 값 브라우저 개발자 Console창에서 확인해보는 기능
	}
}


function calendarSet(){
	function enableDayFn(date){
		var monTemp = date.getMonth()+1;
		if(monTemp < 10) monTemp = '0' + monTemp;
		
		var dayTemp = date.getDate();
		if(dayTemp < 10) dayTemp = '0' + dayTemp;
		
		dummy = date.getFullYear()+'-'+monTemp+'-'+dayTemp;

		if ($.inArray(dummy, fullDtList) >= 0) return [true,"",""];
		else return [false,"",""];
	}

	$("#datepicker").datepicker({
		// 선택하면 데이터 가져오는 기능
		onSelect: function(data){
			$('#get-date-val').html('예약을 원하는 날짜: '+data);
		},
		
		dateFormat: 'yy-mm-dd',
		regional: 'ko',
		beforeShowDay: enableDayFn
	});
}

</script>