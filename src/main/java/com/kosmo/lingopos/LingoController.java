package com.kosmo.lingopos;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.apache.tiles.template.GetAsStringModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LingoController {
	
	private static final Logger logger = LoggerFactory.getLogger(LingoController.class);
	
	//DB연결시 한글 깨지는거 방지
	//창선 사진 등록 삭제 - 가게 전경 Controller
	@ResponseBody
	@RequestMapping(value="/Shop/Store.Lingo",method=RequestMethod.POST)
	public String storeUpload(@RequestParam MultipartFile file) throws Exception{
		//1]서버의 물리적 경로 얻기
		String phiscalPath = "C:\\Users\\choi\\Desktop\\서버저장용 사진\\가게";
		//2]File객체 생성	
		//2-1] 파일 중복시 이름 변경
		String newFilename=FileUpDownUtils.getNewFileName(phiscalPath, file.getOriginalFilename());
		File saveFile = new File(phiscalPath+File.separator+newFilename);
		//3]업로드 처리
		file.transferTo(saveFile);
		return newFilename;
	}
	@ResponseBody
	@RequestMapping(value="/Shop/Store.Lingo",method=RequestMethod.GET)
	public void storeDelete(@RequestParam String removeFile) throws Exception{
		File remove = new File("C:\\Users\\choi\\Desktop\\서버저장용 사진\\가게"+File.separator+removeFile);
		remove.delete();
	}
	//창선 사진 등록 삭제 - 메뉴 사진 Controller
	@ResponseBody
	@RequestMapping(value="/Shop/Menu.Lingo",method=RequestMethod.POST)
	public String MenuUpload(@RequestParam MultipartFile file) throws Exception{
		//1]서버의 물리적 경로 얻기
		String phiscalPath = "C:\\Users\\choi\\Desktop\\서버저장용 사진\\메뉴";
		//2]File객체 생성	
		//2-1] 파일 중복시 이름 변경
		String newFilename=FileUpDownUtils.getNewFileName(phiscalPath, file.getOriginalFilename());
		File saveFile = new File(phiscalPath+File.separator+newFilename);
		//3]업로드 처리
		file.transferTo(saveFile);
		return newFilename;
	}
	@ResponseBody
	@RequestMapping(value="/Shop/Menu.Lingo",method=RequestMethod.GET)
	public void MenuDelete(@RequestParam String removeFile) throws Exception{
		File remove = new File("C:\\Users\\choi\\Desktop\\서버저장용 사진\\메뉴"+File.separator+removeFile);
		remove.delete();
	}
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/")
	public String index() throws Exception{
		return "index.tiles";
	}
	@RequestMapping("/Shop/Sales.Lingo")
	public String sales() throws Exception{
		return "shop/sales/sales.tiles";
	}
	@RequestMapping("/Reservation/Search.Lingo")
	public String search() throws Exception{
		return "reservation/search.tiles";
	}
	@RequestMapping("/Login/Login.Lingo")
	public String login() throws Exception{
		return "login/login.tiles";
	}
	@RequestMapping("/Login/Signup/Signup.Lingo")
	public String signup() throws Exception{
		return "login/signup/signup.tiles";
	}
	@RequestMapping("/Notice/Notice.Lingo")
	public String notice() throws Exception{
		return "notice/notice.tiles";
	}
	@RequestMapping("/Free/Free.Lingo")
	public String free() throws Exception{
		return "free/free.tiles";
	}
	@RequestMapping("/Question/FAQ.Lingo")
	public String faq() throws Exception{
		return "question/FAQ.tiles";
	}
	@RequestMapping("/Question/QNA.Lingo")
	public String qna() throws Exception{
		return "question/QNA.tiles";
	}
//창선 추가로 등록한 QNA 수정 조회 상세보기 삭제 시작
	@RequestMapping("/Question/QNAEdit.Lingo")
	public String qnaEdit() throws Exception{
		return "question/QNAEdit.tiles";
	}
	@RequestMapping("/Question/QNAList.Lingo")
	public String qnaList() throws Exception{
		return "question/QNAList.tiles";
	}
	@RequestMapping("/Question/QNAView.Lingo")
	public String qnaView() throws Exception{
		return "question/QNAView.tiles";
	}
	@RequestMapping("/Question/QNADelete.Lingo")
	public String qnaDelete() throws Exception{
		return "Lingo/Message";
	}
//창선 추가로 등록한 QNA 수정 조회 상세보기 삭제  끝
//창선 DB연결 전 연결용 파일객체 넘기는거 알고 있음 시작
 	@RequestMapping("/Reservation/Detail.Lingo")
	public String detail(@RequestParam Map map,Model model,@RequestParam String hiddenFile,@RequestParam String hiddenFile1) throws Exception{
		model.addAllAttributes(map);
		String [] hidden = hiddenFile.trim().split(" ");
		hidden[0] = hidden[0].substring(9, hidden[0].length());
		
		String [] hidden1 = hiddenFile1.trim().split(" ");
		hidden1[0] = hidden1[0].substring(9, hidden1[0].length());
		
		model.addAttribute("hidden",hidden);
		model.addAttribute("hidden1",hidden1);
		
		return "reservation/detail/detail.tiles";
	}
 //창선 DB연결 전 연결용 파일객체 넘기는거 알고 있음 끝
	@RequestMapping("/Reservation/Reservation.Lingo")
	public String reservation() throws Exception{
		return "reservation/reservation.tiles";
	}
	@RequestMapping("/Login/Update/Update.Lingo")
	public String update() throws Exception{
		return "login/update/update.tiles";
	}
	@RequestMapping("/Login/Signup/Terms.Lingo")
	public String terms() throws Exception{
		return "login/signup/terms.tiles";
	}
	@RequestMapping("/Shop/Apply.Lingo")
	public String apply() throws Exception{
		return "shop/apply/apply.tiles";
	}
	@RequestMapping("/Shop/Edit.Lingo")
	public String edit() throws Exception{
		return "shop/edit/edit.tiles";
	}
	@RequestMapping("/Shop/SalesCal.Lingo")
	public String cal() throws Exception{
		return "shop/sales/salescal.tiles";
	}
	
}
