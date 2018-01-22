<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
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
					<img src="${image}memberPoint/log.png"  width="100%" height="200px">
					</div>

					<div>
					
					<h4><center><%=request.getSession().getAttribute("login_id") %>님의 등급은</center></h4>
					<h3><center>${Rating}등급입니다</center></h3>
					<c:if test="${Rating.equals('S')}">
						<h4><center>이번년도 구매횟수 ${sRank}회</center></h4>
					</c:if>
					<c:if test="${Rating.equals('VIP')}">
						<h4><center>이번년도 구매횟수 ${vRank}회</center></h4>
					</c:if>
					<h4><center>총 구매횟수 ${cnt}회</center></h4>
					
					</div>
					
					<div class="progress">
  					<div class="progress-bar progress-bar-striped active" style="width: ${cnt}%">
    				<center>${cnt}%</center>
  					</div>
					</div>
					
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