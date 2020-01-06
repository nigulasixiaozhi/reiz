<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文本编辑器</title>
<!-- include libraries(jQuery, bootstrap) -->
<!-- Custom fonts for this template-->
<link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
<!-- Page level plugin CSS-->
<link href="assets/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="assets/vendor/jquery-treetable/css/jquery.treetable.css" rel="stylesheet" type="text/css" />
<link href ="assets/vendor/jquery-treetable/css/jquery.treetable.theme.bootstrap.css" rel="stylesheet" type="text/css" /> 
<!-- jquery.validationEngine CSS Begin -->
<link href="assets/vendor/jquery-validation/validationEngine.jquery.css" rel="stylesheet">
<link href="assets/vendor/summernote/summernote-bs4.css" rel="stylesheet">
<!-- jquery.validationEngine CSS End -->
<!-- Custom styles for this template-->
<link href="assets/css/sb-admin.css" rel="stylesheet">
</head>
<body>
<form method="post" action="test/add">
  <textarea id="summernote" name="proInfo"></textarea>
  <input type="submit" value="提交"/>
</form>
</body>
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="assets/vendor/datatables/jquery.dataTables.js"></script>
	<script src="assets/vendor/datatables/dataTables.bootstrap4.js"></script>
	<script type="text/javascript" src="assets/vendor/jquery.blockui.min.js"></script>
	<script type="text/javascript" src="assets/vendor/jquery-treetable/js/jquery.treetable.js"></script>
	<!-- jquery.validationEngine JS Begin -->
	<script src="assets/vendor/jquery-validation/jquery.validationEngine-zh_CN.js"></script>
	<script src="assets/vendor/jquery-validation/jquery.validationEngine.js"></script>
	<!-- jquery.validationEngine JS End -->
	<!-- include summernote css/js -->
<script src="assets/vendor/summernote/summernote-bs4.js"></script>
<script src="assets/vendor/summernote/lang/summernote-zh-CN.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="assets/js/sb-admin.min.js"></script>
	<!-- Demo scripts for this page-->
	<script type="text/javascript" src="assets/js/sb-ajax.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#summernote').summernote({
		lang: 'zh-CN', // default: 'en-US'
        placeholder: 'Hello bootstrap 4',
        tabsize: 2,
        height: 100
      });
});
</script>
</html>