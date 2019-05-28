package com.oracle.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.PageBean;
import com.oracle.web.service.FenleiService;

@Controller
@Scope(value = "prototype")
public class FenleiHandler {

	@Autowired
	private FenleiService fenleiService;

	@RequestMapping(value = "/fenleis1", method = RequestMethod.GET)
	public String fenleis(HttpServletRequest request) {

		List<Fenlei> list = fenleiService.list();

		//System.out.println(list);

		request.setAttribute("fList", list);

		return "showFenlei";
	}

	

	@RequestMapping(value = "/fenlei", method = RequestMethod.POST)
	public String add(Fenlei fenlei) {

		fenleiService.save(fenlei);

		return "redirect:/fenleis/1";

	}

	@RequestMapping(value = "/fenlei_delete/{fid}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("fid") Integer id) {

		Fenlei f = new Fenlei();

		f.setFid(id);

		fenleiService.delete(f);

		return "redirect:/fenleis/1";

	}

	@RequestMapping(value = "/fenlei/{fid}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("fid") Integer id, HttpSession session) {

		Fenlei fenlei = fenleiService.selectByPrimaryKey(id);

		session.setAttribute("s", fenlei);
		
		return "updateFenlei";//Forward

	}

	@RequestMapping(value = "/fenleiupdate", method = RequestMethod.PUT)
	public String update(Fenlei fenlei) {

		fenleiService.update(fenlei);

		return "redirect:/fenleis/1";
	}

	@RequestMapping(value = "/fenleis/{pageNow}", method = RequestMethod.GET)
	public String list(@PathVariable(value = "pageNow") Integer pageNow, HttpServletRequest request) {

		if (pageNow == null || pageNow < 1) {

			pageNow = 1;

		}

		PageBean<Fenlei> pb = this.fenleiService.selectAllByPageHelper(pageNow);

		request.setAttribute("pb", pb);

		System.out.println(pb);

		return "showFenlei";
	}

	

	@RequestMapping(value = "/queryone", method = RequestMethod.POST)
	public String queryone(String fname,HttpSession session,HttpServletResponse response) throws IOException {

		System.out.println(fname);

		Fenlei a = this.fenleiService.queryone(fname);


		response.setContentType("text/html;charset=utf-8");

		if (a != null) {

			response.getWriter().write("{\"valid\":\"false\"}");

		} else {

			response.getWriter().write("{\"valid\":\"true\"}");// 不存在
		}

		return null;

	}
}
