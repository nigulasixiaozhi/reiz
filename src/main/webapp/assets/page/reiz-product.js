$(document).ready(function(){
	//点击新增按钮
	$('#button_add').on('click',function(){
		$.ajax({
			url:'product/goadd',
			success:function(htmldata){
				$('#container-admin').html(htmldata);
			}
		});
	});
	
	initTalbeData();
});

//进修改
function goputpro(rowId){
	$.ajax({
		url:'product/goput/'+rowId,
		success:function(htmldata){
			$('#container-admin').html(htmldata);
		}
	});
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