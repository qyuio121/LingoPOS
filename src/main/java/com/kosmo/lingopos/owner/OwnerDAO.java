package com.kosmo.lingopos.owner;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("ownerDAO")
public class OwnerDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoOwnerInsert",map);
	}
	public int update(Map map) {
		return template.update("LingoOwnerUpdate",map);
	}
	public int delete(Map map) {
		return template.delete("LingoOwnerDelete",map);
	}
	public List<OwnerDTO> selectAdmin() {
		return template.selectList("LingoOwnerSelectAdmin");
	}
	public OwnerDTO select(Map map) {
		return template.selectOne("LingoOwnerSelect",map);
	}
}
