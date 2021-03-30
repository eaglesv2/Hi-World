package com.hiworld.minihp.dao;

import java.util.ArrayList;
import java.util.Map;

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
	
	/*미니홈피 프로필 사진 가져오기*/
	Map<String, Object> getPicture(String UserID);
	
	/*미니홈피 프로필 사진 수정*/
	void updatePicture(MiniHpIntroVO introVO);
	
	/*미니홈피 세팅 정보 가져오기*/
	MiniHpIntroVO getData(String UserID);
	
	/*미니홈피 오늘 방문자 수 가져오기*/
	int getToday(String UserID);
	
	/*미니홈피 오늘 방문자수 카운트*/
	void updateToday(String UserID);
	
	/*미니홈피 전체 방문자 수 가져오기*/
	int getTotal(String UserID);
	
	/*미니홈피 누적 방문자수 카운트*/
	void updateTotal(String UserID);
	
	/*전체 정보 가져오기*/
	ArrayList<MiniHpIntroVO> getAllNeighbor(String UserID);
}
