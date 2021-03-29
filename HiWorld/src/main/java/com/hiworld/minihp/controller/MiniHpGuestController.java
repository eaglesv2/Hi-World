package com.hiworld.minihp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.dao.MiniHpDAO;
import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.service.MiniHpNeighborListService;
import com.hiworld.minihp.service.MiniHpSettingService;
import com.hiworld.minihp.vo.MiniHpIntroVO;
import com.hiworld.minihp.vo.MiniHpNeighborListVO;
import com.hiworld.minihp.vo.MiniHpOwnerVO;
import com.hiworld.minihp.vo.MiniHpUserMenuVO;

@Controller
public class MiniHpGuestController {
	
	@Autowired
	MiniHpSettingService settingService;
	
	@Autowired
	MiniHpNeighborListService neighborListService;
	
	@Autowired
	MiniHpDAO dao;
	
	@Autowired
	MiniHpIntroDAO introDAO;
	
	MiniHpUserMenuVO menuVO;
	
	MiniHpIntroVO introVO;
	
	MiniHpOwnerVO ownerVO;
	
	@RequestMapping("/miniHp_rightGuestMenu.do")
	public String rightGuestMenu(HttpServletRequest request) {
		System.out.println("게스트 메뉴 불러오기");
		String OwnerID = request.getParameter("OwnerID");
		menuVO = settingService.getMenuAvailable(OwnerID);
		/*introVO = introDAO.getData(OwnerID);*/
		
		request.setAttribute("ownermenuVO", menuVO);
		/*request.setAttribute("ownerintroVO", introVO);*/
		
		return "MiniHP/MiniHP_Right_Guest_Menu";
	}
	
	@RequestMapping("/miniHp_leftGuest.do")
	public String leftGuest(HttpServletRequest request) {
		String OwnerID = request.getParameter("OwnerID");
		introVO = introDAO.getData(OwnerID);
		ownerVO = dao.getData(OwnerID);
		
		request.setAttribute("ownerintroVO", introVO);
		request.setAttribute("ownerVO", ownerVO);
		
		return "MiniHP/MiniHP_Left_Guest";
	}
	
	@RequestMapping("/miniHp_rightGuest.do")
	public String rightGuest(HttpServletRequest request) {
		
		return "MiniHP/MiniHP_Right_Guest";
	}
	
	@RequestMapping("/miniHp_topGuest.do")
	public String topGuest(HttpServletRequest request) {
		String OwnerID = request.getParameter("OwnerID");
		introVO = introDAO.getData(OwnerID);
		
		request.setAttribute("ownerintroVO", introVO);
		
		return "MiniHP/MiniHP_TopGuest";
	}
	
	//이웃 신청 버튼 누를시!!!
	@GetMapping("/miniHp_neighborRegister.do")
	public String neighborRegister(HttpServletRequest request) {
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String senderName = vo.getUserName(); //보내는이 이름
		String receiverId = request.getParameter("OwnerId"); //받는이 아이다
		String receiverName = request.getParameter("OwnerName"); //받는이 이름
		
       /* CyUsingItemDTO usingItem = cyUsingItemDAO.useMinimi(userId);
        String minimiPath = usingItem.getOriginalFileName();*/
       /* request.setAttribute("minimiPath", minimiPath); */
		request.setAttribute("senderName", senderName);
		request.setAttribute("receiverId", receiverId);
		request.setAttribute("receiverName", receiverName);
		return "MiniHP/MiniHP_NeighborRegister";
	}
	
	//이웃 신청 했을 때!!!
	@ResponseBody
	@PostMapping("/miniHp_NeighborRegister_ok.do")
	public String neighborRegister_ok(HttpServletRequest request, MiniHpNeighborListVO neighborListVO) {
		
		neighborListService.insertNeighborList(neighborListVO); //신청 정보를 테이블에 저장
		
		return "";
	}
}
