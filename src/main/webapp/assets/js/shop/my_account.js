$(document).ready(function() {
	$('#account_list').off('click', 'a').on('click', 'a', function() {
		var href = $(this).attr('href');
		switch (href) {
		case 'address':
			//初始化收货地址数据
			init_address_data();
			break;

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
		var areaName = $(this).find(':selected').text();
		var linkArea =$('#linkArea').val();
		if(areaName !='市信息' && areaName!='县' && areaName!='市辖区'){
			linkArea = linkArea+areaName;
		}
		//alert(linkArea);
		$('#linkArea').val(linkArea);
	});
	//
	$('#area3').on('change',function(){
		var areaName = $(this).find(':selected').text();
		var linkArea =$('#linkArea').val();
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
				
				$('#modal_address_add_edit').modal('show');
			}
		});
	});
});
function saveOrUpdateAddress(){
	var rowId = $('#form_address_add_edit').find('#rowId').val();
	if(rowId){
		
	}else{
		$.ajax({
			type:'post',
			url:'address/add',
			data:$('#form_address_add_edit').serialize(),
			success:function(result){
				if(result){
					$('#modal_address_add_edit').modal('hide');
					init_address_data();
				}
			}
		});
	}
}

//查询二级的Area数据
function initAreaData(parentCode,id){
	var options ='<option value=>市信息</option>';
	if(id=='area3'){
		options ='<option value=>区信息</option>';
	}
	$('#'+id).html(options);
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
				$('#'+id).html(options);
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