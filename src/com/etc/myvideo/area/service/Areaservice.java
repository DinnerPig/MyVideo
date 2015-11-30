package com.etc.myvideo.area.service;

import java.util.List;

import com.etc.myvideo.area.dao.Areadao;
import com.etc.myvideo.area.entity.Area;

public class Areaservice {
	
	private Areadao areadao;


	public void setAreadao(Areadao areadao) {
		this.areadao = areadao;
	}
	
	//查询所有的地名
		public List<Area> findaAreas(){
			
			
			return areadao.findaAreas();
		}
	
	

}
