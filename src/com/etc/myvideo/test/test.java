package com.etc.myvideo.test;


import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.etc.myvideo.admin.entity.Admin;
import com.etc.myvideo.admin.service.AdminService;
import com.etc.myvideo.user.entity.User;
import com.etc.myvideo.user.service.UserService;
import com.etc.myvideo.userupload.dao.UseruploadInfoDao;
import com.etc.myvideo.userupload.service.Useruploadinfoservice;

public class test {

	public static void main(String[] args) {
		/*
		 * ApplicationContext ac = new
		 * ClassPathXmlApplicationContext("applicationContext.xml");
		 * Videoinfodao videoinfodao=(Videoinfodao) ac.getBean("videoinfodao");
		 * List<Videoinfo> videoinfos=videoinfodao.findbymaxtype(1); for
		 * (Videoinfo videoinfo:videoinfos) {
		 * System.out.println(videoinfo.getVidName()); }
		 */

		ApplicationContext ac = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		// UseruploadInfoDao useruploadInfoDao= (UseruploadInfoDao) ac.getBean("useruploadVideoInfoDao");
		 Useruploadinfoservice useruploadInfoDao=(Useruploadinfoservice) ac.getBean("useruploadVideoInfoService");
	   System.out.println(useruploadInfoDao.getUseruploadVideoInfo(0).getList().get(0));
		/*Useruploadinfoservice useruploadinfoservice= (Useruploadinfoservice) ac.getBean("useruploadVideoInfoService");
		
		System.out.println(useruploadinfoservice.findUseruploadforPageBean("4", 1));*/
		 
		
		/*AdminService adminService = (AdminService) ac.getBean("adminService");
		Admin admin=new Admin();
		admin.setUsername("lin");
		admin.setPassword("1");
		Admin admin1 = adminService.login(admin);
		System.out.println(admin1);*/
		/*
		 * AdminDao adminDao=(AdminDao) ac.getBean("adminDao"); Admin admin =
		 * adminDao.findByAdminId(1);
		 */
		// System.out.println(admin);

		/*
		 * int i=videoinfodao.countbylikename("¸ã¶¨"); System.out.println(i);
		 */
		/*
		 * ApplicationContext ac = new
		 * ClassPathXmlApplicationContext("applicationContext.xml"); Gradedao
		 * Gradedao=(Gradedao) ac.getBean("gradedao"); List<Grade>
		 * list=Gradedao.finddbygraCount(1); for (Grade grade:list) {
		 * System.out.println(grade.getVideoinfo().getVidName()); }
		 */

		/*
		 * ApplicationContext ac = new
		 * ClassPathXmlApplicationContext("applicationContext.xml"); UserService
		 * userService = (UserService) ac.getBean("userService"); List<User>
		 * userList = userService.findAll(); for (User user : userList) {
		 * System.out.println(user.toString()); }
		 */
	}
}
