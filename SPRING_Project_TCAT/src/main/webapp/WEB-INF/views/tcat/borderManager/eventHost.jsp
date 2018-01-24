<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function() {
	$("#eventcheck").click(function() {
		var formData = new FormData();
		//notice_num =nextval ,writeDate=sysdate
			formData.append("notice_title",$("input[name=notice_title]").val());
			formData.append("notice_image", $("input[name=notice_image]")[0].files[0]);
			formData.append("writeDate", $("input[name=writeDate]").val());
			formData.append("contents", $("input[name=contents]").val());
			formData.append("member_id", $("input[name=member_id]").val());
			formData.append("notice_div", $("input[name=notice_div]").val());
			$.ajax({
				url : 'eventAdd',
				data : formData,
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					$('#result').html(data);
				}
			});	
	});
});
</script>

</head>
<body class="b400040">
<script>
		
$(function() {
	$("#d1").datepicker();
	
});
</script>
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
						<form action="eventAdd" id="eventAdd" method="POST">
							<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<th colspan="2"><h4>이벤트 정보를 입력하세요.</h4></th>
							</tr>
							<tr>
								<th><h5>제목</h5></th>
								<td>
								<input type="text" name="notice_title" class="form-control"
									maxlength="200">
								</td>
							</tr>
							<tr>
								<th><h5>이미지</h5></th>
								<td>
								<input type="file" name="notice_image">
								</td>
							</tr>
							
							 <tr>
								<th><h5>작성일</h5></th>
								<td>
								<input type="text" name="writeDate" class="form-control"
								id="d1" readonly>
								</td>
							</tr>
							<tr>
								<th><h5>내용</h5></th>
								<td>
								<input type="text" name="contents" class="form-control"
									maxlength="200">
								</td>
							</tr>
							<tr>
								<th><h5>작성자</h5></th>
								<td>
								<input type="text" name="member_id" class="form-control">
								</td>
							</tr>
							<tr>
								<th><h5>구분</h5></th>
								<td>
								<input type="number" name="notice_div" class="form-control">
								</td>
							</tr>
							</table>
							<button type="button" class="btn btn-info" id="eventcheck">
									등록<i class="fa fa-check spaceLeft"></i>
								</button> 
							</form>
						</div>
					<div>
					
					<br><br><br>
						<c:if test="${cnt > 0}">
						<c:forEach var="vos" items="${dtos}" >
						<h4>${vos.notice_num}</h4>
						<h4>${vos.notice_title}</h4>
						${vos.writeDate}
						<img src="${image}eventList/${vos.notice_image}">
						<h4>${vos.contents}</h4>
						<button type="button" class="btn btn-primary"
							onclick="eventUpdate('${vos.notice_num}','eventUpdate');">수정</button>
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