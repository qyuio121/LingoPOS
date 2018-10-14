package com.kosmo.lingopos.login;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("loginDAO")
public class LoginDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public LoginDTO select(Map map) {
		return template.selectOne("LingoLoginResult",map);
	}
}
