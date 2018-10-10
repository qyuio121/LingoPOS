package com.kosmo.lingopos.lingoas;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("lingoasDAO")
public class LingoasDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoLingoasInsert",map);
	}
	public int delete(Map map) {
		return template.delete("LingoLingoasDelete",map);
	}
	public List<LingoasDTO> select() {
		return template.selectList("LingoLingoasSelect");
	}

}
