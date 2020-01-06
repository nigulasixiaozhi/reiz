package com.situ.reiz.product.controller;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.situ.reiz.menu.domain.Menu;
import com.situ.reiz.menu.service.MenuService;
import com.situ.reiz.product.param.ProductParam;
import com.situ.reiz.product.service.ProductService;
import com.situ.reiz.util.ContextUtils;

@Controller
@RequestMapping("/product")
public class ProductController implements Serializable {
	private static final long serialVersionUID = 1L;
	private static final String PAGE_PRODUCT_INDEX = "product/product_index";
	private static final String APGE_PRODUCT_LIST = "product/product_list";
	@Autowired
	private MenuService menuService;
	@Autowired
	private ProductService productService;

	@RequestMapping("/index")
	public ModelAndView goIndex(ModelAndView modelAndView) {
		modelAndView.addObject("menuList", menuService.findMenuByParent(Menu.DEFAULT_PARENT_ID));
		modelAndView.setViewName(PAGE_PRODUCT_INDEX);
		return modelAndView;
	}

	@RequestMapping("/find/{page}")
	public ModelAndView findAllMenu(@PathVariable Integer page, ModelAndView modelAndView) {
		//modelAndView.addObject("menuList", menuService.findAllMenu());
		modelAndView.setViewName(APGE_PRODUCT_LIST);
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/add")
	public Long saveProduct(ProductParam productParam, HttpServletRequest request) {
		String realPath = request.getServletContext().getRealPath("/");
		String createBy = ContextUtils.getUserCode();
		return this.productService.saveProduct(productParam, realPath, createBy);
	}

	@RequestMapping("/list")
	public ModelAndView findAllProduct(ModelAndView modelAndView) {
		modelAndView.addObject("productList", productService.findAllProduct());
		modelAndView.setViewName(APGE_PRODUCT_LIST);
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/changline/{rowId}/{isLine}")
	public Integer doChangeLine(@PathVariable Long rowId,@PathVariable Integer isLine) {
		return this.productService.changeLine(rowId, isLine);
	}
}
