$(document).ready(function() {
	$('#account_list').off('click', 'a').on('click', 'a', function() {
		var href = $(this).attr('href');
		switch (href) {
		case 'address':
			//初始化收货地址数据
			init_address_data();
			break;
		case 'orders':
			//初始化订单数据
			init_order_data();
			break;
		case 'loginout':
			userLoginOut();
		default:
			break;
		}
		$('.dashboard-content').find('.tab-pane').removeClass('active');
		$('.dashboard-content').find('#'+href).removeClass('fade').addClass('active');
		return false;
	});
	//绑定新增地址
	$('#btn_add_address').on('click',function(){
		$('#form_address_add_edit')[0].reset();
		$('#area2').html('<option value=>市信息</option>');
		$('#area3').html('<option value=>区信息</option>');
		$('#modal_address_add_edit').modal('show');
	});
	//绑定 省 change
	$('#area1').on('change',function(){
		var parentCode = $(this).val();
		initAreaData(parentCode,'area2');
		var areaName = $(this).find(':selected').text();
		var linkArea ='';
		if(areaName !='省信息'){
			linkArea = areaName;
		}
		//alert(linkArea);
		$('#linkArea').val(linkArea);
	});
	//绑定 市 change
	$('#area2').on('change',function(){
		var parentCode = $(this).val();
		initAreaData(parentCode,'area3');
		var areaName = $(this).find(':selected').html();
		var linkArea =$('#area1').find(':selected').text();
		if(areaName !='市信息' && areaName!='县' && areaName!='市辖区'){
			linkArea = linkArea+areaName;
		}
		//alert(linkArea);
		$('#linkArea').val(linkArea);
	});
	//
	$('#area3').on('change',function(){
		var areaName = $(this).find(':selected').text();
		var linkArea =$('#area1').find(':selected').text()+$('#area2').find(':selected').text();
		if(areaName !='区信息'){
			linkArea = linkArea+areaName;
		}
		$('#linkArea').val(linkArea);
	});
	//提交收货地址
	$('#btn_address_submit').on('click',function(){
		saveOrUpdateAddress();
	});
	//设置默认自动
	$('#address').off('click','[data-action="address_default"]').on('click','[data-action="address_default"]',function(){
		var id = $(this).attr('data-id');
		$.ajax({
			url:'address/default/'+id,
			success:function(result){
				if(result){
					alert("设置成功");
					init_address_data();
				}
			}
		});
	});
	//绑定修改收货地址
	$('#address').off('click','[data-action="address_edit"]').on('click','[data-action="address_edit"]',function(){
		var id =  $(this).attr('data-id');
		$.ajax({
			url:'address/get/'+id,
			success:function(address){
				var $form = $('#form_address_add_edit');
				$form.find('#rowId').val(address.rowId);
				$form.find('#linkName').val(address.linkName);
				$form.find('#linkPhone').val(address.linkPhone);
				$form.find('#linkArea').val(address.linkArea);
				$form.find('#linkAddr').val(address.linkAddr);
				var area1Code = address.area1;
				var area2Code = address.area2;
				var area3Code = address.area3;
				$('#area1').val(area1Code);
				initAreaData(area1Code,'area2',area2Code);
				initAreaData(area2Code,'area3',area3Code);
				$('#modal_address_add_edit').modal('show');
			}
		});
	});
	//对表单绑定校验。
	$('#form_pass_update').validationEngine('attach', {
		onValidationComplete : function(form, status) {
			//如果校验通过
			if(status){
				//执行 密码修改
				updateUserPass();
			}
		}
	});
});
function updateUserPass(){
	$.ajax({
		url:'doputpass',
		data:{"userPass":$('#newPass').val()},
		success:function(result){
			if(result){
				alert('密码修改成功！');
			}
		}
	});
}
function userLoginOut(){
	//绑定登出
	$.ajax({
		url:'doUserLoginOut',
		success:function(result){
			if(result){
				window.location.href="index";
			}
		}
	});
}
function saveOrUpdateAddress(){
	var rowId = $('#form_address_add_edit').find('#rowId').val();
	var url =null;
	if(rowId){
		url ='address/update';
	}else{
		url ='address/add';
	}
	$.ajax({
		type:'post',
		url:url,
		data:$('#form_address_add_edit').serialize(),
		success:function(result){
			if(result){
				$('#modal_address_add_edit').modal('hide');
				init_address_data();
			}
		}
	});
}

//查询二级的Area数据
function initAreaData(parentCode,id,selectAreaCode){
	var options ='<option value=>市信息</option>';
	if(id=='area3'){
		options ='<option value=>区信息</option>';
	}
	var $select = $('#'+id);
	$select.html(options);
	$.ajax({
		url:'area/list/'+parentCode,
		success:function(areaList){
			if(areaList){
				$.each(areaList,function(index,area){
					var areaCode = area.areaCode;
					var areaName = area.areaName;
					var option ='<option value="'+areaCode+'">'+areaName+'</option>';
					options +=option;
				});
				$select.html(options);
				//如果需要默认选中有数据
				if(selectAreaCode){
					//让当前的select默认选中
					$select.val(selectAreaCode);
				}
			}
		}
	});
}
//初始化收货地址数据
function init_address_data(){
	$.ajax({
		url:'address/list',
		success:function(htmlData){
			$('#address').find('tbody').html(htmlData);
		}
	});
}
//初始化订单数据
function init_order_data(){
	$.ajax({
		url:'orderlist',
		success:function(htmlData){
			$('#orders').find('tbody').html(htmlData);
		}
	});
}
// 显示订单的详情
function showOrderDetail(rowId){
	$.ajax({
		url:'orderdetail/'+rowId,
		success:function(htmlData){
			$('#tbody_order_detail_table').html(htmlData);
			$('#modal_order_detail').modal('show');
		}
	});
}