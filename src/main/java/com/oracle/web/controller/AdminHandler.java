package com.oracle.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.oracle.web.bean.Admin;
import com.oracle.web.service.AdminService;

@Controller
@Scope(value = "prototype")
public class AdminHandler {

	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Admin admin) {
		adminService.save(admin);
		return "redirect:/login.jsp";

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Admin admin) {
		Admin admin1 = this.adminService.login(admin);

		if (admin1 == null) {

			return "redirect:/login.jsp";
		}

		if (!admin1.getPassword().equals(admin.getPassword())) {

			return "redirect:/login.jsp";
		}

		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public String show(Admin admin,HttpSession session){
		Admin admin2 = this.adminService.show(admin);
		session.setAttribute("m", admin2);
       	return "redirect:/showAdmin.jsp";
	}

}
