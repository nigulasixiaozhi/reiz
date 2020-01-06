<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文本编辑器</title>
<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link href="assets/vendor/summernote/summernote-bs4.css" rel="stylesheet">
</head>
<body>
	<form method="post" action="test/add">
		<textarea id="summernote" name="proInfo"></textarea>
		<input type="submit" value="提交" />
	</form>
</body>
<script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<script src="assets/vendor/summernote/summernote-bs4.js"></script>
<script src="assets/vendor/summernote/lang/summernote-zh-CN.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			lang : 'zh-CN', // default: 'en-US'
			placeholder : 'Hello bootstrap 4',
			tabsize : 2,
			height : 100,
			callbacks: {
			    onImageUpload: function(files) {
			      // upload image to server and create imgNode...
			      //alert('图片上传触发此方法！!!!');
			      var file = files[0];
			      //console.log(file);
			      //将需要上传的文件，封装成formData
			      var formData = new FormData();
			      formData.append('mulitFile',file);
			      console.log(formData);
			      $.ajax({
			    	  type:'post',
			    	  url:'test/noteupload',
			    	  data:formData,
			    	  cache: false, //不缓存
						processData : false, // 告诉jQuery不要去处理发送的数据
						contentType : false,// 告诉jQuery不要去设置Content-Type请求头
						success:function(result){
							console.log(result);
							//将返回的文件路径封装成 img 的Dom对象
							var $img = $('<img/>').attr('src',result);
							//$img[0] 将一个jQuery对象转换成了DOM对象。
							$('#summernote').summernote('insertNode', $img[0]);
						}
			      });
			      //
			    }
			  }
		});
	});
</script>
</html>