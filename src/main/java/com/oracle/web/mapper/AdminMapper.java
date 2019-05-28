package com.oracle.web.mapper;

import java.util.List;

import com.oracle.web.bean.Admin;

public interface AdminMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbg.generated Tue May 07 17:10:48 CST 2019
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbg.generated Tue May 07 17:10:48 CST 2019
     */
    int insert(Admin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbg.generated Tue May 07 17:10:48 CST 2019
     */
    Admin selectByPrimaryKey(Admin admin);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbg.generated Tue May 07 17:10:48 CST 2019
     */
    List<Admin> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table admin
     *
     * @mbg.generated Tue May 07 17:10:48 CST 2019
     */
    int updateByPrimaryKey(Admin record);

}