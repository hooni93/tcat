<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
					<br>
					<h4><b>호스트 멤버탈퇴 관리</b></h4>
					<hr>
			           <table class="table table-hover table-bordered table-condensed c fs10">
                           <tr class="bg-primary">
                              <td><b>상품코드</b></td>
                              <td><b>상품명</b></td>
                              <td><b>카테고리</b></td>
                              <td><b>이미지 유,무</b></td>
                              <td><b>가격</b></td>
                              <td><b>할인조건</b></td>
                           </tr>
                           <c:forEach var="performance" items="performances">
                              <tr>
                                 <td>afasdsa</td>
                                 <td>2</td>
                                 <td>3</td>
                                 <td>4</td>
                                 <td>5</td>
                                 <td>6</td>
                              </tr>
                           </c:forEach>
                        </table>
                          <!--검색  -->
							
                         
                           <form class="navbar-form navbar-right" role="search">
                             <select class="m10 p5">
                            	 <option value="">아이디</option>
                            	 <option value="">이름</option>
                          	</select>
                            <div class="form-group">
                                 <input type="text" class="form-control" placeholder="Search" name="keyword">
                             </div>
                              <button type="button" class="btn btn-default" onclick="">검색</button>
                           </form>
                             
                           <!--카테고리  -->
		
		<br>
		<br>
		<br>
		<br>
		<br>
		
		
		</div>
		<div class="col-md-1"></div>

	</div>
</body>
</html>