/**
 * @Company:中享思途   
 * @Title:ProductService.java 
 * @Author:wxinpeng   
 * @Date:2019年12月31日 下午1:39:43     
 */
package com.situ.reiz.product.service;

import java.util.List;

import com.situ.reiz.product.domain.Product;
import com.situ.reiz.product.param.ProductParam;

/** 
 * @ClassName:ProductService 
 * @Description:(ProductService)  
 */
public interface ProductService {
	Long saveProduct(ProductParam productParam, String realPath, String createBy);

	Long updateProduct(ProductParam productParam, String realPath, String createBy);

	List<Product> findAllProduct();

	Integer changeLine(Long rowId, Integer isLine);

	Product getProductById(Long rowId);
}
