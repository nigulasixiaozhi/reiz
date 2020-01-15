$(document).ready(function(){
	//绑定鼠标移入 事件
	$('.shopping-cart-wrap').find('.icon-basket-loaded').on('mouseover',function(){
		$.ajax({
			url:'headcart',
			success:function(htmldata){
				$('#mini_cart').html(htmldata);
			}
		});
	});
});
/**
* 移除购物车
 * 
 * @param rowId
 * @returns
 */
function removeHeadCart(rowId) {
	$.ajax({
		url : 'removecart/' + rowId,
		success : function(result) {
			// 将头部页面上面的购物车的列表数据移除。
			$('#cart_head_' + rowId).remove();
			//尝试将购物车页面中的数据移除（如果有）
			$('#tr_cart_'+rowId).remove();
			// 更新购物车的数量
			$('#head_cart_total').html(result);
			alert('购物车移除成功');
		}
	});
}