<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자페이지</title>
</head>
<body onload="load('hostMain');"  class="b400040">

<%@include file="HostTop.jsp" %>
	
	
 	<div class="row">
		<div class="col-md-2" >
			<ul class="nav nav-pills nav-stacked">
				<li class="b400040 h50"></li>
				<li class="b400040"><a href="#">상품목록</a></li>
	            <li class="b400040"><a href="#">카테고리별 상품진열관리</a></li>
	            <li class="b400040"><a href="#">핫카테고리 상품진열관리</a></li>
	            <li class="b400040"><a href="#">상품등록</a></li>
	            <li class="b400040"><a href="#">상품등록수정</a></li>
	            <li class="b400040"><a href="#">상품삭제</a></li>
	            <li class="b400040"><a href="#">상품재고관리</a></li>
	            <li class="b400040"><a href="#">품절상품관리</a></li>
	            
			</ul>
		</div>
			<div class="col-md-10 bffffff" id="result"></div>
			
		</div>

<%@include file="HostFooter.jsp" %>

</body>
</html>