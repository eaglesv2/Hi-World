package com.hiworld.minihp.dao;

import java.util.List;

import com.hiworld.minihp.vo.MiniHpBoardVO;
import com.hiworld.minihp.vo.MiniHpPictureVO;
import com.hiworld.minihp.vo.MiniHpVideoVO;

public interface MiniHpRightDAO {
	//게시판,사진첩,동영상에서 최신꺼 5개씩 가져옴
	List<MiniHpBoardVO> getBoardList(int userSerial);
	List<MiniHpPictureVO> getPictureList(int userSerial);
	List<MiniHpVideoVO> getVideoList(int userSerial);
	
	//게시판,사진첩,동영상 오늘 올린 갯수/총 갯수
	int countBoard();
}
