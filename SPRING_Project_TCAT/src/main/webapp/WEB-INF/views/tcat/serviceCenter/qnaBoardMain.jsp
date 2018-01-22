<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>

<!-- <link href="/tcat/resources/style.css" rel="stylesheet" type="text/css" media="screen" />  -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function loadBoard(url) {
		
	 $( "#result2" ).load( "${pageContext.request.contextPath}/"+url);	
	 
}

$( function() {
	 $( "#result2" ).load( "${pageContext.request.contextPath}/qnaBoardList");
});

//상세페이지
function BoardContent(url) {
		
	 $( "#result2" ).load( "${pageContext.request.contextPath}/"+url);	
	 
}  

</script>
</head>
<body>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<div class="row pt5">
			<br><br><br>
			<div class="col-md-2 "><!-- thumbnail mr15 h300 -->
				<div class="list-group pt11">
				  <div class="pt11"><p class="686868 b m10"><span ></span>고객센터</p></div><!-- class="glyphicon glyphicon-star" -->
				  <a onclick="loadBoard('qnaBoardList')" class="list-group-item"> Q&A게시판</a>
				  <a onclick="loadBoard('qnaOneToOneboard')" class="list-group-item"> 1:1게시판</a>
				  <a href="#" class="list-group-item"> 공지사항</a>
				</div>
			</div>	
			<div id="result2" class="col-md-9">
			
			</div>
			</div>
		</div>
	</div>	
			
			
			
</body>
</html>