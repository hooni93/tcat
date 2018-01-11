<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카테고리별 상품진열 관리</title>
</head>
<body onload="productGet('categoryList','뮤지컬');"  class="b400040">

<%@include file="../hostMain/HostTop.jsp" %>
 	<div class="row">
		<div class="col-md-2" >
			<ul class="nav nav-pills nav-stacked">
				<li class="b400040 h50"></li>
	            <li class="b400040"><a onclick="productGet('categoryList','뮤지컬');">뮤지컬</a></li>
	            <li class="b400040"><a onclick="productGet('categoryList','연극');">연극</a></li>
	            <li class="b400040"><a onclick="productGet('categoryList','콘서트');">콘서트</a></li>
	            <li class="b400040"><a onclick="productGet('categoryList','스토어');">스토어</a></li>        
			</ul>
		</div>
			<div class="col-md-10 bffffff" id="result"></div>
		</div>
<%@include file="../hostMain/HostFooter.jsp" %>

</body>
</html>