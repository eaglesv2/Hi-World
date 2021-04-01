package com.hiworld.minihp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.service.MiniHpNeighborListService;
import com.hiworld.minihp.service.MiniHpNeighborService;
import com.hiworld.minihp.vo.MiniHpNeighborListVO;
import com.hiworld.minihp.vo.MiniHpNeighborVO;
import com.hiworld.minihp.vo.MiniHpNeighborViewVO;

@Controller
public class MiniHpNeighborController {
	
	@Autowired
	MiniHpNeighborService neighborService;
	
	@Autowired
	MiniHpNeighborListService neighborListService;
	
	MiniHpNeighborVO neighborVO;
	
	MiniHpNeighborListVO neighborListVO;
	
	MiniHpNeighborViewVO neighborViewVO;
	
	
	// @@@@@@@@@@@@@@@@ 이웃 신청 @@@@@@@@@@@@@@@@
	
	/*이웃 신청 목록 확인*/
	@GetMapping("/miniHp_neighborRegisterList.do")
	public String neighborRegisterList(HttpSession session, Model model) {
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String UserID = vo.getUserID();
		List<MiniHpNeighborListVO> list = neighborListService.getRegisterList(UserID);

		model.addAttribute("registerList", list);
		
		return "MiniHP/MiniHP_NeighborRegisterList";
	}
	
	/*이웃 신청 내용 확인*/
	@GetMapping("/miniHp_neighborRegisterCheck.do")
	public String neighborRegisterCheck(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String senderID = request.getParameter("senderID");
		String receiverID = vo.getUserID();
		/*CyUsingItemDTO vo = cyUsingItemDAO.useMinimi(userId1);
		String minimiPath = vo.getOriginalFileName();*/
		neighborListVO = neighborListService.getRegisterCheck(senderID, receiverID);
		/*System.out.println(neighborListVO.getSenderValue());
		System.out.println(neighborListVO.getReceiverValue());*/
		
		model.addAttribute("neighborListVO", neighborListVO);
		
		return "MiniHP/MiniHP_NeighborRegisterCheck";
	}
	
	/*이웃명 수정 신청 내용 확인*/
	@GetMapping("/miniHp_neighborUpdateCheck.do")
	public String neighborUpdateCheck(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String senderID = request.getParameter("senderID");
		String receiverID = vo.getUserID();
		/*CyUsingItemDTO vo = cyUsingItemDAO.useMinimi(userId1);
		String minimiPath = vo.getOriginalFileName();*/
		neighborListVO = neighborListService.getRegisterCheck(senderID, receiverID);
		
		model.addAttribute("neighborListVO", neighborListVO);
		
		return "MiniHP/MiniHP_NeighborUpdateCheck";
	}
	
	/*이웃 신청 결과*/
	@ResponseBody
	@PostMapping("/miniHp_neighborRegisterCheck_ok.do")
	public String neighborRegisterCheck_ok(HttpServletRequest request, MiniHpNeighborVO neighborVO) {
		int type = Integer.parseInt(request.getParameter("type"));
		
		System.out.println(neighborVO.getNeighborValue1());
		System.out.println(neighborVO.getNeighborValue2());
		neighborService.registerCheck_ok(type, neighborVO);
		
		return "";
	}
	
	/*이웃 수정 신청 결과*/
	@ResponseBody
	@PostMapping("/miniHp_neighborUpdateCheck_ok.do")
	public String neighborUpdateCheck_ok(HttpServletRequest request, MiniHpNeighborVO neighborVO) {
		int type = Integer.parseInt(request.getParameter("type"));
		
		System.out.println(neighborVO.getNeighborValue1());
		System.out.println(neighborVO.getNeighborValue2());
		neighborService.updateCheck_ok(type, neighborVO);
		
		return "";
	}
	
	/*이웃 신청 버튼 누를시!!!*/
	@GetMapping("/miniHp_neighborRegister.do")
	public String neighborRegister(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String senderName = vo.getUserName(); //보내는이 이름
		String receiverId = request.getParameter("OwnerId"); //받는이 아이디
		System.out.println(receiverId);
		String receiverName = request.getParameter("OwnerName"); //받는이 이름
		
       /* CyUsingItemDTO usingItem = cyUsingItemDAO.useMinimi(userId);
        String minimiPath = usingItem.getOriginalFileName();*/
       /* request.setAttribute("minimiPath", minimiPath); */
		model.addAttribute("senderName", senderName);
		model.addAttribute("receiverId", receiverId);
		model.addAttribute("receiverName", receiverName);
		
		return "MiniHP/MiniHP_NeighborRegister";
	}
	
	/*이웃 신청 했을 때!!!*/
	@ResponseBody
	@PostMapping("/miniHp_neighborRegister_ok.do")
	public String neighborRegister_ok(HttpServletRequest request, MiniHpNeighborListVO neighborListVO) {
		/*System.out.println(neighborListVO.getUserMessage());*/
		neighborListService.insertNeighborList(neighborListVO); //신청 정보를 테이블에 저장
		
		return "";
	}
	
	/*이웃 끊기*/
	@ResponseBody
	@GetMapping("/miniHp_deleteNeighbor.do")
	public String deleteNeighbor(HttpServletRequest request) {
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String UserID = vo.getUserID();
		String NeighborID = request.getParameter("NeighborID");
		
		neighborService.deleteNeighbor(UserID, NeighborID);
		
		return "";
	}
	
	/*이웃명 수정*/
	@PostMapping("miniHp_updateNeighbor.do")
	public String updateNeighbor(HttpServletRequest request, Model model) {
		String userID = request.getParameter("userID");
		String userName = request.getParameter("userName");
		String userValue = request.getParameter("userValue");
		String neighborID = request.getParameter("neighborID");
		String neighborName = request.getParameter("neighborName");
		String neighborValue = request.getParameter("neighborValue");
		
		model.addAttribute("userID", userID);
		model.addAttribute("userName", userName);
		model.addAttribute("userValue", userValue);
		model.addAttribute("neighborID", neighborID);
		model.addAttribute("neighborName", neighborName);
		model.addAttribute("neighborValue", neighborValue);
		
		return "MiniHP/MiniHP_NeighborUpdate"; 
	}
	
	@ResponseBody
	@PostMapping("/miniHp_updateNeighbor_ok.do")
	public String updateNeighbor_ok(HttpServletRequest request, MiniHpNeighborListVO neighborListVO) {
		neighborListService.insertNeighborList(neighborListVO);
		
		return "";
	}
}
