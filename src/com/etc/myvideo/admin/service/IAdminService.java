package com.etc.myvideo.admin.service;

import com.etc.myvideo.admin.dao.IAdminDao;
import com.etc.myvideo.admin.entity.Admin;

public interface IAdminService {

	public abstract void setAdminDao(IAdminDao AdminDao);

	// 按用户名查询用户的方法:
	public abstract Admin findByAdminName(String AdminName);

	// 业务层完成用户注册代码:
	public abstract void save(Admin admin);

	// 修改用户的状态的方法
	public abstract void update(Admin existAdmin);

	// 用户登录的方法
	public abstract Admin login(Admin Admin);
	//通过邮箱查找
	public abstract Admin findByEmail(String email);
	//個人信息查看
	public Admin findByAdminId(int AdminId);

}