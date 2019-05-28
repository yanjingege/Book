package com.oracle.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.SubBook;
import com.oracle.web.service.BookService;
import com.oracle.web.service.FenleiService;

@Controller
@Scope(value = "prototype")
public class BookHandler {

	private static final String NONE = null;
	
	@Autowired
	private BookService bookService;

	@Autowired
	private FenleiService fenleiService;
	
//	@RequestMapping(value = "/books", method = RequestMethod.GET)
//	public String selectBooks(HttpServletRequest request) {// 全查
//
//		List<SubBook> mlist = this.bookService.list();
//
//		///System.out.println(mlist);
//
//		request.setAttribute("mlist", mlist);
//
//		return "showBook";
//	}
	
	
	@RequestMapping(value = "/addUI", method = RequestMethod.GET)
	public String addUI(HttpServletRequest request) {

		List<Fenlei> flist = FenleiService.list();

		request.setAttribute("flist", flist);

		return "addBook";
	}

	@RequestMapping(value = "/addBook", method = RequestMethod.POST)
	public String add(Book book) {

		bookService.save(book);

		return "redirect:/showByPage";
	}
	

	@RequestMapping(value="/deleteBook/{id}",method=RequestMethod.DELETE)
	public String deleteBook(@PathVariable(value="id") Integer id){
	
		Book book=new Book();
		
		book.setId(id);
		
		bookService.delete(book);

		return  "redirect:/showByPage";
		
	}
	
	@RequestMapping(value="/book/{id}",method=RequestMethod.GET)
	public String updateUI(@PathVariable(value="id") Integer id ,HttpSession session){
		
		Book book=this.bookService.queryOne(id);
		
		session.setAttribute("b", book);
		
		List<Fenlei> flist=FenleiService.list();
		
		session.setAttribute("flist", flist);
		
		return "redirect:/updateBook.jsp";
		
	}
	
	@RequestMapping(value="/updatebook",method=RequestMethod.PUT)
	public String update(Book book){
		
	    bookService.update(book);
	
		return "redirect:/showByPage";
		
	}
	
	@RequestMapping(value = "/showByPage", method = RequestMethod.GET)
	public String showByPage( Integer pageNow, HttpServletRequest request) {
		
		if(pageNow==null || pageNow<1){
			
			pageNow=1;
		}
		
		PageBean<SubBook> pb=this.bookService.showByPage(pageNow);
		
		request.setAttribute("pb", pb);
		
		return "showBook";
		
	}
}
