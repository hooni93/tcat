<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>

<!-- <link href="/tcat/resources/style.css" rel="stylesheet" type="text/css" media="screen" />  -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--리스트목록  -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
	 		<br>
			<h4>
				<b>게시판</b>
			</h4>
			<hr>
			<div>
				<table
					class="table table-hover table-bordered table-condensed c fs10">
					<tr class="bg-primary">
						<td><b>번호</b></td>
						<td><b>구분<b></td>
						<td><b>제목</b></td>
						<td><b>작성자</b></td>
						<td><b>날짜</b></td>
						<td><b>조회수</b></td>
						
					</tr>
					<c:if test="${cnt > 0}">
						<c:forEach var="dto" items="${dtos}">
							<tr>
								<td>${dto.service_num}</td>
								<td>${dto.service_div}</td>
								<td>${dto.service_title}</td>
								<td>${dto.member_id}</td>
								<td>${dto.writeDate}</td>
								<td>${dto.refNum}</td>
								
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<%-- <div class="row c">
					<div class="disInline">
						<table
							class="table table-hover table-bordered table-condensed c fs10">
							<c:if test="${cnt > 0}">
								<!-- 처음[◀◀] / 이전블록[◀] 특수문자 : ㅁ한자키 -->
								<c:if test="${startPage > pageBlock}">
									<a onclick="load('qnaBoardList')">[◀◀]</a>
									<a onclick="load('qnaBoardList?pageNum=${startPage - pageBlock}');">[◀]</a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<span><b>[${i}]</b></span>

									</c:if>

									<c:if test="${i != currentPage}">
										<a onclick="load('qnaBoardList?pageNum=${i}">[${i}]</a>
									</c:if>
								</c:forEach>

								<!-- 다음블록[▶] / 끝[▶▶] -->
								<c:if test="${pageCount > endPage}">
									<a onclick="load('qnaBoardList?pageNum=${startPage + pageBlock}');">[◀]</a>
									<a onclick="load('qnaBoardList?pageCount=${pageCount}');">[▶▶]</a>
								</c:if>
							</c:if>
						</table>
					</div>
				</div> --%>
				<!-- <div>여기는 페이지 컨트롤러 아직 미구현</div> -->
				<!--검색  -->
				<form class="navbar-form navbar-right" role="search"
					id="ajaxSubmitForm" onsubmit="return false">
					<!--카테고리  -->
					<select id="sDev" name="sDev" class="m10 p5">
						<option value="0">분류</option>
						<option value="1">공연번호</option>
						<option value="2">제목</option>
						<option value="3">카테고리번호</option>
						<option value="4">공연지역(도)</option>
						<option value="5">장소</option>
					</select>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search"
							name="keyword">
					</div>
					<button type="button" class="btn btn-default"
						onclick="ajaxSubmit('stockDelete_musical')">검색</button>
					<!-- stocksearch(); -->
				</form>

			</div>
			<br> <br> <br> <br> <br> 
		</div>
		<div class="col-md-1"></div>
	</div>
	<!--리스트목록 끝  -->
</body>
</html>