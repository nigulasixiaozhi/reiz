<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${!empty orderList}">
	<c:forEach items="${orderList}" var="order">
		<tr>
			<td>${order.orderNum}</td>
			<td><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd HH:mm"/></td>
			<td>
				<c:if test="${order.orderStatus==1}">待付款</c:if>
				<c:if test="${order.orderStatus==2}">待发货</c:if>
			</td>
			<td>￥ ${order.sumPrice}</td>
			<td><a href="javascript:showOrderDetail(${order.rowId});" class="view">详情</a>
				<c:if test="${order.orderStatus==1}"><a href="" class="view">付款</a></c:if>
			</td>
		</tr>
	</c:forEach>
</c:if>