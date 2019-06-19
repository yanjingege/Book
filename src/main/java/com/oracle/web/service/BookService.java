package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.SubBook;

public interface BookService {

	int save(Book book);

	List<Book> list();

	SubBook queryOne(Integer id);

	void update(Book book);

	PageBean<SubBook> showAllByPage(Integer pageNow);

	void delete(String[] arr);

	List<Book> queryBooks(String[] arr);

	List<Book> list2();

	PageBean<SubBook> selectAllByPageHelperAndWhere(Book where, int pageNow);

	Book validateName(String name);

}
