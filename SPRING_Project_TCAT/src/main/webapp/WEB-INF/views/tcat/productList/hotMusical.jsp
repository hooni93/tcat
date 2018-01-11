<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
</script>
</head>
<body>

   <div class="row mt50">
      <div class="col-md-1"></div>
      <div class="col-md-10">
                     <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                           <div>
                              <!--검색  -->
                              <form class="navbar-form navbar-left" role="search">
                                 <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Search"
                                       name="keyword">
                                 </div>
                                 <button type="button" class="btn btn-default" onclick="">검색</button>
                              </form>
                              <!--카테고리  -->
                              <select id="mDev" onchange="select_sDev();">
                                 <option value="">중분류</option>
                                 <option value="콘서트">콘서트</option>
                                 <option value="뮤지컬">뮤지컬</option>
                                 <option value="연극">연극</option>
                                 <option value="클래식">클래식</option>
                              </select> 
                              <select id="sDev" onchange="select_sDev();">
                                 <option value="">소분류</option>
                                 <option value="뮤지컬">뮤지컬</option>
                              </select>
                           </div>
                           <table
                              class="table table-hover table-bordered table-condensed c fs10">
                              <tr class="bg-primary">
                                 <td><b>공연번호</b></td>
                                 <td><b>공연제목</b></td>
                                 <td><b>공연이미지</b></td>
                                 <td><b>대분류</b></td>
                                 <td><b>소분류</b></td>

                              </tr>
                              <c:forEach var="dtos" items="${dtos}">
                                 <tr>
                                    <td>${dtos.per_id}</td>
                  					<td>${dtos.perf_title}</td>
                  					<td>${dtos.perf_Image}</td>
                  					<td>${dtos.mdev}</td>
                  					<td>${dtos.sdev}</td>
                                 </tr>
                              </c:forEach>
                           </table>
                           <div>여기는 페이지 컨트롤러 아직 미구현</div>
                        </div>
                        <div class="col-md-1"></div>
                        <!--리스트목록 끝  -->

                     </div>
                  </div>
               </div>
        
</body>
</html>