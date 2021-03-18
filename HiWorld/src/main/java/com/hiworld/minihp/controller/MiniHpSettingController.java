package com.hiworld.minihp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.minihp.service.MiniHpSettingService;
import com.hiworld.minihp.vo.MiniHpUserMenuVO;

@Controller
public class MiniHpSettingController {
	
	@Autowired
	MiniHpSettingService service;
	
	@RequestMapping("/miniHp_setting")
	public String miniHpSetting(HttpServletRequest request, String menu, String flag) {
		/*유저별 공개메뉴에 따른 리스트*/
		/*HttpSession session = request.getSession();
		cyUserDTO = (CyUserDTO) session.getAttribute("session");
		CyMenuDTO cyMenuDTO=cySettingDAO.getMenuAvailable(cyUserDTO.getUserId());*/
		menu="menu7";
		String currentFlag="1";
		if(flag!=null) {
			currentFlag=flag;
		}

		/*request.setAttribute("cyMenuDTO", cyMenuDTO);*/
		request.setAttribute("menu", menu);
		request.setAttribute("currentFlag", currentFlag);
		
		return "MiniHP/MiniHP_Setting";
	}
	
	@RequestMapping("/miniHp_menuList.do")
	public String miniHpSettingMenu() {
			
		return "MiniHP/MiniHP_Menu_Setting";
	}
	
	@RequestMapping("miniHp_setBasicInformation_pw.do")
	public String setBasicInformation_pw(HttpServletRequest request) throws Exception{
		System.out.println("미니홈피 기본정보 탭");
		return "MiniHP/MiniHP_Setting_BasicInfo_pwCheck";
	}
	
	@RequestMapping("miniHp_setBasicInformation_pw_ok.do")
	public String setBasicInformation_pw_ok(HttpServletRequest request) throws Exception{
		System.out.println("미니홈피 기본정보 비밀번호 확인");
		String id = request.getParameter("UserID");
		String pw = request.getParameter("UserPW");
		
		int result = service.pwCheck(id,pw);
		System.out.println(result);
		if(result == 0) {
			return "MiniHP/MiniHP_Setting_BasicInfo_pwCheck";
		} else {
			return "MiniHP/MiniHP_Setting_BasicInfo";
		}
	}
	
	@RequestMapping("miniHp_menuAvailable.do")
	public String settingMenuAvailable(HttpServletRequest request, MiniHpUserMenuVO userMenuVO) {
		System.out.println("미니홈피 메뉴 설정");
		HttpSession session = request.getSession();
		service.updateMenuAvailable(userMenuVO);
		

		return /*settingMenuAvailable(request);*/ "";
	}
}
