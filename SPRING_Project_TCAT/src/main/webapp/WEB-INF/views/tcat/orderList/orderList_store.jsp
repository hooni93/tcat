<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	$(document).ready(function(){
		//검색후돌아왔을떄
		$("option[value='${mDev}']").attr("selected","selected");
		if("${mDev}!=null"){												//중분류가 넘어오면
			$("option[value='${mDev}']").attr("selected","selected");		//해당되는 중분류를 셀렉트
			select_sDev();													//해당되는 중분류의 소분류를 뿌린다.
			if("${sDev!=null}"){											//소분류도 넘어왔으면	
				$("option[value='${sDev}']").attr("selected","selected");	//해당되는 소분류를 셀렉트
			}
		}
		if("${disc_buyStep!=null}"){
			$("option[value='${disc_buyStep}']").attr("selected","selected");
		}
		
		if("${searchCondition!=null}"){
			$("option[value='${searchCondition}']").attr("selected","selected");
		}
		
		//ajax submit enter
		$('#ajaxSubmitForm').keydown(function(e) {
	        if (e.keyCode == 13) {
	         	ajaxSubmit('orderList_store');
	        }
   		 });
		
		//구매승인
		$(".orderConfirm").click(function(){
			var disc_num = $(this).attr("name");
			var pageInfo = $(this).attr("id");
			load("orderCon?disc_num="+disc_num+pageInfo);
		});
	});
</script>
</head>
<body>
	<br>
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<br>
		<div class="fs25 blue">스토어 구입목록</div>
		<br>
		<div>
			<!--검색  -->
			<form class="navbar-form navbar-left " role="search"
				id="ajaxSubmitForm" onsubmit="return false" >
				<!--카테고리  -->
				<!--주문상태  -->
				<select name="disc_buyStep" class="btn btn-default">
					<option value="">전체</option>
					<option value="1">결제</option>
					<option  value="2">구매승인</option>
					<option   value="3">배송시작</option>
					<option   value="4">배송중</option>
					<option   value="5">배송완료</option>
					<option value="6">환불요청</option>
					<option  value="7">환불승인</option>
					<option   value="8">교환</option>
				</select>
				<select id="mDev" name="mDev" class="btn btn-default"
					onchange="select_sDev()"  >
					<option value="">중분류</option>
					<option value="음반">음반</option>
					<option value="컬렉션">컬렉션</option>
				</select>
				<select id="sDev" name="sDev" class="btn btn-default">
					<option value="">소분류</option>
				</select>
				<!--키워드 카테고리  -->
				<select name="searchCondition" class="btn btn-default">
					<option value="">전체</option>
					<option value="disc_num">구매번호</option>
					<option value="member_id">구매자 아이디</option>
					<option value="disc_title">상품명</option>
					<option value="del_name">이름</option>
					<option value="del_addr">주소</option>
					<option value="del_hp">연락처</option>
				</select>
				<!--검색창  -->
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search" name="keyword" value="${keyword}">
				</div>
				<button type="button" class="btn btn-default" onclick="ajaxSubmit('orderList_store')">검색</button>
			</form>
		</div>
		<table class="table table-hover table-bordered table-condensed c fs10">
			<tr class="bg-primary">
				<td><b>구매번호</b></td>
				<td><b>구매자 아이디</b></td>
				<td><b>상품명</b></td>
				<td><b>이름</b></td>
				<td><b>주소</b></td>
				<td><b>연락처</b></td>
				<td><b>구매상태</b></td>
				<td><b>구매날짜</b></td>
				<td><b>할인조건</b></td>
				<td class="w10p"><b>구매승인</b></td>
			</tr>
			<c:if test="${orders!=null }">
				<c:forEach var="order" items="${orders}">
					<tr>
						<td>${order.disc_num }</td>
						<td>${order.member_id }</td>
						<td>${order.disc_title }</td>
						<td>${order.del_name }</td>
						<td>${order.del_addr }</td>
						<td>${order.del_hp }</td>
						<td>
							<c:choose>
								<c:when test="${order.disc_buyStep==1 }">결제</c:when>
								<c:when test="${order.disc_buyStep==2 }">구매승인</c:when>
								<c:when test="${order.disc_buyStep==3 }">배송시작</c:when>
								<c:when test="${order.disc_buyStep==4 }">배송중</c:when>
								<c:when test="${order.disc_buyStep==5 }">배송완료</c:when>
								<c:when test="${order.disc_buyStep==6 }">환불요청</c:when>
								<c:when test="${order.disc_buyStep==7 }">환불승인</c:when>
								<c:when test="${order.disc_buyStep==8 }">교환</c:when>
							</c:choose>
						</td>
						<td>${order.disc_buyDate }</td>
						<td>${order.sale_div } (${order.sale_rate }%)</td>
						<td>
							<c:if test="${order.disc_buyStep==1}">
								<input name="${order.disc_num }" type="button" value="구매승인"
								id="&searchCondition=${searchCondition }&disc_buyStep=${disc_buyStep}&keyword=${keyword}&mDev=${mDev}&sDev=${sDev}&pageNum=${currentPage}"
								class="btn btn-primary orderConfirm">
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${orders==null }">
				<tr><td colspan="11" class="h550 ">
				<span class="tm fs15">검색결과가 없습니다.</span>
				</td></tr>
			</c:if>
		</table>
		<c:if test="${orders!=null }">
		<div class="row c">
			<div class="disInline">
				<!--1번페이지, 앞으로 하나  -->
				<c:if test="${currentPage!=1}">
					<a	onclick="load('orderList_store?searchCondition=${searchCondition }&disc_buyStep=${disc_buyStep}&keyword=${keyword}&mDev=${mDev}&sDev=${sDev}&pageNum=1')">
						◀◀ </a>
					<a	onclick="load('orderList_store?searchCondition=${searchCondition }&disc_buyStep=${disc_buyStep}&keyword=${keyword}&mDev=${mDev}&sDev=${sDev}&pageNum=${currentPage-1}')">
						◀ </a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage }">
						<a class="red" onclick="load('orderList_store?searchCondition=${searchCondition }&disc_buyStep=${disc_buyStep}&keyword=${keyword}&mDev=${mDev}&sDev=${sDev}&pageNum=${i}')">
							${i} </a>
					</c:if>
					<c:if test="${i != currentPage }">
						<a onclick="load('orderList_store?searchCondition=${searchCondition }&disc_buyStep=${disc_buyStep}&keyword=${keyword}&mDev=${mDev}&sDev=${sDev}&pageNum=${i}')">
							${i} </a>
					</c:if>
				</c:forEach>
				<!--마지막 페이지, 뒤로 하나  -->
				<c:if test="${currentPage!=pageCnt}">
					<a	onclick="load('orderList_store?searchCondition=${searchCondition }&disc_buyStep=${disc_buyStep}&keyword=${keyword}&mDev=${mDev}&sDev=${sDev}&pageNum=${currentPage+1}')">
						▶ </a>
					<a	onclick="load('orderList_store?searchCondition=${searchCondition }&disc_buyStep=${disc_buyStep}&keyword=${keyword}&mDev=${mDev}&sDev=${sDev}&pageNum=${pageCnt}')">
						▶▶ </a>
						
				</c:if>
			</div>
		</div>
		</c:if>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<div class="col-md-1"></div>
	<!--리스트목록 끝  -->
</body>
</html>