package com.etc.myvideo.comment.action.adminAction;

import org.apache.struts2.ServletActionContext;

import com.etc.myvideo.comment.entity.Comment;
import com.etc.myvideo.comment.service.Commentservice;
import com.etc.myvideo.util.PageBean;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CommentAdminAction extends ActionSupport implements ModelDriven<Comment>{
	private Comment comment=new Comment();
	private int page;
	private Commentservice commentservice;
	
	
	public Commentservice getCommentservice() {
		return commentservice;
	}
	public void setCommentservice(Commentservice commentservice) {
		this.commentservice = commentservice;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String findByVideoId(){
		PageBean<Comment> pageBean=commentservice.findByVideoList(comment.getComId(), page);
		//ServletActionContext.getRequest().getSession().setAttribute("pageBean", pageBean);
		ServletActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "";
	}
	@Override
	public Comment getModel() {
		// TODO Auto-generated method stub
		return comment;
	}
	
	
	
	public String findAllComment() {
		PageBean<Comment>  pageBean=commentservice.getAllComment(page);
		ServletActionContext.getContext().getValueStack().set("pagecomment",pageBean);
		
		return "commentmanage";
	}
	
	public String deleteComment(){
		
		commentservice.deleteComment(comment);
		
		return "deletecomment";
	}
}
