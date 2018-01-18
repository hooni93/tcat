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
<style type="text/css">
body{ 
    margin-top:40px; 
}

.stepwizard-step p {
    margin-top: 10px;
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;
    width: 100%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;

}

.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
</style>
<script type="text/javascript">
$(function() {

	$('#datepicker').datepicker({
		dateFormat: 'yy-mm-dd',//데이터 형식 변경
		dayNamesShort:["일","월","화","수","목","금","토"],
		 changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		monthNames:[ "1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월"],
	    onSelect: function(dateText, inst) { //선택한 데이터를 input박스에 넣기
	      $("input[name='something']").val(dateText);
	    }
	});
});
$(document).ready(function () {
	
    var navListItems = $('div.setup-panel div a'),//메인 스텝 1,2,3의 a태그 정보
            allWells = $('.setup-content'), //밑에 뿌려줄 1,2,3의 정보
            allNextBtn = $('.nextBtn'); //밑의 뿌려주는 부분의 다음 버튼 1,2

    allWells.hide(); //밑의 정보들을 숨겨놓기

    navListItems.click(function (e) { //메인 스텝 1,2,3a태그가 클릭되면
        e.preventDefault();//a태그의 이벤트를 정지시킨다
        var $target = $($(this).attr('href')), //클릭된  a태그 버튼의 href의 정보를 가져와서 target에 저장
                $item = $(this);//클릭된 a태그버튼정보 저장

        if (!$item.hasClass('disabled')) {//클릭된 a태그버튼정보가 활성화되어있지 않으면
            navListItems.removeClass('btn-primary').addClass('btn-default'); //모든 a태그 버튼을 btn-primary 클래스를 지우고 btn-default 클래스를 추가한다
            $item.addClass('btn-primary'); //클릭한 a태그 버튼의 클래스에 btn-primary를 추가한다.
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for(var i=0; i<curInputs.length; i++){
            if (!curInputs[i].validity.valid){
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }

        if (isValid)
            nextStepWizard.removeAttr('disabled').trigger('click');
    });

    $('div.setup-panel div a.btn-primary').trigger('click');
});
</script>
</head>
<body>
<div class="container">

<div class="stepwizard">
    <div class="stepwizard-row setup-panel">
	
		        <div class="stepwizard-step">
		            <a href="#step-1" type="button" class="btn btn-primary ">1</a>
		            <p>Step 1</p>
		        </div>


		        <div class="stepwizard-step">
		            <a href="#step-2" type="button" class="btn btn-default " disabled="disabled">2</a>
		            <p>Step 2</p>
		        </div>


		        <div class="stepwizard-step">
		            <a href="#step-3" type="button" class="btn btn-default " disabled="disabled">3</a>
		            <p>Step 3</p>
		        </div>

    </div>
</div>
<form role="form">
    <div class="row setup-content" id="step-1">
        <div class="col-xs-12">
            <div class="col-md-12">
                <h3> Step 1</h3>
                <div class="form-group">
                    <label class="control-label">First Name</label>
                    <input  maxlength="100" type="text" required="required" class="form-control" placeholder="Enter First Name"  />
                </div>
                <div class="form-group">
                    <label class="control-label">Last Name</label>
                    <input maxlength="100" type="text" required="required" class="form-control" placeholder="Enter Last Name" />
                </div>
                <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button>
            </div>
        </div>
    </div>
    <div class="row setup-content" id="step-2">
        <div class="col-xs-12">
            <div class="col-md-12">
                <h3> Step 2</h3>
                <div class="form-group">
                    <label class="control-label">Company Name</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Company Name" />
                </div>
                <div class="form-group">
                    <label class="control-label">Company Address</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Company Address"  />
                </div>
                <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button>
            </div>
        </div>
    </div>
    <div class="row setup-content" id="step-3">
        <div class="col-xs-12">
            <div class="col-md-12">
                <h3> Step 3</h3>
                <button class="btn btn-success btn-lg pull-right" type="submit">Finish!</button>
            </div>
        </div>
    </div>
</form>
</div>

<div>
	<ul class="nav nav-tabs">
	  <li role="presentation" class="active"><a href="#">Home</a></li>
	  <li role="presentation"><a href="#">Profile</a></li>
	  <li role="presentation"><a href="#">Messages</a></li>
	</ul>
</div>

<!-- 이거바꾸면 됩니까? -->

<div id="datepicker"></div>
<input type="text" name="something">



</body>
</html>