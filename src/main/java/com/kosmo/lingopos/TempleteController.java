package com.kosmo.lingopos;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@SessionAttributes("loginDTO")
public class TempleteController {
	
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

}
