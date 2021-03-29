package com.hiworld.minihp.dao;


import org.springframework.stereotype.Repository;

import com.hiworld.minihp.vo.MiniHpNeighborVO;

@Repository
public interface MiniHpNeighborDAO {
	
	/*이웃 중복체크*/
	MiniHpNeighborVO checkNeighbor(String senderID, String receiverID);
	
	/*이웃 수락시 이웃 정보 입력*/
	void insertNeighbor(MiniHpNeighborVO neighborVO);
}
