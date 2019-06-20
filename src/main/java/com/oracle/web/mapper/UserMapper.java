package com.oracle.web.mapper;

import com.oracle.web.bean.User;
import java.util.List;

public interface UserMapper {
  

    int deleteByPrimaryKey(String[] arr);
  
    int insert(User record);
   
    User selectByPrimaryKey(Integer id);
   
    List<User> selectAll();

    int updateByPrimaryKey(User record);
    
    int selectCount();

	List<User> sesectAllBypage();

	List<User> queryUsers(String[] arr);

	List<User> selectAll2();
}