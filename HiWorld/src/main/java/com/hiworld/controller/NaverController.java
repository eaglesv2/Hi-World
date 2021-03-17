package com.hiworld.controller;

import java.io.IOException;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class NaverController {
	
	/* 네이버 */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

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
		return "naverLogin";
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
		String gender = (String) response_obj.get("gender");
		/* id+name의 형태로 홈페이지내에서 id저장되며 회원가입을 했었는지 확인을 하기 위한 로직 */
		String checkID = id+name;
		
		System.out.println(id+","+name+","+gender);
		
		/* id값이 있을경우 1 없을경우 0반환 */
		int check = 1;
		if(check==1) {
			/* 이름하고 아이디를 세션 화 */
			session.setAttribute("name", name);
			session.setAttribute("id", checkID);
			return "naverLogin";
		}else {
			
			return "회원가입";	
			
		}
		
		
	}

	/* 로그아웃 */
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		
		/* 등록된 세션값 전부 삭제 */
		session.invalidate();
		
		/* redirect:/login.jsp
		 * redirect를 이용하면 views가 아닌 그 밖의 폴더에도 접근가능 또한 .do를 호출해서 컨트롤러를 호출도 가능 */
		return "login";
	}
}