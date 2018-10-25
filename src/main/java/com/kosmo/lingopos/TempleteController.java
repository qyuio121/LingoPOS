package com.kosmo.lingopos;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.lingopos.map.MapDTO;
import com.kosmo.lingopos.map.MapService;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@SessionAttributes("loginDTO")
public class TempleteController {
	
	@Resource(name="mapService")
	private MapService mapService;
	
	//백엔드 블랙리스트신청
	@RequestMapping("/Admin/blackList/blackApply.Admin")
	public String adminBlackApply() throws Exception{
		return "admin/blackList/blackApply.Admin";
	}


	//샵 블랙리스트신청
	@RequestMapping("/Shop/BlackList.Lingo")
	public String blackList() throws Exception{
		return "shop/blackList/blackList.tiles";
	}	
	
	//안드로이드 토탈 맵 
	@ResponseBody
	@RequestMapping(value="/Android/TotalMap.Lingo",produces="text/html; charset=UTF-8")
	public String getmap() throws Exception{
		List<MapDTO> list = mapService.select();
		List<Map> maplist= new Vector<Map>();
		for(MapDTO dto:list) {
			Map map = new HashMap();
			map.put("x",dto.getX());
			map.put("y",dto.getY());
			map.put("storename",dto.getStorename());
			maplist.add(map);
		}
		System.out.println(maplist);
		return JSONArray.toJSONString(maplist);
	}
}
