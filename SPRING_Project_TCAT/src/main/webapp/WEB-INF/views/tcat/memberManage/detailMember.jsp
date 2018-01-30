<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	$("#memberUp").click(function() {
		var formData = new FormData();
			formData.append("member_id", $("input[name=member_id]").val());
			formData.append("member_pwd",$("input[name=member_pwd]").val());
			formData.append("member_hp", $("input[name=member_hp]").val());
			formData.append("member_email", $("input[name=member_email]").val());
			formData.append("member_name", $("input[name=member_name]").val());
			formData.append("Rating", $("input[name=Rating]").val());
			formData.append("point", $("input[name=point]").val());
			formData.append("member_addr", $("input[name=member_addr]").val());
			$.ajax({
				url : 'detailMember_update',
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
<body>
	<div class="col-md-12 bffffff">

		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h3 align="center">고객정보 상세</h3>
				<form action="detailMember_update" id="detailMember_update" method="POST">
				<table
					class="table table-hover table-bordered table-condensed c fs10">
					<tr class="bg-primary">
						<th>아이디</th>
						<th>비밀번호</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>이름</th>
						<th>등급</th>
						<th>포인트</th>
						<th>주소</th>
						<th>수정</th>
					</tr>
					
						<c:forEach var="dto" items="${dtos}">
							<!-- items : dtos(ArrayList)의 배열만큼 반복된다. -->
							<tr>
								<td>${dto.member_id}<input type="hidden" name="member_id" value="${dto.member_id}"></td>
								<td><input type="text" name="member_pwd"
												value="${dto.member_pwd}"></td>
								<td><input type="text" name="member_hp"
												value="${dto.member_hp}"></td>
								<td><input type="text" name="member_email"
												value="${dto.member_email}"></td>
								<td><input type="text" name="member_name"
												value="${dto.member_name}"></td>
								<td><input type="text" name="Rating"
												value="${dto.getRating()}"></td>
								<td><input type="text" name="point" value="${dto.point}"></td>
								<td><input type="text" name="member_addr"
												value="${dto.member_addr}"></td>
								<td><button type="button" class="btn btn-info" id="memberUp">
									수정완료<i class="fa fa-check spaceLeft"></i>
								</button></td>
							</tr>
						</c:forEach>
					
					
				</table>
			
				</form>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</body>
</html>