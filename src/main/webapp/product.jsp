<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="product/add" method="post" enctype="multipart/form-data">
		商品编号：<input name="proCode" id="proCode"/><br/>
		商品名称：<input name="proName" id="proName"/><br/>
		商品主图：<input name="proPathFile" type="file"/><br/>
		展示图片1：<input type="file" name="childPathFile[0]"><br/>
		展示图片2：<input type="file" name="childPathFile[1]"><br/>
		展示图片3：<input type="file" name="childPathFile[2]"><br/>
		<input type="submit" value="提交"/>
	</form>
</body>
</html>