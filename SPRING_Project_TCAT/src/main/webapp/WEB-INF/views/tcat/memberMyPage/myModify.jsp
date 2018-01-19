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
	   function onError(data, status){alert("error");}
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
              <table
					class="table table-hover table-bordered table-condensed c fs10">
					<tr>
               <th>아이디</th>
               <td>${vo.member_id}</td>
            </tr>
            <tr>
               <th>* 비밀번호</th>
               <td>
                  <input class="input" type="password" name="member_pwd" maxlength="10" value="${vo.member_pwd}">
               </td>
            </tr>
            <tr>
               <th>* 비밀번호 확인</th>
               <td>
                  <input class="input" type="password" name="repwd" maxlength="10" value="${vo.member_pwd}">
               </td>
            </tr>
            <tr>
               <th>* 이름</th>
               <td>
                  <input class="input" type="text" name="member_name" maxlength="20" value="${vo.member_name}">
               </td>
            </tr>
            <tr>
               <th>전화번호</th>
               <td>
                  <!-- hp데이터가 null이면 hp형식에 맞게 입력받도록 input을 만든다. -->
                  <c:if test="${vo.member_hp == null}">
                     <input class="input" type="text" name="hp1" maxlength="3" style="width: 30px" onkeyup="nextHp1();">-
                     <input class="input" type="text" name="hp2" maxlength="4" style="width: 40px" onkeyup="nextHp2();">-
                     <input class="input" type="text" name="hp3" maxlength="4" style="width: 40px" onkeyup="nextHp3();">
                  </c:if>
                  <!-- 테이블 : '010 - xxxx - xxxx' / 입력화면 : 'hp1' - 'hp2' - 'hp3' -->
                  <c:if test="${vo.member_hp != null}">
                     <c:set var="hpArr" value="${fn:split(vo.member_hp, '-')}" />
                     <input class="input" type="text" name="hp1" maxlength="3" style="width: 30px" value="${hpArr[0]}" onkeyup="nextHp1();">-
                     <input class="input" type="text" name="hp2" maxlength="4" style="width: 40px" value="${hpArr[1]}" onkeyup="nextHp1();">-
                     <input class="input" type="text" name="hp3" maxlength="4" style="width: 40px" value="${hpArr[2]}" onkeyup="nextHp1();">
                  </c:if>
               </td>
            </tr>
            <tr>
               <th>* 이메일</th>
               <td>
                  <c:set var="emailArr" value="${fn:split(vo.member_email, '@')}" />
                  <input class="input" type="text" name="email1" maxlength="10" style="width: 65px" value="${emailArr[0]}">@
                  <input class="input" type="text" name="email2" maxlength="20" style="width: 65px" value="${emailArr[1]}">
                  <select class="input" name="email3">
                     <option value="0">직접 입력</option>
                     <option value="gmail.com">구글</option>
                     <option value="daum.net">다음</option>
                     <option value="nate.com">네이트</option>
                  </select>
               </td>
            </tr>
            <tr>
               <th>가입일자</th>
               <td>
                  <fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${vo.member_joindate}"/>
               </td>
            </tr>
            <tr>
               <th colspan="2">
                  <input type="button" value="수정" onclick ="myModifySubmit('myModifyUpdate')">
                  <input type="reset" value="취소">
                  <input type="button" value="수정취소" onclick="window.history.go(-2);">
               </th>
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