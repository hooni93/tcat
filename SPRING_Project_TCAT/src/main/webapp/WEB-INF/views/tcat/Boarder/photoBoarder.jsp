<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$("#photoBoarderLogin").click(function(){
	$("#modal_result").load("${pageContext.request.contextPath}/memberLogin");
});

$("#insertPhotoBoarder").click(function(){
	var formData = new FormData();
	if(!$("input[name=no_title]").val()){
	alert("작성자 이름을 입력하시오");
	$("input[name=no_title]").focus();
	}else if(!$("input[name=board_Image]")[0].files[0]){
		alert("이미지를 넣어주세요");
		$("input[name=board_Image]").focus();
	}else{
		formData.append("no_title",$("input[name=no_title]").val());
		formData.append("mem_id",$("input[name=mem_id]").val());
		formData.append("no_content",$("input[name=no_content]").val());
		formData.append("category",$("input[name=categoryNum]").val());
		formData.append("board_Image",$("input[name=board_Image]")[0].files[0]);
		$.ajax({
			url : 'insertPhotoBoarder',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				$('#result').html(data);
			}
		});	
	}
	
});
$("#noMoPhotoBoarder").click(function(){
	var formData = new FormData();
	if(!$("input[name=noMo_title]").val()){
	alert("제목을 입력하시오");
	$("input[name=noMo_title]").focus();
	}else{
		formData.append("noMo_title",$("input[name=noMo_title]").val());
		formData.append("monotice_num",$("input[name=monotice_num]").val());
		formData.append("noMo_content",$("input[name=noMo_content]").val());
		formData.append("category",$("input[name=categoryNum]").val());
		formData.append("noMoboard_Image",$("input[name=noMoboard_Image]")[0].files[0]);
		$.ajax({
			url : 'noMoPhotoBoarder',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				$('#result').html(data);
			}
		});	
	}
	
});
	




function photoBoarderCommentWrite(member_id,notice_num,category,form){
	  var contents=form.contents.value; 
	  var url="photoBoarderCommentWrite?member_id="+member_id+"&notice_num="+notice_num+"&contents="+contents+"&category="+category;
	$( "#result" ).load( "${pageContext.request.contextPath}/"+url );  
}


</script>
</head>
<body>
<div class="container">
    <div class="row">
    <div class="col-md-12 h25"></div>
    <h4><b>공연 사진 게시판</b></h4>
			<hr>
    	<input type="hidden" name="categoryNum"	value="${category}">
    	<div class="col-md-2">
    		<c:if test="${sessionScope.login_id==null}">
    			<input type="button" data-toggle="modal" data-target="#login-modal" class="btn btn-primary w170" id="photoBoarderLogin" value="게시글 작성">    		
			</c:if>    		
    		<c:if test="${sessionScope.login_id!=null}">
    			<input type="button" data-toggle="modal" data-target="#insert-modal" class="btn btn-primary w170" value="게시글 작성">
    		</c:if>
    	</div>
    		
    <div class="col-md-10">
    	 <c:forEach var="vo" items="${dtos}" > 
			<div class="col-sm-10 col-md-10">
				<div class="thumbnail c" >
					<div class="disInline ">						
						<h6 class="floatL mr20 ml15"><label>번호 : </label> ${vo.notice_num}</h6>
						<h6 class="floatL mr20"><label>제목 : </label> ${vo.notice_title}</h6>
						<h6 class="floatL mr20"><label>작성자 : </label> ${vo.member_id}</h6>
						<h6 class="floatL mr20"><label>작성일 : </label> ${vo.writeDate}</h6>
					</div>
					<hr>				
					<img src="${image}Boarder/${vo.notice_image}" class="img-responsive ">
					<div class="caption">
						<h6 class="floatL"><label>내용 : </label> ${vo.contents}</h6>
					</div>
					<hr>
					<div class="m5 bf0f0f0">
						 <c:forEach var="vo2" items="${dtos2}" >
						 	<c:if test="${vo2.notice_title==vo.notice_num}"> 
								<h6 class="floatL"><label>${vo2.member_id} : </label>&nbsp;${vo2.contents}&nbsp;&nbsp;<span class="fs8">(${vo2.writeDate})</span></h6><br><br>
							</c:if>
						</c:forEach>
			<form action="" name="commentGWrite" id="commentGWrite">
			<div>		
				<table class="table table-hover table-bordered table-condensed c fs15">
						<tr>
							<td><input type="text" class="form-control" name="contents" id="contents" maxlength="200" placeholder="답글을 작성해주세요"></td>
								<c:if test="${sessionScope.login_id!=null}">
									<td><button type="button" class="btn btn-info" onclick="photoBoarderCommentWrite('${login_id}','${vo.notice_num}',this.form,'${category}');">
									작성하기<i class="fa fa-check spaceLeft"></i>
									</button>					
									</td>
								</c:if>
								<c:if test="${sessionScope.login_id==null}">
									<td><button type="button" class="btn btn-info" data-toggle="modal" data-target="#login-modal" id="photoBoarderLogin" >
									작성하기<i class="fa fa-check spaceLeft"></i>
									</button>
									</td>
								</c:if>
						</tr>
				</table>
				<c:if test="${sessionScope.login_id==vo.member_id}">
				<input type="button" data-toggle="modal" data-target="#modify-modal" class="btn btn-info" value="수정">
				<input type="button" class="btn btn-danger" value="삭제" onclick="load('photoBorderDelete?notice_num=${vo.notice_num}');" >
				</c:if>
			</div>
			</form>

						</div>
					</div><!-- outline -->
				</div><!-- md10 -->
				
		
<div id="modify-modal" class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	 <div class="row bf0f0f0">
    <div class="col-md-12 h25"></div>
    	<div class="col-md-1"></div>	
    	  
			<div class="col-sm-10 col-md-10">
			 <h4><b>공연 사진게시판 수정</b></h4>
				<hr>
				<div class="thumbnail c" >
				<form action="" name="photoModifyBoardForm" onsubmit="return false">
				<div class="disInline ">
				<input type="hidden" name="monotice_num" value="${vo.notice_num}">
						<table class="borderCollSe borderSpace20 w100p" >
							<tr>						
								<td class="w70 floatl"><h6><label>제목 : </label></h6></td>
								<td class="w450 floatl"><input type="text" name="noMo_title" class="form-control" value="${vo.notice_title}" ></td>
								<td class="w120"><h6><label>이미지파일변경: </label></h6></td>
								<td><input type="file" name="noMoboard_Image" style="width: 100%"></td>
									
								<td class="w70"><h6><label>작성자 : </label></h6> </td>
								<td><input type="text" name="noMomem_id" value="${login_id}" class="form-control" disabled></td>
							</tr>
						</table>
						
					</div>
					<hr>				
						
					<div class="caption">
						<h6 class="floatL"><label>내용 : </label></h6> <input type="textarea" name="noMo_content" class="w100p h250" value="${vo.contents}">
					</div>
					<hr>
					<input type="submit" class="btn btn-info" id="noMoPhotoBoarder" value="수정하기" >
				</form>
				</div><!-- outline -->
			</div><!-- md10 -->
		 <div class="col-md-1"></div>	 
	</div><!--row 끝  -->
</div>
				
		 </c:forEach> 
		 <div class="col-md-3"></div>
		 <div class="col-md-5 c">
		  <table class="c" style="width: 1000px" align="center">
						<tr>
						<th><c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전 블록[◀] -->
						<c:if test="${startPage > pageBlock}">
							<a onclick="load('photoBoarder');">[◀◀]</a>
							<a onclick="load('photoBoarder?pageNum=${startPage - pageBlock}');">[◀]</a>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a onclick="load('photoBoarder?pageNum=${i}');">[${i}]</a>
							</c:if>
						</c:forEach>

						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="load('photoBoarder?pageNum=${startPage + pageBlock}');">[▶]</a>
							<a onclick="load('photoBoarder?pageNum=${pageCount}');">[▶▶]</a>
						</c:if>
					</c:if></th>
					</tr>
				</table>
		 </div>
  	</div>
	</div><!--row 끝  -->
</div><!-- 컨테이너 끝 -->


<div id="insert-modal" class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	 <div class="row bf0f0f0">
    <div class="col-md-12 h25"></div>
    	<div class="col-md-1"></div>	
    	  
			<div class="col-sm-10 col-md-10">
			 <h4><b>공연 사진게시판 작성</b></h4>
				<hr>
				<div class="thumbnail c" >
				<form action="" name="photoInsertBoardForm" onsubmit="return false">
					<div class="disInline ">
						<table class="borderCollSe borderSpace20 w100p" >
							<tr>						
								<td class="w70 floatl"><h6><label>제목 : </label></h6></td>
								<td class="w450 floatl"><input type="text" name="no_title" class="form-control" ></td>
								<td class="w120"><h6><label>이미지파일: </label></h6></td>
								<td><input type="file" name="board_Image" style="width: 100%"></td>
									
								<td class="w70"><h6><label>작성자 : </label></h6> </td>
								<td><input type="text" name="mem_id" value="${login_id}" class="form-control" disabled></td>
							</tr>
						</table>
						
					</div>
					<hr>				
						
					<div class="caption">
						<h6 class="floatL"><label>내용 : </label></h6> <input type="textarea" name="no_content" class="w100p h250">
					</div>
					<hr>
					<input type="submit" class="btn btn-info" id="insertPhotoBoarder" value="작성하기" >
				</form>
				</div><!-- outline -->
			</div><!-- md10 -->
		 <div class="col-md-1"></div>	 
	</div><!--row 끝  -->
</div>





</body>
</html>