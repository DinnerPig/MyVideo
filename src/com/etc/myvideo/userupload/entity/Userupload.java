package com.etc.myvideo.userupload.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Userupload entity. @author MyEclipse Persistence Tools
 * 
 * 一个视频对应多个评论
 */

public class Userupload implements java.io.Serializable {

	// Fields

	private Integer uld;
	private Integer uid;
	private String name;//影片名
	private String type;
	private String duration;//区间
	private String info;//影片信息
	private String click;//点击数
	private String url;//连接
	private Date upload;//上传时间
	private String image;//图片路径
	private Integer status;//影片状态
	private Set comments = new HashSet(0);

	// Constructors

	/** default constructor */
	public Userupload() {
	}

	

	public Userupload(Integer uld, Integer uid, String name, String type,
			String duration, String info, String click, String url,
			Date upload, String image, Integer status, Set comments) {
		super();
		this.uld = uld;
		this.uid = uid;
		this.name = name;
		this.type = type;
		this.duration = duration;
		this.info = info;
		this.click = click;
		this.url = url;
		this.upload = upload;
		this.image = image;
		this.status = status;
		this.comments = comments;
	}



	// Property accessors

	
	public Date getUpload() {
		return upload;
	}

	public void setUpload(Date upload) {
		this.upload = upload;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	public Integer getUld() {
		return this.uld;
	}

	public void setUld(Integer uld) {
		this.uld = uld;
	}

	public Integer getUid() {
		return this.uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDuration() {
		return this.duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getInfo() {
		return this.info;
	}
    
	
	public void setInfo(String info) {
		this.info = info;
	}

	public String getClick() {
		return this.click;
	}

	public void setClick(String click) {
		this.click = click;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

}