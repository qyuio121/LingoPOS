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
	public int deletebyStoreno(Map map) {
		return template.delete("LingoVisitlistDeletebyStoreno",map);
	}
	public List<VisitlistDTO> select(Map map) {
		return template.selectList("LingoVisitlistSelect",map);
	}
	public List<VisitlistDTO> selectbyuser(Map map) {
		return template.selectList("LingoVisitlistSelectbyUser",map);
	}
	public int isVisit(Map map) {
		return template.selectOne("LingoIsVisit",map);
	}
	public int getTotalRecord(Map map) {
		return template.selectOne("LingoVisitGetTotalRecord",map);
	}
	public int getTotalRecordbyUser(Map map) {
		return template.selectOne("LingoVisitGetTotalRecordbyUser",map);
	}
	public int count() {
		return template.selectOne("LingoVisitCount");
	}
	public int notcount() {
		return template.selectOne("LingoVisitNotCount");
	}
	
}
