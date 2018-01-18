<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>

<body>
<c:set var="image" value="/tcat/resources/image/"/>

<!-- 슬라이드 -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="${image}guestMain/A_1.jpg"  width="100%" height="500px" alt="A_1">
      <div class="carousel-caption">

      </div>
    </div>
    <div class="item">
      <img src="${image}guestMain/A_2.jpg" width="100%" height="500px" alt="A_2">
      <div class="carousel-caption">

      </div>
    </div>
    <div class="item">
      <img src="${image}guestMain/A_3.jpg" width="100%" height="500px" alt="A_3">
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
</div><!-- 슬라이드 끝 -->
<div class="thumbnail">
<div class="c m10">
	<a class="btn btn-default" href="#" role="button">뮤지컬</a>
	<a class="btn btn-default" href="#" role="button">콘서트</a>
	<a class="btn btn-default" href="#" role="button">연극</a>
	<a class="btn btn-default" href="#" role="button">클래식</a>
	<a class="btn btn-default" href="#" role="button">무용/발레</a>
	<a class="btn btn-default" href="#" role="button">스토어</a>
</div>

<!-- 핫리스트 -->
<div class="container">
    <div class="row">
    	<div class="col-md-12">
    	<div class="col-md-1"></div>
			<div class="col-sm-3 col-md-2">
				<div class="thumbnail" >
					<img src="${image}performance/.jpg" class="img-responsive">
					<div class="caption">
						<h5 class="c">Galaxy S5awefaw</h5>
						<h6 class="c"><label>$649.99</label></h6>
					</div>
					<div class="c">
						<a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
					</div>
					<div class="c">
						<a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> 예매</a>
						</div>
					</div><!-- outline -->
				</div><!-- md2 -->
			<div class="col-sm-3 col-md-2">
				<div class="thumbnail" >
					<img src="http://placehold.it/650x450&text=Galaxy S5" class="img-responsive">
					<div class="caption">
						<h5 class="c">Galaxy S5awefaw</h5>
						<h6 class="c"><label>$649.99</label></h6>
					</div>
					<div class="c">
						<a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
					</div>
					<div class="c">
						<a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> 예매</a>
					</div>	
				</div><!-- outline -->
			</div><!-- md2 -->
			<div class="col-sm-3 col-md-2">
				<div class="thumbnail" >
					<img src="http://placehold.it/650x450&text=Galaxy S5" class="img-responsive">
					<div class="caption">
						<h5 class="c">Galaxy S5awefaw</h5>
						<h6 class="c"><label>$649.99</label></h6>
					</div>
					<div class="c">
						<a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
					</div>
					<div class="c">
						<a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> 예매</a>
					</div>
				</div><!-- outline -->
			</div><!-- md2 -->
			<div class="col-sm-3 col-md-2">
				<div class="thumbnail" >
					<img src="http://placehold.it/650x450&text=Galaxy S5" class="img-responsive">
					<div class="caption">
						<h5 class="c">Galaxy S5awefaw</h5>
						<h6 class="c"><label>$649.99</label></h6>
					</div>
					<div class="c">
						<a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
					</div>
					<div class="c">
						<a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> 예매</a>
					</div>
				</div><!-- outline -->
			</div><!-- md2 -->
			<div class="col-sm-3 col-md-2">
				<div class="thumbnail" >
					<img src="http://placehold.it/650x450&text=Galaxy S5" class="img-responsive">
					<div class="caption">
						<h5 class="c">Galaxy S5awefaw</h5>
						<h6 class="c"><label>$649.99</label></h6>
					</div>
					<div class="c">
						<a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
					</div>
					<div class="c">
						<a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> 예매</a>
					</div>
				</div><!-- outline -->
			</div><!-- md2 -->
		</div><!-- md12 -->

        <div class="col-md-1"></div>
	</div><!--row 끝  -->
</div><!-- 컨테이너 끝 -->
</div><!-- 핫리스트 끝 -->




</body>
</html>