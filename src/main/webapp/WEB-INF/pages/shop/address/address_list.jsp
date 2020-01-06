<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!empty addressList}">
<c:forEach items="${addressList}" var="address">
<tr>
	<td>${address.linkName} ${address.isDefault==1?'<span class="badge badge-pill badge-danger">默认</span>':''}</td>
	<td>${address.linkPhone}</td>
	<td>${address.linkArea}${address.linkAddr}</td>
	<td><button class="btn btn-primary btn-sm ${address.isDefault==1?'disabled':''}" data-id="${address.rowId}" data-action="address_default">设为默认</button>&nbsp;
	    <button class="btn btn-primary btn-sm" data-id="${address.rowId}" data-action="address_edit">修改</button></td>
</tr>
</c:forEach>
</c:if>
