<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="${css}style.css" rel="stylesheet" type="text/css">
<link href="${css}bootstrap.min.css" rel="stylesheet">
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script type="text/javascript">
function load(url){
 	sendRequest(loadHost_callback,url,"post"); 
	
}
 function loadHost_callback(){
	var result = document.getElementById("result");
	
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			
			result.innerHTML=httpRequest.responseText;
			
		}else{
			result.innerHTML="에러발생";
		}
	}else{
		result.innerHTML="상태 : "+ httpRequest.readyState;
	} 
 }
</script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" onclick="load('hostMain');"><b>TCAT 관리자센터</b></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">상품관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">상품목록</a></li>
            <li class="divider"></li>
            <li><a href="#">카테고리별 상품진열관리</a></li>
            <li><a href="#">핫카테고리 상품진열관리</a></li>
            <li class="divider"></li>
            <li><a href="#">상품등록</a></li>
            <li><a href="#">상품등록수정</a></li>
            <li><a href="#">상품삭제</a></li>
            <li class="divider"></li>
            <li><a href="#">상품재고관리</a></li>
            <li><a href="#">품절상품관리</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">주문관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">전체 주문 목록조회</a></li>
            <li><a href="#">주문승인관리</a></li>
            <li><a href="#">배송관리</a></li>
            <li class="divider"></li>
            <li><a href="#">취소/교환/반품/환불관리</a></li>
            <li class="divider"></li>
            <li><a href="#">자동입금확인 관리</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">회원정보조회/수정</a></li>
            <li class="divider"></li>
            <li><a href="#">회원등급관리</a></li>
            <li><a href="#">회원혜택관리</a></li>
            <li class="divider"></li>
            <li><a href="#">회원가입/탈퇴관리</a></li>
            <li class="divider"></li>
            <li><a href="#">휴면회원관리</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">검색</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">매출분석 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">일별매출</a></li>
            <li><a href="#">주별매출</a></li>
            <li><a href="#">월별매출</a></li>
            <li class="divider"></li>
            <li><a href="#">매출집계</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">상품분석 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">판매상품순위</a></li>
            <li><a href="#">판매카테고리순위</a></li>
            <li class="divider"></li>
            <li><a href="#">취소/반품 순위</a></li>
            <li class="divider"></li>
            <li><a href="#">장바구니상품분석</a></li>
            <li><a href="#">위시리스트분석</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객분석 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">요일별분석</a></li>
            <li><a href="#">시간별분석</a></li>
            <li class="divider"></li>
            <li><a href="#">등급별분석</a></li>
            <li class="divider"></li>
            <li><a href="#">지역별분석</a></li>
            <li><a href="#">성별분석</a></li>
            <li><a href="#">연령분석</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="w100p h50"></div>

</body>
</html>