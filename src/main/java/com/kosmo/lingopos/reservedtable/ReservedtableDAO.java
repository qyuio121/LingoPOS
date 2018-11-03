package com.kosmo.lingopos.reservedtable;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("reservedtableDAO")
public class ReservedtableDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoReservedtableInsert",map);
	}
	public int delete(Map map) {
		return template.delete("LingoReservedtableDelete",map);
	}
	public List<ReservedtableDTO> select(Map map) {
		return template.selectList("LingoReservedtableSelect",map);
	}
	public List<ReservedtableDTO> selectbyid(Map map) {
		return template.selectList("LingoReservedtableSelectbyId",map);
	}
	public List<ReservedtableDTO> selectbyandroid(Map map) {
		return template.selectList("LingoReservedtableSelectbyAndroid",map);
	}
	public List<ReservedtableDTO> selectadmin(Map map) {
		return template.selectList("LingoReservedtableSelectAdmin",map);
	}
	public List<Map> selectValidate(Map map) {
		return template.selectList("LingoReservedtableValidate",map);
	}
	public int getTotalRecord(Map map) {
		return template.selectOne("LingoReservedtableGetTotalRecord",map);
	}
	public int getTotalRecordbyid(Map map) {
		return template.selectOne("LingoReservedtableGetTotalRecordbyId",map);
	}
	public int getTotalRecordadmin(Map map) {
		return template.selectOne("LingoReservedtableGetTotalRecordAdmin",map);
	}
	public int count() {
		return template.selectOne("LingoReservedtableCount");
	}
}
