<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
	<!--결제취소 완료  -->
	<c:if test="${buyCancelRs==1 }">
		<script type="text/javascript">
			alert("결제취소 완료되었습니다.");
			load("myPage");
		</script>
	</c:if>
	<!--결제취소 실패  -->
	<c:if test="${buyCancelRs==0 }">
		<script type="text/javascript">
			alert("결제취소 실패하였습니다.");
			load("myPage");
		</script>
	</c:if>
</html>