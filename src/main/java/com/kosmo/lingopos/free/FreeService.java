package com.kosmo.lingopos.free;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("freeService")
public class FreeService {
	@Resource(name="freeDAO")
	private FreeDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int update(Map map) {
		return dao.update(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public FreeDTO selectOne(Map map) {
		return dao.selectOne(map);
	}
	public List<FreeDTO> selectAll(Map map) {
		return dao.selectAll(map);
	}
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}
}
