<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- id_emailChk 1:아이디,이메일 매치 	2: 아이디,이메일 매치x -->
	<c:if test="${id_emailChk == 1 }">
		<span class="fs10" style="color: green">인증번호를 전송하였습니다.</span>
		<input type="hidden" name="admit_num_submit" value="1">
	</c:if>
	<c:if test="${id_emailChk == 0 }">
		<span class="fs10" style="color: red">아이디가 존재하지않거나 이메일이 존재하지않습니다.</span>
		<input type="hidden" name="admit_num_submit" value="0">
	</c:if>
	
</html>