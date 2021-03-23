package com.hiworld.minihp.service;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.vo.MiniHpIntroVO;

public interface MiniHpIntroService {
	
	/*유저의 미니홈피 소개글 가져오기*/
	String getIntroInfo(String UserID);
	
	/*유저의 미니홈피 소개글 수정*/
	void updateIntroInfo(MiniHpIntroVO introVO);
	
	/*유저의 미니홈피 타이틀 가져오기*/
	String getIntroTitle(sessionVO sessionVO);

	/*유저의 미니홈피 타이틀 수정*/
	void updateIntroTitle(MiniHpIntroVO introVO);
}
