<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>REIZ - 后台首页</title>
<jsp:include page="/base.jsp"></jsp:include>
<link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">
<!-- Custom fonts for this template-->
<link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
<!-- Page level plugin CSS-->
<link href="assets/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="assets/vendor/jquery-treetable/css/jquery.treetable.css" rel="stylesheet" type="text/css" />
<link href ="assets/vendor/jquery-treetable/css/jquery.treetable.theme.bootstrap.css" rel="stylesheet" type="text/css" /> 
<!-- jquery.validationEngine CSS Begin -->
<link href="assets/vendor/jquery-validation/validationEngine.jquery.css" rel="stylesheet">
<!-- jquery.validationEngine CSS End -->
<link href="assets/vendor/summernote/summernote-bs4.css" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="assets/css/sb-admin.css" rel="stylesheet">
</head>
<body id="page-top">
	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="index.html">Start Bootstrap</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar Search -->
		<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <span class="badge badge-danger">9+</span>
			</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
					<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i> <span class="badge badge-danger">7</span>
			</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
					<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a> <a class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">登出</a>
				</div></li>
		</ul>

	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav" id="sidebar_left">
			<li class="nav-item active"><a class="nav-link" href="view"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>系统首页</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="menu/index"> <i class="fas fa-fw fa-chart-area"></i> <span>目录管理</span></a></li>
			<li class="nav-item"><a class="nav-link" href="product/index"> <i class="fas fa-fw fa-table"></i> <span>商品管理</span></a></li>
			<li class="nav-item"><a class="nav-link" href="user/index"> <i class="fas fa-fw fa-table"></i> <span>用户管理</span></a></li>
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid" id="container-admin">
				

			</div>
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright © Your Website 2019</span>
					</div>
				</div>
			</footer>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">准备离开?</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">如果想结束当前的会话，请点击 "登出" 按钮 </div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
					<a class="btn btn-primary" href="javascript:;" id="btn_loginout">登出</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="assets/vendor/chart.js/Chart.min.js"></script>
	<script src="assets/vendor/datatables/jquery.dataTables.js"></script>
	<script src="assets/vendor/datatables/dataTables.bootstrap4.js"></script>
	<script type="text/javascript" src="assets/vendor/jquery.blockui.min.js"></script>
	<script type="text/javascript" src="assets/vendor/jquery-treetable/js/jquery.treetable.js"></script>
	<!-- jquery.validationEngine JS Begin -->
	<script src="assets/vendor/jquery-validation/jquery.validationEngine-zh_CN.js"></script>
	<script src="assets/vendor/jquery-validation/jquery.validationEngine.js"></script>
	<!-- jquery.validationEngine JS End -->
	<script src="assets/vendor/summernote/summernote-bs4.js"></script>
	<script src="assets/vendor/summernote/lang/summernote-zh-CN.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="assets/js/sb-admin.min.js"></script>
	<script type="text/javascript" src="assets/js/sb-ajax.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#sidebar_left').on('click','a',function(){
			var href = $(this).attr('href');
			//alert(href);
			$.ajax({
				url:href,
				dataType:'html',
				success:function(htmldata){
					$('#container-admin').html(htmldata);
				},
				beforeSend:function(){//在发送请求之前调用
					 // update the block message
					$.blockUI({ message: '<div class="spinner-border text-success" role="status"><span class="sr-only">Loading...</span></div>'});
				},
				complete:function(){//当请求完成之后调用这个函数，无论成功或失败。
					// unblock when remote call returns
	                $.unblockUI();
				}
			});
			return false;
		});
		//通过脚本让第一个 菜单自动 点击一下
		$('#sidebar_left').find('a:first').click();
		//绑定登出按钮
		$('#btn_loginout').on('click',function(){
			$.ajax({
				url:'doAdminLoginOut',
				success:function(result){
					if(result){
						window.location.href="admin";
					}
				}
			});
		});
	});
	</script>
</body>
</html>
