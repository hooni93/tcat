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
<script type="text/javascript">
jQuery(function($){
		    $.datepicker.regional['ko'] = {closeText: '닫기',prevText: '이전달',nextText: '다음달',currentText: '오늘',monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],dayNames: ['일','월','화','수','목','금','토'],dayNamesShort: ['일','월','화','수','목','금','토'],dayNamesMin: ['일','월','화','수','목','금','토'],weekHeader: 'Wk',dateFormat: 'yy-mm-dd',firstDay: 0,isRTL: false,showMonthAfterYear: true,yearSuffix: ''};
		    $.datepicker.setDefaults($.datepicker.regional['ko']);

});
jQuery(document).ready(function () {
    var minDate = new Date();
    var maxDate = new Date();
    var dd = maxDate.getDate() + 7;
    maxDate.setDate(dd);

    jQuery("#datepicker").datepicker({
        minDate : minDate,
        maxDate : maxDate
    });
});

$(function() {

	$('#datepicker').datepicker({
		dateFormat: 'yy-mm-dd',//데이터 형식 변경
		 changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
	    onSelect: function(dateText, inst) { //선택한 데이터를 input박스에 넣기
	      $("input[name='something']").val(dateText);
	    }
	});
});
</script>
</head>
<body>
<div style="border:1px solid #cccccc; width:1000px;" class="nav-Menu">
	<ul class="nav nav-tabs">
	  <li role="presentation" id="menu1" class="a active"><a href="" class="menu1">관람일/회차</a></li>
	  <li role="presentation" id="menu2" class="a"><a href="" class="menu2">좌석선택</a></li>
	  <li role="presentation" id="menu3" class="a"><a href="" class="menu3">할인/쿠폰</a></li>
	  <li role="presentation" id="menu4" class="a"><a href="" class="menu4">수령방법</a></li>
	  <li role="presentation" id="menu5" class="a active"><a href="" class="menu5">결제방법</a></li>
	</ul>
	<div id="result">
		<div id="datepicker"></div>
		<input type="text" name="something">
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>sssss
		<br>
		<br>a
		<br>
		<br>
		<br>
			
	<!-- 밑에 뿌려줄 부분 -->
	</div>
</div>
<div id="side_bar">
	<!-- 옆의 결제내역 표시부분 -->
</div>
</body>
</html>