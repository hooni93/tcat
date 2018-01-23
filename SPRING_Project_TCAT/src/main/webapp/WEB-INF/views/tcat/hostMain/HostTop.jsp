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
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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
/* 0111 현석 */
$( function() {
    $( "#d1" ).datepicker();
    $( "#d2" ).datepicker();
  } );
</script>

<script type="text/javascript">
/* 0111 현석 */
  function round(){
    window.open("remain_round", "confirm", "menubar=no, width=500, height=330");
 } 

	//공연장 좌석 만들기 
	function seatMake(){
	var a=document.all.seatrow.value;
	var b=document.all.seatcolumn.value;
	var url="hallSeatMake?seatRow="+a+"&seatColumn="+b; 
	window.open(url, "hallSeat","top=50,left=100,menubar=no,location=no,toolbar=no,width=1200,height=700"); 
}

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
 
/*동적 리스트  */	///////////////////////////////수정요망***************************************
function select_sDev(){
	/*중분류 = 소분류 배열  */
	//공연 소분류
	var musical=new Array("라이선스","오리지널","창작","넌버벌 퍼포먼스")
	var concert = new Array("국내뮤지션","해외뮤지션","페스티벌");
	var drama=new Array("대학로","기타");
	var classic = new Array("클래식","무용","국악");
	//스토어 소분류
	var	music = new Array("뮤지컬OST","콘서트LIVE","클래식LIVE");
	var collection =new Array("전시컬렉션");
	//#sDev: 소분류 셀렉트 id
	//#mDev: 중분류 셀렉트 id, onchange="select_sDev()" 추가
	//기존의 구의 값을 초기화 한다.
	$('#sDev option').remove();	//목록제거
	$('#sDev').append("<option value=''>전체보기</option>");//전체보기
	/*뮤지컬  */
	if($('#mDev option:selected').text()=="뮤지컬"){
		for(var i=0;i<musical.length;i++){
			$('#sDev').append(	"<option value='"+musical[i]+"'>"+musical[i]+"</option>");
		}
	}
	//콘서트
	else if($('#mDev option:selected').text()=="콘서트"){
		for(var i=0;i<concert.length;i++){
			$('#sDev').append("<option value='"+concert[i]+"'>"+concert[i]+"</option>");
		}
	} 
	//연극
	else if($('#mDev option:selected').text()=="연극"){
		for(var i=0;i<drama.length;i++){
			$('#sDev').append("<option value='"+drama[i]+"'>"+drama[i]+"</option>");
		}
	} 
	//클래식
	else if($('#mDev option:selected').text()=="클래식"){
		for(var i=0;i<classic.length;i++){
			$('#sDev').append("<option value='"+classic[i]+"'>"+classic[i]+"</option>");
		}
	} 
	//스토어
	//음반
	else if($('#mDev option:selected').text()=="음반"){
		for(var i=0;i<music.length;i++){
			$('#sDev').append("<option value='"+music[i]+"'>"+music[i]+"</option>");
		}
	} 
	//컬렉션
	else if($('#mDev option:selected').text()=="컬렉션"){
		for(var i=0;i<collection.length;i++){
			$('#sDev').append("<option value='"+collection[i]+"'>"+collection[i]+"</option>");
		}
	} 
	//중분류
	else{
		$('#sDev option').remove();	
		$('#sDev').append("<option value=''>소분류</option>");
	}
 }
 //상세페이지 오픈
function detailOpen(category,id){
	if(category == 'performance'){//공연
		window.open('productDetail_perf?per_id='+id,'상세페이지','menubar=no,width=600px,height=600px');
	}
	if(category == 'store'){		//스토어
		window.open('productDetail_store?disc_code='+id,'상세페이지','menubar=no,width=600px,height=600px');
	}
}
/////////////////////////////////180115 장명훈 끝 ///////////////////////////////////////////

 //모든 결과를 콜백되는 load쪽으로 뿌려준다.
 //첫 페이지 hostMain [그후부터 들어오는 url에따라 result와 side_result를 바꿔준다.]
 function divSeatload(){	 
	var row=document.all.seatrow.value;
	var column=document.all.seatcolumn.value;
	var vip=document.all.VIPseat.value;
	var r=document.all.Rseat.value;
	var s=document.all.Sseat.value;
	var a=document.all.Aseat.value;
	var b=document.all.Bseat.value; 
	var url="seat_result?row="+row+"&column="+column+"&vip="+vip+"&r="+r+"&s="+s+"&a="+a+"&b="+b;
	 $( "#seat_result1" ).load( "${pageContext.request.contextPath}/"+url );
}
 
 
 function load(url){
	 
	 $( "#result" ).load( "${pageContext.request.contextPath}/"+url );	//hostPage의 오른쪽 result에 결과를 뿌려준다.
	 
	 if(url=="hostMain" || url=="join_retireMember" || url=="hotMusical" || url=="sleepMember" || url=="stockDelete_musical" || url=="stockOutOf_musical"
		 || url=="productList" || url=="orderList" || url == "productRank" || url=="categoryList" || url=="stockManagement" || url=="hallAdd" || url=="registItem" || url=="memberModified" || url =="commentManager"|| url =="eventHost"|| url =="provalMain"){
	 $( "#side_result" ).load( "${pageContext.request.contextPath}/"+url+"_side" );	//들어오는 url이 if조건에 만족할때 그에맞는 사이드페이지를 hostPage의 왼쪽 side_result쪽에 뿌려준다.
	 }
 }
 
/* 동금이 제작 */
 //공연상품삭제alert
 function stock_Delete(per_id, url){
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		load("stockDelete_Pro?per_id="+per_id+"&url="+url);
	}else{   //취소
	    return;
	}		
 }
 //스토어상품삭제alert
 function store_Delete(disc_code, url){
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		load("storeDelete_Pro?disc_code="+disc_code+"&url="+url);
	}else{   //취소
	    return;
	}		
 }
 //판매중단
 function sale_stop(disc_code, url){
	 if(confirm("판매중단을 하시겠습니까?")==true){
		 load("storeSale_stop?disc_code="+disc_code+"&url="+url);
	 }else{
		 return;
	 }
 }
 //판매중단해제
 function sale_stopRelease(disc_code, url){
	 if(confirm("중단을 해제겠습니까?")==true){
		 load("storeSale_Release?disc_code="+disc_code+"&url="+url);
	 }else{
		 return;
	 }
 }

 /* 동금이 제작 */
 
 
 /* 영민이 제작 */
	//핫리스트 삭제
	 function hotDelete(hotListSize, per_id,url){
		 alert(url);
		 if(hotListSize>1){
			 load('hotMenuDelete?Hcnt='+per_id+'&url='+url);
		 }else{
			 alert("핫리스트가 1건 입니다.");
			 alert("삭제할 수 없습니다.");
			 return false;
		 } 
	 }
	//핫리스트 업데이트
	 function hotUpdate(hotListSize, per_id,url){
		 alert(url);
		 if(hotListSize<4){
			 load('hotMenuUpdate?Hcnt='+per_id+'&url='+url);
		 }else{
			 alert("핫리스트가 꽉 찾습니다.");
			 alert("추가할 수 없습니다.");
			 return false;
		 } 
	 }
	//이벤트 삭제
	function eventDelete(notice_num,url){
		 alert(url);
		load('eventDelete?notice_num='+notice_num+'&url='+url);
	 }
	//이벤트 수정상세
	function eventUpdate(notice_num,url){
		 alert(url);
		load('eventUpdate?notice_num='+notice_num+'&url='+url);
	 }
	//이벤트 수정
	function eventUpdateList(notice_num,contents,notice_title,notice_image,url){
		 alert(url);
		load('eventUpdateList?notice_num='+notice_num+'&notice_title='+notice_title+'&contents='+contents+'&notice_image='+notice_image+'&url='+url);
	 }
	////////////////////////////
	/* function eventSubmit(url){ 
   var result = document.getElementById("result");
   var formData = $("#eventUpdateForm").serialize();
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
} */
	////////////////////////////
	//핫리스트 업데이트
	 function provalUpdate(ticket_num,url){
		 alert(url);
		load('provalUpdate?ticket_num='+ticket_num+'&url='+url);
	 }
	 /* 영민이 제작 */
	 /* 태성이 제작 */
	 function Cfirst_grade(url,category,id,first_grade){
	var params="id="+id+"&category="+category+"&first_grade="+first_grade;
 	$( "#result" ).load( "${pageContext.request.contextPath}/"+url+"?"+params);	
 }
function Sfirst_grade(url,category,disc_code,first_grade){
	var params="disc_code="+disc_code+"&category="+category+"&first_grade="+first_grade;
 	$( "#result" ).load( "${pageContext.request.contextPath}/"+url+"?"+params);	
}
function Cstep(url,category,id,per_step){
	var params="id="+id+"&category="+category+"&per_step="+per_step;
 	$( "#result" ).load( "${pageContext.request.contextPath}/"+url+"?"+params);	
 }
function Sstep(url,category,disc_code,disc_step){
	var params="disc_code="+disc_code+"&category="+category+"&disc_step="+disc_step;
 	$( "#result" ).load( "${pageContext.request.contextPath}/"+url+"?"+params);	
}
///////////////////태성 01/22 start/////////////////////////////
//관람/상품 후기 삭제 
function commentDelete(notice_num,url){
if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		load("commentDelete?notice_num="+notice_num+"&url="+url);
	}else{   //취소
	    return;
	}	
location.reload();
}
///////////////////태성 01/22 end///////////////////////////// 
	 
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
            <li><a onclick="load('productList')">상품목록</a></li>
            <li class="divider"></li>
           <li><a onclick="load('categoryList');">카테고리별 상품진열관리</a></li>
            <li><a onclick="load('hotMusical');">핫카테고리 상품진열관리</a></li>
            <li class="divider"></li>
            <li><a onclick="load('registItem');">상품등록</a></li>
            <li><a href="#">상품등록수정</a></li>
            <li><a onclick="load('stockDelete_musical');">상품삭제</a></li>
            <li class="divider"></li>
            <li><a onclick="load('stockManagement');">상품재고관리</a></li>
             <li><a onclick="load('stockOutOf_musical');">품절상품관리</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">주문관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
           <li><a onclick="load('orderList')">전체 주문 목록조회</a></li>
            <li><a onclick="load('provalMain')">주문승인관리</a></li>
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
            <li><a onclick="load('memberModified');">회원정보조회/수정</a></li>
            <li class="divider"></li>
            <li><a href="#">회원등급관리</a></li>
            <li><a href="#">회원혜택관리</a></li>
            <li class="divider"></li>
            <li><a onclick="load('join_retireMember');">회원가입/탈퇴관리</a></li>
            <li class="divider"></li>
            <li><a onclick="load('sleepMember');">휴면회원관리</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a  onclick="load('hallAdd');" role="button" aria-expanded="false">공연장 관리</a>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">게시판관리<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a onclick="load('eventHost');">공지사항 게시판관리</a></li>
            <li><a href="#">SNS후기 게시판관리</a></li>
            <li class="divider"></li>
            <li><a href="#">QnA 게시판관리</a></li>
            <li><a href="#">1 : 1 게시판관리</a></li>
            <li class="divider"></li>
            <li><a onclick="load('commentManager');">관람/상품후기 게시판관리</a></li>
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
          <a onclick="load('productRank');" role="button" aria-expanded="false">상품분석</a>
         
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