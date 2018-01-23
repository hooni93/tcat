<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.ui.card>.image, .ui.cards>.card>.image {
	position: relative;
	display: block;
	-webkit-box-flex: 0;
	-webkit-flex: 0 0 auto;
	-ms-flex: 0 0 auto;
	flex: 0 0 auto;
	padding: 0;
	background: rgba(0, 0, 0, .05);
}

.ui.card>:first-child, .ui.cards>.card>:first-child {
	border-radius: .28571429rem .28571429rem 0 0 !important;
	border-top: none !important;
}

.ui.card>.extra, .ui.cards>.card>.extra {
	max-width: 100%;
	min-height: 0 !important;
	-webkit-box-flex: 0;
	flex-grow: 0;
	border-top: 1px solid rgba(0, 0, 0, .05) !important;
	position: static;
	background: 0 0;
	width: auto;
	margin: 0;
	padding: .75em 1em;
	top: 0;
	left: 0;
	color: rgba(0, 0, 0, .4);
	box-shadow: none;
	transition: color .1s ease;
}

.ui.card>.content, .ui.cards>.card>.content {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	/* border: none; */
	border-top: 1px solid rgba(34, 36, 38, .1);
	background: 0 0;
	margin: 0;
	padding: 1em;
	box-shadow: none;
	font-size: 1em;
	border-radius: 0;
}

.ui.card>.content>.header:not(.ui), .ui.cards>.card>.content>.header:not(.ui) {
    font-weight: 700;
    font-size: 1.28571429em;
    margin-top: -.21425em;
    line-height: 1.28571429em;
}

</style>
</head>
<body>

	<br>
	<div class="row">
		<div class="col-md-1"></div>

		<div class="col-md-10">
			<!--사이드 메뉴 -->
			<div class="col-md-2">
				<div class="sidebar-nav disInline w100p floatR">
					<div class="well borderMenu disInline w100p"
						style="background-color: white; padding: 8px 0;">
						<ul class="nav nav-list  w100p ">
							<li><a class="list_side"><b>위시리스트</b></a>
								<hr class="w90p" style="margin: 0 auto;"></li>
							<li><a onclick="load('wishList?category=공연');"
								class="list_side">공연상품</a></li>
							<li><a onclick="load('wishList?category=스토어');"
								class="list_side">스토어 상품</a></li>
						</ul>
					</div>
				</div>

			</div>
			<!--위시리스트  -->
			<div class="col-md-8">

				<!-- 리스트 시작 -->
				<div class="col-md-4">
					<div class="ui centered fluid card" style="border: 1px solid #d0d0d0; border-radius: 5px; ">
						<div class="image">
							<img src=" this.images.standard_resolution.url " />
						</div>
						<div class="content">
							<a class="header"> this.user.full_name</a>
							<div class="meta">
								<span class="date">this.filter Filter</span>
							</div>
							<div class="description">this.user.username</div>
						</div>
						<div class="extra content">
							<span class="right floated"><i class="heart outline icon"></i>this.likes.count
								likes</span> <span class="left floated"><i
								class="comments outline icon"></i>this.comments.count comments</span>
						</div>
					</div>
				</div>
				<!--리스트 끝  -->
				
				<!-- 리스트 시작 -->
				<div class="col-md-4">
					<div class="ui centered fluid card" style="border: 1px solid #d0d0d0; border-radius: 5px; ">
						<div class="image">
							<img src=" this.images.standard_resolution.url " />
						</div>
						<div class="content">
							<a class="header"> this.user.full_name</a>
							<div class="meta">
								<span class="date">this.filter Filter</span>
							</div>
							<div class="description">this.user.username</div>
						</div>
						<div class="extra content">
							<span class="right floated"><i class="heart outline icon"></i>this.likes.count
								likes</span> <span class="left floated"><i
								class="comments outline icon"></i>this.comments.count comments</span>
						</div>
					</div>
				</div>
				<!--리스트 끝  -->


			</div>
			<div class="col-md-2"></div>
		</div>

		<div class="col-md-1"></div>
	</div>
</body>
</html>