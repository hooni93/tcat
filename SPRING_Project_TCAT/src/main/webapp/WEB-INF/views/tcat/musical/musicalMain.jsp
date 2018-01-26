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
	<div class="col-md-12 h25 bff3333 pt3"><span class="ffffff trgothic">뮤지컬 사진 게시판</span></div>		
	
<div class="container-fluid">
    <div id="custom_carousel" class="carousel slide" data-ride="carousel" data-interval="4000">
        <!-- Wrapper for slides -->
        <a onclick="load('photoBoarder?category=31');">
        <div class="carousel-inner">
           <%
           ArrayList<TcatBoardVO> dtosPhoto=(ArrayList<TcatBoardVO>)request.getAttribute("dtosPhoto");
           String image0=dtosPhoto.get(0).getNotice_image();
           String title0=dtosPhoto.get(0).getNotice_title();
           String content0=dtosPhoto.get(0).getContents();
           %>
            <div class="item active"> 
                <div class="container-fluid">
                    <div class="row">
                        <div class="top col-md-8 col-xs-12" style="width: 60%; height:150px; overflow: hidden">
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
                        <div class="top col-md-8 col-xs-12 " style="width: 60%; height:150px; overflow: hidden">
                       		 <img src="${image}Boarder/<%=dtosPhoto.get(i).getNotice_image()%>"  class="img-responsive">
                        </div>
                        <div class="content col-md-4 col-xs-12">
                            <h4><%=dtosPhoto.get(i).getNotice_title()%></h4>
                            <p><%=dtosPhoto.get(i).getContents()%></p>
                        </div>
                    </div>
                </div>            
            </div> 
           <% } %>

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

                 <% } %>
            </ul>
        </div>
    </div>
    <!-- End Carousel -->
</div>
	 </div>
		 <!-- --------------------- -->
		 
	<div class="col-md-6 thumbnail">
		<div class="col-md-12 h25 b333366 pt3"><span class="ffffff trgothic hand" onclick="load('movieBoarder?category=21');">뮤지컬 영상 게시판</span></div>		
				
				
				
				<div class="container-fluid">
    <div id="custom_carousel" class="carousel slide" data-ride="carousel" data-interval="4000">
        <!-- Wrapper for slides -->
       
        <div class="carousel-inner">
           <%
           ArrayList<TcatBoardVO> dtosMovie=(ArrayList<TcatBoardVO>)request.getAttribute("dtosMovie");
           %>
      
            <div class="item active"> 
                <div class="container-fluid">
                    <div class="row">
                        <div class="top col-md-12 col-xs-12" style="width: 100%; height:250px; overflow: hidden">
                       	<iframe  width="100%" height="300" class="embed-responsive-item" src="<%=dtosMovie.get(0).getNotice_addfile()%>" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                        </div>
                        <div class="content col-md-12 col-xs-12">
                            <h4><%=dtosMovie.get(0).getNotice_title()%></h4>
                        </div>
                    </div>
                </div>            
            </div> 
            <% for(int i=1;i<dtosMovie.size();i++){ %>
            <div class="item">
                <div class="container-fluid">
                    <div class="row">
                          <div class="top col-md-12 col-xs-12" style="width: 100%; height:250px; overflow: hidden">
                          	<iframe  width="100%" height="300" class="embed-responsive-item" src="<%=dtosMovie.get(i).getNotice_addfile()%>" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                        </div>
                        <div class="content col-md-12 col-xs-12">
                            <h4><%=dtosMovie.get(i).getNotice_title()%></h4>
                        </div>
                    </div>
                </div>            
            </div> 
           <% } %>
            


        <!-- End Item -->
        </div>
        <a data-slide="prev" href="#movie_carousel_carousel" class="izq carousel-control">‹</a>
        <a data-slide="next" href="#movie_carousel_carousel" class="der carousel-control">›</a>
        <!-- End Carousel Inner -->



    </div>
    <!-- End Carousel -->
</div>
	</div>
	 
	 </div>
	 <div class="col-md-1"></div>
</div>

	 		
	


</body>
</html>