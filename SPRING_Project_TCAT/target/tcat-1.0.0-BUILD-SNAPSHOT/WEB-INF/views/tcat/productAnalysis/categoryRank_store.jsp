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
				$("[name='poll_bar2'").addClass("btn btn-default");
				// Add button style with alignment to left with margin.
				$("[name='poll_bar2'").css({
					"text-align" : "left",
					"margin" : "5px"
				});
				//loop 
				$("[name='poll_bar2'").each(
						function(i) {
							//get poll value 	
							var bar_width = (parseFloat($("[name='poll_val2'")
									.eq(i).text()) / 2).toString();
							bar_width = bar_width + "%"; //add percentage sign.										
							//set bar button width as per poll value mention in span.
							$("[name='poll_bar2'").eq(i).width(bar_width);

							//Define rules.
							var bar_width_rule = parseFloat($(
									"[name='poll_val2'").eq(i).text());
							if (bar_width_rule >= 40) {
								$("[name='poll_bar2'").eq(i).addClass(
										"btn btn-sm btn-success")
							}
							if (bar_width_rule < 40) {
								$("[name='poll_bar2'").eq(i).addClass(
										"btn btn-sm btn-warning")
							}
							if (bar_width_rule <= 10) {
								$("[name='poll_bar2'").eq(i).addClass(
										"btn btn-sm btn-danger")
							}

							//Hide dril down divs
							$("#" + $("[name='poll_bar2'").eq(i).text()).hide();
						});

				//On click Main2 menu bar show its particular detail div.
				$("[name='poll_bar2'").click(function() {
					//Hide all 
					$(".panel-body2").children().hide();
					//Display only selected bar texted div sub chart.
					$("#" + $(this).text()).show();
					//If not inner drill down sub detail found then move to Main2 menu.
					if ($("#" + $(this).text()).length == 0) {
						$("#Main2").show();
					}
				});
			});
</script>
</head>
<br>
<br>
<div class="row">
	<div class="panel panel-primary h250" style="width: 90%; margin: 20px">
		<div class="panel-heading">
			<h3 class="panel-title">스토어: 카테고리별 판매분석</h3>
		</div>
		<div class="panel-body2" style="margin: 0px; width: 100%; padding:15px;">
			<div id="Main2">
				<!--판매량 총합  -->
				<c:forEach var="mDev" items="${mDevs }">
					<c:set var="mDevSum" value="${mDevSum+mDev.sellCnt}"/>
				</c:forEach>
				<!--중분류 나열  -->
				<c:forEach var="mDev" items="${mDevs }">
					<a name="poll_bar2">${mDev.mDev }</a>
					<span name="poll_val2"><fmt:formatNumber value="${mDev.sellCnt*100/mDevSum }" pattern=".00"/>%</span>
					<br />
				</c:forEach>
			</div>
			<!--뮤지컬 클릭시 -->
			<div id="음반">
				<c:forEach var="music" items="${musics }">
					<c:set var="mSum" value="${mSum+music.sellCnt}"/>
				</c:forEach>
				<c:forEach var="music" items="${musics }">
					<a name="poll_bar2">${music.sDev}</a> 
					<span name="poll_val2"><fmt:formatNumber value="${music.sellCnt*100/mSum }" pattern=".00"/>%</span><br /> 
				</c:forEach>
			</div>
			<!--콘서트 클릭시 -->
			<div id="컬렉션">
				<c:forEach var="collection" items="${collections }">
					<c:set var="cSum" value="${cSum+collection.sellCnt}"/>
				</c:forEach>
				<c:forEach var="collection" items="${collections }">
					<a name="poll_bar2">${collection.sDev}</a> 
					<span name="poll_val2"><fmt:formatNumber value="${collection.sellCnt*100/cSum }" pattern=".00"/>%</span><br /> 
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<div class="row  ">
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
</
<br>
<br>
</div>
</html>