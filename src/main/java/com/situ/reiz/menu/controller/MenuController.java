package com.situ.reiz.menu.controller;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.situ.reiz.base.FieldParam;
import com.situ.reiz.menu.domain.Menu;
import com.situ.reiz.menu.service.MenuService;
import com.situ.reiz.util.ContextUtils;

@Controller
@RequestMapping("/menu")
public class MenuController implements Serializable {
	private static final long serialVersionUID = 1L;
	private static final String PAGE_MENU_INDEX = "menu/menu_index";
	private static final String PAGE_MENU_LIST = "menu/menu_list";
	@Autowired
	private MenuService menuService;

	@RequestMapping("/index")
	public ModelAndView goIndex(ModelAndView modelAndView) {
		modelAndView.setViewName(PAGE_MENU_INDEX);
		return modelAndView;
	}

	@RequestMapping("/find")
	public ModelAndView findAllMenu(ModelAndView modelAndView) {
		modelAndView.addObject("menuList", menuService.findAllMenu());
		modelAndView.setViewName(PAGE_MENU_LIST);
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/findchild/{parentId}")
	public List<Menu> findchildMenu(@PathVariable Long parentId) {
		return this.menuService.findMenuByParent(parentId);
	}

	@ResponseBody
	@RequestMapping("/checkMenuName")
	// public String checkMenuName(String fieldId,String fieldValue,Long parentId) {
	public String checkMenuName(FieldParam fieldParam, Long parentId) {
		return this.menuService.checkMenuName(fieldParam, parentId);
	}

	@ResponseBody
	@RequestMapping("/add")
	public Long doAddMenu(Menu menu) {
		String createBy = null;
		/*Object object = session.getAttribute(ConfigUtils.SESSION_ADMIN_LOGIN);
		if (object != null) {
			User user = (User) object;
			createBy = user.getUserCode();
		}*/
		createBy = ContextUtils.getUserCode();
		return this.menuService.saveMenu(menu, createBy);
		//SevletAPI
		// HttpServletRequest HttpServletResponse  HttpSession  ServetContext 
		// 这些ServletAPI 尽量不要向service 传输。

		//return this.menuService.saveMenu(menu, ContextUtils.getCreateBy());
	}
}
