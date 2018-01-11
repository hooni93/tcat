<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onload="productGet('productList_perf');" class="b400040">

	<%@include file="../hostMain/HostTop.jsp"%>


	<div class="row">
		<div class="col-md-2">
			<ul class="nav nav-pills nav-stacked">
				<li class="b400040 h50"></li>
				<li class="b400040"><a onclick="productGet('productList_perf');">연극 상품</a></li>
				<li class="b400040"><a onclick="productGet('productList_store');">스토어 상품</a></li>
			</ul>
		</div>
		<div class="col-md-10 bffffff" id="result"></div>

	</div>

	<%@include file="../hostMain/HostFooter.jsp"%>


</body>
</html>