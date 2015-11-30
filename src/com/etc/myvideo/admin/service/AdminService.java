package com.etc.myvideo.admin.service;

import com.etc.myvideo.admin.dao.IAdminDao;
import com.etc.myvideo.admin.entity.Admin;



public class AdminService implements IAdminService {
	// ×¢ÈëadminDao
	  private IAdminDao adminDao;

	public IAdminDao getAdminDao() {
		return adminDao;
	}
	

	@Override
	public void setAdminDao(IAdminDao AdminDao) {
		this.adminDao=AdminDao;
		
	}

	@Override
	public Admin findByAdminName(String AdminName) {
		return adminDao.findByAdminName(AdminName);
	}

	@Override
	public void save(Admin admin) {
		adminDao.save(admin);
		
	}

	@Override
	public void update(Admin existAdmin) {
		adminDao.update(existAdmin);
		
	}

	@Override
	public Admin login(Admin Admin) {
		return adminDao.login(Admin);
	}

	@Override
	public Admin findByEmail(String email) {
		return adminDao.findByEmail(email);
	}

	@Override
	public Admin findByAdminId(int AdminId) {
		return adminDao.findByAdminId(AdminId);
	}

		

		
}
