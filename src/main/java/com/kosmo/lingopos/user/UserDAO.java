package com.kosmo.lingopos.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("userDAO")
public class UserDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoUserInsert",map);
	}
	public int update(Map map) {
		return template.delete("LingoUserUpdate",map);
	}
	public int delete(Map map) {
		return template.delete("LingoUserDelete",map);
	}
	public List<UserDTO> selectAll() {
		return template.selectList("LingoUserSelectAll");
	}
	public List<UserDTO> selectOne(Map map) {
		return template.selectList("LingoUserSelectOne",map);
	}
}
