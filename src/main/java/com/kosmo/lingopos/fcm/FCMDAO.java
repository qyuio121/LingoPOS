package com.kosmo.lingopos.fcm;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("fcmDAO")
public class FCMDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		return template.insert("LingoFCMinsert",map);
	}
	public List<FCMDTO> select() {
		return template.selectList("LingoFCMselect");
	}
}
