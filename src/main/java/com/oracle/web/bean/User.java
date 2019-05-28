package com.oracle.web.bean;

import java.util.Date;

public class User {
   
    private Integer id;

    private String name;

    private String username;

    private String touxiang;

    private String password;

    private String phone;

    private Date time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }
    
    public String getTouxiang() {
        return touxiang;
    }

    public void setTouxiang(String touxiang) {
        this.touxiang = touxiang == null ? null : touxiang.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}