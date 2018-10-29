package com.kosmo.lingopos.store;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("storeDAO")
public class StoreDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoStoreInsert",map);
	}
	public int update(Map map) {
		return template.delete("LingoStoreUpdate",map);
	}
	public int delete(Map map) {
		return template.delete("LingoStoreDelete",map);
	}
	public StoreDTO select(Map map) {
		return template.selectOne("LingoStoreSelect",map);
	}
	public String selectbyID(Map map) {
		return template.selectOne("LingoStoreSelectbyID",map);
	}
	
}
