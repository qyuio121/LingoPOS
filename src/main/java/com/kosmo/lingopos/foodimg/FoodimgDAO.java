package com.kosmo.lingopos.foodimg;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("foodimgDAO")
public class FoodimgDAO {
	
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoFoodimgInsert",map);
	}
	public int delete(Map map) {
		return template.delete("LingoFoodimgDelete",map);
	}
	public List<FoodimgDTO> select(Map map) {
		return template.selectList("LingoFoodimgSelect",map);
	}
	
}
