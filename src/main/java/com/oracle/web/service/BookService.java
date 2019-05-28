package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.SubBook;

public interface BookService {

	int save(Book book);

	List<SubBook> list();

	void delete(Book book);

	Book queryOne(Integer id);

	void update(Book book);

	PageBean<SubBook> showByPage(Integer pageNow);

}
