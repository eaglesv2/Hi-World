package com.hiworld.minihp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		/*System.out.println("미니홈피 인트로 가져오기 컨트롤러");*/
		String UserID = request.getParameter("UserID");
		/*System.out.println(UserID);*/

		
		return service.getIntroInfo(UserID);
	}
	
	@GetMapping("/miniHp_updateIntroInfo.do")
	public String miniHpUpdateIntroInfo(MiniHpIntroVO introVO) {
		/*System.out.println("미니홈피 인트로 수정 컨트롤러");*/
		/*System.out.println(introVO.getUserID());
		System.out.println(introVO.getHpInfo());*/
		service.updateIntroInfo(introVO);
		
		/*System.out.println("미니홈피 인트로 수정 서비스 갔다옴");*/
		return "MiniHP/MiniHP_Left";
	}
	
	@ResponseBody
	@GetMapping(value = "/miniHp_getIntroTitle.do", produces ="application/text;charset=utf8")
	public String miniHpGetIntroTitle(HttpServletRequest request) {
		/*System.out.println("미니홈피 타이틀 가져오기 컨트롤러");*/
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
		/*System.out.println("미니홈피 타이틀 수정 컨트롤러");
		System.out.println(introVO.getUserID());
		System.out.println(introVO.getHpTitle());*/
		
		service.updateIntroTitle(introVO);
		
		/*System.out.println("미니홈피 타이틀 수정 서비스 갔다옴");*/
		
		return "MiniHP/MiniHP_TopTitle";
	}
	
	@RequestMapping("/miniHp_uploadIntroPicture.do")
	public String miniHpUploadIntroPicture() {
		
		return "MiniHP/MiniHP_MyPic_Update";
	}
	
	@ResponseBody
	@PostMapping("/miniHp_getIntroPicture.do")
	public ResponseEntity<byte[]> miniHpGetIntroPicture(HttpServletRequest request) {
		System.out.println("미니홈피 프로필 사진 가져오기 컨트롤러");
		String UserID = request.getParameter("UserID");
		System.out.println(UserID);
		
		return service.getIntroPicture(UserID);
	}
	
	@RequestMapping(value = "miniHp_updateIntroPicture.do", method = RequestMethod.POST)
	public String miniHpUpdateIntroPicture(MultipartHttpServletRequest request, HttpSession session, MiniHpIntroVO introVO) {
		System.out.println("미니홈피 프로필 사진 수정 컨트롤러");
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String UserID = vo.getUserID();
		MultipartFile file = request.getFile("uploadFile");
		
		introVO.setUserID(UserID);
		introVO.setHpPicture_imgFile(file);
		
		/*System.out.println(file);*/
		
		System.out.println(introVO.getUserID());
		System.out.println(introVO.getHpPicture_imgFile());
		System.out.println(introVO.getHpPicture_imgFile().getOriginalFilename());
		service.updateIntroPicture(introVO);
		
		return "MiniHP/MiniHP_Left"; 
	}
	
	
}
