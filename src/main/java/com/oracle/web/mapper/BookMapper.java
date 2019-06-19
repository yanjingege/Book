package com.oracle.web.mapper;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;

import java.util.List;

public interface BookMapper {
    
    int insert(Book record);

    SubBook selectByPrimaryKey(Integer id);

    List<Book> selectAll();

    int updateByPrimaryKey(Book record);

    int selectCounts();
    
	List<SubBook> showAllByPage();

	int deleteByPrimaryKey(String[] arr);

	List<Book> queryBooks(String[] arr);

	List<Book> selectAll2();

	List<SubBook> selectAllByPageHelperAndWhere(Book where);

	Book validateName(String name);

}