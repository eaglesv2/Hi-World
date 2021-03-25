package com.hiworld.minihp.service;

import java.util.List;

import com.hiworld.minihp.vo.MiniHPBoardFolderVO;
import com.hiworld.minihp.vo.MiniHpBoardVO;

public interface MiniHpBoardService {
	//폴더 관련-------
	List<MiniHPBoardFolderVO> getAllFolder(int userSerial);
	int addFolder(MiniHPBoardFolderVO vo);
	int deleteFolder(int serial);
	int updateFolder(MiniHPBoardFolderVO vo);
	
	//게시판 관련---------------
	int getFirstFolderSerial(int userSerial);
	List<MiniHpBoardVO> getAll(Integer folderSerial);
	String getFolderName(int folderSerial);
	
	int insert(MiniHpBoardVO vo);
	
	MiniHpBoardVO get(int serial);
	//게시글 폴더 이동
	int updateBoardFolder(int boardSerial, int folderSerial);
	//delete
	int delete(int serial);
	//update
	int update(MiniHpBoardVO vo);
}
