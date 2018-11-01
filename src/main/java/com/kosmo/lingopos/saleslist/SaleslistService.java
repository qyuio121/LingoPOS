package com.kosmo.lingopos.saleslist;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class SaleslistService {
	@Resource(name="saleslistDAO")
	private SaleslistDAO dao;

	public List<SaleslistDTO> select(Map map) {
		return dao.select(map);
	}
	
}
