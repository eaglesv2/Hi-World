package com.hiworld.minihp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.service.MiniHpNeighborListService;
import com.hiworld.minihp.service.MiniHpNeighborService;
import com.hiworld.minihp.service.MiniHpSettingService;
import com.hiworld.minihp.vo.MiniHpIntroVO;
import com.hiworld.minihp.vo.MiniHpNeighborListVO;
import com.hiworld.minihp.vo.MiniHpNeighborVO;
import com.hiworld.minihp.vo.MiniHpNeighborViewVO;
import com.hiworld.minihp.vo.MiniHpUserMenuVO;

@Controller
public class MiniHpController {
	
	@Autowired
	MiniHpSettingService settingService;
	
	@Autowired
	MiniHpNeighborService neighborService;
	
	@Autowired
	MiniHpNeighborListService neighborListService;
	
	@Autowired
	MiniHpIntroDAO introDAO;
	
	MiniHpIntroVO introVO;
	
	MiniHpUserMenuVO menuVO;
	
	MiniHpNeighborVO neighborVO;
	
	MiniHpNeighborListVO neighborListVO;
	
	MiniHpNeighborViewVO neighborViewVO;
	
	
	//@@@@@@@@@@@@@@@@ 홈페이지 VIEW @@@@@@@@@@@@@@@@@@
	
	//미니홈피 메인
	@RequestMapping("/MiniHP_Home.do")
	public String miniHp_Home(HttpSession session, Model model) {
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String UserID = vo.getUserID();
		introVO = introDAO.getData(UserID); //미니홈피 기본 정보 가져오기
		
		model.addAttribute("introVO", introVO);
		model.addAttribute("menu", "menu1");
		return "MiniHP/MiniHP_Home";
	}
	
	//미니홈피 제목
	@RequestMapping("/MiniHP_TopTitle.do")
	public String miniHp_TopTitle() {
		return "MiniHP/MiniHP_TopTitle";
	}
	
	@RequestMapping("/MiniHP_Left.do")
	public String miniHp_Left(HttpSession session, Model model) {
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String UserID = vo.getUserID();
		/*System.out.println(UserID);*/
		introVO = introDAO.getData(UserID); //미니홈피 기본 정보 가져오기
		List<MiniHpNeighborViewVO> neighborList = neighborService.getNeighborList(UserID); //이웃 목록 불러오기
		
		if(neighborList == null) {
			model.addAttribute("listLength", 0);
		} else {
			model.addAttribute("listLength", neighborList.size());
		}
		
		model.addAttribute("introVO", introVO);
		model.addAttribute("neighborList", neighborList);
		return "MiniHP/MiniHP_Left";
	}
	
	@ResponseBody
	@GetMapping("/MiniHpDefaultSide.do")
	public String miniHpDefaultSide() {
		return "MiniHP/MiniHP_Left.do";
	}
	
	@RequestMapping("/MiniHP_Right.do")
	public String miniHp_Right() {
		return "MiniHP/MiniHP_Right";
	}
	
	//프로필 탭
	@GetMapping("/miniHpProfile.do")
	public String miniHpProfile(String menu, Model model) {
		System.out.println("프로필 화면");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Menu_Profile";
	}
	
	//동영상 탭
	@GetMapping("/miniHpVideo.do")
	public String miniHpVideo(String menu, Model model) {
		System.out.println("비디오");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Menu_Video";
	}
	
	//방명록 탭
	@GetMapping("/miniHpGuest.do")
	public String miniHpGuest(String menu, Model model) {
		System.out.println("방명록");
		model.addAttribute("menu",menu);
		return "MiniHP/MiniHP_Menu_Guest";
	}
	
	//관리 탭
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
	public String rightMenu(HttpServletRequest request, Model model) {
		/*System.out.println("메뉴불러오기");*/
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String userId = vo.getUserID();
		String menu = request.getParameter("menu");
		menuVO = settingService.getMenuAvailable(userId);
		
		/*System.out.println(menu);*/
		
		model.addAttribute("miniHpUserMenuVO", menuVO);
		model.addAttribute("menu", menu);

		return "MiniHP/MiniHP_Right_Menu";
	}
	
	
	// @@@@@@@@@@@@@@@@ 이웃 신청 @@@@@@@@@@@@@@@@
	
	@GetMapping("/miniHp_neighborRegisterList.do")
	public String neighborRegisterList(HttpSession session, Model model) {
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String UserID = vo.getUserID();
		List<MiniHpNeighborListVO> list = neighborListService.getRegisterList(UserID);
		
		model.addAttribute("registorList", list);
		
		return "MiniHP/MiniHP_NeighborRegisterList";
	}
	
	@GetMapping("/miniHp_neighborRegisterCheck.do")
	public String neighborRegisterCheck(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String senderID = request.getParameter("senderID");
		String receiverID = vo.getUserID();
		/*CyUsingItemDTO vo = cyUsingItemDAO.useMinimi(userId1);
		String minimiPath = vo.getOriginalFileName();*/
		neighborListVO = neighborListService.getRegisterCheck(senderID, receiverID);
		
		model.addAttribute("neighborListVO", neighborListVO);
		
		return "MiniHP/MiniHO_NeighborRegisterCheck";
	}
	
	@ResponseBody
	@PostMapping("/miniHp_neighborRegisterCheck_ok.do")
	public String neighborRegisterCheck_ok(HttpServletRequest request, MiniHpNeighborVO neighborVO) {
		int type = Integer.parseInt(request.getParameter("type"));
		
		neighborService.registerCheck_ok(type, neighborVO);
		
		return "";
	}
}
