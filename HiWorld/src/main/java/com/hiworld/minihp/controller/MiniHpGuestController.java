package com.hiworld.minihp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.dao.MiniHpDAO;
import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.service.MiniHpIntroService;
import com.hiworld.minihp.service.MiniHpNeighborService;
import com.hiworld.minihp.service.MiniHpSettingService;
import com.hiworld.minihp.vo.MiniHpIntroVO;
import com.hiworld.minihp.vo.MiniHpNeighborViewVO;
import com.hiworld.minihp.vo.MiniHpOwnerVO;
import com.hiworld.minihp.vo.MiniHpUserMenuVO;
import com.hiworld.minihp.vo.MiniHpVisitorVO;

@Controller
public class MiniHpGuestController {
	
	@Autowired
	MiniHpSettingService settingService;
	
	@Autowired
	MiniHpIntroService introService;
	
	@Autowired
	MiniHpNeighborService neighborService;
	
	@Autowired
	MiniHpDAO dao;
	
	@Autowired
	MiniHpIntroDAO introDAO;
	
	MiniHpUserMenuVO menuVO;
	
	MiniHpIntroVO introVO;
	
	MiniHpOwnerVO ownerVO;
	
	MiniHpVisitorVO visitorVO;
	
	/*게스트 미니홈피 메인*/
	@GetMapping("/miniHp_guestHome.do")
	public String homeGuest(HttpServletRequest request, Model model) {
		/*System.out.println("미니홈피 게스트 컨트롤러");*/
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO)session.getAttribute("sessionVO");
		String OwnerID = request.getParameter("OwnerID");
		String GuestID = vo.getUserID();
		System.out.println(OwnerID);
		
		visitorVO = new MiniHpVisitorVO();
		visitorVO.setOwnerID(OwnerID);
		visitorVO.setGuestID(GuestID);
		
		introService.todayCheck(visitorVO);
		introVO = introDAO.getData(OwnerID);
		
		model.addAttribute("OwnerID", OwnerID);
		model.addAttribute("ownerintroVO", introVO);
		
		return "MiniHP/MiniHP_Home_Guest";
	}
	/*게스트 미니홈피 메뉴설정*/
	@GetMapping("/miniHp_rightGuestMenu.do")
	public String rightGuestMenu(HttpServletRequest request, Model model) {
		System.out.println("게스트 메뉴 불러오기");
		String OwnerID = request.getParameter("OwnerID");
		System.out.println(OwnerID);
		menuVO = settingService.getMenuAvailable(OwnerID);
		/*introVO = introDAO.getData(OwnerID);*/
		
		model.addAttribute("OwnerID", OwnerID);
		model.addAttribute("ownermenuVO", menuVO);
		/*request.setAttribute("ownerintroVO", introVO);*/
		
		return "MiniHP/MiniHP_Right_Guest_Menu";
	}
	
	@GetMapping("/miniHp_leftGuest.do")
	public String leftGuest(HttpServletRequest request, Model model) {
		String OwnerID = request.getParameter("OwnerID");
		introVO = introDAO.getData(OwnerID);
		ownerVO = dao.getData(OwnerID);
		List<MiniHpNeighborViewVO> neighborList = neighborService.getNeighborList(OwnerID); //이웃 목록 불러오기
		
		if(neighborList == null) {
			model.addAttribute("listLength", 0);
		} else {
			model.addAttribute("listLength", neighborList.size());
		}
		
		model.addAttribute("ownerintroVO", introVO);
		model.addAttribute("ownerVO", ownerVO);
		model.addAttribute("neighborList", neighborList);
		
		return "MiniHP/MiniHP_Left_Guest";
	}
	
	@GetMapping("/miniHp_rightGuest.do")
	public String rightGuest(HttpServletRequest request) {
		
		return "MiniHP/MiniHP_Right_Guest";
	}
	/*게스트 미니홈피 제목 설정*/
	@GetMapping("/miniHp_topGuest.do")
	public String topGuest(HttpServletRequest request, Model model) {
		String OwnerID = request.getParameter("OwnerID");
		/*introVO = introDAO.getData(OwnerID);*/
		
		model.addAttribute("OwnerID", OwnerID);
		/*model.addAttribute("ownerintroVO", introVO);*/
		
		return "MiniHP/MiniHP_TopGuest";
	}
	
	@ResponseBody
	@GetMapping("/miniHp_getGuestIntroTitle.do")
	public String getGuestTitle(HttpServletRequest request) {
		String OwnerID = request.getParameter("OwnerID");
		ownerVO = dao.getData(OwnerID);
		/*System.out.println(ownerVO.getUserName());*/
		
		return introService.getGuestTitle(ownerVO);
	}
}
