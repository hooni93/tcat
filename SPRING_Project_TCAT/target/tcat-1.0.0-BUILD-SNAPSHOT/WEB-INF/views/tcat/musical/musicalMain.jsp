<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="spring.project.tcat.VO.TcatBoardVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<style type="text/css">
#movie_carousel .item  .top {
    overflow:hidden;
    max-height:300px;
    margin-bottom:15px;
}
#movie_carousel .item {

    color:#000;
    background-color:#fff;
    padding:20px 0;
    overflow:hidden
}
#movie_carousel .item img{
width:100%;
height:auto
}

#movie_carousel .izq 
{
    position:absolute;
  left: -25px;
  top:40%;
  background-image: none;
  background: none repeat scroll 0 0 #222222;
  border: 4px solid #FFFFFF;
  border-radius: 23px;
  height: 40px;
  width : 40px;
  margin-top: 30px;
}
/* Next button  */
#movie_carousel .der 
{
       position:absolute;
  right: -25px !important;
  top:40%;
  left:inherit;
  background-image: none;
  background: none repeat scroll 0 0 #222222;
  border: 4px solid #FFFFFF;
  border-radius: 23px;
  height: 40px;
  width : 40px;
  margin-top: 30px;
}
#movie_carousel .controls{

    overflow:hidden;
    padding:0;
    margin:0;
    white-space: nowrap;
    text-align: center;
    position: relative;
    background:#fff;
    border:0;
}
#movie_carousel .controls .nav{

    padding:0;
    margin:0;
    white-space: nowrap;
    text-align: center;
    position: relative;
    background:#fff;
    width: auto;
    border: 0;
}
#movie_carousel .controls li {
    transition: all .5s ease;
    display: inline-block;
    max-width: 100px;
    height: 90px;
    opacity:.5;
}
#movie_carousel .controls li a{
    padding:0;
}
#movie_carousel .controls li img{
width:100%;
height:auto
}

#movie_carousel .controls li.active {
    background-color:#fff;
    opacity:1;
}
#movie_carousel .controls a small {
    overflow:hidden;
    display:block;
    font-size:10px;
    margin-top:5px;
    font-weight:bold
}



/* ------------------------------------------------ */
#custom_carousel .item  .top {
    overflow:hidden;
    max-height:300px;
    margin-bottom:15px;
}
#custom_carousel .item {

    color:#000;
    background-color:#fff;
    padding:20px 0;
    overflow:hidden
}
#custom_carousel .item img{
width:100%;
height:auto
}

#custom_carousel .izq 
{
    position:absolute;
  left: -25px;
  top:40%;
  background-image: none;
  background: none repeat scroll 0 0 #222222;
  border: 4px solid #FFFFFF;
  border-radius: 23px;
  height: 40px;
  width : 40px;
  margin-top: 30px;
}
/* Next button  */
#custom_carousel .der 
{
       position:absolute;
  right: -25px !important;
  top:40%;
  left:inherit;
  background-image: none;
  background: none repeat scroll 0 0 #222222;
  border: 4px solid #FFFFFF;
  border-radius: 23px;
  height: 40px;
  width : 40px;
  margin-top: 30px;
}
#custom_carousel .controls{

    overflow:hidden;
    padding:0;
    margin:0;
    white-space: nowrap;
    text-align: center;
    position: relative;
    background:#fff;
    border:0;
}
#custom_carousel .controls .nav{

    padding:0;
    margin:0;
    white-space: nowrap;
    text-align: center;
    position: relative;
    background:#fff;
    width: auto;
    border: 0;
}
#custom_carousel .controls li {
    transition: all .5s ease;
    display: inline-block;
    max-width: 100px;
    height: 90px;
    opacity:.5;
}
#custom_carousel .controls li a{
    padding:0;
}
#custom_carousel .controls li img{
width:100%;
height:auto
}

#custom_carousel .controls li.active {
    background-color:#fff;
    opacity:1;
}
#custom_carousel .controls a small {
    overflow:hidden;
    display:block;
    font-size:10px;
    margin-top:5px;
    font-weight:bold
}
   .shophover:hover{color:red}
</style>
<script type="text/javascript">
$(document).ready(function(ev){
    var items = $(".nav li").length;
    var leftRight=0;
    if(items>5){
        leftRight=(items-5)*50*-1;
    }
    $('#custom_carousel').on('slide.bs.carousel', function (evt) {
        
 
      $('#custom_carousel .controls li.active').removeClass('active');
      $('#custom_carousel .controls li:eq('+$(evt.relatedTarget).index()+')').addClass('active');
    })
    $('.nav').draggable({ 
        axis: "x",
         stop: function() {
            var ml = parseInt($(this).css('left'));
            if(ml>0)
            $(this).animate({left:"0px"});
                if(ml<leftRight)
                    $(this).animate({left:leftRight+"px"});
                    
        }
  
      
    });
    $('#movie_carousel').on('slide.bs.carousel', function (evt) {
        
 
      $('#movie_carousel .controls li.active').removeClass('active');
      $('#movie_carousel .controls li:eq('+$(evt.relatedTarget).index()+')').addClass('active');
    })
    $('.nav').draggable({ 
        axis: "x",
         stop: function() {
            var ml = parseInt($(this).css('left'));
            if(ml>0)
            $(this).animate({left:"0px"});
                if(ml<leftRight)
                    $(this).animate({left:leftRight+"px"});
                    
        }

      
    });
});

</script>
</head>
<body>
<c:set var="image" value="/tcat/resources/image/"/>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<div class="row pt5 w100p">
			<div class="col-md-2 thumbnail mr15 h300">
				<div class="list-group pt20">
				  <a href="#" class="list-group-item disabled">
				    <span class="text-warning">뮤지컬</span>
				  </a>
				  <a onclick="load('musicalList?sDev=오리지널&order=startDate')" class="list-group-item">오리지널</a>
				  <a onclick="load('musicalList?sDev=라이선스&order=startDate')" class="list-group-item">라이선스</a>
				  <a onclick="load('musicalList?sDev=창작&order=startDate')" class="list-group-item">창작</a>
				  <a onclick="load('musicalList?sDev=넌버벌&order=startDate')" class="list-group-item">넌버벌</a>
				</div>
			</div>
			<div class="col-md-7 thumbnail mr15 w100p">
			<!-- 슬라이드 -->
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
				  <ol class="carousel-indicators">
				    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
				  </ol>
				
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner" role="listbox">
				    <div class="item active">
				      <img src="${image}musicalMain/A_1.jpg"  width="100%" height="300px" alt="A_1">
				      <div class="carousel-caption">
				
				      </div>
				    </div>
				    <div class="item">
				      <img src="${image}musicalMain/A_2.jpg" width="100%" height="300px" alt="A_2">
				      <div class="carousel-caption">
				
				      </div>
				    </div>
				    <div class="item">
				      <img src="${image}musicalMain/A_3.jpg" width="100%" height="300px" alt="A_3">
				      <div class="carousel-caption">
				
				      </div>
				    </div>
				
				  </div>
				
				  <!-- Controls -->
				  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
				<!-- 슬라이드 끝 -->
			
			</div>
			<div class="col-md-2 thumbnail h300">
				<div class="list-group pt11">
				  <div class="pt11"><p class="686868 b m10"><span class="glyphicon glyphicon-star"></span> 랭킹</p></div>
				  <a href="#" class="list-group-item">1. 라이선스</a>
				  <a href="#" class="list-group-item">2. 오리지널</a>
				  <a href="#" class="list-group-item">3. 창작</a>
				  <a href="#" class="list-group-item">4. 넌버벌</a>
				  <a href="#" class="list-group-item">5. 넌버벌</a>
				</div>
			</div>	
			
		</div>
	</div>
	 <div class="col-md-1"></div>
</div><!-- row end -->
 <div class="row">
	 <div class="col-md-1"></div>
	 <div class="col-md-10">
	 <!-- --------------------- -->

	 <div class="col-md-6 thumbnail">
	<div class="col-md-12 h25 bff3333 pt3"><span class="ffffff trgothic" onclick="load('photoBoarder?category=31');">뮤지컬 사진 게시판</span></div>		
	<c:if test="${photoCnt!=0}">
<div class="container-fluid">
    <div id="custom_carousel" class="carousel slide" data-ride="carousel" data-interval="4000">
        <!-- Wrapper for slides -->
            <a onclick="load('photoBoarder?category=31');">
        <div class="carousel-inner">
           <%
           ArrayList<TcatBoardVO> dtosPhoto=null;
       	   dtosPhoto=(ArrayList<TcatBoardVO>)request.getAttribute("dtosPhoto");
           String image0=dtosPhoto.get(0).getNotice_image();
           String title0=dtosPhoto.get(0).getNotice_title();
           String content0=dtosPhoto.get(0).getContents();
           %>
   
            <div class="item active"> 
                <div class="container-fluid">
                    <div class="row">
                        <div class="top col-md-8 col-xs-12" style="width: 60%; height:200px; overflow: hidden">
                       	 <img src="${image}Boarder/<%=image0%>" class="img-responsive">
                        </div>
                        <div class="content col-md-4 col-xs-12">
                            <h4><%=title0 %></h4>
                            <p><%=content0 %></p>
                        </div>
                    </div>
                </div>            
            </div> 
            <% for(int i=1;i<dtosPhoto.size();i++){ %>
            <div class="item">
                <div class="container-fluid">
                    <div class="row">
                        <div class="top col-md-8 col-xs-12 " style="width: 60%; height:200px; overflow: hidden">
                       		 <img src="${image}Boarder/<%=dtosPhoto.get(i).getNotice_image()%>"  class="img-responsive">
                        </div>
                        <div class="content col-md-4 col-xs-12">
                            <h4><%=dtosPhoto.get(i).getNotice_title()%></h4>
                            <p><%=dtosPhoto.get(i).getContents()%></p>
                        </div>
                    </div>
                </div>            
            </div> 
           <% }
            %>
        

        <!-- End Item -->
        </div>
        </a>
        <a data-slide="prev" href="#custom_carousel" class="izq carousel-control">‹</a>
        <a data-slide="next" href="#custom_carousel" class="der carousel-control">›</a>
        <!-- End Carousel Inner -->
         <div class="controls draggable ui-widget-content col-md-12 col-xs-12 c">
            <ul class="nav ui-widget-header">

                <li data-target="#custom_carousel" data-slide-to="0" class="active"><a href="#"><img src="${image}Boarder/<%=image0%>"><small>Slide One</small></a></li>
                 <% for(int j=1;j<dtosPhoto.size();j++){ %>
                <li data-target="#custom_carousel" data-slide-to="<%=j%>"><a href="#"><img src="${image}Boarder/<%=dtosPhoto.get(j).getNotice_image() %>"><small>Slide Two</small></a></li>

                 <% }%>
            </ul>
        </div>
    </div>
    <!-- End Carousel -->
</div></c:if>
	 </div>
	 
		 <!-- --------------------- -->
		 
	<div class="col-md-6 thumbnail">
		<div class="col-md-12 h25 b333366 pt3"><span class="ffffff trgothic hand" onclick="load('movieBoarder?category=21');">뮤지컬 영상 게시판</span></div>		
				
		<c:if test="${movieCnt!=0}">	
				
	<div class="container-fluid">
    <div id="movie_carousel" class="carousel slide" data-ride="carousel" data-interval="4000">
        <!-- Wrapper for slides -->
       <a onclick="load('movieBoarder?category=21');">
        <div class="carousel-inner">
           <%
           ArrayList<TcatBoardVO> dtosMovie=null;
        	dtosMovie=(ArrayList<TcatBoardVO>)request.getAttribute("dtosMovie");
        		
           %>
      
            <div class="item active"> 
                <div class="container-fluid">
                    <div class="row">
                        <div class="top col-md-12 col-xs-12" style="width: 100%; height:250px; overflow: hidden">
                       	<iframe  width="100%" height="300" class="embed-responsive-item" src="<%=dtosMovie.get(0).getNotice_addfile()%>" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                        </div>
                        <div class="content col-md-12 col-xs-12">
                            <h5><b><%=dtosMovie.get(0).getNotice_title()%></b></h5>
                            <p class="fs10"><%=dtosMovie.get(0).getContents()%></p>
                        </div>
                    </div>
                </div>            
            </div> 
            <% for(int i=1;i<dtosMovie.size();i++){ %>
            <div class="item">
                <div class="container-fluid">
                    <div class="row">
                          <div class="top col-md-12 col-xs-12" style="width: 100%; height:250px; overflow: hidden">
                          	<iframe  width="100%" height="300" class="embed-responsive-item" src="<%=dtosMovie.get(i).getNotice_addfile()%>" allow="autoplay; encrypted-media" ></iframe>
                        </div>
                        <div class="content col-md-12 col-xs-12">
                            <h5><b><%=dtosMovie.get(i).getNotice_title()%></b></h5>
                            <p class="fs10"><%=dtosMovie.get(i).getContents()%></p>
                        </div>
                    </div>
                </div>            
            </div> 
           <% } %>
            


        <!-- End Item -->
        </div>
        </a>
        <a data-slide="prev" href="#movie_carousel" class="izq carousel-control">‹</a>
        <a data-slide="next" href="#movie_carousel" class="der carousel-control">›</a>
        <!-- End Carousel Inner -->
		 <div class="controls draggable ui-widget-content col-md-12 col-xs-12 c disno">
            <ul class="nav ui-widget-header">

                <li data-target="#movie_carousel" data-slide-to="0" class="active"><a href="#"><iframe  width="100%" height="50" class="embed-responsive-item" src="<%=dtosMovie.get(0).getNotice_addfile()%>" allow="autoplay; encrypted-media" allowfullscreen></iframe><small>Slide One</small></a></li>
                 <% for(int j=1;j<dtosMovie.size();j++){ %>
                <li data-target="#movie_carousel" data-slide-to="<%=j%>"><a href="#"><iframe  width="100%" height="50" class="embed-responsive-item" src="<%=dtosMovie.get(j).getNotice_addfile()%>" allow="autoplay; encrypted-media" allowfullscreen></iframe><small>Slide Two</small></a></li>

                 <% }%>
            </ul>
        </div>

    </div>
    <!-- End Carousel -->
    
</div></c:if>	
	</div>
	 
	 </div>
	 <div class="col-md-1"></div>
</div>
	<!-- ---------------------------------------- -->
 <div class="row baaaaaa">
    	<div class="col-md-12 h20"></div>    	
    	<div class="col-md-12 h21"><div class="col-md-1"></div>  <span class="trgothic fs15 ffffff">핫카테고리</span></div>    	
    	<div class="col-md-12 h21"></div>    	
    	<div class="col-md-1"></div>
    	<c:forEach var="vo" items="${dtos}" >
			<div class="col-sm-3 col-md-2">
				<div class="thumbnail" >
					<div class="w100p h270 overflow">
					<a onclick="movieMainLoad('${vo.movie_url}');"><img src="${image}performance/${vo.perf_Image}" class="img-responsive"></a>
					</div>
					<div class="caption bf0f0f0">
						<table class="table table-condensed" style="table-layout:fixed">
							<tr>
								<td style="text-overflow:ellipsis; overflow:hidden"><h6 class="c"><nobr><label>${vo.perf_title}</label></nobr></h6></td>
							</tr>
						</table>
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
        <div class="col-md-1"></div>
        <div class="col-md-12 h20"></div> 
	</div><!--row 끝  -->
		
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10 mauto c" >
			 		<c:if test="${cnt>0}">
			 		<div class="">		
				 		<c:forEach var="volist" items="${listdtos}">	
					 		<a href="contentPage?pro_id=${volist.pro_id}"><div class="floatL h550 w300 m5 shophover">
							 		<div class="overlay">
								 		<table class="w300 h550">
								 			<tr>
									 			<td>
									 				<div class="w300 h450 overflow">
									 					<img src="${image}performance/${volist.perf_Image}">
									 				</div>
									 			</td>
								 			</tr>
								 			<tr>
									 			<td class="fs10">
									 			<!-- 	<c:if test="${volist.pro_new==1}">
									 					<img src="${project}/image/new_product.png">
									 				</c:if>
									 				<c:if test="${volist.pro_new==2}">
									 					<img src="${project}/image/sale_product.png">
									 				</c:if>  -->
									 					${volist.perf_title}
									 			</td>
								 			</tr>
								 			<tr>
									 			<td class="fs10 aaaaaa">${volist.B_seatPrice}</td>
								 			</tr>	 		
								 		</table>
								 	</div>	
							 	</div>
						 	</a>
					 	</c:forEach>
					</div>
					</c:if>
					<c:if test="${cnt==0}">
						<h3><center>현재 준비되어 있는 제품이 없습니다.</center></h3>
					</c:if>
						<div class="w100p h50 c">
							<table align="center">
								<tr>
									<td><br></td>
								</tr>
								<tr>
									<td>
										<c:if test="${cnt>0 }">
											<!-- 처음[◀◀]/이전블록[◀] 특수문자 한자키 -->
											<c:if test="${startPage>pageBlock }">
												<a onclick="load('musicalMain');">[◀◀]</a>
												<a onclick="load('musicalMain?pageNum=${startPage-pageBlock }');">[◀]</a>
											</c:if>
											<c:forEach var="i" begin="${startPage }" end="${endPage }">
												<c:if test="${i==currentPage }">
													<span><b>[${i }]</b></span>
												</c:if>
												
												<c:if test="${i!=currentPage }">
													<a onclick="load('musicalMain?pageNum=${i}');">[${i }]</a>
												</c:if>
											</c:forEach>
											<!-- 다음블록[▶]/끝[▶▶] -->
											<c:if test="${pageCount>endPage }">
												<a onclick="load('musicalMain?pageNum=${startPage+pageBlock }');">[▶]</a>
												<a href="load('musicalMain?pageNum=${pageCount}');">[▶▶]</a>
											</c:if>
										</c:if>
									</td>	
								</tr>
							</table>
						</div>
					</div>
				<div class="col-md-1"></div>
			</div><!-- row -->
		
	


</body>
</html>