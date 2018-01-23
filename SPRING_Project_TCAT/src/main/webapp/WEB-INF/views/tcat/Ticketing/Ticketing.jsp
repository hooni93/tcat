<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${css}style.css" rel="stylesheet" type="text/css">
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">
<title>Insert title here</title>
<script type="text/javascript">
function Ticketing(url){
	 $( "#Ticketing" ).load( "${pageContext.request.contextPath}/"+url );
}
$( function() {
	var per_id=${vo.per_id};
	 $( "#Ticketing" ).load( "${pageContext.request.contextPath}/chooseDay?per_id="+per_id );	
})
</script>
</head>
<body style="background-color:black">

	<div class="navbar navbar-inverse navbar-static-top">

		<div class="container">

			<a href="#" class="navbar-brand">예매</a>
			<button class="navbar-toggle" data-toggle="collapse"
				data-target=".navHeaderCollapse"></button>

			<div class="collapse navbar-collapse navHeaderCollapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="#">관람일/회차</a></li>
					<li><a href="#">좌석선택</a></li>
					<li><a href="#">할인/쿠폰</a></li>
					<li><a href="#">수령방법</a></li>
					<li><a href="#">결제방법</a></li>
				</ul>
			</div>
		</div>
	</div>


	
		<div class="row">
			<div class="col-md-2 pt-8">
			<div id="side_bar">
					<table style="border:1px solid black; margin-top:0; padding:10px; color:white">
						<tr>
							<td><img src="${image}/performance/${vo.perf_Image}" style="width:100px;margin:10px;">
							<td><c:set var="startdate" value="${fn:split(vo.startDate,' ')}"/>
								<c:set var="enddate" value="${fn:split(vo.endDate,' ')}"/>
								<b>${vo.perf_title}</b><br><br>
								${startdate[0]}<br>
								~
								${enddate[0]}<br>
							</td>
						</tr>
						<tr>
							<td colspan="2"><hr></td>				
						</tr>
					</table>
					<form action="">
						<h3>선택내역</h3>
						<table style="color:white;margin:10px;">
							<tr>
								<th>날짜</th>
								<td><input type="text" style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"value="aa" name="perDate" readonly></td>
							</tr>
							<tr>
								<th>시간</th>
								<td><input type="text" style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"value="aa" name="perDate" readonly></td>
							</tr>
							<tr>
								<th>매수</th>
								<td><input type="text" style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"value="aa" name="perDate" readonly></td>
							</tr>
							<tr>
								<th>좌석</th>
								<td><input type="text" style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"value="aa" name="perDate" readonly></td>
							</tr>
						</table>
						<br>
					</form>
				</div>
			</div>
			<div class="col-md-9 bffffff ml-2" style="height:700px;">
				
				<div id="Ticketing">
					<!-- 밑에 뿌려줄 부분 -->
					
					
				</div>
				<br>
					
					
			</div>
		</div>
	

</body>
</html>