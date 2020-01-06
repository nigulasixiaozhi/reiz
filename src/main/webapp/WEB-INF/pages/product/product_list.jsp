<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-sm-12">
		<table class="table table-bordered" id="example-basic-expandable">
			<tr>
				<th>商品编号</th>
				<th>商品目录</th>
				<th>商品名称</th>
				<th>商品单价</th>
				<!-- <th>商品简介</th> -->
				<th>操作</th>
			</tr>
			<c:if test="${!empty productList }">
			<c:forEach items="${productList}" var="product">
			<tr>
				<td>${product.proCode}</td>
				<td>${product.menuName}</td>
				<td>${product.proName}</td>
				<td><span class="text-line" title="原价">￥ ${product.oldPrice}</span> <span class="font-weight-bold" title="售价">￥${product.newPrice}</span></td>
				<%-- <td>${product.proInfo}</td> --%>
				<td><a class="btn btn-info btn-xs" href="">删除</a> 
				<a class="btn btn-info btn-xs" href="">修改</a>
				<a class="btn ${product.isLine==1?'btn-danger':'btn-success'} btn-xs" href="javascript:doChangeLine(${product.rowId},${product.isLine});">${product.isLine==1?'下架':'上架'}</a>
				 </td>
			</tr>
			</c:forEach>
			</c:if>
		</table>
	</div>
</div>