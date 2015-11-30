package com.etc.myvideo.switchimage.service;

import java.util.List;

import com.etc.myvideo.switchimage.dao.SwitchImageDao;
import com.etc.myvideo.switchimage.entity.SwitchImage;


public class SwitchImageService {
	// 注入Dao
	private SwitchImageDao switchImageDao;

	public void setSwitchImageDao(SwitchImageDao switchImageDao) {
		this.switchImageDao = switchImageDao;
	}

	/**
	 * 查询所有的图片切换源
	 * 
	 * @return
	 */
	public List<SwitchImage> findall() {
		return switchImageDao.findall();
	}

}
