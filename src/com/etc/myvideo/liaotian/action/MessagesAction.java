package com.etc.myvideo.liaotian.action;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.etc.myvideo.liaotian.entity.TalkToAll;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class MessagesAction extends ActionSupport implements ModelDriven<TalkToAll> {
	
	private TalkToAll talkToAll=new TalkToAll();


	private int couId;
	


	public int getCouId() {
		return couId;
	}

	public void setCouId(int couId) {
		this.couId = couId;
	}



	
	
	Map<Integer,List<TalkToAll>> map = new HashMap<Integer,List<TalkToAll>>();


	public String talktoall() throws Exception {
		// 获得response对象,项页面输出:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		String lianotString = new String(talkToAll.getInfoToAll().getBytes("ISO-8859-1"), "UTF-8");   
		String nameString=new String(talkToAll.getUname().getBytes("ISO-8859-1"), "UTF-8"); 
		
		List<TalkToAll>  listtalk = new ArrayList<TalkToAll>();
		
		
		if(map.get(couId)==null){
			List<TalkToAll> list = new ArrayList<TalkToAll>();
			map.put(couId, list);
		}
        if("".equals(lianotString)||lianotString==null){
        	listtalk = map.get(couId);
        	Gson json=new Gson();//google第三方json包用于封装json格式
    		String str=json.toJson(listtalk);
    		response.getWriter().print(str);	
        }else{
    		map.get(couId).add(new TalkToAll(nameString,lianotString));
    		listtalk = map.get(couId);
            Gson json=new Gson();//
    		String str=json.toJson(listtalk);
    		response.getWriter().print(str);	
        }
        
        
   	  for (Map.Entry<Integer, List<TalkToAll>> entry : map.entrySet()) {
		   System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue().toString());
		  }
        
        return NONE;
		
	}
	
	

	public String gettalktoall() throws Exception {
		// 获得response对象,项页面输出:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
	
		
		
		
		List<TalkToAll>  listtalk = new ArrayList<TalkToAll>();
		
		
		if(map.get(couId)==null){
			List<TalkToAll> list = new ArrayList<TalkToAll>();
			map.put(couId, list);
		}
       	
        else{
    		
    		listtalk = map.get(couId);
            Gson json=new Gson();//
    		String str=json.toJson(listtalk);
    		response.getWriter().print(str);	
        }
        
        return NONE;
		
	}

	@Override
	public TalkToAll getModel() {
		
		return talkToAll;
	}

	
	
}
