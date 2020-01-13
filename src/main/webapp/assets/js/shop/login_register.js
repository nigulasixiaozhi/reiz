$(document).ready(function() {
	$('#button_login').on('click', function() {
		$.ajax({
			type : 'post',
			url : 'doUserLogin',
			data : $('#form_user_login').serialize(),
			success : function(result) {
				var $alert = $('#lg1').find('.alert');
				// 1:成功;2:用户密码或密码错误;3:用户被锁定;
				if (result == 1) {
					window.location.href = "index";
				} else if (result == 2) {
					$alert.addClass('alert-danger').html('用户名或密码错误，请重新试过！');
				} else if (result == 3) {
					$alert.addClass('alert-warning').html('用户被锁定，请联系管理员！');
				}
			}
		});
	});
	// 用户注册
	$('#button_register').on('click', function() {
		$.ajax({
			type : 'post',
			url : 'doUserRegister',
			data : $('#form_user_resgister').serialize(),
			success : function(result) {
				if (result) {
					$('#form_user_resgister')[0].reset();
					var $alert = $('#lg2').find('.alert');
					$alert.removeClass('alert-dark').addClass('alert-success').html('注册成功，请登录！');
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