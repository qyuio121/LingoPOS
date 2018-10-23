package com.kosmo.lingopos.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class ReviewService {
	@Resource(name="reviewDAO")
	private  ReviewDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public List<ReviewDTO> select(Map map) {
		return dao.select(map);
	}
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}
}
