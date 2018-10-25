package com.kosmo.lingopos.userinfo;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("userinfoDAO")
public class UserinfoDAO {
	@Resource(name="mybatisTemplate")
	private SqlSessionTemplate template;
	
	public List<UserinfoDTO> selectUserlist(Map map) {
		return template.selectList("LingoAdminSelectUserlist",map);
	}
	public List<UserinfoDTO> selectAdminlist(Map map) {
		return template.selectList("LingoAdminSelectAdminlist",map);
	}
	public List<UserinfoDTO> selectOwnerlist(Map map) {
		return template.selectList("LingoAdminSelectOwnerlist",map);
	}
	public int getTotalUserRecord(Map map) {
		return template.selectOne("LingoAdminGetTotalUserRecord",map);
	}
	public int getTotalAdminRecord(Map map) {
		return template.selectOne("LingoAdminGetTotalAdminRecord",map);
	}
	public int getTotalOwnerRecord(Map map) {
		return template.selectOne("LingoAdminGetTotalOwnerRecord",map);
	}
}
