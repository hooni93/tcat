<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th>할인 정보 보기</th>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<th>내 등급</th>
					<td>${dto.getRating()}</td>
				</tr>
				<tr>
					<th>할인정보</th>
				</tr>
				<tr>
					<th>할인명</th>
					<th>할인율(%)</th>
					<th>설명</th>
				</tr>			
			</table>
		</td>
	</tr>
	<tr>
		<th>할인 선택</th>
	</tr>
	<tr>
		<th>
			<select>
				<option>a</option>
			</select>
		</th>
	</tr>
</table>
</body>
</html>