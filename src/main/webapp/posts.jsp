<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>批量提交</title>
</head>
<body>
	<div id="form_order">
	订单编号:<input name="orderNum"/><br/>
	商品ID：<input name="orderDetailList[0].productId"/>购买数量：<input name="orderDetailList[0].orderCount"/>商品总价:<input name="orderDetailList[0].sumPrice"/><br/>
	商品ID：<input name="orderDetailList[1].productId"/>购买数量：<input name="orderDetailList[1].orderCount"/>商品总价:<input name="orderDetailList[1].sumPrice"/><br/>
	商品ID：<input name="orderDetailList[2].productId"/>购买数量：<input name="orderDetailList[2].orderCount"/>商品总价:<input name="orderDetailList[2].sumPrice"/><br/>
	<input type="submit" value="提交"/>
	</div>
</body>
</html>