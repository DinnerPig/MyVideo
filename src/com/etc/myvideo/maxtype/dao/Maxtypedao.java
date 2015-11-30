package com.etc.myvideo.maxtype.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.etc.myvideo.maxtype.entity.Maxtype;




public class Maxtypedao extends HibernateDaoSupport{

	
	//查询所有的大类型
		public List<Maxtype> findMaxtype(){
			
			String hql = "from Maxtype";
			List<Maxtype> list = this.getHibernateTemplate().find(hql);
			return list;
		}
}
