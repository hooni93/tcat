<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${css}style.css" rel="stylesheet" type="text/css">
 <link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">

<title>Insert title here</title>
<script type="text/javascript">
/* $(function() {

	 $('#datepicker').datepicker({
		dateFormat: 'yy-mm-dd',//데이터 형식 변경
		dayNamesShort:["일","월","화","수","목","금","토"],
		 changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		   beforeShowDay: noBefore, 
		monthNames:[ "1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월"],
	    onSelect: function(dateText, inst) { //선택한 데이터를 input박스에 넣기
	      $("input[name='something']").val(dateText);
	    }
	}); 
	$('#datepicker').datepicker({
		 showOn: 'both',buttonText: "달력",changeMonth: true,changeYear: true,
		 showButtonPanel:true,yearRange: 'c-99:c+99',constrainInput: true,maxDate: 
			 '+1y',beforeShowDay: noBefore  });
	 alert(${vo.startDate}); 
	function noBefore(date){
		  var startDate=${vo.startDate};
		 var endDate=${vo.endDate}; 
		    if (date < new Date())
		        return [false];
		     if (date > endDate)
		    	return [false]; 
		    return [true];
		}

});  */
jQuery(function($){
		    $.datepicker.regional['ko'] = {closeText: '닫기',prevText: '이전달',nextText: '다음달',currentText: '오늘',monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],dayNames: ['일','월','화','수','목','금','토'],dayNamesShort: ['일','월','화','수','목','금','토'],dayNamesMin: ['일','월','화','수','목','금','토'],weekHeader: 'Wk',dateFormat: 'yy-mm-dd',firstDay: 0,isRTL: false,showMonthAfterYear: true,yearSuffix: ''};
		    $.datepicker.setDefaults($.datepicker.regional['ko']);
		    $('#date1').datepicker({showOn: 'both',buttonText: "달력",changeMonth: true,changeYear: true,showButtonPanel:true,yearRange: 'c-99:c+99',constrainInput: true,maxDate: '+1y',beforeShowDay: disableAllTheseDays   });
		   /*  $('#date2').datepicker({showOn: 'both',buttonText: "달력",changeMonth: true,changeYear: true,showButtonPanel:true,yearRange: 'c-99:c+99',constrainInput: true,maxDate: '+1y',beforeShowDay: noBefore  });
		    */ $('#date3').datepicker({showOn: 'both',buttonText: "달력",changeMonth: true,changeYear: true,showButtonPanel:true,yearRange: 'c-99:c+99',constrainInput: true,maxDate: '+1y',beforeShowDay: noWeekendsOrHolidays  });
		    $('#datepicker').datepicker({showOn: 'both',buttonText: "달력",changeMonth: true,changeYear: true,showButtonPanel:true,yearRange: 'c-99:c+99',constrainInput: true,maxDate: '+1y',beforeShowDay: noSundays ,onSelect: function(dateText, inst) { //선택한 데이터를 input박스에 넣기
			      $("input[name='something']").val(dateText);
		    }});
		    
		});
		 
		// 특정날짜들 배열
		var disabledDays = ["2013-7-9","2013-7-24","2013-7-26"];
		 
		// 주말(토, 일요일) 선택 막기
		function noWeekendsOrHolidays(date) {
		    var noWeekend = jQuery.datepicker.noWeekends(date);
		    return noWeekend[0] ? [true] : noWeekend;
		}
		 
		// 일요일만 선택 막기
		function noSundays(date) {
		  return [date.getDay() != 0, ''];
		}
		
		// 이전 날짜들은 선택막기
		function noBefore(date){
			var a[]=${vo.startDate}
		    if (date < )
		        return [false];
		    if(date > ${vo.endDate})
		    	return [false];
		    return [true];
		}
		
		// 특정일 선택막기
		function disableAllTheseDays(date) {
		    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
		    for (i = 0; i < disabledDays.length; i++) {
		        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
		            return [false];
	        }
		    }
		    return [true];
		}

</script>
</head>
<body style="background-color:white;">

<!-- 이거바꾸면 됩니까? -->
<div id="datepicker"></div>
<input type="text" name="something">
<input type="text" id="date2">
</body>
</html>