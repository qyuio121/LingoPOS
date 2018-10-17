package com.kosmo.lingopos.map;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("mapDAO")
public class MapDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoMapInsert",map);
	}
	public int update(Map map) {
		return template.update("LingoMapUpdate",map);
	}
	public int delete(Map map) {
		return template.delete("LingoMapDelete",map);
	}
	public List<MapDTO> select() {
		return template.selectList("LingoMapSelect");
	}

}
