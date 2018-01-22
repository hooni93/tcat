<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>${perf.perf_title }-상세페이지</title>

<link href="${css}style.css" rel="stylesheet" type="text/css">
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<br>
	<br>
	<div class="col-md-1"></div>

	<div class="col-md-10">
		<div><span>공연 상세 정보</span></div>
		<table class="table table-hover table-bordered table-condensed c fs10">
			<tr>
				<td class="bg-primary"><b>제품 이미지</b></td>
				<td><b>${perf.getPerf_Image() } 이미지 안불러옴</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>공연코드</b></td>
				<td><b>${perf.per_id }</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>공연명</b></td>
				<td><b>${perf.perf_title }</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>카테고리</b></td>
				<td><b>
					code: ${perf.cateNum }   ( ${perf.category} > ${perf.mDev} > ${perf.sDev} )
				</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>공연기간</b></td>
				<td><b>${perf.startDate } ~ ${perf.endDate }</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>장소</b></td>
				<td><b>
					<c:if test="${!perf.province.equals('0')}">${perf.province} </c:if>
					<c:if test="${!perf.city.equals('0')}">${perf.city} </c:if>
					${perf.gu } ${perf.address }
				</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>공연장</b></td>
				<td><b> code: ${perf.hall_id }  ${perf.hall_name}</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>공연회차</b></td>
				<td><b> ${perf.remain_round }</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>좌석별 가격</b></td>
				<td><b> 아직 db 안가져옴</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>관람가능 연령</b></td>
				<td><b>${perf.possible_age }세 이상</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>상품우선순위</b></td>
				<td><b> ${perf.first_grade } (A:최고,B:우수,C:보통,D:하,E:최하,F:부적합)</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>공연스텝</b></td>
				<td><b> ${perf.per_step } (1:등록,2:핫카테고리,3:판매중단,4:판매안함)</b></td>
			</tr>
			<tr>
				<td class="bg-primary"><b>조회수</b></td>
				<td><b> ${perf.refNum }</b></td>
			</tr>
			<tr>
				<td class="bg-primary" colspan="2"><b>상품소개</b></td>
			</tr>
			<tr>
				<td colspan="2"><b>${perf.per_ex }</b></td>
			</tr>
			<tr>
				<td class="bg-primary" colspan="2"><b>추가 이미지</b></td>
			</tr>
			<tr>
				<td colspan="2"><b>${perf.getDetail_Image() }</b></td>
			</tr>
		</table>
	</div>

	<div class="col-md-1"></div>
</body>
</html>