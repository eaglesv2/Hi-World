package com.hiworld.minihp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.service.MiniHpItemService;
import com.hiworld.minihp.service.MiniHpNeighborService;
import com.hiworld.minihp.service.MiniHpSettingService;
import com.hiworld.minihp.vo.MiniHpIntroVO;
import com.hiworld.minihp.vo.MiniHpNeighborViewVO;
import com.hiworld.minihp.vo.MiniHpSelectedItemVO;
import com.hiworld.minihp.vo.MiniHpUserItemVO;
import com.hiworld.minihp.vo.MiniHpUserMenuVO;

@Controller
public class MiniHpSettingController {
	
	@Autowired
	MiniHpSettingService settingService;
	
	@Autowired
	MiniHpNeighborService neighborService;
	
	@Autowired
	MiniHpItemService itemService;
	
	@Autowired
	MiniHpIntroDAO introDAO;
	
	MiniHpUserMenuVO menuVO;
	
	MiniHpIntroVO introVO;
	
	sessionVO sessionVO;
	
	
	/*회원 정보 조회*/
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
		/*System.out.println(id);
		System.out.println(pw);*/
		int result = settingService.pwCheck(id,pw);
		System.out.println(result);
		if(result == 0) {
			return "MiniHP/MiniHP_Setting_BasicInfo_pwCheck";
		} else {
			return "MiniHP/MiniHP_Setting_BasicInfo";
		}
	}
	
	/*메뉴 설정 탭*/
	@RequestMapping("/miniHp_menuAvailable.do")
	public String setMenuAvailable(Model model, HttpSession session) {
		System.out.println("미니홈피 메뉴 설정");
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		MiniHpUserMenuVO miniHpUserMenuVO = settingService.getMenuAvailable(vo.getUserID());
		/*System.out.println(miniHpUserMenuVO);*/
		model.addAttribute("miniHpUserMenuVO", miniHpUserMenuVO);

		return "MiniHP/MiniHP_Setting_Menu_Available";
	}
	
	/*메뉴 설정 저장*/
	@RequestMapping("/miniHp_menuAvailable_ok.do")
	public String setMenuAvailable_ok(Model model, HttpSession session, MiniHpUserMenuVO userMenuVO) {
		System.out.println("미니홈피 메뉴 설정 확인 컨트롤러");
		
		settingService.updateMenuAvailable(userMenuVO);

		return setMenuAvailable(model, session);
	}
	
	/*일촌 관리 탭*/
	@RequestMapping("/miniHp_setNeighborList.do")
	public String setNeighborList(HttpSession session, Model model) {
		System.out.println("미니홈피 이웃 목록 컨트롤러");
		sessionVO = (sessionVO)session.getAttribute("sessionVO");
		String UserID = sessionVO.getUserID();
		List<MiniHpNeighborViewVO> neighborList = neighborService.getNeighborList(UserID); //이웃 목록 불러오기
		if(neighborList == null) {
			model.addAttribute("listLength", 0);
		} else {
			model.addAttribute("listLength", neighborList.size());
		}
		
		model.addAttribute("neighborList", neighborList);
		
		return "MiniHP/MiniHP_Setting_NeighborList";
	}
	
	@RequestMapping("/miniHp_storyRoomMinimi.do")
	public String setStoryRoomMinimi(HttpSession session, Model model) {
		System.out.println("미니홈피 스토리룸 미니미 컨트롤러");
		sessionVO = (sessionVO)session.getAttribute("sessionVO");
		int UserSerial = sessionVO.getUserSerial();
		MiniHpSelectedItemVO itemList = itemService.getItemList(UserSerial);
		List<MiniHpUserItemVO> minimiList = itemService.getMinimiList(UserSerial);
		List<MiniHpUserItemVO> storyList = itemService.getStoryRoomList(UserSerial);
		
		int minimiSize = minimiList.size();
		int storySize = storyList.size();
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("minimiList", minimiList);
		model.addAttribute("minimiSize", minimiSize);
		model.addAttribute("storyList", storyList);
		model.addAttribute("storySize", storySize);
		
		return "MiniHP/MiniHP_Setting_StoryRoom_Minimi";
	}
}

