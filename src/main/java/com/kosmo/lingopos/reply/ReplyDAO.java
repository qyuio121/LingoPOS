package com.kosmo.lingopos.reply;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("replyDAO")
public class ReplyDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoReplyInsert",map);
	}
	public int delete(Map map) {
		return template.delete("LingoReplyDelete",map);
	}
	public List<ReplyDTO> select(Map map) {
		return template.selectList("LingoReplySelectAdmin",map);
	}
}
