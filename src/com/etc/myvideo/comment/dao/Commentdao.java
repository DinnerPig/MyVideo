package com.etc.myvideo.comment.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.etc.myvideo.comment.entity.Comment;
import com.etc.myvideo.user.entity.User;
import com.etc.myvideo.util.PageHibernateCallback;





public class Commentdao extends HibernateDaoSupport {

	

	// 根据影片id查询分页评论的集合
		public List<Comment> findByPagecouId(Integer couId, int begin, int limit) {
			
			String hql = "from Comment cm  where cm.videocount.couId = ? order by cm.time desc";
			// 分页另一种写法:
			List<Comment> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Comment>(hql, new Object[]{couId}, begin, limit));
			if(list != null && list.size() > 0){
				return list;
			}
			return null;
			
		}
		
		
		// 根据影片id查询评论的个数
		public int findByPagecouId(Integer couId) {
			String hql = "select count(*) from Comment cm where cm.videocount.couId= ?";
			List<Long> list = this.getHibernateTemplate().find(hql,couId);
			if(list != null && list.size() > 0){
				return list.get(0).intValue();
			}
			return 0;
		}
		
		
		
		// DAO中的保存评论的方法
		public void savecomment(Comment comment) {
			this.getHibernateTemplate().save(comment);
		}
		//查询是否点赞
		public Comment chadianzan(Integer uid,Integer couId) {
			String hql=" from Comment cm where cm.user.uid=? and cm.videocount.couId=? and cm.isdianzan=1 ";
			List<Comment> list = this.getHibernateTemplate().find(hql, uid,couId);
			if (list != null && list.size() > 0) {
				return list.get(0);
			}
			return null;
		}
		
		
		//查询总的赞
		public int findallzan(Integer couId) {
			String hql = "select count(*) from Comment cm where cm.videocount.couId= ? and cm.isdianzan=1";
			List<Long> list = this.getHibernateTemplate().find(hql,couId);
			if(list != null && list.size() > 0){
				return list.get(0).intValue();
			}
			return 0;
		}
		
		/**
		 * 通过comId查询评论
		 * 
		 * @param comId
		 * @param begin
		 * @param limit
		 * @return
		 */
		public List findByVideoList(int comId, int begin, int limit) {
			String hql = "from Comment c where c.comId= ? ";
			List<Comment> list = getHibernateTemplate().execute(
					new PageHibernateCallback<Comment>(hql, new Object[] { comId },
							begin, limit));
			if (list != null) {
				return list;
			}
			return null;
		}

		public List<Comment> findCommentByCouid(int couId, int begin, int limit) {
			String hql = "from Comment c where c.videocount.couId=?";
			List<Comment> list = getHibernateTemplate().execute(
					new PageHibernateCallback<Comment>(hql, new Object[] { couId },
							begin, limit));
			return list;

		}

		public List<Comment> getAllComment(int begin, int limit) {

			String hql = "from Comment";
			List<Comment> list = getHibernateTemplate().execute(
					new PageHibernateCallback<Comment>(hql, null, begin, limit));
			return list;

		}

		/**
		 * 返回评论表里面的总的条数
		 * 
		 * @return
		 */
		public int getAllCommentCount() {

			String hql = "select count(*) from Comment";
			List<Long> list = getHibernateTemplate().find(hql);

			if (list != null && list.size() > 0) {
				return (list.get(0)).intValue();
			}
			return 0;
		}
		
		
		public void deleteComment(Comment comment){
			getHibernateTemplate().delete(comment);
		}


		
		
		


}
