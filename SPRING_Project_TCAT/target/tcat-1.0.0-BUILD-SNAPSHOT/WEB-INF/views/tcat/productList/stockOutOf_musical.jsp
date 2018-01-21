<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--리스트목록  -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<br>
			<h4><b>뮤지컬품절상품관리</b></h4>
			<hr>
			<div>
				<table
				class="table table-hover table-bordered table-condensed c fs10">
				<tr class="bg-primary">
					<td><b>상품코드</b></td>
					<td><b>상품이름<b></td>
					<td><b>상품이미지</b></td>
					<td><b>상품설명</b></td>
					<td><b>상품가격</b></td>
					<td><b>상품수량</b></td>
					<td><b>카테고리</b></td>
					<td><b>중분류</b></td>
					<td><b>소분류</b></td>
					<td><b>선택</b></td>
				</tr>
				<%-- <c:if test="${cnt > 0}">
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.disc_code}</td>
							<td>${dto.disc_title}</td>
							<td>${dto.disc_image}</td>
							<td>${dto.disc_con}</td>
							<td>${dto.disc_price}</td>
							<td>${dto.disc_count}</td>
							<td>${dto.category}</td>
							<td>${dto.mDev}</td>
							<td>${dto.sDev}</td>
							<td><input type="button" onclick="store_Delete(${dto.disc_code},'stockDelete_store');"
								value="삭제"></td>
						</tr>
					</c:forEach>
				</c:if> --%>
			</table>
			<div class="row c">
				<div class="disInline">
					<table
						class="table table-hover table-bordered table-condensed c fs10">
						<c:if test="${cnt > 0}">
							<!-- 처음[◀◀] / 이전블록[◀] 특수문자 : ㅁ한자키 -->
							<c:if test="${startPage > pageBlock}">
								<a href="stockDelete_store">[◀◀]</a>
								<a href="stockDelete_store?pageNum=${startPage - pageBlock}">[◀]</a>
							</c:if>
		
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<span><b>[${i}]</b></span>
		
								</c:if>
		
								<c:if test="${i != currentPage}">
									<a href="stockDelete_store?pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>
		
							<!-- 다음블록[▶] / 끝[▶▶] -->
							<c:if test="${pageCount > endPage}">
								<a href="stockDelete_store?pageNum=${startPage + pageBlock}">[▶]</a>
								<a href="stockDelete_store?pageNum=${pageCount}">[▶▶]</a>
							</c:if>
						</c:if>
					</table>
				</div>
			</div>
			<!-- <div>여기는 페이지 컨트롤러 아직 미구현</div> -->
			<!--검색  -->
			<form class="navbar-form navbar-right" role="search" id="ajaxSubmitForm" onsubmit="return false">
				<!--카테고리  -->
				<select id="cDev" name="cDev" class="m10 p5"><!-- onchange="select_sDev();" -->
					<option value="0">분류</option>
					<option value="1">상품코드</option>
					<option value="2">제목</option>
					<option value="3">가격</option>
					<option value="4">중분류</option>
					<option value="5">소분류</option>
				</select> 
				<!-- <select id="sDev" class="m10 p5">
					<option value="">소분류</option>
					<option></option>
				</select> -->


				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search"
						name="keyword">
				</div>
				<button type="button" class="btn btn-default"
					onclick="ajaxSubmit('stockOutOf_musical')">검색</button>
			</form>

			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
		<div class="col-md-1"></div>
		<!--리스트목록 끝  -->
</body>
</html>