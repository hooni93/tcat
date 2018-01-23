<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
</head>
<body>
<c:set var="image" value="/tcat/resources/image/"/>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<div class="row pt5 h100p">
			<div class="col-md-2 thumbnail mr15 h300">
				<div class="list-group pt20">
				  <a href="#" class="list-group-item disabled">
				    <span class="text-warning">연극</span>
				  </a>
				  <a onclick="load('dramaList?sDev=대학로&order=startDate');" class="list-group-item">대학로</a>
				  <a onclick="load('dramaList?sDev=기타지역&order=startDate');" class="list-group-item">기타지역</a>
				</div>
			</div>
			<div class="col-md-7 thumbnail mr15 h100p">
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
				      <img src="${image}drama/A_1.jpg"  width="100%" height="300px" alt="A_1">
				      <div class="carousel-caption">
				
				      </div>
				    </div>
				    <div class="item">
				      <img src="${image}drama/A_2.jpg" width="100%" height="300px" alt="A_2">
				      <div class="carousel-caption">
				
				      </div>
				    </div>
				    <div class="item">
				      <img src="${image}drama/A_3.jpg" width="100%" height="300px" alt="A_3">
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
				</div>
				<!-- 슬라이드 끝 -->
			
			</div>
			<div class="col-md-2 thumbnail h300">
				<div class="list-group pt11">
				  <div class="pt11"><p class="686868 b m10"><span class="glyphicon glyphicon-star"></span> 랭킹</p></div>
				  <a href="#" class="list-group-item">1. 라이어</a>
				  <a href="#" class="list-group-item">2. 단테의신곡</a>
				  <a href="#" class="list-group-item">3. 클로즈</a>
				  <a href="#" class="list-group-item">4. 셜록홈즈</a>
				  <a href="#" class="list-group-item">5. 김종욱찾기</a>
				</div>
			</div>	
			
		</div>
	</div>
	 <div class="col-md-1"></div>
</div><!-- row end -->

</body>
</html>