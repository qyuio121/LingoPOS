package com.kosmo.lingopos.login;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginService {
	@Resource(name="loginDAO")
	private LoginDAO dao;
	
	public LoginDTO select(Map map) {
		return dao.select(map);
	}
}
