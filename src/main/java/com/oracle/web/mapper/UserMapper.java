package com.oracle.web.mapper;

import com.oracle.web.bean.User;
import java.util.List;

public interface UserMapper {
  
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);
}