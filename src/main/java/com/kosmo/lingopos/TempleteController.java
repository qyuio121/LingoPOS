package com.kosmo.lingopos;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.lingopos.login.LoginDTO;
import com.kosmo.lingopos.map.MapDTO;
import com.kosmo.lingopos.map.MapService;
import com.kosmo.lingopos.notice.NoticeDTO;
import com.kosmo.lingopos.notice.NoticeService;

import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@SessionAttributes("loginDTO")
public class TempleteController {
	
	@Resource(name="mapService")
	private MapService mapService;
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@Value("${noticePageSize}")
	private int noticepageSize;
	@Value("${noticeBlockPage}")
	private int noticeblockPage;
	

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
			map.put("tel",dto.getTel());
			maplist.add(map);
		}
		System.out.println(maplist);
		return JSONArray.toJSONString(maplist);
	}
	
	@RequestMapping(value="/Android/Notice.Lingo",produces="text/html; charset=UTF-8")
	public String androidNotice(Model model,HttpServletRequest req,
			@RequestParam Map map, @RequestParam(required=false, defaultValue="1") int nowPage) throws Exception{
		
		int totalRecordCount = noticeService.getTotalRecord(map);
		
		int start = (nowPage-1)*noticepageSize+1;
		int end = nowPage*noticepageSize;
		String pageString = PagingUtil.pagingBootStrapStyle(totalRecordCount, noticepageSize, noticeblockPage, nowPage, req.getContextPath()+"/Android/Notice.Lingo?");
		map.put("start", start);
		map.put("end", end);
		
		List<NoticeDTO> list = noticeService.selectAll(map);
		model.addAttribute("list", list);
		model.addAttribute("pageString", pageString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageSize", noticepageSize);
		model.addAttribute("nowPage", nowPage);
		
		return "android/notice";
	}
	
	@RequestMapping("/Android/NoticeView.Lingo")
	public String androidNoticeView(Model model,@RequestParam Map map) throws Exception{
		noticeService.updateCount(map);
		NoticeDTO dto = noticeService.selectOne(map);
		model.addAttribute("record", dto);
		model.addAttribute("nowPage", map.get("nowPage"));
		
		return "android/noticeView";
	
	}
}
