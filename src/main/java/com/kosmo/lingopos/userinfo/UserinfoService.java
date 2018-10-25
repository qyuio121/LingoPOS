package com.kosmo.lingopos.userinfo;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class UserinfoService {
	@Resource(name="userinfoDAO")
	private UserinfoDAO dao;
	
	public List<UserinfoDTO> selectUserlist(Map map) {
		return dao.selectUserlist(map);
	}
	public List<UserinfoDTO> selectAdminlist(Map map) {
		return dao.selectAdminlist(map);
	}
	public List<UserinfoDTO> selectOwnerlist(Map map) {
		return dao.selectOwnerlist(map);
	}
	public int getTotalUserRecord(Map map) {
		return dao.getTotalUserRecord(map);
	}
	public int getTotalAdminRecord(Map map) {
		return dao.getTotalAdminRecord(map);
	}
	public int getTotalOwnerRecord(Map map) {
		return dao.getTotalOwnerRecord(map);
	}
}
