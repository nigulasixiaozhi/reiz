<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Admin - 登录</title>

<!-- Custom fonts for this template-->
<link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="assets/css/sb-admin.css" rel="stylesheet">

</head>
<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">登录</div>
			<div class="card-body">
			<div class="alert alert-dark" role="alert"></div>
				<form id="form_admin_login">
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" class="form-control" name="userCode" id="userCode" placeholder="用户账号" required="required" autofocus="autofocus"> 
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="password" class="form-control" name="userPass" id="userPass" placeholder="登录密码" required="required">
						</div>
					</div>
					<div class="form-group">
						<div class="checkbox">
							<label> <input type="checkbox" name="remember" value="1"> 自动登录
							</label>
						</div>
					</div>
					<input type="button" class="btn btn-primary btn-block" value="登录" id ="button_login"></input>
				</form>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#button_login').on('click',function(){
			$.ajax({
				type:'post',
				url:'doAdminLogin',
				data:$('#form_admin_login').serialize(),
				success:function(result){
					var $alert = $('.alert');
					//1:可以登录;2:被锁定;3:权限不够，不允许登录;4:用户名或密码错误;
					if(result ==1){
						window.location.href ="admin";
					}else if(result ==2){
						$alert.addClass('alert-danger').html('用户被锁定，请联系管理员！ ');
					}else if(result ==3){
						$alert.addClass('alert-warning').html('权限不够，不允许登录！ ');
					}else if(result == 4){
						$alert.addClass('alert-info').html('用户名或密码错误！ ');
					}
				}
			});
		});
		$(document).off('keypress').on('keypress',function(event){
			//如果是回车键
			if(event.keyCode == 13){
				$('#button_login').click();
			}
		});
	});
	</script>
</body>
</html>
