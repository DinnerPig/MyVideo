package com.etc.myvideo.videocount.action;

import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.etc.myvideo.videocount.entity.Videocount;
import com.etc.myvideo.videocount.service.Videocountservice;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class Videocountaction extends ActionSupport implements ModelDriven<Videocount>{
		private Videocount videocount=new Videocount();
		
		private Videocountservice videocountservice;
		
		
	 public void setVideocountservice(Videocountservice videocountservice) {
			this.videocountservice = videocountservice;
		}


	@Override
	public Videocount getModel() {
		
		return videocount;
	}


	//根据couid得到视频
	public String findBycouid() throws Exception {
	/*	Videocount currvideocount=videocountservice.findBycouId(videocount.getCouId());
		
		currvideocount.setCouClick(currvideocount.getCouClick()+1);
		videocountservice.updatevideocount(currvideocount);*/
		//System.out.println(currvideocount.toString());
		
		videocount=videocountservice.findBycouId(videocount.getCouId());
		videocount.setCouClick(videocount.getCouClick()+1);
		videocountservice.updatevideocount(videocount);
		

		//给变换页富数据
		List<Videocount> videolist=videocountservice.finddbycouClick();
		ActionContext.getContext().getValueStack().set("videolist", videolist);
		 
		return "findBycouid";
	} 
	
	
	

	
	



		/**下载
		 * 
		 */
	
	private static final long serialVersionUID = 5879762231742395104L;  
    
    private String fileName;//用户请求的文件名  
      
    /*private String inputPath;//下载资源的路径(在struts配置文件中设置)  
      
    public void setInputPath(String inputPath) {  
        this.inputPath = inputPath;  
    }  
  
    public String getInputPath() {  
        return inputPath;  
    }  */
  
    public void setFileName(String fileName) {  
        this.fileName = fileName;  
    }  
  
    public String getFileName() {  
        return fileName;  
    }  
  
      
    public String downloadFile() throws Exception {  
        /*ServletContext context = ServletActionContext.getServletContext();  
          
        String downloadDir = context.getRealPath("/upload");  
        String downloadFile = context.getRealPath(inputPath);  
        //防止用户请求不安全的资源  
        if(!downloadFile.startsWith(downloadDir)) {  
            return null;  
        }  */
        return "download_success";  
    }  
    /*  
     * 获取输入流资源  
     */  
    public InputStream getInputStream() throws Exception {  
        String path = File.separatorChar + new String(fileName.getBytes("ISO-8859-1"), "UTF-8");  
        return ServletActionContext.getServletContext().getResourceAsStream(path);  
    }  
    /*  
     * 获取下载时文件默认的文件名  
     */  
    public String getDownloadFileName() {  
        String downloadFileName = fileName; 
        
        int i=downloadFileName.lastIndexOf('/');
        downloadFileName = downloadFileName.substring(i+1,downloadFileName.length());
      /*  try {  
            downloadFileName = URLEncoder.encode(downloadFileName, "ISO-8859-1");  
        } catch (UnsupportedEncodingException e) {  
            e.getMessage();  
            e.printStackTrace();  
        }  */
        return downloadFileName;  
    } 

	


}
