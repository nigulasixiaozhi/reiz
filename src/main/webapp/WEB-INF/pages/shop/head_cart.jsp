<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 定义购物车总价 -->
<c:set var="totalPrice" value="0" />
<c:if test="${!empty sessionScope.userCart}">
	<c:forEach items="${sessionScope.userCart}" var="item">
		<!-- 访问MAP中的value -->
		<c:set var="cart" value="${item.value}" />
		<li class="cart-item" id="cart_head_${cart.rowId}">
			<input class="form-check-input" type="checkbox" value="${cart.rowId}" checked="checked"> 
			<div class="cart-image">
				<a href="product-details/${cart.productId}"><img alt="" src="${cart.proPath}"></a>
			</div>
			<div class="cart-title">
				<a href="product-details/${cart.productId}">
					<h4>${cart.proName}</h4>
				</a>
				<div class="quanti-price-wrap">
					<span class="quantity">${cart.orderCount} ×</span>
					<div class="price-box">
						<span class="new-price">￥${cart.newPrice}</span>
					</div>
				</div>
				<a class="remove_from_cart" href="javascript:removeHeadCart(${cart.rowId});"><i class="icon-trash icons"></i></a>
			</div></li>
		<%-- 计算总价 --%>
		<c:set var="totalPrice" value="${totalPrice+cart.orderCount*cart.newPrice}" />
	</c:forEach>
</c:if>

<li class="subtotal-box">
	<div class="subtotal-title">
		<h3>总价 :</h3>
		<span>￥ ${totalPrice}</span>
	</div>
</li>
<li class="mini-cart-btns">
	<div class="cart-btns">
		<a href="cart">查看购物车</a><a href="checkout">结算</a>
	</div>
</li>