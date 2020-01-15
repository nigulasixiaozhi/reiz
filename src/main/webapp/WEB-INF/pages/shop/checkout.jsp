<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>商城 - 结算</title>
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
							<li class="breadcrumb-item active">结算页面</li>
						</ul>
						<!-- breadcrumb-list end -->
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumb-area end -->
		<!-- main-content-wrap start -->
		<div class="main-content-wrap section-ptb checkout-page">
			<div class="container">
				<!-- checkout-details-wrapper start -->
				<div class="checkout-details-wrapper">
					<form id="form_checkout">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<!-- billing-details-wrap start -->
							<div class="billing-details-wrap">
								<form action="#">
									<h3 class="shoping-checkboxt-title">收货人信息</h3>
									<div class="row">
										<div class="col-lg-12 mb-20">
											<div class="single-form-row">
												<label>收货地址 <span class="required">*</span></label> 
												<select class="form-control" name="addressId" id="addressId">
													<c:if test="${!empty addressList}">
														<c:forEach items="${addressList}" var="address">
															<option data-name="${address.linkName}" data-phone="${address.linkPhone}" value="${address.rowId}" ${address.isDefault==1?'selected="selected"':''}>${address.linkArea}${address.linkAddr}</option>
														</c:forEach>
													</c:if>
												</select>
											</div>
										</div>
										<div class="col-lg-6">
											<p class="single-form-row">
												<label>收货人姓名 <span class="required">*</span></label><input name="linkName" id="linkName">
											</p>
										</div>
										<div class="col-lg-6">
											<p class="single-form-row">
												<label>收货人电话 <span class="required">*</span></label><input name="linkPhone" id="linkPhone">
											</p>
										</div>
										<div class="col-lg-12">
											<p class="single-form-row m-0">
												<label>订单备注</label>
												<textarea placeholder="您对订单有任何的其它需求。。。" class="checkout-mess" rows="2" cols="5"></textarea>
											</p>
										</div>
									</div>
								</form>
							</div>
							<!-- billing-details-wrap end -->
						</div>
						<div class="col-lg-6 col-md-6">
							<!-- your-order-wrapper start -->
							<div class="your-order-wrapper">
								<h3 class="shoping-checkboxt-title">商品详情</h3>
								<!-- your-order-wrap start-->
								<div class="your-order-wrap">
									<!-- your-order-table start -->
									<div class="your-order-table table-responsive">
										<table>
											<thead>
												<tr>
													<th class="product-name">商品</th>
													<th class="product-total">总价</th>
												</tr>
											</thead>
											<tbody>
												<c:set var="totalPrice" value="0" />
												<c:if test="${!empty sessionScope.userCart}">
													<c:forEach items="${sessionScope.userCart}" var="item">
														<c:set var="cart" value="${item.value}" />
														<tr class="cart_item">
															<td class="product-name">${cart.proName} <strong class="product-quantity">× ${cart.orderCount}</strong></td>
															<td class="product-total"><span class="amount">￥${cart.newPrice*cart.orderCount}</span></td>
														</tr>
														<c:set var="totalPrice" value="${totalPrice+cart.newPrice*cart.orderCount}" />
													</c:forEach>
												</c:if>
											</tbody>
											<tfoot>
												<tr class="order-total">
													<th>订单总价</th>
													<td><strong><span class="amount">￥${totalPrice}</span></strong></td>
													<input type="hidden" name="sumPrice" value="${totalPrice}"/>
												</tr>
											</tfoot>
										</table>
									</div>
									<!-- your-order-table end -->
									<!-- your-order-wrap end -->
									<div class="payment-method">
										<div class="order-button-payment">
											<input type="button" value="生成订单" id="btn_submit"/>
										</div>
									</div>
									<!-- your-order-wrapper start -->
								</div>
							</div>
						</div>
					</div>
					</form>
				</div>
				<!-- checkout-details-wrapper end -->
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
	<!-- 自己定义的 jQuery的ajax方法的重写 -->
	<script src="assets/js/shop/rezi-ajax.js"></script>
	<!-- 引入自书写的全局使用的头部脚本 -->
	<script src="assets/js/shop/head.js"></script>
	<script src="assets/js/shop/checkout.js"></script>
</body>
</html>
