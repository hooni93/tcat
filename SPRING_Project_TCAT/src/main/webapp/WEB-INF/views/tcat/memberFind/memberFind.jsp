<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="${css}style.css" rel="stylesheet" type="text/css">
<link href="${css}bootstrap_tcatMain.css" rel="stylesheet">
<script src="${script}ajax/request.js"></script>
<script src="${script}jquery-3.1.1.min.js"></script>
<script src="${script}bootstrap.js"></script>
<script src="${script}jquery-ui.js"></script>
<link rel="stylesheet" href="${css}jquery-ui.css">


<script type="text/javascript">
	//emailSubmit(보낼 url, form아이디, 결과 뿌려줄 div아이디)
	function emailSubmit(url, form, result) { /*AJAX submit  */
		var formData = $(form).serialize();
		var member_name = $(form + " input[name='member_name']");
		var member_email = $(form + " input[name='member_email']");
		var admit_num = $(form + " input[name='admit_num']");
		var admit_num_submit = $(form + " input[name='admit_num_submit']").val();
		var admit_num_res =	<%=request.getSession().getAttribute("admit_num")   %>;
		
		//뇌정지
		alert(admit_num_res);
		alert(url);
		if(url=="findResult"){
			if(admit_num_submit!=1){
				alert("인증번호 전송을 해주세요.");
				return false;
			}
			if(!admit_num.val()){
				alert("인증번호를 입력해주세요.");
				admit_num.focus();
				return false;
			}
			if(admit_num.val().length!=6){
				alert("인증번호는 6자리 입니다.");
				admit_num.focus();
				return false;
			}
			//세션의 인증번호 확인
			
				
		}
		if (!member_name.val()) {
			alert("이름을 입력해주세요.");
			member_name.focus();
			return false;
		}
		if (!member_email.val()) {
			alert("이메일을 입력하세요.");
			member_email.focus();
			return false;
		}
		$.ajax({
			type : "POST",
			url : url,
			cache : false,
			data : formData,
			success : function(msg) {
				$(result).html(msg);
			},
			error : onError
		});
		function onError(data, status) {
			alert("error");
		}
	}
	//result div에 뿌리기
	function load(url){
		 $( "#result" ).load( "${pageContext.request.contextPath}/"+url );	
	 }
</script>
<style type="text/css">
.panel-login {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
}

.panel-login>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align: center;
}

.panel-login>.panel-heading a {
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-login>.panel-heading a.active {
	color: #029f5b;
	font-size: 18px;
}

.panel-login>.panel-heading hr {
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -ms-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
}

.panel-login input[type="text"], .panel-login input[type="email"],
	.panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-login input:hover, .panel-login input:focus {
	outline: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}

.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}

.btn-login:hover, .btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}

.forgot-password {
	text-decoration: underline;
	color: #888;
}

.forgot-password:hover, .forgot-password:focus {
	text-decoration: underline;
	color: #666;
}

.btn-register {
	background-color: #1CB94E;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
}

.btn-register:hover, .btn-register:focus {
	color: #fff;
	background-color: #1CA347;
	border-color: #1CA347;
}
</style>


<title>TCAT: 아이디/비밀번호찾기</title>
</head>

<body style="background-color: #d0d0d0" onload="load('findForm')">
	<!--상단  -->
	<div class="container-fluid" style="background-color: #ff3333">
		<div class="navbar-header">
			<a class="navbar-brand"><b>TCAT</b></a>
		</div>
	</div>
	
	<div class="row h100"></div>
	<div class="row">
				<div class="col-md-3"></div>
				<!--결과 뿌려지는곳  -->
				<div class="col-md-6" id="result"></div>
				<div class="col-md-3"></div>
	</div>
	<div class="row h100"></div>
	
	<%@include file="../hostMain/HostFooter.jsp"%>

</body>
</html>