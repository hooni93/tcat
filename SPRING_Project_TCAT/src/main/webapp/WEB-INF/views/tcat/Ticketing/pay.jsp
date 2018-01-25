<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
.chooseTb {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #050505), color-stop(1, #050405));
	background:-moz-linear-gradient(top, #050505 5%, #050405 100%);
	background:-webkit-linear-gradient(top, #050505 5%, #050405 100%);
	background:-o-linear-gradient(top, #050505 5%, #050405 100%);
	background:-ms-linear-gradient(top, #050505 5%, #050405 100%);
	background:linear-gradient(to bottom, #050505 5%, #050405 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#050505', endColorstr='#050405',GradientType=0);
	background-color:#050505;
	cursor:pointer;
	color:#ffffff;
	font-family:Verdana;
	font-size:15px;
	font-weight:bold;
	padding:13px 32px;
	text-decoration:none;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<tr class="chooseTb">
			<th>결제방법</th>
		</tr>
		<tr>
			<td>
				<table class="table">
					<tr>
						<td>YES머니</td>
						<td><input type="text" value="0">원</td>
						<td><input type="checkbox">전액사용(총 0원)
					</tr>
					<tr>
						<td>YES포인트</td>
						<td align="right">0 원</td>
						<td><input type="button" value="YES머니로 전환"></td>
						<td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>