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
	public int save(Book book) {
		// TODO Auto-generated method stub
		return this.bookMapper.insert(book);
	}

	@Override
	@Transactional
	public List<SubBook> list() {
		// TODO Auto-generated method stub
		return this.bookMapper.selectAllWithOneSQL();
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
	public PageBean<SubBook> showByPage(Integer pageNow) {
		// TODO Auto-generated method stub
		
        PageBean<SubBook> pb = new PageBean<SubBook>();

		
		PageHelper.startPage(pageNow, 2);
		
		List<SubBook> list = this.bookMapper.showByPageHelper();
		
		pb.setBeanList(list);
		
		//总记录数
		System.out.println("ok2");
		
		PageInfo<SubBook> pi=new PageInfo<SubBook>(list);
		
		//pb
		pb.setCounts((int) pi.getTotal());
		
		//当前页
		pb.setPageNow(pi.getPageNum());
		
		//每页显示的条数 自定义
		pb.setPageSize(pi.getPageSize());
		
		return pb;
		
	}

}
