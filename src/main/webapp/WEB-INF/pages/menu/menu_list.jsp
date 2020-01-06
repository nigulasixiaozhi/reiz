<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-sm-12">
		<table class="table table-bordered" id="example-basic-expandable">
			<tr>
				<th>目录名称</th>
				<th>目录简介</th>
				<th>操作</th>
			</tr>
			<c:if test="${!empty menuList }">
			<c:forEach items="${menuList}" var="menu">
			<tr data-tt-id="${menu.rowId}" <c:if test="${menu.parentId!= -1}">data-tt-parent-id="${menu.parentId}"</c:if >>
				<td>${menu.menuName}</td>
				<td>${menu.menuInfo}</td>
				<td><a class="btn btn-info btn-xs" href="">删除</a> 
				<a class="btn btn-info btn-xs" href="">修改</a> 
				<a class="btn btn-info btn-xs" href="javascript:goAddChild(${menu.rowId},${menu.menuKind+1},'${menu.menuName}');">增加子目录</a></td>
			</tr>
			</c:forEach>
			</c:if>
		</table>
	</div>
</div>