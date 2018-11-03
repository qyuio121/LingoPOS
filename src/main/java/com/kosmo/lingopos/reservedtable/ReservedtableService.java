package com.kosmo.lingopos.reservedtable;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class ReservedtableService {
	@Resource(name="reservedtableDAO")
	private ReservedtableDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public List<ReservedtableDTO> select(Map map) {
		return dao.select(map);
	}
	public List<ReservedtableDTO> selectbyid(Map map) {
		return dao.selectbyid(map);
	}
	public List<ReservedtableDTO> selectbyandroid(Map map) {
		return dao.selectbyandroid(map);
	}
	public List<ReservedtableDTO> selectadmin(Map map) {
		return dao.selectadmin(map);
	}
	public List<Map> selectValidate(Map map) {
		return dao.selectValidate(map);
	}
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}
	public int getTotalRecordbyid(Map map) {
		return dao.getTotalRecordbyid(map);
	}
	public int getTotalRecordadmin(Map map) {
		return dao.getTotalRecordadmin(map);
	}
	public int count() {
		return dao.count();
	}
}
