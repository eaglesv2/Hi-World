package com.hiworld.minihp.dao;

import java.util.List;

import com.hiworld.minihp.vo.MiniHPBoardFolderVO;
import com.hiworld.minihp.vo.MiniHpBoardVO;

public interface MiniHpBoardDAO {
	List<MiniHpBoardVO> getAll();
	MiniHpBoardVO get(int serial);
	int insert(MiniHpBoardVO vo);
	
	//폴더 부분
	List<MiniHPBoardFolderVO> getAllFolder();
	int addFolder(MiniHPBoardFolderVO vo);
	int deleteFolder(int serial);
	int moveAllBoard(int serial);//폴더 삭제시 해당 폴더 게시물 전부 "기본 폴더"로 이동
	int updateFolder(int serial, String folderName);
}
