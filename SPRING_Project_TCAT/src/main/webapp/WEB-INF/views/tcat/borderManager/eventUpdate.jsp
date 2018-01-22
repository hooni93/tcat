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
						<form action="" name="eventUpdateForm" id="eventUpdateForm">
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
								<h4>(* 티켓 소진시까지 진행)</h4>
								<br>
								<br>
								<br>
							</c:forEach>
							<div class="form-group text-center">
							
								<button type="button" class="btn btn-info"
									onclick="eventUpdateList('${vo.notice_num}','${vo.notice_title}','${vo.contents}','eventHost');">
									수정완료<i class="fa fa-check spaceLeft"></i>
								</button>
								<button type="submit" class="btn btn-warning">
									수정취소<i class="fa fa-times spaceLeft"
										onclick="window.history.go(-2);"></i>
								</button>
							</div>

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