<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 게시판</title>
</head>
<body>
<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;후기 게시판</h2>
<hr>
<div class="commentCategory" align="center">

		<button type="button" class="btn btn-primary"
			onclick="load('commentBoard?commentCategory=공연');">공연</button>
	
		<button type="button" class="btn btn-warning"
			onclick="load('commentBoard?commentCategory=스토어');">스토어</button>

	</div>
<br>	
<c:if test="${commentCategory=='공연'}">
 <form class="navbar-form navbar-center" role="search"
               id="ajaxSubmitForm" onsubmit="return false">
               <input type="hidden" name="commentCategory" value=${commentCategory}>
            
               <!--카테고리  -->
               <select id="sDev" name="sDev" class="m10 p5">
                  <option value="0">분류</option>
                  <option value="1">후기번호</option>
                  <option value="2">작성자</option>
                  <option value="3">제목</option>
                  <option value="4">내용</option>
               </select>

               <div class="form-group">
                  <input type="text" class="form-control" placeholder="Search"
                     name="keyword">
               </div>
               <button type="button" class="btn btn-default"
                  onclick="ajaxSubmit('commentBoard')">검색</button>
               <!-- stocksearch(); -->
            </form>
		<div class="row">
			<div class="col-md-1"></div>

			<div class="col-md-10">
				<table class="table table-hover table-bordered table-condensed c fs13">
					<tr class="danger">
						<td width="100px"><b>후기번호</b></td>
						<td width="200px"><b>공연제목</b></td>
						<td width="600px"><b>내용</b></td>
						<td width="400px" ><b>작성자</b></td>
						<td width="100px"><b>작성일</b></td>
					</tr>
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.notice_num}</td>
							<td>${dto.perf_title}</td>
						    <td>${dto.contents}</td>	
						    <td>${dto.member_id}</td>
							<td><fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd"/></td>						
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
				<c:if test="${startPage > pageBlock}">
							<a onclick="load('commentBoard?commentCategory=${commentCategory}&sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
							<a onclick="load('commentBoard?commentCategory=${commentCategory}&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>				
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a onclick="load('commentBoard?commentCategory=${commentCategory}&pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
							</c:if>
						</c:forEach>
						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('commentBoard?commentCategory=${commentCategory}&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
							<a onclick="load('commentBoard?commentCategory=${commentCategory}&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
		</c:if>
		
		<c:if test="${commentCategory=='스토어'}">
 <form class="navbar-form navbar-center" role="search"
               id="ajaxSubmitForm" onsubmit="return false">
               <input type="hidden" name="commentCategory" value=${commentCategory}>
            
               <!--카테고리  -->
               <select id="sDev" name="sDev" class="m10 p5">
                  <option value="0">분류</option>
                  <option value="1">후기번호</option>
                  <option value="2">작성자</option>
                  <option value="3">제목</option>
                  <option value="4">내용</option>
               </select>

               <div class="form-group">
                  <input type="text" class="form-control" placeholder="Search"
                     name="keyword">
               </div>
               <button type="button" class="btn btn-default"
                  onclick="ajaxSubmit('commentBoard')">검색</button>
               <!-- stocksearch(); -->
            </form>
		<div class="row">
			<div class="col-md-1"></div>

			<div class="col-md-10">
				<table class="table table-hover table-bordered table-condensed c fs13">
					<tr class="warning">
						<td width="100px"><b>후기번호</b></td>
						<td width="200px"><b>상품명</b></td>
						<td width="600px"><b>내용</b></td>
						<td width="400px" ><b>작성자</b></td>
						<td width="100px"><b>작성일</b></td>
					</tr>
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.notice_num}</td>
							<td>${dto.disc_title}</td>
						    <td>${dto.contents}</td>	
						    <td>${dto.member_id}</td>
							<td><fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd"/></td>						
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
				<c:if test="${startPage > pageBlock}">
							<a onclick="load('commentBoard?commentCategory=${commentCategory}&sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
							<a onclick="load('commentBoard?commentCategory=${commentCategory}&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>				
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a onclick="load('commentBoard?commentCategory=${commentCategory}&pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
							</c:if>
						</c:forEach>
						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('commentBoard?commentCategory=${commentCategory}&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
							<a onclick="load('commentBoard?commentCategory=${commentCategory}&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
		</c:if>
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>