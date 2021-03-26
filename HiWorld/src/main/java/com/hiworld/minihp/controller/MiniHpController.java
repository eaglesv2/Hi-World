package com.hiworld.minihp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.service.MiniHpSettingService;
import com.hiworld.minihp.vo.MiniHpIntroVO;
import com.hiworld.minihp.vo.MiniHpUserMenuVO;

@Controller
public class MiniHpController {
	
	@Autowired
	MiniHpSettingService settingService;
	
	@Autowired
	MiniHpIntroDAO introDAO;
	
	MiniHpIntroVO introVO;
	
	MiniHpUserMenuVO menuVO;
	
	@RequestMapping("/MiniHP_Home.do")
	public String miniHp_Home(HttpSession session, Model model) {
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		model.addAttribute("menu", "menu1");
		return "MiniHP/MiniHP_Home";
	}
	
	@RequestMapping("/MiniHP_TopTitle.do")
	public String miniHp_TopTitle() {
		return "MiniHP/MiniHP_TopTitle";
	}
	
	@RequestMapping("/MiniHP_Left.do")
	public String miniHp_Left(HttpSession session, Model model) {
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String UserID = vo.getUserID();
		/*System.out.println(UserID);*/
		introVO = introDAO.getData(UserID);
		model.addAttribute("introVO", introVO);
		return "MiniHP/MiniHP_Left";
	}
	
	@ResponseBody
	@GetMapping("/MiniHpDefaultSide.do")
	public String miniHpDefaultSide() {
		return "MiniHP_Left.do";
	}
	
	@RequestMapping("/MiniHP_Right.do")
	public String miniHp_Right() {
		return "MiniHP/MiniHP_Right";
	}
	
	@GetMapping("/miniHpProfile.do")
	public String miniHpProfile(String menu, Model model) {
		System.out.println("프로필 화면");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Menu_Profile";
	}
	
	@GetMapping("/miniHpPicture.do")
	public String miniHpPicture(String menu, Model model) {
		System.out.println("사진첩1");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Menu_Picture";
	}
	@GetMapping("/MiniHpPicutreSide.do")
	public String miniHpPictureSide(Model model) {
		System.out.println("사진첩2");
		return "MiniHP/MiniHP_Menu_Picture_Side";
	}
	
	@GetMapping("/miniHpVideo.do")
	public String miniHpVideo(String menu, Model model) {
		System.out.println("비디오");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Menu_Video";
	}
	
	@GetMapping("/miniHpGuest.do")
	public String miniHpGuest(String menu, Model model) {
		System.out.println("방명록");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Menu_Guest";
	}
	
	@GetMapping("/miniHpSetting.do")
	public String miniHpSetting(String menu, Model model) {
		System.out.println("관리");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Setting_BasicInfo_pwCheck";
	}
	
	@RequestMapping("/miniHp_menuList.do")
	public String miniHpSettingMenu() {
			
		return "MiniHP/MiniHP_Menu_Setting";
	}
	
	@GetMapping("/MiniHpSettingSide.do")
	public String miniHpSettingSide() {
		return "MiniHP/MiniHP_Menu_Setting";
	}
	
	@RequestMapping("/miniHp_rightMenu.do")
	public String rightMenu(HttpServletRequest request) {
		System.out.println("메뉴불러오기");
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String userId = vo.getUserID();
		String menu = request.getParameter("menu");
		menuVO = settingService.getMenuAvailable(userId);
		
		System.out.println(menu);
		
		request.setAttribute("miniHpUserMenuVO", menuVO);
		request.setAttribute("menu", menu);

		return "MiniHP/MiniHP_Right_Menu";
	}
	
}
