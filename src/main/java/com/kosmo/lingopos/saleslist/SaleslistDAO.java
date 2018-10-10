package com.kosmo.lingopos.saleslist;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("saleslistDAO")
public class SaleslistDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;

	public List<SaleslistDTO> selectUser(Map map) {
		return template.selectList("LingoSaleslistSelectUser",map);
	}
	
}
