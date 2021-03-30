package com.hiworld.minihp.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.hiworld.minihp.vo.MiniHpNeighborVO;

@Repository
public interface MiniHpNeighborDAO {
	
	/*이웃 중복체크*/
	MiniHpNeighborVO checkNeighbor(String senderID, String receiverID);
	
	/*이웃 수락시 이웃 정보 입력*/
	void insertNeighbor(MiniHpNeighborVO neighborVO);
	
	/*이웃 목록 불러오기*/
	List<MiniHpNeighborVO> getNeighborList(String userID);
}
