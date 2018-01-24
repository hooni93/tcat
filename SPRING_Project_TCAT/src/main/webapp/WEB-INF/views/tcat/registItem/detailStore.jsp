<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품상세소개</h2>
<form action="updateDetailStore" method="post" enctype="multipart/form-data">
<textarea rows="20" cols="100" name="per_ex">
${dto.per_ex}
</textarea>
	<br>
	추가 이미지 : <input type="file" name="Detail_Image">
	<input type="submit" value="수정">
	<input type="hidden" name="detail_num" value="${dto.detail_num}">
</form>
</body>
</html>