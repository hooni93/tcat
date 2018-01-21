<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.list_side {
	color: black;
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
					<li><a onclick="myPageLoad('myModifyForm');" class="list_side">넌버벌
							퍼포먼스</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-md-10">
		<!--사이드 메뉴 -->
		<div class="col-md-2"></div>
		<!--리스트 -->
		<div class="col-md-8">

			<div>
				<div class="col-sm-12 c">
					<div class="col-sm-6">현재 예매 가능한 ${sDev }뮤지컬이 총 ${productCnt}개 있습니다.</div>
					<div class="col-sm-5">등록순 종료임박순 상품명순 주간랭킹순</div>
					<div class="col-sm-1">
						<input>
					</div>
				</div>
				<div class="col-sm-12 c h25 bf0f0f0 tm"
					style="border: 1px solid #d0d0d0; border-top: 2px solid blue;">
					<div class="col-sm-8">
						<b>공연명</b>
					</div>
					<div class="col-sm-2">
						<b>일시</b>
					</div>
					<div class="col-sm-2">
						<b>장소</b>
					</div>
				</div>
				<c:forEach var="perf" items="${perfs }">
				</c:forEach>
				<div class="col-sm-12 c" style="border-bottom: 1px solid #d0d0d0">
					<div class="col-sm-8">${perf.perf_title }</div>
					<div class="col-sm-2">0000.00.00~ 0000.00.00</div>
					<div class="col-sm-2">성남아트센터 오페라 하우스</div>
				</div>
			</div>






		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="col-md-1"></div>
</div>


</html>