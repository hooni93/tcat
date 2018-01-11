<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* 0111 현석 */
function load(){
	var result = document.getElementById("result");
	var remain_round=document.all.remain_round.value;
	var msg ="";
	for(var i=0;i<(remain_round*1);i++){
		msg += "<select name='remain_time"+(i+1)+"'>"+
		   "	<option value='(12:00)'>(12:00)</option>"+
		   "	<option value='(13:00)'>(13:00)</option>"+
		   "	<option value='(14:00)'>(14:00)</option>"+
		   "	<option value='(15:00)'>(15:00)</option>"+
		   "	<option value='(16:00)'>(16:00)</option>"+
		   "	<option value='(17:00)'>(17:00)</option>"+
		   "	<option value='(18:00)'>(18:00)</option>"+
		   "	<option value='(19:00)'>(19:00)</option>"+
	   	   "</select><br>";
	}

	result.innerHTML=msg;
	
}
 function goBack(){
	var remain_round=document.all.remain_round.value;
	var ed="";
	for(var i=0;i<(remain_round*1);i++){
		switch(i){
		case 0:
			var a=document.all.remain_time1.value;
			ed+=(i+1)+"회차 "+a;
			break;
		case 1:
			var a=document.all.remain_time2.value;
			ed+=","+(i+1)+"회차 "+a;
			break;
		case 2:
			var a=document.all.remain_time3.value;
			ed+=","+(i+1)+"회차 "+a;
			break;
		case 3:
			var a=document.all.remain_time4.value;
			ed+=","+(i+1)+"회차 "+a;
			break;
		case 4:
			var a=document.all.remain_time5.value;
			ed+=","+(i+1)+"회차 "+a;
			break;
		case 5:
			var a=document.all.remain_time6.value;
			ed+=","+(i+1)+"회차 "+a;
			break;
		}
		
	}
	opener.document.all.remain_round.value=ed;
	self.close();
	
} 
</script>
</head>
<body>

	<div class="row">

		<div class="col-md-1"></div>
		<div class="col-md-10">
			<h3>공연회차</h3>
			<table
				class="table table-hover table-bordered table-condensed c fs10">
				<tr class="bg-primary">
					<td><b>회차[하루간공연회차]</b></td>
					<td><b>공연시간</b></td>
				</tr>
				<tr>
					<td>
						<select name="remain_round" onchange="load()">
							<option value="0">하루간 공연회차</option>
							<option value="1">1회차</option>
							<option value="2">2회차</option>
							<option value="3">3회차</option>
							<option value="4">4회차</option>
							<option value="5">5회차</option>
							<option value="6">6회차</option>
						</select>
					</td>
					<td>
						<div id="result">
						
						</div>
					</td>
					<td>
						<input type="button" onclick="goBack();">
					</td>
				</tr>
			</table>
		</div>
		<div class="col-md-1"></div>
	</div>
</body>
</html>