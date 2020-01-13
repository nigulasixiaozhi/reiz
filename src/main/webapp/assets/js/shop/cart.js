$(document).ready(function(){
	//绑定购物车购买数量，发生变化
	$('#form_cart').off('change','[data-action="action-orderCount"]').on('change','[data-action="action-orderCount"]',function(){
		var $this = $(this);
		var rowId = $this.attr('data-id');
		var orderCount = $(this).val();
		var $tr = $this.closest('tr');
		var newPrice = $tr.find('.newPrice').html();
		//将重新计算出的总价赋给页面显示
		$tr.find('.sub-totalPrice').html(newPrice*orderCount);
		//重新计算购物车的总价
		resetTotalPrice();
	});
	//绑定全部选中
	$('#check_cart_all').on('change',function(){
		var bool = $(this).prop('checked');
		$('#tbody_cart_table').find(':checkbox').prop('checked',bool);
		resetTotalPrice();
	});
	
	//
	$('#tbody_cart_table').off('change',':checkbox').on('change',':checkbox',function(){
		resetTotalPrice();
	});
});
//重新计算购物车的总价
function resetTotalPrice(){
	var totalPrice = 0.0;
	$('#tbody_cart_table').find(':checkbox:checked').each(function(index,obj){
		var $subTotalPrice = $(obj).closest('tr').find('.sub-totalPrice');
		totalPrice = totalPrice + parseFloat($subTotalPrice.text());
	});
	$('#page_total_price').html('￥'+totalPrice);
}
//移除购物车
function removeCart(rowId){
	$.ajax({
		url : 'removecart/' + rowId,
		success : function(result) {
			// 将头部页面上面的购物车的列表数据移除。
			$('#tr_cart_' + rowId).remove();
			// 更新购物车的数量
			$('#cart_total').html(result);
			alert('购物车移除成功');
		}
	});
}