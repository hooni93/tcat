<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body class="b400040">
	<%@include file="../hostMain/HostTop.jsp"%>
	<!-- <button onclick="registItem" value="공연정보 추가"></button>
	<button onclick="storeItem" value="스토어 재고추가"></button> -->
	<div class="row">
		<div class="col-md-2">
			<ul class="nav nav-pills nav-stacked">
				<li class="b400040 h50"></li>
				<li class="b400040"><a href="registItem">공연정보 추가</a></li>
				<li class="b400040"><a href="storeItem">스토어 재고 추가</a></li>
			</ul>
		</div>
		<div class="col-md-10 bffffff">
		<c:if test="${item!=1}">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
				<form action="insertPerformance" name="registItemForm"
						method="post" enctype="multipart/form-data">
						<input type="hidden" name="per_step" value="1">
						<h3>공연정보 추가</h3>
						<table class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<th>공연제목</th>
								<th>카테고리</th>
								<th style="width:15%">공연이미지</th>
								<th style="width:10%">할인</th>
								<th style="width:10%">시작날짜</th>
								<th style="width:10%">종료날짜</th>
								<th>공연지역</th>
								<th>우선순위</th>
								<th>회차(하루간 공연회차)</th>
								<th style="width:5%">좌석수</th>
								<th></th>
							</tr>
							<tr>
								<td><input type="text" name="perf_title"
									style="width: 100%"></td>
								<td><select name="category" style="width: 100%">
										<option value="0">공연선택</option>
										<option value="1">뮤지컬[라이선스]</option>
										<option value="2">뮤지컬[오리지날]</option>
										<option value="3">뮤지컬[창작]</option>
										<option value="4">뮤지컬[퍼포먼스]</option>
										<!-- <option value="5">콘서트[국내]</option>
									<option value="6">콘서트[해외]</option>
									<option value="7">콘서트[페스티벌]</option>
									<option value="8">연극[대학로]</option>
									<option value="9">연극[기타지역]</option>
									<option value="10">클래식</option>
									<option value="11">발레</option>
									<option value="12">무용</option> -->
								</select></td>

								<td><input type="file" name="perf_Image"
									style="width: 100%"></td>
								<td><select name="sale" style="width: 100%">
										<option value="선택">할인선택</option>
										<option value="학생">학생</option>
										<option value="경로">경로</option>
										<option value="VIP">VIP</option>
										<!-- <option value="0">할인선택</option>
									<option value="1">장애인 1-3급[동반1인]</option>
									<option value="2">장애인 4-6급</option>
									<option value="3">vip</option>
									<option value="4">없음</option> -->
								</select></td>
								<td><input type="text" name="startDate" style="width: 100%"
									id="d1" readonly></td>
								<td><input type="text" name="endDate" style="width: 100%"
									id="d2" readonly></td>
								<td><select name="place" style="width: 100%">
										<option value="0">공연지</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<!-- <option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option> -->
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
								
								
								<td><input type="text" name="remain_round"
									onclick="round();" style="width: 100%" readonly></td>
								<td><input type="text" name="remain_seat"
									style="width: 100%"></td>
								<td><input type="submit" value="추가"></td>
							</tr>
						</table>
					</form>
					<h3 align="center">공연정보 리스트</h3>
					<table
						class="table table-hover table-bordered table-condensed c fs10">
						<tr class="bg-primary">
							<td><b>번호</b></td>
							<td><b>공연제목</b></td>
							<td><b>중분류</b></td>
							<td><b>소분류</b></td>
							<td><b>공연이미지</b></td>
							<td><b>할인조건</b></td>
							<td><b>할인율</b></td>
							<td><b>시작날짜</b></td>
							<td><b>종료날짜</b></td>
							<td><b>공연지 주소</b></td>
							<td><b>상품우선순위</b></td>
						</tr>
						<c:if test="${cnt>0}">
							<c:forEach var="dto" items="${dtos}">
								<!-- items : dtos(ArrayList)의 배열만큼 반복된다. -->
								<tr>
									<td>
										 ${number} <c:set var="number" value="${number-1}" />
									</td>
									<td>
										${dto.perf_title}
									</td>
									<td>
										${dto.mdev}
									</td>
									<td>
										${dto.sdev}
									</td>
									<td>
										<img src="/tcat/resources/image/performance/${dto.perf_Image}" style="width:50px; height:50px;">
									</td>
									<td>
										${dto.sale_div}
									</td>
									<td>
										${dto.sale_rate}
									</td>
									<td>
										${dto.startdate}
									</td>
									<td>
										${dto.enddate}
									</td>
									<td>
										${dto.province}&nbsp${dto.city}&nbsp${dto.gu}&nbsp${dto.address}
									</td>
									<td>
										${dto.first_grade}
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
									<a onclick="window.location='registItem'">[◀◀]</a>
									<a onclick="window.location='registItem?pageNum=${startPage-pageBlock}'">[◀]</a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i==currentPage}">
										<span><b>[${i}]</b></span>
									</c:if>
									<c:if test="${i!=currentPage}">
										<a onclick="window.location='registItem?pageNum=${i}'">[${i}]</a>
									</c:if>
								</c:forEach>

								<!-- 다음블록[▶]/끝[▶▶] -->
								<c:if test="${pageCount > endPage}">
									<a onclick="window.location='registItem?pageNum=${startPage+pageBlock}'">[▶]</a>
									<a onclick="window.location='registItem?pageNum=${pageCount}'">[▶▶]</a>
								</c:if>
							</c:if></th>
					</table>
					
				</div>
				<div class="col-md-1"></div>
			</div>
		</c:if>

		<c:if test="${item==1}">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
				<form action="insertStore" name="StoreForm" method="post" enctype="multipart/form-data">
						<h3>스토어 상품 추가</h3>
						<input type="hidden" name="disc_step" value="1">
						<table
							class="table table-hover table-bordered table-condensed c fs10">
							<tr class="bg-primary">
								<td style="width:6%"><b>상품코드</b></td>
								<td><b>상품이름</b></td>
								<td style="width:10%"><b>가격</b></td>
								<td style="width:16%"><b>이미지</b></td>
								<td><b>상품설명</b></td>
								<td><b>할인조건</b></td>
								<td><b>카테고리구분번호</b></td>
								<td><b>상품우선순위</b></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="text" name="disc_code" style="width: 100%"></td>
								<td><input type="text" name="disc_title"
									style="width: 100%"></td>
								<td><input type="text" name="disc_price"
									style="width: 100%"></td>
								<td><input type="file" name="disc_image"
									style="width: 100%"></td>
								<td><input type="text" name="disc_con" style="width: 100%"
									onclick=""></td>
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
								<td><input type="submit" value="추가"></td>
							</tr>
						</table>
					</form>
					<h3 align="center">스토어 상품 리스트</h3>
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
							<td><b>중분류</b></td>
							<td><b>소분류</b></td>
							<td><b>상품우선순위</b></td>
							
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
									<td><img src="/tcat/resources/image/performance/${dto.disc_image}" style="width:50px; height:50px;"></td>
									<td>${dto.disc_con}</td>
									<td>${dto.sale_div}</td>
									<td>${dto.sale_rate}</td>
									<td>${dto.mDev}</td>
									<td>${sDev}</td>
									<td>${dto.first_grade}</td>
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
									<a onclick="window.location='storeItem'">[◀◀]</a>
									<a onclick="window.location='storeItem?pageNum=${startPage-pageBlock}'">[◀]</a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i==currentPage}">
										<span><b>[${i}]</b></span>
									</c:if>
									<c:if test="${i!=currentPage}">
										<a onclick="window.location='storeItem?pageNum=${i}'">[${i}]</a>
									</c:if>
								</c:forEach>

								<!-- 다음블록[▶]/끝[▶▶] -->
								<c:if test="${pageCount > endPage}">
									<a onclick="window.location='storeItem?pageNum=${startPage+pageBlock}'">[▶]</a>
									<a onclick="window.location='storeItem?pageNum=${pageCount}'">[▶▶]</a>
								</c:if>
							</c:if></th>
					</table>
					
				</div>
				<div class="col-md-1"></div>
			</div>
		</c:if>
		</div>
	</div>
	<%@include file="../hostMain/HostFooter.jsp"%>
</body>

</html>