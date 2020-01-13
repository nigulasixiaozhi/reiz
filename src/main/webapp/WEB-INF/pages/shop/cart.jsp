<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/check_user_login.jsp"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>商城 - 购物车</title>
<meta name="robots" content="noindex, follow" />
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="/base.jsp" />
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
							<li class="breadcrumb-item active">购物车</li>
						</ul>
						<!-- breadcrumb-list end -->
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumb-area end -->
		<!-- main-content-wrap start -->
		<div class="main-content-wrap section-ptb cart-page">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<form class="cart-table" id="form_cart">
							<div class="table-content table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th><input type="checkbox" id="check_cart_all" checked="checked"></th>
											<th class="plantmore-product-thumbnail">商品图片</th>
											<th class="cart-product-name">商品名称</th>
											<th class="plantmore-product-price">商品售价</th>
											<th class="plantmore-product-quantity">购买数量</th>
											<th class="plantmore-product-subtotal">总价</th>
											<th class="plantmore-product-remove">移除</th>
										</tr>
									</thead>
									<tbody id="tbody_cart_table">
										<c:if test="${!empty cartList}">
											<%-- 使用<c:set 设置一个变量 --%>
											<c:set var="totalPrice" value="0"/>
											<c:forEach items="${cartList}" var="cart">
												<tr id="tr_cart_${cart.rowId}">
													<td><input type="checkbox" name="" value="${cart.rowId}" checked="checked"></td>
													<td class="plantmore-product-thumbnail"><a href="#"><img src="${cart.proPath}" alt="" height="40"></a></td>
													<td class="plantmore-product-name"><a href="#">${cart.proName }</a></td>
													<td class="plantmore-product-price">￥<span class="amount newPrice" >${cart.newPrice}</span></td>
													<td class="plantmore-product-quantity">
													<!-- type="number" min="1" 设置最小值 为1 -->
													<input value="${cart.orderCount}" type="number" min="1" data-action="action-orderCount" data-id="${cart.rowId}"></td>
													<td class="product-subtotal">￥<span class="amount sub-totalPrice">${cart.newPrice*cart.orderCount}</span></td>
													<td class="plantmore-product-remove"><a href="javascript:removeCart(${cart.rowId});"><i class="fa fa-times"></i></a></td>
												</tr>
												<!-- 实现数据累加 -->
												<c:set var="totalPrice" value="${totalPrice+cart.newPrice*cart.orderCount}"/>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-md-8">
									<div class="coupon-all">
										<div class="coupon2">
											<a href="shop" class=" continue-btn">继续购物</a>
										</div>
										<div class="coupon">
											<h3>Coupon</h3>
											<p>Enter your coupon code if you have one.</p>
											<input id="coupon_code" class="input-text" name="coupon_code" value="" placeholder="Coupon code" type="text"><input class="button" name="apply_coupon" value="Apply coupon" type="submit">
										</div>
									</div>
								</div>
								<div class="col-md-4 ml-auto">
									<div class="cart-page-total">
										<h2>购买总价</h2>
										<ul>
											<!-- <li>Subtotal <span></span></li> -->
											<li>商品总价<span id="page_total_price">￥${totalPrice}</span></li>
										</ul>
										<a href="checkout" class="proceed-checkout-btn">去结算</a>
									</div>
								</div>
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
	<!-- 引入自书写的全局使用的头部脚本 -->
	<script src="assets/js/shop/head.js"></script>
	<script type="text/javascript" src="assets/js/shop/cart.js"></script>
</body>
</html>
