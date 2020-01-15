<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col">
		<div class="coupon-area">
			<!-- coupon-accordion start -->
			<div class="coupon-accordion">
				<h3>
					${address.linkName} <span class="coupon">${address.linkPhone}</span> ${address.linkArea}${address.linkAddr}
				</h3>
			</div>
			<!-- coupon-accordion end -->
		</div>
	</div>
</div>
<div class="table-content table-responsive">
	<table class="table">
		<thead>
			<tr>
				<th class="plantmore-product-thumbnail">商品图片</th>
				<th class="cart-product-name">商品名称</th>
				<th class="plantmore-product-price">商品售价</th>
				<th class="plantmore-product-quantity">购买数量</th>
				<th class="plantmore-product-subtotal">总价</th>
			</tr>
		</thead>
		<tbody id="tbody_order_detail_table">
			<c:if test="${!empty orderDetailList}">
				<c:forEach items="${orderDetailList}" var="orderDetail">
					<tr>
						<td class="plantmore-product-thumbnail"><a href="#"><img src="${orderDetail.proPath}" alt="" height="40"></a></td>
						<td class="plantmore-product-name">${orderDetail.proName}</td>
						<td class="plantmore-product-price">￥<span class="amount">${orderDetail.newPrice}</span></td>
						<td class="plantmore-product-quantity">${orderDetail.orderCount}</td>
						<td class="product-subtotal">￥<span class="amount">${orderDetail.sumPrice}</span></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>
