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
import com.situ.reiz.product.domain.Product;
import com.situ.reiz.product.param.ProductParam;
import com.situ.reiz.product.service.ProductService;
import com.situ.reiz.util.ConfigUtils;
import com.situ.reiz.util.ContextUtils;

@Controller
@RequestMapping("/product")
public class ProductController implements Serializable {
	private static final long serialVersionUID = 1L;
	private static final String PAGE_PRODUCT_INDEX = "product/product_index";
	private static final String APGE_PRODUCT_LIST = "product/product_list";
	private static final String APGE_PRODUCT_ADD = "product/product_add";
	@Autowired
	private MenuService menuService;
	@Autowired
	private ProductService productService;

	@RequestMapping("/index")
	public ModelAndView goIndex(ModelAndView modelAndView) {
		modelAndView.setViewName(PAGE_PRODUCT_INDEX);
		return modelAndView;
	}

	@RequestMapping("/find/{page}")
	public ModelAndView findAllMenu(@PathVariable Integer page, ModelAndView modelAndView) {
		//modelAndView.addObject("menuList", menuService.findAllMenu());
		modelAndView.setViewName(APGE_PRODUCT_LIST);
		return modelAndView;
	}

	/**
	 * @Title: goAddProduct 
	 * @Description:(进新增页面)
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/goadd")
	public ModelAndView goAddProduct(ModelAndView modelAndView) {
		modelAndView.addObject("menuList", menuService.findMenuByParent(Menu.DEFAULT_PARENT_ID));
		modelAndView.setViewName(APGE_PRODUCT_ADD);
		return modelAndView;
	}

	/**
	 * @Title: saveProduct 
	 * @Description:(执行新增)
	 * @param productParam
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/add")
	public Long saveProduct(ProductParam productParam, HttpServletRequest request) {
		//String realPath = request.getServletContext().getRealPath("/");
		String realPath = ConfigUtils.FILE_BASE_PATH;
		String createBy = ContextUtils.getUserCode();
		return this.productService.saveProduct(productParam, realPath, createBy);
	}

	@RequestMapping("/goput/{rowId}")
	public ModelAndView goUpdateProduct(@PathVariable Long rowId, ModelAndView modelAndView) {
		modelAndView.addObject("menuList", menuService.findMenuByParent(Menu.DEFAULT_PARENT_ID));
		Product product = productService.getProductById(rowId);
		Long menuId = product.getMenuId();
		Menu childMenu = menuService.getMenuById(menuId);
		Long parentId = childMenu.getParentId();
		modelAndView.addObject("menu2List", menuService.findMenuByParent(parentId));
		modelAndView.addObject("menuId", menuId);
		modelAndView.addObject("parentId", parentId);
		modelAndView.addObject("product", product);
		modelAndView.setViewName(APGE_PRODUCT_ADD);
		return modelAndView;
	}

	/**
	 * @Title: updateProduct 
	 * @Description:(更新商品信息)
	 * @param productParam
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/put")
	public Long updateProduct(ProductParam productParam, HttpServletRequest request) {
		//String realPath = request.getServletContext().getRealPath("/");
		String realPath = ConfigUtils.FILE_BASE_PATH;
		String createBy = ContextUtils.getUserCode();
		return this.productService.updateProduct(productParam, realPath, createBy);
	}

	@RequestMapping("/list")
	public ModelAndView findAllProduct(ModelAndView modelAndView) {
		modelAndView.addObject("productList", productService.findAllProduct());
		modelAndView.setViewName(APGE_PRODUCT_LIST);
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/changline/{rowId}/{isLine}")
	public Integer doChangeLine(@PathVariable Long rowId, @PathVariable Integer isLine) {
		return this.productService.changeLine(rowId, isLine);
	}
}
