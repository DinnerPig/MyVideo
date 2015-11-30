package com.etc.myvideo.userupload.service;

import java.util.List;

import com.etc.myvideo.userupload.entity.Userupload;
import com.etc.myvideo.util.PageBean;
import com.etc.myvideo.videocount.entity.Videocount;
import com.etc.myvideo.videoinfo.entity.Videoinfo;

public interface IUseruploadInfoService {

	/**
	 * 用户上传保存
	 * 
	 * @param userupload
	 */
	public abstract void save(Userupload userupload);

	/**
	 * 根据上传的id查找
	 * 
	 * @param uld
	 * @return
	 */
	public abstract Userupload findUseruploaByUld(String uld);

	/**
	 * 根据用户查找上传的电影
	 * 
	 * @param uid
	 * @return
	 */
	public abstract List<Userupload> findUserupload(String uid);

	/**
	 * 根据用户查询。使用分页查询
	 * @param uid
	 * @param begin
	 * @param limit
	 * @return
	 */
	public abstract List<Userupload> findbyUseruploadForPage(int uid, int begin,
			int limit);
	
	/**
	 * 删除用户上传的视频
	 * @param userupload
	 */
	public abstract void deleteUseruploadVideoInfo(Userupload userupload);
	/**
	 * 更新用户上传的视频
	 * @param userupload
	 */
	public abstract void updateUseruploadVideoInfo(Userupload  userupload);
	

	/**
	 * 找到对应的数据
	 * @param begin
	 * @param limit
	 * @return
	 */
	public abstract List<Userupload> findUseruploadForPage(int begin,
			int limit); 
	
	
	public abstract  PageBean<Userupload> findUseruploadforPageBean(String uid,int page);
	
	

	/**
	 * 根据视频上传的状态查找对应视频，根据上传的时间排序
	 */
	
	public List<Userupload> getUseruploadVideoInfoByStatus(int status);
	
	/**
	 * 根据视频上传的状态查找对应视频，根据上传的时间排序,实现分页
	 * @param status 
	 * @param begin
	 * @param limit
	 * @return
	 */
	public PageBean getUseruploadVideoInfoByStatusForPage(int status,int page);
	
	
	public abstract PageBean<Userupload> getUseruploadVideoInfo(int page);
	
	
	/**
	 * 将用户上传的视频审核通过的视频上传添加到播放列表中
	 * @param userupload
	 * @return
	 */
	public abstract void addUseruploadToVideoInfo(Videoinfo videoinfo);
    
	public abstract void addUseruploadToVideoCount(Videocount videocount);
	
	public void deleteUseruploadFromVideoInfo(Videoinfo videoinfo);
}