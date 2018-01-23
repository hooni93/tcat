<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${css}style.css" rel="stylesheet" type="text/css">
 <link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">

<title>Insert title here</title>
<style type="text/css">


.roundButton {
	-moz-box-shadow:inset -3px -26px 0px 0px #ffffff;
	-webkit-box-shadow:inset -3px -26px 0px 0px #ffffff;
	box-shadow:inset -3px -26px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f9f9f9), color-stop(1, #e9e9e9));
	background:-moz-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-webkit-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-o-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:-ms-linear-gradient(top, #f9f9f9 5%, #e9e9e9 100%);
	background:linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9f9f9', endColorstr='#e9e9e9',GradientType=0);
	background-color:#f9f9f9;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Courier New;
	font-size:15px;
	font-weight:bold;
	padding:5px 41px;
	text-decoration:none;
	text-shadow:0px -6px 0px #ffffff;
}
.roundButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e9e9e9), color-stop(1, #f9f9f9));
	background:-moz-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-webkit-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-o-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:-ms-linear-gradient(top, #e9e9e9 5%, #f9f9f9 100%);
	background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e9e9e9', endColorstr='#f9f9f9',GradientType=0);
	background-color:#e9e9e9;
}
.roundButton:active {
	position:relative;
	top:1px;
}
.chooseTb {
	-moz-box-shadow:inset 0px 0px 23px -3px #97c4fe;
	-webkit-box-shadow:inset 0px 0px 23px -3px #97c4fe;
	box-shadow:inset 0px 0px 23px -3px #97c4fe;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #3d94f6), color-stop(1, #1e62d0));
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3d94f6', endColorstr='#1e62d0',GradientType=0);
	background-color:#3d94f6;
	cursor:pointer;
	color:#ffffff;
	font-weight:bold;
	text-decoration:none;
	text-shadow:-1px 1px 0px #1570cd;
}

.ui-datepicker { width: 17em; padding: .2em .2em 0; display: none; font-size: 20px;}

</style>
<script type="text/javascript">
//날짜 캘린더 출력하기
jQuery(function($){
    $.datepicker.regional['ko'] = {
   		closeText: '닫기',
   		prevText: '이전달',
   		nextText: '다음달',
   		currentText: '오늘',
   		monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
   		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
   		dayNames: ['일','월','화','수','목','금','토'],
   		dayNamesShort: ['일','월','화','수','목','금','토'],
   		dayNamesMin: ['일','월','화','수','목','금','토'],
   		weekHeader: 'Wk',dateFormat: 'yy-mm-dd',
   		firstDay: 0,
   		isRTL: false,
   		showMonthAfterYear: true,
   		yearSuffix: ''
   	};
    $.datepicker.setDefaults($.datepicker.regional['ko']);
    //달력 날짜 뿌려줄때 시작날짜,종료날짜 안의 날짜 외에는 막기
    $('#datepicker').datepicker({
    	showOn: 'both',
    	buttonText: "달력",
    	changeMonth: true,
    	changeYear: true,
    	showButtonPanel:true,
    	yearRange: 'c-99:c+99',
    	constrainInput: true,
    	maxDate: '+1y',
    	beforeShowDay: noSundays ,
   		onSelect: function(dateText, inst) { //선택한 데이터를 input박스에 넣기
    		$("input[name='ticet_date']").val(dateText);
   		}
    });
});
// 일요일만 선택 막기
function noSundays(date) {
	 var startDate='${vo.startDate}';
	 var endDate='${vo.endDate}';
	 var sDate=startDate.split(" ");
	 var eDate=endDate.split(" ");
	 var ssDate=sDate[0].split("-");
	 var eeDate=eDate[0].split("-");
	 var sssDate=new Date(ssDate[0], ssDate[1], ssDate[2]);
	 var eeeDate=new Date(eeDate[0], eeDate[1], eeDate[2]);
	 
	 if(date<sssDate||date>eeeDate){
		 return[false];
	 }
	 return [true];
}
		 
	
</script>
</head>
<body style="background-color:white;">
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<table class="table-bordered" style="margin:20px;">
			<tr>
				<th class="chooseTb" style="width:35%; padding:5px;">관람일 선택</th>
				<th class="chooseTb" style="padding:5px;">회차 선택</th>
			</tr>
			<tr>
				<th><div id="datepicker"></div>
				<td>
					<br>
					<b>선택날짜&nbsp</b><input style="background-color:#eeeeee;color:red;border:none" type="text" value="0" name="ticet_date">
					<table>
						<tr>
							<th>회차선택</th>
							<th>좌석등급/잔여석</th>
						</tr>
						<tr>
							<td>
								<div style="border:1px solid #dddddd; height:200px;">
									<c:set var="round" value="${fn:split(vo.remain_round,',')}"/>
									<c:forEach var="remain_round" items="${round}">
										<input type="button" class="roundButton" value="${remain_round}"><br>
									</c:forEach>
								</div>
							</td>
							<td>
								<div style="border:1px solid #dddddd; height:200px;">
									<ul>
										<li>VIP석 : ${vo.getVIP_seatPrice()}</li>
										<li>R석 : ${vo.getR_seatPrice()}</li>
										<li>S석 : ${vo.getS_seatPrice()}</li>
										<li>A석 : ${vo.getA_seatPrice()}</li>
										<li>B석 : ${vo.getB_seatPrice()}</li>
									</ul>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		
		
		</table>
	</div>
<div class="col-md-1"></div>
</div>
</body>
</html>