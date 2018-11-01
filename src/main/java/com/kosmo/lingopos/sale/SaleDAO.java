package com.kosmo.lingopos.sale;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("saleDAO")
public class SaleDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoSaleInsert",map);
	}
	public int delete(Map map) {
		return template.delete("LingoSaleDelete",map);
	}
	public List<SaleDTO> selectDay(Map map) {
		return template.selectList("LingoSaleSelectinDay",map);
	}
	public List<SaleDTO> selectMonth(Map map) {
		return template.selectList("LingoSaleSelectinMonth",map);
	}
	public List<SaleDTO> selectYear(Map map) {
		return template.selectList("LingoSaleSelectinYear",map);
	}
	public List<SaleDTO> selectAdmin() {
		return template.selectList("LingoSaleSelectAdmin");
	}
}
