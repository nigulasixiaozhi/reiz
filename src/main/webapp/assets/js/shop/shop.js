$(document).ready(function(){
	
});
//增加收藏
function addWish(proCode){
	$.ajax({
		url:'addwish/'+proCode,
		success:function(result){
			if(result){
				alert("收藏成功！");
			}
		}
	});
}
//加入购物车
function addCart(proId){
	$.ajax({
		url:'addcart/'+proId,
		success:function(result){
			if(result){
				// 更新购物车的数量
				$('#cart_total').html(result);
				alert("购物车加入成功！");
			}
		}
	});
}