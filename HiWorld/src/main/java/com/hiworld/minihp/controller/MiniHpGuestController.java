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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.dao.MiniHpDAO;
import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.dao.MiniHpNeighborDAO;
import com.hiworld.minihp.service.MiniHpBoardService;
import com.hiworld.minihp.service.MiniHpBookService;
import com.hiworld.minihp.service.MiniHpIntroService;
import com.hiworld.minihp.service.MiniHpItemService;
import com.hiworld.minihp.service.MiniHpNeighborService;
import com.hiworld.minihp.service.MiniHpPictureService;
import com.hiworld.minihp.service.MiniHpRightService;
import com.hiworld.minihp.service.MiniHpSettingService;
import com.hiworld.minihp.service.MiniHpVideoService;
import com.hiworld.minihp.vo.MiniHpBoardPagingVO;
import com.hiworld.minihp.vo.MiniHpBookPagingVO;
import com.hiworld.minihp.vo.MiniHpBookVO;
import com.hiworld.minihp.vo.MiniHpIntroVO;
import com.hiworld.minihp.vo.MiniHpMusicVO;
import com.hiworld.minihp.vo.MiniHpNeiWordVO;
import com.hiworld.minihp.vo.MiniHpNeighborViewVO;
import com.hiworld.minihp.vo.MiniHpOwnerVO;
import com.hiworld.minihp.vo.MiniHpPicturePagingVO;
import com.hiworld.minihp.vo.MiniHpSelectedItemVO;
import com.hiworld.minihp.vo.MiniHpUserMenuVO;
import com.hiworld.minihp.vo.MiniHpVideoPagingVO;
import com.hiworld.minihp.vo.MiniHpVisitorVO;

@Controller
public class MiniHpGuestController {
	@Autowired
	MiniHpRightService rightService;
	@Autowired
	private MiniHpPictureService pictureService;
	@Autowired
	private MiniHpBoardService boardService;
	@Autowired
	private MiniHpVideoService videoService;
	@Autowired
	private MiniHpBookService bookService;
	@Autowired
	MiniHpNeighborDAO neighborDAO;
	@Autowired
	MiniHpItemService itemService;
	
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
	
	/*????????? ???????????? ??????*/
	@GetMapping("/miniHp_guestHome.do")
	public String homeGuest(HttpServletRequest request, Model model) {
		System.out.println("???????????? ????????? ????????????");
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO)session.getAttribute("sessionVO");
		int OwnerSerial = Integer.parseInt(request.getParameter("OwnerSerial"));
		
		int GuestSerial = vo.getUserSerial();
		
		visitorVO = new MiniHpVisitorVO();
		visitorVO.setOwnerSerial(OwnerSerial);
		visitorVO.setGuestSerial(GuestSerial);
		
		introService.todayCheck(visitorVO);
		introVO = introDAO.getData(OwnerSerial);
		List<MiniHpMusicVO> playList = itemService.getPlayList(OwnerSerial);
		int playListSize = playList.size();
		
		model.addAttribute("OwnerSerial", OwnerSerial);
		model.addAttribute("ownerintroVO", introVO);
		//???????????? ??????
		model.addAttribute("playList", playList);
		model.addAttribute("playListSize", playListSize);
		//???????????? ???????????? ??????
		model.addAttribute("skin", itemService.getUsingSkin(OwnerSerial));

		return "MiniHP/MiniHP_Home_Guest";
	}
	/*????????? ???????????? ????????????*/
	@GetMapping("/miniHp_rightGuestMenu.do")
	public String rightGuestMenu(HttpServletRequest request, Model model) {
		System.out.println("????????? ?????? ????????????");
		int OwnerSerial = Integer.parseInt(request.getParameter("OwnerSerial"));
		System.out.println(OwnerSerial);
		menuVO = settingService.getMenuAvailable(OwnerSerial);
		/*introVO = introDAO.getData(OwnerID);*/
		
		model.addAttribute("OwnerSerial", OwnerSerial);
		model.addAttribute("ownermenuVO", menuVO);
		/*request.setAttribute("ownerintroVO", introVO);*/
		
		//???????????? ?????? ?????? ????????? ??????
		ownerVO = dao.getData(OwnerSerial);
		model.addAttribute("ownerSerial", ownerVO.getUserSerial());
		model.addAttribute("ownerID", ownerVO.getUserID());
		
		return "MiniHP/MiniHP_Right_Guest_Menu";
	}
	
	@GetMapping("/miniHp_leftGuest.do")
	public String leftGuest(HttpServletRequest request, Model model,HttpSession session) {
		int ownerSerial = Integer.parseInt(request.getParameter("OwnerSerial"));
		introVO = introDAO.getData(ownerSerial);
		ownerVO = dao.getData(ownerSerial);
		List<MiniHpNeighborViewVO> neighborList = neighborService.getNeighborList(ownerSerial); //?????? ?????? ????????????
		
		if(neighborList == null) {
			model.addAttribute("listLength", 0);
		} else {
			model.addAttribute("listLength", neighborList.size());
		}
		
		model.addAttribute("ownerintroVO", introVO);
		model.addAttribute("ownerVO", ownerVO);
		model.addAttribute("neighborList", neighborList);
		
		//?????? ?????? ??????
		int isNeighbor = 0;
		int userSerial = Utils.getSessionUser(session);
		if(neighborDAO.checkNeighbor(userSerial, ownerSerial) != null) {
			isNeighbor = 1;
		}
		model.addAttribute("isNeighbor", isNeighbor);
		//?????? ???????????? ?????? ?????? ??????(???????????? ???????????? ????????? ?????? ??????)
		model.addAttribute("userSerial", userSerial);
		
		return "MiniHP/MiniHP_Left_Guest";
	}
	@ResponseBody
	@GetMapping("/MiniHpGuestDefaultSide.do")
	public String miniHpGuestDefaultSide(int OwnerSerial) {
		return "miniHp_leftGuest.do?OwnerSerial="+OwnerSerial;
	}
	
	@GetMapping("/miniHp_rightGuest.do")
	public String rightGuest(Model model, HttpSession session, HttpServletRequest request) {
		//?????? ????????? ??????
		
		int ownerSerial = Integer.parseInt(request.getParameter("OwnerSerial"));
		MiniHpSelectedItemVO ownerItemList = itemService.getItemList(ownerSerial);
		model.addAttribute("ownerSerial", ownerSerial);
		model.addAttribute("ownerItemList", ownerItemList);
		
		model.addAttribute("latestPosts", rightService.getLatestPosts(ownerSerial));
		
		model.addAttribute("today",rightService.countToday(ownerSerial));
		menuVO = settingService.getMenuAvailable(ownerSerial);
		model.addAttribute("ownermenuVO", menuVO);
		
		//?????? ?????? ??????
		int isNeighbor = 0;
		int userSerial = Utils.getSessionUser(session);
		if(neighborDAO.checkNeighbor(userSerial, ownerSerial)!=null)
			isNeighbor = 1;
		model.addAttribute("isNeighbor", isNeighbor);
		
		return "MiniHP/MiniHP_Right_Guest";
	}
	//?????????
	@GetMapping("/MiniHP_NeiWordGuest.do")
	public String selectAllNeiWord(int ownerSerial, Model model) {
		System.out.println("MiniHP_NeiWordGuest.do");
		model.addAttribute("list", rightService.getAll(ownerSerial));
		return "MiniHP/guestNeiWord";
	}
	//insert
	@PostMapping("/MiniHP_NeiWordGuest.do/{content}/{ownerSerial}")
	@ResponseBody
	public void insertNeiWord(@PathVariable String content,@PathVariable int ownerSerial,HttpSession session) {
		System.out.println("MiniHP_NeiWord.do");
		MiniHpNeiWordVO vo = new MiniHpNeiWordVO();
		vo.setContent(content);
		int userSerial = Utils.getSessionUser(session);
		vo.setUserSerial(ownerSerial);
		vo.setWriteUserSerial(userSerial);
		
		int result = rightService.insert(vo);
		if(result>0) System.out.println("insert ??????!");
		else System.out.println("insert ??????!");
	}
	
	/*????????? ???????????? ?????? ??????*/
	@GetMapping("/miniHp_topGuest.do")
	public String topGuest(HttpServletRequest request, Model model) {
		int ownerSerial = Integer.parseInt(request.getParameter("OwnerSerial"));
		/*introVO = introDAO.getData(OwnerID);*/
		
		model.addAttribute("ownerSerial", ownerSerial);
		/*model.addAttribute("ownerintroVO", introVO);*/
		
		return "MiniHP/MiniHP_TopGuest";
	}
	
	// ????????? -------------------------------------
	@GetMapping("/miniHpProfileGuest.do")
	public String miniHpProfileGuest(String ownerID, Model model) {
		model.addAttribute("ownerID", ownerID);
		return "MiniHP/guestProfile";
	}
	
	// ????????? -------------------------------------
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
		if(folderSerial==null)
			folderSerial = pictureService.getFirstFolderSerial(ownerSerial);
		
		//?????? ?????? ??????
		int scope = pictureService.getFolderScope(folderSerial);
		
		//????????? ??? ??????
		if(scope==0)
			return "MiniHP/scopePrivatePage";
		
		//?????? ?????? ??????
		int isNeighbor = 0;
		int userSerial = Utils.getSessionUser(session);
		if(neighborDAO.checkNeighbor(userSerial, ownerSerial)!=null)
			isNeighbor = 1;
		
		if(scope==1 && isNeighbor==0)
			return "MiniHP/scopeNeighborPage";
		
		//?????? ?????? ??????
		model.addAttribute("isNeighbor", isNeighbor);
		
		model.addAttribute("ownerSerial",ownerSerial);
		
		//???????????????-----------------------------------------------------------------------------------------------------
		int listCnt = pictureService.countInsideFolder(folderSerial);//??? ????????? ???
		MiniHpPicturePagingVO pagingVO = new MiniHpPicturePagingVO(listCnt, curPage);//??? ????????????, ?????? ???????????? pagingVO ??????
		
		model.addAttribute("list",pictureService.getAll(folderSerial, curPage, pagingVO.getPageSize()));//?????? ?????????????????? ?????????
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("pagination",pagingVO);
		//--------------------------------------------------------------------------------------------------------------
		model.addAttribute("currentFolderName", pictureService.getFolderName(folderSerial));
		model.addAttribute("currentFolderSerial", folderSerial);
		return "MiniHP/guestPicture";
	}
	//?????????
	@GetMapping("/scrapePicture.do")
	public String scrapePicturePage(int pictureSerial, Model model, HttpSession session) {
		//????????? ?????? ?????? ????????????
		int userSerial = Utils.getSessionUser(session);
		model.addAttribute("folderList",pictureService.getAllFolder(userSerial));
		
		//???????????? ?????????
		model.addAttribute("pictureSerial", pictureSerial);
		return "MiniHP/scrapePicture";
	}
	@PostMapping("/scrapePicture.do/{pictureSerial}/{folderSerial}")
	@ResponseBody
	public void scrapePicture(@PathVariable int pictureSerial,@PathVariable int folderSerial,HttpServletRequest request) {
		pictureService.scrapePicture(pictureSerial, folderSerial,request);
	}
	
	// ????????? -------------------------------------
	@GetMapping("/MiniHpBoardGuestSide.do")
	public String miniHpBoardSide(int ownerSerial, Model model, HttpSession session) {
		System.out.println("????????? side");
		model.addAttribute("ownerSerial",ownerSerial);
		model.addAttribute("folderList",boardService.getAllFolder(ownerSerial));
		return "MiniHP/guestBoard_Side";
	}
	@GetMapping("/miniHpBoardGuest.do")
	public String miniHpBoard(int ownerSerial, Model model, HttpSession session,@RequestParam(required=false) Integer folderSerial,@RequestParam(defaultValue="1") int curPage) {
		System.out.println("????????? main");
		if(folderSerial==null)
			folderSerial = boardService.getFirstFolderSerial(ownerSerial);
		
		//?????? ?????? ??????
		int scope = boardService.getFolderScope(folderSerial);
		
		//????????? ??? ??????
		if(scope==0)
			return "MiniHP/scopePrivatePage";
		
		//?????? ?????? ??????
		int isNeighbor = 0;
		int userSerial = Utils.getSessionUser(session);
		if(neighborDAO.checkNeighbor(userSerial, ownerSerial)!=null)
			isNeighbor = 1;
		
		if(scope==1 && isNeighbor==0)
			return "MiniHP/scopeNeighborPage";
		
		
		model.addAttribute("ownerSerial",ownerSerial);
		
		//?????? ????????? ??????
		int listCnt = boardService.countInsideFolder(folderSerial);
		MiniHpBoardPagingVO pagingVO = new MiniHpBoardPagingVO(listCnt, curPage);
		
		model.addAttribute("list",boardService.getAll(folderSerial, curPage, pagingVO.getPageSize()));
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("pagination",pagingVO);
		
		model.addAttribute("currentFolderName", boardService.getFolderName(folderSerial));
		model.addAttribute("currentFolderSerial", folderSerial);
		return "MiniHP/guestBoard";
	}
	//????????? ????????? ??????
	@GetMapping("/MiniHpBoardGuestDetail.do")
	public String miniHpBoardDetail(int ownerSerial, int serial, Model model, HttpSession session) {
		System.out.println("????????? detail ??????");
		model.addAttribute("ownerSerial",ownerSerial);
		model.addAttribute("board",boardService.get(serial));
		boardService.updateHit(serial);
		//?????? ??????
		model.addAttribute("replyList", boardService.getAllReply(serial));
		
		//?????? ?????? ??????
		int isNeighbor = 0;
		int userSerial = Utils.getSessionUser(session);
		if(neighborDAO.checkNeighbor(userSerial, ownerSerial)!=null)
			isNeighbor = 1;
		
		//?????? ?????? ??????
		model.addAttribute("isNeighbor", isNeighbor);
		return "MiniHP/guestBoard_Detail";
	}
	//?????????
	@GetMapping("/scrapeBoard.do")
	public String scrapeBoardPage(int boardSerial, Model model, HttpSession session) {
		//????????? ?????? ?????? ????????????
		int userSerial = Utils.getSessionUser(session);
		model.addAttribute("folderList",boardService.getAllFolder(userSerial));
		
		//???????????? ?????????
		model.addAttribute("boardSerial", boardSerial);
		return "MiniHP/scrapeBoard";
	}
	@PostMapping("/scrapeBoard.do/{boardSerial}/{folderSerial}")
	@ResponseBody
	public void scrapeBoard(@PathVariable int boardSerial,@PathVariable int folderSerial,HttpServletRequest request) {
		boardService.scrapeBoard(boardSerial, folderSerial,request);
	}
	
	// ????????? -------------------------------------
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
		if(folderSerial==null)
			folderSerial = videoService.getFirstFolderSerial(ownerSerial);
		
		//?????? ?????? ??????
		int scope = videoService.getFolderScope(folderSerial);
		
		//????????? ??? ??????
		if(scope==0)
			return "MiniHP/scopePrivatePage";
		
		//?????? ?????? ??????
		int isNeighbor = 0;
		int userSerial = Utils.getSessionUser(session);
		if(neighborDAO.checkNeighbor(userSerial, ownerSerial)!=null)
			isNeighbor = 1;
		
		if(scope==1 && isNeighbor==0)
			return "MiniHP/scopeNeighborPage";
		
		//?????? ?????? ??????
		model.addAttribute("isNeighbor", isNeighbor);
		
		model.addAttribute("ownerSerial",ownerSerial);
		
		//???????????????-----------------------------------------------------------------------------------------------------
		int listCnt = videoService.countInsideFolder(folderSerial);//??? ????????? ???
		MiniHpVideoPagingVO pagingVO = new MiniHpVideoPagingVO(listCnt, curPage);//??? ????????????, ?????? ???????????? pagingVO ??????
		
		model.addAttribute("list",videoService.getAll(folderSerial, curPage, pagingVO.getPageSize()));//?????? ?????????????????? ?????????
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("pagination",pagingVO);
		//--------------------------------------------------------------------------------------------------------------
		model.addAttribute("currentFolderName", videoService.getFolderName(folderSerial));
		model.addAttribute("currentFolderSerial", folderSerial);
		return "MiniHP/guestVideo";
	}
	//?????????
	@GetMapping("/scrapeVideo.do")
	public String scrapeVideoPage(int videoSerial, Model model, HttpSession session) {
		//????????? ?????? ?????? ????????????
		int userSerial = Utils.getSessionUser(session);
		model.addAttribute("folderList",videoService.getAllFolder(userSerial));
		
		//???????????? ?????????
		model.addAttribute("videoSerial", videoSerial);
		return "MiniHP/scrapeVideo";
	}
	@PostMapping("/scrapeVideo.do/{videoSerial}/{folderSerial}")
	@ResponseBody
	public void scrapeVideo(@PathVariable int videoSerial,@PathVariable int folderSerial,HttpServletRequest request) {
		videoService.scrapeVideo(videoSerial, folderSerial,request);
	}
	
	// ????????? -------------------------------------
	@GetMapping("/miniHpBookGuest.do")
	public String miniHpBook(int ownerSerial, Model model, HttpSession session,@RequestParam(defaultValue="1") int curPage) {
		System.out.println("?????????");
		
		int userSerial = Utils.getSessionUser(session);
		//?????? ???????????? ?????? ?????????
		model.addAttribute("writerMiniMe", bookService.getMiniMe(userSerial));
		
		model.addAttribute("ownerSerial",ownerSerial);
		//???????????????-----------------------------------------------------------------------------------------------------
		int listCnt = bookService.countAll(ownerSerial);//??? ????????? ???
		MiniHpBookPagingVO pagingVO = new MiniHpBookPagingVO(listCnt, curPage);//??? ????????????, ?????? ???????????? pagingVO ??????
		
		model.addAttribute("list",bookService.getAll(ownerSerial, curPage, pagingVO.getPageSize()));//?????? ?????????????????? ?????????
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("pagination",pagingVO);
		//--------------------------------------------------------------------------------------------------------------
		return "MiniHP/guestBook";
	}
	@PostMapping("/miniHpBookGuest.do/{ownerSerial}/{content}/{isSecret}")
	@ResponseBody
	public void miniHpVideoInsert(@PathVariable int ownerSerial,@PathVariable String content,@PathVariable int isSecret,HttpSession session) {
		MiniHpBookVO vo = new MiniHpBookVO();
		vo.setContent(content);
		vo.setIsSecret(isSecret);
		
		//????????? ????????????????????????
		//????????????? -> ????????? ??????
		vo.setUserSerial(ownerSerial);
		
		//?????? -> ?????? ??????
		int userSerial = Utils.getSessionUser(session);
		vo.setWriteUserSerial(userSerial);
		
		System.out.println(vo);
		int result = bookService.insert(vo);
		if(result>0) System.out.println("????????? insert ??????!");
		else System.out.println("????????? insert ??????!");
	}
}
