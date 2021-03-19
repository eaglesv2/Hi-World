package com.hiworld.minihp.dao;

import com.hiworld.minihp.vo.MiniHpIntroVO;

public interface MiniHpIntroDAO {
	
	/*미니홈피 소개글 가져오기*/
	String getInfo(String userID);
	
	/*미니홈피 소개글 수정*/
	void updateInfo(MiniHpIntroVO introVO);

}
