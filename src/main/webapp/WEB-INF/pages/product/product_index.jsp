<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i> 商品管理
		<button type="button" class="btn btn-info btn-xs float-right" id="button_add">新增</button>
	</div>
	<div class="card-body">
		<!-- 搜索页面开始 -->
		<!-- 搜索页面结束 -->
		<div class="table-responsive">
			<div id="dataTable_product" class="dataTables_wrapper dt-bootstrap4"></div>
		</div>
	</div>
</div>
<!-- Logout Modal-->
<div class="modal fade" id="modal_product" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">
					商品<span id="action_info"></span>
				</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<form id="form_product_add_edit">
				<div class="modal-body">
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">商品目录</label>
						<div class="col-sm-7 form-row">
							<div class="col">
								<select class="form-control" id="menu_first">
									<c:if test="${!empty menuList}">
										<c:forEach items="${menuList}" var="menu">
											<option value="${menu.rowId}">${menu.menuName}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<div class="col">
								<select class="form-control" id="menu_second" name="menuId">
								</select>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">商品名称</label>
						<div class="col-sm-7">
							<input class="form-control validate[required]" id="proName" name="proName">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">商品价格</label>
						<div class="col-sm-3">
							<input class="form-control validate[required]" id="oldPrice" name="oldPrice" placeholder="原价">
						</div>
						<div class="col-sm-3">
							<input class="form-control validate[required]" id="newPrice" name="newPrice" placeholder="售价">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">库存数据</label>
						<div class="col-sm-7">
							<input class="form-control validate[required]" id="proCount" name="proCount">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">上架状态</label>
						<div class="col-sm-7">
							<select class="form-control" id="isLine" name="isLine">
							<option value="1">上架</option>
							<option value="0">下架</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">商品主图</label>
						<div class="col-sm-7">
							<input type="file" class="form-control validate[required]" id="proPathFile" name="proPathFile">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">商品简介</label>
						<div class="col-sm-7">
							<textarea class="form-control validate[required]" name="proInfo" id="proInfo"></textarea>
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
<script src="assets/page/reiz-product.js"></script>