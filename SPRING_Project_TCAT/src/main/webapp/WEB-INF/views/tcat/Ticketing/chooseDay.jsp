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
$(function() {

	$('#datepicker').datepicker({
		dateFormat: 'yy-mm-dd',//데이터 형식 변경
		dayNamesShort:["일","월","화","수","목","금","토"],
		 changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		monthNames:[ "1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월"],
	    onSelect: function(dateText, inst) { //선택한 데이터를 input박스에 넣기
	      $("input[name='something']").val(dateText);
	    }
	});
});
</script>
</head>
<body>
<ul class="nav nav-tabs">
  <li role="presentation" class="active"><a href="#">Home</a></li>
  <li role="presentation"><a href="#">Profile</a></li>
  <li role="presentation"><a href="#">Messages</a></li>
</ul>




<div id="datepicker"></div>
<input type="text" name="something">



</body>
</html>