<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!empty orderDetailList}">
	<c:forEach items="${orderDetailList}" var="orderDetail">
		<tr>
			<td class="plantmore-product-thumbnail"><a href="#"><img src="${orderDetail.proPath}" alt="" height="40"></a></td>
			<td class="plantmore-product-name">${orderDetail.proName}</td>
			<td class="plantmore-product-price">￥<span class="amount">${orderDetail.newPrice}</span></td>
			<td class="plantmore-product-quantity">
				${orderDetail.orderCount}
			</td>
			<td class="product-subtotal">￥<span class="amount">${orderDetail.sumPrice}</span></td>
		</tr>
	</c:forEach>
</c:if>