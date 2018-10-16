package com.kosmo.lingopos.reply;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
@Service
public class ReplyService {
	@Resource(name="replyDAO")
	private ReplyDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public int deleteByQNA(Map map) {
		return dao.deleteByQNA(map);
	}
	public ReplyDTO select(Map map) {
		return dao.select(map);
	}
}
