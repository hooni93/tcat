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
<script src="${script}ajax/request.js"></script>

<script type="text/javascript">
	function test(){
		var date=document.all.something.value;

		$( "#result" ).load( "${pageContext.request.contextPath}/daySearch?date="+date );
		document.all.something2.focus();
	}
</script>
</head>
<body>
<div class="thumbnail">
<div class="c m10">
	<a class="btn btn-default" onclick="load('placeList?place=서울특별시');" role="button">서울특별시</a>
	<a class="btn btn-default" onclick="load('placeList?place=경기도');" role="button">경기도</a>
	<a class="btn btn-default" onclick="load('placeList?place=인천광역시');" role="button">인천광역시</a>
	<a class="btn btn-default" onclick="load('placeList?place=광주광역시');" role="button">광주광역시</a>
	<a class="btn btn-default" onclick="load('placeList?place=대전광역시');" role="button">대전광역시</a>
	<a class="btn btn-default" onclick="load('placeList?place=대구광역시');" role="button">대구광역시</a>
	<a class="btn btn-default" onclick="load('placeList?place=부산광역시');" role="button">부산광역시</a>
	<a class="btn btn-default" onclick="load('placeList?place=강원도');" role="button">강원도</a>
	<a class="btn btn-default" onclick="load('placeList?place=제주도특별시');" role="button">제주도특별시</a>

</div>

<!-- 핫리스트 -->
<div class="container">
    <div class="row">
    	<div class="col-md-12">
    	<div class="col-md-1"></div>
    	<c:forEach var="vo" items="${dtos}" >
			<div class="col-sm-3 col-md-2">
				<div class="thumbnail" >
					<img src="${image}performance/${vo.perf_Image}" class="img-responsive">
					<div class="caption">
						<h6 class="c"><label>${vo.perf_title}</label></h6>
						<h6 class="c">${vo.hall_name}</h6>
						<h6 class="c">
							<c:set var="startdate" value="${fn:split(vo.startDate,' ')}"/>
							${startdate[0]}
						</h6>
						<h6 class="c">
							<c:set var="enddate" value="${fn:split(vo.endDate,' ')}"/>
							<span> ~ </span> ${enddate[0]}
						</h6>
					</div>
					<div class="c m5">
						<a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
						<a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> 예매</a>
					</div>
					</div><!-- outline -->
				</div><!-- md2 -->
		</c:forEach>
		</div><!-- md12 -->

        <div class="col-md-1"></div>
	</div><!--row 끝  -->
</div><!-- 컨테이너 끝 -->
</div><!-- 핫리스트 끝 -->

</body>
</html>