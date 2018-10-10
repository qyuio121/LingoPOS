package com.kosmo.lingopos.storeimg;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("storeimgDAO")
public class StoreimgDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoStoreimgInsert",map);
	}
	public int delete(Map map) {
		return template.delete("LingoStoreimgDelete",map);
	}
	public List<StoreimgDTO> select(Map map) {
		return template.selectList("LingoStoreimgSelect",map);
	}
}
