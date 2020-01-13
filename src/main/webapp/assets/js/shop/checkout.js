$(document).ready(function(){
	//初始化收货人姓名和电话
	initNameAndPhone();
	// 绑定修改收货地址
	$('#addressId').on('change',function(){
		initNameAndPhone();
	});
	//绑定生成订单
	$('#btn_submit').on('click',function(){
		$.ajax({
			type:'post',
			url:'addorder',
			data:$('#form_checkout').serialize(),
			success:function(result){
				if(result){
					alert('订单生成成功！');
					window.location.href="account";
				}
			}
		});
	});
});
//初始化收货人姓名和电话
function initNameAndPhone(){
	var $option = $('#addressId').find(":selected");
	$('#linkName').val($option.attr('data-name'));
	$('#linkPhone').val($option.attr('data-phone'));
}