package com.kosmo.lingopos.blacklist;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class BlacklistService {
	@Resource(name="blacklistDAO")
	private BlacklistDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int update(Map map) {
		return dao.update(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public List<BlacklistDTO> select(Map map) {
		return dao.select(map);
	}
	public List<BlacklistDTO> selectAdminApply(Map map) {
		return dao.selectAdminApply(map);
	}
	public int getTotalRecordApply() {
		return dao.getTotalRecordApply();
	}
}
