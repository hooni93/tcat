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
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
    function sample6_execDaumPostcode() {
    
       new daum.Postcode({
            oncomplete: function(data) {
 
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<script>
function memberSubmit(url) { /*AJAX submit  */
	var formData = $("#memberForm").serialize();
	$.ajax({
		type : "POST",
		url : url,
		cache : false,
		data : formData,
		success : function(msg) {
			$('#result').html(msg);
		},
		error : onError
	});
	function onError(data, status) {
		alert("error");
	}
}
/* $(function() {
	$("#Imember").click(function() {
		var formData = new FormData();
		formData.append("member_id", $("input[name=member_id]").val());
		formData.append("member_pwd",$("input[name=member_pwd]").val());
		formData.append("member_name",$("input[name=member_name]").val());
		formData.append("member_hp", $("input[name=member_hp]").val());
		formData.append("addr", $("input[name=addr]").val());
		formData.append("postNum", $("input[name=postNum]").val());
		formData.append("detailAddr", $("input[name=detailAddr]").val());
		formData.append("member_email",$("input[name=member_email]").val());
		formData.append("member_gender", $("input[name=member_gender]").val());
		formData.append("member_birth", $("input[name=member_birth]").val());
		$.ajax({
			url : 'insertMember',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				$('#result').html(data);
			}
		});
	});
}); */
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
	
	//로그인 모달
	$("#login").click(function(){
		$("#modal_result").load("${pageContext.request.contextPath}/memberLogin");
	});
	
});
  
function findId(){
	$("#modal_result").load("${pageContext.request.contextPath}/memberFind");
}
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
			  	  <li class="active">
			  	  	<c:if test="${login_id==null }">
			  	  		<a data-toggle="modal" data-target="#login-modal" id="login">로그인</a>
			  	  	</c:if>
			  	  	<c:if test="${login_id!=null }">
			  	  		<a href="logout">로그아웃</a>
			  	  	</c:if>
			  	  </li>
				  <li>
				  	<c:if test="${login_id==null }">
			  	  		<a onclick="load('signUp')">회원가입</a>
			  	  	</c:if>
			  	  	<c:if test="${login_id!=null }">
			  	  		<a onclick="load('myPage');">마이페이지</a>
			  	  	</c:if>
				  </li>
				  <li><a href="#">예매확인/취소</a></li>
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
			            <li> <a class="trgothic ffffff fs14px b mr20 guestMenuHover" onclick="load('musicalMain');">뮤지컬</a></li>
			            <li><a class="trgothic ffffff fs14px b mr20 guestMenuHover" onclick="load('concertMain');">콘서트</a></li>
			            <li><a class="trgothic ffffff fs14px b mr20 guestMenuHover" onclick="load('dramaMain');">연극</a></li>
			            <li><a class="trgothic ffffff fs14px b mr20 guestMenuHover" onclick="load('classicMain');">클래식</a></li>
			            <li><a class="trgothic ffffff fs14px b mr20 guestMenuHover" onclick="load('danceMain');">무용/발레</a></li>
			            <li><a class="trgothic ffffff fs14px b mr20 guestMenuHover" onclick="load('storeMain');">스토어</a></li>
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
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"  data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	<!--모달 결과창  -->
	<div class="modal-dialog" id="modal_result">
	</div>
</div>

<!--로그인창 끝  -->


</body>
</html>