<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="${css}style.css" rel="stylesheet" type="text/css">
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">

<style type="text/css">
	.borderMenu{
		border:3px solid #f2ecdc;
	}
</style>


</head>
<!--마이페이지 메인  -->


<!--메뉴  -->
<div class="col-md-4">

	<div class="sidebar-nav " >
		<div class="well borderMenu" style="background-color:white; width: 300px; padding: 8px 0;">
			<ul class="nav nav-list  ">
				<li class="nav-header">마이페이지</li>
				<li><a href="#"><i class="icon-edit"></i>회원정보수정</a></li>
				<li><a href="#"><i class="icon-calendar"></i>회원등급포인트관리</a></li>
			</ul>
		</div>
	</div>


</div>
<!--뿌려주는 div-->
<div class="col-md-8"></div>

</html>