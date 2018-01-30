<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${script}Chart.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
   /*탭 스크립트  */
   $('#myTab a[href="#performance"]').tab('show') // 공연상품 탭 클릭시 #myTab a[href="#performance"] 보여줌
   $('#myTab a[href="#store"]').tab('show') // Select tab by name

  	 var labels=new Array;
	var data=new Array;
	var data1=new Array;
	var data2=new Array;
   
  
   
</script>
</head>
<body>
<!-- git test -->


	<div class="row">
		<div class="col-md-1"></div>
		
		<div class="col-md-6">
		<hr>
			<h4><b>주문 관리</b></h4>
			<table  class="h165 table-bordered c table-hover1 hand">
				<tr>
					<td><div class="h100p pt15">장바구니담김 <span class="badge">${cartMainInfoCount}</span></div></td>
					<td><div class="h100p pt15">입금대기 <span class="badge">${orderInfoMain[0]}</span></div></td>
					<td><div class="h100p pt15">결제완료 <span class="badge">${orderInfoMain[1]}</span></div></td>
					<td><div class="h100p pt15">배송중 <span class="badge">${orderInfoMain[3]}</span></div></td>
				</tr>
				<tr>
					<td><div class="h100p pt15">배송완료/구매완료 <span class="badge">${orderInfoMain[4]}</span></div></td>
					<td><div class="h100p pt15">환불접수 <span class="badge">${orderInfoMain[5]}</span></div></td>
					<td><div class="h100p pt15">환불완료 <span class="badge">${orderInfoMain[6]}</span></div></td>
					<td><div class="h100p pt15">교환접수 <span class="badge">${orderInfoMain[7]}</span></div></td>
				</tr>
			</table>
		</div>
		
		<div class="col-md-4">
			<hr>
			<h4><b>문의/답변관리</b></h4>
			<div class="list-group">
			  <a href="#" class="list-group-item">사진/영상 게시판 <span class="badge">${boarderMainInfoCount}</span></a>
			  <a href="#" class="list-group-item">관람/상품 후기 <span class="badge">${comentMainInfoCount}</span></a>
			  <a href="#" class="list-group-item">QnA 게시판 <span class="badge">${qnaMainInfoCount}</span></a>
			  <a href="#" class="list-group-item">1 : 1 게시판 <span class="badge">${one_1MainInfoCount}</span></a>
			</div>
		</div>		
		
		<div class="col-md-1"></div>
	</div>
	
   <div class="row mt50">
      <div class="col-md-1"></div>
      
      <div class="col-md-10">
      <hr>
      <h4><b>주요 현황</b></h4><p class="fs8">최근 7일간 자료</p>
         <div role="tabpanel">
            <!-- 탭 네비게이션 -->
            <ul class="nav nav-tabs" role="tablist">
               <li role="presentation" class="active"><a
                  href="#performance" aria-controls="home" role="tab"
                  data-toggle="tab"
                  onclick="#">최근매출 </a></li>
               <li role="presentation" class="${storeActive}"><a
                  href="#store" aria-controls="profile" role="tab" data-toggle="tab"
                onclick="#">최근주문 <span class="badge">42</span></a></li>
               <li role="presentation" class="${storeActive}"><a
                  href="#store" aria-controls="profile" role="tab" data-toggle="tab"
                  onclick="#">최근신규회원 <span class="badge">42</span></a></li>
            </ul>

            <!-- 탭시 출력 -->
            <div class="tab-content">
               <!--공연 출력  #myTab a[href="#performance"]-->
               <div role="tabpanel" class="tab-pane active" id="performance">
                  <div id="perResult">
                     <!--리스트목록  -->
                     <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10 c">
                           <div class="col-md-12 h21"><h6 class="trgothic">일별 판매개수</h6> </div>
							<div class="col-md-12 h21"></div>
							<canvas id="dayCount" class="w100p"></canvas>
							<div class="col-md-12 h21"></div>
							<div class="col-md-12 h21"><h6 class="trgothic">일별 토탈 판매금액</h6> </div>
							<div class="col-md-12 h21"></div>
							<canvas id="dayPrice" class="w100p"></canvas>
							<br>
							<table class="table table-hover table-bordered table-condensed c fs11">
								<tr class="bg-primary">
									<td><b>날짜</b></td>
									<td><b>공연판매횟수</b></td>
									<td><b>공연판매금액</b></td>
									<td><b>스토어판매횟수</b></td>
									<td><b>스토어판매금액</b></td>
									<td><b>총판매금액</b></td>
								</tr>
								<c:forEach var="vo" items="${dtos}">
								<script type="text/javascript">
									labels.push("${vo.buyDate}");
									data.push("${vo.perCount}");
									data1.push("${vo.storeCount}");
									data2.push("${vo.totalPrice}");
								</script>
								<tr>			
									<td>${vo.buyDate}</td>
									<td>${vo.perCount}</td>
									<td>${vo.perPrice}</td>
									<td>${vo.storeCount}</td>
									<td>${vo.storePrice}</td>
									<td>${vo.totalPrice}</td>
								</tr>

								</c:forEach>
					
							</table>
							</div>
                        <div class="col-md-1"></div>
                        <!--리스트목록 끝  -->

                     </div>
                  </div>
               </div>
               
               
               <!--공연 출력  #myTab a[href="#store"]-->
               <div role="tabpanel" class="tab-pane ${storeActive }" id="store">
                  <!--리스트 시작  -->
                  <div class="row">
                     <div class="col-md-1"></div>
                     <div class="col-md-10">
                        
                        <table class="table table-hover table-bordered table-condensed c fs10">
                           <tr class="bg-primary">
                              <td><b>상품코드</b></td>
                              <td><b>상품명</b></td>
                              <td><b>카테고리</b></td>
                              <td><b>이미지 유,무</b></td>
                              <td><b>가격</b></td>
                              <td><b>할인조건</b></td>
                           </tr>
                           <c:forEach var="performance" items="performances">
                              <tr>
                                 <td>afasdsa</td>
                                 <td>2</td>
                                 <td>3</td>
                                 <td>4</td>
                                 <td>5</td>
                                 <td>6</td>
                              </tr>
                           </c:forEach>
                        </table>
                        <div class="row">
                         
                        </div>
                     </div>
                     <div class="col-md-1"></div>
                     <!--리스트 시작  -->
                  </div>
               </div>
               
               
            </div>
         </div>
      </div>
         <div class="col-md-1"></div>
	</div>	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- ------------------------------------------------------- -->
<script type="text/javascript">
new Chart(document.getElementById("dayCount"),
        {
           "type" : "line",
           "data" : {
              "labels" : labels,
              "datasets" : [ {
                 "label" : "일별 공연 상품 판매개수",
                 "data" : data,
                 "fill" : false,
                 "backgroundColor" : [
                       "rgba(201, 203, 207, 0.2)" ],
                 "borderColor" : [    "rgb(255, 99, 132)"],
                 "borderWidth" : 3
              },
              {
                  "label" : "일별 스토어 상품 판매개수",
                  "data" : data1,
                  "fill" : false,
                  "backgroundColor" : [
                        "rgba(201, 203, 207, 0.2)" ],
                  "borderColor" : [    "rgb(201, 203, 207)" ],
                  "borderWidth" : 3
               }]
           },
           "options" : {
              "scales" : {
                 "yAxes" : [ {
                    "ticks" : {
                       "beginAtZero" : true
                    }
                 } ]
              }
           }
        });

  new Chart(document.getElementById("dayPrice"),
          {
             "type" : "bar",
             "data" : {
                "labels" : labels,
                "datasets" : [ {
                   "label" : "일별 상품 판매금액",
                   "data" : data2,
                   "fill" : false,
                   "backgroundColor" : [
                         "rgba(255, 99, 132, 0.2)",
                         "rgba(255, 159, 64, 0.2)",
                         "rgba(255, 205, 86, 0.2)",
                         "rgba(75, 192, 192, 0.2)",
                         "rgba(201, 203, 207, 0.2)" ],
                   "borderColor" : [    "rgb(255, 99, 132)",
                                  "rgb(255, 159, 64)",
                                  "rgb(255, 205, 86)",
                                  "rgb(75, 192, 192)",
                                  "rgb(201, 203, 207)" ],
                   "borderWidth" : 3
                } ]
             },
             "options" : {
                "scales" : {
                   "yAxes" : [ {
                      "ticks" : {
                         "beginAtZero" : true
                      }
                   } ]
                }
             }
          });




</script>


</body>
</html>