package com.kosmo.lingopos.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class UserService {
	@Resource(name="userDAO")
	private UserDAO dao;
	
	public int insert(Map map) {
		return dao.insert(map);
	}
	public int update(Map map) {
		return dao.update(map);
	}
	public int delete(Map map) {
		return dao.delete(map);
	}
	public List<UserDTO> selectAll() {
		return dao.selectAll();
	}
	public UserDTO select(Map map) {
		return dao.select(map);
	}
	public int count() {
		return dao.count();
	}
	public int countNew() {
		return dao.count();
	}
}
