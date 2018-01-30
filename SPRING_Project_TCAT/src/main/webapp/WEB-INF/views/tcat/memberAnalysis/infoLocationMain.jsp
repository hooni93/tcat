<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${css}style.css" rel="stylesheet" type="text/css">
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>

<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		var result = document.getElementById("Map");
		$(".a").load("${pageContext.request.contextPath}/infoLocation?place=경기");
		var msg="";
		msg="<img src='${image}/place/경기.PNG'>"
		result.innerHTML=msg;
	});
	function place(url,place){
		var result = document.getElementById("Map");
		$( ".a" ).load( "${pageContext.request.contextPath}/"+url );
		var msg="";
		msg="<img src='${image}/place/"+place+".PNG'>"
		result.innerHTML=msg;
	}
</script>
</head>
<body>

<div class="c m10">
	<a class="btn btn-default" onclick="place('infoLocation?place=경기','경기');" role="button">경기</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=서울','서울');" role="button">서울</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=강원','강원');" role="button">강원</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=인천','인천');" role="button">인천</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=충북','충북');" role="button">충북</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=충남','충남');" role="button">충남</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=대전','대전');" role="button">대전</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=전북','전북');" role="button">전북</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=경북','경북');" role="button">경북</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=대구','대구');" role="button">대구</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=경남','경남');" role="button">경남</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=울산','울산');" role="button">울산</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=부산','부산');" role="button">부산</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=광주','광주');" role="button">광주</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=전남','전남');" role="button">전남</a>
	<a class="btn btn-default" onclick="place('infoLocation?place=제주','제주');" role="button">제주</a>

</div>

<hr style="border:1.2px solid #dddddd"><br>
<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-2" id="Map" style=" margin-top:10px; padding:5px;">
					
				</div>
				<div class="col-md-10" style="margin-top:10px">
					<div class="a"></div>
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>

</body>
</html>