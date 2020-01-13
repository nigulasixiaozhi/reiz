<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>商城 - 产品列表</title>
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
							<li class="breadcrumb-item active">商品展示</li>
						</ul>
						<!-- breadcrumb-list end -->
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumb-area end -->
		<div class="alert alert-success alert-dismissible fade hide" style="position: absolute;left: 90px;top: 270px;" role="alert">
			<strong>收藏成功!</strong> 您选中的商品已经放置到您的收藏列表中.
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<!-- main-content-wrap start -->
		<div class="main-content-wrap shop-page section-ptb">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 order-lg-2 order-2">
						<!-- shop-sidebar-wrap start -->
						<div class="shop-sidebar-wrap">
							<div class="shop-box-area">
								<!--sidebar-categores-box start  -->
								<div class="sidebar-categores-box shop-sidebar mb-30">
									<h4 class="title">商品目录</h4>
									<!-- category-sub-menu start -->
									<div class="category-sub-menu">
										<ul>
											<c:if test="${!empty menuList}">
												<c:forEach items="${menuList}" var="menu">
													<%-- List<Menu>childList = menu.childList --%>
													<c:set var="childList" value="${menu.childList}" />
													<li class="has-sub"><a href="#">${menu.menuName}</a>
														<ul>
															<c:if test="${!empty childList}">
																<c:forEach items="${childList}" var="childMenu">
																	<li><a href="#">${childMenu.menuName}</a></li>
																</c:forEach>
															</c:if>
														</ul></li>
												</c:forEach>
											</c:if>
										</ul>
									</div>
									<!-- category-sub-menu end -->
								</div>
								<!--sidebar-categores-box end  -->
								<!-- shop-sidebar start -->
								<div class="shop-sidebar mb-30">
									<h4 class="title">Filter By Price</h4>
									<!-- filter-price-content start -->
									<div class="filter-price-content">
										<form action="#" method="post">
											<div id="price-slider" class="price-slider"></div>
											<div class="filter-price-wapper">
												<a class="add-to-cart-button" href="#"><span>FILTER</span></a>
												<div class="filter-price-cont">
													<span>Price:</span>
													<div class="input-type">
														<input type="text" id="min-price" readonly="" />
													</div>
													<span>—</span>
													<div class="input-type">
														<input type="text" id="max-price" readonly="" />
													</div>
												</div>
											</div>
										</form>
									</div>
									<!-- filter-price-content end -->
								</div>
								<!-- shop-sidebar end -->
								<!-- shop-sidebar start -->
								<div class="shop-sidebar mb-30">
									<h4 class="title">Filter by Color</h4>
									<ul class="category-widget-list">
										<li><a href="#">Red (1)</a></li>
										<li><a href="#">White (1)</a></li>
									</ul>
								</div>
								<!-- shop-sidebar end -->
								<!-- shop-sidebar start -->
								<div class="shop-sidebar mb-30">
									<h4 class="title">Product tags</h4>
									<ul class="sidebar-tag">
										<li><a href="#">accesories</a></li>
										<li><a href="#">blouse</a></li>
										<li><a href="#">clothes</a></li>
										<li><a href="#">desktop</a></li>
										<li><a href="#">digital</a></li>
										<li><a href="#">fashion</a></li>
										<li><a href="#">women</a></li>
										<li><a href="#">men</a></li>
										<li><a href="#">laptop</a></li>
										<li><a href="#">handbag</a></li>
									</ul>
								</div>
								<!-- shop-sidebar end -->
							</div>
						</div>
						<!-- shop-sidebar-wrap end -->
					</div>
					<div class="col-lg-9 order-lg-1 order-1">
						<!-- shop-product-wrapper start -->
						<div class="shop-product-wrapper">
							<div class="row align-itmes-center">
								<div class="col">
									<!-- shop-top-bar start -->
									<div class="shop-top-bar">
										<!-- product-view-mode start -->
										<div class="product-mode">
											<!--shop-item-filter-list-->
											<ul class="nav shop-item-filter-list" role="tablist">
												<li class="active"><a class="active grid-view" data-toggle="tab" href="#grid"><i class="fa fa-th"></i></a></li>
												<li><a class="list-view" data-toggle="tab" href="#list"><i class="fa fa-th-list"></i></a></li>
											</ul>
											<!-- shop-item-filter-list end -->
										</div>
										<!-- product-view-mode end -->
										<!-- product-short start -->
										<div class="product-short">
											<p>Sort By :</p>
											<select class="nice-select" name="sortby">
												<option value="trending">Relevance</option>
												<option value="sales">Name(A - Z)</option>
												<option value="sales">Name(Z - A)</option>
												<option value="rating">Price(Low >High)</option>
												<option value="date">Rating(Lowest)</option>
											</select>
										</div>
										<!-- product-short end -->
									</div>
									<!-- shop-top-bar end -->
								</div>
							</div>
							<!-- shop-products-wrap start -->
							<div class="shop-products-wrap">
								<div class="tab-content">
									<div class="tab-pane active" id="grid">
										<div class="shop-product-wrap">
											<div class="row">
												<c:if test="${!empty productList}">
													<c:forEach items="${productList}" var="product">
														<div class="col-lg-4 col-md-6">
															<!-- single-product-area start -->
															<div class="single-product-area mt-30">
																<div class="product-thumb">
																	<a href="product-details.jsp"><img class="primary-image" src="${product.proPath}" alt=""></a>
																	<div class="label-product label_new">New</div>
																	<div class="action-links">
																		<a href="javascript:addCart(${product.rowId});" class="cart-btn" title="加入购物车"><i class="icon-basket-loaded"></i></a> 
																		<a href="javascript:addWish(${product.proCode});" class="wishlist-btn" title="加入收藏"><i class="icon-heart"></i></a><a href="#" class="quick-view" title="Quick View" data-toggle="modal" data-target="#exampleModalCenter"><i class="icon-magnifier icons"></i></a>
																	</div>
																	<ul class="watch-color">
																		<li class="twilight"><span></span></li>
																		<li class="portage"><span></span></li>
																		<li class="pigeon"><span></span></li>
																	</ul>
																</div>
																<div class="product-caption">
																	<h4 class="product-name">
																		<a href="product-details.jsp">${product.proName}</a>
																	</h4>
																	<div class="price-box">
																		<span class="new-price">￥${product.newPrice}</span><span class="old-price">￥${product.oldPrice}</span>
																	</div>
																</div>
															</div>
															<!-- single-product-area end -->
														</div>
													</c:forEach>
												</c:if>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="list">
										<div class="shop-product-list-wrap">
											<div class="row product-layout-list mt-30">
												<div class="col-lg-3 col-md-3">
													<!-- single-product-wrap start -->
													<div class="single-product">
														<div class="product-image">
															<a href="product-details.jsp"><img src="assets/images/product/product-01.png" alt="Produce Images"></a>
														</div>
													</div>
													<!-- single-product-wrap end -->
												</div>
												<div class="col-lg-6 col-md-6">
													<div class="product-content-list text-left">
														<h4>
															<a href="product-details.jsp" class="product-name">Auctor gravida enim</a>
														</h4>
														<div class="price-box">
															<span class="new-price">$99.00</span><span class="old-price">$110.00</span>
														</div>
														<div class="product-rating">
															<ul class="d-flex">
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li class="bad-reting"><a href="#"><i class="icon-star"></i></a></li>
															</ul>
														</div>
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto suscipit aliquam, dignissimos nesciunt, quos voluptas tenetur necessitatibus voluptate vitae quo quibusdam nihil.</p>
													</div>
												</div>
												<div class="col-lg-3 col-md-3">
													<div class="block2">
														<ul class="stock-cont">
															<li class="product-sku">Sku: <span>P006</span></li>
															<li class="product-stock-status">Availability: <span class="in-stock">In Stock</span></li>
														</ul>
														<div class="product-button">
															<ul class="actions">
																<li class="add-to-wishlist"><a href="wishlist.html" class="add_to_wishlist"><i class="icon-heart"></i>Add to Wishlist</a></li>
															</ul>
															<div class="add-to-cart">
																<div class="product-button-action">
																	<a href="#" class="add-to-cart">Add to cart</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="shop-product-list-wrap">
											<div class="row product-layout-list mt-30">
												<div class="col-lg-3 col-md-3">
													<!-- single-product-wrap start -->
													<div class="single-product">
														<div class="product-image">
															<a href="product-details.jsp"><img src="assets/images/product/product-02.png" alt="Produce Images"></a>
														</div>
													</div>
													<!-- single-product-wrap end -->
												</div>
												<div class="col-lg-6 col-md-6">
													<div class="product-content-list text-left">
														<h4>
															<a href="product-details.jsp" class="product-name">Auctor gravida enim</a>
														</h4>
														<div class="price-box">
															<span class="new-price">$99.00</span><span class="old-price">$110.00</span>
														</div>
														<div class="product-rating">
															<ul class="d-flex">
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li class="bad-reting"><a href="#"><i class="icon-star"></i></a></li>
															</ul>
														</div>
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto suscipit aliquam, dignissimos nesciunt, quos voluptas tenetur necessitatibus voluptate vitae quo quibusdam nihil.</p>
													</div>
												</div>
												<div class="col-lg-3 col-md-3">
													<div class="block2">
														<ul class="stock-cont">
															<li class="product-sku">Sku: <span>P006</span></li>
															<li class="product-stock-status">Availability: <span class="in-stock">In Stock</span></li>
														</ul>
														<div class="product-button">
															<ul class="actions">
																<li class="add-to-wishlist"><a href="wishlist.html" class="add_to_wishlist"><i class="icon-heart"></i>Add to Wishlist</a></li>
															</ul>
															<div class="add-to-cart">
																<div class="product-button-action">
																	<a href="#" class="add-to-cart">Add to cart</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row product-layout-list mt-30">
												<div class="col-lg-3 col-md-3">
													<!-- single-product-wrap start -->
													<div class="single-product">
														<div class="product-image">
															<a href="product-details.jsp"><img src="assets/images/product/product-03.png" alt="Produce Images"></a>
														</div>
													</div>
													<!-- single-product-wrap end -->
												</div>
												<div class="col-lg-6 col-md-6">
													<div class="product-content-list text-left">
														<h4>
															<a href="product-details.jsp" class="product-name">Auctor gravida enim</a>
														</h4>
														<div class="price-box">
															<span class="new-price">$99.00</span><span class="old-price">$110.00</span>
														</div>
														<div class="product-rating">
															<ul class="d-flex">
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li class="bad-reting"><a href="#"><i class="icon-star"></i></a></li>
															</ul>
														</div>
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto suscipit aliquam, dignissimos nesciunt, quos voluptas tenetur necessitatibus voluptate vitae quo quibusdam nihil.</p>
													</div>
												</div>
												<div class="col-lg-3 col-md-3">
													<div class="block2">
														<ul class="stock-cont">
															<li class="product-sku">Sku: <span>P006</span></li>
															<li class="product-stock-status">Availability: <span class="in-stock">In Stock</span></li>
														</ul>
														<div class="product-button">
															<ul class="actions">
																<li class="add-to-wishlist"><a href="wishlist.html" class="add_to_wishlist"><i class="icon-heart"></i>Add to Wishlist</a></li>
															</ul>
															<div class="add-to-cart">
																<div class="product-button-action">
																	<a href="#" class="add-to-cart">Add to cart</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row product-layout-list mt-30">
												<div class="col-lg-3 col-md-3">
													<!-- single-product-wrap start -->
													<div class="single-product">
														<div class="product-image">
															<a href="product-details.jsp"><img src="assets/images/product/product-04.png" alt="Produce Images"></a>
														</div>
													</div>
													<!-- single-product-wrap end -->
												</div>
												<div class="col-lg-6 col-md-6">
													<div class="product-content-list text-left">
														<h4>
															<a href="product-details.jsp" class="product-name">Auctor gravida enim</a>
														</h4>
														<div class="price-box">
															<span class="new-price">$99.00</span><span class="old-price">$110.00</span>
														</div>
														<div class="product-rating">
															<ul class="d-flex">
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li><a href="#"><i class="icon-star"></i></a></li>
																<li class="bad-reting"><a href="#"><i class="icon-star"></i></a></li>
															</ul>
														</div>
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto suscipit aliquam, dignissimos nesciunt, quos voluptas tenetur necessitatibus voluptate vitae quo quibusdam nihil.</p>
													</div>
												</div>
												<div class="col-lg-3 col-md-3">
													<div class="block2">
														<ul class="stock-cont">
															<li class="product-sku">Sku: <span>P006</span></li>
															<li class="product-stock-status">Availability: <span class="in-stock">In Stock</span></li>
														</ul>
														<div class="product-button">
															<ul class="actions">
																<li class="add-to-wishlist"><a href="wishlist.html" class="add_to_wishlist"><i class="icon-heart"></i>Add to Wishlist</a></li>
															</ul>
															<div class="add-to-cart">
																<div class="product-button-action">
																	<a href="#" class="add-to-cart">Add to cart</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- shop-products-wrap end -->
							<!-- paginatoin-area start -->
							<div class="paginatoin-area">
								<div class="row">
									<div class="col-lg-12 col-md-12">
										<ul class="pagination-box">
											<li class="active"><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a class="Next" href="#">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- paginatoin-area end -->
						</div>
						<!-- shop-product-wrapper end -->
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
	<script type="text/javascript" src="assets/js/shop/shop.js"></script>
</body>
</html>
