package com.hiworld.minihp.dao;

import java.util.List;

import com.hiworld.minihp.vo.MiniHPBoardFolderVO;
import com.hiworld.minihp.vo.MiniHpBoardVO;

public interface MiniHpBoardDAO {
	//폴더 부분
	//select all
	List<MiniHPBoardFolderVO> getAllFolder(int userSerial);
	//insert
	int addFolder(MiniHPBoardFolderVO vo);
	//delete
	int countInsideFolder(int serial);//삭제하고자 하는 폴더안에 게시글이 있는지 확인
	int deleteFolder(int serial);//없을 경우 삭제
	//update
	int updateFolder(MiniHPBoardFolderVO vo);
	
	
	// 게시판 관련--------------------------
	List<MiniHpBoardVO> getAll();
	MiniHpBoardVO get(int serial);
	int insert(MiniHpBoardVO vo);
	
}
