<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 설정파일 연결 3개 -->
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">
<script src="${script}bootstrap.js"></script>
<link href="${css}style.css" rel="stylesheet" type="text/css">
 <link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>

<script type="text/javascript">

	$(function() {

		$('#datepicker').datepicker({
			dateFormat: 'yy-mm-dd',//데이터 형식 변경
			 changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		    onSelect: function(dateText, inst) { //선택한 데이터를 input박스에 넣기
		    	$( ".thumbnail" ).load( "${pageContext.request.contextPath}/daySearch?date="+dateText );
			    
		    }
		});
	});
	

</script>
</head>
<body>
<div class="row">
    	<div class="col-md-2"></div>
    	<div class="col-md-8">
		<c:forEach var="vo" items="${dtos}" >
			<div class="col-sm-3 col-md-2">
				<div class="thumbnail" >
					<img src="${image}performance/${vo.perf_Image}" style="width:150px;height:200px" class="img-responsive">
					<div class="caption">
						<h6 class="c"><label>${vo.perf_title}</label></h6>
						<h6 class="c">${vo.hall_name}</h6>
						<h6 class="c">
							<c:set var="startdate" value="${fn:split(vo.startDate,' ')}"/>
							${startdate[0]}
						</h6>
						<h6 class="c">
							<c:set var="enddate" value="${fn:split(vo.endDate,' ')}"/>
							<span> ~ </span> ${enddate[0]}
						</h6>
					</div>
					<div class="c m5">
						<a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
						<a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> 예매</a>
					</div>
					</div><!-- outline -->
				</div><!-- md2 -->
		</c:forEach>
		</div>
		<div class="col-md-2"></div>
		</div>
</body>
</html>