package com.etc.myvideo.videoinfo.action;


import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;


import com.etc.myvideo.comment.service.Commentservice;
import com.etc.myvideo.util.PageBean;

import com.etc.myvideo.videocount.entity.Videocount;
import com.etc.myvideo.videocount.service.Videocountservice;
import com.etc.myvideo.videoinfo.entity.Videoinfo;
import com.etc.myvideo.videoinfo.service.Videoinfoservice;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;



public class Videoinfoaction extends ActionSupport implements ModelDriven<Videoinfo>{

	
	private Videoinfo videoinfo=new Videoinfo();
	
	
	private  Videoinfoservice videoinfoservice;
	private  Commentservice commentservice;
	
	
	
	public void setCommentservice(Commentservice commentservice) {
		this.commentservice = commentservice;
	}
	
	
	private Videocountservice videocountservice;
	
	
	


	public void setVideocountservice(Videocountservice videocountservice) {
		this.videocountservice = videocountservice;
	}


	//视频集数编号
	private int couId;
	// 接收当前页数:
	private int page;

	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getCouId() {
		return couId;
	}

	public void setCouId(int couId) {
		this.couId = couId;
	}

	public void setVideoinfoservice(Videoinfoservice videoinfoservice) {
		this.videoinfoservice = videoinfoservice;
	}

	/**
	 * 根据vidId得到视频信息
	 * @param id
	 * @return
	 */
	public String findByvidId() {

		
		 videoinfo=videoinfoservice.findByvidId(videoinfo.getVidId());
		 
		 
		 return "findByvidId";

	}
	
	
	
	
	
	/**
	 * 根据vidId得到视频信息
	 * @param id
	 * @return
	 */
	public String bofangbyvidId() {

		int couid=0;
		 videoinfo=videoinfoservice.findByvidId(videoinfo.getVidId());
		 Set<Videocount> videocounts=videoinfo.getVideocounts();
		 if (videocounts.size()!=0) {
			
			 for (Videocount videocount : videocounts) {  
				 
				 couid=videocount.getCouId();
			 } 
			 Videocount cuVideocount= videocountservice.findBycouId(couid);
			 cuVideocount.setCouClick(cuVideocount.getCouClick()+1);
			 videocountservice.updatevideocount(cuVideocount);
			 
		}
		int zanCount= commentservice.findallzan(couid);
		
	
		ServletActionContext.getRequest().getSession().setAttribute("zanCount", zanCount);
		
		
		
		//给变换页富数据
		List<Videocount> videolist=videocountservice.finddbycouClick();
		ActionContext.getContext().getValueStack().set("videolist", videolist);
		 
		 return "bofangbyvidId";

	}
	
	

	/**
	 * 模糊查询
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public String findbylikename() throws Exception {
		String nameString=new String(videoinfo.getVidName().getBytes("ISO-8859-1"), "UTF-8"); 
		PageBean<Videoinfo> pageBean = videoinfoservice.findbylikename(nameString, page);
		
		
		ServletActionContext.getRequest().setAttribute("serachname", nameString);
		ActionContext.getContext().getValueStack().set("scanBean", pageBean);
		return "findbylikename";
	}
	
	

	

	/**
	 * 根据类型查询
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public String findbymaxtype() throws Exception {
		System.out.println(videoinfo.getMaxtype().getMaxId());
		PageBean<Videoinfo> pageBean = videoinfoservice.findbymaxtype(videoinfo.getMaxtype().getMaxId(), page);
		
		
		ServletActionContext.getRequest().setAttribute("maxtypename", videoinfo.getMaxtype().getMaxName());
		ServletActionContext.getRequest().setAttribute("maxtypemaxid", videoinfo.getMaxtype().getMaxId());
		ActionContext.getContext().getValueStack().set("maxtypescanBean", pageBean);
		return "findbymaxtype";
	}
	
	
	

	@Override
	public Videoinfo getModel() {
		
		return videoinfo;
	}
}
