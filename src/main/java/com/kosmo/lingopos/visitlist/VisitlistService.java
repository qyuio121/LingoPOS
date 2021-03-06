package com.kosmo.lingopos.visitlist;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class VisitlistService {
	@Resource(name="visitlistDAO")
	private VisitlistDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public int deletebyStoreno(Map map) {
		return dao.deletebyStoreno(map);
	}
	public List<VisitlistDTO> select(Map map) {
		return dao.select(map);
	}
	public List<VisitlistDTO> selectbyuser(Map map) {
		return dao.selectbyuser(map);
	}
	public int isVisit(Map map) {
		return dao.isVisit(map);
	}
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}
	public int getTotalRecordbyUser(Map map) {
		return dao.getTotalRecordbyUser(map);
	}
	public int count() {
		return dao.count();
	}
	public int notcount() {
		return dao.notcount();
	}
}
