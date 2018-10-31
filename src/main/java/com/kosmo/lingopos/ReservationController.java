package com.kosmo.lingopos;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.lingopos.login.LoginDTO;
import com.kosmo.lingopos.login.LoginService;
import com.kosmo.lingopos.reservedtable.ReservedtableDTO;
import com.kosmo.lingopos.reservedtable.ReservedtableService;
import com.kosmo.lingopos.visitlist.VisitlistDTO;
import com.kosmo.lingopos.visitlist.VisitlistService;

@Controller
public class ReservationController {
	
	@Resource(name="reservedtableService")
	private ReservedtableService reservedtableService;
	@Resource(name="visitlistService")
	private VisitlistService visitlistService;
	@Value("${reservedtablePageSize}")
	private int reservedtablepageSize;
	@Value("${reservedtableBlockPage}")
	private int reservedtableblockPage;
	@Value("${visitlistPageSize}")
	private int visitlistpageSize;
	@Value("${visitlistBlockPage}")
	private int visitlistblockPage;
	
	//유저 예약관리
	@RequestMapping("/Reservation/ReservationList.Lingo")
	public String ReservationList(@RequestParam Map map,@RequestParam(required=false, defaultValue="1") int nowPage,
									Model model,HttpSession session,HttpServletRequest req) throws Exception {
		LoginDTO dto = (LoginDTO)session.getAttribute("loginDTO");
		Map visitMap = new HashMap();
		Map reservedMap = new HashMap(); 
		
		//getTotalRecord()사용을 위한 id 입력
		visitMap.put("id", dto.getId());
		visitMap.put("searchWord", map.get("searchWord"));
		reservedMap.put("id", dto.getId());
		//totalRecordCount사용하여 int값 얻기
		int visitTotalRecordCount = visitlistService.getTotalRecordbyUser(visitMap);
		int start = (nowPage-1)*visitlistpageSize+1;
		int end = nowPage*visitlistpageSize;
		visitMap.put("start", start);
		visitMap.put("end", end);
		
		int reservedTotalRecordCount = reservedtableService.getTotalRecordbyid(reservedMap);
		
		String reservedPageString = PagingUtil.pagingBootStrapStyle(reservedTotalRecordCount, reservedtablepageSize, reservedtableblockPage, nowPage, req.getContextPath()+"/Reservation/ReservationList.Lingo?");
		reservedMap.put("start", start);
		reservedMap.put("end", end);
		String visitPageString = null;
		if(map.get("searchWord") != null) {
			visitPageString  = PagingUtil.pagingBootStrapStyleSearch(visitTotalRecordCount, visitlistpageSize, visitlistblockPage, nowPage, req.getContextPath()+"/Reservation/ReservationList.Lingo?", map.get("searchColumn").toString(), map.get("searchWord").toString());
		}
		else {
			visitPageString = PagingUtil.pagingBootStrapStyle(visitTotalRecordCount, visitlistpageSize, visitlistblockPage, nowPage, req.getContextPath()+"/Reservation/ReservationList.Lingo?");
		}
		List<VisitlistDTO> visitList = visitlistService.selectbyuser(visitMap);
		System.out.println("asdfasdf");
		for(VisitlistDTO list:visitList) {
			System.out.println(list.getStorename());
			System.out.println(list.getId());
			
		}
		
		List<ReservedtableDTO> reservedList = reservedtableService.selectbyid(reservedMap);
		for(ReservedtableDTO list:reservedList) {
			System.out.println(list.getAddress());
			System.out.println(list.getId());
			System.out.println(list.getTel());
			System.out.println(list.getStartdate());
		}
		model.addAttribute("visitList",	visitList);
		model.addAttribute("visitPageString", visitPageString);
		model.addAttribute("visitTotalRecordCount", visitTotalRecordCount);
		model.addAttribute("visitPageSize", visitlistpageSize);
		model.addAttribute("reservedList",reservedList);
		model.addAttribute("reservedPageString",reservedPageString);
		model.addAttribute("nowPage", nowPage);
		return "reservation/reservationList.tiles";
		
	}
	
	//오너 예약목록 리스트
	@RequestMapping("/Reservation/reservationOwnerList.Lingo")
	public String ReservationOwnerList(	HttpSession session, HttpServletRequest req,
										@RequestParam(required=false, defaultValue="1") int nowPage, Model model)
										throws Exception{
		
		LoginDTO dto = (LoginDTO)session.getAttribute("loginDTO");
		Map map = new HashMap(); 
		
		//getTotalRecord()사용을 위한 storeno 입력
		map.put("storeno", dto.getStoreno());
		//totalRecordCount사용하여 int값 얻기
		int TotalRecordCount = reservedtableService.getTotalRecord(map);
		int start = (nowPage-1)*reservedtableblockPage+1;
		int end = nowPage*reservedtablepageSize;
		map.put("start", start);
		map.put("end", end);
		
		String PageString = PagingUtil.pagingBootStrapStyle(TotalRecordCount, reservedtablepageSize, reservedtableblockPage, nowPage, req.getContextPath()+"/Reservation/reservationOwnerList.Lingo?");
		List<ReservedtableDTO> list = reservedtableService.select(map);
		
		model.addAttribute("list",list);
		model.addAttribute("pageString",PageString);
		model.addAttribute("totalRecordCount", TotalRecordCount);
		model.addAttribute("pageSize",reservedtablepageSize);
		model.addAttribute("nowPage", nowPage);
		return "reservation/reservationOwnerList.tiles";
	}
	
	//관리자페이지 예약관리
	@RequestMapping("/Admin/reservation/reservationList.Admin")
	public String AdminReservationList(@RequestParam Map map, HttpSession session, HttpServletRequest req,
			@RequestParam(required=false, defaultValue="1") int nowPage, Model model)
			throws Exception{
		
		int totalRecordCount = reservedtableService.getTotalRecordadmin(map);
		int start = (nowPage-1)*reservedtableblockPage+1;
		int end = nowPage*reservedtablepageSize;
		map.put("start", start);
		map.put("end", end);
		
		String pageString = PagingUtil.pagingBootStrapStyle(totalRecordCount, reservedtablepageSize, reservedtableblockPage, nowPage, req.getContextPath()+"/Admin/reservation/reservationList.Admin?");
		List<ReservedtableDTO> list =reservedtableService.selectadmin(map);
		model.addAttribute("list", list);
		model.addAttribute("pageString",pageString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageSize",reservedtablepageSize);
		model.addAttribute("nowPage", nowPage);
		return "admin/reservation/adminReservationList.Admin";
	}
}
