package com.hiworld.minihp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hiworld.minihp.vo.MiniHpNeighborListVO;

@Repository
public interface MiniHpNeighborListDAO {

	/*이웃 신청시 신청 정보 입력*/
	void insertNeighborList(MiniHpNeighborListVO neighborListVO);
	
	/*이웃 신청 목록 불러오기*/
	List<MiniHpNeighborListVO> getRegisterList(String UserID);
	
	/*이웃 신청 정보 불러오기*/
	MiniHpNeighborListVO getData(String senderID, String receiverID);
	
	/*이웃 신청 수락 or 거절 시 신청 정보 삭제*/
	void deleteNeighborList(String senderID, String receiverID);
}
