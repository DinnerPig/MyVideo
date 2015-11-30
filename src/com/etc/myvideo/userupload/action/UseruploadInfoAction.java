package com.etc.myvideo.userupload.action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.etc.myvideo.user.entity.User;
import com.etc.myvideo.userupload.entity.Userupload;
import com.etc.myvideo.userupload.service.IUseruploadInfoService;
import com.etc.myvideo.util.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UseruploadInfoAction extends ActionSupport implements
		ModelDriven<Userupload> {

	private Userupload userupload = new Userupload();

	private IUseruploadInfoService useruploadinfoservice;

	// 图片上传文件上传需要的三个属性:
	private File imageaddfile;// 图片文件
	private String imageaddfileFileName;// 图片文件名
	private String imageaddfileContentType;// 图片文件类型

	// 影片上传文件上传需要的三个属性:
	private File uldaddrfile; // 影片地址名
	private String uldaddrfileFileName;// 影片文件名
	private String uldaddrfileContentType;// 影片文件类型

	// 属性
	private Integer uld;
	private String name;// 影片名
	private String type;
	private String duration;// 区间
	private String info;// 影片信息
	private String url;// 连接
	private Timestamp upload;// 上传时间
	private String image;// 图片路径
	private Integer status;// 影片状态

	// 页码
	private int page;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public Integer getUld() {
		return uld;
	}

	public void setUld(Integer uld) {
		this.uld = uld;
	}

	public Userupload getUserupload() {
		return userupload;
	}

	public void setUserupload(Userupload userupload) {
		this.userupload = userupload;
	}

	public IUseruploadInfoService getUseruploadinfoservice() {
		return useruploadinfoservice;
	}

	public void setUseruploadinfoservice(
			IUseruploadInfoService useruploadinfoservice) {
		this.useruploadinfoservice = useruploadinfoservice;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Timestamp getUpload() {
		return upload;
	}

	public void setUpload(Timestamp upload) {
		this.upload = upload;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public File getUldaddrfile() {
		return uldaddrfile;
	}

	public void setUldaddrfile(File uldaddrfile) {
		this.uldaddrfile = uldaddrfile;
	}

	public String getUldaddrfileFileName() {
		return uldaddrfileFileName;
	}

	public void setUldaddrfileFileName(String uldaddrfileFileName) {
		this.uldaddrfileFileName = uldaddrfileFileName;
	}

	public String getUldaddrfileContentType() {
		return uldaddrfileContentType;
	}

	public void setUldaddrfileContentType(String uldaddrfileContentType) {
		this.uldaddrfileContentType = uldaddrfileContentType;
	}

	// 保存视频的方法:
	public File getImageaddfile() {
		return imageaddfile;
	}

	public void setImageaddfile(File imageaddfile) {
		this.imageaddfile = imageaddfile;
	}

	public String getImageaddfileFileName() {
		return imageaddfileFileName;
	}

	public void setImageaddfileFileName(String imageaddfileFileName) {
		this.imageaddfileFileName = imageaddfileFileName;
	}

	public String getImageaddfileContentType() {
		return imageaddfileContentType;
	}

	public void setImageaddfileContentType(String imageaddfileContentType) {
		this.imageaddfileContentType = imageaddfileContentType;
	}

	public String savevideoinfo() throws IOException {
		// 将提交的数据添加到数据库中.
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (user != null) {

			userupload.setUid(user.getUid());

		}

		if (imageaddfile != null) {
			// 将上传到服务器上.
			// 获得的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath(
					"/uploadimage");
			// 创建文件类型对象:
			File diskFile = new File(path + "//" + imageaddfileFileName);
			// 文件上传:将这个文件复制到磁盘文件
			FileUtils.copyFile(imageaddfile, diskFile);
			// 保存该图片的路径
			userupload.setImage("uploadimage/" + imageaddfileFileName);
		}

		if (uldaddrfile != null) {
			// 将上传到服务器上.
			// 获得上传的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath(
					"/uploadvideo");
			// 创建文件类型对象:
			File diskFile = new File(path + "//" + uldaddrfileFileName);
			// 文件上传:
			FileUtils.copyFile(uldaddrfile, diskFile);
			// 设置上传视频文件的路径
			userupload.setUrl("uploadVideo/" + uldaddrfileFileName);
		}

		// 保存该该信息
		useruploadinfoservice.save(userupload);

		return "saveSuccess";

	}

	// 删除视频的方法:
	public String deletevideo() {
		// 根据id查询视频信息
		Userupload useruploaddelete = useruploadinfoservice
				.findUseruploaByUld(userupload.getUld().toString());
		System.out.println(useruploaddelete);
		// 删除:
		// String path = ServletActionContext.getServletContext().getRealPath(
		// "/" + userupload.getUrl());
		// File file = new File(path);
		// file.delete();

		// 删除数据库中记录:
		useruploadinfoservice.deleteUseruploadVideoInfo(userupload);
		// 页面跳转
		return "deleteSuccess";
	}

	// 编辑视频的方法
	public String editvideoinfosave() {
		// 根据id查询视频信息
		Userupload useruploadVideoInfo = useruploadinfoservice
				.findUseruploaByUld(userupload.getUld().toString());
		useruploadVideoInfo.setName(userupload.getName());
		useruploadVideoInfo.setStatus(0);
		useruploadVideoInfo.setInfo(userupload.getInfo());
		useruploadVideoInfo.setType(userupload.getType());

		useruploadinfoservice.updateUseruploadVideoInfo(useruploadVideoInfo);
		// 页面跳转到编辑页面:
		return "editSuccess";
	}

	// 修改视频的方法
	public String updatevideoinfo() throws IOException {

		// 上传:
		if (imageaddfile != null) {
			String delPath = ServletActionContext.getServletContext()
					.getRealPath("/" + userupload.getImage());
			File file = new File(delPath);
			file.delete();
			// 获得上传的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath(
					"/uploadimage");
			// 创建文件类型对象:
			File diskFile = new File(path + "//" + imageaddfileFileName);
			// 文件上传:
			FileUtils.copyFile(imageaddfile, diskFile);

			userupload.setImage("uploadimage/" + imageaddfileFileName);
		}

		useruploadinfoservice.updateUseruploadVideoInfo(userupload);
		// 页面跳转
		return "updateSuccess";

	}

	// 查找对用的视频信息，
	public String getUseruploadVideoinfo() {
		// 根据id查询视频信息
		Userupload useruploadVideoInfo = useruploadinfoservice
				.findUseruploaByUld(userupload.getUld().toString());
		ServletActionContext.getContext().getValueStack()
				.set("userupload", useruploadVideoInfo);
		// 页面跳转到编辑页面:
		return "edituseruploadinfo";
	}

	/**
	 * 这是获得对用用户的上传的视频信息
	 * 
	 * adminUserupload_getUserVideoInfo
	 * 
	 * @return
	 */
	public String getUserVideoInfo() {
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (user != null) {
			PageBean<Userupload> pageBean = useruploadinfoservice
					.findUseruploadforPageBean(user.getUid().toString(), page);
			// 将数据存入到值栈中保存到页面
			ActionContext.getContext().getValueStack()
					.set("pageBean", pageBean);

			ServletActionContext.getRequest().getSession()
					.setAttribute("pagebean", pageBean);
			return "userVideoInfo";
		}
		return null;

	}

	@Override
	public Userupload getModel() {
		return userupload;
	}

}
