package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.User;

public interface UserService {

	int save(User user);
	
	List<User> list();

	void delete(String[] arr);

	User queryOneUser(Integer id);

	void update(User user);

	PageBean<User> selectAllPage(Integer pageNow);

	List<User> queryUsers(String[] arr);

	List<User> list2();


}
