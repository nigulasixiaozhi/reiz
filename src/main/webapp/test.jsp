<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>表单测试</title>
</head>
<body>
<form action="test.action">
	用户名称：<input type="text" name="userName"/><br/>
	<input type="reset" value="重置"/><br/>
	<input type="button" value="button" id="button1"/><br/>
	<input type="submit" value="submit" id="button2"/><br/>
	<button id="button3">提交button</button><br/>
</form>
</body>
<script type="text/javascript" src="assets/js/vendor/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//将input type='submit'的原来的提交动作屏蔽掉
		$(':submit').on('click',function(){
			return false;
		});
		//将button的提交动作屏蔽掉
		$('button').on('click',function(){
			return false;
		});
		
		$('#button1').on('click',function(){
			$.ajax({
				url:'user/login'
			});
		});
		$('#button2').on('click',function(){
			$.ajax({
				url:'user/login'
			});
		});
		$('#button3').on('click',function(){
			$.ajax({
				url:'user/login'
			});
		});
	});
</script>
</html>