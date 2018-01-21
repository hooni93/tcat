<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.list_side{
		color:black;
	}
</style>
</head>
<div class="row">
	<div class="col-md-1">
		<div class="sidebar-nav disInline w70p floatR">
			<div class="well borderMenu disInline w100p"
				style="background-color: white; padding: 8px 0;">
				<ul class="nav nav-list  w100p ">
					<li><a onclick="myPageLoad('myPageMain');" class="list_side"><b>뮤지컬</b></a>
						<hr class="w90p" style="margin: 0 auto;"></li>
					<li><a onclick="myPageLoad('myModifyForm');" class="list_side">오리지널</a></li>
					<li><a onclick="myPageLoad('memberPoint');" class="list_side">라이센스</a></li>
					<li><a onclick="myPageLoad('myModifyForm');" class="list_side">창작뮤지컬</a></li>
					<li><a onclick="myPageLoad('myModifyForm');" class="list_side">넌버벌 퍼포먼스</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-md-10">
		<!--사이드 메뉴 -->
		<div class="col-md-2"></div>
		<!--리스트 -->
		<div class="col-md-8"></div>
		<div class="col-md-2"></div>
	</div>
	<div class="col-md-1"></div>
</div>


</html>