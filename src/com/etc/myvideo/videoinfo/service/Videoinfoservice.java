package com.etc.myvideo.videoinfo.service;

import java.util.List;

import com.etc.myvideo.util.PageBean;
import com.etc.myvideo.videoinfo.dao.Videoinfodao;
import com.etc.myvideo.videoinfo.entity.Videoinfo;




public class Videoinfoservice {

	
	private Videoinfodao videoinfodao;

	public void setVideoinfodao(Videoinfodao videoinfodao) {
		this.videoinfodao = videoinfodao;
	}
	
	

	/**
	 * //查询最新前十部视频信息
	 * 
	 * @return
	 */
	public List<Videoinfo> findbymaxtype(int vidMax) {
		
		
		return videoinfodao.findbymaxtype(vidMax);
	}
	
	
	
	/**
	 * 根据vidId得到视频信息
	 * @param id
	 * @return
	 */
	public Videoinfo findByvidId(Integer vidId) {

		
		return videoinfodao.findByvidId(vidId);

	}
	
	
	/**
	 * 所有视频的分页查询
	 * 
	 * @return
	 */
	
	public PageBean<Videoinfo> findallvideo(int page) {
		PageBean<Videoinfo> pageBean = new PageBean<Videoinfo>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		int limit = 10;
		pageBean.setLimit(limit);
		//  设置总记录数:
		int totalCount = 0 ;
		totalCount = videoinfodao.findallcount();
		pageBean.setTotalCount(totalCount);
		// 设置总页数:
		int totalPage = 0;
		// Math.ceil(totalCount / limit);
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 每页显示的数据集合:
		// 从哪开始:
		int begin = (page - 1) * limit;
		List<Videoinfo> list = videoinfodao.findallvideo(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}


	
	//保存视频

	public void savevideoinfo(Videoinfo videoinfo) {
		videoinfodao.savevideoinfo(videoinfo);
		
	}


	

	/**
	 * 模糊查询
	 * @param id
	 * @return
	 */
	
	public PageBean<Videoinfo> findbylikename(String name, int page) {
		PageBean<Videoinfo> pageBean = new PageBean<Videoinfo>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		int limit = 3;
		pageBean.setLimit(limit);
		//  设置总记录数:
		int totalCount = 0 ;
		totalCount = videoinfodao.countbylikename(name);
		pageBean.setTotalCount(totalCount);
		// 设置总页数:
		int totalPage = 0;
		// Math.ceil(totalCount / limit);
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 每页显示的数据集合:
		// 从哪开始:
		int begin = (page - 1) * limit;
		List<Videoinfo> list = videoinfodao.findbylikename(name, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	
	
	
	
	
	
	/**
	 * 大类型模糊查询
	 * @param id
	 * @return
	 */
	
	public PageBean<Videoinfo> findbymaxtype(int typeid, int page) {
		PageBean<Videoinfo> pageBean = new PageBean<Videoinfo>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		int limit = 3;
		pageBean.setLimit(limit);
		//  设置总记录数:
		int totalCount = 0 ;
		totalCount = videoinfodao.countbymaxtype(typeid);
		pageBean.setTotalCount(totalCount);
		// 设置总页数:
		int totalPage = 0;
		// Math.ceil(totalCount / limit);
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 每页显示的数据集合:
		// 从哪开始:
		int begin = (page - 1) * limit;
		List<Videoinfo> list = videoinfodao.findbymaxtype(typeid, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}


	// 业务层删除视频
	public void delete(Videoinfo videoinfo) {
		videoinfodao.delete(videoinfo);
	}

	// 业务层修改视频的方法
	public void updatevideoinfo(Videoinfo videoinfo) {
		videoinfodao.updatevideoinfo(videoinfo);
	}
	

}
