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
	<a class="btn btn-default" onclick="load('placeList?place=서울');" role="button">서울</a>
	<a class="btn btn-default" onclick="load('placeList?place=인천');" role="button">인천</a>
	<a class="btn btn-default" onclick="load('placeList?place=광주');" role="button">광주</a>
	<a class="btn btn-default" onclick="load('placeList?place=대전');" role="button">대전</a>
	<a class="btn btn-default" onclick="load('placeList?place=대구');" role="button">대구</a>
	<a class="btn btn-default" onclick="load('placeList?place=부산');" role="button">부산</a>
	<a class="btn btn-default" onclick="load('placeList?place=강원');" role="button">강원</a>
	<a class="btn btn-default" onclick="load('placeList?place=제주특별자치도');" role="button">제주</a>
	<a class="btn btn-default" onclick="load('placeList?place=울산');" role="button">울산</a>
	<a class="btn btn-default" onclick="load('placeList?place=전북');" role="button">전북</a>
	<a class="btn btn-default" onclick="load('placeList?place=경북');" role="button">경북</a>
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