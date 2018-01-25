<%@page import="spring.project.tcat.VO.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
function pay(url){
	 
	 $( "#result" ).load( "${pageContext.request.contextPath}/"+url );
	
}
function error(){
	alert("구매할 상품이 없습니다!");
	return false;
}
</script>
<style type="text/css">
body {
	margin-top: 20px;
}
</style>
</head>
<body>
<c:if test="${pay==1}">
	<script type="text/javascript">
		alert("구매되었습니다.");
	</script>
</c:if>
<div class="container">
	<div class="row">
		<div class="col-xs-10">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">
						<div class="row">
							<div class="col-xs-6">
								<h5><span class="glyphicon glyphicon-shopping-cart"></span> 카트</h5>
							</div>
							<div class="col-xs-6">
								<button type="button" class="btn btn-primary btn-sm btn-block">
									<span class="glyphicon glyphicon-share-alt"></span> Continue shopping
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<c:forEach var="vo" items="${dtos}" >
					<!-- 데이터 -->
					<div class="row">						
						<div class="col-xs-2"><img class="img-responsive" src="${image}/store/${vo.disc_image}">
						</div>
						<div class="col-xs-4">
							<h4 class="product-name"><strong>${vo.disc_title}</strong></h4><h4><small>${vo.disc_con}</small></h4>
						</div>
						<div class="col-xs-6">
							<div class="col-xs-6 text-right">
								<h6><strong>${vo.disc_price} <span class="text-muted">x</span></strong></h6>
							</div>
							<div class="col-xs-4">
								<input type="number" class="form-control input-sm" value="${vo.cart_count}">
							</div>
							<div class="col-xs-2">
								<button type="button" class="btn btn-link btn-xs">
									<span class="glyphicon glyphicon-trash"> </span>
								</button>
							</div>
						</div>
					</div>
					<hr>
					</c:forEach>
					<div class="row">
						<div class="text-center">
							<div class="col-xs-9">
								<h6 class="text-right">쇼핑하러 가기</h6>
							</div>
							<div class="col-xs-3">
								<button type="button" class="btn btn-default btn-sm btn-block">
									스토어 메뉴로..
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<div class="row text-center">
						<div class="col-xs-9">
						<%
							ArrayList<CartVO> dtos=null;
							dtos=(ArrayList<CartVO>)request.getAttribute("dtos");
							int price=0;
						%>
							<h4 class="text-right">Total <strong><%if(dtos!=null){for(int i=0;i<dtos.size();i++){
								int count=dtos.get(i).getCart_count();
								int price2=dtos.get(i).getDisc_price();
								price+=(count*price2);
								}
							}%>
							<%=price%>
							</strong></h4>
						</div>
						<div class="col-xs-3">
							<%if(dtos!=null){ %>
							<button type="button" id="myBtn" class="btn btn-success btn-block" onclick="load('storePay');">
								구입하기
							</button>
							<%} %>
							<%if(dtos==null){ %>
							<button type="button" id="myBtn" class="btn btn-success btn-block" onclick="return error();">
								구입하기
							</button>
							<%} %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>