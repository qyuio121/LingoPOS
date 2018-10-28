package com.kosmo.lingopos;

import java.io.File;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.lingopos.admin.AdminService;
import com.kosmo.lingopos.blacklist.BlacklistDTO;
import com.kosmo.lingopos.blacklist.BlacklistService;
import com.kosmo.lingopos.comment.CommentService;
import com.kosmo.lingopos.foodimg.FoodimgDTO;
import com.kosmo.lingopos.foodimg.FoodimgService;
import com.kosmo.lingopos.free.FreeDTO;
import com.kosmo.lingopos.free.FreeService;
import com.kosmo.lingopos.login.LoginDTO;
import com.kosmo.lingopos.map.MapDTO;
import com.kosmo.lingopos.map.MapService;
import com.kosmo.lingopos.notice.NoticeDTO;
import com.kosmo.lingopos.notice.NoticeService;
import com.kosmo.lingopos.owner.OwnerDTO;
import com.kosmo.lingopos.owner.OwnerService;
import com.kosmo.lingopos.qna.QnaDTO;
import com.kosmo.lingopos.qna.QnaService;
import com.kosmo.lingopos.reply.ReplyDTO;
import com.kosmo.lingopos.reply.ReplyService;
import com.kosmo.lingopos.review.ReviewDTO;
import com.kosmo.lingopos.review.ReviewService;
import com.kosmo.lingopos.store.StoreDTO;
import com.kosmo.lingopos.store.StoreService;
import com.kosmo.lingopos.storeimg.StoreimgDTO;
import com.kosmo.lingopos.storeimg.StoreimgService;
import com.kosmo.lingopos.user.UserDTO;
import com.kosmo.lingopos.user.UserService;
import com.kosmo.lingopos.userinfo.UserinfoDTO;
import com.kosmo.lingopos.userinfo.UserinfoService;
import com.kosmo.lingopos.visitlist.VisitlistDTO;
import com.kosmo.lingopos.visitlist.VisitlistService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LingoController {
	
	private static final Logger logger = LoggerFactory.getLogger(LingoController.class);
	
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
	
	@Resource(name="commentService")
	private CommentService commentService;
	
	@Resource(name="ownerService")
	private OwnerService ownerService;
	
	@Resource(name="storeService")
	private StoreService storeService;
	
	@Resource(name="mapService")
	private MapService mapService;
	
	@Resource(name="storeimgService")
	private StoreimgService storeimgService;
	
	@Resource(name="foodimgService") 
	private FoodimgService foodimgService;
	
	@Resource(name="qnaService") 
	private QnaService qnaService;
	@Value("${qnaPageSize}")
	private int qnapageSize;
	@Value("${qnaBlockPage}")
	private int qnablockPage;

	@Resource(name="replyService") 
	private ReplyService replyService;
	
	@Resource(name="userService") 
	private UserService userService;
	
	@Resource(name="reviewService") 
	private ReviewService reviewService;
	@Value("${reviewPageSize}")
	private int reviewpageSize;
	@Value("${reviewBlockPage}")
	private int reviewblockPage;
	
	@Resource(name="userinfoService") 
	private UserinfoService userinfoService;
	@Value("${userinfoPageSize}")
	private int userinfopageSize;
	@Value("${userinfoBlockPage}")
	private int userinfoblockPage;
	
	@Resource(name="adminService") 
	private AdminService adminService;
	
	@Resource(name="blacklistService") 
	private BlacklistService blacklistService;
	@Value("${blackPageSize}")
	private int blackpageSize;
	@Value("${blackBlockPage}")
	private int blackblockPage;
	
	@Resource(name="visitlistService") 
	private VisitlistService visitlistService;
	@Value("${visitlistPageSize}")
	private int visitlistpageSize;
	@Value("${visitlistBlockPage}")
	private int visitlistblockPage;
	
	//DB연결시 한글 깨지는거 방지
	//창선 사진 등록 - 서머노트 Controller
	@ResponseBody
	@RequestMapping(value="/Image/Image.Lingo",method=RequestMethod.POST,produces="text/html; charset=UTF-8")
	public String summernoteUpload(MultipartHttpServletRequest mhsr) throws Exception{
		
		String phicalPath=mhsr.getServletContext().getRealPath("/Images/summernote");
		//1-1]MultipartHttpServletRequest객체의 getFile("파라미터명")메소드로
		//MultipartFile객체 얻기
		MultipartFile upload= mhsr.getFile("upload");
		//2]File객체 생성
		//2-1] 파일 중복시 이름 변경
		String newFilename=FileUpDownUtils.getNewFileName(phicalPath, upload.getOriginalFilename());
		File file = new File(phicalPath+File.separator+newFilename);
		if(!file.exists()) {
			file.mkdirs();
		}
		//3]업로드 처리		
		upload.transferTo(file);
		//4]서머노트에 다시 보내줄 데이타 저장
		String localIP = InetAddress.getLocalHost().getHostAddress();
		//5]DB 연결시 리퀘스트 영역에 새로운 파일명 저장 - 데이타베이스에 저장할 파일명
		mhsr.setAttribute("realImage", newFilename);
		mhsr.setAttribute("totalImage", upload.getOriginalFilename());
		//6]서머노트에 데이타 전달
		return "http://"+localIP+ ":"+mhsr.getLocalPort() +"/lingopos/Images/summernote/" + newFilename;
		//return "https://www.lingopos.co.kr/lingopos/Images/summernote/" + newFilename;
	}
	//창선 사진 삭제 - 서머노트 Controller
	@ResponseBody
	@RequestMapping(value="/Image/Image.Lingo",method=RequestMethod.GET,produces="text/html; charset=UTF-8")
	public void summernoteDelete(@RequestParam String removeFile,HttpServletRequest req) throws Exception{
		String phicalPath=req.getServletContext().getRealPath("/Images/summernote");
		File remove = new File(phicalPath+File.separator+removeFile);
		remove.delete();
	}
	
	
	//창선 사진 등록  - 가게 전경 Controller
			@ResponseBody
			@RequestMapping(value="/Shop/Store.Lingo",method=RequestMethod.POST)
			public String storeUpload(MultipartHttpServletRequest mhsr,HttpSession session) throws Exception{
				LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
				//1]서버의 물리적 경로 얻기
				String phicalPath=mhsr.getServletContext().getRealPath("/Images/")+dto.getId()+"/store";
				//1-1]MultipartHttpServletRequest객체의 getFile("파라미터명")메소드로
				//MultipartFile객체 얻기
				MultipartFile upload= mhsr.getFile("file");
				//2]File객체 생성
				//2-1]파일 중복시 이름 변경
				String newFilename=FileUpDownUtils.getNewFileName(phicalPath, upload.getOriginalFilename());
				File file = new File(phicalPath+File.separator+newFilename);
				//2-2]폴더 없을 시 폴더 생성
				if(!file.exists()) {
					file.mkdirs();
				}
				//3]업로드 처리		
				upload.transferTo(file);
				//4]DB에 저장할 서버에 저장된 파일명 
				
				
				
				newFilename =  URLEncoder.encode(newFilename, "utf-8");
				
				List<Map> list = new Vector<Map>();	
				Map record = new HashMap();
				
				
				//원래 전달값
				String realAddress = phicalPath+File.separator+newFilename;
				//로컬 호스트 전달값
				String localIP = InetAddress.getLocalHost().getHostAddress();
				String localAddress = "http://"+localIP+ ":"+mhsr.getServerPort() +"/lingopos/Images/"+dto.getId()+"/store/"+ newFilename;
				//String localAddress = "https://www.lingopos.co.kr/lingopos/Images/"+dto.getId()+"/store/"+ newFilename;
				
				record.put("realAddress",realAddress);
				record.put("localAddress",localAddress);
				
				list.add(record);
				
				return JSONArray.toJSONString(list);
			}
			//창선 사진 삭제  - 가게 전경 Controller
			@ResponseBody
			@RequestMapping(value="/Shop/Store.Lingo",method=RequestMethod.GET,produces="text/plain; charset=UTF-8")
			public String storeDelete(@RequestParam String removeFile) throws Exception{
				File remove = new File(removeFile);
				remove.delete();
				String removes=removeFile.substring(removeFile.lastIndexOf("\\")+1);
				removes = URLEncoder.encode(removes, "utf-8");
				return removes;
			}
			//창선 사진 등록 - 메뉴 사진 Controller
			@ResponseBody
			@RequestMapping(value="/Shop/Menu.Lingo",method=RequestMethod.POST)
			public String MenuUpload(MultipartHttpServletRequest mhsr,HttpSession session) throws Exception{
				LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
				//1]서버의 물리적 경로 얻기
				String phicalPath=mhsr.getServletContext().getRealPath("/Images/")+dto.getId()+"/menu";
				//1-1]MultipartHtWtpServletRequest객체의 getFile("파라미터명")메소드로
				//MultipartFile객체 얻기
				MultipartFile upload= mhsr.getFile("file");
				//2]File객체 생성
				//2-1] 파일 중복시 이름 변경
				String newFilename=FileUpDownUtils.getNewFileName(phicalPath, upload.getOriginalFilename());
				File file = new File(phicalPath+File.separator+newFilename);
				//2-2]폴더 없을 시 폴더 생성
				if(!file.exists()) {
					file.mkdirs();
				}
				//3]업로드 처리		
				upload.transferTo(file);
				//4]DB에 저장할 서버에 저장된 파일명 
				
				newFilename =  URLEncoder.encode(newFilename, "utf-8");
				List<Map> list = new Vector<Map>();	
				Map record = new HashMap();
				
				
				//원래 전달값
				String realAddress = phicalPath+File.separator+newFilename;
				//로컬 호스트 전달값
				String localIP = InetAddress.getLocalHost().getHostAddress();
				String localAddress = "http://"+localIP+ ":"+mhsr.getServerPort() +"/lingopos/Images/"+dto.getId()+"/menu/"+ newFilename;
				//String localAddress = "https://www.lingopos.co.kr/lingopos/Images/"+dto.getId()+"/menu/"+ newFilename;
				
				record.put("realAddress",realAddress);
				record.put("localAddress",localAddress);
				
				list.add(record);
				
				return JSONArray.toJSONString(list);
			}
			//창선 사진 삭제 - 메뉴 사진 Controller
			@ResponseBody
			@RequestMapping(value="/Shop/Menu.Lingo",method=RequestMethod.GET,produces="text/plain; charset=UTF-8")
			public String MenuDelete(@RequestParam String removeFile) throws Exception{
				File remove = new File(removeFile);
				remove.delete();
				String removes=removeFile.substring(removeFile.lastIndexOf("\\")+1);
				removes = URLEncoder.encode(removes, "utf-8");
				return removes;
				
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

	
	@RequestMapping("/Notice/Notice.Lingo")
	public String notice(HttpSession session,Model model,HttpServletRequest req,
			@RequestParam Map map, @RequestParam(required=false, defaultValue="1") int nowPage) throws Exception{
		
		int totalRecordCount = noticeService.getTotalRecord(map);
		
		int start = (nowPage-1)*noticepageSize+1;
		int end = nowPage*noticepageSize;
		String pageString = PagingUtil.pagingBootStrapStyle(totalRecordCount, noticepageSize, noticeblockPage, nowPage, req.getContextPath()+"/Notice/Notice.Lingo?");
		map.put("start", start);
		map.put("end", end);
		
		List<NoticeDTO> list = noticeService.selectAll(map);
		model.addAttribute("list", list);
		model.addAttribute("pageString", pageString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageSize", noticepageSize);
		model.addAttribute("nowPage", nowPage);
		
		//사용자 유형에 따른 페이지 이동 
		//관리자
		try {
		LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
		if (dto.getAdminno() != null)
			return "notice/notice.Admin";
		//고객
		else
			return "notice/notice.tiles";}
		catch(Exception e) {
			//로그인 안하고 바로 접근시
			return "notice/notice.tiles";
		}
	}
//창선 추가로 등록한 NOTICE 수정 조회 상세보기 삭제 시작
		@RequestMapping(value="/Notice/NoticeWrite.Lingo",method=RequestMethod.GET)
		public String noticeWrite(HttpSession session) throws Exception{
			//사용자 유형에 따른 페이지 이동 
			//관리자
			
			LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
			if (dto.getAdminno() != null)
				return "notice/noticeWrite.Admin";
			//고객
			else
				return "notice/noticeWrite.tiles";
	
		
		}
		@RequestMapping(value="/Notice/NoticeWrite.Lingo",method=RequestMethod.POST)
		public String noticeWriteOk(HttpSession session,@RequestParam Map map) throws Exception{
			noticeService.insert(map);
			
				return "forward:/Notice/Notice.Lingo";
			
		}
		@RequestMapping(value="/Notice/NoticeEdit.Lingo",method=RequestMethod.GET)
		public String noticeEdit(Model model,@RequestParam Map map) throws Exception{
			NoticeDTO dto = noticeService.selectOne(map);
			model.addAttribute("record", dto);
			return "notice/noticeEdit.Admin";
		}
		@RequestMapping(value="/Notice/NoticeEdit.Lingo",method=RequestMethod.POST)
		public String noticeEditOk(@RequestParam Map map) throws Exception{
			noticeService.update(map);
			return "forward:/Notice/NoticeView.Lingo?noticeno="+map.get("noticeno");
		}
		@RequestMapping("/Notice/NoticeDelete.Lingo")
		public String noticeDelete(@RequestParam Map map) throws Exception{
			noticeService.delete(map);
			return "forward:/Notice/Notice.Lingo";
		}
		@RequestMapping("/Notice/NoticeView.Lingo")
		public String noticeView(HttpSession session,Model model,@RequestParam Map map) throws Exception{
			noticeService.updateCount(map);
			NoticeDTO dto = noticeService.selectOne(map);
			model.addAttribute("record", dto);
			model.addAttribute("nowPage", map.get("nowPage"));
			
			//사용자 유형에 따른 페이지 이동 
			//관리자
			try {
			LoginDTO dto1=(LoginDTO)session.getAttribute("loginDTO");
			if (dto1.getAdminno() != null)
				return "notice/noticeView.Admin";
			//고객
			else
				return "notice/noticeView.tiles";}
			catch(Exception e) {
				//로그인 안하고 바로 접근시
				return "notice/noticeView.tiles";
			}
		
		}
//창선 추가로 등록한 NOTICE 수정 조회 상세보기 삭제 끝		
	@RequestMapping("/Free/Free.Lingo")
	public String free(HttpSession session,Model model,HttpServletRequest req,
			@RequestParam Map map, @RequestParam(required=false, defaultValue="1") int nowPage) throws Exception{

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
		
		//사용자 유형에 따른 페이지 이동 
				//관리자
				try {
				LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
				if (dto.getAdminno() != null)
					return "free/free.Admin";
				//고객
				else
					return "free/free.tiles";}
				catch(Exception e) {
					//로그인 안하고 바로 접근시
					return "free/free.tiles";
				}
		
		
	}
//창선 추가로 등록한 FREE 수정 조회 상세보기 삭제 시작
	@RequestMapping(value="/Free/FreeWrite.Lingo",method=RequestMethod.GET)
	public String freeWrite(HttpSession session) throws Exception{
		//사용자 유형에 따른 페이지 이동 
		//관리자
		
		LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
		if (dto.getAdminno() != null)
			return "free/freeWrite.Admin";
		//고객
		else
			return "free/freeWrite.tiles";
		
		}
		
	
	@RequestMapping(value="/Free/FreeWrite.Lingo",method=RequestMethod.POST)
	public String freeWriteOk(@RequestParam Map map) throws Exception{
		freeService.insert(map);
		return "forward:/Free/Free.Lingo";
	}
	@RequestMapping(value="/Free/FreeEdit.Lingo",method=RequestMethod.GET)
	public String freeEdit(HttpSession session,Model model,@RequestParam Map map) throws Exception{
		FreeDTO dto = freeService.selectOne(map);
		model.addAttribute("record", dto);
		
		
		//사용자 유형에 따른 페이지 이동 
				//관리자
				
				LoginDTO dto1=(LoginDTO)session.getAttribute("loginDTO");
				if (dto1.getAdminno() != null)
					return "free/freeEdit.Admin";
				//고객
				else
					return "free/freeEdit.tiles";
				
	}
		
	@RequestMapping(value="/Free/FreeEdit.Lingo",method=RequestMethod.POST)
	public String freeEditOk(@RequestParam Map map) throws Exception{
		freeService.update(map);
		return "forward:/Free/FreeView.Lingo?freeno="+map.get("freeno");
	}
	@RequestMapping("/Free/FreeView.Lingo")
	public String freeView(HttpSession session,Model model,@RequestParam Map map) throws Exception{
		freeService.updateCount(map);
		FreeDTO dto = freeService.selectOne(map);
		model.addAttribute("record", dto);
		model.addAttribute("nowPage", map.get("nowPage"));
		model.addAttribute("searchWord", map.get("searchWord"));
		model.addAttribute("searchColumn", map.get("searchColumn"));
		
		//사용자 유형에 따른 페이지 이동 
				//관리자
				try {
				LoginDTO dto1=(LoginDTO)session.getAttribute("loginDTO");
				if (dto1.getAdminno() != null)
					return "free/freeView.Admin";
				//고객
				else
					return "free/freeView.tiles";}
				catch(Exception e) {
					//로그인 안하고 바로 접근시
					return "free/freeView.tiles";
				}
	}
	@RequestMapping("/Free/FreeDelete.Lingo")
	public String freeDelete(@RequestParam Map map) throws Exception{
		commentService.deletebyno(map);
		freeService.delete(map);
		return "forward:/Free/Free.Lingo";
	}
//창선 추가로 등록한 FREE 수정 조회 상세보기 삭제 끝
	//comment
	@ResponseBody
	@RequestMapping(value="/Comment/CommentWrite.Lingo",produces="text/html; charset=UTF-8")
	public String commentWrite(@RequestParam Map map,HttpSession session) throws Exception{
		commentService.insert(map);
		return map.get("freeno").toString();
	}
	@ResponseBody
	@RequestMapping(value="/Comment/CommentDelete.Lingo",produces="text/html; charset=UTF-8")
	public String commentDelete(@RequestParam Map map) throws Exception{
		commentService.delete(map);
		return map.get("freeno").toString();
	}
	@ResponseBody
	@RequestMapping(value="/Comment/Comment.Lingo",produces="text/html; charset=UTF-8")
	public String comment(@RequestParam Map map) throws Exception{
		List<Map> list =commentService.selectList(map);
		//날짜를 string으로 변경
		for(Map commen: list) {
			commen.put("commentdate",commen.get("commentdate").toString().substring(0,10));
		}
		return JSONArray.toJSONString(list);
	}
	//comment end
	@RequestMapping("/Question/FAQ.Lingo")
	public String faq() throws Exception{
		return "question/FAQ.tiles";
	}
	@RequestMapping("/Question/QNA.Lingo")
	public String qna(HttpSession session,Model model,HttpServletRequest req,
			 @RequestParam(required=false, defaultValue="1") int nowPage) throws Exception{
		LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
		Map map = new HashMap();
		map.put("id", dto.getId());
		
		int totalRecordCount = qnaService.getTotalRecord(map);
		
		int start = (nowPage-1)*qnapageSize+1;
		int end = nowPage*qnapageSize;
		String pageString = PagingUtil.pagingBootStrapStyle(totalRecordCount, qnapageSize, qnablockPage, nowPage, req.getContextPath()+"/Question/QNA.Lingo?");
		map.put("start", start);
		map.put("end", end);
		List<QnaDTO> records = qnaService.selectUser(map);
		model.addAttribute("records",records);
		model.addAttribute("pageString", pageString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageSize", qnapageSize);
		model.addAttribute("nowPage", nowPage);
		
		return "question/QNA.tiles";
	}
//창선 추가로 등록한 QNA 수정 조회 상세보기 삭제 시작
	@RequestMapping(value="/Question/QNAEdit.Lingo",method=RequestMethod.GET)
	public String qnaEdit(@RequestParam Map map,Model model,HttpSession session) throws Exception{
		QnaDTO dto =  qnaService.select(map);
		model.addAttribute("record",dto);
		ReplyDTO reply = replyService.select(map);
		model.addAttribute("reply", reply);
		LoginDTO dto1=(LoginDTO)session.getAttribute("loginDTO");
		if (dto1.getAdminno() != null)
			return "question/QNAEdit.Admin";
		else
			return "question/QNAEdit.tiles";
	}
	@RequestMapping(value="/Question/QNAEdit.Lingo",method=RequestMethod.POST)
	public String qnaEditOk(@RequestParam Map map) throws Exception{
		qnaService.update(map);
		return "forward:/Question/QNAView.Lingo?qnano="+map.get("qnano");
	}
	@RequestMapping(value="/Question/QNAWrite.Lingo",method=RequestMethod.GET)
	public String qnaWrite() throws Exception{
		return "question/QNAWrite.tiles";
	}
	@RequestMapping(value="/Question/QNAWrite.Lingo",method=RequestMethod.POST)
	public String qnaWriteOk(HttpSession session,@RequestParam Map map) throws Exception{
		LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
		map.put("id", dto.getId());
		qnaService.insert(map);
		if (dto.getAdminno() != null)
			return "forward:/Admin/question/QNA.Admin";
		else
			return "forward:/Question/QNA.Lingo";
	}
	@RequestMapping("/Question/QNAView.Lingo")
	public String qnaView(@RequestParam Map map,Model model,HttpSession session) throws Exception{
		QnaDTO dto = qnaService.select(map);
		ReplyDTO reply = replyService.select(map);
		model.addAttribute("record", dto);
		model.addAttribute("reply", reply);
		model.addAttribute("nowPage", map.get("nowPage"));
		LoginDTO dto1=(LoginDTO)session.getAttribute("loginDTO");
		if (dto1.getAdminno() != null)
			return "question/QNAView.Admin";
		else
			return "question/QNAView.tiles";
	}
	@RequestMapping("/Question/QNADelete.Lingo")
	public String qnaDelete(@RequestParam Map map,HttpSession session) throws Exception{
		replyService.deleteByQNA(map);
		qnaService.delete(map);
		LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
		if (dto.getAdminno() != null)
			return "forward:/Admin/question/QNA.Admin";
		else
			return "forward:/Question/QNA.Lingo";
	}
	@RequestMapping("/Reply/ReplyWrite.Lingo")
	public String replyWrite(@RequestParam Map map) throws Exception{
		replyService.insert(map);
		return "forward:/Question/QNAView.Lingo?qnano="+map.get("qnano");
	}
	@RequestMapping("/Reply/ReplyDelete.Lingo")
	public String replyDelete(@RequestParam Map map) throws Exception{
		replyService.delete(map);
		return "forward:/Question/QNAView.Lingo?qnano="+map.get("qnano");
	}
	@ResponseBody
	@RequestMapping(value="/Review/Review.Lingo",produces="text/html; charset=UTF-8")
	public String review(HttpSession session,@RequestParam Map map,@RequestParam(required=false,defaultValue="1") int nowPage) throws Exception{
		  LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
		  String storeno = map.get("storeno").toString();
		  Map isMap = new HashMap();
		  isMap.put("storeno", storeno);
		  isMap.put("id", dto.getId());
		  int isvisit = visitlistService.isVisit(isMap);
		  int totalRecordCount= reviewService.getTotalRecord(map);		
		  int start = (nowPage-1)*reviewpageSize+1;
		  int end = nowPage*reviewpageSize;
		  map.put("start", start);
		  map.put("end", end);
		  List<ReviewDTO> reviews =  reviewService.select(map);
		  String pagingString=PagingUtil.pagingBootStrapStyleReview(totalRecordCount, reviewpageSize, reviewblockPage, nowPage);
		  StringBuffer reviewTable = new StringBuffer();
		  
		  reviewTable.append("<div style='float: right;'>");
		  if(isvisit > 0) {
			  reviewTable.append("<span>멋진 댓글을 작성해 주세요 </span> <input type='text' id='reviewText' style='width:300px'/> <button id='reviewWrite' class='btn btn-primary'>등록</button>");	
		  }
		  reviewTable.append("</div><div><br/></div><table class='table table-bordered'><tr style='font-weight:bold; background-color: #EAEDED'><th style='width: 50%; text-align: center'>한줄리뷰</th><th style='width: 10%; text-align: center'>글쓴이</th><th style='width: 20%; text-align: center'>작성일</th></tr>");
			if(reviews.size()==0){
				reviewTable.append("<tr style='text-align: center'><td colspan='4'>등록된 리뷰가 없어요</td></tr>");
			}
			for(ReviewDTO review:reviews){			
				reviewTable.append("<tr style='text-align: center'><td>"+review.getComment()+"</td>");
				reviewTable.append("<td>"+review.getId()+"</td>"); 
				reviewTable.append("<td>"+review.getPostdate()+"</td></tr>");
			}
			reviewTable.append("</table></div><div class='row'><div>"+pagingString+"</div></div>");		
		return reviewTable.toString();
	}
	@ResponseBody
	@RequestMapping("/Review/ReviewWrite.Lingo")
	public String reviewWrite(@RequestParam Map map,HttpSession session) throws Exception{
		LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
		map.put("id", dto.getId());
		return String.valueOf(reviewService.insert(map));
	}
	
	@ResponseBody
	@RequestMapping(value="/Admin/Member.Admin",produces="text/html; charset=UTF-8")
	public String member(@RequestParam Map map,@RequestParam(required=false,defaultValue="1") int nowPage,HttpSession session) throws Exception{
		  LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");  
		  int start = (nowPage-1)*userinfopageSize+1;
		  int end = nowPage*userinfopageSize;
		  map.put("start", start);
		  map.put("end", end);
		  
		  int totalRecordCount = 0;
		  List<UserinfoDTO> list = null;
		  
		  
		  switch(map.get("kind").toString()){
			  case "user": totalRecordCount= userinfoService.getTotalUserRecord(map);
			  			   list =  userinfoService.selectUserlist(map);
			  			   break;
			  case "owner": totalRecordCount= userinfoService.getTotalOwnerRecord(map);
 			   				list =  userinfoService.selectOwnerlist(map);
 			   				break;
			  case "admin": totalRecordCount= userinfoService.getTotalAdminRecord(map);
			  				list =  userinfoService.selectAdminlist(map);
			  				break;
		  }  
		  String pagingString=null;
		  if(map.get("searchColumn")!=null) {
			  pagingString=PagingUtil.pagingBootStrapStyleReviewSearch(totalRecordCount, userinfopageSize, userinfoblockPage, nowPage,map.get("searchColumn").toString(),map.get("searchWord").toString());
		  }else {
			  pagingString=PagingUtil.pagingBootStrapStyleReview(totalRecordCount, userinfopageSize, userinfoblockPage, nowPage);
		  }
		  StringBuffer userinfoTable = new StringBuffer();
		  
		  userinfoTable.append("<table class='table table-bordered'><thead><tr style='background-color:#D8D8D8'><th style='width:15%'><span class='glyphicon glyphicon-apple'></span> 아이디</th><th style='width:15%'><span class='glyphicon glyphicon-send'></span>  EMail");
		  if(map.get("kind").toString().equals("user")) {
			  userinfoTable.append("</th><th style='width:20%'><span class='glyphicon glyphicon-eye-open'></span> 전화번호</th>");	
		  }else if(map.get("kind").toString().equals("admin")) {
			  userinfoTable.append("</th><th style='width:20%'><span class='glyphicon glyphicon-eye-open'></span> 운영자별명</th>");	
		  }else {
			  userinfoTable.append("</th><th style='width:20%'><span class='glyphicon glyphicon-eye-open'></span> 사업자번호</th>");	
		  }
		  userinfoTable.append("<th style='width:20%'><span class='glyphicon glyphicon-home'></span> 지역");
		  userinfoTable.append("<th style='width:20%'><span class='glyphicon glyphicon-thumbs-up'></span> 유저권한 승격/강등여부");
		  if(map.get("kind").toString().equals("admin")) {
			  userinfoTable.append("<div class='btn-group'><form class='form-inline' action='#' style='height:10px;display:inline-block;'><div class='form-group btn-xs' ><button type='submit' id='setBtn' class='btn btn-default btn-xs'>강등</button></div></form></div>");	
		  }else if(map.get("kind").toString().equals("user")) {
			  userinfoTable.append("<div class='btn-group'><form class='form-inline' action='#' style='height:10px;display:inline-block;'><div class='form-group btn-xs' ><input type='text' class='form-control' id='adminnick' name='adminnick' style='height:20px;width:100px;margin-top:0px' placeholder='nickname'><button type='submit' id='setBtn' class='btn btn-default btn-xs'>승격</button></div></form></div>");	
		  }
		  userinfoTable.append("</th></tr></thead><tbody id='tableBody'>");
		  
			if(list.size()==0){
				userinfoTable.append("<tr style='text-align: center'><td colspan='5'>등록된 사람이 없어요</td></tr>");
			}
			for(UserinfoDTO record:list){
				 if(map.get("kind").toString().equals("owner")) {
					 userinfoTable.append("<tr><td>&nbsp&nbsp&nbsp"+record.getId()+"</td>");
				 }else if(map.get("kind").toString().equals("admin")) {
					 if(record.getAdminno()==Integer.parseInt(dto.getAdminno())) {
						 userinfoTable.append("<tr><td>&nbsp&nbsp&nbsp&nbsp&nbsp"+record.getId()+"</td>");	
					 }else {
						 userinfoTable.append("<tr><td><input type='radio' name='id' value='"+record.getId()+"'>&nbsp&nbsp&nbsp"+record.getId()+"</td>");
					 } 
				 }else {
					 userinfoTable.append("<tr><td><input type='radio' name='id' value='"+record.getId()+"'>&nbsp&nbsp&nbsp"+record.getId()+"</td>");
				 }	
				 userinfoTable.append("<td>"+record.getEmail()+"</td>"); 
				 if(map.get("kind").toString().equals("user")) {
					  userinfoTable.append("<td>"+record.getTel()+"</td>");	
				 }else if(map.get("kind").toString().equals("admin")) {
					  userinfoTable.append("<td>"+record.getAdminnick()+"</td>");	
				 }else {
					  userinfoTable.append("<td>"+record.getOwnerno()+"</td>");	
				 }
				 userinfoTable.append("<td>"+record.getRegion()+"</td>");
				 if(map.get("kind").toString().equals("owner")) {
					 userinfoTable.append("<td>불가능</td></tr>");	
				 }else {
					 if(map.get("kind").toString().equals("admin")&&(record.getAdminno()==Integer.parseInt(dto.getAdminno()))) {
						 userinfoTable.append("<td>불가능</td></tr>");	
					 }else {
						 userinfoTable.append("<td>가능</td></tr>");
					 }
				 }
			}
		  userinfoTable.append("</tbody></table><div class='row'><div>"+pagingString+"</div></div>");		
		return userinfoTable.toString();
	}
	@ResponseBody
	@RequestMapping("/Admin/AddAdmin.Admin")
	public String addAdmin(@RequestParam Map map) throws Exception{
		return String.valueOf(adminService.insert(map));
	}
	@ResponseBody
	@RequestMapping("/Admin/RemoveAdmin.Admin")
	public String removeAdmin(@RequestParam Map map) throws Exception{
		return String.valueOf(adminService.delete(map));
	}
	//창선 추가로 등록한 QNA 수정 조회 상세보기 삭제  끝
	//창선 DB연결 전 연결용 파일객체 넘기는거 알고 있음 시작
	@RequestMapping("/Reservation/Detail.Lingo")
	public String detail(HttpSession session,Model model,HttpServletRequest req,//페이징용 메소드에 전달
			  						@RequestParam(required=false,defaultValue="1") int nowPage,//페이징용 nowPage파라미터 받기용
			  						@RequestParam Map map) throws Exception{
			 LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
			  String storeno = map.get("storeno").toString();
			  Map isMap = new HashMap();
			  isMap.put("storeno", storeno);
			  isMap.put("id", dto.getId());
			  int isBlack = blacklistService.isBlack(isMap);
			  if(isBlack > 0) {
				  model.addAttribute("isBlack",true);
			  }
			  StoreDTO store = storeService.select(map);
			  List<FoodimgDTO> foodimg = foodimgService.select(map); 
			  List<StoreimgDTO> storeimg = storeimgService.select(map);
			   
			  int totalRecordCount= reviewService.getTotalRecord(map);		
			  int start = (nowPage-1)*reviewpageSize+1;
			  int end = nowPage*reviewpageSize;
			  map.put("start", start);
			  map.put("end", end);
			  List<ReviewDTO> review =  reviewService.select(map);
			  String pagingString=PagingUtil.pagingBootStrapStyleReview(totalRecordCount, reviewpageSize, reviewblockPage, nowPage);
			  
			  model.addAttribute("pagingString", pagingString);
			  model.addAttribute("store",store);
			  model.addAttribute("foodimgs",foodimg);
			  model.addAttribute("storeimgs",storeimg);
			  model.addAttribute("reviews",review);
			 
			return "reservation/detail/detail.tiles";
		}
	 //창선 DB연결 전 연결용 파일객체 넘기는거 알고 있음 끝
	@RequestMapping("/Reservation/Reservation.Lingo")
	public String reservation() throws Exception{
		return "reservation/reservation.tiles";
	}
	@RequestMapping(value="/Login/Update/Update.Lingo",method=RequestMethod.GET)
	public String update(@RequestParam Map map,Model model) throws Exception{
		UserDTO dto = userService.select(map);
		model.addAttribute("record",dto); 
		return "login/update/update.tiles";
	}
	@RequestMapping(value="/Login/Update/Update.Lingo",method=RequestMethod.POST)
	public String updateOk(@RequestParam Map map) throws Exception{
		if(!map.get("newpwd").toString().trim().equals("")) {
			map.put("pwd", map.get("newpwd"));
		}
		userService.update(map);
		return "forward:/";
	}
	@RequestMapping("/Login/Signup/Terms.Lingo")
	public String terms() throws Exception{
		return "login/signup/terms.tiles";
	}
	
	@ResponseBody
	@RequestMapping("/Login/Signup/Duplicate.Lingo")
	public String duplicate(@RequestParam Map map) throws Exception{
		UserDTO dto =userService.select(map);
		if(dto ==null) {
			return "0";
		}else {
			return "1";
		}
	
	}
	@ResponseBody
	@RequestMapping("/Login/Update/Valicate.Lingo")
	public String valicate(@RequestParam Map map) throws Exception{
		UserDTO dto =userService.select(map);
		if(dto.getPwd().equals(map.get("pwd"))) {
			return "0";
		}else {
			return "1";
		}
	
	}
	@RequestMapping(value="/Login/Signup/Signup.Lingo",method=RequestMethod.GET)
	public String signup(@RequestParam Map map,Model model) throws Exception{
		model.addAttribute("kind",map.get("kind"));
		return "login/signup/signup.tiles";
	}
	@RequestMapping(value="/Login/Signup/Signup.Lingo",method=RequestMethod.POST)
	public String signupOk(@RequestParam Map map,Model model) throws Exception{
		userService.insert(map);
		if(map.get("ownerno")!=null) {
			ownerService.insert(map);
		}
		return "forward:/";
	}
	
	@RequestMapping(value="/Shop/Apply.Lingo",method=RequestMethod.GET)
	public String apply(HttpSession session,Model model) throws Exception{
		LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
		Map map = new HashMap();
		map.put("ownerno", dto.getOwnerno());
		OwnerDTO owner = ownerService.select(map);
		model.addAttribute("storename",owner.getStorename());
		return "shop/apply/apply.tiles";
	}
	@RequestMapping(value="/Shop/Apply.Lingo",method=RequestMethod.POST)
	public String applyOk(@RequestParam Map map,HttpSession session) throws Exception{
		LoginDTO logindto=(LoginDTO)session.getAttribute("loginDTO");
		map.put("id", logindto.getId());
		map.put("ownerno", logindto.getOwnerno());
		map.put("atable",map.get("tablenum"));
		map.put("address",map.get("addr1")+" "+map.get("addr2")+" "+map.get("addr3"));
		storeService.insert(map);
		int storeno= storeService.selectbyID(map);
		logindto.setStoreno(String.valueOf(storeno));
		session.setAttribute("loginDTO", logindto);
		map.put("storeno", storeno);
		String[] storeimg = map.get("hiddenStore").toString().split(",");
		map.put("img", storeimg[0]);
		mapService.insert(map);
		for(String path:storeimg) {
			map.put("img", path);
			storeimgService.insert(map);
		}
		String[] menuimg = map.get("hiddenMenu").toString().split(",");
		for(String path:menuimg) {
			map.put("img", path);
			String filename = path.substring(path.lastIndexOf('/')+1,path.lastIndexOf('.'));
			String[] food = filename.split("_");
			map.put("name", food[0]);
			map.put("price", food[1]);
			foodimgService.insert(map);
		}
		return "forward:/";
	}
	@RequestMapping("/Shop/Edit.Lingo")
	public String edit() throws Exception{
		return "shop/edit/edit.tiles";
	}
	@RequestMapping("/Shop/SalesCal.Lingo")
	public String cal() throws Exception{
		return "shop/sales/salescal.tiles";
	}
	@ResponseBody
	@RequestMapping(value="/Map/Map.Lingo",produces="text/html; charset=UTF-8")
	public String getmap() throws Exception{
		List<MapDTO> list = mapService.select();
		List<Map> maplist= new Vector<Map>();
		for(MapDTO dto:list) {
			Map map = new HashMap();
			map.put("x",dto.getX());
			map.put("y",dto.getY());
			map.put("img",dto.getImg());
			map.put("storeno",dto.getStoreno());
			map.put("storename",dto.getStorename());
			map.put("tel",dto.getTel());
			map.put("mapno",dto.getMapno());
			map.put("bigkind",dto.getBigkind());
			map.put("address",dto.getAddress());
			maplist.add(map);
		}	
		return JSONArray.toJSONString(maplist);
	}
	
	//백엔드 인덱스
		@RequestMapping("/Admin/Index/Index.Admin")
		public String adminIndex() throws Exception{
			return "admin/index/index.Admin";
		}
		
		
		
		//백엔드 가게승인
		@RequestMapping("/Admin/shop/apply.Admin")
		public String adminApply() throws Exception{
			return "admin/shop/apply.Admin";
		}
		//백엔드 가게승인
		@RequestMapping("/Admin/shop/delete.Admin")
		public String adminDelete() throws Exception{
			return "admin/shop/delete.Admin";
		}
		//백엔드 회원관리시스템
		@RequestMapping("/Admin/member/member.Admin")
		public String adminMember() throws Exception{
			return "admin/member/member.Admin";
		}
		
		//백엔드 1:1문의 응답 
		@RequestMapping("/Admin/question/QNA.Admin")
		public String adminQNA(HttpSession session, Model model,HttpServletRequest req,
				 @RequestParam(required=false, defaultValue="1") int nowPage) throws Exception{
			LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
			Map map = new HashMap();
			
			int totalRecordCount = qnaService.getTotalRecordAdmin();
			int start = (nowPage-1)*qnapageSize+1;
			int end = nowPage*qnapageSize;
			String pageString = PagingUtil.pagingBootStrapStyle(totalRecordCount, qnapageSize, qnablockPage, nowPage, req.getContextPath()+"/Question/QNA.Lingo?");
			map.put("start", start);
			map.put("end", end);
			List<QnaDTO> records = qnaService.selectAdmin(map);
			model.addAttribute("records",records);
			model.addAttribute("pageString", pageString);
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("pageSize", qnapageSize);
			model.addAttribute("nowPage", nowPage);
			
			return "admin/question/QNA.Admin";
		}
		
		//샵 블랙리스트신청
		@RequestMapping("/Shop/BlackList.Lingo")
		public String blackList(HttpSession session,Model model,HttpServletRequest req,
				@RequestParam Map map, @RequestParam(required=false, defaultValue="1") int nowPage) throws Exception{
				
				LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
				map.put("storeno", dto.getStoreno());
			
				int totalRecordCount = visitlistService.getTotalRecord(map);
				
				int start = (nowPage-1)*visitlistpageSize+1;
				int end = nowPage*visitlistpageSize;
				
				String pageString=null;
				if(map.get("searchWord")!=null) {
					pageString = PagingUtil.pagingBootStrapStyleSearch(totalRecordCount, visitlistpageSize, visitlistblockPage, nowPage, req.getContextPath()+"/Shop/BlackList.Lingo?","id",map.get("searchWord").toString());
				}else {
					pageString = PagingUtil.pagingBootStrapStyle(totalRecordCount, visitlistpageSize, visitlistblockPage, nowPage, req.getContextPath()+"/Shop/BlackList.Lingo?");
				}
				map.put("start", start);
				map.put("end", end);
				
				List<VisitlistDTO> list = visitlistService.select(map);
				List<BlacklistDTO> blacklist = blacklistService.select(map);
				model.addAttribute("list", list);
				model.addAttribute("blacklist", blacklist);
				model.addAttribute("pageString", pageString);
				model.addAttribute("totalRecordCount", totalRecordCount);
				model.addAttribute("nowPage", nowPage);
				
			return "shop/blackList/blackList.tiles";
		}
		@ResponseBody
		@RequestMapping("/Shop/BlackRemove.Lingo")
		public String blackListDelete(HttpSession session,@RequestParam Map map) throws Exception{
			LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
			map.put("storeno", dto.getStoreno());
			return String.valueOf(blacklistService.delete(map));
		}	
		@RequestMapping("/Shop/BlackAdd.Lingo")
		public String blackListAdd(HttpSession session,@RequestParam Map map) throws Exception{
			LoginDTO dto=(LoginDTO)session.getAttribute("loginDTO");
			map.put("storeno", dto.getStoreno());
			blacklistService.insert(map);
			return "forward:/Shop/BlackList.Lingo";
		}
		//백엔드 블랙리스트신청
		@RequestMapping("/Admin/blackList/blackApply.Admin")
		public String adminBlackApply(HttpSession session,Model model,HttpServletRequest req,
				@RequestParam Map map, @RequestParam(required=false, defaultValue="1") int nowPage) throws Exception{

			int totalRecordCount = blacklistService.getTotalRecordApply();
			
			int start = (nowPage-1)*blackpageSize+1;
			int end = nowPage*blackpageSize;
			String pageString = PagingUtil.pagingBootStrapStyle(totalRecordCount, blackpageSize, blackblockPage, nowPage, req.getContextPath()+"/Admin/blackList/blackApply.Admin?");
			map.put("start", start);
			map.put("end", end);
			
			List<BlacklistDTO> list = blacklistService.selectAdminApply(map);
			model.addAttribute("list", list);
			model.addAttribute("pageString", pageString);
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("nowPage", nowPage);
			
			return "admin/blackList/blackApply.Admin";
		}
		
		//백엔드 블랙리스트
		@RequestMapping("/Admin/blackList/blackList.Admin")
		 	public String adminBlackList(HttpSession session,Model model,HttpServletRequest req,
					@RequestParam Map map, @RequestParam(required=false, defaultValue="1") int nowPage) throws Exception{
				int totalRecordCount = blacklistService.getTotalRecordList(map);
				
				int start = (nowPage-1)*blackpageSize+1;
				int end = nowPage*blackpageSize;
				
				String pageString=null;
				if(map.get("searchColumn")!=null) {
					pageString = PagingUtil.pagingBootStrapStyleSearch(totalRecordCount, blackpageSize, blackblockPage, nowPage, req.getContextPath()+"/Admin/blackList/blackList.Admin?",map.get("searchColumn").toString(),map.get("searchWord").toString());
				}else {
					pageString = PagingUtil.pagingBootStrapStyle(totalRecordCount, blackpageSize, blackblockPage, nowPage, req.getContextPath()+"/Admin/blackList/blackList.Admin?");
				}
				map.put("start", start);
				map.put("end", end);
				
				List<BlacklistDTO> list = blacklistService.selectAdminList(map);
				model.addAttribute("list", list);
				model.addAttribute("pageString", pageString);
				model.addAttribute("totalRecordCount", totalRecordCount);
				model.addAttribute("nowPage", nowPage);
			
			return "admin/blackList/blackList.Admin";
		}
		@ResponseBody
		@RequestMapping("/Admin/blackList/blackApplyAdd.Admin")
		public String blackApplyAdd(@RequestBody String selectlist) throws Exception{
			JSONParser parser = new JSONParser();
			JSONArray array=(JSONArray)parser.parse(selectlist);
			for(Object record:array) {
				JSONObject json = (JSONObject)record;
				Map map = new HashMap();
				map.put("id", json.get("id").toString());
				map.put("storeno", json.get("storeno").toString());
				blacklistService.update(map);
			}
			return String.valueOf(array.size());
		}
		@ResponseBody
		@RequestMapping("/Admin/blackList/blackApplyRemove.Admin")
		public String blackApplyRemove(@RequestBody String selectlist) throws Exception{
			JSONParser parser = new JSONParser();
			JSONArray array=(JSONArray)parser.parse(selectlist);
			for(Object record:array) {
				JSONObject json = (JSONObject)record;
				Map map = new HashMap();
				map.put("id", json.get("id").toString());
				map.put("storeno", json.get("storeno").toString());
				blacklistService.delete(map);
			}
			return String.valueOf(array.size());
		}
		
		//백엔드 1:1문의 응답 
		@RequestMapping("/Admin/FCM/FCM.Admin")
		public String FCM() throws Exception{
			return "admin/FCM/FCM.Admin";
		}
		
		@ResponseBody
		@RequestMapping("/Admin/question/AlertQNA.Admin")
		public String alertQna(@RequestParam Map map) throws Exception{
			return String.valueOf(qnaService.getTotalRecordAdmin());
		}
		@ResponseBody
		@RequestMapping("/Admin/Blacklist/AlertBlack.Admin")
		public String alertBlack(@RequestParam Map map) throws Exception{
			return String.valueOf(blacklistService.getTotalRecordApply());
		}

}
