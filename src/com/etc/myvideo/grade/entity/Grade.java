package com.etc.myvideo.grade.entity;

import com.etc.myvideo.videoinfo.entity.Videoinfo;


public class Grade implements java.io.Serializable {

	
	private Integer graId;
	private Videoinfo videoinfo;
	private Integer graCount;
	
	public Integer getGraId() {
		return graId;
	}
	public void setGraId(Integer graId) {
		this.graId = graId;
	}
	public Videoinfo getVideoinfo() {
		return videoinfo;
	}
	public void setVideoinfo(Videoinfo videoinfo) {
		this.videoinfo = videoinfo;
	}
	public Integer getGraCount() {
		return graCount;
	}
	public void setGraCount(Integer graCount) {
		this.graCount = graCount;
	}
	
	



}