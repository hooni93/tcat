<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
.ticket {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	width: 700px;
	margin: 20px auto;
}

.ticket .stub, .ticket .check {
	box-sizing: border-box;
}

.stub {
	background: #ef5658;
	height: 250px;
	width: 250px;
	color: white;
	padding: 20px;
	position: relative;
	border-right: 2px dashed grey;
}

.check {
	background: #fff;
	height: 250px;
	width: 450px;
	padding: 40px;
	position: relative;
	border: 1px solid #d0d0d0;
}

.check .big {
	font-size: 50px;
	font-weight: 900;
	line-height: .8em;
}

.check .number {
	position: absolute;
	top: 50px;
	right: 50px;
	color: #ef5658;
	font-size: 40px;
}

.check .info {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: start;
	-ms-flex-pack: start;
	justify-content: flex-start;
	font-size: 12px;
	margin-top: 20px;
	width: 100%;
}

.check .info section {
	margin-right: 50px;
}

.check .info section:before {
	content: '';
	background: #ef5658;
	display: block;
	width: 40px;
	height: 3px;
	margin-bottom: 5px;
}

.check .info section .title {
	font-size: 10px;
	text-transform: uppercase;
}
</style>
</head>
<!--공백  -->
<div class="col-md-12 h50"></div>

<!--지금 예매한 영화 -->
<div class="col-md-12">


	<div class="ticket">
		<div class="stub c "
			style="background-image:url('${image}performance/perf_Image.jpg');  background-size: 100%;">
			<div>
				<input type="button" class="w40p btn btn-primary" value="예매확인"> 
				<input type="button" class="w40p btn btn-warning" value="예매취소">
			</div>
			</div>
		<div class="check">
			<div class="big">타이틀</div>
			<div class="big">
				<br> 남은 시간
			</div>
			<div class="number">2매</div>
			<div class="info">
				<section>
				<div class="title">1회차</div>
				<div>12312312</div>
				</section>
				<section>
				<div class="title">장소</div>
				<div>홀이름</div>
				</section>
				<section>
				<div class="title">티켓번호</div>
				<div>31415926</div>
				</section>
				<section>
				<div class="title">좌석</div>
				<div>31415926</div>
				</section>
			</div>
		</div>
	</div>



</div>

<!--과거 예매 영화 -->
<div class="col-md-12">
	<div class="col-md-12">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="col-md-10">
				<i class="glyphicon glyphicon-play"></i> 관람하신 공연 11개
			</div>
			<div class="col-md-2">
				<select class="w100p">
					<option>전체</option>
					<option>2018</option>
					<option>2017</option>
					<option>2016</option>
				</select>
			</div>
		</div>
		<div class="col-md-2"></div>

	</div>
	<div class="col-md-12">
		<hr style="margin-top: 10px;">
	</div>
	<div class="ticket">
		<div class="stub">이미지</div>

		<div class="check">
			<div class="big">타이틀</div>
			<div class="big">
				<br> 남은 시간
			</div>
			<div class="number">#1</div>
			<div class="info">
				<section>
				<div class="title">1회차</div>
				<div>날짜 시간</div>
				</section>
				<section>
				<div class="title">장소</div>
				<div>홀이름</div>
				</section>
				<section>
				<div class="title">티켓번호</div>
				<div>31415926</div>
				</section>
			</div>
		</div>
	</div>

	<!--더보기 -->
</div>



</html>