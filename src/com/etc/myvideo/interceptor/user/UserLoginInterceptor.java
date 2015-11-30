package com.etc.myvideo.interceptor.user;

import org.apache.struts2.ServletActionContext;

import com.etc.myvideo.user.entity.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class UserLoginInterceptor extends MethodFilterInterceptor {

	public UserLoginInterceptor() {
	}

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if (user==null) {
			return "login";
			
			
		}
		//如果登录。则放行
		return arg0.invoke();
		
	}

}
