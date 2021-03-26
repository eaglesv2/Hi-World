package com.hiworld.minihp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hiworld.minihp.dao.MiniHpDAO;
import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.service.MiniHpSettingService;
import com.hiworld.minihp.vo.MiniHpIntroVO;
import com.hiworld.minihp.vo.MiniHpOwnerVO;
import com.hiworld.minihp.vo.MiniHpUserMenuVO;

@Controller
public class MiniHpGuestController {
	
	@Autowired
	MiniHpSettingService settingService;
	
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
		
		request.setAttribute("ownerintroVO", introVO);
		
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
		ownerVO = dao.getDate(OwnerID);
		
		request.setAttribute("ownerintroVO", introVO);
		request.setAttribute("ownerVO", ownerVO);
		
		return "MiniHP/MiniHP_TopGuest";
	}
	
}
