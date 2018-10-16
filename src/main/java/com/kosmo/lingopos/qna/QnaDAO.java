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
	public int update(Map map) {
		return template.update("LingoQnaUpdate",map);
	}
	public List<QnaDTO> selectAdmin() {
		return template.selectList("LingoQnaSelectAdmin");
	}
	public QnaDTO select(Map map) {
		return template.selectOne("LingoQnaSelectOne",map);
	}
	public List<QnaDTO> selectUser(Map map) {
		return template.selectList("LingoQnaSelectUser",map);
	}
	public int getTotalRecord(Map map) {
		return template.selectOne("LingoQnaGetTotalRecord",map);
	}

}
