package com.etc.myvideo.admin.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.etc.myvideo.admin.entity.Admin;



/**
 *  管理员dao层
 * @author Administrator
 *
 */
public class AdminDao extends HibernateDaoSupport implements IAdminDao {

	/**
	 * 根据用户名查找
	 */
	@Override
	public Admin findByAdminName(String AdminName) {
		String hql = "from Admin where username = ?";
		List<Admin> list = this.getHibernateTemplate().find(hql, AdminName);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
    
	/**
	 * 添加管理员
	 */
	@Override
	public void save(Admin Admin) {
		this.getHibernateTemplate().save(Admin);
	}


	/**
	 * 更新和修改管理员
	 */
	@Override
	public void update(Admin existAdmin) {
		this.getHibernateTemplate().update(existAdmin);
	}

	/**
	 * 管理员登录方法
	 */
	@Override
	public Admin login(Admin Admin) {
		String hql = "from Admin where username = ? and password = ?";
		List<Admin> list = this.getHibernateTemplate().find(hql,
				Admin.getUsername(), Admin.getPassword());
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

   /**
    * 根据email查找管理员
    */
	@Override
	public Admin findByEmail(String email) {

		String hql = "from Admin where email=?";
		List<Admin> list = this.getHibernateTemplate().find(hql, email);
		if (list.size()>0) {
			
			return list.get(0);
		}
		return null;
	}

	/**
	 * 根据Id查找用户
	 * @param AdminId
	 * @return
	 */
	public Admin findByAdminId(int AdminId) {
			Admin Admin = getHibernateTemplate().get(Admin.class, AdminId);
			return Admin;
	}

	
}
