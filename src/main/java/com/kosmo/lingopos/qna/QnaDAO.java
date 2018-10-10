package com.kosmo.lingopos.qna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("qnaDAO")
public class QnaDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoQnaInsert",map);
	}
	public int delete(Map map) {
		return template.delete("LingoQnaDelete",map);
	}
	public List<QnaDTO> selectAdmin() {
		return template.selectList("LingoQnaSelectAdmin");
	}
	public List<QnaDTO> selectOne(Map map) {
		return template.selectList("LingoQnaSelectOne",map);
	}
	public List<QnaDTO> selectUser(Map map) {
		return template.selectList("LingoQnaSelectUser",map);
	}

}
