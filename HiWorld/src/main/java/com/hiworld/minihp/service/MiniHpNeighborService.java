package com.hiworld.minihp.service;

import java.util.List;

import com.hiworld.minihp.vo.MiniHpNeighborVO;
import com.hiworld.minihp.vo.MiniHpNeighborViewVO;

public interface MiniHpNeighborService {
	
	/*이웃 신청 결과*/
	void registerCheck_ok(int type, MiniHpNeighborVO neighborVO);
	
	/*이웃 목록 불러오기*/
	List<MiniHpNeighborViewVO> getNeighborList(String UserID);
}
