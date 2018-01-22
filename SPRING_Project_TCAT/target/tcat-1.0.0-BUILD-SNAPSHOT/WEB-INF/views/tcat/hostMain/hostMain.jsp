<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
   /*탭 스크립트  */
   $('#myTab a[href="#performance"]').tab('show') // 공연상품 탭 클릭시 #myTab a[href="#performance"] 보여줌
   $('#myTab a[href="#store"]').tab('show') // Select tab by name

</script>
</head>
<body>
<!-- git test -->


	<div class="row">
		<div class="col-md-1"></div>
		
		<div class="col-md-6">
		<hr>
			<h4><b>주문 관리</b></h4>
			<table  class="h165 table-bordered c table-hover1 hand">
				<tr>
					<td><div class="h100p pt15">입금대기 <span class="badge">42</span></div></td>
					<td><div class="h100p pt15">결재완료 <span class="badge">42</span></div></td>
					<td><div class="h100p pt15">배송준비 <span class="badge">42</span></div></td>
					<td><div class="h100p pt15">배송중 <span class="badge">42</span></div></td>
				</tr>
				<tr>
					<td><div class="h100p pt15">배송완료 <span class="badge">42</span></div></td>
					<td><div class="h100p pt15">구매완료 <span class="badge">42</span></div></td>
					<td><div class="h100p pt15">환불접수 <span class="badge">42</span></div></td>
					<td><div class="h100p pt15">교환접수 <span class="badge">42</span></div></td>
				</tr>
			</table>
		</div>
		
		<div class="col-md-4">
			<hr>
			<h4><b>문의/답변관리</b></h4>
			<div class="list-group">
			  <a href="#" class="list-group-item"> SNS 후기 게시판 <span class="badge">42</span></a>
			  <a href="#" class="list-group-item"> 관람/상품 후기 <span class="badge">42</span></a>
			  <a href="#" class="list-group-item">QnA 게시판 <span class="badge">42</span></a>
			  <a href="#" class="list-group-item">1 : 1 게시판 <span class="badge">42</span></a>
			</div>
		</div>		
		
		<div class="col-md-1"></div>
	</div>
	
   <div class="row mt50">
      <div class="col-md-1"></div>
      
      <div class="col-md-10">
      <hr>
      <h4><b>주요 현황</b></h4><p class="fs8">최근 7일간 자료</p>
         <div role="tabpanel">
            <!-- 탭 네비게이션 -->
            <ul class="nav nav-tabs" role="tablist">
               <li role="presentation" class="active"><a
                  href="#performance" aria-controls="home" role="tab"
                  data-toggle="tab"
                  onclick="#">최근매출 <span class="badge">42</span></a></li>
               <li role="presentation" class="${storeActive}"><a
                  href="#store" aria-controls="profile" role="tab" data-toggle="tab"
                  onclick="#">최근주문 <span class="badge">42</span></a></li>
               <li role="presentation" class="${perActive}"><a
                  href="#performance" aria-controls="home" role="tab"
                  data-toggle="tab"
                  onclick="#">최근방문자 <span class="badge">42</span></a></li>
               <li role="presentation" class="${storeActive}"><a
                  href="#store" aria-controls="profile" role="tab" data-toggle="tab"
                  onclick="#">최근신규회원 <span class="badge">42</span></a></li>
            </ul>

            <!-- 탭시 출력 -->
            <div class="tab-content">
               <!--공연 출력  #myTab a[href="#performance"]-->
               <div role="tabpanel" class="tab-pane active" id="performance">
                  <div id="perResult">
                     <!--리스트목록  -->
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
                              <select class="m10 p5">
                                 <option value="">중분류</option>
                                 <option value="뮤지컬">뮤지컬</option>
                              </select>
                               <select class="m10 p5">
                                 <option value="">소분류</option>
                                 <option value="뮤지컬">뮤지컬</option>
                              </select>
                           </div>
                           <table
                              class="table table-hover table-bordered table-condensed c fs10">
                              <tr class="bg-primary">
                                 <td><b>아이디</b></td>
                                 <td><b>제목</b></td>
                                 <td><b>작성자</b></td>
                                 <td><b>조회수</b></td>
                                 <td><b>답글</b></td>
                                 <td><b>테스트</b></td>
                              </tr>
                              <c:forEach var="performance" items="performances">
                                 <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                    <td>6</td>
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
               <!--공연 출력  #myTab a[href="#store"]-->
               <div role="tabpanel" class="tab-pane ${storeActive }" id="store">
                  <!--리스트 시작  -->
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
                            <select class="m10 p5">
                                 <option value="">중분류</option>
                                 <option value="뮤지컬">뮤지컬</option>
                              </select>
                               <select class="m10 p5">
                                 <option value="">소분류</option>
                                 <option value="뮤지컬">뮤지컬</option>
                              </select>
                        </div>
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
                        <div class="row">
                           <div class="disInline">여기는 페이지 컨트롤러 아직 미구현</div>
                        </div>
                     </div>
                     <div class="col-md-1"></div>
                     <!--리스트 시작  -->
                  </div>
               </div>
            </div>
         </div>
      </div>
         <div class="col-md-1"></div>
	</div>	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- ------------------------------------------------------- -->


</body>
</html>