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
function next(){
	var nextBtn=document.all.nextBtn.value;
	if(nextBtn=="관람일/회차"){
		document.all.nextBtn.value="좌석선택";
		
		 $( "#Ticketing" ).load( "${pageContext.request.contextPath}/ticketSeat?per_id="+${vo.per_id}+"&ticet_date="+document.all.ticet_date.value+"&round="+document.all.round.value);	
		
		$("#menu1").removeClass("active");
		$("#menu2").addClass("active");
		document.all.nextTest.value=2;
	}else if(nextBtn=="좌석선택"){
		document.all.nextBtn.value="할인/쿠폰";
		$("#menu2").removeClass("active");
		$("#menu3").addClass("active");
	}else if(nextBtn=="할인/쿠폰"){
		document.all.nextBtn.value="수령방법";
		$("#menu3").removeClass("active");
		$("#menu4").addClass("active");
	}else if(nextBtn=="수령방법"){
		document.all.nextBtn.value="결제방법";
		$("#menu4").removeClass("active");
		$("#menu5").addClass("active");
	}
}
</script>
<style type="text/css">
.TicketingButton {
	-moz-box-shadow:inset -5px 0px 3px -6px #9fb4f2;
	-webkit-box-shadow:inset -5px 0px 3px -6px #9fb4f2;
	box-shadow:inset -5px 0px 3px -6px #9fb4f2;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #7892c2), color-stop(1, #476e9e));
	background:-moz-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-webkit-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-o-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-ms-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#7892c2', endColorstr='#476e9e',GradientType=0);
	background-color:#7892c2;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Trebuchet MS;
	font-size:14px;
	font-weight:bold;
	padding:7px 65px;
	text-decoration:none;
	text-shadow:1px 1px 3px #283966;
}
.TicketingButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #476e9e), color-stop(1, #7892c2));
	background:-moz-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-webkit-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-o-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-ms-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#476e9e', endColorstr='#7892c2',GradientType=0);
	background-color:#476e9e;
}
.TicketingButton:active {
	position:relative;
	top:1px;
}

</style>
</head>
<body style="background-color:black">

	<div class="navbar navbar-inverse navbar-static-top">

		<div class="container">

			<a href="#" class="navbar-brand">예매</a>
			<button class="navbar-toggle" data-toggle="collapse"
				data-target=".navHeaderCollapse"></button>

			<div class="collapse navbar-collapse navHeaderCollapse">
				<ul class="nav navbar-nav navbar-right">
					<li id="menu1" class="active"><a href="#">관람일/회차</a></li>
					<li id="menu2" ><a href="#">좌석선택</a></li>
					<li id="menu3" ><a href="#">할인/쿠폰</a></li>
					<li id="menu4" ><a href="#">수령방법</a></li>
					<li id="menu5" ><a href="#">결제방법</a></li>
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
					</table>
					<hr style="color:white;margin:5px;">
					<form action="">
						<h3>선택내역</h3>
						<table style="color:white;margin:10px;">
							<tr>
								<th>날짜</th>
								<td><input type="text" style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"value="18/01/23" name="ticet_date" readonly></td>
							</tr>
							<tr>
								<th>공연회차</th>
								<td><input type="text" style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"value="1" name="round" readonly></td>
							</tr>
							<tr>
								<th>좌석타입</th>
								<td><input type="text" style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"value="aa" name="seat_type" readonly></td>
							</tr>
							<tr>
								<th>좌석</th>
								<td><input type="text" style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"value="aa" name="seat_num" readonly></td>
							</tr>
							
						</table>
						<br><br>
						<hr style="color:#fafafaf;margin:5px;">
						<h3>결제내역</h3>
						<table style="color:white;margin:10px;">
							<tr>
								<th>티켓금액</th>
								<td><input  style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="0" name="price"></td>
							</tr>
							<tr>
								<th>배송료</th>
								<td><input style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="3000" name="delpay"></td>
							</tr>
							<tr>
								<th>총금액</th>
								<td><input style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="">
							</tr>
						</table>
						<hr style="color:#fafafaf;margin:5px;">
						<table style="color:white;margin:10px;">
							<tr>
								<th>등급별 할인</th>
								<td><input style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="3000" name="delpay"></td>
							</tr>
							<tr>
								<th>상품권</th>
								<td><input style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="">
							</tr>
							<tr>
								<th>이벤트 할인</th>
								<td><input style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="">
							</tr>
							<tr>
								<th>총 할인금액</th>
								<td><input style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="">
							</tr>
						</table>
						<hr style="color:#fafafaf;margin:5px;">
						<br>
						<input style="width:100px;margin-left:10px;border:none;background-color:black;color:white;"type="text" value="최종결제금액">
						<br><br>
						<input type="button" class="TicketingButton" style="margin:5px;"value="관람일/회차" name="nextBtn" onclick="next();">
						
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