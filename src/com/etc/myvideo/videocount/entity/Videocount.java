package com.etc.myvideo.videocount.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.etc.myvideo.comment.entity.Comment;
import com.etc.myvideo.videoinfo.entity.Videoinfo;


public class Videocount implements Serializable {

	

	
	private Integer couId;//--集数编号    主键 自动增长
	private Videoinfo videoinfo;// --影片编号     外键：管理员视频表
	private Integer couCount;//--影片第几集 Not null
	
	private Integer couClick;//--点击率     Not null
	private String couUrl;//--网络地址	Not null
	private String couDuration;//--时长Not null
	private Date couUpload;//--上传时间Not null
	
	private Set<Comment> comments = new HashSet<Comment>();//评论
	
	public Integer getCouId() {
		return couId;
	}
	public void setCouId(Integer couId) {
		this.couId = couId;
	}
	public Videoinfo getVideoinfo() {
		return videoinfo;
	}
	public void setVideoinfo(Videoinfo videoinfo) {
		this.videoinfo = videoinfo;
	}
	public Integer getCouCount() {
		return couCount;
	}
	public void setCouCount(Integer couCount) {
		this.couCount = couCount;
	}

	public Integer getCouClick() {
		return couClick;
	}
	public void setCouClick(Integer couClick) {
		this.couClick = couClick;
	}
	public String getCouUrl() {
		return couUrl;
	}
	public void setCouUrl(String couUrl) {
		this.couUrl = couUrl;
	}
	public String getCouDuration() {
		return couDuration;
	}
	public void setCouDuration(String couDuration) {
		this.couDuration = couDuration;
	}
	public Date getCouUpload() {
		return couUpload;
	}
	public void setCouUpload(Date couUpload) {
		this.couUpload = couUpload;
	}

	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "Videocount [couId=" + couId + ", videoinfo=" + videoinfo
				+ ", couCount=" + couCount + ", couClick=" + couClick
				+ ", couUrl=" + couUrl + ", couDuration=" + couDuration
				+ ", couUpload=" + couUpload + ", comments=" + comments + "]";
	}
	
	
}