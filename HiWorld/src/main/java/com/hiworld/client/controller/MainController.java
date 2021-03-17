package com.hiworld.client.controller;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.client.service.ClientService;
import com.hiworld.client.service.ClientServiceImpl;
import com.hiworld.client.vo.ClientVO;

/* 여기가 컨트롤러라고 정의 */
@Controller
public class MainController {
	
	/* log를 더욱 자세히 알아볼수 있게 해서 에러를 찾기 쉬워짐 */
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
		



//	@RequestMapping("/MiniHP_Left.do")
//	public String miniHp_Left() {
//		return "/MiniHP/MiniHP_Left";
//	}
//	
//	@RequestMapping("/MiniHP_Right.do")
//	public String miniHp_Right() {
//		return "/MiniHP/MiniHP_Right";
//	}
//	
//	@RequestMapping(value="/MiniHP_Guest.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String m4(HttpServletRequest request, String menu) {
//		request.setAttribute("menu", menu);
//		return "/MiniHP/MiniHP_Guest_Menu";
//	}
//	
//	@RequestMapping(value="/MiniHP_Guest_Right.do", method= {RequestMethod.GET,RequestMethod.POST})
//	public String r_guest(HttpServletRequest request) {
//		String cp = request.getContextPath();
//		
//		/*HttpSession session = request.getSession();
//		cyUserDTO = (CyUserDTO) session.getAttribute("session");
//		
//		String pageNum = request.getParameter("pageNum");
//		int currentPage = 1;
//		
//		if(pageNum != null) {
//			currentPage = Integer.parseInt(pageNum);
//		}
//		
//		int numPerPage = 3;
//		int totalData = cyGuestDAO.getMyTotalData(cyUserDTO.getUserId());
//		int totalPage = myUtil.getPageCount(numPerPage, totalData);
//		if(currentPage > totalPage) {
//			currentPage = totalPage;
//		}
//		int start = (currentPage -1) * numPerPage + 1;
//		int end = currentPage * numPerPage;
//		List<CyGuestDTO> list = cyGuestDAO.getMyDataList(cyUserDTO.getUserId(),start,end);
//		Iterator<CyGuestDTO> it = list.iterator();
//		int listNum = 0, num = 0;
//		String[] minimiArray = new String[list.size()];
//		while (it.hasNext()) {
//			CyGuestDTO temp = it.next();
//			listNum = totalData - (start + num - 1);
//			temp.setListNum(listNum);
//			if (temp.getContent() != null) {
//				temp.setContent(temp.getContent().replaceAll("\r\n", "<br/>"));
//			}
//			CyUsingItemDTO vo = cyUsingItemDAO.useMinimi(temp.getMemberId());
//			minimiArray[num] = vo.getOriginalFileName();
//			num++;
//		}
//		String listUrl = cp + "/cy/my_r_guest.action";
//		if(list.size() == 0 ) 
//			request.setAttribute("length", 0);
//		else
//			request.setAttribute("length", 1);
//		request.setAttribute("list", list);
//		request.setAttribute("pageIndexList", myUtil.pageIndexList(currentPage, totalPage, listUrl));
//		request.setAttribute("totalData", totalData);
//		request.setAttribute("minimiArray", minimiArray);
//		request.setAttribute("length", list.size());
//		request.setAttribute("currentPage", currentPage);*/
//		return "/MiniHP/MiniHP_Right_Guest";
//	}

}
