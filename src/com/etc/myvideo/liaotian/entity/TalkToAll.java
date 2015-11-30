package com.etc.myvideo.liaotian.entity;

public class TalkToAll {
	
	private String uname;
	
	private String infoToAll;
	private long timer;

	public String getInfoToAll() {
		return infoToAll;
	}
	public void setInfoToAll(String infoToAll) {
		this.infoToAll = infoToAll;
	}
	public long getTimer() {
		return timer;
	}
	public void setTimer(long timer) {
		this.timer = timer;
	}
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public TalkToAll(String uname, String infoToAll) {
		super();
		this.uname = uname;
		this.infoToAll = infoToAll;
	}
	public TalkToAll(String uname, String infoToAll, long timer) {
		super();
		this.uname = uname;
		this.infoToAll = infoToAll;
		this.timer = timer;
	}
	public TalkToAll() {
		super();
	}
	public TalkToAll(String infoToAll, long timer) {
		super();
		
		this.infoToAll = infoToAll;
		this.timer = timer;
	}
	
	public TalkToAll(String infoToAll) {
		super();
		this.infoToAll = infoToAll;
	}
}
