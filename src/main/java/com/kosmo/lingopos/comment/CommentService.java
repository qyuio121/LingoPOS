package com.kosmo.lingopos.comment;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class CommentService {
	
	@Resource(name = "commentDAO")
	private CommentDAO commentDAO;
	
	public List<Map> selectList(Map map){
		return commentDAO.select(map);
	}
	public int insert(Map map) {
		return commentDAO.insert(map);
	}
	public int delete(Map map) {
		return commentDAO.delete(map);
	}
	public int deletebyno(Map map) {
		return commentDAO.deletebyno(map);
	}
}
