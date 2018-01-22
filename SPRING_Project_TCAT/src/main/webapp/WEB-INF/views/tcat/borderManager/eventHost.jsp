<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
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
						<b>이벤트</b>
						<hr>
						<br>
						</h4>
					<div>
						<c:if test="${cnt > 0}">
						<c:forEach var="vos" items="${dtos}" >
						<h4>${vos.notice_num}</h4>
						<h4>${vos.notice_title}</h4>
						${vos.writeDate}
						<img src="${image}eventList/${vos.notice_image}">
						<h4>${vos.contents}</h4>
						<button type="button" class="btn btn-primary"
							onclick="eventUpdate('${vos.notice_num}','eventHost');">수정</button>
						<button type="button" class="btn btn-primary"
							onclick="eventDelete('${vos.notice_num}','eventHost');">삭제</button>
						<br><br><br>
						</c:forEach>
						</c:if>
						<c:if test="${cnt==0}">
						<h2>이벤트 상품이 없습니다.</h2>
						</c:if>
						<table style="width: 1000px" align="center">
							<tr>
								<th align="center"><c:if test="${cnt > 0}">
										<!-- 처음[◀◀] / 이전 블록[◀] -->
										<c:if test="${startPage > pageBlock}">
											<a
												onclick="load('eventHost?pageNum=${startPage - pageBlock}');">[◀]</a>
										</c:if>

										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<span><b>[${i}]</b></span>
											</c:if>

											<c:if test="${i != currentPage}">
												<a
													onclick="load('eventHost?pageNum=${i}');">[${i}]</a>
											</c:if>
										</c:forEach>
										<!-- 다음[▶] / 끝[▶▶] -->
										<c:if test="${pageCount > endPage}">
											<a
												onclick="load('eventHost?pageNum=${startPage + pageBlock}');">[▶]</a>
											<a
												onclick="load('eventHost?pageNum=${pageCount}');">[▶▶]</a>
										</c:if>
									</c:if></th>
							</tr>
						</table>
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