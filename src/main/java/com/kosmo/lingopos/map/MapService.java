package com.kosmo.lingopos.map;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class MapService {
	@Resource(name="mapDAO")
	private MapDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int update(Map map) {
		return dao.update(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public List<MapDTO> select() {
		return dao.select();
	}
	public MapDTO selectbyStoreno(Map map) {
		return dao.selectbyStoreno(map);
	}
}
