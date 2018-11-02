package com.kosmo.lingopos;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.kosmo.lingopos.store.StoreService;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.lingopos.comment.CommentService;
import com.kosmo.lingopos.free.FreeDTO;
import com.kosmo.lingopos.free.FreeService;
import com.kosmo.lingopos.login.LoginDTO;
import com.kosmo.lingopos.login.LoginService;
import com.kosmo.lingopos.map.MapDTO;
import com.kosmo.lingopos.map.MapService;
import com.kosmo.lingopos.notice.NoticeDTO;
import com.kosmo.lingopos.notice.NoticeService;
import com.kosmo.lingopos.reservedtable.ReservedtableService;
import com.kosmo.lingopos.store.StoreDTO;

import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.kosmo.lingopos.reservedtable.ReservedtableDTO;

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
	
	@Resource(name="freeService")
	private FreeService freeService;
	@Value("${freePageSize}")
	private int freepageSize;
	@Value("${freeBlockPage}")
	private int freeblockPage;
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@Resource(name="commentService")
	private CommentService commentService;
	
	@Resource(name="reservedtableService")
	private ReservedtableService reservedtableService;
	
	@Resource(name="storeService")
	private StoreService storeService;
	
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
			map.put("storeno",dto.getStoreno());
			System.out.println(dto.getStoreno());
			maplist.add(map);
		}
		System.out.println(maplist);
		return JSONArray.toJSONString(maplist);
	}
	
	//안드로이드 공지게시판
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
	
	//안드로이드 공지게시판 상세보기
	@RequestMapping("/Android/NoticeView.Lingo")
	public String androidNoticeView(Model model,@RequestParam Map map) throws Exception{
		noticeService.updateCount(map);
		NoticeDTO dto = noticeService.selectOne(map);
		model.addAttribute("record", dto);
		model.addAttribute("nowPage", map.get("nowPage"));
		
		return "android/noticeView";
	}
	
	//안드로이드 자유게시판
	@RequestMapping(value="/Android/Free.Lingo",produces="text/html; charset=UTF-8")
	public String androidFree(Model model,HttpServletRequest req,
			@RequestParam Map map, @RequestParam(required=false, defaultValue="1") int nowPage) throws Exception{
		if(map.get("pwd") != null) {
			LoginDTO loginDTO = loginService.select(map);
			System.out.println(loginDTO);
			System.out.println(map.get("id"));
			System.out.println(map.get("pwd"));
			model.addAttribute("loginDTO",loginDTO);
		}
		int totalRecordCount = freeService.getTotalRecord(map);
		int start = (nowPage-1)*freepageSize+1;
		int end = nowPage*freepageSize;
		String pageString = null;
		if(map.get("searchColumn")!=null) {
			pageString = PagingUtil.pagingBootStrapStyleSearch(totalRecordCount, freepageSize, freeblockPage, nowPage, req.getContextPath()+"/Free/Free.Lingo?",map.get("searchColumn").toString(),map.get("searchWord").toString());
		}else {
			pageString = PagingUtil.pagingBootStrapStyle(totalRecordCount, freepageSize, freeblockPage, nowPage, req.getContextPath()+"/Free/Free.Lingo?");
		}
		
		map.put("start", start);
		map.put("end", end);
		List<FreeDTO> list = freeService.selectAll(map);
		model.addAttribute("list", list);
		model.addAttribute("pageString", pageString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageSize", noticepageSize);
		model.addAttribute("nowPage", nowPage);
		
		
		return "android/free";
		
	}
	
	//안드로이드 자유게시판 상세보기
	@RequestMapping("/Android/FreeView.Lingo")
	public String androidFreeView(Model model,@RequestParam Map map) throws Exception{
		freeService.updateCount(map);
		FreeDTO dto = freeService.selectOne(map);
		model.addAttribute("record", dto);
		model.addAttribute("nowPage", map.get("nowPage"));
		model.addAttribute("searchWord", map.get("searchWord"));
		model.addAttribute("searchColumn", map.get("searchColumn"));
		
			return "android/freeView";
	}
	
	//안드로이드 자유게시판 작성으로 이동
	@RequestMapping(value="/Android/FreeWrite.Lingo",method=RequestMethod.GET)
	public String androidFreeWrite() throws Exception{
		return "android/freeWrite";
	}
		
	//안드로이드 자유게시판 작성 후 저장 및  이동
	@RequestMapping(value="/Android/FreeWrite.Lingo",method=RequestMethod.POST)
	public String androidFreeWriteOk(@RequestParam Map map) throws Exception{
		freeService.insert(map);
		return "forward:/Android/Free.Lingo";
	}
	
	//안드로이드 자유게시판 삭제
	@RequestMapping("/Android/FreeDelete.Lingo")
	public String androidFreeDelete(@RequestParam Map map) throws Exception{
		commentService.deletebyno(map);
		freeService.delete(map);
		return "forward:/Android/Free.Lingo";
	}
	
	//안드로이드 자유게시판 수정으로 이동
	@RequestMapping(value="/Android/FreeEdit.Lingo",method=RequestMethod.GET)
	public String androidFreeEdit(Model model,@RequestParam Map map) throws Exception{
		FreeDTO dto = freeService.selectOne(map);
		model.addAttribute("record", dto);
		return "android/freeEdit";
				
	}
	
	//안드로이드 자유게시판 수정 후 저장 및 이동
	@RequestMapping(value="/Android/FreeEdit.Lingo",method=RequestMethod.POST)
	public String androidFreeEditOk(@RequestParam Map map) throws Exception{
		freeService.update(map);
		return "forward:/Android/FreeView.Lingo?freeno="+map.get("freeno");
	}
	
	//안드로이드 자유게시판 코멘트 작성
	@ResponseBody
	@RequestMapping(value="/Android/CommentWrite.Lingo",produces="text/html; charset=UTF-8")
	public String commentWrite(@RequestParam Map map,HttpSession session) throws Exception{
		commentService.insert(map);
		return map.get("freeno").toString();
	}
	
	//안드로이드 자유게시판 코멘트 삭제
	@ResponseBody
	@RequestMapping(value="/Android/CommentDelete.Lingo",produces="text/html; charset=UTF-8")
	public String commentDelete(@RequestParam Map map) throws Exception{
		commentService.delete(map);
		return map.get("freeno").toString();
	}
	
	//안드로이드 자유게시판 코멘트 실시간 
	@ResponseBody
	@RequestMapping(value="/Android/Comment.Lingo",produces="text/html; charset=UTF-8")
	public String comment(@RequestParam Map map) throws Exception{
		List<Map> list =commentService.selectList(map);
		//날짜를 string으로 변경
		for(Map commen: list) {
			commen.put("commentdate",commen.get("commentdate").toString().substring(0,10));
		}
		return JSONArray.toJSONString(list);
	}

	//안드로이드 예약확인
	@ResponseBody
	@RequestMapping(value="/Android/ReservationList.Lingo",produces="text/html; charset=UTF-8")
	public String androidReservationList(@RequestParam Map map) throws Exception {
		
		LoginDTO loginDTO = loginService.select(map);
		try {
			Map visitMap = new HashMap();
			Map reservedMap = new HashMap(); 
			visitMap.put("id", loginDTO.getId());
			reservedMap.put("id",loginDTO.getId());
			List<ReservedtableDTO> reservedList = reservedtableService.selectbyandroid(reservedMap);
			Map mapMap = new HashMap();
			mapMap.put("storeno", reservedList.get(reservedList.size()-1).getStoreno());
			MapDTO mapList = mapService.selectbyStoreno(mapMap);
			System.out.println("storename : "+reservedList.get(reservedList.size()-1).getStorename());
			System.out.println("address : "+reservedList.get(reservedList.size()-1).getAddress());
			System.out.println("tel : "+reservedList.get(reservedList.size()-1).getTel());
			System.out.println("startdate : "+reservedList.get(reservedList.size()-1).getStartdate());
			System.out.println("x : "+mapList.getX());
			System.out.println("y : "+mapList.getY());
			JSONObject json = new JSONObject();
			json.put("storename",reservedList.get(reservedList.size()-1).getStorename());
			json.put("address",reservedList.get(reservedList.size()-1).getAddress());
			json.put("tel",reservedList.get(reservedList.size()-1).getTel());
			json.put("startdate",reservedList.get(reservedList.size()-1).getStartdate().toString());
			json.put("x",mapList.getX());
			json.put("y",mapList.getY());
			System.out.println(json);
			return json.toJSONString();
		}
		catch (Exception e) {
			JSONObject json = new JSONObject();
			return json.toJSONString();
		}
	}
		
	//안드로이드 예약하기
	@RequestMapping(value="/Android/Reservation.Lingo",produces="text/html; charset=UTF-8")
	public String androidReservation(@RequestParam Map map,Model model) throws Exception{
		LoginDTO loginDTO = loginService.select(map);
		model.addAttribute("loginDTO",loginDTO);
		Map storeMap = new HashMap();
		storeMap.put("storeno", map.get("storeno"));
		StoreDTO store = storeService.select(storeMap);
		System.out.println(store);
		model.addAttribute("store",store);
		return "android/reservation";
	}
	
	@RequestMapping("/Android/ReserveOk.Lingo")
	public String androidReserveOk(HttpSession session,@RequestParam Map map,Model model) throws Exception{
		LoginDTO dto = (LoginDTO)session.getAttribute("loginDTO");
		map.put("id", dto.getId());
		map.put("tableno",Integer.parseInt(map.get("tableno").toString())+1);
		map.put("startdate",map.get("startdate").toString()+" "+map.get("starttime").toString()+":00");
		reservedtableService.insert(map);
		return "android/reservationOk";
	}
				
}
