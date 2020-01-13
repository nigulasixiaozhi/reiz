<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col-sm-12">
		<table class="table table-bordered" id="example-basic-expandable">
			<tr>
				<th>用户类型</th>
				<th>用户名称</th>
				<th>登录账号</th>
				<th>用户状态</th>
				<th>最后登录时间</th>
				<th>操作</th>
			</tr>
			<c:if test="${!empty userList }">
			<c:forEach items="${userList}" var="user">
			<tr>
				<td>${user.userKind==1?'商家':'买家'}</td>
				<td>${user.userName}</td>
				<td>${user.userCode}</td>
				<td id="isLock${user.rowId}"><c:if test="${user.isLock==0}"><span class="badge badge-success">正常</span></c:if>
				<c:if test="${user.isLock==1}"><span class="badge badge-danger">锁定</span></c:if>
				</td>
				<td><fmt:formatDate value="${user.lastLoginDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><a class="btn btn-info btn-xs" href="">删除</a> 
				<a class="btn btn-info btn-xs" href="">修改</a>
				<span>
				<a class="btn ${user.isLock==1?'btn-danger':'btn-success'} btn-xs" href="javascript:doLock(${user.rowId},${user.isLock});">${product.isLock==1?'解锁':'锁定'}</a>
				 </span>
				 </td>
			</tr>
			</c:forEach>
			</c:if>
		</table>
	</div>
</div>