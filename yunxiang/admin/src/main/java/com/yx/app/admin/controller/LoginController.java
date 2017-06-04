package com.yx.app.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yx.app.admin.common.util.MD5Util;
import com.yx.app.admin.model.Menu;
import com.yx.app.admin.model.Role;
import com.yx.app.admin.model.User;


/*
 * 
 * 登录功能
 * 
 * */
@Controller
@RequestMapping("/*")
public class LoginController {

	/*@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@Autowired
	@Qualifier("roleService")
	private RoleService roleService;
	
	@Autowired
	@Qualifier("menuService")
	private MenuService menuService;*/

	/*
	 * 登录功能
	 */
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("LoginController, login");

		HttpSession session = request.getSession();
		ModelAndView mnv = new ModelAndView();
		
		User user = new User();
		user.setUserName(request.getParameter("username"));
		String msg = "";
		
		if (request.getParameter("password") != null && !request.getParameter("password").equals("")) {
			user.setPassword_(MD5Util.string2MD5(request.getParameter("password")));
		} else {
			mnv.setViewName("forward:/html/login/login.jsp");
			return mnv;
		}
		
		User auth_user = null;//userService.login(user);
		
		if (auth_user != null) {
			//List<Role> roleList = roleService.getRoleListByUserId(auth_user.getUserId());
			//auth_user.setRoleList(roleList);
			List<Menu> menuList = getUserMenus(auth_user);
			
			session.setAttribute("user", auth_user);
			session.setAttribute("menu", menuList);
		} else {
			msg = "用户名或密码不正确!";
			mnv.addObject("msg", msg);
			mnv.setViewName("forward:/html/login/login.jsp");
			return mnv;
		}
		
		mnv.setViewName("redirect:/html/index.jsp");
		return mnv;
	}
	
	/**
	 * 注销页面
	 * 
	 * @return
	 */
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpSession session) {
		ModelAndView mnv = new ModelAndView("forward:/html/login/login.jsp");
		Object user = session.getAttribute("user");
		/**
		 * 不等于空，才进行service操作
		 */
		if (null != user) {
			session.removeAttribute("user");
			session.removeAttribute("menu");
		}
		return mnv;
	}
	
	
	private List<Menu> getUserMenus(User auth_user){
		
		
		List<Menu> userMenus =null;// menuService.getMenuListByUser(auth_user);

		Menu bean = new Menu();
		bean.setParentId(0);
		List<Menu> allMenus = null;//menuService.getMenuBy(bean);
		List<Menu> tmpMenus = new ArrayList<Menu>();
		for (Menu menu : allMenus) {
			if (userMenus.contains(menu)) {
				tmpMenus.add(menu);
			}
			for (Menu cMenu : menu.getChildren()) {
				if (userMenus.contains(cMenu)) {
					tmpMenus.add(cMenu);
				}
				for (Menu ccMenu : cMenu.getChildren()) {
					if (userMenus.contains(ccMenu)) {
						tmpMenus.add(ccMenu);
					}
				}
			}
		}
		
		return tmpMenus;

	}

	
}
