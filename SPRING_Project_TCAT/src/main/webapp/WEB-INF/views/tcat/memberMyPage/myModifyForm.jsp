<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function PwdCheck(){
	
	var pwd = document.all.member_pwd.value;
	var url= "pwdCheck?pwd="+pwd;
	 $( "#result" ).load( "${pageContext.request.contextPath}/"+url );
	
}
</script>
</head>
<body>
	<h2>회원정보 수정 페이지</h2>
	<hr>
	<div class="row">
		<div class="col-md-5"></div>
		<div class="col-md-3">
			<table align="center" 
				class="table table-hover table-bordered table-condensed c fs10">
				<tr class="bg-primary">
					<td><strong>비밀번호</strong></td>
				</tr>

				<tr>
					<td>
						<input class="input" type="password" name="member_pwd" maxlength="50" style="width: 100px; height: 30px">
					</td>
				</tr>

				<tr>
					<td>
						<input type="button" value="정보수정" onclick ="check()">
						<input type="reset" value="취소" onclick="window.history.back();">
					</td>
				</tr>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
	
</body>
</html>