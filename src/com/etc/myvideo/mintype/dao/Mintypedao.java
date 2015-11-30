package com.etc.myvideo.mintype.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.etc.myvideo.mintype.entity.Mintype;



public class Mintypedao extends HibernateDaoSupport {

	
	//查询所有的地名
			public List<Mintype> findMintype(){
				
				String hql = "from Mintype";
				List<Mintype> list = this.getHibernateTemplate().find(hql);
				return list;
			}
}
