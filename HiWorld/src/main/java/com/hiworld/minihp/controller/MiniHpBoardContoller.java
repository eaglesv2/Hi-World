package com.hiworld.minihp.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.hiworld.minihp.vo.MiniHpBoardPagingVO;
import com.hiworld.minihp.vo.MiniHpBoardReplyVO;
import com.hiworld.minihp.vo.MiniHpBoardVO;

@Controller
public class MiniHpBoardContoller {
	
	@Autowired
	private MiniHpBoardService service;
	
	//-----------------------------------------공통--------------------------------------------------------
	//세션에서 현재 유저 정보 가져오기 메소드
	private int getSessionUser(HttpSession session) {
//		//세션에서 현재 유저 가져오기
//		sessionVO sessionUser = (sessionVO)session.getAttribute("sessionVO"); 
//		int userSerial = sessionUser.getUserSerial();
		//임시로 2로 지정
		int userSerial = 7;
		return userSerial;
	}
	// 파일명 중복방지 처리
    private String getUuidFileName(String originalFileName) {
    	 return UUID.randomUUID().toString() + "_" + originalFileName;
    }
    //파일 다운로드 처리
	@GetMapping("/download.do")
	@ResponseBody
	private void download(String fileName, HttpServletRequest request, HttpServletResponse response) {
	    // 파일 업로드된 경로
	    String savePath = request.getRealPath("/resources/upload/");
	    
		File file = new File(savePath+fileName);
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		try {
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			sos = response.getOutputStream();
			String reFilename = "";
			boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1
					|| request.getHeader("user-agent").indexOf("Trident") != -1;
			if (isMSIE) {
				reFilename = URLEncoder.encode(fileName, "utf-8");
				reFilename = reFilename.replaceAll("\\+", "%20");
			} else {
				reFilename = new String(fileName.getBytes("utf-8"), "ISO-8859-1");
			}
			response.setContentType("application/octet-stream;charset=utf-8");
			response.addHeader("Content-Disposition", "attachment;filename=\"" + reFilename + "\"");
			response.setContentLength((int) file.length());
			int read = 0;
			while ((read = bis.read()) != -1) {
				sos.write(read);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				sos.close();
				bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	//파일 저장 로직
	private void saveFile(MultipartFile file1,String fileName, HttpServletRequest request) {
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
	}
	//파일 삭제 로직
	private void deleteFile(String fileName,HttpServletRequest request) {
		String savePath = request.getRealPath("/resources/upload/");
	    
		File file = new File(savePath+fileName);
		if(file.exists()){
			file.delete();
			System.out.println("파일 삭제됨");
		}else{
			System.out.println("파일 없음");
		}
	}
	
	
	
	
	//-----------------------------------------폴더--------------------------------------------------------
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
	
	
	
	//-----------------------------------------게시글--------------------------------------------------------
	//게시판 메인 부분
	@GetMapping("/miniHpBoard.do")
	public String miniHpBoard(Model model, HttpSession session,@RequestParam(required=false) Integer folderSerial,@RequestParam(defaultValue="1") int curPage) {
		System.out.println("게시판 main");
		
		int userSerial = getSessionUser(session);
		if(folderSerial==null)
			folderSerial = service.getFirstFolderSerial(userSerial);
		
		//전체 리스트 개수
		int listCnt = service.countInsideFolder(folderSerial);
		MiniHpBoardPagingVO pagingVO = new MiniHpBoardPagingVO(listCnt, curPage);
		
		
		model.addAttribute("list",service.getAll(folderSerial, curPage));
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("pagination",pagingVO);
		
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
		if(!file1.isEmpty()) {
			//파일명 중복방지 처리
			String fileName = getUuidFileName(file1.getOriginalFilename());
			
			saveFile(file1, fileName, request);
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
		
		model.addAttribute("board",service.get(serial));
		
		//댓글 추가
		model.addAttribute("replyList", service.getAllReply(serial));
		return "MiniHP/MiniHP_Menu_Board_Detail";
	}
	//폴더 이동 popup
	@GetMapping("/updateBoardFolder.do")
	public String updateBoardFolderPopup(int serial, Model model, HttpSession session) {
		System.out.println("게시글 폴더 이동");
		model.addAttribute("serial", serial);
		
		int userSerial = getSessionUser(session);
		model.addAttribute("folderList",service.getAllFolder(userSerial));
		return "MiniHP/MiniHP_updateBoardFolder";
	}
	//폴더 이동
	@PutMapping("/updateBoardFolder.do/{boardSerial}/{folderSerial}")
	@ResponseBody
	public void updateBoardFolder(@PathVariable int boardSerial,@PathVariable int folderSerial) {
		service.updateBoardFolder(boardSerial, folderSerial);
	}
	
	//게시글 삭제
	@DeleteMapping("/miniHpBoard.do")
	@ResponseBody
	public void deleteBoard(int boardSerial, String fileName,HttpServletRequest request) {
		System.out.println("deleteBoard");
		int result = service.delete(boardSerial);
		if(result>0 && !fileName.equals(""))
			deleteFile(fileName, request);
	}
	//게시글 수정 화면
	@GetMapping("/MiniHpBoardUpdate.do")
	public String MiniHpBoardUpdatePage(int serial, Model model) {
		System.out.println("게시판 update 화면");
		
		model.addAttribute("board",service.get(serial));
		return "MiniHP/MiniHP_Menu_Board_update";
	}
	//게시글 수정
	@PostMapping("/MiniHpBoardUpdate.do")
	public String MiniHpBoardUpdate(MultipartFile file1, MiniHpBoardVO vo, HttpServletRequest request, Model model) {
		System.out.println("게시판 update");
		System.out.println(vo);
		
		if(file1==null) {//첨부파일 기존 파일 그대로
			service.update(vo);
		} else {
			if(file1.isEmpty()) {//첨부파일이 없을경우: 원래 없음 or 기존 첨부파일 삭제됨
				String fileName = vo.getFile();
				vo.setFile(null);//db에는 null로
				int result1 = service.update(vo);
				if(result1>0)
					deleteFile(fileName, request);//파일 삭제
			} else {//첨부파일 있을경우
				if("".equals(vo.getFile())) {//기존에 없음 -> 새로 추가
					String fileName = getUuidFileName(file1.getOriginalFilename());
					saveFile(file1, fileName, request);
					vo.setFile(fileName);
					service.update(vo);
				} else {//기존 파일 바뀜
					String oriFileName = vo.getFile();
					//1. 새로운 파일 저장
					String fileName = getUuidFileName(file1.getOriginalFilename());
					saveFile(file1, fileName, request);
					//2. db에 있는 파일명 수정
					vo.setFile(fileName);
					//3. update
					int result2 = service.update(vo);
					//4. 기존 파일 삭제
					if(result2>0)
						deleteFile(oriFileName, request);
				}
			}
		}
		
		model.addAttribute("board",service.get(vo.getBoardSerial()));
		return "MiniHP/MiniHP_Menu_Board_Detail";
	}
	
	//댓글
	//insert
	@PostMapping("/MiniHpBoardReply.do")
	@ResponseBody
	public void insertReply(@RequestBody MiniHpBoardReplyVO vo, HttpSession session) {
		System.out.println("insert reply");
		
		int userSerial = getSessionUser(session);
		vo.setUserSerial(userSerial);
		
		System.out.println(vo);
		int result = service.insertReply(vo);
		if(result>0) System.out.println("댓글 등록 성공!");
		else System.out.println("댓글 등록 실패!");
	}
	//delete
	@DeleteMapping("/MiniHpBoardReply.do/{serial}")
	@ResponseBody
	public String deleteReply(@PathVariable int serial) {
		System.out.println("deleteReply");
		
		int result = service.deleteReply(serial);
		if(result>0) return ("댓글 삭제 성공!");
		else return ("댓글 삭제 실패");
	}
	//update
	@PutMapping("/MiniHpBoardReply.do/{serial}/{content}")
	@ResponseBody
	public void updateReply(@PathVariable int serial,@PathVariable String content) {
		System.out.println("updateReply");
		
		int result = service.updateReply(serial, content);
		if(result>0) System.out.println("댓글 수정 성공!");
		else System.out.println("댓글 수정 실패!");
	}
}
