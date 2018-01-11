<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  18.01.11 태성!!  -->
<!-- 	<h3 align="center">카테고리별 상품 나열 및 우선순위</h3> -->
<br>
	<hr>
	<div class="catagory" align="center">

		<button type="button" class="btn btn-primary"
			onclick="productGet('categoryList','뮤지컬');">뮤지컬</button>
		
		<button type="button" class="btn btn-success"
			onclick="productGet('categoryList','연극');">연극</button>
		
		<button type="button" class="btn btn-info"
			onclick="productGet('categoryList','콘서트');">콘서트</button>
		
		<button type="button" class="btn btn-warning"
			onclick="productGet('categoryList','store');">스토어</button>
		
	</div>
<br>
	<!-- class="active" --회색
	class="info" --파란색
	class="success" --풀색(연두색)
	class="warning" --연노란색
	class="danger" --빨간색(다홍색) -->

	<c:if test="${category=='뮤지컬'}">
		<!-- 뮤지컬 -->
		   <div class="row">
      <div class="col-md-1"></div>
      
      <div class="col-md-10">
             <table class="table table-hover table-bordered table-condensed c fs10">
               <tr class="bg-primary">
                  <td><b>공연번호(뮤지컬)</b></td>
                  <td><b>제목</b></td>
                  <td><b>시작일</b></td>
                  <td><b>종료일</b></td>
                  <td><b>공연지역</b></td>
                  <td><b>카테고리</b></td>
                  <td><b>우선순위</b></td>
                  
               </tr>
					<c:forEach var = "dto" items="${dtos}">
						<tr>
							<td>${dto.per_id}</td>
							<td>${dto.perf_title}</td>
							<td>${dto.startdate}</td>
							<td>${dto.enddate}</td>
							<td>${dto.place_num}</td>
							<td>${dto.category}</td>
							<td><select class="input" name="first_grade" onchange="Cfirst_grade('Cfirst_grade','${category}','${dto.per_id}',this.value)">
								<option value="0">${dto.first_grade}</option>
								<option value="first_grade 01">first_grade 01</option>
								<option value="first_grade 02">first_grade 02</option>
								<option value="first_grade 03">first_grade 03</option>
								<option value="first_grade 04">first_grade 04</option>
								<option value="first_grade 05">first_grade 05</option>
							</select>
							
					</td>
					</tr>     
					</c:forEach>
	
            </table>
      </div>
      <div class="col-md-1"></div>
   </div>
   
   <!-- 페이지 컨트롤 -->
		<table style="width: 1000px" align="center">
			<tr>
				<th align="center"><c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전 블록[◀] -->
						<c:if test="${startPage > pageBlock}">
							<a href="categoryload('categoryList',${Hcnt});">[◀◀]</a>
							<a onclick="categoryload0('categoryList',${Hcnt},${startPage - pageBlock});">[◀]</a>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a href="categoryload0('categoryList',${Hcnt},${i});">[${i}]</a>
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a href="categoryload0('categoryList',${Hcnt},${startPage + pageBlock});">[▶]</a>
							<a href="categoryload0('categoryList',${Hcnt},${pageCount});">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
	</c:if>

		<!-- class="active" --회색
	class="info" --파란색
	class="success" --풀색(연두색)
	class="warning" --연노란색
	class="danger" --빨간색(다홍색) -->
	<c:if test="${category=='연극'}">
		<!-- 연극 -->
		   <div class="row">
      <div class="col-md-1"></div>
      
     <div class="col-md-10">
           <table class="table table-hover table-bordered table-condensed c fs10">
               <tr class="success
               ">
                  <td><b>공연번호(연극)</b></td>
                  <td><b>제목</b></td>
                  <td><b>시작일</b></td>
                  <td><b>종료일</b></td>
                  <td><b>공연지역</b></td>
                  <td><b>카테고리</b></td>
                  <td><b>우선순위</b></td>
                  
               </tr>
					<c:forEach var = "dto" items="${dtos}">
						<tr>
							<td>${dto.per_id}</td>
							<td>${dto.perf_title}</td>
							<td>${dto.startdate}</td>
							<td>${dto.enddate}</td>
							<td>${dto.place_num}</td>
							<td>${dto.category}</td>
							<td><select class="input" name="first_grade" onchange="Cfirst_grade('Cfirst_grade','${category}','${dto.per_id}',this.value)">
								<option value="0">${dto.first_grade}</option>
								<option value="first_grade 01">first_grade 01</option>
								<option value="first_grade 02">first_grade 02</option>
								<option value="first_grade 03">first_grade 03</option>
								<option value="first_grade 04">first_grade 04</option>
								<option value="first_grade 05">first_grade 05</option>
							</select>
					</td>
					</tr>     
					</c:forEach>
	
            </table>
      </div>
      <div class="col-md-1"></div>
   </div>
      <!-- 페이지 컨트롤 -->
		<table style="width: 1000px" align="center">
			<tr>
				<th align="center"><c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전 블록[◀] -->
						<c:if test="${startPage > pageBlock}">
							<a href="categoryload('categoryList',${Hcnt});">[◀◀]</a>
							<a onclick="categoryload0('categoryList',${Hcnt},${startPage - pageBlock});">[◀]</a>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a href="categoryload0('categoryList',${Hcnt},${i});">[${i}]</a>
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a href="categoryload0('categoryList',${Hcnt},${startPage + pageBlock});">[▶]</a>
							<a href="categoryload0('categoryList',${Hcnt},${pageCount});">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
	</c:if>
	<!-- class="active" --회색
	class="info" --파란색
	class="success" --풀색(연두색)
	class="warning" --연노란색
	class="danger" --빨간색(다홍색) -->
	<c:if test="${category=='콘서트'}">
		<!-- 콘서트 -->
		   <div class="row">
      <div class="col-md-1"></div>
      
      <div class="col-md-10">
       <table class="table table-hover table-bordered table-condensed c fs10">
               <tr class="bg-primary">
                  <td><b>공연번호(콘서트)</b></td>
                  <td><b>제목</b></td>
                  <td><b>시작일</b></td>
                  <td><b>종료일</b></td>
                  <td><b>공연지역</b></td>
                  <td><b>카테고리</b></td>
                  <td><b>우선순위</b></td>
                  
               </tr>
					<c:forEach var = "dto" items="${dtos}">
						<tr>
							<td>${dto.per_id}</td>
							<td>${dto.perf_title}</td>
							<td>${dto.startdate}</td>
							<td>${dto.enddate}</td>
							<td>${dto.place_num}</td>
							<td>${dto.category}</td>
							<td><select class="input" name="first_grade" onchange="Cfirst_grade('Cfirst_grade','${category}','${dto.per_id}',this.value)">
								<option value="0">${dto.first_grade}</option>
								<option value="first_grade 01">first_grade 01</option>
								<option value="first_grade 02">first_grade 02</option>
								<option value="first_grade 03">first_grade 03</option>
								<option value="first_grade 04">first_grade 04</option>
								<option value="first_grade 05">first_grade 05</option>
							</select>
					</td>
					</tr>     
					</c:forEach>
	
            </table>
      </div>
      <div class="col-md-1"></div>
   </div>
      <!-- 페이지 컨트롤 -->
		<table style="width: 1000px" align="center">
			<tr>
				<th align="center"><c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전 블록[◀] -->
						<c:if test="${startPage > pageBlock}">
							<a href="categoryload('categoryList',${Hcnt});">[◀◀]</a>
							<a onclick="categoryload0('categoryList',${Hcnt},${startPage - pageBlock});">[◀]</a>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a href="categoryload0('categoryList',${Hcnt},${i});">[${i}]</a>
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a href="categoryload0('categoryList',${Hcnt},${startPage + pageBlock});">[▶]</a>
							<a href="categoryload0('categoryList',${Hcnt},${pageCount});">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
	</c:if>
		<!-- class="active" --회색
	class="info" --파란색
	class="success" --풀색(연두색)
	class="warning" --연노란색
	class="danger" --빨간색(다홍색) -->
	<c:if test="${category=='store'}">
		<!-- 스토어 -->
	   <div class="row">
      <div class="col-md-1"></div>
      
      <div class="col-md-10">
            <table class="table table-hover table-bordered table-condensed c fs10">
               <tr class="warning">
               	  
                  <td><b>상품코드</b></td>
                  <td><b>상품이름</b></td>
                  <td><b>상품가격</b></td>
             	   <td><b>카테고리</b></td>
                  <td><b>우선순위</b></td>
               </tr>
             <c:forEach var = "dto" items="${dtos}">
						<tr>
							<td>${dto.disc_code}</td>
							<td>${dto.disc_title}</td>
							<td>${dto.disc_price}</td>
							<td>${dto.cateNum}</td>
							<td><select class="input" name="first_grade" onchange="Sfirst_grade('Sfirst_grade','${category}','${dto.disc_code}',this.value)">
								<option value="0">${dto.first_grade}</option>
								<option value="first_grade 01">first_grade 01</option>
								<option value="first_grade 02">first_grade 02</option>
								<option value="first_grade 03">first_grade 03</option>
								<option value="first_grade 04">first_grade 04</option>
								<option value="first_grade 05">first_grade 05</option>
							</select>
					</td>
					</tr>     
					</c:forEach>
               
            </table>
      </div>
      <div class="col-md-1"></div>
   </div>
      <!-- 페이지 컨트롤 -->
		<table style="width: 1000px" align="center">
			<tr>
				<th align="center"><c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전 블록[◀] -->
						<c:if test="${startPage > pageBlock}">
							<a href="categoryload('categoryList',${Hcnt});">[◀◀]</a>
							<a onclick="categoryload0('categoryList',${Hcnt},${startPage - pageBlock});">[◀]</a>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a href="categoryload0('categoryList',${Hcnt},${i});">[${i}]</a>
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a href="categoryload0('categoryList',${Hcnt},${startPage + pageBlock});">[▶]</a>
							<a href="categoryload0('categoryList',${Hcnt},${pageCount});">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
	</c:if>
	

</body>
</html>