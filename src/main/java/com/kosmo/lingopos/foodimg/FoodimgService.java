package com.kosmo.lingopos.foodimg;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class FoodimgService {
	@Resource(name="foodimgDAO")
	private FoodimgDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public List<FoodimgDTO> select(Map map) {
		return dao.select(map);
	}
}
