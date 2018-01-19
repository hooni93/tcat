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
	               }, 
	               error : onError
	               
	   });
	   alert("회원정보가 변경되었습니다");
	   function onError(data, status){alert("error");}
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
</script>
</head>
<body class="b400040">

	<div class="row mt50">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">

					<form action="" name="myModifyForm" id="myModifyForm">
						<table class="table table-hover table-bordered table-condensed c fs10" style="border:0px solid red; width:100%; height:600px; margin:auto;  text-align:center;">
							<tr >
								<th class="bg-primary"><center style="font-size: 15pt">아이디</center></th>
								<td style="font-size: 15pt" >${vo.member_id}</td>
							</tr>

							<tr>
								<th><center style="font-size: 12pt">* 비밀번호</center></th>
								<td><input class="input" type="password" name="member_pwd"
									maxlength="10" value="${vo.member_pwd}" style="width: 150px;font-size: 15pt; height: 30px"></td>
							</tr>

							<tr>
								<th><center style="font-size: 12pt">* 비밀번호 확인</center></th>
								<td><input class="input" type="password" name="repwd"
									maxlength="10" value="${vo.member_pwd}" style="width: 150px;font-size: 15pt; height: 30px"></td>
							</tr>

							<tr>
								<th><center style="font-size: 12pt">* 이름</center></th>
								<td><input class="input" type="text" name="member_name"
									maxlength="20" value="${vo.member_name}" style="width: 150px;font-size: 15pt; height: 30px"></td>
							</tr>

							<tr>
								<th><center style="font-size: 12pt">전화번호</center></th>
								<td>
									<!-- hp데이터가 null이면 hp형식에 맞게 입력받도록 input을 만든다. --> <c:if
										test="${vo.member_hp == null}">
					 <input class="input" type="text" name="hp1" maxlength="3" style="width: 80px;font-size: 15pt;height:20px"; onkeyup="nextHp1();">-
                     <input class="input" type="text" name="hp2" maxlength="4" style="width: 80px;font-size: 15pt;height:20px" onkeyup="nextHp2();">-
                     <input class="input" type="text" name="hp3" maxlength="4" style="width: 80px;font-size: 15pt;height:20px" onkeyup="nextHp3();">
									</c:if> <!-- 테이블 : '010 - xxxx - xxxx' / 입력화면 : 'hp1' - 'hp2' - 'hp3' -->
									
									<c:if test="${vo.member_hp != null}">
										<c:set var="hpArr" value="${fn:split(vo.member_hp, '-')}" />
										<input class="input" type="text" name="hp1" maxlength="3"
											style="width: 80px;font-size: 15pt;height:20px" value="${hpArr[0]}" onkeyup="nextHp1();">-
                     <input class="input" type="text" name="hp2"
											maxlength="4" style="width: 80px;font-size: 15pt;height:20px" value="${hpArr[1]}"
											onkeyup="nextHp1();">-
                     <input class="input" type="text" name="hp3"
											maxlength="4" style="width: 80px;font-size: 15pt;height:20px" value="${hpArr[2]}"
											onkeyup="nextHp1();">
									</c:if>
								</td>
							</tr>

							<tr>
								<th><center style="font-size: 12pt">* 이메일</center></th>
								<td><c:set var="emailArr"
										value="${fn:split(vo.member_email, '@')}" />
									<input class="input" type="text" name="email1" maxlength="30"style="width: 150px;font-size: 15pt;height:30px" value="${emailArr[0]}">@ 
									<input class="input" type="text" name="email2" maxlength="30" style="width: 150px;font-size: 15pt;height:30px" value="${emailArr[1]}"> 
									<select	onchange="emailCheck(this.form)" class="input" name="email3">
										<option value="0">직접 입력</option>
										<option value="gmail.com">구글</option>
										<option value="hanmail.net">다음</option>
										<option value="naver.com">네이버</option>
										<option value="nate.com">네이트</option>
										
								</select></td>
							</tr>

						
							<tr>
								<th><center style="font-size: 12pt">* 주소</center></th>
								<td><input class="input" type="text" name="member_addr"
									maxlength="100" value="${vo.member_addr}" style="width: 400px; font-size: 15pt; height: 30px"></td>
							</tr>
											


							<tr>
								<th colspan="4" align="center"><input type="button" value="수정"
									onclick="myModifySubmit('myModifyUpdate')" style="width: 80px;font-size: 15pt;height:30px" align="center"> <input
									type="reset" value="취소" style="width: 80px;font-size: 15pt;height:30px"align="center"> <input type="button"
									value="수정취소" onclick="window.history.go(-2);"style="width: 80px;font-size: 15pt;height:30px"align="center"></th>
							</tr>

						</table>
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