<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<div>
					<h2>포인트</h2>
					<h2>이미지 부분</h2>
					</div>

					<div>
					<h4><%=request.getSession().getAttribute("login_id") %>의 등급은</h4>
					<h4>Rating 입니다</h4>
					<h4>총 구매횟수</h4>
					<h4>buy</h4>
					
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