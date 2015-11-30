package com.etc.myvideo.ad.action;



import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.etc.myvideo.ad.entity.Ad;
import com.etc.myvideo.ad.service.Adservice;
import com.etc.myvideo.area.entity.Area;
import com.etc.myvideo.maxtype.entity.Maxtype;
import com.etc.myvideo.mintype.entity.Mintype;
import com.etc.myvideo.util.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class Adaction extends ActionSupport implements ModelDriven<Ad>{
	private Adservice adservice;
	private Ad ad=new Ad();

	public void setAdservice(Adservice adservice) {
		this.adservice = adservice;
	}
	
	// 影片上传文件上传需要的三个属性:
	private File adimagefile;
	private String adimagefileFileName;
	private String adimagefileContentType;

	@Override
	public Ad getModel() {
		
		return ad;
	}

	
	public File getAdimagefile() {
		return adimagefile;
	}


	public void setAdimagefile(File adimagefile) {
		this.adimagefile = adimagefile;
	}


	public String getAdimagefileFileName() {
		return adimagefileFileName;
	}


	public void setAdimagefileFileName(String adimagefileFileName) {
		this.adimagefileFileName = adimagefileFileName;
	}


	public String getAdimagefileContentType() {
		return adimagefileContentType;
	}


	public void setAdimagefileContentType(String adimagefileContentType) {
		this.adimagefileContentType = adimagefileContentType;
	}

//保存广告
	public String saveAd() throws Exception{

		if (adimagefile != null) {
			// 将上传到服务器上.
			// 获得的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath(
					"/uploadimage");
			// 创建文件类型对象:
			File diskFile = new File(path + "//" + adimagefileFileName);
			// 文件上传:
			FileUtils.copyFile(adimagefile, diskFile);

			
			ad.setAdimage("uploadimage/" + adimagefileFileName);
		}
		
		
		adservice.saveAd(ad);
		return "saveAd";
		
	}
	public String deleteAd(){
		ad=adservice.findadbyid(ad.getId());
		if (!ad.getAdimage().isEmpty()) {
			
			String path = ServletActionContext.getServletContext().getRealPath(
					"/" + ad.getAdimage());
			File file = new File(path);
			file.delete();
		}
		adservice.deleteAd(ad);
		return "deleteAd";
		
	}
	
	
	// 编辑广告的方法
	public String editadinfo() {
		// 根据id查询广告信息
		ad=adservice.findadbyid(ad.getId());
		// 页面跳转到编辑页面:
		
	
		return "editadSuccess";
	}
	
	
	public String updateAd() throws Exception {
		
		// 上传:
					if (adimagefile != null) {
						String delPath = ServletActionContext.getServletContext()
								.getRealPath("/" +ad.getAdimage());
						File file = new File(delPath);
						file.delete();
						// 获得上传的服务器端路径.
						String path = ServletActionContext.getServletContext().getRealPath(
								"/uploadimage");
						// 创建文件类型对象:
						File diskFile = new File(path + "//" + adimagefileFileName);
						// 文件上传:
						FileUtils.copyFile(adimagefile, diskFile);

						
						ad.setAdimage("uploadimage/" + adimagefileFileName);
					}
					
		adservice.updateAd(ad);
		return "updateAd";
	}
	
	
	//页码
		private int page;
		
		
		
		
		public int getPage() {
			return page;
		}



		public void setPage(int page) {
			this.page = page;
		}

	//查广告
		public String findallAd(){
			
			PageBean<Ad>  vList= adservice.findallAd(page);
			// 将数据存入到值栈中保存到页面
			ActionContext.getContext().getValueStack().set("AdpageBean", vList);
			// 页面跳转:
			return "adminfindallAd";
		}
		
		
		public String toaddview(){
			
			return "toaddview";
		}
		

	
}
