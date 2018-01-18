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
.borderMenu {
	border: 3px solid #f2ecdc;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		myPageLoad('myPageMain');
	})

	function myPageLoad(url) {
		$("#myPageResult").load(url);
	}
</script>

</head>
<!--마이페이지 메인  -->
<div class="row h25"></div>

<!--메뉴  -->
<div class="col-md-12">

<<<<<<< HEAD
	<div class="col-md-3 column margintop20">
		<ul class="nav nav-pills nav-stacked">
			<li><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span> Home</a></li>
			<li><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span> Option 1</a></li>
			<li><a href="#" ><span
					class="glyphicon glyphicon-chevron-right"></span> Option 2 (active)</a></li>
			<li><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span> Option 3</a></li>
			<li><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span> Option 4</a></li>
			<li><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span> memberPoint</a></li>
		</ul>
=======

	<div class="col-md-3 ">
		<div class="sidebar-nav disInline w70p">
			<div class="well borderMenu disInline w100p"
				style="background-color: white; padding: 8px 0;">
				<ul class="nav nav-list  w100p ">
					<li><a href="#" class="000000"><b>마이페이지</b></a>
					<hr class="w90p" style="margin: 0 auto;"></li>
					<li><a href="#" class="000000">회원정보수정</a></li>
					<li><a href="#" class="000000">회원등급포인트관리</a></li>
				</ul>
			</div>
		</div>
>>>>>>> branch 'master' of https://github.com/tcatProject/tcat.git
	</div>

	<!--뿌려주는 div-->
	<div class="col-md-8" id="myPageResult"></div>

</div>
</html>