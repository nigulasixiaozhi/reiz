<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>商城 - 我的收藏</title>
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
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active">Wishlist Page</li>
						</ul>
						<!-- breadcrumb-list end -->
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumb-area end -->
		<!-- main-content-wrap start -->
		<div class="main-content-wrap section-ptb">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<form action="#" class="cart-table">
							<div class=" table-content table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th class="plantmore-product-thumbnail">Images</th>
											<th class="cart-product-name">Product</th>
											<th class="plantmore-product-price">Unit Price</th>
											<th class="plantmore-product-stock-status">Stock Status</th>
											<th class="plantmore-product-add-cart">Add to cart</th>
											<th class="plantmore-product-remove">Remove</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="plantmore-product-thumbnail"><a href="#"><img src="assets/images/other/02.jpg" alt=""></a></td>
											<td class="plantmore-product-name"><a href="#">Nullam maximus</a></td>
											<td class="plantmore-product-price"><span class="amount">$23.39</span></td>
											<td class="plantmore-product-stock-status"><span class="in-stock">in stock</span></td>
											<td class="plantmore-product-add-cart"><a href="#">add to cart</a></td>
											<td class="plantmore-product-remove"><a href="#"><i class="fa fa-times"></i></a></td>
										</tr>
										<tr>
											<td class="plantmore-product-thumbnail"><a href="#"><img src="assets/images/other/01.jpg" alt=""></a></td>
											<td class="plantmore-product-name"><a href="#">Natus erro</a></td>
											<td class="plantmore-product-price"><span class="amount">$30.50</span></td>
											<td class="plantmore-product-stock-status"><span class="in-stock">in stock</span></td>
											<td class="plantmore-product-add-cart"><a href="#">add to cart</a></td>
											<td class="plantmore-product-remove"><a href="#"><i class="fa fa-times"></i></a></td>
										</tr>
										<tr>
											<td class="plantmore-product-thumbnail"><a href="#"><img src="assets/images/other/03.jpg" alt=""></a></td>
											<td class="plantmore-product-name"><a href="#">Sit voluptatem</a></td>
											<td class="plantmore-product-price"><span class="amount">$40.19</span></td>
											<td class="plantmore-product-stock-status"><span class="out-stock">out stock</span></td>
											<td class="plantmore-product-add-cart"><a href="#">add to cart</a></td>
											<td class="plantmore-product-remove"><a href="#"><i class="fa fa-times"></i></a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</form>
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
</body>
</html>
