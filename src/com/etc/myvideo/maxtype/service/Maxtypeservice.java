package com.etc.myvideo.maxtype.service;

import java.util.List;



import com.etc.myvideo.maxtype.dao.Maxtypedao;
import com.etc.myvideo.maxtype.entity.Maxtype;

public class Maxtypeservice {
	private Maxtypedao maxtypedao;

	
	public void setMaxtypedao(Maxtypedao maxtypedao) {
		this.maxtypedao = maxtypedao;
	}
	
	//查询所有的大类型
	public List<Maxtype> findMaxtype(){
				return maxtypedao.findMaxtype();
	}
	
}
