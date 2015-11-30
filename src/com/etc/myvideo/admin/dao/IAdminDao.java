package com.etc.myvideo.admin.dao;

import com.etc.myvideo.admin.entity.Admin;



public interface IAdminDao {

	// 按名查询是否有该用户:
	public abstract Admin findByAdminName(String AdminName);

	// 注册用户存入数据库代码实现
	public abstract void save(Admin admin);

	// 修改用户状态的方法
	public abstract void update(Admin existAdmin);

	// 用户登录的方法
	public abstract Admin login(Admin Admin);

	public abstract Admin findByEmail(String email);
	
	public abstract Admin findByAdminId(int AdminId);

}