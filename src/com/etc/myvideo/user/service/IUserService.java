package com.etc.myvideo.user.service;

import java.util.List;

import com.etc.myvideo.user.dao.IUserDao;
import com.etc.myvideo.user.entity.User;
import com.etc.myvideo.util.PageBean;


public interface IUserService {

	public abstract void setUserDao(IUserDao userDao);

	// 按用户名查询用户的方法:
	public abstract User findByUsername(String username);

	// 业务层完成用户注册代码:
	public abstract void save(User user);

	// 业务层根据激活码查询用户
	public abstract User findByCode(String code);

	// 修改用户的状态的方法
	public abstract void update(User existUser);

	// 用户登录的方法
	public abstract User login(User user);
	
	//通过邮箱查找
	public abstract User findByEmail(String email);
	
	//根据ID查询用户
	public User findByUserId(int userId);

	//查询所有用户
	public List<User> findAll();
	
	//分页查询所有用户
	public PageBean<User> findAll(int page);

	void findPass(User user);
	
	public void delete(int id);
}