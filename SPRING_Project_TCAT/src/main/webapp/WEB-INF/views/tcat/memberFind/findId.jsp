<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<input type="hidden" id="admit_code_submit" value="${id_emailChk }">
	<input type="hidden" id="member_find" value="${member_find }">
	<!-- id_emailChk 1:아이디,이메일 매치 	2: 아이디,이메일 매치x -->
	<c:if test="${id_emailChk == 1}">
		<span class="fs10" style="color: green">인증번호를 전송하였습니다.</span>
	</c:if>
	<c:if test="${id_emailChk == 0 }">
		<span class="fs10" style="color: red">아이디가 존재하지않거나 이메일이 존재하지않습니다.</span>
	</c:if>
	<!--승인 OK  -->
	<c:if test="${admit_fail == 0}">
		<script type="text/javascript">
			var member_find = $("#member_find").val();
			$("#modal_result").load("${pageContext.request.contextPath}/findResultPage?member_find="+member_find);
		</script>
	</c:if>
	<c:if test="${admit_fail==1}">
		<script type="text/javascript">
			alert("인증코드가 틀렸습니다.");
		</script>
	</c:if>
</html>