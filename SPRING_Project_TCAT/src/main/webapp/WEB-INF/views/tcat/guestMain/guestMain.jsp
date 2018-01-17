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




</body>
</html>