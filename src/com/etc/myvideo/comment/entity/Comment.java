package com.etc.myvideo.comment.entity;


import java.io.Serializable;
import java.util.Date;

import com.etc.myvideo.user.entity.User;
import com.etc.myvideo.userupload.entity.Userupload;
import com.etc.myvideo.videocount.entity.Videocount;

/**
 * 
 * @author Administrator
 * 
 * 多个评论对应一个视频
 *
 */

public class Comment implements Serializable {


    //评论id
	private Integer comId;
	@Override
	public String toString() {
		return "Comment [comId=" + comId + ", videocount=" + videocount
				+ ", userupload=" + userupload + ", user=" + user + ", time="
				+ time + ", comSubtance=" + comSubtance + ", isdianzan="
				+ isdianzan + "]";
	}
	//
	private Videocount videocount;
	private Userupload userupload;
	private User user;
	private Date time;
	private String comSubtance;
	private Integer isdianzan;
	
	
	public Integer getIsdianzan() {
		return isdianzan;
	}
	public void setIsdianzan(Integer isdianzan) {
		this.isdianzan = isdianzan;
	}
	public Integer getComId() {
		return comId;
	}
	public void setComId(Integer comId) {
		this.comId = comId;
	}
	public Videocount getVideocount() {
		return videocount;
	}
	public void setVideocount(Videocount videocount) {
		this.videocount = videocount;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getComSubtance() {
		return comSubtance;
	}
	public void setComSubtance(String comSubtance) {
		this.comSubtance = comSubtance;
	}
	public Userupload getUserupload() {
		return userupload;
	}
	public void setUserupload(Userupload userupload) {
		this.userupload = userupload;
	}
	


	

}