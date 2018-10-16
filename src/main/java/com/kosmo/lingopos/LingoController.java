package com.kosmo.lingopos;

import java.io.File;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.lingopos.comment.CommentService;
import com.kosmo.lingopos.foodimg.FoodimgService;
import com.kosmo.lingopos.free.FreeDTO;
import com.kosmo.lingopos.free.FreeService;
import com.kosmo.lingopos.login.LoginDTO;
import com.kosmo.lingopos.login.LoginService;
import com.kosmo.lingopos.map.MapService;
import com.kosmo.lingopos.notice.NoticeDTO;
import com.kosmo.lingopos.notice.NoticeService;
import com.kosmo.lingopos.owner.OwnerDTO;
import com.kosmo.lingopos.owner.OwnerService;
import com.kosmo.lingopos.store.StoreDTO;
import com.kosmo.lingopos.store.StoreService;
import com.kosmo.lingopos.storeimg.StoreimgService;

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

	//DB연결시 한글 깨지는거 방지
	//창선 사진 등록 - QNA 서머노트 Controller
	@ResponseBody
	@RequestMapping(value="/question/Image.Lingo",method=RequestMethod.POST)
	public String qnasummernoteUpload(MultipartHttpServletRequest mhsr) throws Exception{
		String phicalPath=mhsr.getServletContext().getRealPath("/Images/qna_summernote");
		//1-1]MultipartHttpServletRequest객체의 getFile("파라미터명")메소드로
		//MultipartFile객체 얻기
		MultipartFile upload= mhsr.getFile("upload");
		//2]File객체 생성
		//2-1] 파일 중복시 이름 변경
		String newFilename=FileUpDownUtils.getNewFileName(phicalPath, upload.getOriginalFilename());
		File file = new File(phicalPath+File.separator+newFilename);
		//3]업로드 처리		
		upload.transferTo(file);
		//4]서머노트에 다시 보내줄 데이타 저장
		String localIP = InetAddress.getLocalHost().getHostAddress();
		//5]DB 연결시 리퀘스트 영역에 새로운 파일명 저장 - 데이타베이스에 저장할 파일명
		mhsr.setAttribute("realImage", newFilename);
		mhsr.setAttribute("totalImage", upload.getOriginalFilename());
		//6]서머노트에 데이타 전달
		return "http://"+localIP+ ":"+mhsr.getServerPort() +"/lingopos/Images/qna_summernote/" + newFilename;
	}
	//창선 사진 삭제 - QNA 서머노트 Controller
	@ResponseBody
	@RequestMapping(value="/question/Image.Lingo",method=RequestMethod.GET)
	public void qnasummernoteDelete(@RequestParam String removeFile) throws Exception{
		File remove = new File("C:\\CCS\\WorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\LingoPOS\\Images\\qna_summernote"+File.separator+removeFile);
		remove.delete();
	}
	
	//창선 사진 등록 - FREE 서머노트 Controller
	@ResponseBody
	@RequestMapping(value="/free/Image.Lingo",method=RequestMethod.POST)
	public String summernoteUpload(MultipartHttpServletRequest mhsr) throws Exception{
		//1]서버의 물리적 경로 얻기
		String phicalPath=mhsr.getServletContext().getRealPath("/Images/free_summernote");
		//1-1]MultipartHttpServletRequest객체의 getFile("파라미터명")메소드로
		//MultipartFile객체 얻기
		MultipartFile upload= mhsr.getFile("upload");
		//2]File객체 생성
		//2-1] 파일 중복시 이름 변경
		String newFilename=FileUpDownUtils.getNewFileName(phicalPath, upload.getOriginalFilename());
		File file = new File(phicalPath+File.separator+newFilename);
		//3]업로드 처리		
		upload.transferTo(file);
		//4]서머노트에 다시 보내줄 데이타 저장
		String localIP = InetAddress.getLocalHost().getHostAddress();
		//5]DB 연결시 리퀘스트 영역에 새로운 파일명 저장 - 데이타베이스에 저장할 파일명
		mhsr.setAttribute("realImage", newFilename);
		mhsr.setAttribute("totalImage", upload.getOriginalFilename());
		//6]서머노트에 데이타 전달
		return "http://"+localIP+ ":"+mhsr.getServerPort() +"/lingopos/Images/free_summernote/" + newFilename;
	}
	//창선 사진 삭제 - FREE 서머노트 Controller
	@ResponseBody
	@RequestMapping(value="/free/Image.Lingo",method=RequestMethod.GET)
	public void summernoteDelete(@RequestParam String removeFile) throws Exception{
		File remove = new File("C:\\CCS\\WorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\LingoPOS\\Images\\free_summernote"+File.separator+removeFile);
		remove.delete();
	}
	
	//창선 사진 등록 - NOTICE 서머노트 Controller
	@ResponseBody
	@RequestMapping(value="/notice/Image.Lingo",method=RequestMethod.POST)
	public String noticesummernoteUpload(MultipartHttpServletRequest mhsr) throws Exception{
		//1]서버의 물리적 경로 얻기
		String phicalPath=mhsr.getServletContext().getRealPath("/Images/notice_summernote");
		//1-1]MultipartHttpServletRequest객체의 getFile("파라미터명")메소드로
		//MultipartFile객체 얻기
		MultipartFile upload= mhsr.getFile("upload");
		//2]File객체 생성
		//2-1] 파일 중복시 이름 변경
		String newFilename=FileUpDownUtils.getNewFileName(phicalPath, upload.getOriginalFilename());
		File file = new File(phicalPath+File.separator+newFilename);
		//3]업로드 처리		
		upload.transferTo(file);
		//4]서머노트에 다시 보내줄 데이타 저장
		String localIP = InetAddress.getLocalHost().getHostAddress();
		//5]DB 연결시 리퀘스트 영역에 새로운 파일명 저장 - 데이타베이스에 저장할 파일명
		mhsr.setAttribute("realImage", newFilename);
		mhsr.setAttribute("totalImage", upload.getOriginalFilename());
		//6]서머노트에 데이타 전달
		return "http://"+localIP+ ":"+mhsr.getServerPort() +"/lingopos/Images/notice_summernote/" + newFilename;
	}
	//창선 사진 삭제 - NOTICE 서머노트 Controller
	@ResponseBody
	@RequestMapping(value="/notice/Image.Lingo",method=RequestMethod.GET)
	public void noticesummernoteDelete(@RequestParam String removeFile) throws Exception{
		File remove = new File("C:\\CCS\\WorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\LingoPOS\\Images\\notice_summernote"+File.separator+removeFile);
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
			
			return phicalPath+File.separator+newFilename;
		}
		//창선 사진 삭제  - 가게 전경 Controller
		@ResponseBody
		@RequestMapping(value="/Shop/Store.Lingo",method=RequestMethod.GET)
		public void storeDelete(@RequestParam String removeFile) throws Exception{
			File remove = new File(removeFile);
			remove.delete();
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
			
			return phicalPath+File.separator+newFilename;
		}
		//창선 사진 삭제 - 메뉴 사진 Controller
		@ResponseBody
		@RequestMapping(value="/Shop/Menu.Lingo",method=RequestMethod.GET)
		public void MenuDelete(@RequestParam String removeFile) throws Exception{
			File remove = new File(removeFile);
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

	@RequestMapping("/Login/Signup/Signup.Lingo")
	public String signup(@RequestParam Map map,Model model) throws Exception{
		model.addAttribute("kind",map.get("kind"));
		return "login/signup/signup.tiles";
	}
	@RequestMapping("/Notice/Notice.Lingo")
	public String notice(Model model,HttpServletRequest req,
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
		
		return "notice/notice.tiles";
	}
//창선 추가로 등록한 NOTICE 수정 조회 상세보기 삭제 시작
		@RequestMapping(value="/Notice/NoticeWrite.Lingo",method=RequestMethod.GET)
		public String noticeWrite() throws Exception{
			return "notice/noticeWrite.tiles";
		}
		@RequestMapping(value="/Notice/NoticeWrite.Lingo",method=RequestMethod.POST)
		public String noticeWriteOk(@RequestParam Map map) throws Exception{
			noticeService.insert(map);
			return "forward:/Notice/Notice.Lingo";
		}
		@RequestMapping(value="/Notice/NoticeEdit.Lingo",method=RequestMethod.GET)
		public String noticeEdit(Model model,@RequestParam Map map) throws Exception{
			NoticeDTO dto = noticeService.selectOne(map);
			model.addAttribute("record", dto);
			return "notice/noticeEdit.tiles";
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
		public String noticeView(Model model,@RequestParam Map map) throws Exception{
			noticeService.updateCount(map);
			NoticeDTO dto = noticeService.selectOne(map);
			model.addAttribute("record", dto);
			model.addAttribute("nowPage", map.get("nowPage"));
			return "notice/noticeView.tiles";
		}
//창선 추가로 등록한 NOTICE 수정 조회 상세보기 삭제 끝		
	@RequestMapping("/Free/Free.Lingo")
	public String free(Model model,HttpServletRequest req,
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
		System.out.println(map.get("searchColumn"));
		List<FreeDTO> list = freeService.selectAll(map);
		model.addAttribute("list", list);
		model.addAttribute("pageString", pageString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageSize", noticepageSize);
		model.addAttribute("nowPage", nowPage);
		
		return "free/free.tiles";
	}
//창선 추가로 등록한 FREE 수정 조회 상세보기 삭제 시작
	@RequestMapping(value="/Free/FreeWrite.Lingo",method=RequestMethod.GET)
	public String freeWrite() throws Exception{
		return "free/freeWrite.tiles";
	}
	@RequestMapping(value="/Free/FreeWrite.Lingo",method=RequestMethod.POST)
	public String freeWriteOk(@RequestParam Map map) throws Exception{
		freeService.insert(map);
		return "forward:/Free/Free.Lingo";
	}
	@RequestMapping(value="/Free/FreeEdit.Lingo",method=RequestMethod.GET)
	public String freeEdit(Model model,@RequestParam Map map) throws Exception{
		FreeDTO dto = freeService.selectOne(map);
		model.addAttribute("record", dto);
		return "free/freeEdit.tiles";
	}
	@RequestMapping(value="/Free/FreeEdit.Lingo",method=RequestMethod.POST)
	public String freeEditOk(@RequestParam Map map) throws Exception{
		freeService.update(map);
		return "forward:/Free/FreeView.Lingo?freeno="+map.get("freeno");
	}
	@RequestMapping("/Free/FreeView.Lingo")
	public String freeView(Model model,@RequestParam Map map) throws Exception{
		freeService.updateCount(map);
		FreeDTO dto = freeService.selectOne(map);
		model.addAttribute("record", dto);
		model.addAttribute("nowPage", map.get("nowPage"));
		model.addAttribute("searchWord", map.get("searchWord"));
		model.addAttribute("searchColumn", map.get("searchColumn"));
		return "free/freeView.tiles";
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
		System.out.println(JSONArray.toJSONString(list));
		//날짜를 string으로 변경
		for(Map commen: list) {
			commen.put("commentdate",commen.get("commentdate").toString().substring(0,10));
		}
		System.out.println(JSONArray.toJSONString(list));
		return JSONArray.toJSONString(list);
	}
	//comment end
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
	 		
			/*
			 * 
			 * @RequestMapping("/Reservation/Detail.Lingo")
			 * public String detail(Model model,
			 * 						HttpServletRequest req,//페이징용 메소드에 전달
			 * 						@RequestParam(required=false,defaultValue="1") int nowPage//페이징용 nowPage파라미터 받기용
			 *						) throws Exception{
	         * DB연결 시 여기서 부터 데이터 값 불러옴
			 * Parameter 즉, 인자 변경 시 부터 수정 필요(서비스 추가필요)
			 * //서비스 호출]
			 * //뿌려줄 데이타] 
			 * StoreDTO store = (등록한 서비스).LingoStoreSelect(map); // map은 storeno // 가게이름/분류/전화번호/주소/오픈시간/종료시간
			 * 
			 * List<FoodimgDTO> foodimg = (등록한 서비스).LingoFoodimgSelect(map); // map은 storeno // 메뉴이름/메뉴가격/메뉴이미지경로(여러개)
			 * 
			 * List<StoreimgDTO> storeimg = (등록한 서비스).LingoStoreimgSelect(map); // map은 storeno // 가게이미지경로(여러개)
			 * 
			 * MapDTO map = (등록한 서비스).LingoMapSelect(map);; //map은 storeno // 맵에 표시할 x/y 좌표 2개 
			 * 
			 * List<ReviewDTO> review = (등록한 서비스).LingoReviewSelect(map);; //map은 storeno // 리뷰커멘트 //작성자 
			 * 
			 * 페이징을 위한 로직 시작]
			 * 전체 레코드 수
			 * int totalRecordCount= (등록한 서비스).(실행할 totalRecordCount sql과 연결된 메소드)(map);		
			 * 페이징 문자열을 위한 로직 호출 - SpringMavenProj에서 PagingUtil.java 가져오기!!
			 * String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,req.getContextPath()+ "/reservation/detail/detail.Lingo?");
			 * 페이징 데이타 저장
			 * 
			 * model.addAttribute("pagingString", pagingString);
			 * 
			 * 
			 * //데이타 저장]
			 * model객체에 저장
			 * model.addAttribute("store",store);
			 * model.addAttribute("foodimgs",foodimg); // list객체
			 * model.addAttribute("storeimgs",storeimg); // list객체
			 * model.addAttribute("map",map);
			 * model.addAttribute("reviews",review); // list객체
			 * 
			 * */
			
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
			String filename = path.substring(path.lastIndexOf(File.separator)+1,path.lastIndexOf('.'));
			String[] food = filename.split("_");
			System.out.println(food[0]);
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
	
}
