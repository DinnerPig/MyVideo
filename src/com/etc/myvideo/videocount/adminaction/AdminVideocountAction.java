package com.etc.myvideo.videocount.adminaction;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.etc.myvideo.videocount.entity.Videocount;
import com.etc.myvideo.videocount.service.Videocountservice;
import com.etc.myvideo.videoinfo.entity.Videoinfo;
import com.etc.myvideo.videoinfo.service.Videoinfoservice;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminVideocountAction extends  ActionSupport implements ModelDriven<Videocount> {

	
	private Videocount videocount=new Videocount();
	
	private Videocountservice videocountservice;
	private  Videoinfoservice videoinfoservice;
	public void setVideoinfoservice(Videoinfoservice videoinfoservice) {
		this.videoinfoservice = videoinfoservice;
	}
	
	 public void setVideocountservice(Videocountservice videocountservice) {
			this.videocountservice = videocountservice;
		}

	@Override
	public Videocount getModel() {
		
		return videocount;
	}
	//影片的id
	private int vidId;
	
	
	
	public int getVidId() {
		return vidId;
	}

	public void setVidId(int vidId) {
		this.vidId = vidId;
	}

	public File getCouUrlfile() {
		return couUrlfile;
	}

	public void setCouUrlfile(File couUrlfile) {
		this.couUrlfile = couUrlfile;
	}

	public String getCouUrlfileFileName() {
		return couUrlfileFileName;
	}

	public void setCouUrlfileFileName(String couUrlfileFileName) {
		this.couUrlfileFileName = couUrlfileFileName;
	}

	public String getCouUrlfileContentType() {
		return couUrlfileContentType;
	}

	public void setCouUrlfileContentType(String couUrlfileContentType) {
		this.couUrlfileContentType = couUrlfileContentType;
	}



	// 影片上传文件上传需要的三个属性:
	private File couUrlfile;
	private String couUrlfileFileName;
	private String couUrlfileContentType;

	
	
	
	//跳转到视频集详情
	public String toshowDetail(){
		
		videocount=videocountservice.findBycouId(videocount.getCouId());
		
		return "toshowDetail";
		
	}
	
	//跳转添加视频集界面
	  public String tosaveVideocount()  {
		  
		  Videoinfo  videoinfo= videoinfoservice.findByvidId(vidId);
		  
		  ServletActionContext.getRequest().setAttribute("videoinfo", videoinfo);
		  return "tosaveVideocount";
	  }
	
	
	//保存视频级的信息 （还没写完整）
	  public String saveVideocount() throws Exception {
		  
		  Videoinfo videoinfo=new Videoinfo();
			videoinfo.setVidId(vidId);
			videocount.setVideoinfo(videoinfo);
			videocount.setCouClick(0);
		  if (couUrlfile != null) {
			// 将商品图片上传到服务器上.
				// 获得上传图片的服务器端路径.
				String path = ServletActionContext.getServletContext().getRealPath(
						"/uploadvideo");
				// 创建文件类型对象:
				File diskFile = new File(path + "//" + couUrlfileFileName);
				// 文件上传:
				FileUtils.copyFile(couUrlfile, diskFile);

				
				
				videocount.setCouUrl("uploadvideo/" + couUrlfileFileName);
			}
		  
		  
		  videocount.setCouUpload(new Date());
		  videocountservice.saveVideocount(videocount);
		  
		  
		  
		  return "saveVideocount";
		  
	  }
	  
	  
	// 修改视频集的方法
			public String updateVideocount() throws IOException {
				Videoinfo videoinfo=new Videoinfo();
				videoinfo.setVidId(vidId);
				videocount.setVideoinfo(videoinfo);
				
				// 上传:
				if (couUrlfile != null) {
					String delPath = ServletActionContext.getServletContext()
							.getRealPath("/" +videocount.getCouUrl());
					File file = new File(delPath);
					file.delete();
					// 获得上传图片的服务器端路径.
					String path = ServletActionContext.getServletContext().getRealPath(
							"/uploadvideo");
					// 创建文件类型对象:
					File diskFile = new File(path + "//" + couUrlfileFileName);
					// 文件上传:
					FileUtils.copyFile(couUrlfile, diskFile);

					videocount.setCouUrl("uploadvideo/" + couUrlfileFileName);
				}
				
				
		
				
				
				
				videocountservice.updatevideocount(videocount);
				// 页面跳转
				//return "updateSuccess";
				System.out.println("dddd");
				return "updateSuccess";
			}
			
			
			public String deletVideocount() {
				
				Videocount _currrvideocount=videocountservice.findBycouId(videocount.getCouId());
				
				// 删除:
				String path = ServletActionContext.getServletContext().getRealPath(
						"/" + videocount.getCouUrl());
				File file = new File(path);
				file.delete();
				// 删除数据库中记录:
				videocountservice.delete(_currrvideocount);
				return "deletsuccess";
			}		
}
