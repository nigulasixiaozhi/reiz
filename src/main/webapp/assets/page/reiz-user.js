$(document).ready(function() {
	// 查询用户的信息
	initUserData();
	// 绑定新增按钮
	$('#button_add').on('click', function() {
		$('#modal_user').modal('show');
		$('#action_info').html($('#rowId').val() == '' ? '新增' : '修改');
	});

	// 对表单绑定校验。
	$('#form_user_add_edit').validationEngine('attach', {
		onValidationComplete : function(form, status) {
			// 如果校验通过
			if (status) {
				// 执行 新增或修改
				saveOrUpdate();
			}
		}
	});
});
function initUserData() {
	$.ajax({
		url : 'user/list',
		success : function(htmlData) {
			$('#dataTable_user').html(htmlData);
		}
	});
}
function saveOrUpdate() {
	if ($('#rowId').val()) {

	} else {
		$.ajax({
			type : 'post',
			url : 'user/add',
			data : $('#form_user_add_edit').serialize(),
			success : function(result) {
				if (result) {
					$('#modal_user').modal('hide');
					initUserData();
				}
			}
		});
	}
}
function doLock(rowId, lockStatus) {
	var isLock = lockStatus == 0 ? 1 : 0;
	$.ajax({
		url:'user/lock/'+rowId+"/"+isLock,
		success:function(result){
			if(result){
				
			}
		}
	});
}