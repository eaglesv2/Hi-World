package com.hiworld.minihp.service;

import java.util.List;

import com.hiworld.minihp.vo.MiniHPBoardFolderVO;
import com.hiworld.minihp.vo.MiniHpBoardReplyVO;
import com.hiworld.minihp.vo.MiniHpBoardVO;

public interface MiniHpBoardService {
	//폴더 관련-------
	List<MiniHPBoardFolderVO> getAllFolder(int userSerial);
	int addFolder(MiniHPBoardFolderVO vo);
	int deleteFolder(int serial);
	int updateFolder(MiniHPBoardFolderVO vo);
	
	//게시판 관련---------------
	int getFirstFolderSerial(int userSerial);
	List<MiniHpBoardVO> getAll(Integer folderSerial, int page);
	String getFolderName(int folderSerial);
	//페이징처리
	int countInsideFolder(int serial);
	
	int insert(MiniHpBoardVO vo);
	
	MiniHpBoardVO get(int serial);
	//게시글 폴더 이동
	int updateBoardFolder(int boardSerial, int folderSerial);
	//delete
	int delete(int serial);
	//update
	int update(MiniHpBoardVO vo);
	
	//댓글
	//selectAll
	List<MiniHpBoardReplyVO> getAllReply(int boardSerial);
	//insert
	int insertReply(MiniHpBoardReplyVO vo);
	//delete
	int deleteReply(int serial);
	//update 
	int updateReply(int serial, String content);
	
}
