package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Admin;

public interface AdminService {

	int save(Admin admin);

	Admin login(Admin admin);

	Admin show(Admin admin);


}
