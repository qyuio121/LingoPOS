package com.kosmo.lingopos.store;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
@Service
public class StoreService {
	@Resource(name="storeDAO")
	private StoreDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int update(Map map) {
		return dao.delete(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public StoreDTO select(Map map) {
		return dao.select(map);
	}
	public String selectbyID(Map map) {
		return dao.selectbyID(map);
	}
}
