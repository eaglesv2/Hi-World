package com.hiworld.minihp.service;

import com.hiworld.minihp.vo.MiniHpIntroVO;

public interface MiniHpIntroService {
	
	/*유저의 미니홈피 소개글 가져오기*/
	String getIntroInfo(String UserID);
	
	/*유저의 미니홈피 소개글 수정*/
	void updateIntroInfo(MiniHpIntroVO introVO);
}
