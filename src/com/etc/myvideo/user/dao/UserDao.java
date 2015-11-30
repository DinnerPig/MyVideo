package com.etc.myvideo.user.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.etc.myvideo.user.entity.User;
import com.etc.myvideo.util.PageHibernateCallback;


public class UserDao extends HibernateDaoSupport implements IUserDao {

	// 按名查询是否有该用户:
	/* (non-Javadoc)
	 * @see com.yede.myvideo.user.dao.IUserDao#findByUsername(java.lang.String)
	 */
	@Override
	public User findByUsername(String username) {
		String hql = "from User where uName = ?";
		List<User> list = this.getHibernateTemplate().find(hql, username);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	// 注册用户存入数据库代码实现
	/* (non-Javadoc)
	 * @see com.yede.myvideo.user.dao.IUserDao#save(com.yede.myvideo.user.entity.User)
	 */
	@Override
	public void save(User user) {
		this.getHibernateTemplate().save(user);
	}

	// 根据激活码查询用户
	/* (non-Javadoc)
	 * @see com.yede.myvideo.user.dao.IUserDao#findByCode(java.lang.String)
	 */
	@Override
	public User findByCode(String code) {
		String hql = "from User where code = ?";
		List<User> list = this.getHibernateTemplate().find(hql, code);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	// 修改用户状态的方法
	/* (non-Javadoc)
	 * @see com.yede.myvideo.user.dao.IUserDao#update(com.yede.myvideo.user.entity.User)
	 */
	@Override
	public void update(User existUser) {
		this.getHibernateTemplate().update(existUser);
	}

	// 用户登录的方法
	/* (non-Javadoc)
	 * @see com.yede.myvideo.user.dao.IUserDao#login(com.yede.myvideo.user.entity.User)
	 */
	@Override
	public User login(User user) {
		String hql = "from User where uMail = ? and uPassword = ? and state = ?";
		List<User> list = this.getHibernateTemplate().find(hql,
				user.getuMail(), user.getuPassword(), 1);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.yede.myvideo.user.dao.IUserDao#findByEmail(java.lang.String)
	 */
	@Override
	public User findByEmail(String email) {

		String hql = "from User where uMail=?";
		List<User> list = this.getHibernateTemplate().find(hql, email);
		if (list.size()>0) {
			
			return list.get(0);
		}
		return null;
	}

	/**
	 * 根据Id查找用户
	 * @param userId
	 * @return
	 */
	public User findByUserId(int userId) {
		User user = getHibernateTemplate().get(User.class, userId);
		return user;
	}

	@Override
	public List<User> findAll() {
		String hql = "from User";
		List<User> userList = getHibernateTemplate().find(hql);
		return userList;
	}
	
	/**
	 * 分页查询
	 */
	@Override
	public List<User> findAll(int begin, int limit) {
		
		String hql = "from User order by uId desc";
		List<User> list = getHibernateTemplate().executeFind(new PageHibernateCallback<User>(hql, null, begin, limit));
		
		if(list != null && list.size() >0){
			return list;
		}
		
		return null;
	}
	
	public void delete(int id){
		getHibernateTemplate().delete(id);
	}
}
