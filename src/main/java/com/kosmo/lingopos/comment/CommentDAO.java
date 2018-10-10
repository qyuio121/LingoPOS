package com.kosmo.lingopos.comment;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("commentDAO")
public class CommentDAO {
	
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoCommentInsert",map);
	}
	public int delete(Map map) {
		return template.delete("LingoCommentDelete",map);
	}
	public List<CommentDTO> select(Map map) {
		return template.selectList("LingoCommentSelect",map);
	}
	
}
