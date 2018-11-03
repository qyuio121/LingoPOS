package com.kosmo.lingopos.usedtable;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class UsedtableService {
	@Resource(name="usedtableDAO")
	private UsedtableDAO dao;

	public List<UsedtableDTO> select(Map map) {
		return dao.select(map);
	}
	public List<Map> selectValidate(Map map) {
		return dao.selectValidate(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
}
