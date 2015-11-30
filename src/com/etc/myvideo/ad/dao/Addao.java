package com.etc.myvideo.ad.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.etc.myvideo.ad.entity.Ad;
import com.etc.myvideo.util.PageHibernateCallback;




public class Addao  extends HibernateDaoSupport{

	//查询所有广告
	public List<Ad> findadList(){
		String hql = "from Ad";
		List<Ad> list = this.getHibernateTemplate().find(hql);
		if (list.size()!=0) {
			
			return list;
		}
		return null;
	}
	
	/**
	 * 查询分页广告
	 * 
	 * @return
	 */
	
	public List<Ad> findpageadlis(int begin,int limit) {
		
		String hql = "from Ad order by id desc";
		List<Ad> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Ad>(hql,
						null, begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
		
	
	
	}
	
	
	
	/**
	 * 查询所有总数
	 * @param id
	 * @return
	 */
	
	public int findpageadliscount() {
	
		List<Long> list =this.getHibernateTemplate().find("select count(*) from Ad ");
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	
	
	
	}
	
	
	//查询id广告
	public Ad findadbyid(int id){
		String hql = "from Ad where id=?";
		List<Ad> list = this.getHibernateTemplate().find(hql,id);
		if (list.size()!=0) {
			return list.get(0);
		}
		return null;
	}
	
	
	// DAO中的删除的方法
		public void deleteAd(Ad ad) {
			this.getHibernateTemplate().delete(ad);
		}

		public void updateAd(Ad ad) {
			this.getHibernateTemplate().update(ad);
		}

		

		//保存广告

		public void saveAd(Ad ad) {
			this.getHibernateTemplate().save(ad);
			
		}
}
