package com.kosmo.lingopos.blacklist;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("blacklistDAO")
public class BlacklistDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoBlackInsert",map);
	}
	public int update(Map map) {
		return template.update("LingoBlackUpdate",map);
	}
	public int delete(Map map) {
		return template.delete("LingoBlackDelete",map);
	}
	public List<BlacklistDTO> select(Map map) {
		return template.selectList("LingoBlackSelect",map);
	}
	public List<BlacklistDTO> selectAdmin() {
		return template.selectList("LingoBlackSelectAdmin");
	}
}