package com.kosmo.lingopos.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("reviewDAO")
public class ReviewDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoReviewInsert",map);
	}
	public int delete(Map map) {
		return template.delete("LingoReviewDelete",map);
	}
	public List<ReviewDTO> select(Map map) {
		return template.selectList("LingoReviewSelect",map);
	}
}
