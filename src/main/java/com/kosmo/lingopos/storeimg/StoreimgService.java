package com.kosmo.lingopos.storeimg;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class StoreimgService {
	@Resource(name="storeimgDAO")
	private StoreimgDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public List<StoreimgDTO> select(Map map) {
		return dao.select(map);
	}
}
