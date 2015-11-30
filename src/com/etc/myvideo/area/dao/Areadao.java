package com.etc.myvideo.area.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.etc.myvideo.area.entity.Area;


public class Areadao extends HibernateDaoSupport{

	//查询所有的地名
	public List<Area> findaAreas(){
		
		String hql = "from Area";
		List<Area> list = this.getHibernateTemplate().find(hql);
		return list;
	}
}
