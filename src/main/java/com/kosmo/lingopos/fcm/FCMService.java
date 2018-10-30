package com.kosmo.lingopos.fcm;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("fcmService")
public class FCMService {
	@Resource(name="fcmDAO")
	private FCMDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public List<FCMDTO> select() {
		return dao.select();
	}
}
