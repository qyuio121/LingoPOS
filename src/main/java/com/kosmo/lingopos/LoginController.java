package com.kosmo.lingopos;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kosmo.lingopos.login.LoginDTO;
import com.kosmo.lingopos.login.LoginService;

@Controller
@SessionAttributes("loginDTO")
public class LoginController {

	@Resource(name="loginService")
	private LoginService loginService;

	@RequestMapping("/Login/Login.Lingo")
	public String login() throws Exception{
		return "login/login.tiles";
	}
	@RequestMapping("/Login/LoginProcess.Lingo")
	public String loginprocess(@RequestParam Map map, Model model) throws Exception{
		LoginDTO loginDTO = loginService.select(map);
		if(loginDTO!=null) {
			model.addAttribute("loginDTO",loginDTO);
			return "index.tiles";
		}else {
			model.addAttribute("notcorrect","아이디나 비밀번호가 틀렸습니다.");
			return "forward:/Login/Login.Lingo";
		}
	}
	@RequestMapping("/Login/Logout.Lingo")
	public String logout(SessionStatus status) throws Exception{
		status.setComplete();
		return "index.tiles";
	}
	
	//최창선 안드로이드 로그인 프로세스
	@ResponseBody
	@RequestMapping(value="/AndroidLogin/LoginProcess.Lingo",produces="text/plain; charset=UTF-8")
	public String androidLoginprocess(@RequestParam Map map, Model model) throws Exception{
		LoginDTO loginDTO = loginService.select(map);
		JSONObject json = new JSONObject();
		if(loginDTO!=null) {
			if(loginDTO.getOwnerno() != null) {
				json.put("isMember","seller");
				System.out.println("점주에 들어옴");
				return json.toJSONString();
			}
			else if(loginDTO.getAdminno() != null) {
				json.put("isMember","admin");
				System.out.println("관리자에 들어옴");
				return json.toJSONString();
			}
			else
				json.put("isMember","customer");
			System.out.println("고객에 들어옴");
				return json.toJSONString();
		}else {
			json.put("isMember","false");
			System.out.println("그냥 틀린거에 들어옴");
			return json.toJSONString();
		}
	}
}
