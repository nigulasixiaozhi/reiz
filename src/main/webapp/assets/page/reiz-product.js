$(document).ready(function(){
	$('#menu_first').on('change',function(){
		var parentId = $(this).val();
		initChhildMenu(parentId);
	});
	
	$('#menu_first').change();
	
	//点击新增按钮
	$('#button_add').on('click',function(){
		$('#modal_product').modal('show');
	});
	
	//对表单绑定校验。
	$('#form_product_add_edit').validationEngine('attach', {
		onValidationComplete : function(form, status) {
			//如果校验通过
			if(status){
				//执行 新增或修改
				saveOrUpdate();
			}
		}
	});
	
	initTalbeData();
});
/**
 * @param parentId
 * @returns
 */
function initChhildMenu(parentId){
	$('#menu_second').empty();
	$.ajax({
		url:'menu/findchild/'+parentId,
		success:function(menuList){
			if(menuList){
				var options ='';
				$.each(menuList,function(index,menu){
					options+='<option value="'+menu.rowId+'">'+menu.menuName+'</option>';
				});
				$('#menu_second').html(options);
			}
		}
	});
}
/**
 * 保存 或 更新
 * @returns
 */
function saveOrUpdate(){
	var formObj = $('#form_product_add_edit')[0];
	var formData = new FormData(formObj);
	var rowId = $('#rowId').val();
	if(rowId){//如果主键有信息，则判断进行的是修改
		$.ajax({
			type:'post',
			url:'product/update',
			data:formData,//异步上传的二进制文件
			cache: false, //不缓存
			processData : false, // 告诉jQuery不要去处理发送的数据
			contentType : false,// 告诉jQuery不要去设置Content-Type请求头
			dataType:'json',
			success:function(result){
				if(result){
					$('#modal_product').modal('hide');
					initTalbeData();
				}
			}
		});
	}else{//则判断执行的是新增
		$.ajax({
			type:'post',
			url:'product/add',
			data:formData,//异步上传的二进制文件
			cache: false, //不缓存
			processData : false, // 告诉jQuery不要去处理发送的数据
			contentType : false,// 告诉jQuery不要去设置Content-Type请求头
			dataType:'json',
			success:function(result){
				if(result){
					$('#modal_product').modal('hide');
					initTalbeData();
				}
			}
		});
	}
}

function initTalbeData(){
	$.ajax({
		type:'post',
		url:'product/list',
		dataType:'html',
		success:function(htmlData){
			$('#dataTable_product').html(htmlData);
		}
	});
}
//执行上下架
function doChangeLine(rowId,isLine){
	$.ajax({
		url:'product/changline/'+rowId+"/"+isLine,
		success:function(result){
			initTalbeData();
		}
	});
}