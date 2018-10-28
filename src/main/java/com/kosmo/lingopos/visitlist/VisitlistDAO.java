package com.kosmo.lingopos.visitlist;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("visitlistDAO")
public class VisitlistDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoVisitlistInsert",map);
	}
	public int delete(Map map) {
		return template.delete("LingoVisitlistDelete",map);
	}
	public List<VisitlistDTO> select(Map map) {
		return template.selectList("LingoVisitlistSelect",map);
	}
	public int isVisit(Map map) {
		return template.selectOne("LingoIsVisit",map);
	}
	public int getTotalRecord(Map map) {
		return template.selectOne("LingoVisitGetTotalRecord",map);
	}
}
