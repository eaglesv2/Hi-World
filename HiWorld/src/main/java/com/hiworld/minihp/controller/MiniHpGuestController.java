package com.hiworld.minihp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.dao.MiniHpDAO;
import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.service.MiniHpBoardService;
import com.hiworld.minihp.service.MiniHpBookService;
import com.hiworld.minihp.service.MiniHpIntroService;
import com.hiworld.minihp.service.MiniHpNeighborService;
import com.hiworld.minihp.service.MiniHpPictureService;
import com.hiworld.minihp.service.MiniHpSettingService;
import com.hiworld.minihp.service.MiniHpVideoService;
import com.hiworld.minihp.vo.MiniHpBoardPagingVO;
import com.hiworld.minihp.vo.MiniHpBookPagingVO;
import com.hiworld.minihp.vo.MiniHpBookVO;
import com.hiworld.minihp.vo.MiniHpIntroVO;
import com.hiworld.minihp.vo.MiniHpNeighborViewVO;
import com.hiworld.minihp.vo.MiniHpOwnerVO;
import com.hiworld.minihp.vo.MiniHpPicturePagingVO;
import com.hiworld.minihp.vo.MiniHpUserMenuVO;
import com.hiworld.minihp.vo.MiniHpVideoPagingVO;
import com.hiworld.minihp.vo.MiniHpVisitorVO;

@Controller
public class MiniHpGuestController {
	
	@Autowired
	private MiniHpPictureService pictureService;
	@Autowired
	private MiniHpBoardService boardService;
	@Autowired
	private MiniHpVideoService videoService;
	@Autowired
	private MiniHpBookService bookService;
	
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
		
		//우측메뉴 갈때 주인 시리얼 전달
		ownerVO = dao.getData(OwnerID);
		model.addAttribute("ownerSerial", ownerVO.getUserSerial());
		
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
	
	// 사진첩 -------------------------------------
	@GetMapping("/MiniHpPictureGuestSide.do")
	public String miniHpPictureSide(int ownerSerial, Model model, HttpSession session) {
		System.out.println("MiniHpPictureSide.do");
		model.addAttribute("ownerSerial",ownerSerial);
		model.addAttribute("folderList",pictureService.getAllFolder(ownerSerial));
		return "MiniHP/guestPicture_Side";
	}
	@GetMapping("/miniHpGuestPicture.do")
	public String miniHpPicture(int ownerSerial, Model model, HttpSession session,@RequestParam(required=false) Integer folderSerial,@RequestParam(defaultValue="1") int curPage) {
		System.out.println("miniHpPicture.do");
		model.addAttribute("ownerSerial",ownerSerial);
		if(folderSerial==null)
			folderSerial = pictureService.getFirstFolderSerial(ownerSerial);
		
		//페이징처리-----------------------------------------------------------------------------------------------------
		int listCnt = pictureService.countInsideFolder(folderSerial);//총 게시글 수
		MiniHpPicturePagingVO pagingVO = new MiniHpPicturePagingVO(listCnt, curPage);//총 게시글수, 현재 페이지로 pagingVO 생성
		
		model.addAttribute("list",pictureService.getAll(folderSerial, curPage, pagingVO.getPageSize()));//현재 페이지만큼만 가져옴
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("pagination",pagingVO);
		//--------------------------------------------------------------------------------------------------------------
		model.addAttribute("currentFolderName", pictureService.getFolderName(folderSerial));
		model.addAttribute("currentFolderSerial", folderSerial);
		return "MiniHP/guestPicture";
	}
	
	// 게시판 -------------------------------------
	@GetMapping("/MiniHpBoardGuestSide.do")
	public String miniHpBoardSide(int ownerSerial, Model model, HttpSession session) {
		System.out.println("게시판 side");
		model.addAttribute("ownerSerial",ownerSerial);
		model.addAttribute("folderList",boardService.getAllFolder(ownerSerial));
		return "MiniHP/guestBoard_Side";
	}
	@GetMapping("/miniHpBoardGuest.do")
	public String miniHpBoard(int ownerSerial, Model model, HttpSession session,@RequestParam(required=false) Integer folderSerial,@RequestParam(defaultValue="1") int curPage) {
		System.out.println("게시판 main");
		model.addAttribute("ownerSerial",ownerSerial);
		if(folderSerial==null)
			folderSerial = boardService.getFirstFolderSerial(ownerSerial);
		
		//전체 리스트 개수
		int listCnt = boardService.countInsideFolder(folderSerial);
		MiniHpBoardPagingVO pagingVO = new MiniHpBoardPagingVO(listCnt, curPage);
		
		
		model.addAttribute("list",boardService.getAll(folderSerial, curPage, pagingVO.getPageSize()));
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("pagination",pagingVO);
		
		model.addAttribute("currentFolderName", boardService.getFolderName(folderSerial));
		model.addAttribute("currentFolderSerial", folderSerial);
		return "MiniHP/guestBoard";
	}
	//자세한 페이지 이동
	@GetMapping("/MiniHpBoardGuestDetail.do")
	public String miniHpBoardDetail(int ownerSerial, int serial, Model model) {
		System.out.println("게시판 detail 화면");
		model.addAttribute("ownerSerial",ownerSerial);
		model.addAttribute("board",boardService.get(serial));
		boardService.updateHit(serial);
		//댓글 추가
		model.addAttribute("replyList", boardService.getAllReply(serial));
		return "MiniHP/guestBoard_Detail";
	}
	
	// 동영상 -------------------------------------
	@GetMapping("/MiniHpVideoGuestSide.do")
	public String miniHpVideoSide(int ownerSerial, Model model, HttpSession session) {
		System.out.println("MiniHpVideoSide.do");
		model.addAttribute("ownerSerial",ownerSerial);
		model.addAttribute("folderList",videoService.getAllFolder(ownerSerial));
		return "MiniHP/guestVideo_Side";
	}
	@GetMapping("/miniHpVideoGuest.do")
	public String miniHpVideo(int ownerSerial, Model model, HttpSession session,@RequestParam(required=false) Integer folderSerial,@RequestParam(defaultValue="1") int curPage) {
		System.out.println("miniHpVideo.do");
		model.addAttribute("ownerSerial",ownerSerial);
		if(folderSerial==null)
			folderSerial = videoService.getFirstFolderSerial(ownerSerial);
		
		//페이징처리-----------------------------------------------------------------------------------------------------
		int listCnt = videoService.countInsideFolder(folderSerial);//총 게시글 수
		MiniHpVideoPagingVO pagingVO = new MiniHpVideoPagingVO(listCnt, curPage);//총 게시글수, 현재 페이지로 pagingVO 생성
		
		model.addAttribute("list",videoService.getAll(folderSerial, curPage, pagingVO.getPageSize()));//현재 페이지만큼만 가져옴
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("pagination",pagingVO);
		//--------------------------------------------------------------------------------------------------------------
		model.addAttribute("currentFolderName", videoService.getFolderName(folderSerial));
		model.addAttribute("currentFolderSerial", folderSerial);
		return "MiniHP/guestVideo";
	}
	
	// 방명록 -------------------------------------
	@GetMapping("/miniHpBookGuest.do")
	public String miniHpBook(int ownerSerial, Model model, HttpSession session,@RequestParam(defaultValue="1") int curPage) {
		System.out.println("방명록");
		
		model.addAttribute("ownerSerial",ownerSerial);
		//페이징처리-----------------------------------------------------------------------------------------------------
		int listCnt = bookService.countAll(ownerSerial);//총 게시글 수
		MiniHpBookPagingVO pagingVO = new MiniHpBookPagingVO(listCnt, curPage);//총 게시글수, 현재 페이지로 pagingVO 생성
		
		model.addAttribute("list",bookService.getAll(ownerSerial, curPage, pagingVO.getPageSize()));//현재 페이지만큼만 가져옴
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("pagination",pagingVO);
		//--------------------------------------------------------------------------------------------------------------
		return "MiniHP/guestBook";
	}
	@PostMapping("/miniHpBookGuest.do/{ownerSerial}/{content}")
	@ResponseBody
	public void miniHpVideoInsert(@PathVariable int ownerSerial,@PathVariable String content,HttpSession session) {
		MiniHpBookVO vo = new MiniHpBookVO();
		vo.setContent(content);
		
		//게스트 미니홈페이지에서
		//누구에게? -> 게스트 주인
		vo.setUserSerial(ownerSerial);
		
		//누가 -> 자기 자신
		int userSerial = Utils.getSessionUser(session);
		vo.setWriteUserSerial(userSerial);
		
		System.out.println(vo);
		int result = bookService.insert(vo);
		if(result>0) System.out.println("방명록 insert 성공!");
		else System.out.println("방명록 insert 실패!");
	}
}
