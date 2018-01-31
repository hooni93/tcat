<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function page(url) {
		$("#result").load("${pageContext.request.contextPath}/" + url);
	}
	function page(url, pageNum) {
		$("#result").load("${pageContext.request.contextPath}/" + url + "?pageNum="	+ pageNum);
	}
	function detailMember(member_id,url){
		 alert(url);
		load('detailMember?member_id='+member_id+'&url='+url);
	 }
</script>

</head>
<body>
	<div class="col-md-12 bffffff">

		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="col-md-12 h50"></div>
				<h4 class="trgothic">고객 리스트</h4>
				<div class="col-md-12 h25"></div>
				
				<table
					class="table table-hover table-bordered table-condensed c fs10">
					<tr class="bg-primary">
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>생년월일</th>
						<th>마지막 접속일</th>
						<th>등급</th>
						<th>회원가입 날짜</th>
						<th>수정</th>
					</tr>
					<c:if test="${cnt>0}">
						<c:forEach var="dto" items="${dtos}">
							<!-- items : dtos(ArrayList)의 배열만큼 반복된다. -->
							<tr>
								<td>${number}<c:set var="number" value="${number-1}" /></td>
								<td>${dto.member_id}</td>
								<td>${dto.member_name}</td>
								<td>${dto.member_gender}</td>
								<td>${dto.member_birth}</td>
								<td>${dto.lastDate}</td>
								<td>${dto.getRating()}</td>
								<td>${dto.member_joindate}</td>
								<td><button type="button" class="btn btn-primary"
											onclick="detailMember('${dto.member_id}','detailMember');">수정</button></td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- 회원이 없으면 -->
					<c:if test="${cnt==0}">
						<tr>
							<td colspan="9" align="center">회원이 없습니다.</td>
						</tr>
					</c:if>
				</table>
				<div class="col-md-5"></div>
						<div class="col-md-6">
				<!-- 페이지 컨트롤 -->
				<table style="width: 1000px" align="center">
					<th align="center"><c:if test="${cnt>0}">
							<!-- 처음[◀◀]/이전블록[◀] 특수문자 :ㅁ한자키 -->
							<c:if test="${startPage>pageBlock}">
								<a onclick="page('memberModified')">[◀◀]</a>
								<a onclick="page('memberModified','${startPage-pageBlock}')">[◀]</a>
							</c:if>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i==currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
								<c:if test="${i!=currentPage}">
									<a onclick="page('memberModified','${i}')">[${i}]</a>
								</c:if>
							</c:forEach>

							<!-- 다음블록[▶]/끝[▶▶] -->
							<c:if test="${pageCount > endPage}">
								<a onclick="page('memberModified','${startPage+pageBlock}')">[▶]</a>
								<a onclick="page('memberModified','${pageCount}')">[▶▶]</a>
							</c:if>
						</c:if></th>
				</table>
				<form class="navbar-form navbar-right" role="search"
							id="ajaxSubmitForm" onsubmit="return false">
							카테고리 
							<select id="sDev" name="sDev" class="m10 p5">
								<option value="0">분류</option>
								<option value="1">아이디</option>
								<option value="2">이름</option>
								<option value="3">성별</option>
								<option value="4">생년월일</option>
								<option value="5">등급</option>
							</select>

							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search"
									name="keyword">
							</div>
							<button type="button" class="btn btn-default"
								onclick="ajaxSubmit('memberModified')">검색</button>
				
						</form>
						</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</body>
</html>