package com.kosmo.lingopos.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("noticeDAO")
public class NoticeDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoNoticeInsert",map);
	}
	public int update(Map map) {
		return template.update("LingoNoticeUpdate",map);
	}
	public int delete(Map map) {
		return template.delete("LingoNoticeDelete",map);
	}
	public List<NoticeDTO> selectOne(Map map) {
		return template.selectList("LingoNoticeSelectOne",map);
	}
	public List<NoticeDTO> selectAll() {
		return template.selectList("LingoNoticeSelectAll");
	}
}
