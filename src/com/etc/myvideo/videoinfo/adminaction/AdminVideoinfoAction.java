package com.etc.myvideo.videoinfo.adminaction;

import java.io.File;
import java.io.IOException;
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
import com.etc.myvideo.util.PageBean;
import com.etc.myvideo.videocount.entity.Videocount;
import com.etc.myvideo.videoinfo.entity.Videoinfo;
import com.etc.myvideo.videoinfo.service.Videoinfoservice;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminVideoinfoAction extends ActionSupport implements
		ModelDriven<Videoinfo> {

	private Videoinfo videoinfo = new Videoinfo();

	private Videoinfoservice videoinfoservice;
	private Areaservice areaservice;
	private Maxtypeservice maxtypeservice;

	private Mintypeservice mintypeservice;

	public Mintypeservice getMintypeservice() {
		return mintypeservice;
	}

	public void setMintypeservice(Mintypeservice mintypeservice) {
		this.mintypeservice = mintypeservice;
	}

	public void setMaxtypeservice(Maxtypeservice maxtypeservice) {
		this.maxtypeservice = maxtypeservice;
	}

	public void setVideoinfoservice(Videoinfoservice videoinfoservice) {
		this.videoinfoservice = videoinfoservice;
	}

	public void setAreaservice(Areaservice areaservice) {
		this.areaservice = areaservice;
	}

	// 图片上传文件上传需要的三个属性:
	private File imageaddfiler;
	private String imageaddfilerFileName;
	private String imageaddfilerContentType;

	// 影片上传文件上传需要的三个属性:
	private File viaddrfile;
	private String viaddrfileFileName;
	private String viaddrfileContentType;

	// 临时属性
	private int maxId;
	private int minId;
	private int areaId;
	private String couDuration;// 时长
	private int couCount;// 集号

	public int getCouCount() {
		return couCount;
	}

	public void setCouCount(int couCount) {
		this.couCount = couCount;
	}

	public File getViaddrfile() {
		return viaddrfile;
	}

	public void setViaddrfile(File viaddrfile) {
		this.viaddrfile = viaddrfile;
	}

	public String getViaddrfileFileName() {
		return viaddrfileFileName;
	}

	public void setViaddrfileFileName(String viaddrfileFileName) {
		this.viaddrfileFileName = viaddrfileFileName;
	}

	public String getViaddrfileContentType() {
		return viaddrfileContentType;
	}

	public void setViaddrfileContentType(String viaddrfileContentType) {
		this.viaddrfileContentType = viaddrfileContentType;
	}

	public String getCouDuration() {
		return couDuration;
	}

	public void setCouDuration(String couDuration) {
		this.couDuration = couDuration;
	}

	public int getMaxId() {
		return maxId;
	}

	public void setMaxId(int maxId) {
		this.maxId = maxId;
	}

	public int getMinId() {
		return minId;
	}

	public void setMinId(int minId) {
		this.minId = minId;
	}

	public int getAreaId() {
		return areaId;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public File getImageaddfiler() {
		return imageaddfiler;
	}

	public void setImageaddfiler(File imageaddfiler) {
		this.imageaddfiler = imageaddfiler;
	}

	public String getImageaddfilerFileName() {
		return imageaddfilerFileName;
	}

	public void setImageaddfilerFileName(String imageaddfilerFileName) {
		this.imageaddfilerFileName = imageaddfilerFileName;
	}

	public String getImageaddfilerContentType() {
		return imageaddfilerContentType;
	}

	public void setImageaddfilerContentType(String imageaddfilerContentType) {
		this.imageaddfilerContentType = imageaddfilerContentType;
	}

	@Override
	public Videoinfo getModel() {

		return videoinfo;
	}

	// 跳转添加界面

	public String toaddview() {

		List<Area> areas = areaservice.findaAreas();
		List<Maxtype> maxtypes = maxtypeservice.findMaxtype();
		List<Mintype> mintypes = mintypeservice.findMintype();

		ActionContext.getContext().getValueStack().set("areas", areas);
		ActionContext.getContext().getValueStack().set("maxtypes", maxtypes);
		ActionContext.getContext().getValueStack().set("mintypes", mintypes);
		return "toaddview";
	}

	// 保存视频的方法:
	public String savevideoinfo() throws IOException {
		// 将提交的数据添加到数据库中.
		Area area = new Area();
		area.setAreaId(areaId);

		Mintype mintype = new Mintype();
		mintype.setMinId(minId);

		Maxtype maxtype = new Maxtype();
		maxtype.setMaxId(maxId);
		videoinfo.setArea(area);
		videoinfo.setMaxtype(maxtype);
		videoinfo.setMintype(mintype);

		if (imageaddfiler != null) {
			// 将上传到服务器上.
			// 获得的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath(
					"/uploadimage");
			// 创建文件类型对象:
			File diskFile = new File(path + "//" + imageaddfilerFileName);
			// 文件上传:
			FileUtils.copyFile(imageaddfiler, diskFile);

			videoinfo.setVidImage("uploadimage/" + imageaddfilerFileName);
		}

		Videocount videocount = new Videocount();
		if (viaddrfile != null) {
			// 将上传到服务器上.
			// 获得上传的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath(
					"/uploadvideo");
			// 创建文件类型对象:
			File diskFile = new File(path + "//" + viaddrfileFileName);
			// 文件上传:
			FileUtils.copyFile(viaddrfile, diskFile);

			videocount.setCouUrl("uploadvideo/" + viaddrfileFileName);
		}

		videocount.setCouCount(couCount);
		videocount.setCouClick(0);
		videocount.setCouUpload(new Date());
		videocount.setCouDuration(couDuration);

		videocount.setVideoinfo(videoinfo);

		videoinfo.getVideocounts().add(videocount);

		videoinfoservice.savevideoinfo(videoinfo);
		return "saveSuccess";

	}

	// 页码
	private int page;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	// 分页查视频
	public String findallvideo() {

		PageBean<Videoinfo> vList = videoinfoservice.findallvideo(page);
		// 将数据存入到值栈中保存到页面
		ActionContext.getContext().getValueStack().set("pageBean", vList);
		// 页面跳转:
		return "adminfindallvideo";
	}

	// 删除视频的方法:
	public String deletevideo() {
		// 根据id查询视频信息
		videoinfo = videoinfoservice.findByvidId(videoinfo.getVidId());
		// 删除:
		String path = ServletActionContext.getServletContext().getRealPath(
				"/" + videoinfo.getVidImage());
		File file = new File(path);
		file.delete();
		Set<Videocount> videocounts = videoinfo.getVideocounts();

		if (videocounts.size() != 0) {
			for (Videocount vc : videocounts) {
				// 删除:
				String path2 = ServletActionContext.getServletContext()
						.getRealPath("/" + vc.getCouUrl());
				File file2 = new File(path2);
				file2.delete();
			}

		}

		// 删除数据库中记录:
		videoinfoservice.delete(videoinfo);
		// 页面跳转
		return "deleteSuccess";
	}

	// 编辑视频的方法
	public String editvideoinfo() {
		// 根据id查询视频信息
		videoinfo = videoinfoservice.findByvidId(videoinfo.getVidId());

		List<Area> areas = areaservice.findaAreas();
		List<Maxtype> maxtypes = maxtypeservice.findMaxtype();
		List<Mintype> mintypes = mintypeservice.findMintype();

		ActionContext.getContext().getValueStack().set("areas", areas);
		ActionContext.getContext().getValueStack().set("maxtypes", maxtypes);
		ActionContext.getContext().getValueStack().set("mintypes", mintypes);
		// 页面跳转到编辑页面:
		return "editSuccess";
	}

	// 修改视频的方法
	public String updatevideoinfo() throws IOException {

		// 上传:
		if (imageaddfiler != null) {
			String delPath = ServletActionContext.getServletContext()
					.getRealPath("/" + videoinfo.getVidImage());
			File file = new File(delPath);
			file.delete();
			// 获得上传的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath(
					"/uploadimage");
			// 创建文件类型对象:
			File diskFile = new File(path + "//" + imageaddfilerFileName);
			// 文件上传:
			FileUtils.copyFile(imageaddfiler, diskFile);

			videoinfo.setVidImage("uploadimage/" + imageaddfilerFileName);
		}

		videoinfoservice.updatevideoinfo(videoinfo);
		// 页面跳转
		return "updateSuccess";

	}

}
