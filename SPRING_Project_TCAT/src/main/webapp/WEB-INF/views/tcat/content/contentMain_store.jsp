<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
.wish {
	border: 0;
	background: none;
	color: white;
	outline: none;
}

.wish.active {
	color: red;
}

/*탭  */
a {
	color: black;
}

.nav-tabs {
	border-bottom: 1.3px solid gray;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	border: 1.3px solid gray;
	border-bottom-color: transparent;
	color: black;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	if(${wishResult!=0}){
		$(".wish").addClass("active");
	}
});
	//탭
	$('#myTab a[href="#profile"]').tab('show');
	
	//위시리스트 킬릭시
	$(".wish").click(function(){
		if(${login_id == null}){
			alert("로그인 후 이용해 주세요.");
			return false;
		}else{
			var disc_code = $("#disc_code").val();
			var formData = {"disc_code":disc_code};
			var active = $(".wish").hasClass("active");
			if(active){
				$.ajax({
					type : "POST",
					url : "delWishList",
					cache : false,
					data : formData,
					success : function() {
						$(".wish").removeClass("active");
					},
					error : function(){
						alert("위시리스트 실패하였습니다.");
					}
				});
			}else{
				$.ajax({
					type : "POST",
					url : "addWishList",
					cache : false,
					data : formData,
					success : function() {
						$(".wish").addClass("active");
					},
					error : function(){
						alert("위시리스트 실패하였습니다.");
					}
				});
			}
				var disc_code = $("#disc_code").val();
				var formData = {"disc_code":disc_code};
				var active = $(".wish").hasClass("active");
				if(active){
					$.ajax({
						type : "POST",
						url : "delWishList",
						cache : false,
						data : formData,
						success : function() {
							$(".wish").removeClass("active");
						},
						error : function(){
							alert("위시리스트 실패하였습니다.");
						}
					});
				}else{
					$.ajax({
						type : "POST",
						url : "addWishList",
						cache : false,
						data : formData,
						success : function() {
							$(".wish").addClass("active");
						},
						error : function(){
							alert("위시리스트 실패하였습니다.");
						}
					});
				}

		}
	});
	

	
	//스토어 후기 화면 뿌리기
function commentListS(url) {
		
	$("#commentListS").load( "${pageContext.request.contextPath}/"+url);
}
</script>
</head>
<div class="row">
	<br>
	<!--공백  -->
	<div class="col-md-1"></div>
	<!--내용물  -->
	<div class="col-md-10">
		<!--사이드  -->
		<div class="col-md-2"></div>


		<!--공연정보  -->
		<div class="col-md-9">
			<!--상세페이지 상단  -->
			<div class="col-md-12" style="border: 1px solid lightgrey;">
				<h1>${str.disc_title}</h1>
				<h5>${str.mDev}-${str.sDev}</h5>
			</div>

			<!--사진, 예매, 가격  -->
			<div class="col-md-12"
				style="border-top: 3px solid black; padding: 0;">
				<!--내용  -->
				<div class="col-md-12 bf0f0f0" style="padding: 0;">
					<div class="col-md-9 bffffff"
						style="border: 1px solid lightgrey; padding: 0;">
						<!--사진  -->
						<div class="col-md-4">
							<img src="${image}concert/${str.disc_image}" class="p10">
						</div>

						<div class="col-md-8">
							<div class="row p10">
								<div class="col-md-3">
									<b>수량</b>
								</div>
								<div class="col-md-9">${str.disc_count}개</div>
							</div>
							<div class="row p10" style="border-top: 1px solid grey;">
								<div class="col-md-3 ">
									<b>기본가</b>
								</div>
								<div class="col-md-9">
									<span class="red"> <fmt:formatNumber
											value="${str.disc_price}" pattern="#,###" /></span>원
								</div>
							</div>
						</div>

					</div>
				</div>
				<!--예매  -->
				<div class="col-md-3 " style="padding: 0;">
					<div class="col-md-12 p10">
						<span>위시리스트</span> <input type="hidden" id="disc_code"
							value="${str.disc_code}">
						<button type="button" class="wish btn-xl">
							<i class="glyphicon glyphicon-heart fs20"></i>
						</button>
					</div>

					<div class="col-md-12">
						<input class="btn btn-danger btn-xl w100p" type="button"
							value="구매하기">

					<!--예매  -->
					<div class="col-md-3 " style="padding: 0;">
						<div class="col-md-12 p10">

							<span>위시리스트</span> <input type="hidden" id="disc_code"
								value="${str.disc_code }">

							<button type="button" class="wish btn-xl">
								<i class="glyphicon glyphicon-heart fs20"></i>
							</button>
						</div>
						<div class="col-md-12">
							<input class="btn btn-danger btn-xl w100p" type="button"
								value="구매하기">
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="col-md-12 h21"></div>


		<!--하단  -->
		<div class="col-md-12" style="padding: 0;">
			<!--탭  -->
			<div class="col-md-12" style="padding: 0;">

				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
					<a href="#content" aria-controls="home" role="tab" data-toggle="tab">상세정보</a></li>
					
					<li role="presentation">
					<a href="#review" aria-controls="profile" role="tab" data-toggle="tab" onclick="commentListS('watchLatterS?disc_title=${str.disc_title}&disc_code=${str.disc_code}');">상품후기</a></li>
					
					<li role="presentation">
					<a href="#cancelInfo" aria-controls="messages" role="tab" data-toggle="tab">취소/환불안내</a></li>
				</ul>
			</div>

			<div class="col-md-12 h25"></div>


			<!--상세내용  -->
			<div class="col-md-9 bffffff" style="padding: 0;">
				<!--출력 내용  -->
				<div class="col-md-12" style="padding: 0;">
					<div class="tab-content">
						<!--상세정보  -->
						<div role="tabpanel" class="tab-pane active" id="content">
							<div class="col-md-12"
								style="padding: 0; border-bottom: 1px solid grey">
								<h5>
									<i class="glyphicon glyphicon-play"></i> 상품상세정보
								</h5>
							</div>
							<div class="col-md-12" style="padding: 0;">
								<img src="${str.getDetail_Image()}">
							</div>
	

						<!--상품후기  -->
						<div role="tabpanel" class="tab-pane" id="review">
						
							<div class="col-md-15" id="commentListS">
						</div>
						
						</div>
						<!--취소환불 안내  -->
						<div role="tabpanel" class="tab-pane" id="cancelInfo">3</div>
					</div>
				</div>
			</div>
			<!--최근본 상품, 남녀별 구별   보류?-->
				<div class="col-md-3 " style="padding: 0;">잡다구리잡다가루</div>
			</div>
		</div>
	</div>
	<!--공백  -->
	<div class="col-md-1"></div>
</div>
<br>
<!--공백  -->
<div class="col-md-1"></div>
</div>
</html>