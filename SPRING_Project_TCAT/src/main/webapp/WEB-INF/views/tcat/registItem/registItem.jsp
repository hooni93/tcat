<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 0111 현석 -->
	<%@include file="../hostMain/HostTop.jsp"%>
	<!-- <button onclick="registItem" value="공연정보 추가"></button>
	<button onclick="storeItem" value="스토어 재고추가"></button> -->

	<%-- <c:if test="item==null"> --%>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table
					class="table table-hover table-bordered table-condensed c fs10">
					<tr class="bg-primary">
						<td><b>번호</b></td>
						<td><b>공연제목</b></td>
						<td><b>카테고리</b></td>
						<td><b>중분류</b></td>
						<td><b>소분류</b></td>
						<td><b>공연이미지</b></td>
						<td><b>할인조건</b></td>
						<td><b>할인율</b></td>
						<td><b>시작날짜</b></td>
						<td><b>종료날짜</b></td>
						<td><b>주소</b></td>
						<td><b>상품우선순위</b></td>
						<td><b>공연스텝</b></td>
					</tr>
					<c:if test="${cnt>0}">
						<c:forEach var="dto" items="${dtos}">
							<!-- items : dtos(ArrayList)의 배열만큼 반복된다. -->
							<tr>
								<td>
									<!-- 글번호 --> ${number} <c:set var="number" value="${number-1}" />
								</td>
								<td>
									<!-- name --> ${dto.perf_title}
								</td>
								<td>
									<!-- birth --> ${dto.category}
								</td>
								<td>
									<!-- email --> ${dto.mdev}
								</td>
								<td>
									<!-- hp --> ${dto.sdev}
								</td>
								<td>
									<!-- addr --> ${dto.perf_Image}
								</td>
								<td>
									<!-- addr --> ${dto.sale_div}
								</td>
								<td>
									<!-- addr --> ${dto.sale_rate}
								</td>
								<td>
									<!-- addr --> ${dto.startdate}
								</td>
								<td>
									<!-- addr --> ${dto.enddate}
								</td>
								<td>
									<!-- addr --> ${dto.province}${dto.city}${dto.gu}${dto.address}
								</td>
								<td>
									<!-- addr --> ${dto.first_grade}
								</td>
								<td>
									<!-- addr --> ${dto.per_step}
								</td>
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
				<!-- 페이지 컨트롤 -->
				<table style="width: 1000px" align="center">
					<th align="center"><c:if test="${cnt>0}">
							<!-- 처음[◀◀]/이전블록[◀] 특수문자 :ㅁ한자키 -->
							<c:if test="${startPage>pageBlock}">
								<a href="Hmember.ho">[◀◀]</a>
								<a href="Hmember.ho?pageNum=${startPage-pageBlock}">[◀]</a>
							</c:if>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i==currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
								<c:if test="${i!=currentPage}">
									<a href="Hmember.ho?pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>

							<!-- 다음블록[▶]/끝[▶▶] -->
							<c:if test="${pageCount > endPage}">
								<a href="Hmember.ho?pageNum=${startPage+pageBlock}">[▶]</a>
								<a href="Hmember.ho?pageNum=${pageCount}">[▶▶]</a>
							</c:if>
						</c:if></th>
				</table>
				<form action="insertPerformance" name="registItemForm" method="post">
					<h2>공연정보 추가</h2>
					<table
						class="table table-hover table-bordered table-condensed c fs10">
						<tr class="bg-primary">
							<th>공연제목</th>
							<th>카테고리</th>
							<th style="width: 10%">공연이미지</th>
							<th>할인</th>
							<th>시작날짜</th>
							<th>종료날짜</th>
							<th>공연지역</th>
							<th>우선순위</th>
							<th>공연스텝</th>
							<th>회차(하루간 공연회차)</th>
							<th>좌석수</th>
						</tr>
						<tr>
							<td><input type="text" name="perf_title" style="width: 100%"></td>
							<td><select name="category" style="width: 100%">
									<option value="0">공연선택</option>
									<option value="1">뮤지컬[라이선스]</option>
									<option value="2">뮤지컬[오리지날]</option>
									<option value="3">뮤지컬[창작]</option>
									<option value="4">뮤지컬[퍼포먼스]</option>
									<option value="5">콘서트[국내]</option>
									<option value="6">콘서트[해외]</option>
									<option value="7">콘서트[페스티벌]</option>
									<option value="8">연극[대학로]</option>
									<option value="9">연극[기타지역]</option>
									<option value="10">클래식</option>
									<option value="11">발레</option>
									<option value="12">무용</option>
							</select></td>

							<td><input type="file" name="perf_Image" style="width: 100%"></td>
							<td><select name="sale" style="width: 100%">
									<option value="0">할인선택</option>
									<option value="1">장애인 1-3급[동반1인]</option>
									<option value="2">장애인 4-6급</option>
									<option value="3">vip</option>
									<option value="4">없음</option>
							</select></td>
							<td><input type="text" name="startDate" style="width: 100%"
								id="d1"></td>
							<td><input type="text" name="endDate" style="width: 100%"
								id="d2"></td>
							<td><select name="place" style="width: 100%">
									<option value="0">공연지</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
							</select></td>
							<td><select name="first_grade" style="width: 100%">
									<option value="0">우선순위</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
							</select></td>
							<td><select name="per_step" style="width: 100%">
									<option value="0">공연스텝</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
							</select></td>
							<td><input type="text" name="remain_round"
								onclick="round();" style="width: 100%"></td>
							<td><input type="text" name="remain_seat"
								style="width: 100%"></td>
							<td><input type="submit" value="추가"></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-md-1"></div>
		</div>
	<%-- </c:if> --%>

	<%-- <c:if test="item!=null">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table
					class="table table-hover table-bordered table-condensed c fs10">
					<tr class="bg-primary">
						<td><b>번호</b></td>
						<td><b>상품코드</b></td>
						<td><b>상품이름</b></td>
						<td><b>가격</b></td>
						<td><b>이미지</b></td>
						<td><b>상품설명</b></td>
						<td><b>할인조건</b></td>
						<td><b>할인율</b></td>
						<td><b>카테고리</b></td>
						<td><b>중분류</b></td>
						<td><b>소분류</b></td>
						<td><b>상품우선순위</b></td>
						<td><b>상품스텝</b></td>
					</tr>
					<c:if test="${cnt>0}">
						<c:forEach var="dto" items="${dtos}">
							<!-- items : dtos(ArrayList)의 배열만큼 반복된다. -->
							<tr>
								<td>${number}<c:set var="number" value="${number-1}" />
								</td>
								<td>${dto.disc_code}</td>
								<td>${dto.disc_title}</td>
								<td>${dto.disc_price}</td>
								<td>${dto.disc_image}</td>
								<td>${dto.disc_con}</td>
								<td>${dto.sale_div}</td>
								<td>${dto.sale_rate}</td>
								<td>${dto.category}</td>
								<td>${dto.mDev}</td>
								<td>${sDev}</td>
								<td>${dto.first_grade}</td>
								<td>${dto.disc_step}</td>
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
				<!-- 페이지 컨트롤 -->
				<table style="width: 1000px" align="center">
					<th align="center"><c:if test="${cnt>0}">
							<!-- 처음[◀◀]/이전블록[◀] 특수문자 :ㅁ한자키 -->
							<c:if test="${startPage>pageBlock}">
								<a href="Hmember.ho">[◀◀]</a>
								<a href="Hmember.ho?pageNum=${startPage-pageBlock}">[◀]</a>
							</c:if>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i==currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
								<c:if test="${i!=currentPage}">
									<a href="Hmember.ho?pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>

							<!-- 다음블록[▶]/끝[▶▶] -->
							<c:if test="${pageCount > endPage}">
								<a href="Hmember.ho?pageNum=${startPage+pageBlock}">[▶]</a>
								<a href="Hmember.ho?pageNum=${pageCount}">[▶▶]</a>
							</c:if>
						</c:if></th>
				</table>
				<form action="insertStore" name="StoreForm" method="post">
					<h2>공연상품 추가</h2>
					<table
						class="table table-hover table-bordered table-condensed c fs10">
						<tr class="bg-primary">
							<td><b>상품코드</b></td>
							<td><b>상품이름</b></td>
							<td><b>가격</b></td>
							<td><b>이미지</b></td>
							<td><b>상품설명</b></td>
							<td><b>할인조건</b></td>
							<td><b>카테고리구분번호</b></td>
							<td><b>상품우선순위</b></td>
							<td><b>상품스텝</b></td>
						</tr>
						<tr>
							<td><input type="text" name="disc_code" style="width: 100%"></td>
							<td><input type="text" name="disc_title" style="width: 100%"></td>
							<td><input type="text" name="disc_price" style="width: 100%"></td>
							<td><input type="file" name="disc_image" style="width: 100%"></td>
							<td><input type="text" name="disc_con" style="width: 100%"onclick=""></td>
							<td><select name="sale_div" style="width: 100%">
									<option value="0">할인선택</option>
									<option value="1">장애인 1-3급[동반1인]</option>
									<option value="2">장애인 4-6급</option>
									<option value="3">vip</option>
									<option value="4">없음</option>
							</select></td>
							<td><select name="cateNum" style="width: 100%">
									<option value="0">공연선택</option>
									<option value="1">뮤지컬[라이선스]</option>
									<option value="2">뮤지컬[오리지날]</option>
									<option value="3">뮤지컬[창작]</option>
									<option value="4">뮤지컬[퍼포먼스]</option>
									<option value="5">콘서트[국내]</option>
									<option value="6">콘서트[해외]</option>
									<option value="7">콘서트[페스티벌]</option>
									<option value="8">연극[대학로]</option>
									<option value="9">연극[기타지역]</option>
									<option value="10">클래식</option>
									<option value="11">발레</option>
									<option value="12">무용</option>
							</select></td>
							<td><select name="first_grade" style="width: 100%">
									<option value="0">우선순위</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
							</select></td>
							<td><select name="disc_step" style="width: 100%">
									<option value="0">상품스텝</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
							</select></td>
							<td><input type="submit" value="추가"></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-md-1"></div>
		</div>
	</c:if> --%>
	<%@include file="../hostMain/HostFooter.jsp"%>

</body>

</html>