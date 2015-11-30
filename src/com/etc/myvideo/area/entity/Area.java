package com.etc.myvideo.area.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.etc.myvideo.videoinfo.entity.Videoinfo;


public class Area implements Serializable {

	

	private Integer areaId;
	private String areaName;
	private Set<Videoinfo> videoinfos = new HashSet<Videoinfo>();
	
	public Integer getAreaId() {
		return areaId;
	}
	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public Set<Videoinfo> getVideoinfos() {
		return videoinfos;
	}
	public void setVideoinfos(Set<Videoinfo> videoinfos) {
		this.videoinfos = videoinfos;
	}



	

}