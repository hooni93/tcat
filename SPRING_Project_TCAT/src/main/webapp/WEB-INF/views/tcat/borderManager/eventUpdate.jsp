<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
$(function() {
	$("#eventUp").click(function() {
		
			formData.append("notice_num", $("input[name=notice_num]").val());
			formData.append("notice_title",$("input[name=notice_title]").val());
			formData.append("contents", $("input[name=contents]").val());
			formData.append("notice_image", $("input[name=notice_image]").val());

			$.ajax({
				url : 'eventUpdateList',
				data : formData,
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					$('#result').html(data);
				}
			});
		}
}
</script>
</head>
<body class="b400040">
	<c:set var="image" value="/tcat/resources/image/" />
	<div class="row mt50">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div>
						<h2>이벤트</h2>
						<hr>
						<br>
						<form action="eventUpdateList" id="eventUpdateForm" method="POST">
							<c:forEach var="vo" items="${dto}">
								<h4>${vo.notice_num}</h4>
								<h4>타이틀</h4>
								<input type="text" name="notice_title" class="form-control"
									maxlength="200" value="${vo.notice_title}">
								<br>
								<img src="${image}eventList/${vo.notice_image}">
								<h4>내용</h4>
								<input type="text" name="contents" class="form-control"
									maxlength="200" value="${vo.contents}">
								<h4>공연이미지</h4>
								<input type="file" name="notice_image">
								<h4>(* 티켓 소진시까지 진행)</h4>
								<br>
								<br>
								<br>
							</c:forEach>
							<button type="button" class="btn btn-info" id="eventUp">
									수정완료<i class="fa fa-check spaceLeft"></i>
								</button>  
						</form>
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