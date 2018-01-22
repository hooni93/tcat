<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(document).ready(
			function() {
				// add button style 
				$("[name='poll_bar'").addClass("btn btn-default");
				// Add button style with alignment to left with margin.
				$("[name='poll_bar'").css({
					"text-align" : "left",
					"margin" : "5px"
				});
				//loop 
				$("[name='poll_bar'").each(
						function(i) {
							//get poll value 	
							var bar_width = (parseFloat($("[name='poll_val'")
									.eq(i).text()) / 2).toString();
							bar_width = bar_width + "%"; //add percentage sign.										
							//set bar button width as per poll value mention in span.
							$("[name='poll_bar'").eq(i).width(bar_width);

							//Define rules.
							var bar_width_rule = parseFloat($(
									"[name='poll_val'").eq(i).text());
							if (bar_width_rule >= 40) {
								$("[name='poll_bar'").eq(i).addClass(
										"btn btn-sm btn-success")
							}
							if (bar_width_rule < 40) {
								$("[name='poll_bar'").eq(i).addClass(
										"btn btn-sm btn-warning")
							}
							if (bar_width_rule <= 10) {
								$("[name='poll_bar'").eq(i).addClass(
										"btn btn-sm btn-danger")
							}

							//Hide dril down divs
							$("#" + $("[name='poll_bar'").eq(i).text()).hide();
						});

				//On click main menu bar show its particular detail div.
				$("[name='poll_bar'").click(function() {
					//Hide all 
					$(".panel-body").children().hide();
					//Display only selected bar texted div sub chart.
					$("#" + $(this).text()).show();
					//If not inner drill down sub detail found then move to main menu.
					if ($("#" + $(this).text()).length == 0) {
						$("#Main").show();
					}
				});
			});
</script>
</head>
<br>
<br>
<div class="row ">
	<div class="panel panel-primary h250" style="width: 90%; margin: 20px">
		<div class="panel-heading">
			<h3 class="panel-title">공연: 카테고리별 판매분석</h3>
		</div>
		<div class="panel-body" style="margin: 0px; width: 100%;">
			<div id="Main">
				<!--판매량 총합  -->
				<c:forEach var="mDev" items="${mDevs }">
					<c:set var="mDevSum" value="${mDevSum+mDev.sellCnt}"/>
				</c:forEach>
				<!--중분류 나열  -->
				<c:forEach var="mDev" items="${mDevs }">
					<a name="poll_bar">${mDev.mDev }</a>
					<span name="poll_val"><fmt:formatNumber value="${mDev.sellCnt*100/mDevSum }" pattern=".00"/>%</span>
					<br />
				</c:forEach>
			</div>
			<!--뮤지컬 클릭시 -->
			<div id="뮤지컬">
				<c:forEach var="musical" items="${musicals }">
					<c:set var="mSum" value="${mSum+musical.sellCnt}"/>
				</c:forEach>
				<c:forEach var="musical" items="${musicals }">
					<a name="poll_bar">${musical.sDev}</a> 
					<span name="poll_val"><fmt:formatNumber value="${musical.sellCnt*100/mSum }" pattern=".00"/>%</span><br /> 
				</c:forEach>
			</div>
			<!--콘서트 클릭시 -->
			<div id="콘서트">
				<c:forEach var="concert" items="${concerts }">
					<c:set var="cSum" value="${cSum+concert.sellCnt}"/>
				</c:forEach>
				<c:forEach var="concert" items="${concerts }">
					<a name="poll_bar">${concert.sDev}</a> 
					<span name="poll_val"><fmt:formatNumber value="${concert.sellCnt*100/cSum }" pattern=".00"/>%</span><br /> 
				</c:forEach>
			</div>
			<!--연극 클릭시 -->
			<div id="연극">
				<c:forEach var="drama" items="${dramas }">
					<c:set var="dSum" value="${dSum+drama.sellCnt}"/>
				</c:forEach>
				<c:forEach var="drama" items="${dramas }">
					<a name="poll_bar">${drama.sDev}</a> 
					<span name="poll_val"><fmt:formatNumber value="${drama.sellCnt*100/dSum }" pattern=".00"/>%</span><br /> 
				</c:forEach>
			</div>
			 <!--클래식 클릭시 -->
			<div id="클래식">
				<c:forEach var="classic" items="${classics }">
					<c:set var="csSum" value="${csSum+classic.sellCnt}"/>
				</c:forEach>
				<c:forEach var="classic" items="${classics }">
					<a name="poll_bar">${classic.sDev}
					</a> 
					<span name="poll_val"><fmt:formatNumber value="${classic.sellCnt*100/csSum }" pattern=".00"/>%</span><br /> 
				</c:forEach>
			</div> 
		</div>
	</div>
</div>

<div class="row">
<table class="table table-inbox table-hover">
	<tbody>
		<c:forEach var="mDev" items="${mDevs }">
			<c:if test="${mDev.rNum<1 }">
				<tr>
			</c:if>
			<c:if test="${mDev.rNum == 1}">
				<tr class="unread">
			</c:if>
				<td class="inbox-small-cells">${mDev.rNum}위</td>
				<td class="inbox-small-cells"><i class="fa fa-star"></i></td>
				<td class="view-message  dont-show"></td>
				<td class="view-message ">${mDev.mDev }</td>
				<td class="view-message  inbox-small-cells"><i
					class="fa fa-paperclip"></i></td>
				<td class="view-message  text-right">판매수량: ${mDev.sellCnt}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<br>
<br>
<br>
<br>
</div>
</html>