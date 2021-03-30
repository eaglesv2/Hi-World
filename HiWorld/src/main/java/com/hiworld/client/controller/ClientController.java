package com.hiworld.client.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.hiworld.article.service.ArticleService;
import com.hiworld.article.vo.ArticleVO;
import com.hiworld.client.service.ClientService;
import com.hiworld.client.vo.ClientVO;
import com.hiworld.client.vo.sessionVO;

@Controller
public class ClientController {
	
	
	/* 네이버 */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	
	/* ClientService를 부르기 위해 정의 */
	@Autowired
	private ClientService clientService;
	
	/* ArticleService를 부르기 위해 정의 */
	@Autowired
	private ArticleService articleService;
	
	/* BO자동으로 등록 */
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
//	@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 공지사항 및 문의사항 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
//  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 이웃 찾기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	/* 이웃 찾기 */
	@GetMapping("/boardPage.do")
	public String boardAjax(Model model) {
		
		/* 
		 	MiniHp_Intro 정보 싹 가져옴
		 	조건은 session에 등록된 자기의 정보 빼고 가져오기
		 	
		 	
		 	
		 	그값을 모델화 시키고 view
		 */
		
		
		
		/* */
		return "Login/boardPage";
	}
	
//  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 관리자 관련 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	/* 회원 목록 보이기 */
	@GetMapping("/Manage_Client.do")
	public String adminClient(HttpServletRequest request, Model model) {
		String check = request.getParameter("check");
		System.out.println(check);
		if(check.equals("all")) {
			/* 회원 전체 */
			ArrayList<ClientVO> alist = clientService.getAllClient();
			model.addAttribute("alist",alist);
			return "adminClient";
		}else {
			/* 벤한 회원만 보기 */
			ArrayList<ClientVO> alist = clientService.getAllBanClient();
			model.addAttribute("alist",alist);
			return "adminBanClient";
		}
		
	}
	
	/* 회원 밴 관련 */
	@GetMapping("/userBan.do")
	@ResponseBody
	public String userBan(HttpServletRequest request) {
		int UserSerial = Integer.parseInt(request.getParameter("UserSerial"));
		System.out.println(UserSerial);
		String check = request.getParameter("BanCheck");
		System.out.println(check);
		if(check.equals("ban")) {
			/* 밴 걸기 */
			clientService.banClient(UserSerial);
		}else {
			/* 밴 풀기 */
			clientService.unBanClient(UserSerial);
		}
		
		return "";
	}
	
	/* 상품 페이지 불러오기 */
	@GetMapping("/Manage_Article.do")
	public String adminArticle() {
		return "adminArticle";
	}
	
	
	/* 파일 업로드 하기 */
	@PostMapping("/ArticleUpload.do") 
	@ResponseBody
	public int ArticleUpload(MultipartFile[] uploadFile, HttpServletRequest request) {
		
		
		/* 현재 내 프로젝트 경로(개인마다달라서 자름) + 이미지 경로 */
		String url = request.getSession().getServletContext().getRealPath("");
		url = url+"resources\\images\\article";
		System.out.println(url);
				
		for(MultipartFile file : uploadFile) {
			/* 기존 파일 정보 */
			System.out.println(file.getOriginalFilename());
			System.out.println(file.getSize());
			
			/* 업로드될 파일 명 */
			String uploadFileName = file.getOriginalFilename();
			File saveFile = new File(url, uploadFileName);
			try {
				/* 파일 업로드 */
				file.transferTo(saveFile);
			} catch (Exception e) {
				System.out.println("에러");
			}
		}
		
		return 1;
	}
	
	/* 디비에 목록 등록 */
	@GetMapping("/ArticleEnroll.do")
	@ResponseBody
	public int ArticleEnroll(ArticleVO articleVO) {
		
		int price = articleVO.getArticlePrice();
		System.out.println(price);
		
		/* 이미지 파일경로 저장 */
		String articleImg = articleVO.getArticleImg();
		articleImg = "resources/images/article/"+articleImg;
		articleVO.setArticleImg(articleImg);
		
		articleService.insertArticle(articleVO);
		
		return 1;
	}
	
//	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 자체 회원가입 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	/* 회원가입페이지로 이동 */
	@GetMapping("/userInsertForm.do")
	public String userInsertForm() {
		return "Login/userInsert"; 
	}
	
	/* 회원가입 */
	@PostMapping("/insertClient.do")
	public String insertClient(ClientVO clientVO) {
		System.out.println("회원가입");
		/* tel을 다 가져와서 하나로 묶어서 setter하기 */
		String tel = clientVO.getUserTel1()+"-"+clientVO.getUserTel2();
		clientVO.setUserTel(tel);
		
		/* address는 선택사항이므로 아무것도 입력안할시 없음 값 추가 */
		String address = clientVO.getUserAddress();
		if(address.length()<1) {
			address = "없음";
			clientVO.setUserAddress(address);
		}
		
		/* service를 통해 dao호출 */
		String checkJoin = clientService.insertClient(clientVO);
		
		/* 시리얼번호를 가져오기 위해 내 정보 호출 */
		String UserID = clientVO.getUserID();
		ClientVO vo = clientService.getOneClient(UserID);
		/* 회원가입시 기본으로 홈페이지 데이터 등록 */
		clientService.insertMiniHP(vo);
		
		return checkJoin;
	}
	
	//id 중복 확인 을 할경우
	@PostMapping("/idCheck.do")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		System.out.println("아이디중복확인");
		String userid = request.getParameter("userID");
		System.out.println(userid);
		int result = clientService.idCheck(userid);
		return Integer.toString(result);
	}
	
			
			
	/* 로그인 */
	@PostMapping("/checkClient.do")
	public String checkClient(ClientVO clientVO, HttpSession session, HttpServletResponse res )throws Exception {
		System.out.println("로그인");
		sessionVO vo = clientService.checkClient(clientVO);	
		
		if(vo!=null) {
			/* 밴 먹었는지 확인 */
			String test = clientService.checkBan(clientVO);
			if(test!=null) {
				/* 1은 밴 먹음 */
				return "Login/mainPage";
			}else {
				/* 이름하고 아이디를 세션 화 */
				session.setAttribute("sessionVO", vo);
				return "redirect:/login.do";
			}
		}else {
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = res.getWriter();
			writer.println("<script>alert('아이디 또는 패스워드를 확인하세요.')</script>");
			writer.flush();

			return "Login/mainPage";	
			
		}
	}
	
	/*메인페이지 AJAX*/
	@GetMapping("/logincheck.do")
	public String myinfo() {
		System.out.println("succc");
		return "Login/logincheck";
		
	}
		
	
	//내정보보기 전 비밀번호 체크
	@PostMapping("/pwCheck.do")
	@ResponseBody
	public int pwCheck(ClientVO clientVO, HttpSession session) {
		System.out.println("pw중복체크");
		sessionVO VO = (sessionVO)session.getAttribute("sessionVO");
		String UserID= VO.getUserID();
		String pw = clientService.pwCheck(UserID);
		String pw2 = clientVO.getUserPW();
		if(pw.equals(pw2)) {
			return 1;
		}else {
			return 0;
		}		
	}
	
	/* 내 정보 보기 */
	@GetMapping("/getOneClient.do")
	public String getOneClient(HttpSession session, Model model) {
		System.out.println("내정보보기");
		sessionVO sessionVO = (sessionVO)session.getAttribute("sessionVO");
		String UserID = sessionVO.getUserID();
		ClientVO vo = clientService.getOneClient(UserID);
		model.addAttribute("clientVO",vo);
		
		return "Login/userOneView";
	}
	
	
	
	/* 로그아웃 */
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		
		/* 등록된 세션값 전부 삭제 */
		session.invalidate();
		
		/* redirect:/login.jsp
		 * redirect를 이용하면 views가 아닌 그 밖의 폴더에도 접근가능 또한 .do를 호출해서 컨트롤러를 호출도 가능 */
		return "redirect:/login.do";
	}
	
	/* 회원정보 수정*/
	@PostMapping("UserUpdate.do")
	public String userUpdate(HttpServletRequest request, HttpSession session,Model model) {
		System.out.println("수정 항목임 여기 왓니?");
		//int updatech = Integer.parseInt(request.getParameter("updatech"));
		/* 받아온 값을 vo에 넣기 위해서 작업*/
		String userName= request.getParameter("userName");
		sessionVO vo1 = (sessionVO)session.getAttribute("sessionVO");
		int userserial = vo1.getUserSerial();
		String userId = vo1.getUserID();
		ClientVO vo = clientService.getOneClient(userId);
		vo.setUserName(userName);
		vo.setUserSerial(userserial);
		int ok = clientService.updateName(vo);
		/*============================================================*/
		sessionVO sessionvo = (sessionVO)session.getAttribute("sessionVO");
		/* user이름을 조회 하고 리턴하기 위해서*/
		String UserId = sessionvo.getUserID();
		String oneclient = clientService.selectName(UserId);
		ClientVO clientvo = clientService.getOneClient(oneclient);
		model.addAttribute("clientVO", clientvo);
		
		
				/*if(updatech == 1) {
			 1이 들어 오면 name를 수정 하라
				
				
		}else if(updatech == 2) {
			 2이 들어 오면 pw를 수정 하라
		}else if(updatech == 3) {
			 3이 들어 오면 birth를 수정 하라
		}else if(updatech == 4) {
			 4이 들어 오면 tel를 수정 하라
		}else if(updatech == 5) {
			 5이 들어 오면 address를 수정 하라
		}*/
		return "Login/userOneView";
	}
//	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 결제 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	/* 결제 창으로 이동 */
	@GetMapping("/BamTolCharge.do")
	public String BamTolPayMent(HttpSession session, Model model) {
		System.out.println("결제창으로 이동");
		return "PayMent/BamTolCharge";
	}
	
	
	/* 밤톨 충전 */
	@GetMapping("/userCash.do")
	@ResponseBody
	public String userCash(ClientVO clientVO, HttpSession session) {
		System.out.println("밤톨충전");
		sessionVO sessionVO = (sessionVO)session.getAttribute("sessionVO");
		String UserID = sessionVO.getUserID();
		int UserCash = clientVO.getUserCash()+clientVO.getCount();
		System.out.println(clientVO.getCount());
		System.out.println(UserCash);
		clientVO.setUserCash(UserCash);
		clientVO.setUserID(UserID);
		int check = clientService.userCash(clientVO);
		if(check!=0) {
			sessionVO.setUserCash(UserCash);			
		}
		return "success";
	}
	
	
//	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 네이버 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	
	/* 로그인 첫 화면 요청 메소드 */
	@RequestMapping(value = "/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		/* 위 메소드를 호출하고 네이버 로그인을 호출하는 URL 값이 아래 형태로 저장됨 */
		
		/*https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125*/
		System.out.println("네이버:" + naverAuthUrl);
		
		/* 네이버  url 값을 사용하기 위해서 저장 */
		model.addAttribute("url", naverAuthUrl);
		return "Login/mainPage";
	}

	/* 네이버 로그인 성공시 developer에 설정한 callback URL로 인해 여기로 오게됨 /callback */	
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)	throws IOException, ParseException {
		
		/* 토큰의 값을 이용하기 위해서 선언 */
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		/* 로그인한 사용자의 정보를 읽어온다. String형식의 json데이터가 넘어옴 */
		apiResult = naverLoginBO.getUserProfile(oauthToken); 
		/*
		 이런 구조로 값이 넘어오게 됨
		 apiResult json 구조 {"resultcode":"00", "message":"success",
		 "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 */
		
		/* String형태로 넘어온 json데이터를 json형태로 바꿈 */
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		/* 데이터 파싱: 기존의 데이터를 다른형태로 가공하는 것 자료 형변환도 파싱의 일종 */
		/* response를 파싱 네이버로부터 받아온 정보를 끌고오기 위해서 */
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		
		/* 이름을 다시 내가 사용하기 위해서 파싱 */
		String id = (String) response_obj.get("id");
		String name = (String) response_obj.get("name");
		/* id+name의 형태로 홈페이지내에서 id저장되며 회원가입을 했었는지 확인을 하기 위한 로직 */
		String checkID = name+id;
		
		System.out.println(checkID);
		
		/* 네이버 회원 체크 */
		sessionVO vo = clientService.NaverCheckClient(checkID);
		if(vo!=null) {
			/* 이름하고 아이디를 세션 화 */
			session.setAttribute("sessionVO", vo);
			return "redirect:/login.do";
		}else {
			model.addAttribute("UserID",checkID);
			model.addAttribute("UserName",name);
			return "Login/userInsert";	
			
		}
		
		
	}

	
	

//	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 카카오 로그인 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	/* 카카오 로그인 확인 */
	@GetMapping("/kakaoLogin.do")
	public String kakaoLogin(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("카카오로그인");
		String id = (String)request.getParameter("UserID");
		String name = (String)request.getParameter("UserName");
		
		String checkID = id+name;
		
		System.out.println(checkID);
		/* 카카오 회원 체크 */
		sessionVO vo = clientService.NaverCheckClient(checkID);
		if(vo!=null) {
			/* 이름하고 아이디를 세션 화 */
			session.setAttribute("sessionVO", vo);
			return "redirect:/login.do";
		}else {
			model.addAttribute("UserID",checkID);
			model.addAttribute("UserName",name);
			return "Login/userInsert";	
			
		}
	}
	
	
	
	
//	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 상품 관련 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	/* 상품 보기 (최신순) */
	@GetMapping("/sangpoom.do")
	public String sangpoom(Model model, HttpServletRequest request, ArticleVO articleVO) {
		System.out.println("상품보기");
		
		/* 호출한 ajax의 데이터가 뭔지 확인 */
		String list = request.getParameter("list");
		articleVO.setArticleList(list);
		ArrayList<ArticleVO> ArticleList;
		
		switch (list) {
		
		/* 상품 최신순 */
		case "쇼핑":
			ArticleList = articleService.getAllArticle();
			model.addAttribute("ArticleList",ArticleList);			
			return "Login/shoppingPage";		
		/* 케릭터 별 */
		case "캐릭터":
			ArticleList = articleService.getSelectArticle(articleVO);
			model.addAttribute("ArticleList",ArticleList);	
			return "articleCharacter";
		/* 배경화면 별 */
		case "배경": 
			ArticleList = articleService.getSelectArticle(articleVO);
			model.addAttribute("ArticleList",ArticleList);	
			return "articleBackground";
		/* 음악 별 */
		case "음악": 
			ArticleList = articleService.getSelectArticle(articleVO);
			model.addAttribute("ArticleList",ArticleList);	
			return "articleMusic";
		/* 마우스 별 */	
		case "마우스": 
			ArticleList = articleService.getSelectArticle(articleVO);
			model.addAttribute("ArticleList",ArticleList);	
			return "articleMouse";
		/* 에러 */	
		default:
			return "error";
		}
		
		
		
	}
	
	/* 장바구니 담기 */
	@GetMapping("/basket.do")
	@ResponseBody
	public int basket(ArticleVO articleVO) {
		System.out.println("장바구니 담기");
		String ArticleName = articleVO.getArticleName();
		int UserSerial = articleVO.getUserSerial();
		/* 상품정보 가져오기 */
		
		ArticleVO vo = articleService.getOneArticle(ArticleName);
		vo.setUserSerial(UserSerial);
		
		/*
		 	값 1은 성공
		 	0은 이미 구매한 상품
		 	-1은 실패
		 	-2는 장바구니에 이미있음
		  */
		
		/* 내 아이디에 상품 있는지 체크 */
		int check = articleService.check(vo);
		
		if(check!=1) {
			/* 구매한 상품 없음 */
			/* 장바구니 있는지 체크 */
			int basketCheck = articleService.basketCheck(vo);
			
			if(basketCheck!=1) {
				/* 장바구니에 등록 */
				articleService.basket(vo);	
				check=1;
			}else {
				check=-2;
			}
			
		}else {
			check=0;
		}
		
		return check;
	}
		
	/* 장바구니 목록 보기 */
	@GetMapping("/basketJoin.do")
	public String basketJoin(Model model, HttpSession session) {
		System.out.println("장바구니이동");
		sessionVO vo = (sessionVO)session.getAttribute("sessionVO");
		int UserSerial = vo.getUserSerial();
		/* 장바구니 목록 가져오기 */
		ArrayList<ArticleVO> ArticleList = articleService.getUserArticle(UserSerial);
		model.addAttribute("ArticleList", ArticleList);
		System.out.println(ArticleList);
		return "basket";
	}
	
	/* 한개 구매하기 */
	@GetMapping("/bay.do")
	@ResponseBody
	public int bay(HttpSession session, ArticleVO articleVO) {
		System.out.println("물품 구입");
		String value = articleVO.getArticleName();
		sessionVO sessionVO = (sessionVO)session.getAttribute("sessionVO");
		int idx = value.indexOf(",");
		
		int userSerial = sessionVO.getUserSerial();
		String articleName = value.substring(0,idx);
		int articlePrice = Integer.valueOf(value.substring(idx+1));
		int clientPrice = sessionVO.getUserCash();
		
		
		ArticleVO vo = articleService.getOneArticle(articleName);
		vo.setUserSerial(userSerial);
		
		/*
		 1 성공
		 0 금액부족
		 -1 이미구매한상품
		 */
		
		if(clientPrice<articlePrice) {
			return 0;
		}else {
			/* 이미 구매한 상품인지 확인 */
			int check = articleService.check(vo);
			if(check!=1) {
				/* 구매한상품 없음 상품 넣기 */
				articleService.insert(vo);
				
				/* 구매한 상품 금액 변경 및 세션 */
				int cal = clientPrice-articlePrice;
				vo.setArticlePrice(cal);
				articleService.cash(vo);
				sessionVO.setUserSerial(cal);
				
				/* 구매한 상품 장바구니 삭제 */
				articleService.delBasket(vo);
				return 1;
			}else {
				return -1;
			}
		}
		
	}
	
	/* 장바구니 목록 삭제 */
	@GetMapping("/delArticle.do")
	@ResponseBody
	public int delArticle(HttpSession session, ArticleVO articleVO) {
		sessionVO sessionVO = (sessionVO)session.getAttribute("sessionVO");
		int UserSerial = sessionVO.getUserSerial();
		articleVO.setUserSerial(UserSerial);
		
		articleService.delBasket(articleVO);
		return 1;
	}
	
	
	/* 장바구니에서 결제 */
	@GetMapping("/totalBay.do")
	@ResponseBody
	public int totalBay(HttpSession session, int total) {
		sessionVO sessionVO = (sessionVO)session.getAttribute("sessionVO");
		int UserSerial = sessionVO.getUserSerial();
		int price = sessionVO.getUserCash();
		
		
		/*
		 1 성공
		 0 금액부족 
		 */
		
		if(price>=total) {
			/* 결제 가능 */
			articleService.totalBay(UserSerial);
			
			/* 금액 차감 */
			ArticleVO vo = new ArticleVO();
			vo.setArticlePrice(price-total);
			vo.setUserSerial(UserSerial);
			articleService.cash(vo);
			sessionVO.setUserCash(price-total);
			
			/* 장바구니 삭제 */
			articleService.delAllBasket(UserSerial);
			return 1;
		}else {
			return 0;
		}
	}
//	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 메인 페이지 불러오는 곳 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	/* 공지 사항 */
	@GetMapping("/noticePage.do")
	public String noticeAjax() {
		/* 디비에서 목록 불러오기 */
		
		
		
		return "Login/noticePage";
		
	}
	
	/* 쇼핑페이지 */
	@GetMapping("/shoppingPage.do")
	public String shoppingAjax() {
		System.out.println("오나 ?");
		return "articleMain";
	}
	
	
	/* 문의 사항 */
	@GetMapping("/questionPage.do")
	public String questionAjax() {
		return "Login/questionPage";
	}
	
	/*쇼핑 ajax*/
	@GetMapping("/shop_character.do")
	public String shop_character() {
		return "Login/shop_character";
	}
	
	@GetMapping("/shop_background.do")
	public String shop_background() {
		return "Login/shop_background";
	}
	
	@GetMapping("/shop_music.do")
	public String shop_music() {
		return "Login/shop_music";
	}
	
	@GetMapping("/shop_mouse.do")
	public String shop_mouse() {
		return "Login/shop_mouse";
	}

}
