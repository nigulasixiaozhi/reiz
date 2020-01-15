/**
 * @Company:中享思途   
 * @Title:ProductServicImpl.java 
 * @Author:wxinpeng   
 * @Date:2019年12月31日 下午1:40:49     
 */
package com.situ.reiz.product.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.situ.reiz.product.dao.ProductDao;
import com.situ.reiz.product.domain.Product;
import com.situ.reiz.product.param.ProductParam;
import com.situ.reiz.product.service.ProductService;
import com.situ.reiz.util.CalendarUtils;
import com.situ.reiz.util.MultipartUtils;
import com.situ.reiz.util.MyBatisUtils;

/** 
 * @ClassName:ProductServicImpl 
 * @Description:(ProductServicImpl)  
 */
@Service
public class ProductServicImpl implements ProductService {
	@Autowired
	private ProductDao productDao;

	/** 
	 * @Title: saveProduct 
	 * @Description:(saveProduct)
	 * @param productParam
	 * @return  
	 */
	@Override
	public Long saveProduct(ProductParam productParam, String realPath, String createBy) {
		CommonsMultipartFile proPathFile = productParam.getProPathFile();
		if (!proPathFile.isEmpty()) {
			//写出文件
			String filePath = MultipartUtils.writeFile(proPathFile, realPath);
			productParam.setProPath(filePath);
		}
		productParam.setProCode(CalendarUtils.getShortDate());
		productParam.setActiveFlag(1);
		productParam.setCreateBy(createBy);
		productParam.setCreateDate(new Date());

		return this.productDao.save(productParam);
	}

	@Override
	public Long updateProduct(ProductParam productParam, String realPath, String createBy) {
		Product editProduct = productDao.get(productParam.getRowId());
		editProduct = MyBatisUtils.buildEditData(editProduct, productParam);
		CommonsMultipartFile proPathFile = productParam.getProPathFile();
		if (!proPathFile.isEmpty()) {
			//写出文件
			String filePath = MultipartUtils.writeFile(proPathFile, realPath);
			editProduct.setProPath(filePath);
		}
		this.productDao.update(editProduct);
		return editProduct.getRowId();
	}

	@Override
	public List<Product> findAllProduct() {
		return this.productDao.find();
	}

	@Override
	public Product getProductById(Long rowId) {
		return productDao.get(rowId);
	}

	/** 
	 * @Title: changeLine 
	 * @Description:(修改上下架)
	 * @param rowId
	 * @param isLine
	 * @return  
	 */
	@Override
	public Integer changeLine(Long rowId, Integer lineStatus) {
		Integer isLine = lineStatus == 1 ? 0 : 1;
		this.productDao.updateLine(rowId, isLine);
		return 1;
	}
}
