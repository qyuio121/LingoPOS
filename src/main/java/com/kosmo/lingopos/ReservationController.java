package com.kosmo.lingopos;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.tiles.request.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.lingopos.visitlist.VisitlistService;

@Controller
public class ReservationController {
	
	@Resource(name="visitlistService")
	private VisitlistService visitlistService;

	@RequestMapping("/Reservation/ReservationList.Lingo")
	public String Reservation(@RequestParam Map map, Model model) throws Exception {
		
		return "reservation/reservationList.tiles";
	}
}
