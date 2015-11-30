package com.etc.myvideo.comment.service;

import java.util.List;

import com.etc.myvideo.comment.dao.Commentdao;
import com.etc.myvideo.comment.entity.Comment;
import com.etc.myvideo.user.entity.User;
import com.etc.myvideo.util.PageBean;

public class Commentservice {

	private Commentdao commentdao;

	public void setCommentdao(Commentdao commentdao) {
		this.commentdao = commentdao;
	}

	// 根据vidId带有分页查询评论
	public PageBean<Comment> findByPagecouId(Integer couId, int page) {
		PageBean<Comment> pageBean = new PageBean<Comment>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		int limit = 10;
		pageBean.setLimit(limit);
		// 设置总记录数:
		int totalCount = 0;
		totalCount = commentdao.findByPagecouId(couId);
		pageBean.setTotalCount(totalCount);
		// 设置总页数:
		int totalPage = 0;
		// Math.ceil(totalCount / limit);
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 每页显示的数据集合:
		// 从哪开始:
		int begin = (page - 1) * limit;
		List<Comment> list = commentdao.findByPagecouId(couId, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

	// 保存评论
	public void savecomment(Comment comment) {

		commentdao.savecomment(comment);
	}

	// 查询是否点赞
	public Comment chadianzan(Integer uid, Integer couId) {
		return commentdao.chadianzan(uid, couId);

	}

	// 查询总的赞
	public int findallzan(Integer couId) {

		return commentdao.findallzan(couId);
	}

	/**
	 * 通过comId查询评论
	 * 
	 * @param comId
	 * @param page
	 * @return
	 */
	public PageBean<Comment> findByVideoList(int comId, int page) {
		PageBean<Comment> pageBean = new PageBean<Comment>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		int limit = 10;
		pageBean.setLimit(limit);
		// 设置总记录数:
		int totalCount = 0;
		totalCount = commentdao.findByPagecouId(comId);
		pageBean.setTotalCount(totalCount);
		// 设置总页数:
		int totalPage = 0;
		// Math.ceil(totalCount / limit);
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 每页显示的数据集合:
		// 从哪开始:
		int begin = (page - 1) * limit;
		List<Comment> list = commentdao.findByVideoList(comId, begin, limit);
		pageBean.setList(list);
		if (pageBean != null) {
			return pageBean;
		}
		return null;
	}

	public PageBean<Comment> getAllComment(int page) {
		PageBean<Comment> pageBean = new PageBean<Comment>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:

		int limit = 10;
		pageBean.setLimit(limit);
		// 设置总记录数:
		int totalCount = 0;
		totalCount = commentdao.getAllCommentCount();
		pageBean.setTotalCount(totalCount);
		// 设置总页数:
		int totalPage = 0;
		// Math.ceil(totalCount / limit);
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 每页显示的数据集合:
		// 从哪开始:
		int begin = (page - 1) * limit;
		List<Comment> list = commentdao.getAllComment(begin, limit);
		pageBean.setList(list);
		if (pageBean != null) {
			return pageBean;
		}
		return null;
	}

	public void deleteComment(Comment comment) {
		commentdao.deleteComment(comment);
	}

}
