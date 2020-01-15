$(document).ready(function() {
	$('#menu_first').on('change', function() {
		var parentId = $(this).val();
		initChhildMenu(parentId);
	});

	$('#menu_first').change();
	//绑定sumernoter
	buildSummernote();
	//绑定回商品管理首页
	$('#but_go_pro_index').on('click',function(){
		//回商品管理首页
		initProductIndex();
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
});
/**
 * 保存 或 更新
 * @returns
 */
function saveOrUpdate(){
	var formObj = $('#form_product_add_edit')[0];
	var formData = new FormData(formObj);
	var rowId = $('#rowId').val();
	var url ='product/add';
	if(rowId){//如果主键有信息，则判断进行的是修改
		url ='product/put';
	}else{//则判断执行的是新增
	}
	
	$.ajax({
		type:'post',
		url:url,
		data:formData,//异步上传的二进制文件
		cache: false, //不缓存
		processData : false, // 告诉jQuery不要去处理发送的数据
		contentType : false,// 告诉jQuery不要去设置Content-Type请求头
		dataType:'json',
		success:function(result){
			if(result){
				$('#modal_product').modal('hide');
				//回商品管理首页
				initProductIndex();
			}
		}
	});
}
//回商品管理首页
function initProductIndex(){
	$.ajax({
		url:'product/index',
		success:function(htmldata){
			$('#container-admin').html(htmldata);
		}
	});
}
//绑定sumernoter
function buildSummernote() {
	$('#proInfo').summernote({
		lang : 'zh-CN', // default: 'en-US'
		placeholder : '商品简介',
		tabsize : 2,
		height : 100,
		callbacks : {
			onImageUpload : function(files) {
				// upload image to server and create imgNode...
				// alert('图片上传触发此方法！!!!');
				var file = files[0];
				// console.log(file);
				// 将需要上传的文件，封装成formData
				var formData = new FormData();
				formData.append('mulitFile', file);
				console.log(formData);
				$.ajax({
					type : 'post',
					url : 'summerupload',
					data : formData,
					cache : false, // 不缓存
					processData : false, // 告诉jQuery不要去处理发送的数据
					contentType : false,// 告诉jQuery不要去设置Content-Type请求头
					success : function(result) {
						console.log(result);
						// 将返回的文件路径封装成 img 的Dom对象
						var $img = $('<img/>').attr('src', result);
						// $img[0] 将一个jQuery对象转换成了DOM对象。
						$('#proInfo').summernote('insertNode', $img[0]);
					}
				});
				//
			}
		}
	});
}
/**
 * @param parentId
 * @returns
 */
function initChhildMenu(parentId) {
	$('#menu_second').empty();
	$.ajax({
		url : 'menu/findchild/' + parentId,
		success : function(menuList) {
			if (menuList) {
				var options = '';
				$.each(menuList, function(index, menu) {
					options += '<option value="' + menu.rowId + '">'
							+ menu.menuName + '</option>';
				});
				$('#menu_second').html(options);
			}
		}
	});
}