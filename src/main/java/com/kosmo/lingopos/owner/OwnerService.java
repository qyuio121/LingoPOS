package com.kosmo.lingopos.owner;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class OwnerService {
	@Resource(name="ownerDAO")
	private OwnerDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int update(Map map) {
		return dao.update(map);
	}
	public int updatefalse(Map map) {
		return dao.updatefalse(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public List<OwnerDTO> selectAdminApply(Map map) {
		return dao.selectAdminApply(map);
	}
	public int getTotalRecordApply() {
		return dao.getTotalRecordApply();
	}
	public List<OwnerDTO> selectAdminList(Map map) {
		return dao.selectAdminList(map);
	}
	public int getTotalRecordList(Map map) {
		return dao.getTotalRecordList(map);
	}
	public OwnerDTO select(Map map) {
		return dao.select(map);
	}
	public int count() {
		return dao.count();
	}
}
