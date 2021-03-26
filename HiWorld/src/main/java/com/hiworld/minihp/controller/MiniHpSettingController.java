package com.hiworld.minihp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.service.MiniHpSettingService;
import com.hiworld.minihp.vo.MiniHpIntroVO;
import com.hiworld.minihp.vo.MiniHpUserMenuVO;

@Controller
public class MiniHpSettingController {
	
	@Autowired
	MiniHpSettingService service;
	
	@Autowired
	MiniHpIntroDAO introDAO;
	
	MiniHpUserMenuVO menuVO;
	
	MiniHpIntroVO introVO;
	
	/*@RequestMapping("/miniHp_setting")
	public String miniHpSetting(HttpServletRequest request, String menu, String flag) {
		유저별 공개메뉴에 따른 리스트
		menu="menu7";
		String currentFlag="1";
		if(flag!=null) {
			currentFlag=flag;
		}

		request.setAttribute("menu", menu);
		request.setAttribute("currentFlag", currentFlag);
		
		return "MiniHP/MiniHP_Setting";
	}*/
	
	@RequestMapping("/miniHp_setBasicInformation_pw.do")
	public String setBasicInformation_pw(HttpServletRequest request) {
		System.out.println("미니홈피 기본정보 탭");
		return "MiniHP/MiniHP_Setting_BasicInfo_pwCheck";
	}
	
	@RequestMapping("/miniHp_setBasicInformation_pw_ok.do")
	public String setBasicInformation_pw_ok(HttpServletRequest request) {
		System.out.println("미니홈피 기본정보 비밀번호 확인");
		String id = request.getParameter("UserID");
		String pw = request.getParameter("UserPW");
		System.out.println(id);
		System.out.println(pw);
		int result = service.pwCheck(id,pw);
		System.out.println(result);
		if(result == 0) {
			return "MiniHP/MiniHP_Setting_BasicInfo_pwCheck";
		} else {
			return "MiniHP/MiniHP_Setting_BasicInfo";
		}
	}
	
	@RequestMapping("/miniHp_menuAvailable.do")
	public String settingMenuAvailable(Model model, HttpSession session) {
		System.out.println("미니홈피 메뉴 설정");
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		MiniHpUserMenuVO miniHpUserMenuVO = service.getMenuAvailable(vo.getUserID());
		System.out.println(miniHpUserMenuVO);
		model.addAttribute("miniHpUserMenuVO", miniHpUserMenuVO);

		return "MiniHP/MiniHP_Setting_Menu_Available";
	}
	
	@RequestMapping("/miniHp_menuAvailable_ok.do")
	public String settingMenuAvailable_ok(Model model, HttpSession session, MiniHpUserMenuVO userMenuVO) {
		System.out.println("미니홈피 메뉴 설정 확인 컨트롤러");
		
		service.updateMenuAvailable(userMenuVO);

		return settingMenuAvailable(model, session);
	}

}

