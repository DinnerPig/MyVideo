package com.etc.myvideo.mintype.entity;

import java.util.HashSet;
import java.util.Set;

import com.etc.myvideo.videoinfo.entity.Videoinfo;


public class Mintype implements java.io.Serializable {



	private Integer minId;
	private String minName;
	private Set<Videoinfo> videoinfos = new HashSet<Videoinfo>();
	public Integer getMinId() {
		return minId;
	}
	public void setMinId(Integer minId) {
		this.minId = minId;
	}
	public String getMinName() {
		return minName;
	}
	public void setMinName(String minName) {
		this.minName = minName;
	}
	public Set<Videoinfo> getVideoinfos() {
		return videoinfos;
	}
	public void setVideoinfos(Set<Videoinfo> videoinfos) {
		this.videoinfos = videoinfos;
	}

	

}