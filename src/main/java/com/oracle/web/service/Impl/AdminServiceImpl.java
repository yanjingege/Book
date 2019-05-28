package com.oracle.web.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.web.bean.Admin;
import com.oracle.web.mapper.AdminMapper;
import com.oracle.web.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;

	@Override
	@Transactional
	public int save(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapper.insert(admin);
	}

	@Override
	@Transactional
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return this.adminMapper.selectByPrimaryKey(admin);
	}

	@Override
	@Transactional(readOnly=true)
	public Admin show(Admin admin) {
		// TODO Auto-generated method stub
		return this.adminMapper.selectByPrimaryKey(admin);
	}

	
}
