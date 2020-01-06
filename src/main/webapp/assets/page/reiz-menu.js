$(document).ready(function(){
	//点击新增按钮
	$('#button_add').on('click',function(){
		$('#modal_menu').modal('show');
	});
	//对表单绑定校验。
	$('#form_menu_add_edit').validationEngine('attach', {
		onValidationComplete : function(form, status) {
			//如果校验通过
			if(status){
				//执行 新增或修改
				saveOrUpdate();
			}
		}
	});
	//查询所有的数据
	initTalbeData();
	//绑定新增按钮
	$('#button_add').off('click').on('click',function(){
		modalShow('一级目录',-1,1);
	});
	//绑定Submit按钮
	$('#button_submit').off('click').on('click',function(){
		//让当前的表单执行提交动作
		//表单提交动作会触发表单的校验。
		$('#form_menu_add_edit').submit();
	});
	
	//绑定 删除超连接事件 
	$('#dataTable_wrapper').off('click','#deleteA').on('click','#deleteA',function(){
		//this = <a href="javascript:;" data-rowId="2">删除</a>
		//console.log(this);
		var rowId = $(this).attr("data-rowId");
		//console.log(rowId);
		if(confirm("您确定要删除吗？")){
			$.ajax({
				url:'menu/doelete/'+rowId,
				success:function(result){
					if(result){
						initTalbeData();
					}
				}
			});
		}
	});
	
	//绑定搜索按钮
	$('#button_search').on('click',function(){
		//查询所有的数据
		initTalbeData();
	});
});

//显示modal
function modalShow(parentMenuName,parentId,menuKind){
	$('#form_menu_add_edit')[0].reset();
	$('#modal_menu').modal('show');
	//尝试清空所有的校验信息
	$('.formError').remove();
	//尝试移除data-skip这个属性（为了唯一性校验）
	$('#roleName').removeAttr('data-skip');
	//$('#rowId').val('');
	$('#rowId').removeAttr('value');
	$('#parentMenu').val(parentMenuName);
	$('#parentId').val(parentId);
	$('#menuKind').val(menuKind);
	$('#action_info').html('新增');
}
//执行 新增或修改
function saveOrUpdate(){
	var rowId = $('#rowId').val();
	if(rowId){//如果主键有信息，则判断进行的是修改
		$.ajax({
			type:'post',
			url:'menu/doupdate',
			data:$('#form_menu_add_edit').serialize(),
			dataType:'json',
			success:function(result){
				if(result){
					$('#modal_menu').modal('hide');
					initTalbeData();
				}
			}
		});
	}else{//则判断执行的是新增
		$.ajax({
			type:'post',
			url:'menu/add',
			data:$('#form_menu_add_edit').serialize(),
			dataType:'json',
			success:function(result){
				if(result){
					$('#modal_menu').modal('hide');
					initTalbeData();
				}
			}
		});
	}
}
//
function goAddChild(parentId,menuKind,parentName){
	modalShow(parentName,parentId,menuKind);
}
// go update
function goupdate(rowId){
	$.ajax({
		url:'menu/goupdate/'+rowId,
		dataType:'json',
		success:function(role){
			//if(true) js false()
			if(role){
				//将modal表单显示
				$('#modal_menu').modal('show');
				//尝试清空所有的校验信息
				$('.formError').remove();
				//$('#roleName').val(role.roleName);
				var roleName = role.roleName;
				//在需要进行唯一性校验的field里面增加 data-skip这个属性并赋值。
				$('#roleName').val(roleName).attr('data-skip',roleName);
				$('#roleKind').val(role.roleKind);
				$('#roleInfo').val(role.roleInfo);
				$('#rowId').val(role.rowId);
				$('#action_info').html('修改');
			}
		}
	});
}

//init table data
 function initTalbeData(){
	 $.ajax({
		 type:'post',
		 url:'menu/find/',
		 success:function(htmlData){
			 $('#dataTable_wrapper').html(htmlData);
			 $("#example-basic-expandable").treetable({ expandable: true });
		 }
	 });
 }
