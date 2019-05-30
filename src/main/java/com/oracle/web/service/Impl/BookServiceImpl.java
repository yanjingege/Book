package com.oracle.web.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.web.bean.Book;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.SubBook;
import com.oracle.web.mapper.BookMapper;
import com.oracle.web.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookMapper bookMapper;

	@Override
	@Transactional
	public List<Book> list() {
		// TODO Auto-generated method stub
		return this.bookMapper.selectAll();
	}

	@Override
	@Transactional
	public int save(Book book) {
		// TODO Auto-generated method stub
		return this.bookMapper.insert(book);
	}

	
	@Override
	@Transactional
	public void delete(Book book) {
		// TODO Auto-generated method stub
		this.bookMapper.deleteByPrimaryKey(book.getId());
	}

	@Override
	@Transactional
	public Book queryOne(Integer id) {
		// TODO Auto-generated method stub
		return this.bookMapper.selectByPrimaryKey(id);
	}

	@Override
	@Transactional
	public void update(Book book) {
		// TODO Auto-generated method stub
		 this.bookMapper.updateByPrimaryKey(book);
	}

	@Override
	@Transactional
	public PageBean<SubBook> showAllByPage(Integer pageNow) {
		// TODO Auto-generated method stub
		
		PageBean<SubBook> pb = new PageBean<SubBook>();

		PageHelper.startPage(pageNow, 5);

		List<SubBook> list = this.bookMapper.showAllByPage();

		pb.setBeanList(list);

		PageInfo<SubBook> pi = new PageInfo<SubBook>(list);

		pb.setCounts((int) pi.getTotal());

		pb.setPageNow(pi.getPageNum());

		pb.setPageSize(pi.getPageSize());

		return pb;
	}
	

}
