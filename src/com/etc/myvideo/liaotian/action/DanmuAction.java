package com.etc.myvideo.liaotian.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.etc.myvideo.liaotian.entity.TalkToAll;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DanmuAction extends ActionSupport implements
		ModelDriven<TalkToAll> {

	private int couId;

	public int getCouId() {
		return couId;
	}

	public void setCouId(int couId) {
		this.couId = couId;
	}

	private TalkToAll talkToAll = new TalkToAll();
	private Map<Integer, List<TalkToAll>> danmus = new HashMap<Integer, List<TalkToAll>>(); // key为视频id，value为该视频对应的
	

	// 得到弹幕
	public String getDanmu() throws Exception {
		// 获得response对象,项页面输出:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");

		 List<TalkToAll> ds = danmus.get(couId); // 拿到本视频对应的弹幕信息
		if (ds != null) {
			Gson gson = new Gson();
			String str = gson.toJson(ds);
			
			response.getWriter().print(str); // 将弹幕内容写回
			if (ds.size()>=5) {
				
				ds.remove(0);
			}
	
		
		}
		
	

		

		return NONE;
	}
	
	


	// 显示弹幕
	public String xianshidanmu() throws Exception {
		// 获得response对象,项页面输出:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");

		if (danmus.get(couId) == null) // 第1次上传本视频弹幕
		{
			List<TalkToAll> ds = new ArrayList<TalkToAll>();
			danmus.put(couId, ds);
		}
		long time = new Date().getTime();// 弹幕时间

		String messageString = talkToAll.getInfoToAll();
		String message = new String(messageString.getBytes("ISO-8859-1"),
				"utf-8");

		TalkToAll talkToAll = new TalkToAll(message, time);

		danmus.get(couId).add(talkToAll);

		List<TalkToAll> ds = danmus.get(couId);
		if (ds != null) {
			Gson gson = new Gson();
			String str = gson.toJson(ds);
		System.out.println("你好"+str);
			try {

				response.getWriter().print(str);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 将弹幕内容写回

		}
		return NONE;
	}

	// 添加弹幕
	public String adddanmu() throws IOException {

		if (danmus.get(couId) == null) // 第1次上传本视频弹幕
		{
			List<TalkToAll> ds = new ArrayList();
			danmus.put(couId, ds);
		}

		long time = new Date().getTime();// 弹幕时间
		danmus.get(couId).add(new TalkToAll(talkToAll.getInfoToAll(), time));

		/*
		 * for (Map.Entry<Integer, List<TalkToAll>> entry : danmus.entrySet()) {
		 * System.out.println("key= " + entry.getKey() + " and value= " +
		 * entry.getValue().toString()); }
		 */

		return NONE;
	}

	@Override
	public TalkToAll getModel() {

		return talkToAll;
	}

}
