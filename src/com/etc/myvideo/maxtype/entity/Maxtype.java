package com.etc.myvideo.maxtype.entity;

import java.util.HashSet;
import java.util.Set;

import com.etc.myvideo.videoinfo.entity.Videoinfo;


public class Maxtype implements java.io.Serializable {


	private Integer maxId;
	private String maxName;
	private Set<Videoinfo> videoinfos = new HashSet<Videoinfo>();
	public Integer getMaxId() {
		return maxId;
	}
	public void setMaxId(Integer maxId) {
		this.maxId = maxId;
	}
	public String getMaxName() {
		return maxName;
	}
	public void setMaxName(String maxName) {
		this.maxName = maxName;
	}
	public Set<Videoinfo> getVideoinfos() {
		return videoinfos;
	}
	public void setVideoinfos(Set<Videoinfo> videoinfos) {
		this.videoinfos = videoinfos;
	}
	
	

	
}