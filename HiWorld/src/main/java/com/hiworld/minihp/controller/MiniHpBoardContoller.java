package com.hiworld.minihp.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hiworld.minihp.service.MiniHpBoardService;
import com.hiworld.minihp.vo.MiniHPBoardFolderVO;
import com.hiworld.minihp.vo.MiniHpBoardVO;

@Controller
public class MiniHpBoardContoller {
	
	@Autowired
	private MiniHpBoardService service;
	
	//세션에서 현재 유저 정보 가져오기 메소드
	private int getSessionUser(HttpSession session) {
//		//세션에서 현재 유저 가져오기
//		sessionVO sessionUser = (sessionVO)session.getAttribute("sessionVO"); 
//		int userSerial = sessionUser.getUserSerial();
		//임시로 2로 지정
		int userSerial = 2;
		return userSerial;
	}
	// 파일명 중복방지 처리
    private String getUuidFileName(String originalFileName) {
    	 return UUID.randomUUID().toString() + "_" + originalFileName;
    }
	
	//게시판 사이드 부분
	@GetMapping("/MiniHpBoardSide.do")
	public String miniHpBoardSide(Model model, HttpSession session) {
		System.out.println("게시판 side");
		int userSerial = getSessionUser(session);
		
		model.addAttribute("folderList",service.getAllFolder(userSerial));
		return "MiniHP/MiniHP_Menu_Board_Side";
	}
	//폴더 추가
	@PostMapping("/MiniHpBoardSide.do")
	@ResponseBody
	public void addFolder(@RequestBody MiniHPBoardFolderVO vo, HttpSession session) {
		System.out.println("addFolder");
		
		int userSerial = getSessionUser(session);
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
	
	
	
	
	//게시판 메인 부분
	@GetMapping("/miniHpBoard.do")
	public String miniHpBoard(Model model, HttpSession session,@RequestParam(required=false) Integer folderSerial) {
		System.out.println("게시판 main");
		
		int userSerial = getSessionUser(session);
		if(folderSerial==null)
			folderSerial = service.getFirstFolderSerial(userSerial);
		
		model.addAttribute("list",service.getAll(folderSerial));
		
		model.addAttribute("currentFolderName", service.getFolderName(folderSerial));
		model.addAttribute("currentFolderSerial", folderSerial);
		return "MiniHP/MiniHP_Menu_Board";
	}
	//게시글 작성 화면
	@GetMapping("/MiniHpBoardInsert.do/{folderSerial}")
	public String miniHpBoardInsertPage(Model model,@PathVariable int folderSerial) {
		System.out.println("게시판 insert 화면");
		model.addAttribute("folderSerial",folderSerial);
		return "MiniHP/MiniHP_Menu_Board_Insert";
	}
	//게시글 저장 처리
	@PostMapping("/MiniHpBoardInsert.do")
	@ResponseBody
	public int miniHpBoardInsert(MultipartFile file1, MiniHpBoardVO vo, HttpServletRequest request,HttpSession session) {
		//파일 저장 로직
		//파일명 중복방지 처리
		if(!file1.isEmpty()) {
			String fileName = getUuidFileName(file1.getOriginalFilename());
		
			//업로드된 파일을 서버에 저장
			ServletContext ctx = request.getServletContext();//파일 경로 얻기 위한 객체
			String webPath = "/resources/upload";//웹상의 위치
			String realPath = ctx.getRealPath(webPath);//실제 위치
			
			//우선 해당 경로까지의 폴더가 있는지 체크, 없으면 만들어줌
			File savePath = new File(realPath);
			if(!savePath.exists())
				savePath.mkdirs();//s가 붙으면 mkdir -p 같은 효과
			//경로와 파일명 사이에 구분자가 필요,File.separator가 os마다 맞는 구분자를 넣어줌
			realPath += File.separator + fileName;
			//파일위치, 파일명 출력
			System.out.println("realPath: " + realPath);
			File saveFile = new File(realPath);
	
			//업로드된 파일을 서버 저장소에 저장하는 방법
			try {
				file1.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			vo.setFile(fileName);
		}
		vo.setUserSerial(getSessionUser(session));
		System.out.println(vo);
		int result = service.insert(vo);
		if(result>0) System.out.println("게시물 insert 성공!");
		else System.out.println("게시물 insert 실패!");
		
		return vo.getFolderSerial();//수정한 폴더 반환
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
