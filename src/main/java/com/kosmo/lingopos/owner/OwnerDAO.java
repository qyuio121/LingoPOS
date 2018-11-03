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
	public int updatefalse(Map map) {
		return template.update("LingoOwnerUpdatefalse",map);
	}
	public int delete(Map map) {
		return template.delete("LingoOwnerDelete",map);
	}
	public List<OwnerDTO> selectAdminApply(Map map) {
		return template.selectList("LingoOwnerSelectAdminApply",map);
	}
	public int getTotalRecordApply() {
		return template.selectOne("LingoOwnerGetTotalRecordApply");
	}
	public List<OwnerDTO> selectAdminList(Map map) {
		return template.selectList("LingoOwnerSelectAdminList",map);
	}
	public int getTotalRecordList(Map map) {
		return template.selectOne("LingoOwnerGetTotalRecordList",map);
	}
	public OwnerDTO select(Map map) {
		return template.selectOne("LingoOwnerSelect",map);
	}
	public int count() {
		return template.selectOne("LingoOwnerCount");
	}
}
