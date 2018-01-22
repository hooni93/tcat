<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<div class="col-md-1"></div>

	<div class="col-md-10">
		<div><span>Q&A 상세 정보</span></div>
		<table class="table table-hover table-bordered table-condensed c fs10">
		<c:forEach var = "dto" items="${dto}">
			<tr>
				<td class="bg-primary"><b>번호</b></td>
				<td><b>${dto.service_num}</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>구분</b></td>
				<td><b>${dto.service_div}</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>제목</b></td>
				<td><b>${dto.service_title}</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>작성자</b></td>
				<td><b>
					${dto.member_id}
				</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>작성일</b></td>
				<td><b>${dto.writeDate}</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>답변상태</b></td>
				<td><b>${dto.AnswersStatus}</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>상품스텝</b></td>
				<td><b> ${disc.disc_step } (1:등록,2:핫카테고리,3:판매중단,4:판매안함)</b></td>
			</tr>
			<tr>
				<td class="bg-primary" colspan="2"><b>상품소개</b></td>
			</tr>
			<tr>
				<td colspan="2"><b>${disc.disc_con }</b></td>
			</tr>
			</c:forEach>
		</table>
	</div>

	<div class="col-md-1"></div>
</body>
</html>