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
	public int getTotalRecord(Map map) {
		return template.selectOne("LingoReservedtableGetTotalRecord",map);
	}
	public int getTotalRecordbyid(Map map) {
		return template.selectOne("LingoReservedtableGetTotalRecordbyId",map);
	}
}
