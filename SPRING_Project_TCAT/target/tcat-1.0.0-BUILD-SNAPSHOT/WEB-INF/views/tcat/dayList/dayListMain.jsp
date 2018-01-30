<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../setting.jsp" %>
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
	$( ".thumbnail" ).load( "${pageContext.request.contextPath}/dayList" );
});
</script>
</head>
<body>
		<div id="datepicker"></div>

		<div class="thumbnail">
		   
		</div>
		
</body>
</html>