package com.hiworld.controller;


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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



import com.hiworld.service.ClientService;
import com.hiworld.service.ClientServiceImpl;
import com.hiworld.vo.ClientVO;

/* 여기가 컨트롤러라고 정의 */
@Controller
public class MainController {
	
	/* log를 더욱 자세히 알아볼수 있게 해서 에러를 찾기 쉬워짐 */
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
		
	/* ClientService를 부르기 위해 정의 */
	@Autowired
	private ClientService clientService;
	
	/* 처음 페이지로 이동하는곳 */
	@GetMapping("/")
	public String Main() throws Exception{
		return "login";
	}
	
	
	/* 회원 전체 조회 */
	/* getAllClient 라는 요청이 들어오면 여기로 옴 */
	/* RequestMapping(value=/getAllClient method="GET") 이랑 같은것 */
	@GetMapping("/getAllClient.do")
	public String getAllClient(Model model) throws Exception{
		ArrayList<ClientVO> alist = clientService.getAllClient();
		/* request 같은 느낌 jsp로 돌아가서 이 alist값을 ${alist}로 불러올 수 있음 */
		model.addAttribute("alist",alist);
		return "";
	}
		
	/* 회원 한명 조회 */
	@GetMapping("/getOneClient.do")
	public String getOneClinet(ClientVO clientVO, Model model) throws Exception{
		ClientVO vo = clientService.getOneClient(clientVO);
		/* vo객체의 값이 저장되서 들어감 */
		model.addAttribute("ClientVO", vo);
		return "";
	}
	
	/* 회원 정보 확인 */
	@GetMapping("/checkClient.do")
	
	
	/* 에이젝스를 이용하기 위해서 리턴형태를 바꿈 */
	@ResponseBody
	public String checkClient(ClientVO clientVO) throws Exception{
		String check = clientService.checkClient(clientVO);
		return "";
	}
	
	/* 로그인*/
	@GetMapping("/UserLogin.do")
	public String userLogin(ClientVO clientVO)throws Exception{
		boolean result;
		return "";
	}
	
	
	/* 회원 회원 가입 */
	@GetMapping("/insertClient.do")
	public String insertClient(ClientVO vo) throws Exception{
		System.out.println("나 저장할거야");
		clientService.insertClient(vo);
		return "index";
	}
	
	/* 회원 정보 수정 */
	@GetMapping("/updateClient.do")
	public String updateClient() throws Exception{
		return "";
	}
	
	/* 회원 정보 삭제 */
	@GetMapping("/deleteClient.do")
	public String deleteClient() throws Exception{
		return "";
	}
	
	
	


	/*@RequestMapping("/MiniHP_Left.do")
	public String miniHp_Left() {
		return "/MiniHP/MiniHP_Left";
	}
	
	@RequestMapping("/MiniHP_Right.do")
	public String miniHp_Right() {
		return "/MiniHP/MiniHP_Right";
	}
	
	@RequestMapping(value="/MiniHP_Guest.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String m4(HttpServletRequest request, String menu) {
		request.setAttribute("menu", menu);
		return "/MiniHP/MiniHP_Guest_Menu";
	}
	
	@RequestMapping(value="/MiniHP_Guest_Right.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String r_guest(HttpServletRequest request) {
		String cp = request.getContextPath();
		
		HttpSession session = request.getSession();
		cyUserDTO = (CyUserDTO) session.getAttribute("session");
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		int numPerPage = 3;
		int totalData = cyGuestDAO.getMyTotalData(cyUserDTO.getUserId());
		int totalPage = myUtil.getPageCount(numPerPage, totalData);
		if(currentPage > totalPage) {
			currentPage = totalPage;
		}
		int start = (currentPage -1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		List<CyGuestDTO> list = cyGuestDAO.getMyDataList(cyUserDTO.getUserId(),start,end);
		Iterator<CyGuestDTO> it = list.iterator();
		int listNum = 0, num = 0;
		String[] minimiArray = new String[list.size()];
		while (it.hasNext()) {
			CyGuestDTO temp = it.next();
			listNum = totalData - (start + num - 1);
			temp.setListNum(listNum);
			if (temp.getContent() != null) {
				temp.setContent(temp.getContent().replaceAll("\r\n", "<br/>"));
			}
			CyUsingItemDTO vo = cyUsingItemDAO.useMinimi(temp.getMemberId());
			minimiArray[num] = vo.getOriginalFileName();
			num++;
		}
		String listUrl = cp + "/cy/my_r_guest.action";
		if(list.size() == 0 ) 
			request.setAttribute("length", 0);
		else
			request.setAttribute("length", 1);
		request.setAttribute("list", list);
		request.setAttribute("pageIndexList", myUtil.pageIndexList(currentPage, totalPage, listUrl));
		request.setAttribute("totalData", totalData);
		request.setAttribute("minimiArray", minimiArray);
		request.setAttribute("length", list.size());
		request.setAttribute("currentPage", currentPage);
		return "/MiniHP/MiniHP_Right_Guest";
	}
*/
}
