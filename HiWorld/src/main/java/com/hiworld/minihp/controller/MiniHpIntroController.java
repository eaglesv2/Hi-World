package com.hiworld.minihp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.service.MiniHpIntroService;
import com.hiworld.minihp.vo.MiniHpIntroVO;

@Controller
public class MiniHpIntroController {
	
	@Autowired
	MiniHpIntroService service;
	
	sessionVO sessionVO;
	
	@ResponseBody
	@GetMapping(value = "/miniHp_getIntroInfo.do", produces ="application/text;charset=utf8")
	public String miniHpGetIntroInfo(HttpServletRequest request) {
		System.out.println("미니홈피 인트로 가져오기 컨트롤러");
		String UserID = request.getParameter("UserID");
		/*System.out.println(UserID);*/

		
		return service.getIntroInfo(UserID);
	}
	
	@GetMapping("/miniHp_updateIntroInfo.do")
	public String miniHpUpdateIntroInfo(MiniHpIntroVO introVO) {
		System.out.println("미니홈피 인트로 수정 컨트롤러");
		/*System.out.println(introVO.getUserID());
		System.out.println(introVO.getHpInfo());*/
		service.updateIntroInfo(introVO);
		
		System.out.println("미니홈피 인트로 수정 서비스 갔다옴");
		return "MiniHP/MiniHP_Left";
	}
	
	@ResponseBody
	@GetMapping(value = "/miniHp_getIntroTitle.do", produces ="application/text;charset=utf8")
	public String miniHpGetIntroTitle(HttpServletRequest request) {
		System.out.println("미니홈피 타이틀 가져오기 컨트롤러");
		HttpSession session = request.getSession();
		sessionVO = (sessionVO) session.getAttribute("sessionVO");
		/*String UserID = sessionVO.getUserID();
		String UserName = sessionVO.getUserName();
		System.out.println(UserID);
		System.out.println(UserName);*/

		
		return service.getIntroTitle(sessionVO);
	}
	
	@GetMapping("/miniHp_updateIntroTitle.do")
	public String miniHpUpdateIntroTitle(MiniHpIntroVO introVO) {
		System.out.println("미니홈피 타이틀 수정 컨트롤러");
		System.out.println(introVO.getUserID());
		System.out.println(introVO.getHpTitle());
		
		service.updateIntroTitle(introVO);
		
		System.out.println("미니홈피 타이틀 수정 서비스 갔다옴");
		
		return "MiniHP/MiniHP_TopTitle";
	}
	
	@RequestMapping("/miniHp_uploadIntroPicture.do")
	public String miniHpUploadIntroPicture() {
		
		return "MiniHP/MiniHP_MyPic_Update";
	}
	
	@RequestMapping(value = "miniHp_updateIntroPicture.do", method = RequestMethod.POST)
	public String miniHpUpdateIntroPicture() {
		
		return ""; 
	}
}
