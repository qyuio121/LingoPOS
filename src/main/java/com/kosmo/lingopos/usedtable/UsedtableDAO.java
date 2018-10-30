package com.kosmo.lingopos.usedtable;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("usedtableDAO")
public class UsedtableDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;

	public List<UsedtableDTO> select(Map map) {
		return template.selectList("LingoUsedtableSelect",map);
	}
	public int delete(Map map) {
		return template.delete("LingoUsedtableDelete",map);
	}
}
