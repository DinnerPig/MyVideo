package com.etc.myvideo.userupload.adminAction;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.etc.myvideo.area.entity.Area;
import com.etc.myvideo.area.service.Areaservice;
import com.etc.myvideo.maxtype.entity.Maxtype;
import com.etc.myvideo.maxtype.service.Maxtypeservice;
import com.etc.myvideo.mintype.entity.Mintype;
import com.etc.myvideo.mintype.service.Mintypeservice;
import com.etc.myvideo.user.entity.User;
import com.etc.myvideo.userupload.entity.Userupload;
import com.etc.myvideo.userupload.service.IUseruploadInfoService;
import com.etc.myvideo.userupload.service.Useruploadinfoservice;
import com.etc.myvideo.util.PageBean;
import com.etc.myvideo.videocount.entity.Videocount;
import com.etc.myvideo.videoinfo.entity.Videoinfo;
import com.etc.myvideo.videoinfo.service.Videoinfoservice;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 这是管理员管理用户上传视频的action
 * 1.主要是审核用户上传的视频是否正确，需要使用使用分页查找，修改对应的状态，状态为1表示审核通过。这样才能播放该视频
 * 2.如果涉及这视频不合法，管理员可以将视频删除 3.管理员可以根据用户查找上传的视频，也可以查找上传的所有视频 4.
 * 
 * @author Administrator
 * 
 */
public class AdminUserVideoinfoManagerAction extends ActionSupport implements
		ModelDriven<Userupload> {

	private Userupload userupload = new Userupload();

	private IUseruploadInfoService useruploadinfoservice;



	// 图片上传文件上传需要的三个属性:
	private File imagefile;// 图片文件
	private String imagefileFileName;// 图片文件名
	private String imagefileContentType;// 图片文件类型

	// 影片上传文件上传需要的三个属性:
	private File uldaddrfile; // 影片地址名
	private String uldaddrfileFileName;// 影片文件名
	private String uldaddrfileContentType;// 影片文件类型

	// 属性
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
	
    
	public File getImagefile() {
		return imagefile;
	}

	public void setImagefile(File imagefile) {
		this.imagefile = imagefile;
	}

	public String getImagefileFileName() {
		return imagefileFileName;
	}

	public void setImagefileFileName(String imagefileFileName) {
		this.imagefileFileName = imagefileFileName;
	}

	public String getImagefileContentType() {
		return imagefileContentType;
	}

	public void setImagefileContentType(String imagefileContentType) {
		this.imagefileContentType = imagefileContentType;
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



	/**
	 * 保存视频
	 * 
	 * @return
	 * @throws IOException
	 */
	public String savevideoinfo() throws IOException {
		// 将提交的数据添加到数据库中.
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (user != null) {

			userupload.setUid(user.getUid());

			if (imagefile != null) {
				// 将上传到服务器上.
				// 获得的服务器端路径.
				String path = ServletActionContext.getServletContext()
						.getRealPath("/uploadimage");
				// 创建文件类型对象:
				File diskFile = new File(path + "//" + imagefileFileName);
				// 文件上传:将这个文件复制到磁盘文件
				FileUtils.copyFile(imagefile, diskFile);
				// 保存该图片的路径
				userupload.setImage("uploadimage/" + imagefileFileName);
			}

			if (uldaddrfile != null) {
				// 将上传到服务器上.
				// 获得上传的服务器端路径.
				String path = ServletActionContext.getServletContext()
						.getRealPath("/uploadvideo");
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
		return null;

	}

	// 删除视频的方法:
	public String deletevideo() throws IOException {
		// 根据id查询视频信息
		Userupload useruploaddelete = useruploadinfoservice
				.findUseruploaByUld(userupload.getUld().toString());
		// 删除:
		String path = ServletActionContext.getServletContext().getRealPath(
				"/" + userupload.getUrl());
		File file = new File(path);
		file.delete();

		// 删除数据库中记录:
		useruploadinfoservice.deleteUseruploadVideoInfo(userupload);
		// 页面跳转
		return "deleteSuccess";
	}

	// 编辑视频的方法
	public String editvideoinfo() {

		// 根据id查询视频信息

		Userupload useruploadVideoInfo = useruploadinfoservice
				.findUseruploaByUld(userupload.getUld().toString());
		useruploadVideoInfo.setName(userupload.getName());

		useruploadVideoInfo.setDuration(userupload.getDuration());
		useruploadVideoInfo.setInfo(userupload.getInfo());
		useruploadVideoInfo.setClick(userupload.getClick());
		if (userupload.getStatus() == 1) {

			useruploadVideoInfo.setStatus(userupload.getStatus());
			// 将视频信息存到视频播放列表
			userUploadToVideoInfo(useruploadVideoInfo);

		}

		useruploadVideoInfo.setType(userupload.getType());
		useruploadinfoservice.updateUseruploadVideoInfo(useruploadVideoInfo);
		// 页面跳转到编辑页面:
		return "editSuccess";
	}

	// 将视频状态改变好后将视频存到播放列表
	public void userUploadToVideoInfo(Userupload userupload) {

		Videoinfo videoinfo = new Videoinfo();
		videoinfo.setVidImage(userupload.getImage());
		System.out.println(userupload.getImage());
		videoinfo.setVidInfo(userupload.getInfo());
		videoinfo.setVidName(userupload.getName());

		videoinfo.setVidState("1");
		// videoinfo.setVidYear(userupload.getUpload().toString());
		useruploadinfoservice.addUseruploadToVideoInfo(videoinfo);

		Videocount videocount = new Videocount();
		videocount.setCouClick(0);
		videocount.setCouDuration(userupload.getDuration());
		videocount.setCouUpload(userupload.getUpload());
		videocount.setCouUrl(userupload.getUrl());
		videocount.setCouCount(1);
		videocount.setVideoinfo(videoinfo);
		useruploadinfoservice.addUseruploadToVideoCount(videocount);

	}

	// 修改视频的方法
	public String updatevideoinfo() throws IOException {

		// 上传:
		if (imagefile != null) {
			String delPath = ServletActionContext.getServletContext()
					.getRealPath("/" + userupload.getImage());
			File file = new File(delPath);
			file.delete();
			// 获得上传的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath(
					"/uploadimage");
			// 创建文件类型对象:
			File diskFile = new File(path + "//" + imagefileFileName);
		
			// 文件上传:
			FileUtils.copyFile(imagefile, diskFile);

			userupload.setImage("uploadimage/" + imagefileFileName);
		}

		useruploadinfoservice.updateUseruploadVideoInfo(userupload);
		// 页面跳转
		return "updateSuccess";

	}

	/**
	 * 审核用户上传的视频,根据视频 编号进行查找和修改
	 * 
	 * @return
	 */
	public String editUseruploadVideoInfo() {
		Userupload uploadVideoInfo = useruploadinfoservice
				.findUseruploaByUld(userupload.getUld().toString());

		ServletActionContext.getContext().getValueStack()
				.set("uploadVideoInfo", uploadVideoInfo);

		return "toedituseruploadlist";

	}

	/**
	 * 跟用户编号查找对应的数据
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
			return "userVideoInfo";
		}
		return null;

	}

	/**
	 * 管理员获得用户上传的视频信息
	 * 
	 * @return
	 */
	public String getAllUserVideoInfo() {

		PageBean<Userupload> pageBean = useruploadinfoservice
				.getUseruploadVideoInfo(page);
		System.out.println(pageBean.getList().get(0).getName()+"----------------------------------------------------------------");

		if (pageBean != null) {

			ServletActionContext.getContext().getValueStack()
					.set("userupload", pageBean);
			return "getalluservideoinfo";

		}
		return null;

	}

	@Override
	public Userupload getModel() {
		return userupload;
	}

}
