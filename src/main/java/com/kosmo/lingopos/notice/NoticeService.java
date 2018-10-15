package com.kosmo.lingopos.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("noticeService")
public class NoticeService {
	@Resource(name="noticeDAO")
	private NoticeDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int update(Map map) {
		return dao.update(map);
	}
	public void updateCount(Map map) {
		dao.updateCount(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public NoticeDTO selectOne(Map map) {
		return dao.selectOne(map);
	}
	public List<NoticeDTO> selectAll(Map map) {
		return dao.selectAll(map);
	}
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}
}
