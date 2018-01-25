<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function movieMainLoad(movieurl){
	$("#movieMain_result").load("${pageContext.request.contextPath}/movieMain?movie_url="+movieurl );
}
</script>
</head>
<body>
    <div class="row">
    	<div class="col-md-12">
    	<div class="col-md-12 h20"></div>    	
    	<div class="col-md-1"></div>
    	<c:forEach var="vo" items="${dtos}" >
			<div class="col-sm-3 col-md-2">
				<div class="thumbnail" >
					<a onclick="movieMainLoad('${vo.movie_url}');"><img src="${image}performance/${vo.perf_Image}" class="img-responsive"></a>
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
						<c:if test="${sessionScope.login_id!=null}">
							<a onclick="payPerformence('Ticketing?per_id=${vo.per_id}')" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> 예매</a>
						</c:if>
						<c:if test="${sessionScope.login_id==null}">
							<a data-toggle="modal" data-target="#login-modal" id="login2" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> 예매</a>
						</c:if>
					</div>
					</div><!-- outline -->
				</div><!-- md2 -->
		</c:forEach>
		</div><!-- md12 -->

        <div class="col-md-1"></div>
	</div><!--row 끝  -->


</body>
</html>