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
 <link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script src="${script}jquery-1.12.4.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">
<script>
/* 0111 현석 */
$( function() {
    $( "#d1" ).datepicker();
    $( "#d2" ).datepicker();
  } );
/* 0111 현석끝 */
</script>
<script type="text/javascript">
/* 0111 현석 */
function round(){
    window.open("remain_round", "confirm", "menubar=no, width=500, height=330");
 }
/* 0111 현석끝 */
<!-------------------------------------180111 장명훈-------------------------------------------------------->



function productGet(url,category,search,mDev,sDev,pageNum){
	var param="category="+category;
	if(search){
		param += "&search="+search;
	}
	if(mDev){
		param += "&mDev="+mDev;
	}
	if(sDev){
		param += "&sDev="+sDev;
	}
	if(pageNum){
		param += "&pageNum="+pageNum;
	}
	sendRequest(loadHost_callback,url,"get",param);
}

//ajax
function ajaxSubmit(url){   /*AJAX submit  */
   var result = document.getElementById("result");
   var formData = $("#ajaxSubmitForm").serialize();
   $.ajax({
               type : "POST",
               url : url,
               cache : false,
               data : formData,
               success :  function(msg) {
                  $('#result').html(msg);  
               }, 
               error : onError
   });
   function onError(data, status){alert("error");}
}

/*동적 리스트  */
function select_sDev(){
	/*중분류 = 소분류 배열  */
	var musical=new Array("라이선스","오리지날","창작","넌버벌 퍼포먼스");//0 1 2 3 4 5 //6
	var concert = new Array("국내뮤지션","해외뮤지션","페스티벌");
	var drama=new Array("대학로","기타");
	var classic = new Array("클래식","발레/무용","국악");
 	
	//#sDev: 소분류 셀렉트 id
	//#mDev: 중분류 셀렉트 id, onchange="select_sDev()" 추가
	//기존의 구의 값을 초기화 한다.
	$('#sDev option').remove();	//목록제거
	
	$('#sDev').append("<option value=''>전체보기</option>");//전체보기
	/*뮤지컬  */
	if($('#mDev option:selected').text()=="뮤지컬"){
		for(var i=0;i<musical.length;i++){
			$('#sDev').append("<option value="+musical[i]+">"+musical[i]+"</option>");
		}
	}
	//콘서트
	else if($('#mDev option:selected').text()=="콘서트"){
		for(var i=0;i<concert.length;i++){
			$('#sDev').append("<option value="+concert[i]+">"+concert[i]+"</option>");
		}
	} 
	//연극
	else if($('#mDev option:selected').text()=="연극"){
		for(var i=0;i<drama.length;i++){
			$('#sDev').append("<option value="+drama[i]+">"+drama[i]+"</option>");
		}
	} 
	//클래식
	else if($('#mDev option:selected').text()=="클래식"){
		for(var i=0;i<classic.length;i++){
			$('#sDev').append("<option value="+classic[i]+">"+classic[i]+"</option>");
		}
	} 
	//중분류
	else{
		$('#sDev option').remove();	
		$('#sDev').append("<option value=''>소분류</option>");
	}
 }
/////////////////////////////////180111 장명훈 끝 ///////////////////////////////////////////

/////////////////////////////////// 태성 1/9 start /////////////////////////////////////////

function categoryload(url,Hcnt){
	var params="Hcnt="+Hcnt;
 	sendRequest(category_callback,url,"GET",params); 
}
function categoryload0(url,Hcnt,pageNum){
	var params="Hcnt="+Hcnt+"&pageNum="+pageNum;
 	sendRequest(category_callback,url,"GET",params); 
}
/////////////////////////////////// 태성 1/09 end /////////////////////////////////////////

/////////////////////////////////// 태성 1/10 start /////////////////////////////////////////
function Cfirst_grade(url,category,id,first_grade){
	var params="id="+id+"&category="+category+"&first_grade="+first_grade;
 	sendRequest(category_callback,url,"GET",params);
 }
function Sfirst_grade(url,category,disc_code,first_grade){
	var params="disc_code="+disc_code+"&category="+category+"&first_grade="+first_grade;
 	sendRequest(category_callback,url,"GET",params);  
}
function category_callback(){
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
/////////////////////////////////// 태성 1/10 end /////////////////////////////////////////

function load(url){

	sendRequest(loadHost_callback,url,"POST"); 

}

function productGet(url,category,search,mDev,sDev,pageNum){
	   var param="category="+category;
	   
	   if(search){
	      param += "&search="+search;
	   }
	   if(mDev){
	      param += "&mDev="+mDev;
	   }
	   if(sDev){
	      param += "&sDev="+sDev;
	   }
	   if(pageNum){
	      param += "&pageNum="+pageNum;
	   }
	   sendRequest(loadHost_callback,url,"get",param);
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
      <a class="navbar-brand" href="hostMain_side"><b>TCAT 관리자센터</b></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">상품관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="productList_side">상품목록</a></li>
            <li class="divider"></li>
            <li><a href="categoryList_side">카테고리별 상품진열관리</a></li>
            <li><a href="hotMenu_side">핫카테고리 상품진열관리</a></li>
            <li class="divider"></li>
            <li><a href="registItem">상품등록</a></li>
            <li><a href="#">상품등록수정</a></li>
            <li><a href="stockDelete_side">상품삭제</a></li>
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
            <li><a href="join_retireMember_side">회원가입/탈퇴관리</a></li>
            <li class="divider"></li>
            <li><a href="#">휴면회원관리</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">공연/지역 관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">공연장 관리</a></li>
            <li><a href="#">지역 관리</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">게시판관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">공지사항 게시판관리</a></li>
            <li><a href="#">SNS후기 게시판관리</a></li>
            <li class="divider"></li>
            <li><a href="#">QnA 게시판관리</a></li>
            <li><a href="#">1 : 1 게시판관리</a></li>
            <li class="divider"></li>
            <li><a href="#">관람/상품후기 게시판관리</a></li>
            <li class="divider"></li>
            <li><a href="#">영상 게시판관리</a></li>
            <li><a href="#">사진 게시판관리</a></li>
          </ul>
        </li>
      </ul>

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