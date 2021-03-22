package com.hiworld.minihp.dao;

import org.springframework.stereotype.Repository;

import com.hiworld.minihp.vo.MiniHpIntroVO;

@Repository
public interface MiniHpIntroDAO {
	
	/*미니홈피 소개글 가져오기*/
	String getInfo(String UserID);
	
	/*미니홈피 소개글 수정*/
	void updateInfo(MiniHpIntroVO introVO);
	
	/*미니홈피 타이틀 가져오기*/
	String getTitle(String UserID);
	
	/*미니홈피 타이틀 수정*/
	void updateTitle(MiniHpIntroVO introVO);
}
