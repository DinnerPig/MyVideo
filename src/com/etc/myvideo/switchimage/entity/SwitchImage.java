package com.etc.myvideo.switchimage.entity;
//--主界面图片却换表
public class SwitchImage {
	private int  sId ;			  //--编号主键：自动增长	
	private String sAddr;		  // --图片地址
	private String	stype;		  // --影片  或  广告
	private String	vidName;	  // --影片名    或   广告简介
	private String	sText;			//	 --显示文本 
	private String	sUrl;	 		//  --连接地址
	private Integer	couId;	 		//  --连接地址
	
	
	public Integer getCouId() {
		return couId;
	}
	public void setCouId(Integer couId) {
		this.couId = couId;
	}
	@Override
	public String toString() {
		return "SwitchImage [sId=" + sId + ", sAddr=" + sAddr + ", stype="
				+ stype + ", vidName=" + vidName + ", sText=" + sText
				+ ", sUrl=" + sUrl + "]";
	}
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public String getsAddr() {
		return sAddr;
	}
	public void setsAddr(String sAddr) {
		this.sAddr = sAddr;
	}
	public String getStype() {
		return stype;
	}
	public void setStype(String stype) {
		this.stype = stype;
	}
	public String getVidName() {
		return vidName;
	}
	public void setVidName(String vidName) {
		this.vidName = vidName;
	}
	public String getsText() {
		return sText;
	}
	public void setsText(String sText) {
		this.sText = sText;
	}
	public String getsUrl() {
		return sUrl;
	}
	public void setsUrl(String sUrl) {
		this.sUrl = sUrl;
	}
	
	
	
}
