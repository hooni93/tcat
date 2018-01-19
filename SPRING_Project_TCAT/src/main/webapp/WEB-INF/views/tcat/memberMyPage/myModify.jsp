<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../setting.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function myModifySubmit(url){   /* AJAX submit */  
	   var result = document.getElementById("result");
	   var formData = $("#myModifyForm").serialize();
	   $.ajax({
	               type : "POST",
	               url : url,
	               cache : false,
	               data : formData,
	               success :  function(msg) {
	                  $('#myPageResult').html(msg);
	                  alert("회원정보가 변경되었습니다");
	               }, 
	               error : onError
	   });
	   function onError(data, status){alert("필수 항목을 작성해 주세요!!");}
	}

function emailCheck(form){
	switch(form.email3.value){
	case  "0":
	form.email2.value="";
	form.email2.focus();
	break;
 default:
	 form.email2.value=form.email3.value;
	break;
	}
	
}
function emailCheack() {
	var email = document.memberForm.member_email.value;
	if (!email) {
		alert("이메일을 입력한뒤 인증해주세요!");
	} else {
		window.open("GuestEmailCheack?email=" + email, "confirm",
				"menubar=no, width=500, height=255");
	}
}
</script>
</head>
	<!-- class="active" --회색
	class="info" --파란색
	class="success" --풀색(연두색)
	class="warning" --연노란색
	class="danger" --빨간색(다홍색) -->
<body class="b400040">
<h3>회원정보 수정</h3>
<hr>
	<div class="row mt50">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">

					<form action="" name="myModifyForm" id="myModifyForm">
					
			<!-- 이름 -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label><span style="color:red;"></span>이름 </label>
				<h2>${vo.member_name}</h2>
			</div>
			<!-- 연락처 -------------------------------------------------------------------------------- -->	
			<!-- 비밀번호 -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="InputPassword1"><span style="color:red;">*</span> 비밀번호 </label> 
					<input type="password"
					name="member_pwd" class="form-control" id="member_pwd"
					value="${vo.member_pwd}"><span style="display: none; color: red;" id="pwdError">필수입력입니다.</span>
			</div>
			<div class="form-group">
				<label for="InputPassword2"><span style="color:red;">*</span> 비밀번호 확인</label> <input type="password"
					class="form-control" name="member_pwd1" id="member_pwdRe"
					value="${vo.member_pwd}"><span
					style="display: none; color: red;" id="errorPwd">비밀번호가 다릅니다.</span>
				<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
			</div>
			<!-- 비밀번호 -------------------------------------------------------------------------------- -->
			<!-- 연락처 -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label><span style="color:red;">*</span>연락처 </label>
				<input type="text" class="form-control" name="member_hp" id="member_hp"	value="${vo.member_hp}">
			</div>
			<!-- 연락처 -------------------------------------------------------------------------------- -->
			<!-- 주소검색 -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="username"><span style="color:red;">*</span> 주소 </label>
					<div class="input-group">
					<input type="text" class="form-control"  id="sample6_postcode" name="postNum" placeholder="우편번호">
					<span class="input-group-btn">
						<input type="button"  class="btn btn-success" onclick="sample6_execDaumPostcode();" value="우편번호 찾기"><br>
					</span>
					</div>
					<input type="text" class="form-control" name="addr" id="sample6_address" >
					<input type="text" class="form-control" name="detailAddr" id="sample6_address2" placeholder="상세주소">

				<span style="display: none; color: red;" id="addrError">필수입력입니다.</span>
			</div>	
			<!-- 주소검색 -------------------------------------------------------------------------------- -->
			<!-- 이메일 -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="username"><span style="color:red;">*</span> 이메일 인증</label>
				<div class="input-group">
					<input type="email" class="form-control" name="member_email" class="member_email" id="member_email" value="${vo.member_email}" placeholder="@를 포함한 이메일형식을 맞춰주세요">
					<span class="input-group-btn"> 
						<input type="button" class="btn btn-success" onclick="emailCheack();" value="인증번호 전송">
					</span>
				</div>
				<span style="display: none; color: red;" id="emailError">필수입력입니다.</span>
			</div>
			<!-- 이메일 -------------------------------------------------------------------------------- -->
			
			
			<div class="form-group text-center">
				<button type="button" class="btn btn-info" onclick="myModifySubmit('myModifyUpdate');">
					수정완료<i class="fa fa-check spaceLeft"></i>
				</button>
				<button type="submit" class="btn btn-warning">
					수정취소<i class="fa fa-times spaceLeft" onclick="window.history.go(-2);" ></i>
				</button>
			</div>
									
					</form>
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