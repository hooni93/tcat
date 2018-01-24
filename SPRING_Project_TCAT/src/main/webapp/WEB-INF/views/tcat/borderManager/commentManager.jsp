<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관람/상품 후기 게시판</title>
</script>
</head>
<body>
	<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관람/상품 후기 관리 게시판</h2>
<hr>
 <form class="navbar-form navbar-center" role="search"
               id="ajaxSubmitForm" onsubmit="return false">            
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
                  onclick="ajaxSubmit('commentManager')">검색</button>
               <!-- stocksearch(); -->
            </form>
		<div class="row">
			<div class="col-md-1"></div>

			<div class="col-md-10">
				<table
					class="table table-hover table-bordered table-condensed c fs12">
					<tr class="danger">
						<td><b>후기번호</b></td>
						<td><b>공연제목</b></td>
						<td><b>내용</b></td>
						<td><b>작성자</b></td>
						<td><b>작성일</b></td>
						<td><b>삭제</b></td>
					</tr>
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.notice_num}</td>
							<td>${dto.perf_title}</td>
						    <td>${dto.contents}</td>	
						    <td>${dto.member_id}</td>
							<td><fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd"/></td>	
							<td><input type="button" onclick="commentDelete(${dto.notice_num},'commentManger');"value="삭제"></td>					
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
							<a onclick="load('commentManager?&sDev=${sDev}&keyword=${keyword}');">[◀◀]</a>
							<a onclick="load('commentManager?&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}');">[◀]</a>				
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a onclick="load('commentManager?&pageNum=${i}&sDev=${sDev}&keyword=${keyword}');">[${i}]</a>
								
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('commentManager?&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}');">[▶]</a>
							<a onclick="load('commentManager?&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
			<div class="col-md-1"></div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>