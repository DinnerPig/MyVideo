package com.etc.myvideo.area.action;

import java.util.List;

import com.etc.myvideo.area.entity.Area;
import com.etc.myvideo.area.service.Areaservice;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class Areaaction extends ActionSupport implements ModelDriven<Area>{
	private Areaservice areaservice;
	
	private Area area=new Area();

	public void setAreaservice(Areaservice areaservice) {
		this.areaservice = areaservice;
	}

	@Override
	public Area getModel() {
		
		return area;
	}
	
	
	public String findaAreas(){
		
		List<Area> areas=areaservice.findaAreas();
		ActionContext.getContext().getValueStack().set("areas", areas);
		
		return "findaAreas";
	}
	

}
