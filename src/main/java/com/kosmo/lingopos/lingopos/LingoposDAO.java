package com.kosmo.lingopos.lingopos;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("lingoposDAO")
public class LingoposDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert() {
		return template.insert("LingoLingoposInsert");
	}
	public int update(Map map) {
		return template.update("LingoLingoposUpdate",map);
	}
	public int delete(Map map) {
		return template.delete("LingoLingoposDelete",map);
	}
	public List<LingoposDTO> select() {
		return template.selectList("LingoLingoposSelect");
	}

}
