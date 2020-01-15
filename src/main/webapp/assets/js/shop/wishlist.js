$(document).ready(function(){
	
});
function removeWish(rowId){
	$.ajax({
		url:'removewish/'+rowId,
		success:function(result){
			if(result || result==0){
				//alert('移除成功！');
				$('#wishtr'+rowId).remove();
				//更新头部的收藏的个数
				$('#head_wish_total').html(result);
			}
		}
	});
}