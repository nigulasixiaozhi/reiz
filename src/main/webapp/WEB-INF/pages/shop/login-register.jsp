<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>删除 - 登录/注册</title>
<meta name="robots" content="noindex, follow" />
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon -->
<jsp:include page="/base.jsp" />
<link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">
<!-- CSS	============================================ -->
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
<!-- Icon Font CSS -->
<link rel="stylesheet" href="assets/css/vendor/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/vendor/simple-line-icons.css">
<!-- Plugins CSS -->
<link rel="stylesheet" href="assets/css/plugins/animation.css">
<link rel="stylesheet" href="assets/css/plugins/slick.css">
<link rel="stylesheet" href="assets/css/plugins/animation.css">
<link rel="stylesheet" href="assets/css/plugins/nice-select.css">
<link rel="stylesheet" href="assets/css/plugins/fancy-box.css">
<link rel="stylesheet" href="assets/css/plugins/jqueryui.min.css">
<!-- Vendor & Plugins CSS (Please remove the comment from below vendor.min.css & plugins.min.css for better website load performance and remove css files from avobe) -->
<!--    <script src="assets/js/vendor/vendor.min.js"></script><script src="assets/js/plugins/plugins.min.js"></script>    -->
<!-- Main Style CSS (Please use minify version for better website load performance) -->
<link rel="stylesheet" href="assets/css/style.css">
<!--<link rel="stylesheet" href="assets/css/style.min.css">-->
</head>
<body>
	<div class="main-wrapper">
		<%--引入页面的头部信息  --%>
		<%@include file="/head.jsp"%>
		<!-- breadcrumb-area start -->
		<div class="breadcrumb-area">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<!-- breadcrumb-list start -->
						<ul class="breadcrumb-list">
							<li class="breadcrumb-item"><a href="index">首页</a></li>
							<li class="breadcrumb-item active">登录 &amp; 注册</li>
						</ul>
						<!-- breadcrumb-list end -->
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumb-area end -->
		<!-- main-content-wrap start -->
		<div class="main-content-wrap section-ptb lagin-and-register-page">
			<div class="container">
				<div class="row">
					<div class="col-lg-7 col-md-12 ml-auto mr-auto">
						<div class="login-register-wrapper">
							<!-- login-register-tab-list start -->
							<div class="login-register-tab-list nav">
								<a class="active" data-toggle="tab" href="#lg1">
									<h4>登录</h4>
								</a><a data-toggle="tab" href="#lg2">
									<h4>注册</h4>
								</a>
							</div>
							<!-- login-register-tab-list end -->
							<div class="tab-content">
								<div id="lg1" class="tab-pane active">
									<div class="alert alert-dark" role="alert"></div>
									<div class="login-form-container">
										<div class="login-register-form">
											<form id="form_user_login">
												<div class="login-input-box">
													<input type="text" name="userCode" id="userCode" placeholder="用户账号"> <input type="password" name="userPass" id="userPass" placeholder="登录密码">
												</div>
												<div class="button-box">
													<div class="login-toggle-btn">
														<input type="checkbox" name="isRemember" id="isRemember" value="1"><label>记住我</label><a href="#">忘记密码?</a>
													</div>
													<div class="button-box">
														<input class="login-btn btn" type="button" value="登录" id="button_login"></input>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div id="lg2" class="tab-pane">
									<div class="alert alert-dark" role="alert"></div>
									<div class="login-form-container">
										<div class="login-register-form">
											<form id="form_user_resgister">
												<div class="login-input-box">
													<input type="text" name="userName" placeholder="用户名称"> <input type="text" name="userCode" placeholder="用户账号"> <input type="password" name="userPass" placeholder="用户密码">
												</div>
												<div class="button-box">
													<input type="button" id="button_register" class="register-btn btn" value="注册">
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- main-content-wrap end -->
		<%--引入 尾部页面 --%>
		<%@include file="/foot.jsp"%>
	</div>
	<!-- JS============================================ -->
	<!-- Modernizer JS -->
	<script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>
	<!-- jQuery JS -->
	<script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="assets/js/vendor/popper.min.js"></script>
	<script src="assets/js/vendor/bootstrap.min.js"></script>
	<!-- Plugins JS -->
	<script src="assets/js/plugins/slick.min.js"></script>
	<script src="assets/js/plugins/jquery.nice-select.min.js"></script>
	<script src="assets/js/plugins/countdown.min.js"></script>
	<script src="assets/js/plugins/image-zoom.min.js"></script>
	<script src="assets/js/plugins/fancybox.js"></script>
	<script src="assets/js/plugins/scrollup.min.js"></script>
	<script src="assets/js/plugins/jqueryui.min.js"></script>
	<script src="assets/js/plugins/ajax-contact.js"></script>
	<!-- Vendor & Plugins JS (Please remove the comment from below vendor.min.js & plugins.min.js for better website load performance and remove js files from avobe) -->
	<!--<script src="assets/js/vendor/vendor.min.js"></script><script src="assets/js/plugins/plugins.min.js"></script>-->
	<!-- Main JS -->
	<script src="assets/js/main.js"></script>
	<script type="text/javascript" src="assets/js/shop/login_register.js"></script>
</body>
</html>
