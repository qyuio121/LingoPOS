package com.kosmo.lingopos;

import java.io.File;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.lingopos.comment.CommentService;
import com.kosmo.lingopos.foodimg.FoodimgDTO;
import com.kosmo.lingopos.foodimg.FoodimgService;
import com.kosmo.lingopos.free.FreeDTO;
import com.kosmo.lingopos.free.FreeService;
import com.kosmo.lingopos.login.LoginDTO;
import com.kosmo.lingopos.login.LoginService;
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
		return "https://"+localIP+ ":"+mhsr.getLocalPort() +"/lingopos/Images/summernote/" + newFilename;
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
				String localAddress = "https://"+localIP+ ":"+mhsr.getServerPort() +"/lingopos/Images/"+dto.getId()+"/store/"+ newFilename;
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
				String localAddress = "https://"+localIP+ ":"+mhsr.getServerPort() +"/lingopos/Images/"+dto.getId()+"/menu/"+ newFilename;
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
	
	//창선 추가로 등록한 QNA 수정 조회 상세보기 삭제  끝
	//창선 DB연결 전 연결용 파일객체 넘기는거 알고 있음 시작
	@RequestMapping("/Reservation/Detail.Lingo")
	public String detail(Model model,HttpServletRequest req,//페이징용 메소드에 전달
			  						@RequestParam(required=false,defaultValue="1") int nowPage,//페이징용 nowPage파라미터 받기용
			  						@RequestParam Map map) throws Exception{
	         
			  StoreDTO store = storeService.select(map);
			  List<FoodimgDTO> foodimg = foodimgService.select(map); 
			  List<StoreimgDTO> storeimg = storeimgService.select(map);
			  //
			  //MapDTO map = (등록한 서비스).LingoMapSelect(map);; //map은 storeno // 맵에 표시할 x/y 좌표 2개 
			  List<ReviewDTO> review =  reviewService.select(map); 
			  int totalRecordCount= reviewService.getTotalRecord(map);		

			 //String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, reviewpageSize, reviewblockPage, nowPage,req.getContextPath()+ "/reservation/detail/detail.Lingo?");
			  
			 // model.addAttribute("pagingString", pagingString);
			  
			  model.addAttribute("store",store);
			  model.addAttribute("foodimgs",foodimg);
			  model.addAttribute("storeimgs",storeimg);
			  //model.addAttribute("map",map);
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
		
		//백엔드 블랙리스트
		@RequestMapping("/Admin/blackList/blackList.Admin")
		public String adminBlackList() throws Exception{
			return "admin/blackList/blackList.Admin";
		}
		
		//백엔드 가게승인
		@RequestMapping("/Admin/apply/apply.Admin")
		public String adminApply() throws Exception{
			return "admin/apply/apply.Admin";
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

}
