<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body class="b400040">
<c:set var="image" value="/tcat/resources/image/"/>
	<div class="row mt50">
		<!-- <div class="col-md-1"></div> -->
		<div class="col-md-10">
			<div class="row">
				<!-- <div class="col-md-1"></div> -->
				<div class="col-md-10">
					<div>
					<h2>포인트</h2>
					<hr>
					<br>
					<img src="${image}memberPoint/log.png"  width="100%" height="200px" alt="A_1">
					</div>

					<div>
					<table align="center">
						<tr>
							<th colspan="2">회원등급</th>
						</tr>
						<tr>
							<th>ID</th>
							<td><%=request.getSession().getAttribute("login_id") %></td>
						</tr>
						<tr>
							<th>등급</th>
							<td>${Rating}</td>
						</tr>
						<tr>
							<th>총 구매횟수</th>
							<td>${cnt}</td>
						</tr>
					</table>
					<%-- <h4><center><%=request.getSession().getAttribute("login_id") %>님의 등급은</center></h4>
					<h3><center>${Rating}등급입니다</center></h3>
					<h4><center>총 구매횟수 ${cnt}</center></h4> --%>
					
					</div>
					<div id="firstChart"></div>
				</div>
				<div class="col-md-1"></div>
				<!--리스트목록 끝  -->

			</div>
			<br> <br> <br> <br> <br>
		</div>
			<div class="col-md-1"></div>

	</div>

</body>
</html>