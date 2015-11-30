package com.etc.myvideo.user.action;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.etc.myvideo.user.entity.User;
import com.etc.myvideo.user.service.IUserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User> {
	// 模型驱动使用的对象
	private User user = new User();
	private String email; // 邮箱名
	private String password;// 密码
	private String userName;// 用户名
	private int accumulate;// 积分
	private String sex;// 性别
	private int level;// 等级
	private String nickName;
	private String birthday;
	private String checkcode;
	
	
	
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	private static String PAGE;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getAccumulate() {
		return accumulate;
	}

	public void setAccumulate(int accumulate) {
		this.accumulate = accumulate;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCheckcode() {
		return checkcode;
	}

	public IUserService getUserService() {
		return userService;
	}


	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	// 注入UserService
	private IUserService userService;

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	/**
	 * AJAX进行异步校验用户名的执行方法
	 * 
	 * @throws IOException
	 */
	public String findByName() throws IOException {
		// 调用Service进行查询:
		User existUser = userService.findByUsername(getUserName());
		// 获得response对象,项页面输出:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		// 判断
		if (existUser != null) {
			// 查询到该用户:用户名已经存在
			response.getWriter().println("<font color='red'>用户名已经存在</font>");
		} else {
			// 没查询到该用户:用户名可以使用
			response.getWriter().println("<font color='green'>用户名可以使用</font>");
		}
		return NONE;
	}

	/**
	 * 用户注册的方法:
	 */
	public String register() {

		// 从session中获得验证码的随机值:
		String checkcode1 = (String) ServletActionContext.getRequest()
				.getSession().getAttribute("checkcode");

		// User user = new User();
		user.setuMail(getEmail());
		user.setuPassword(getPassword());
		user.setuName(getNickName());
		user.setuSex(getSex());
		DateFormat fmt =new SimpleDateFormat("yyyy-MM-dd");

		try {
			Date date = fmt.parse(getBirthday());
			user.setuBirthday(date); 
		} catch (ParseException e) {
			
			e.printStackTrace();
		}

		if (!getCheckcode().equalsIgnoreCase(checkcode1)) {
			this.addActionError("验证码输入错误!");
			return "fail";
		}

		userService.save(user);
		this.addActionMessage("注册成功!请去邮箱激活!");
		return "msg";

	}

	/**
	 * 用户激活的方法
	 */
	public String active() {
		// 根据激活码查询用户:
		User existUser = userService.findByCode(user.getCode());
		// 判断
		if (existUser == null) {
			// 激活码错误的
			this.addActionMessage("激活失败:激活码错误!");
		} else {
			// 激活成功
			// 修改用户的状态
			existUser.setState(1);
			existUser.setCode(null);
			userService.update(existUser);
			this.addActionMessage("激活成功:请去登录!");
		}
		return "msg";
	}

	/**
	 * 跳转到注册页面的执行方法
	 */
	public String registPage() {
		return "registPage";
	}

	/**
	 * 跳转到登录页面
	 */
	public String loginPage() {
		return "loginPage";
	}

	/**
	 * 登录的方法
	 */
	public String login() {
       
		String checkcode1 = (String) ServletActionContext.getRequest()
				.getSession().getAttribute("checkcode");
		if (!getCheckcode().equalsIgnoreCase(checkcode1)) {
			
			ServletActionContext.getRequest().getSession().setAttribute("result", false);
			ServletActionContext.getRequest().getSession().setAttribute("msg", "验证码错误！");
			return "fail";
			

		} 
		user.setuMail(getEmail());
		user.setuPassword(getPassword());
		User existUser = userService.login(user);
		// 判断
		if (existUser == null) {
			// 登录失败
			ServletActionContext.getRequest().getSession().setAttribute("result", false);
			ServletActionContext.getRequest().getSession().setAttribute("msg", "用户名或密码错误或用户未激活！");
			PAGE="login";
			return PAGE;
		} else {
			// 登录成功
			// 将用户的信息存入到session中
			ServletActionContext.getRequest().getSession()
					.setAttribute("existUser", existUser);
			// 页面跳转
			PAGE="loginSuccess";
			ServletActionContext.getRequest().getSession().removeAttribute("result");
			ServletActionContext.getRequest().getSession().removeAttribute("msg");
			return PAGE;
		}
		

	}

	/**
	 * 用户退出的方法
	 */
	public String quit() {
		// 销毁session
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}

	public void isExitUserEmail() {
		String flag = ServletActionContext.getRequest().getParameter("flag");

		String email = ServletActionContext.getRequest().getParameter("uMail");
		
		String name=ServletActionContext.getRequest().getParameter("nickName");
		

		AjaxServerRegister(email, flag);

	}

	private void AjaxServerRegister(String email, String flag) {
		User userEmail = userService.findByEmail(email);
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=UTF-8");
			// 注册
			if (flag.equals(0)) {
				// 说明存在该用户
				if (userEmail != null) {

					response.getWriter().println(
							"<font color='red'>邮箱已经存在</font>");
				}
				// 说明不存在用户，邮箱可以注册
				else {
					response.getWriter().println(
							"<font color='green'>邮箱可以使用</font>");
				}

			}
			// 用户登录
			else if (flag.equals(1))

			{
				if (userEmail != null) {

					response.getWriter()
							.println(
									"<a id='lab1' style='font-size: 8px;text-decoration: none;'href='register.jsp'>注册账号</a>");
				}
				// 说明不存在用户，邮箱可以注册
				else {

					response.getWriter().println(
							"<font color='blue'>邮箱存在，请登录</font>");
				}

			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * AJAXlogin登录的方法
	 * 
	 * @throws Exception
	 */
	public String AJAXlogin() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		System.out.println(user.getuPassword() + " 这是用户密码");
		String email = ServletActionContext.getRequest().getParameter("uMail");
		String pass = ServletActionContext.getRequest().getParameter(
				"uPassword");
		user.setuMail(email);
		user.setuPassword(pass);
		User existUser = userService.login(user);
		// 判断
		if (existUser == null) {

			response.getWriter().print("0"); //
		} else {
			// 登录成功
			// 将用户的信息存入到session中
			ServletActionContext.getRequest().getSession()
					.setAttribute("existUser", existUser);
			response.getWriter().print("1");
		}
		return NONE;

	}

	@Override
	public User getModel() {
		return user;
	}

	/**
	 * 用户个人信息查看 gao
	 * @return
	 */
	public String findUserInfo(){

		return "personInfo";
	}

	/**
	 * 用户个人信息修改
	 * gao
	 * @return
	 * @throws ParseException
	 */

	public String update() throws ParseException {
		String name = ServletActionContext.getRequest().getParameter("uName");
		String nickName = ServletActionContext.getRequest().getParameter(
				"uNickName");
		String sex = ServletActionContext.getRequest().getParameter("uSex");
		String birthday = ServletActionContext.getRequest().getParameter(
				"uBirthday");

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = format.parse(birthday);
		
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		user.setuName(name);
		user.setuNickName(nickName);
		user.setuSex(sex);
		user.setuBirthday(date);

		userService.update(user);
		int userId = user.getUid();
		User pUser = userService.findByUserId(userId);
		ServletActionContext.getRequest().getSession().setAttribute("existUser", pUser);
		
		return "personInfo";
	}
	
	/**
	 * 转向更新密码页
	 * @return
	 */
	public String tonewpass(){
		User findUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("finduser");
		
		
		return "newpassword";
	}
    /**
     * 找到激活后的用户
     * @return
     */
	public String findpassactive() {

		// 根据激活码查询用户:
		User existUser = userService.findByCode(user.getCode());
		// 判断
		if (existUser == null) {
			// 激活码错误的
			System.out.println("没有该用户");
		} else {
			// 激活成功
			// 修改用户的状态
			existUser.setState(1);
			existUser.setCode(null);
			userService.update(existUser);
			ServletActionContext.getRequest().getSession()
					.setAttribute("finduser", existUser);
		}
		return "tonewpass";

	}
    /**
     * 找到密码
     * @return
     */
	public String findpassword() {

		User findUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("finduser");
		findUser.setuPassword(getPassword());
		userService.update(findUser);
		return "login";

	}
    /**
     * 转到邮箱
     * @return
     */
	public String findPassToEmail() {

		String checkcode1 = (String) ServletActionContext.getRequest()
				.getSession().getAttribute("checkcode");
		String checkCode2 = ServletActionContext.getRequest().getParameter(
				"checkcode");

		if (!checkCode2.equalsIgnoreCase(checkcode1)) {
			return "findError";

		}
		System.out.println(getEmail());
		user.setuMail(getEmail());
		User findEmail = userService.findByEmail(email);
		if (findEmail != null) {
			userService.findPass(findEmail);
			return "tofindpass";
		}
		return null;

	}
}
