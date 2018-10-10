package com.kosmo.lingopos.admin;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("adminDAO")
public class AdminDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoAdminInsert",map);
	}
	public int update(Map map) {
		return template.update("LingoAdminUpdate",map);
	}
	public int delete(Map map) {
		return template.delete("LingoAdminDelete",map);
	}
}
