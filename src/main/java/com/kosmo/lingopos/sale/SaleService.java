package com.kosmo.lingopos.sale;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class SaleService {
	@Resource(name="saleDAO")
	private SaleDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public List<SaleDTO> selectDay(Map map) {
		return dao.selectDay(map);
	}
	public List<SaleDTO> selectMonth(Map map) {
		return dao.selectMonth(map);
	}
	public List<SaleDTO> selectYear(Map map) {
		return dao.selectYear(map);
	}
	public List<SaleDTO> selectAdmin() {
		return dao.selectAdmin();
	}
}
