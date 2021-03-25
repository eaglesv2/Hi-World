package com.hiworld.client.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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

//  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 관리자 관련 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	/* 회원 전체 목록 보이기 */
	@GetMapping("/adminClient.do")
	public String adminClient() {
		return "";
	}
	
	/* 상품 등록 */
	@GetMapping("/adminArticle.do")
	public String adminArticle() {
		return "";
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
		String tel = clientVO.getUserTel1()+"-"+clientVO.getUserTel2()+"-"+clientVO.getUserTel3();
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
	public String checkClient(ClientVO clientVO, HttpSession session) {
		System.out.println("로그인");
		sessionVO vo = clientService.checkClient(clientVO);	
		String message = "";
		if(vo!=null) {
			/* 이름하고 아이디를 세션 화 */
			session.setAttribute("sessionVO", vo);
			return "redirect:/login.do";
		}else {
			System.out.println("여기로 왔니?");
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
	public String sangpoom(Model model, HttpServletRequest request) {
		System.out.println("상품보기");
		
		/* 호출한 ajax의 데이터가 뭔지 확인 */
//		String list = request.getParameter("list");
		
		
//		switch (list) {
		/* 상품 최신순 */
//		case "new":
//			
//			break;
//		
//		case "character": break;
//		case "background": break;
//		case "music": break;
//		case "mouse": break;
//		default:
//			break;
//		}
		
		
		ArrayList<ArticleVO> ArticleList = articleService.getAllArticle();
		model.addAttribute("ArticleList",ArticleList);			
		
		
		return "sangpoom";
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
	
	/*메인페이지 AJAX*/
	@GetMapping("/noticePage.do")
	public String noticeAjax() {
		return "Login/noticePage";
		
	}
	
	@GetMapping("/shoppingPage.do")
	public String shoppingAjax() {
		return "Login/shoppingPage";
	}
	
	@GetMapping("/boardPage.do")
	public String boardAjax() {
		return "Login/boardPage";
	}
	
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
