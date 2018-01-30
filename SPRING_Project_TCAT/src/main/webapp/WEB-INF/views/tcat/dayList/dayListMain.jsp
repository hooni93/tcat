<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 설정파일 연결 3개 -->
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">
<script src="${script}bootstrap.js"></script>
<link href="${css}style.css" rel="stylesheet" type="text/css">
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$(".dayList").load("${pageContext.request.contextPath}/dayList");
	});
</script>
<script type="text/javascript">
	$(function() {
		$('#datepicker').datepicker({
			dateFormat: 'yy-mm-dd',//데이터 형식 변경
			 changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		    onSelect: function(dateText, inst) { //선택한 데이터를 input박스에 넣기
		    	$( ".dayList" ).load( "${pageContext.request.contextPath}/daySearch?date="+dateText );
		    }
		});
	});
	function dayList(url){
		$( ".dayList" ).load( "${pageContext.request.contextPath}/"+url);
	}
</script>
</head>
<body>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-2" style="border:1px solid #dddddd; margin-top:10px; padding:5px;">
					<h3 align="center">날짜선택</h3>
					<hr style="border:2px solid #dddddd">
					<div id="datepicker" align="center"></div>
				</div>
				<div class="col-md-10" style="margin-top:10px">
					<div class="dayList"></div>
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
</body>
</html>