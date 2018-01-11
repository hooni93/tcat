<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onload="load('join_retireMember');"  class="b400040">

<%@include file="../hostMain/HostTop.jsp" %>
	
	
 	<div class="row">
		<div class="col-md-2" >
			<ul class="nav nav-pills nav-stacked">
				<li class="b400040 h50"></li>
				<li class="b400040"><a onclick="load('join_retireMember');">최근 가입회원 관리</a></li>
	            <li class="b400040"><a onclick="load('retireMemberConfirm');">회원 탈퇴신청 관리</a></li>
	            <li class="b400040"><a onclick="load('hostMemberJoin');">호스트 멤버 가입관리</a></li>
	            <li class="b400040"><a onclick="load('hostMemberRetire');">호스트 멤버 탈퇴관리</a></li>
			</ul>
		</div>
			<div class="col-md-10 bffffff" id="result"></div>
			
		</div>

<%@include file="../hostMain/HostFooter.jsp" %>


</body>
</html>