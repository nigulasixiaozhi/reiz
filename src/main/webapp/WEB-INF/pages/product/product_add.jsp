<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i> 商品管理
	</div>
	<div class="card-body">
		<form id="form_product_add_edit">
			<div class="modal-body">
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">商品目录</label>
					<div class="col-sm-7 form-row">
						<div class="col">
							<select class="form-control" id="menu_first">
								<c:if test="${!empty menuList}">
									<c:forEach items="${menuList}" var="menu">
										<option value="${menu.rowId}" <c:if test="${menu.rowId==parentId}">selected="selected"</c:if>>${menu.menuName}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="col">
							<select class="form-control" id="menu_second" name="menuId">
								<c:if test="${!empty menu2List}">
									<c:forEach items="${menu2List}" var="menu">
										<option value="${menu.rowId}" <c:if test="${menu.rowId==menuId}">selected="selected"</c:if>>${menu.menuName}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">商品名称</label>
					<div class="col-sm-7">
						<input class="form-control validate[required]" id="proName" name="proName" value="${product.proName}">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">商品价格</label>
					<div class="col-sm-3">
						<input class="form-control validate[required]" id="oldPrice" name="oldPrice" value="${product.oldPrice}" placeholder="原价">
					</div>
					<div class="col-sm-3">
						<input class="form-control validate[required]" id="newPrice" name="newPrice" value="${product.newPrice}" placeholder="售价">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">库存数据</label>
					<div class="col-sm-3">
						<input class="form-control validate[required]" id="proCount" name="proCount" value="${product.proCount}">
					</div>
					<label class="col-sm-2 col-form-label">上架状态</label>
					<div class="col-sm-2">
						<select class="form-control" id="isLine" name="isLine">
							<option value="1" <c:if test="${isLine==1}">selected="selected"</c:if>>上架</option>
							<option value="0" <c:if test="${isLine==0}">selected="selected"</c:if>>下架</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">商品主图</label>
					<div class="col-sm-7">
						<input type="file" class="form-control" id="proPathFile" name="proPathFile">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">商品简介</label>
					<div class="col-sm-9">
						<textarea class="form-control validate[required]" name="proInfo" id="proInfo">${product.proInfo}</textarea>
					</div>
				</div>
				<input type="hidden" name="rowId" id="rowId" value="${product.rowId}"/>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" id="but_go_pro_index">取消</button>
				<input class="btn btn-primary" type="submit" value="提交">
			</div>
		</form>
	</div>
</div>
<script src="assets/page/reiz-product-add.js"></script>