package com.etc.myvideo.user.service;

import java.util.List;

import com.etc.myvideo.user.dao.IUserDao;
import com.etc.myvideo.user.entity.User;
import com.etc.myvideo.util.MailUitls;
import com.etc.myvideo.util.PageBean;
import com.etc.myvideo.util.UUIDUtils;



public class UserService implements IUserService {
	// 注入UserDao
		private IUserDao userDao;

		/* (non-Javadoc)
		 * @see com.yede.myvideo.user.service.IUserService#setUserDao(com.yede.myvideo.user.dao.IUserDao)
		 */
		@Override
		public void setUserDao(IUserDao userDao) {
			this.userDao = userDao;
		}
		
		
		// 按用户名查询用户的方法:
		/* (non-Javadoc)
		 * @see com.yede.myvideo.user.service.IUserService#findByUsername(java.lang.String)
		 */
		@Override
		public User findByUsername(String username){
			return userDao.findByUsername(username);
		}

		// 业务层完成用户注册代码:
		/* (non-Javadoc)
		 * @see com.yede.myvideo.user.service.IUserService#save(com.yede.myvideo.user.entity.User)
		 */
		@Override
		public void save(User user) {
			// 将数据存入到数据库
			user.setState(0); // 0:代表用户未激活.  1:代表用户已经激活.
			String code = UUIDUtils.getUUID()+UUIDUtils.getUUID();
			user.setCode(code);
			userDao.save(user);
			// 发送激活邮件;
			MailUitls.sendMail(user.getuMail(), code);
		}

		// 业务层根据激活码查询用户
		/* (non-Javadoc)
		 * @see com.yede.myvideo.user.service.IUserService#findByCode(java.lang.String)
		 */
		@Override
		public User findByCode(String code) {
			return userDao.findByCode(code);
		}

		// 修改用户的状态的方法
		/* (non-Javadoc)
		 * @see com.yede.myvideo.user.service.IUserService#update(com.yede.myvideo.user.entity.User)
		 */
		@Override
		public void update(User existUser) {
			userDao.update(existUser);
		}

		// 用户登录的方法
		/* (non-Javadoc)
		 * @see com.yede.myvideo.user.service.IUserService#login(com.yede.myvideo.user.entity.User)
		 */
		@Override
		public User login(User user) {
			return userDao.login(user);
		}


		@Override
		public User findByEmail(String email) {
			
			
			return userDao.findByEmail(email);
		}
		
		// 根据ID查询用户
		public User findByUserId(int userId){
			return userDao.findByUserId(userId);
		}
		
		// 查询所有用户
		public List<User> findAll(){
			return userDao.findAll();
		}
		
		//分页查询用户
		public PageBean<User> findAll(int page){
			
			PageBean<User> pageBean = new PageBean<User>();
			
			int limit = 10;						//每页记录数
			int totalCount = 0;					//总记录数
			int totalPage = 0;					//总页数
			
			pageBean.setPage(page);				//设置当前页数
			pageBean.setLimit(limit);			//设置显示每页记录数
			pageBean.setTotalCount(totalCount);	//设置总记录数
			pageBean.setTotalPage(totalPage);	//设置总页数
			
			if(totalCount % limit == 0){
				totalPage = totalCount / limit;
			}else{
				totalPage = totalCount / limit + 1;
			}
			
			pageBean.setTotalPage(totalPage);
			
			int begin = (page-1) * limit;
			List<User> list = userDao.findAll(begin, limit);
			
			pageBean.setList(list);
			return pageBean;
		}
		

		@Override
		public void findPass(User user){
			user.setState(0);
			String code = UUIDUtils.getUUID()+UUIDUtils.getUUID();
			user.setCode(code);
			userDao.update(user);
		   MailUitls.sendMainForByPass(user.getuMail(), code);
			
		}
		
		public void delete(int id){
			userDao.delete(id);
		}
}
