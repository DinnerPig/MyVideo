package com.etc.myvideo.user.dao;

import java.util.List;

import com.etc.myvideo.user.entity.User;


public interface IUserDao {

	// 按名查询是否有该用户:
	public abstract User findByUsername(String username);

	// 注册用户存入数据库代码实现
	public abstract void save(User user);

	// 根据激活码查询用户
	public abstract User findByCode(String code);

	// 修改用户状态的方法
	public abstract void update(User existUser);

	// 用户登录的方法
	public abstract User login(User user);

	//根据Id查询用户
	public abstract User findByEmail(String email);
	
	//根据Id查询用户
	public abstract User findByUserId(int userId);
	
	// 查询所有用户
	public abstract List<User> findAll();
	
	// 分页查询所有用户
	public abstract List<User> findAll(int begin, int limit);
	
	public void delete(int id);
}