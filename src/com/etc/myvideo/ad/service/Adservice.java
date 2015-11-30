package com.etc.myvideo.ad.service;

import java.util.List;

import com.etc.myvideo.ad.dao.Addao;
import com.etc.myvideo.ad.entity.Ad;
import com.etc.myvideo.util.PageBean;


public class Adservice {
	
	
	private Addao addao;
	


	public void setAddao(Addao addao) {
		this.addao = addao;
	}

	//查询所有的广告
	public List<Ad> findadList(){
		
		return addao.findadList();
	}
	
	//查询id广告
	public Ad findadbyid(int id){
		return addao.findadbyid(id);
	}
	
	

	// 业务层删除
	public void deleteAd(Ad ad) {
		addao.deleteAd(ad);
	}

	// 业务层修改的方法
	public void updateAd(Ad ad) {
		addao.updateAd(ad);
	}
	

	//保存广告

	public void saveAd(Ad ad) {
		addao.saveAd(ad);
		
	}
	
	
	
	/**
	 * 所有广告的分页查询
	 * 
	 * @return
	 */
	
	public PageBean<Ad> findallAd(int page) {
		PageBean<Ad> pageBean = new PageBean<Ad>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		int limit = 10;
		pageBean.setLimit(limit);
		//  设置总记录数:
		int totalCount = 0 ;
		totalCount = addao.findpageadliscount();
		pageBean.setTotalCount(totalCount);
		// 设置总页数:
		int totalPage = 0;
	
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 每页显示的数据集合:
		// 从哪开始:
		int begin = (page - 1) * limit;
		List<Ad> list = addao.findpageadlis(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	
}
