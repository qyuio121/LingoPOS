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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.lingopos.login.LoginDTO;
import com.kosmo.lingopos.login.LoginService;
import com.kosmo.lingopos.reservedtable.ReservedtableDTO;
import com.kosmo.lingopos.reservedtable.ReservedtableService;
import com.kosmo.lingopos.userinfo.UserinfoDTO;
import com.kosmo.lingopos.visitlist.VisitlistDTO;
import com.kosmo.lingopos.visitlist.VisitlistService;

@Controller
public class ReservationController {
	
	@Resource(name="reservedtableService")
	private ReservedtableService reservedtableService;
	@Value("${reservedtablePageSize}")
	private int reservedtablepageSize;
	@Value("${reservedtableBlockPage}")
	private int reservedtableblockPage;
	
	@Resource(name="visitlistService")
	private VisitlistService visitlistService;
	@Value("${visitlistPageSize}")
	private int visitlistpageSize;
	@Value("${visitlistBlockPage}")
	private int visitlistblockPage;
	
	//유저 예약관리
	@RequestMapping("/Reservation/ReservationList.Lingo")
	public String reservationList(@RequestParam Map map,@RequestParam(required=false, defaultValue="1") int nowPage,
									Model model,HttpSession session,HttpServletRequest req) throws Exception {
		LoginDTO dto = (LoginDTO)session.getAttribute("loginDTO");
		map.put("id", dto.getId());
		int visitTotalRecordCount = visitlistService.getTotalRecordbyUser(map);
		int start = (nowPage-1)*visitlistpageSize+1;
		int end = nowPage*visitlistpageSize;
		map.put("start", start);
		map.put("end", end);

		String visitPageString = null;
		if(map.get("searchColumn") != null) {
			visitPageString  = PagingUtil.pagingBootStrapStyleSearch(visitTotalRecordCount, visitlistpageSize, visitlistblockPage, nowPage, req.getContextPath()+"/Reservation/ReservationList.Lingo?", map.get("searchColumn").toString(), map.get("searchWord").toString());
		}
		else {
			visitPageString = PagingUtil.pagingBootStrapStyle(visitTotalRecordCount, visitlistpageSize, visitlistblockPage, nowPage, req.getContextPath()+"/Reservation/ReservationList.Lingo?");
		}
		List<VisitlistDTO> visitList = visitlistService.selectbyuser(map);

		int reservedTotalRecordCount = reservedtableService.getTotalRecordbyid(map);
		String reservedPageString = PagingUtil.pagingBootStrapStyle(reservedTotalRecordCount, reservedtablepageSize, reservedtableblockPage, nowPage, req.getContextPath()+"/Reservation/ReservationList.Lingo?");
		start = (nowPage-1)*reservedtablepageSize+1;
		end = nowPage*reservedtablepageSize;
		map.put("start", start);
		map.put("end", end);
		List<ReservedtableDTO> reservedList = reservedtableService.selectbyid(map);
		model.addAttribute("visitList",	visitList);
		model.addAttribute("visitPageString", visitPageString);
		model.addAttribute("reservedList",reservedList);
		model.addAttribute("reservedPageString",reservedPageString);
		model.addAttribute("nowPage", nowPage);
		return "reservation/reservationList.tiles";
		
	}
	@ResponseBody
	@RequestMapping(value="/Reservation/CurrentReservationList.Lingo",produces="text/html; charset=UTF-8")
	public String currentReservationList(@RequestParam Map map,@RequestParam(required=false,defaultValue="1") int nowPage,HttpSession session) throws Exception{
		  
		  LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");  
		  int start = (nowPage-1)*reservedtablepageSize+1;
		  int end = nowPage*reservedtablepageSize;
		  map.put("start", start);
		  map.put("end", end);
		  map.put("id", dto.getId());
		  
		  int totalRecordCount= reservedtableService.getTotalRecordbyid(map);
		  String pagingString=PagingUtil.pagingBootStrapStyleReview(totalRecordCount, reservedtablepageSize, reservedtableblockPage, nowPage);
		  List<ReservedtableDTO> reservedList = reservedtableService.selectbyid(map);
			
		  StringBuffer currentTable = new StringBuffer();
		  
		  currentTable.append("<table class='table table-bordered'><thead><tr style='text-align: center; font-weight: bold; background-color: #EAEDED'><th style='width:15%'><input type='checkbox' id='allCheck' />&nbsp&nbsp가게이름</th><th style='width:30%'>가게주소</th><th style='width:17%'>가게전화번호</th><th style='width:22%'>예약날짜</th><th>예약취소</th></tr></thead><tbody>");		
		  for(ReservedtableDTO record:reservedList) {
			  currentTable.append("<tr><td><input type='checkbox' name='check' />&nbsp&nbsp$ "+record.getStorename()
			  +"</td><td>"+record.getAddress()+"</td><td>"+record.getTel()+"</td><td>"
			  +record.getStartdate()+"</td><td><button name='cancelBtn' class='btn btn-danger btn-xs'>취소</button></td></tr>");
		  }
		  currentTable.append("</tbody></table>"+pagingString+"</div>");
		 
		 return currentTable.toString();
	}
	
}
