package com.etc.myvideo.user.entity;

import java.util.Date;

public class User {
	private Integer uid;
	private String uName;//--用户名
	private String uPassword;//密码
	private String uNickName;//-昵称Not null
	private String uSex;//--性别Not null
	private String uMail;//--邮箱Not null
	private Date uBirthday;//	--出生年月日	Not null
	private String uQue;//--密保问题
	private String uAns;//	--密保答案
	private int uAccumulate;//--积分  默认0
	private int uLive;//	--等级	默认1级
	private Integer state;
	private String code; 
	
	public User(){
		
		
	}
	
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPassword() {
		return uPassword;
	}
	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}
	public String getuNickName() {
		return uNickName;
	}
	public void setuNickName(String uNickName) {
		this.uNickName = uNickName;
	}
	public String getuSex() {
		return uSex;
	}
	public void setuSex(String uSex) {
		this.uSex = uSex;
	}
	public String getuMail() {
		return uMail;
	}
	public void setuMail(String uMail) {
		this.uMail = uMail;
	}
	public Date getuBirthday() {
		return uBirthday;
	}
	public void setuBirthday(Date uBirthday) {
		this.uBirthday = uBirthday;
	}
	public String getuQue() {
		return uQue;
	}
	public void setuQue(String uQue) {
		this.uQue = uQue;
	}
	public String getuAns() {
		return uAns;
	}
	public void setuAns(String uAns) {
		this.uAns = uAns;
	}
	public int getuAccumulate() {
		return uAccumulate;
	}
	public void setuAccumulate(int uAccumulate) {
		this.uAccumulate = uAccumulate;
	}
	public int getuLive() {
		return uLive;
	}
	public void setuLive(int uLive) {
		this.uLive = uLive;
	}
	public User(String uName, String uPassword, String uMail) {
		super();
		this.uName = uName;
		this.uPassword = uPassword;
		this.uMail = uMail;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", uName=" + uName + ", uPassword="
				+ uPassword + ", uNickName=" + uNickName + ", uSex=" + uSex
				+ ", uMail=" + uMail + ", uBirthday=" + uBirthday + ", uQue="
				+ uQue + ", uAns=" + uAns + ", uAccumulate=" + uAccumulate
				+ ", uLive=" + uLive + ", state=" + state + ", code=" + code
				+ "]";
	}
}
