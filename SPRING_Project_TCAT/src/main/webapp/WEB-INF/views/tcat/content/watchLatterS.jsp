<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 게시판</title>
<script type="text/javascript">
function commentWriteS(url){   /* AJAX submit */  
	   var result = document.getElementById("result");
	   var formData = $("#commentGWriteS").serialize();
	   $.ajax({
	               type : "POST",
	               url : url,
	               cache : false,
	               data : formData,
	               success :  function(msg) {
	               /*    $('#myPageResult').html(msg); */
	                  alert("한줄평을 써주셔셔 감사합니다");
	               }, 
	               error : onError
	   });
	   function onError(data, status){alert("로그인 후 이용하시기 바랍니다.");}
	   location.reload();
	}
</script>
</head>
<body>
<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;후기 게시판</h2>
<hr>
<!-- 검색 -->
 <form class="navbar-form navbar-center" role="search"
               id="ajaxSubmitForm" onsubmit="return false">
               <input type="hidden" name="category" value=${category}>
               <input type="hidden" name="disc_title" value=${str.disc_title}>
               <input type="hidden" name="disc_code" value=${str.disc_code}>
               
               <!--카테고리  -->
               <select id="sDev" name="sDev" class="m10 p5">
                  <option value="0">분류</option>
                  <option value="1">후기번호</option>
                  <option value="2">작성자</option>
                  <option value="3">내용</option>
               </select>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="Search"
                     name="keyword"> 
               </div>
               <button type="button" class="btn btn-default"
                  onclick="ajaxSubmit('watchLatter?disc_title=${disc_title}')">검색</button>
            </form>
             <!-- 검색 종료 -->
             
		<div class="row">
			<div class="col-md-1"></div>

			<div class="col-md-16">
				<table class="table table-hover table-bordered table-condensed c fs13">
					<tr class="danger">
						<td width="200px"><b>후기번호</b></td>
						<td width="200px"><b>상품명</b></td>
						<td width="800px"><b>내용</b></td>
						<td width="100px"><b>작성자</b></td>
						<td width="200px"><b>작성일</b></td>
						
					</tr>
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td>${dto.notice_num}</td>
							<td>${dto.disc_title}</td>
						    <td>${dto.contents}</td>	
						    <td>${dto.member_id}</td>
							<td><fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd"/></td>
								
						</tr>
						
					</c:forEach>
				</table>
			</div>
			<div class="col-md-1"></div>
		</div>
	<!-- 페이지 컨트롤 -->
		<table style="width: 1000px" align="center">
			<tr>
				<th align="center"><c:if test="${cnt > 0}">
				<c:if test="${startPage > pageBlock}">
							<a onclick="commentList('watchLatterS?&sDev=${sDev}&keyword=${keyword}&disc_title=${disc_title}');">[◀◀]</a>
							<a onclick="commentList('watchLatterS?&pageNum=${startPage - pageBlock}&sDev=${sDev}&keyword=${keyword}&perf_title=${perf_title}');">[◀]</a>				
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a onclick="commentList('watchLatterS?&pageNum=${i}&sDev=${sDev}&keyword=${keyword}&disc_title=${disc_title}');">[${i}]</a>
							</c:if>
						</c:forEach>
						<!-- 다음[▶] / 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<a onclick="commentList('watchLatterS?&pageNum=${startPage + pageBlock}&sDev=${sDev}&keyword=${keyword}&disc_title=${disc_title}');">[▶]</a>
							<a onclick="commentList('watchLatterS?&pageCount=${pageCount}&sDev=${sDev}&keyword=${keyword}&disc_title=${disc_title}');">[▶▶]</a>
						</c:if>
					</c:if></th>
			</tr>
		</table>
		<div class="col-md-1"></div>
			<form action="" name="commentGWriteS" id="commentGWriteS">
		
			<div class="col-md-9">
				<table
					class="table table-hover table-bordered table-condensed c fs12">
					<tr class="danger">
						<td><b>한줄평 작성</b></td>
						<td><b>작성</b></td>
					</tr>
						<tr>
					<td><input type="text" class="form-control" name="contents" id="contents" maxlength="200" placeholder="한줄평을 작성해주세요"></td>
		<td><button type="button" class="btn btn-info" onclick="commentWriteS('commentWriteS?disc_code=${disc_code}');">
			작성하기<i class="fa fa-check spaceLeft"></i>
		</button>					
				</tr>
				
				</table>
			</div>
			</form>
				<div class="col-md-1"></div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>