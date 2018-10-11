package com.kosmo.lingopos.free;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("freeDAO")
public class FreeDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoFreeInsert",map);
	}
	public int update(Map map) {
		return template.update("LingoFreeUpdate",map);
	}
	public int delete(Map map) {
		return template.delete("LingoFreeDelete",map);
	}
	public FreeDTO selectOne(Map map) {
		return template.selectOne("LingoFreeSelectOne",map);
	}
	public List<FreeDTO> selectAll(Map map) {
		return template.selectList("LingoFreeSelectAll",map);
	}
	public int getTotalRecord(Map map) {
		return template.selectOne("LingoFreeGetTotalRecord",map);
	}
}
