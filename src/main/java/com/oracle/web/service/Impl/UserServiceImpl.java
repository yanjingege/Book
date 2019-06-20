package com.oracle.web.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.User;
import com.oracle.web.mapper.UserMapper;
import com.oracle.web.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	@Transactional()
	public int save(User user) {
		// TODO Auto-generated method stub
		return this.userMapper.insert(user);
	}

	@Override
	@Transactional
	public List<User> list() {
		// TODO Auto-generated method stub
		return this.userMapper.selectAll();
	}
	

	@Override
	@Transactional(readOnly = true)
	public User queryOneUser(Integer id) {
		// TODO Auto-generated method stub
		return this.userMapper.selectByPrimaryKey(id);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		this.userMapper.updateByPrimaryKey(user);
	}

	@Override
	@Transactional
	public PageBean<User> selectAllPage(Integer pageNow) {
		// TODO Auto-generated method stub
		PageBean<User> pb = new PageBean<User>();
		
		PageHelper.startPage(pageNow,5);
		
		List<User> list=this.userMapper.sesectAllBypage();
		
		pb.setBeanList(list);

		PageInfo<User> pi=new PageInfo<User>(list);
		
		pb.setCounts((int) pi.getTotal());
		
		pb.setPageNow(pi.getPageNum());

		pb.setPageSize(5);
		
		return pb;
	}

	@Override
	@Transactional
	public void delete(String[] arr) {
		
		this.userMapper.deleteByPrimaryKey(arr);
		
	}

	@Override
	public List<User> queryUsers(String[] arr) {
		// TODO Auto-generated method stub
		return this.userMapper.queryUsers(arr);
	}

	@Override
	public List<User> list2() {
		// TODO Auto-generated method stub
		return this.userMapper.selectAll2();
	}


	}

