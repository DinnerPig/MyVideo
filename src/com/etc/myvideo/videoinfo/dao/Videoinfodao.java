package com.etc.myvideo.videoinfo.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.etc.myvideo.util.PageHibernateCallback;
import com.etc.myvideo.videoinfo.entity.Videoinfo;



public class Videoinfodao extends HibernateDaoSupport {

	/**
	 * 保存Videoinfo
	 * 
	 * @param transientInstance
	 */
	public void save(Videoinfo transientInstance) {

		getHibernateTemplate().save(transientInstance);

	}

	/**
	 * //查询最新前十部视频信息根据类型
	 * 
	 * @return
	 */
	public List<Videoinfo> findbymaxtype(int vidMax) {
		String hql = "from Videoinfo v where v.maxtype.maxId = ? order by v.vidId desc";
		List<Videoinfo> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Videoinfo>(hql,
						new Object[] { vidMax }, 0, 10));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	/**
	 * 根据vidId得到视频信息
	 * @param id
	 * @return
	 */
	public Videoinfo findByvidId(Integer vidId) {

		Videoinfo instance = getHibernateTemplate().get(Videoinfo.class, vidId);
		return instance;

	}
	
	/**
	 * 模糊查询
	 * @param id
	 * @return
	 */
	
	public List<Videoinfo> findbylikename(String name,int begin,int limit) {
		
		String hql = "from Videoinfo v where v.vidName like ?";
		List<Videoinfo> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Videoinfo>(hql,
						new Object[] { "%" + name + "%" }, begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
		
	
	}
	
	/**
	 * 模糊查询总数
	 * @param id
	 * @return
	 */
	
	public int countbylikename(String name) {
	
		List<Long> list =this.getHibernateTemplate().findByNamedParam(" select count(*) from Videoinfo v where v.vidName like :name", "name", "%" + name + "%");
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	
	
		/*List<Videoinfo> videoinfos=this.getHibernateTemplate().findByNamedParam("from Videoinfo v where v.vidName like :name", "name", "%" + name + "%");
		
		if (videoinfos.size()!=0) {
			return videoinfos;
		} else {

		}
		return null;*/
	}
	
	
	/**
	 * 大类型查询总数
	 * @param id
	 * @return
	 */
	
	public int countbymaxtype(int maxid) {
	
	
		String hql = "select count(*) from Videoinfo v where v.maxtype.maxId= ?";
		List<Long> list = this.getHibernateTemplate().find(hql,maxid);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	
	}
	
	
	
	/**
	 * 大类型模糊查询
	 * @param id
	 * @return
	 */
	
	public List<Videoinfo> findbymaxtype(int id,int begin,int limit) {
		
		String hql = "from Videoinfo v where v.maxtype.maxId= ?";
		List<Videoinfo> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Videoinfo>(hql,
						new Object[] { id }, begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
		
	
	}
	
	
	/**
	 * 查询所有的视频
	 * 
	 * @return
	 */
	
	public List<Videoinfo> findallvideo(int begin,int limit) {
		
		String hql = "from Videoinfo order by vidId desc";
		List<Videoinfo> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Videoinfo>(hql,
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
	
	public int findallcount() {
	
		List<Long> list =this.getHibernateTemplate().find("select count(*) from Videoinfo ");
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	
	
	
	}
	
	// DAO中的删除的方法
	public void delete(Videoinfo videoinfo) {
		this.getHibernateTemplate().delete(videoinfo);
	}

	public void updatevideoinfo(Videoinfo videoinfo) {
		this.getHibernateTemplate().update(videoinfo);
	}

	

	//保存视频

	public void savevideoinfo(Videoinfo videoinfo) {
		this.getHibernateTemplate().save(videoinfo);
		
	}
}
