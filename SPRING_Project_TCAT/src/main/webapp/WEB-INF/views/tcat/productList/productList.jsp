<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
/* 18.01.11 명훈!! */

	/*탭 스크립트  */
	$('#myTab a[href="#performance"]').tab('show') // 공연상품 탭 클릭시 #myTab a[href="#performance"] 보여줌
	$('#myTab a[href="#store"]').tab('show') // Select tab by name
	
	
	/*ajax submit  */
$("#ajaxSubmit").click(function(){
	alert("dafda");
	var formData = $("#ajaxSubmitForm").serialize();
		
	$.ajax({
				type : "POST",
				url : "productList",
				cache : false,
				data : formData,
				success : onSuccess,
				error : onError
	});
});
	
</script>
</head>
<body>
	<div class="row mt50">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div role="tabpanel">
				<!-- 탭 네비게이션 -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="${perActive}"><a
						href="#performance" aria-controls="home" role="tab"
						data-toggle="tab"
						onclick="productGet('productList','performance')">공연상품</a></li>
					<li role="presentation" class="${storeActive}"><a
						href="#store" aria-controls="profile" role="tab" data-toggle="tab"
						onclick="productGet('productList','store')">스토어상품</a></li>
				</ul>

				<!-- 탭시 출력 -->
				<div class="tab-content">
					<!--공연 출력  #myTab a[href="#performance"]-->
					<div role="tabpanel" class="tab-pane ${perActive}" id="performance">
						<div id="perResult">
							<!--리스트목록  -->
							<div class="row">
								<div class="col-md-1"></div>
								<div class="col-md-10">
									<div>
										<!--검색  -->
										<form class="navbar-form navbar-left " role="search" id="ajaxSubmitForm">
											<input type="hidden" name="category" value="performance">
											<div class="form-group">
												<input type="text" class="form-control" placeholder="Search"
													name="keyword">
											</div>
											
											<button type="button" class="btn btn-default" onclick="ajaxSubmit()">검색</button>
											
											<!--카테고리  -->
											<select  id="mDev" name="mDev" class="btn btn-default" onchange="select_sDev()">
												<option value="null">중분류</option>
												<option value="뮤지컬">뮤지컬</option>
												<option value="콘서트">콘서트</option>
												<option value="연극">연극</option>
												<option value="클래식">클래식</option>
											</select > 
											<select id="sDev" name="sDev" class="btn btn-default">
												<option value="null">소분류</option>
											</select>
										</form>
								
										
									</div>
									<table
										class="table table-hover table-bordered table-condensed c fs10">
										<tr class="bg-primary">
											<td><b>공연코드</b></td>
											<td><b>공연명</b></td>
											<td><b>공연기간</b></td>
											<td><b>지역</b></td>
											<td><b>카테고리</b></td>
											<td><b>이미지파일명</b></td>
											<td><b>할인조건</b></td>
										</tr>
										<c:if test="${performances!=null }">
										<c:forEach var="performance" items="${performances}">
											<tr>
												<td>${performance.per_id }</td>
												<td>${performance.perf_title}</td>
												<td>${performance.startdate} - ${performance.enddate}</td>
												<td>${performance.province} ${performance.city} ${performance.gu} ${performance.address} </td>
												<td>${performance.category} > ${performance.getMdev()} > ${performance.getSdev()} </td>
												<td>${performance.perf_Image}</td>
												<td>${performance.sale_div}</td>
											</tr>
										</c:forEach>
										</c:if>
									</table>
									<div class="row c">
										<div class="disInline">
											<!--1번페이지, 앞으로 하나  -->
										<c:if test="${currentPage!=1}">
											<a onclick="productGet('productList','product','${keyword}','${mDev}','${sDev}','1')">
												◀◀ 
											</a>
											<a onclick="productGet('productList','product','${keyword}','${mDev}','${sDev}','${currentPage-1}')">
												◀ 
											</a>
										</c:if>
										<c:forEach var="i" begin="${startPage}" end="${endPage}" >
											<c:if test="${i == currentPage }">
												<a class="gray" onclick="productGet('productList','product','${keyword}','${mDev}','${sDev}','${i}')">
													${i}
												</a>
											</c:if>
											<c:if test="${i != currentPage }">
												<a onclick="productGet('productList','product','${keyword}','${mDev}','${sDev}','${i}')">
													${i}
												</a>
											</c:if>
										</c:forEach>
										<!--마지막 페이지, 뒤로 하나  -->
										<c:if test="${currentPage!=pageCnt}">
											<a onclick="productGet('productList','product','${keyword}','${mDev}','${sDev}','${currentPage+1}')">
												▶
											</a>
											<a onclick="productGet('productList','product','${keyword}','${mDev}','${sDev}','${pageCnt}')">
												▶▶ 
											</a>
										</c:if>
										</div>
									</div>
								</div>
								<div class="col-md-1"></div>
								<!--리스트목록 끝  -->
							</div>
						</div>
					</div>
					
					
					
					
					<!--스토어 출력  #myTab a[href="#store"]-->
					<div role="tabpanel" class="tab-pane ${storeActive }" id="store">
						<!--리스트 시작  -->
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">
								<div>
									<!--검색  -->
									<form class="navbar-form navbar-left" role="search">
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Search"
												name="keyword">
										</div>
										<button type="button" class="btn btn-default" onclick="">검색</button>
									</form>
									<!--카테고리  -->
									<select name="mDev" class="btn btn-default m10">
										<option value="">중분류</option>
										<option value="뮤지컬">뮤지컬 OST</option>
									</select> 
								</div>
								<table class="table table-hover table-bordered table-condensed c fs10">
									<tr class="bg-primary">
										<td><b>상품코드</b></td>
										<td><b>상품명</b></td>
										<td><b>카테고리</b></td>
										<td><b>이미지파일명</b></td>
										<td><b>가격</b></td>
										<td><b>할인조건</b></td>
									</tr>
									<c:if test="${discs!=null }">
									<c:forEach var="disc" items="discs">
										<tr>
											<%-- <td>${disc.disc_code }</td>
											<td>${disc.disc_title }</td> --%>
										<%-- 	<td>${disc.category }>${disc.getMdev() }</td> --%>
											<%-- <td>${disc.disc_image }</td> --%>
											<td>${disc.disc_price }</td>
											<td>${disc.sale_div }</td>
										</tr>
									</c:forEach>
									</c:if>
								</table>
								<div class="row c">
									<div class="disInline">
										<!--1번페이지, 앞으로 하나  -->
										<c:if test="${startPage!=1}">
											<a >
												◀◀ 
											</a>
											<a>◀ </a>
										</c:if>
										<c:forEach var="i" begin="1" end="10" >
											<a>${i}</a>
										</c:forEach>
										<!--마지막 페이지, 뒤로 하나  -->
										<c:if test="${endPage!=pageCnt}">
											<a>▶</a>
											<a>▶▶ </a>
										</c:if>
									</div>
								</div>
							</div>
							<div class="col-md-1"></div>
							<!--리스트 시작  -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</body>
</html>