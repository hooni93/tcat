<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%-- <link href="${css}style.css" rel="stylesheet" type="text/css"> --%>
<%-- <link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script> --%>

</head>
<body>
	<br>
	<br>
	<div class="col-md-1"></div>

	<div class="col-md-10">
		<hr>
		<div><span>'${dto.service_title}' 의 상세 정보</span></div>
		<hr><br>
		<table class="table table-hover table-bordered table-condensed c fs12">
		
			<tr>
				<td class="bg-primary"><b>번호</b></td>
				<td>${dto.service_num}</td>
				<td class="bg-primary"><b>구분</b></td>
				<td>${dto.service_div}</td>
			</tr>
			<%-- <tr>
				<td class="bg-primary"><b>구분</b></td>
				<td>${dto.service_div}</td>
			</tr> --%>
			<tr>
				<td class="bg-primary"><b>작성자</b></td>
				<td>
					${dto.member_id}
				</td>
				<td class="bg-primary"><b>작성일</b></td>
				<td>${dto.writeDate}</td>
			</tr>
			<tr>
				<td class="bg-primary"><b>제목</b></td>
				<td colspan=3>${dto.service_title}</td>
			</tr>
			<%-- <tr>
				<td class="bg-primary"><b>질문내용</b></td>
				<td colspan=3>${dto.QuestionCon}</td>
			</tr> --%>
			
			<%-- <tr>
				<td class="bg-primary"><b>작성일</b></td>
				<td>${dto.writeDate}</td>
			</tr> --%>
			<%-- <tr>
				<td class="bg-primary"><b>답변상태</b></td>
				<td><b>${dto.AnswersStatus}</b></td>
			</tr> --%>
			
			
		</table>
	</div>

	<div class="col-md-1"></div>
</body>
</html>