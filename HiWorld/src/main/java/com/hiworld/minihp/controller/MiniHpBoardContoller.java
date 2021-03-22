package com.hiworld.minihp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.minihp.service.MiniHpBoardService;
import com.hiworld.minihp.vo.MiniHPBoardFolderVO;
import com.hiworld.minihp.vo.MiniHpBoardVO;

@Controller
public class MiniHpBoardContoller {
	
	@Autowired
	private MiniHpBoardService service;
	//게시판 메인 부분
	@GetMapping("/miniHpBoard.do")
	public String miniHpBoard(String menu, Model model) {
		System.out.println("게시판 main");
		
		
		
		model.addAttribute("list",service.getAll());
		return "MiniHP/MiniHP_Menu_Board";
	}
	//게시판 사이드 부분
	@GetMapping("/MiniHpBoardSide.do")
	public String miniHpBoardSide(Model model, HttpSession session) {
		System.out.println("게시판 side");
		//세션 관련 임시 보류, 일단 2로 통일
		//int userSerial = (Integer)session.getAttribute("UserSerial");
		int userSerial = 2;
		model.addAttribute("folderList",service.getAllFolder(userSerial));
		return "MiniHP/MiniHP_Menu_Board_Side";
	}
	//폴더 추가
	@PostMapping("/MiniHpBoardSide.do")
	@ResponseBody
	public void addFolder(@RequestBody MiniHPBoardFolderVO vo) {
		System.out.println("addFolder");
		
		//세션에서 현재 유저 가져오기(일단 2로 고정)
		int userSerial = 2;
		vo.setUserSerial(userSerial);
		
		System.out.println(vo);
		int result = service.addFolder(vo);
		if(result>0) System.out.println("폴더 등록 성공!");
		else System.out.println("폴더 등록 실패!");
	}
	//폴더 삭제
	@DeleteMapping("/MiniHpBoardSide.do/{serial}")
	@ResponseBody
	public String deleteFolder(@PathVariable int serial) {
		System.out.println("deleteFolder");
		System.out.println(serial);
		int result = service.deleteFolder(serial);
		if(result>0) return ("폴더 삭제 성공!");
		else return ("폴더 삭제 실패, 빈 폴더만 삭제할 수 있습니다.");
	}
	//폴더 수정
	@PutMapping("/MiniHpBoardSide.do/{serial}/{folderName}/{scope}")
	@ResponseBody
	public void updateFolder(@PathVariable int serial,@PathVariable String folderName,@PathVariable int scope) {
		System.out.println("updateFolder");
		MiniHPBoardFolderVO vo = new MiniHPBoardFolderVO();
		vo.setSerial(serial);
		vo.setFolderName(folderName);
		vo.setScope(scope);
		System.out.println(vo);
		
		int result = service.updateFolder(vo);
		if(result>0) System.out.println("폴더 수정 성공!");
		else System.out.println("폴더 수정 실패!");
	}
	
	//게시글 작성 화면
	@GetMapping("/MiniHpBoardInsert.do")
	public String miniHpBoardInsertPage(Model model) {
		System.out.println("게시판 insert 화면");
		return "MiniHP/MiniHP_Menu_Board_Insert";
	}
	//게시글 저장 처리
	@PostMapping("/MiniHpBoardInsert.do")
	@ResponseBody
	public void miniHpBoardInsert(@RequestBody MiniHpBoardVO vo) {
		System.out.println("게시판 insert");
		System.out.println(vo);
		int result = service.insert(vo);
		if(result>0) System.out.println("게시글 등록 성공!");
		else System.out.println("게시글 등록 실패!");
	}
	//자세한 페이지 이동
	@GetMapping("/MiniHpBoardDetail.do")
	public String miniHpBoardDetail(int serial, Model model) {
		System.out.println("게시판 detail 화면");
		System.out.println(serial);
		model.addAttribute("board",service.get(serial));
		return "MiniHP/MiniHP_Menu_Board_Detail";
	}
	
}
