package com.kosmo.lingopos.qna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class QnaService {
	@Resource(name="qnaDAO")
	private QnaDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public int update(Map map) {
		return dao.update(map);
	}
	public List<QnaDTO> selectAdmin() {
		return dao.selectAdmin();
	}
	public QnaDTO select(Map map) {
		return dao.select(map);
	}
	public List<QnaDTO> selectUser(Map map) {
		return dao.selectUser(map);
	}
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}

}
