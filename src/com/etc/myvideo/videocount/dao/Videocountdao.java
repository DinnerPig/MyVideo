package com.etc.myvideo.videocount.dao;


import java.util.List;


import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.etc.myvideo.util.PageHibernateCallback;
import com.etc.myvideo.videocount.entity.Videocount;




public class Videocountdao extends HibernateDaoSupport {

	/**
	 * 根据点击数来查询影评信息
	 * 
	 * @return
	 */
	public List<Videocount> finddbycouClick() {

		String hql = "from Videocount vc group by vc.videoinfo.vidId  order by vc.couClick desc";
		List<Videocount> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Videocount>(hql, null, 0, 10));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;

	}
	
	
	
	
	
	
	
	
	
	


	/**
	 * 根据id来查询影评信息
	 * 
	 * @return
	 */
	public Videocount findBycouId(Integer couId) {

		Videocount instance = getHibernateTemplate().get(Videocount.class,couId);
		return instance;

	}
	//保存视频级的信息
	  public void saveVideocount(Videocount transientInstance) {

	           this.getHibernateTemplate().save(transientInstance);
	
	  }
	  
	// DAO中的删除的方法
		public void deleteVideocount(Videocount videocount) {
			this.getHibernateTemplate().delete(videocount);
		}

		public void updatevideocount(Videocount videocount) {
			this.getHibernateTemplate().update(videocount);
		}

}
