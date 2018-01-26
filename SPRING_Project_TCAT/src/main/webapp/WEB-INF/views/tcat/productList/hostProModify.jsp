<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

</script>

</head>
<body class="b400040">

	<div class="row mt50">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">

					<h4>
						<b>상품정보 수정</b>
					</h4>
					<div>
						<hr>
					<br> <br>
					<h3>상품 전체리스트</h3>
					<div>
						<hr>
						<!-- 뮤지컬전체리스트 -->
						<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<td><b>번호</b></td>
								<td><b>공연제목</b></td>
								<td><b>카테고리</b></td>
								<td><b>공연이미지</b></td>
								<td><b>공연날짜</b></td>
								<td><b>공연장</b></td>
								<td><b>좌석별 가격확인</b></td>
								<td><b>우선순위</b></td>
								<td><b>공연스텝</b></td>
								<td><b>회차(하루간 공연회차)</b></td>
								<td><b>관람가능연령</b></td>
							</tr>
							<c:if test="${cnt > 0}">
								<c:forEach var="full" items="${full}">
									<tr>
										<td>${full.per_id}</td>
										<td>${full.perf_title}</td>
										<td>${full.mDev}</td>
										<td>${full.sDev}</td>
										<td>${full.ticet_max}</td>
										<td>${full.per_step}</td>
										<td>
												<button type="button" class="btn btn-primary"
													onclick="return hotUpdate(1,${full.per_id})">추가</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${cnt==0}">
								<tr>
									<td colspan="7" align="center">상품리스트가 없습니다.</td>
								</tr>
							</c:if>
						</table>
						<table style="width: 1000px" align="center">
							<tr>
								<th align="center"><c:if test="${cnt > 0}">
										<!-- 처음[◀◀] / 이전 블록[◀] -->
										<c:if test="${startPage > pageBlock}">
											<a
												onclick="load('hotMusical?pageNum=${startPage - pageBlock}');">[◀]</a>
										</c:if>

										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<span><b>[${i}]</b></span>
											</c:if>

											<c:if test="${i != currentPage}">
												<a
													onclick="load('hotMusical?pageNum=${i}');">[${i}]</a>
											</c:if>
										</c:forEach>
										<!-- 다음[▶] / 끝[▶▶] -->
										<c:if test="${pageCount > endPage}">
											<a
												onclick="load('hotMusical?pageNum=${startPage + pageBlock}');">[▶]</a>
											<a
												onclick="load('hotMusical?pageNum=${pageCount}');">[▶▶]</a>
										</c:if>
									</c:if></th>
							</tr>
						</table>

						

					</div>
				</div>
				<div class="col-md-1"></div>
				<!--리스트목록 끝  -->

			</div>
			<br> <br> <br> <br> <br>
		</div>
		<div class="col-md-1"></div>

	</div>

</body>
</html>