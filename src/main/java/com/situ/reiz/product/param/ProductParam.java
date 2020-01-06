package com.situ.reiz.product.param;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.situ.reiz.product.domain.Product;

public class ProductParam extends Product {
	private static final long serialVersionUID = 1L;
	
	//上传一个主图
	private CommonsMultipartFile proPathFile;
	
	private List<CommonsMultipartFile>childPathFile;
	
	public List<CommonsMultipartFile> getChildPathFile() {
		return childPathFile;
	}

	public void setChildPathFile(List<CommonsMultipartFile> childPathFile) {
		this.childPathFile = childPathFile;
	}

	public CommonsMultipartFile getProPathFile() {
		return proPathFile;
	}

	public void setProPathFile(CommonsMultipartFile proPathFile) {
		this.proPathFile = proPathFile;
	}
}
