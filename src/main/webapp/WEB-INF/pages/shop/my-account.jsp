<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>商城 - 我的商城</title>
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
<!-- jquery.validationEngine CSS Begin -->
<link href="assets/vendor/jquery-validation/validationEngine.jquery.css" rel="stylesheet">
<!-- jquery.validationEngine CSS End -->
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
							<li class="breadcrumb-item active">我的商城</li>
						</ul>
						<!-- breadcrumb-list end -->
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumb-area end -->
		<!-- main-content-wrap start -->
		<div class="main-content-wrap section-ptb my-account-page">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="account-dashboard">
							<div class="row">
								<div class="col-md-12 col-lg-2">
									<!-- Nav tabs -->
									<ul role="tablist" id="account_list" class="nav flex-column dashboard-list">
										<li><a href="#dashboard" data-toggle="tab" class="nav-link active">Dashboard</a></li>
										<li><a href="orders" data-toggle="tab" class="nav-link">订单信息</a></li>
										<li><a href="address" data-toggle="tab" class="nav-link">收货地址</a></li>
										<li><a href="account-details" data-toggle="tab" class="nav-link">密码修改</a></li>
										<li><a href="loginout" class="nav-link">登出</a></li>
									</ul>
								</div>
								<div class="col-md-12 col-lg-10">
									<!-- Tab panes -->
									<div class="tab-content dashboard-content">
										<div class="tab-pane active" id="dashboard">
											<h3>Dashboard</h3>
											<p>
												From your account dashboard. you can easily check &amp; view your <a href="#">recent orders</a>, manage your <a href="#">shipping and billing addresses</a>and <a href="#">edit your password and account details.</a>
											</p>
										</div>
										<div class="tab-pane fade" id="orders">
											<h3>订单信息</h3>
											<div class="table-responsive">
												<table class="table">
													<thead>
														<tr>
															<th>订单编号</th>
															<th>订单日期</th>
															<th>订单状态</th>
															<th>订单总价</th>
															<th>操作</th>
														</tr>
													</thead>
													<tbody>

													</tbody>
												</table>
											</div>
										</div>
										<div class="tab-pane fade" id="address">
											<h3>
												收货地址 <input type="button" id="btn_add_address" class="btn default-btn btn-sm float-right" value="新增"></input>
											</h3>
											<div class="table-responsive">
												<table class="table">
													<thead>
														<tr>
															<th>收货人名称</th>
															<th>收货人电话</th>
															<th>收货详细地址</th>
															<th>操作</th>
														</tr>
													</thead>
													<tbody>

													</tbody>
												</table>
											</div>
										</div>
										<div class="tab-pane fade" id="account-details">
											<h3>密码修改</h3>
											<div class="login">
												<div class="login-form-container">
													<div class="account-login-form">
														<form id="form_pass_update">
															<div class="account-input-box">
																<label>原&nbsp;密&nbsp;码</label><input type="password" id="oldPass" class="validate[required,ajax[ajaxUserPass]]">
																<label>新&nbsp;密&nbsp;码</label><input type="password" name="newPass" id="newPass" class="validate[required]">
																<label>密码确认</label><input type="password" id="confPass" class="validate[required,equals[newPass]]">
															</div>
															<div class="button-box">
																<button class="btn default-btn" type="submit">提交</button>
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
				</div>
			</div>
		</div>
		<!-- main-content-wrap end -->
		<%--引入 尾部页面 --%>
		<%@include file="/foot.jsp"%>
	</div>
	<!-- Modal -->
	<div class="modal fade " id="modal_address_add_edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">收货地址</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="form_address_add_edit">
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">收货人姓名</label>
							<div class="col-sm-7">
								<input class="form-control" name="linkName" id="linkName" value="${sessionScope.userLogin.userName}"> <input type="hidden" id="rowId" name="rowId" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">收货人手机</label>
							<div class="col-sm-7">
								<input class="form-control" name="linkPhone" id="linkPhone" value="${sessionScope.userLogin.userPhone}">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">收货人区域</label>
							<div class="col-sm-7  form-row">
								<div class="col">
									<select class="form-control" id="area1" name="area1">
										<option value=''>省信息</option>
										<c:if test="${!empty area1List}">
											<c:forEach items="${area1List}" var="area">
												<option value="${area.areaCode}">${area.areaName}</option>
											</c:forEach>
										</c:if>
									</select>
								</div>
								<div class="col">
									<select class="form-control" id="area2" name="area2">
									</select>
								</div>
								<div class="col">
									<select class="form-control" id="area3" name="area3">
									</select>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">收货人详细地址</label>
							<div class="col-sm-4">
								<input class="form-control" name="linkArea" id="linkArea" readonly="readonly">
							</div>
							<div class="col-sm-6">
								<input class="form-control" name="linkAddr" id="linkAddr" placeholder="详情地址">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn default-btn" data-dismiss="modal">关闭</button>
					<button type="button" class="btn default-btn" id="btn_address_submit">提交</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal_order_detail" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">订单详情</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="order_detail_body">
					
				</div>
			</div>
		</div>
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
	<!-- jquery.validationEngine JS Begin -->
	<script src="assets/vendor/jquery-validation/jquery.validationEngine-zh_CN.js"></script>
	<script src="assets/vendor/jquery-validation/jquery.validationEngine.js"></script>
	<!-- jquery.validationEngine JS End -->
	<!-- Vendor & Plugins JS (Please remove the comment from below vendor.min.js & plugins.min.js for better website load performance and remove js files from avobe) -->
	<!--<script src="assets/js/vendor/vendor.min.js"></script><script src="assets/js/plugins/plugins.min.js"></script>-->
	<!-- Main JS -->
	<script src="assets/js/main.js"></script>
	<!-- 自己定义的 jQuery的ajax方法的重写 -->
	<script src="assets/js/shop/rezi-ajax.js"></script>
	<!-- 引入自书写的全局使用的头部脚本 -->
	<script src="assets/js/shop/head.js"></script>
	<script src="assets/js/shop/my_account.js"></script>
</body>
</html>
