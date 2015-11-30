package com.etc.myvideo.switchimage.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.etc.myvideo.switchimage.entity.SwitchImage;
import com.etc.myvideo.switchimage.service.SwitchImageService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SwitchImageAction extends ActionSupport implements ModelDriven<SwitchImage>{
	
	private SwitchImage switchImage=new SwitchImage();
	
	private SwitchImageService switchImageService;

	public void setSwitchImageService(SwitchImageService switchImageService) {
		this.switchImageService = switchImageService;
	}
	
	
	//查询所有的图片切换源
	public String findall(){
		List<SwitchImage> switchImagelist= switchImageService.findall();
		
		
		ServletActionContext.getRequest().setAttribute("SwitchImageitem", switchImagelist);
		return "findall";
	}


	@Override
	public SwitchImage getModel() {
		
		return switchImage;
	}

}
