$(document).ready(function(){
	
});
function removeWish(rowId){
	$.ajax({
		url:'',
		success:function(result){
			if(result){
				alert('移除成功！');
				$('#wishtr'+rowId).remove();
			}
		}
	});
}