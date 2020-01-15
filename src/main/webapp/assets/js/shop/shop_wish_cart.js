// 加入收藏，加入购物车的 公用JS代码
$(document).ready(function(){
	//绑定 收藏动作
	$('#tab_content_product_list,.single-add-actions').off('click','[data-action="wish-action"]').on('click','[data-action="wish-action"]',function(){
		var $this = $(this);
		var proCode = $this.attr('data-prod');
		var $fa = $this.find('.fa');
		//判断已经收藏，点击就是解除收藏
		var wishFlag = 1;
		if($fa.hasClass('fa-heart')){
			wishFlag = 0;
		}
		$.ajax({
			url:'addwish/'+wishFlag+'/'+proCode,
			success:function(result){
				//返回的是收藏的个数
				if(result || result==0){
					//alert("收藏执行成功！");
					//判断解除收藏
					if(wishFlag == 0){
						$fa.removeClass('fa-heart text-danger').addClass('fa-heart-o');
					}else{
						$fa.addClass('fa-heart text-danger').removeClass('fa-heart-o');
					}
					//更新头部的收藏的个数
					$('#head_wish_total').html(result);
				}
			}
		});
	});
});

//加入购物车
function addCart(proId){
	//默认的购买数量是1
	var orderCount = 1;
	if($('#orderCount').val()){
		orderCount = $('#orderCount').val();
	}
	$.ajax({
		url:'addcart/'+proId+'/'+orderCount,
		success:function(result){
			if(result){
				// 更新购物车的数量
				$('#head_cart_total').html(result);
				alert("购物车加入成功！");
			}
		}
	});
}