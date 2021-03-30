package com.hiworld.minihp.service;

import java.util.List;

import com.hiworld.minihp.vo.MiniHpNeighborListVO;
import com.hiworld.minihp.vo.MiniHpNeighborVO;

public interface MiniHpNeighborListService {
	
	/*이웃 신청 정보 테이블에 저장*/
	void insertNeighborList(MiniHpNeighborListVO neighborListVO);
	
	/*이웃 신청 목록 불러오기*/
	List<MiniHpNeighborListVO> getRegisterList(String userID);
	
	/*이웃 신청 정보 불러오기*/
	MiniHpNeighborListVO getRegisterCheck(String senderID, String receiverID);

}
