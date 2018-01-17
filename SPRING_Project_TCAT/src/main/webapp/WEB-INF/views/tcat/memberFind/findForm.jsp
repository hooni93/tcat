<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function() {
	$('#login-form-link').click(function(e) {
		$("#login-form").delay(100).fadeIn(100);
		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
		$("#login-form").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
});
</script>



<div class="panel panel-login">
	<!--탭  -->
	<div class="panel-heading">
		<div class="row">
			<div class="col-xs-6">
				<a class="active" id="login-form-link">아이디 찾기</a>
			</div>
			<div class="col-xs-6">
				<a id="register-form-link">비밀번호 찾기</a>
			</div>
		</div>
		<hr>
	</div>
	<!--탭시 보여주는 패널  -->
	<div class="panel-body">
		<div class="row">
			<div class="col-lg-12">


				<form id="login-form" action="" method="post" role="form"
					style="display: block;">
					
					<!--회원 이름 입력  -->
					<div class="form-group">
						<input type="text" name="member_name" tabindex="1"
							class="form-control" placeholder="이름">
					</div>
					
					<div class="form-group fs10">본인확인 이메일 주소와 입력한 이메일 주소가 같아야,
						인증번호를 받을 수 있습니다.</div>
					<!--이메일 입력  -->
					<div class="form-group">
						<div class="row">
							<div class="col-md-8">
								<input type="text" name="member_email" tabindex="3"
									class="form-control" placeholder="E-mail">
							</div>
							<div class="col-md-4">
								<input type="button" tabindex="3"
									onclick="return emailSubmit('findId','#login-form','#idResult')"
									class="form-control btn btn-login" value="인증번호 전송">
							</div>
						</div>
					</div>
					<!--	아이디, 이메일 매치시: 인증번호가 전송되었습니다
							 비매치: 등록된 아이디가 아니거나 이메일주소가 아닙니다.  -->
					<div id="idResult"></div>

					<!--이메일 인증번호입력  -->
					<div class="form-group text-center">
						<input type="text" name="admit_num" tabindex="4"
							class="form-control" placeholder="인증번호 입력(6자리)">
					</div>
					<!--아이디찾기  -->
					<div class="form-group">
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
								<input type="button" name="login-submit" id="login-submit"
									tabindex="5" class="form-control btn btn-login" value="아이디 찾기"
									onclick="return emailSubmit('findResult','#login-form','#idResult')">
							</div>
						</div>
					</div>
				</form>
				
				<!--비밀번호 찾기  -->
				<form id="register-form"
					action="https://phpoll.com/register/process" method="post"
					role="form" style="display: none;">
					<!--회원 아이디 입력  -->
					<div class="form-group">
						<input type="text" name="member_id" tabindex="1"
							class="form-control" placeholder="아이디" value="">
					</div>
					<div class="form-group fs10">본인확인 이메일 주소와 입력한 이메일 주소가 같아야,
						인증번호를 받을 수 있습니다.</div>
					<!--이메일 입력  -->
					<div class="form-group">
						<div class="row">
							<div class="col-md-8">
								<input type="text" name="member_email" tabindex="3"
									class="form-control" placeholder="E-mail">
							</div>
							<div class="col-md-4">
								<input type="button" tabindex="3"
									class="form-control btn btn-login" value="인증번호 전송">
							</div>
						</div>
					</div>
					<!--이메일 인증번호입력  -->
					<div class="form-group text-center">
						<input type="text" name="admit_num" tabindex="4"
							class="form-control" placeholder="인증번호 입력">

					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
								<input type="submit" name="login-submit" id="login-submit"
									tabindex="5" class="form-control btn btn-login" value="비밀번호 찾기">
							</div>
						</div>
					</div>
				</form>


			</div>
		</div>
	</div>
</div>

</html>