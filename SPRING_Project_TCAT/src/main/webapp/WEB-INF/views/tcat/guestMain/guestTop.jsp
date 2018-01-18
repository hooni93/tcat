<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tcat메인페이지</title>

<link href="${css}style.css" rel="stylesheet" type="text/css">
 <link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">
<script>
/* 0111 현석 */
$( function() {
	$( "#d1" ).datepicker();
    $( "#d2" ).datepicker();

	$("#mainMenu").mouseenter(function(){
		ShowDoSlidingDown(this); 
	});

	$("html, body").on('mousewheel DOMMouseScroll', function(e) {
			ShowDoSlidingUp(this); 
        });


	function ShowDoSlidingDown(){
		$("#inMenu").addClass("show");
		$("#inMenu").slideDown("slow");
		$("#inMenu").show("slow");
	}
	function ShowDoSlidingUp(){
		$("#inMenu").removeClass("show");
		$("#inMenu").slideUp("slow");
		$("#inMenu").hide("slow");
	}

});
  
</script>
<script type="text/javascript">



//ajax
function ajaxSubmit(url){   /* AJAX submit */  
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


function load(url){
	 
	 $( "#result" ).load( "${pageContext.request.contextPath}/"+url );	
	 
}


</script>
</head>
<body>

<div  class="w100p" id="mainMenu" >
	<div class="w100p " id="inMenu" >
		<div class="row bf5f5f5">
			<div class="col-md-1"></div>
			<div class="col-md-8 ">
 			<ol class="breadcrumb floatR fs12px h18 pt10">
			  	  <li class="active"><a data-toggle="modal" data-target="#login-modal">로그인</a></li>
				  <li><a href="#">회원가입</a></li>
				  <li><a href="#">예매확인/취소</a></li>
				  <li><a onclick="load('myPage');">마이페이지</a></li>
				  <li><a href="#">위시리스트</a></li>
				  <li><a href="#">고객센터</a></li>
				  <li><a href="#">모바일APP</a></li>  
				</ol> 
			</div>
			<div class="col-md-2">
					<div class="input-group w200 floatL pt3" id="searchGuestTop">
  					 <input type="text" class="form-control" placeholder="Search for...">
	     				 <span class="input-group-btn">
	      					 <button class="btn btn-default" type="button">Go!</button>
	     				</span>
					</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>

<div class="row  bff3333">
	 <div class="col-md-1"></div>
	 <div class="col-md-1">
	
		      <div class="container1">
		        <!-- Brand and toggle get grouped for better mobile display -->
		        
			        <div class="navbar-header">
			          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
			            <span class="sr-only">Toggle navigation</span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
			          </button>
			         
			          <a class="navbar-brand b fontAchive ffff80" onclick="load('guestMain');">TCAT</a>
			        </div>
			    </div>
			</div>
		    <div class="col-md-7">
		        <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse pt17" id="navbar-collapse-1">
			          
			          
			          <ul class=" navbar-nav navbar-right">
			            <li> <a class="trgothic ffffff fs14px b mr20 guestMenuHover" href="#">뮤지컬</a></li>
			            <li><a class="trgothic ffffff fs14px b mr20 guestMenuHover" href="#">콘서트</a></li>
			            <li><a class="trgothic ffffff fs14px b mr20 guestMenuHover" href="#">연극</a></li>
			            <li><a class="trgothic ffffff fs14px b mr20 guestMenuHover" href="#">클래식</a></li>
			            <li><a class="trgothic ffffff fs14px b mr20 guestMenuHover" href="#">무용/발레</a></li>
			            <li><a class="trgothic ffffff fs14px b mr20 guestMenuHover" href="#">스토어</a></li>
			          </ul>
			    </div><!-- /.navbar-collapse -->
			 </div>   
		 <div class="col-md-3 b333366">    
			         <div class="collapse navbar-collapse" id="navbar-collapse-1">
    
			          <ul class="nav navbar-nav">
			            <li><a class="trgothic ffffff fs14px b mr20 guestMenuHover" href="#">날짜</a></li>
			            <li><a class="trgothic ffffff fs14px b mr20 guestMenuHover" href="#">지역</a></li>

			          </ul>

			        </div><!-- /.navbar-collapse -->
			       
		     	
	     	</div>   
	</div>
   
</div>



<!--로그인 창 MODAL  -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
 	  <div class="modal-dialog">
		<div class="loginmodal-container">
			<h1>로그인하세요</h1><br>
			<form>
				<input type="text" name="user" placeholder="아이디">
				<input type="password" name="pass" placeholder="비밀번호">
				<input type="submit" name="login" class="login loginmodal-submit" value="로그인">
			</form>
			
			<div class="login-help">
				<a href="#">회원가입</a> - <a href="memberFind">아이디/비밀번호 찾기</a>
			</div>
		</div>
	</div>
</div>

<!--로그인창 끝  -->


</body>
</html>