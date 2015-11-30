package com.etc.myvideo.videocount.service;

import java.util.List;

import com.etc.myvideo.videocount.dao.Videocountdao;
import com.etc.myvideo.videocount.entity.Videocount;

public class Videocountservice {
	private Videocountdao videocountdao;
	
	
	
	public void setVideocountdao(Videocountdao videocountdao) {
		this.videocountdao = videocountdao;
	}



	/**
	 * 根据点击数来查询影评信息
	 * @return
	 */
		public List<Videocount> finddbycouClick(){
			return videocountdao.finddbycouClick();
		}
		
		
		/**
		 * 根据id来查询影评信息
		 * 
		 * @return
		 */
		public Videocount findBycouId(Integer couId) {
			
			return videocountdao.findBycouId(couId);
		}
		
		//保存视频级的信息
		  public void saveVideocount(Videocount transientInstance) {

		          
		     videocountdao.saveVideocount(transientInstance);
		  }
		  
		// DAO中的删除的方法
			public void delete(Videocount videocount) {
				videocountdao.deleteVideocount(videocount);
			}

			public void updatevideocount(Videocount videocount) {
				videocountdao.updatevideocount(videocount);
			}
}
