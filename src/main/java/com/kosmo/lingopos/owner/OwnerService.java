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
	public int delete(Map map) {
		return dao.delete(map);
	}
	public List<OwnerDTO> selectAdmin() {
		return dao.selectAdmin();
	}
	public OwnerDTO select(Map map) {
		return dao.select(map);
	}
}
