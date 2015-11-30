package com.etc.myvideo.index.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.etc.myvideo.ad.entity.Ad;
import com.etc.myvideo.ad.service.Adservice;
import com.etc.myvideo.grade.entity.Grade;
import com.etc.myvideo.grade.service.Gradeservice;
import com.etc.myvideo.switchimage.entity.SwitchImage;
import com.etc.myvideo.switchimage.service.SwitchImageService;
import com.etc.myvideo.videocount.entity.Videocount;
import com.etc.myvideo.videocount.service.Videocountservice;
import com.etc.myvideo.videoinfo.entity.Videoinfo;
import com.etc.myvideo.videoinfo.service.Videoinfoservice;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport{
	
	private SwitchImageService switchImageService;
	
	
	private Videoinfoservice videoinfoservice;
	private Videocountservice videocountservice;
	private Gradeservice gradeservice;
	
	private Adservice adservice;
		
		
	public void setAdservice(Adservice adservice) {
		this.adservice = adservice;
	}
	
	

	public void setGradeservice(Gradeservice gradeservice) {
		this.gradeservice = gradeservice;
	}
	public void setVideocountservice(Videocountservice videocountservice) {
		this.videocountservice = videocountservice;
	}
	public void setVideoinfoservice(Videoinfoservice videoinfoservice) {
		this.videoinfoservice = videoinfoservice;
	}
	public void setSwitchImageService(SwitchImageService switchImageService) {
		this.switchImageService = switchImageService;
	}
		/**
	 * 执行的访问首页的方法:
	 */
	public String execute(){
		/**
		 * 查询图片切换
		 */
	     List<SwitchImage> switchImagelist= switchImageService.findall();
		
		
		
		/**
		 * 查询前10的电视剧
		 */
		List<Videoinfo> dianshijutenlist=videoinfoservice.findbymaxtype(2);
		
		/**
		 * 查询前10的电影
		 */
		List<Videoinfo> dianyingtenlist=videoinfoservice.findbymaxtype(1);
		
		
		/**
		 * 根据点击数查询10的视频
		 */
		
		
		List<Videocount> videocounts=videocountservice.finddbycouClick();
	
		
		/**
		 * 根据评分前10查询的电影
		 */
		
		List<Grade> grades=gradeservice.finddbygraCount(1);
		
		//查询广告
		List<Ad> ads=adservice.findadList();
		
		
		// 保存到值栈中:
		ActionContext.getContext().getValueStack().set("dianyingtenlist", dianyingtenlist);
		ActionContext.getContext().getValueStack().set("dianshijutenlist", dianshijutenlist);
		ActionContext.getContext().getValueStack().set("dianjirb", videocounts);
		ActionContext.getContext().getValueStack().set("grades", grades);
		ActionContext.getContext().getValueStack().set("ads", ads);
		
		
		
		ServletActionContext.getRequest().setAttribute("SwitchImageitem", switchImagelist);
		/*ServletActionContext.getRequest().getSession().setAttribute("ad", ads);*/
		
	
		return "index";
	}
	
	
}
