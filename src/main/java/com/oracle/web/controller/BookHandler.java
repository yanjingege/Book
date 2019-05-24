package com.oracle.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.service.BookService;
import com.oracle.web.service.FenleiService;

@Controller
@Scope(value = "prototype")
public class BookHandler {

	
	@Autowired
	private BookService bookService;

	@Autowired
	private FenleiService fenleiService;
	
	@RequestMapping(value = "/addUI", method = RequestMethod.GET)
	public String addUI(HttpServletRequest request) {

		List<Fenlei> fList = FenleiService.list();

		request.setAttribute("fList", fList);

		return "addBook";
	}

	@RequestMapping(value = "/addBook", method = RequestMethod.POST)
	public String add(Book book) {

		int i = bookService.save(book);

		return "redirect:/books";
	}

}
