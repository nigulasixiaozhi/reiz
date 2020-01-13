<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>商城 - 联系我们</title>
<meta name="robots" content="noindex, follow" />
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon -->
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
							<li class="breadcrumb-item active">Contact Us Page</li>
						</ul>
						<!-- breadcrumb-list end -->
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumb-area end -->
		<!-- Page Conttent -->
		<main class="page-content section-ptb">
			<div class="container">
				<div class="row">
					<div class="col-lg-7 col-sm-12">
						<div class="contact-form">
							<div class="contact-form-info">
								<div class="contact-title">
									<h3>TELL US YOUR PROJECT</h3>
								</div>
								<form id="contact-form" action="http://hasthemes.com/file/mail.php" method="post">
									<div class="contact-page-form">
										<div class="contact-input">
											<div class="contact-inner">
												<input name="con_name" type="text" placeholder="Name *">
											</div>
											<div class="contact-inner">
												<input name="con_email" type="email" placeholder="Email *">
											</div>
											<div class="contact-inner">
												<input name="con_phone" type="text" placeholder="Phone *">
											</div>
											<div class="contact-inner">
												<input name="con_subject" type="text" placeholder="Subject *">
											</div>
											<div class="contact-inner contact-message">
												<textarea name="con_message" placeholder="Message *"></textarea>
											</div>
										</div>
										<div class="contact-submit-btn">
											<button class="submit-btn" type="submit">Send Email</button>
											<p class="form-messege"></p>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="col-lg-5 col-sm-12">
						<div class="contact-infor">
							<div class="contact-title">
								<h3>CONTACT US</h3>
							</div>
							<div class="contact-dec">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam nam ex odio expedita, officia temporibus ipsum, placeat magni quibusdam sint, atque distinctio</p>
							</div>
							<div class="contact-address">
								<ul>
									<li>Address : No 40 Baria Sreet 133/2 NewYork City</li>
									<li>Email: Infor@Ruiztheme.com</li>
									<li>Phone: 0(1234) 567 890</li>
								</ul>
							</div>
							<div class="work-hours">
								<h5>Working hours</h5>
								<p>
									<strong>Monday &ndash; Saturday</strong>: &nbsp;08AM &ndash; 22PM
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<!--// Page Conttent -->
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
	<!-- 引入自书写的全局使用的头部脚本 -->
	<script src="assets/js/shop/head.js"></script>
</body>
</html>
