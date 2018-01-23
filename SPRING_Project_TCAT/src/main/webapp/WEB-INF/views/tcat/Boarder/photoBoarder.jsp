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

function photoBoarderCommentWrite(member_id,notice_num,form){
	  var contents=form.contents.value; 
	  var url="photoBoarderCommentWrite?member_id="+member_id+"&notice_num="+notice_num+"&contents="+contents;
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
    	
    	<div class="col-md-2"><input type="button" class="btn btn-primary w170" value="게시글 작성"></div>
    		
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
					<img src="${image}Boarder/test.jpg" class="img-responsive ">
					<div class="caption">
						<h6 class="floatL"><label>내용 : </label> ${vo.contents}</h6>
					</div>
					<hr>
					<div class="m5 bf0f0f0">
						<h6 class="floatL"><label>아이디 : </label> 오늘 마스터에서 윤도현을 보았다 대박 완전 신기 얼굴도 넘나 작고 잘생겼당!!!&nbsp;&nbsp;&nbsp;<span class="fs8">(18/01/30)</span></h6><br>
						<h6 class="floatL"><label>아이디 : </label> 오늘 마스터에서 윤도현을 보았다 대박 완전 신기 얼굴도 넘나 작고 잘생겼당!!!&nbsp;&nbsp;&nbsp;<span class="fs8">(18/01/30)</span></h6><br>
						<h6 class="floatL"><label>아이디 : </label> 오늘 마스터에서 윤도현을 보았다 대박 완전 신기 얼굴도 넘나 작고 잘생겼당!!!&nbsp;&nbsp;&nbsp;<span class="fs8">(18/01/30)</span></h6><br>

			<form action="" name="commentGWrite" id="commentGWrite">
			<div>		
				<table class="table table-hover table-bordered table-condensed c fs15">
						<tr>
							<td><input type="text" class="form-control" name="contents" id="contents" maxlength="200" placeholder="답글을 작성해주세요"></td>
								<c:if test="${sessionScope.login_id!=null}">
									<td><button type="button" class="btn btn-info" onclick="photoBoarderCommentWrite('${login_id}','${vo.notice_num}',this.form);">
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
			</div>
			</form>

						</div>
					</div><!-- outline -->
				</div><!-- md10 -->
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

</body>
</html>