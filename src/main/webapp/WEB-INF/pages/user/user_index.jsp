<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i> 用户管理
		<button type="button" class="btn btn-info btn-xs float-right" id="button_add">新增</button>
	</div>
	<div class="card-body">
		<!-- 搜索页面开始 -->
		<!-- 搜索页面结束 -->
		<div class="table-responsive">
			<div id="dataTable_user" class="dataTables_wrapper dt-bootstrap4"></div>
		</div>
	</div>
</div>
<!-- Logout Modal-->
<div class="modal fade" id="modal_user" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">
					用户<span id="action_info"></span>
				</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<form id="form_user_add_edit">
				<div class="modal-body">
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">用户名称</label>
						<div class="col-sm-7">
							<input class="form-control validate[required]" id="userName" name="userName">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">登录账号</label>
						<div class="col-sm-7">
							<input class="form-control validate[required,ajax[ajaxUserCode]]" id="userCode" name="userCode">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">登录密码</label>
						<div class="col-sm-7">
							<input class="form-control validate[required]" id="userPass" name="userPass">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">密码重复</label>
						<div class="col-sm-7">
							<input class="form-control validate[required]" id="confimPass">
						</div>
					</div>
					<input type="hidden" name="rowId" id="rowId" />
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
					<button class="btn btn-primary" type="submit" id="button_submit">提交</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="assets/page/reiz-user.js"></script>