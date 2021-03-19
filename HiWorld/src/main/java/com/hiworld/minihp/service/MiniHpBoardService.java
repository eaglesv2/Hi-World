package com.hiworld.minihp.service;

import java.util.List;

import com.hiworld.minihp.vo.MiniHPBoardFolderVO;
import com.hiworld.minihp.vo.MiniHpBoardVO;

public interface MiniHpBoardService {
	List<MiniHpBoardVO> getAll();
	MiniHpBoardVO get(int serial);
	int insert(MiniHpBoardVO vo);
	
	//폴더 관련-------
	List<MiniHPBoardFolderVO> getAllFolder(int userSerial);
	int addFolder(MiniHPBoardFolderVO vo);
	int deleteFolder(int serial);
	int updateFolder(MiniHPBoardFolderVO vo);
}
