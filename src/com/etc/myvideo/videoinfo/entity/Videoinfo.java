package com.etc.myvideo.videoinfo.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.etc.myvideo.area.entity.Area;
import com.etc.myvideo.comment.entity.Comment;
import com.etc.myvideo.grade.entity.Grade;
import com.etc.myvideo.maxtype.entity.Maxtype;
import com.etc.myvideo.mintype.entity.Mintype;
import com.etc.myvideo.videocount.entity.Videocount;


//视频
public class Videoinfo implements Serializable {



	@Override
	public String toString() {
		return "Videoinfo [vidId=" + vidId + ", mintype=" + mintype
				+ ", maxtype=" + maxtype + ", area=" + area + ", vidName="
				+ vidName + ", vidDirector=" + vidDirector + ", vidStar="
				+ vidStar + ", vidYear=" + vidYear + ", vidjianjie="
				+ vidjianjie + ", vidInfo=" + vidInfo + ", vidImage="
				+ vidImage + ", vidState=" + vidState + ", grades=" + grades
				+ ", videocounts=" + videocounts 
				+ "]";
	}
	private Integer vidId;//	--影片编号主键：自动增长
	private Mintype mintype; //	--小类型
	private Maxtype maxtype;  //	--大类型
	private Area area;//	 //	--地区
	private String vidName;//	--影片名称 
	private String vidDirector;//	--导演o
	private String vidStar;//	--明星
	private String vidYear;//	--年份
	private String  vidjianjie      ;	//    影视简介  Varchar(30), 
	private String vidInfo;//	--影片内容简介  
	private String vidImage;//	--封面图片（影片海报）   没有就给一张 “暂无图片”
	private String vidState;//	--状态	(连载中)或(已完结)
	private Set<Grade> grades = new HashSet<Grade>();//评分
	private Set<Videocount> videocounts = new HashSet<Videocount>();//集数
	
	
	
	public Integer getVidId() {
		return vidId;
	}
	public void setVidId(Integer vidId) {
		this.vidId = vidId;
	}
	public Mintype getMintype() {
		return mintype;
	}
	public void setMintype(Mintype mintype) {
		this.mintype = mintype;
	}
	public Maxtype getMaxtype() {
		return maxtype;
	}
	public void setMaxtype(Maxtype maxtype) {
		this.maxtype = maxtype;
	}
	public Area getArea() {
		return area;
	}
	public void setArea(Area area) {
		this.area = area;
	}
	public String getVidName() {
		return vidName;
	}
	public void setVidName(String vidName) {
		this.vidName = vidName;
	}
	public String getVidDirector() {
		return vidDirector;
	}
	public void setVidDirector(String vidDirector) {
		this.vidDirector = vidDirector;
	}
	public String getVidStar() {
		return vidStar;
	}
	public void setVidStar(String vidStar) {
		this.vidStar = vidStar;
	}
	
	
	public String getVidYear() {
		return vidYear;
	}
	public void setVidYear(String vidYear) {
		this.vidYear = vidYear;
	}
	public String getVidjianjie() {
		return vidjianjie;
	}
	public void setVidjianjie(String vidjianjie) {
		this.vidjianjie = vidjianjie;
	}
	public String getVidInfo() {
		return vidInfo;
	}
	public void setVidInfo(String vidInfo) {
		this.vidInfo = vidInfo;
	}
	public String getVidImage() {
		return vidImage;
	}
	public void setVidImage(String vidImage) {
		this.vidImage = vidImage;
	}
	public String getVidState() {
		return vidState;
	}
	public void setVidState(String vidState) {
		this.vidState = vidState;
	}
	public Set<Grade> getGrades() {
		return grades;
	}
	public void setGrades(Set<Grade> grades) {
		this.grades = grades;
	}
	public Set<Videocount> getVideocounts() {
		return videocounts;
	}
	public void setVideocounts(Set<Videocount> videocounts) {
		this.videocounts = videocounts;
	}

	


}