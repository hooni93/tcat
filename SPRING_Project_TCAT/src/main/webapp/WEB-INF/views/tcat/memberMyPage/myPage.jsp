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
.nav-pills>li.active>a, .nav-pills>li.active>a:hover, .nav-pills>li.active>a:focus
{
	color: #fff;
	background-color: #428bca;
}

.margintop20 {
	margin-top: 20px;
}

.nav-pills>li>a {
	border-radius: 0px;
}

a {
	color: #000;
	text-decoration: none;
}

a:hover {
	color: #000;
	text-decoration: none;
}

.nav-stacked>li+li {
	margin-top: 0px;
	margin-left: 0;
	border-bottom: 1px solid #dadada;
	border-left: 1px solid #dadada;
	border-right: 1px solid #dadada;
}

.active2 {
	border-right: 4px solid #428bca;
}
</style>


</head>
<!--마이페이지 메인  -->


<!--메뉴  -->
<div class="col-md-4">

	<div class="col-md-3 column margintop20">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span> Home</a></li>
			<li><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span> Option 1</a></li>
			<li><a href="#" class="active2"><span
					class="glyphicon glyphicon-chevron-right"></span> Option 2 (active)</a></li>
			<li><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span> Option 3</a></li>
			<li><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span> Option 4</a></li>
			<li><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span> Option 5</a></li>
		</ul>
	</div>


</div>
<!--뿌려주는 div-->
<div class="col-md-8"></div>

</html>