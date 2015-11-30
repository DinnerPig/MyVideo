package com.etc.myvideo.grade.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.etc.myvideo.grade.entity.Grade;
import com.etc.myvideo.util.PageHibernateCallback;




public class Gradedao extends HibernateDaoSupport {

	/**
	 * 根据评分数来查询某种类型的信息
	 * @return
	 */
		public List<Grade> finddbygraCount(int maxId){
			
			String hql = "from Grade gd where gd.videoinfo.maxtype.maxId= ? order by gd.graCount desc";
			List<Grade> list = this.getHibernateTemplate().execute(
					new PageHibernateCallback<Grade>(hql, new Object[]{maxId},0, 10));
			if (list != null && list.size() > 0) {
				return list;
			}
			return null;
			
		}
}
