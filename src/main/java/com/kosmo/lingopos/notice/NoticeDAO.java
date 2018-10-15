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
	public void updateCount(Map map) {
		 template.update("LingoNoticeCountUpdate",map);
	}
	public int delete(Map map) {
		return template.delete("LingoNoticeDelete",map);
	}
	public NoticeDTO selectOne(Map map) {
		return template.selectOne("LingoNoticeSelectOne",map);
	}
	public List<NoticeDTO> selectAll(Map map) {
		return template.selectList("LingoNoticeSelectAll",map);
	}
	public int getTotalRecord(Map map) {
		return template.selectOne("LingoNoticeGetTotalRecord",map);
	}
}
