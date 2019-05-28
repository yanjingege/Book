package com.oracle.web.mapper;

import com.oracle.web.bean.Admin;
import java.util.List;

public interface AdminMapper {
    
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    Admin selectByPrimaryKey(Integer id);

    List<Admin> selectAll();

    int updateByPrimaryKey(Admin record);
}