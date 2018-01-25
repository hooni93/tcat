<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$("#login2").click(function(){
	$("#modal_result").load("${pageContext.request.contextPath}/memberLogin");
});
function payPerformence(url){
	alert("url:"+url);
    window.open(url, "confirm", "menubar=no, width=1400, height=830");
} 
</script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
</head>

<body>
<c:set var="image" value="/tcat/resources/image/"/>

<!-- 슬라이드 -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="${image}guestMain/A_1.jpg"  width="100%" height="500px" alt="A_1">
      <div class="carousel-caption">

      </div>
    </div>
    <div class="item">
      <img src="${image}guestMain/A_2.jpg" width="100%" height="500px" alt="A_2">
      <div class="carousel-caption">

      </div>
    </div>
    <div class="item">
      <img src="${image}guestMain/A_3.jpg" width="100%" height="500px" alt="A_3">
      <div class="carousel-caption">

      </div>
    </div>

  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div><!-- 슬라이드 끝 -->

<div class="thumbnail">
<div class="c m10">
	<a class="btn btn-default" onclick="load('guestMain?category=뮤지컬');" role="button">뮤지컬</a>
	<a class="btn btn-default" onclick="load('guestMain?category=콘서트');" role="button">콘서트</a>
	<a class="btn btn-default" onclick="load('guestMain?category=연극');" role="button">연극</a>
	<a class="btn btn-default" onclick="load('guestMain?category=클래식');" role="button">클래식</a>
	<a class="btn btn-default" onclick="load('guestMain?category=무용');" role="button">무용/발레</a>
	<a class="btn btn-default" onclick="" role="button">스토어</a>
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
						<c:if test="${sessionScope.login_id!=null}">
							<a onclick="payPerformence('Ticketing?per_id=${vo.per_id}')" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> 예매</a>
						</c:if>
						<c:if test="${sessionScope.login_id==null}">
							<a data-toggle="modal" data-target="#login-modal" id="login2" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> 예매</a>
						</c:if>
					</div>
					</div><!-- outline -->
				</div><!-- md2 -->
		</c:forEach>
		</div><!-- md12 -->

        <div class="col-md-1"></div>
	</div><!--row 끝  -->
</div><!-- 컨테이너 끝 -->
</div><!-- 핫리스트 끝 -->


<a onclick="load('photoBoarder');">사진게시판보기</a> <br>
<a onclick="load('movieBoarder');">영상게시판보기</a>



</body>
</html>