package com.etc.myvideo.switchimage.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.etc.myvideo.switchimage.entity.SwitchImage;




public class SwitchImageDao extends HibernateDaoSupport {

	public List<SwitchImage> findall() {	
		// 使用离线条件查询:
		DetachedCriteria criteria = DetachedCriteria.forClass(SwitchImage.class);
		// 按id进行倒序排序:
		criteria.addOrder(Order.desc("sId"));
		// 执行查询:
		List<SwitchImage> list = this.getHibernateTemplate().findByCriteria(criteria);
		return list;
	}

}
