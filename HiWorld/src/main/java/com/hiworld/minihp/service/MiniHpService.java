package com.hiworld.minihp.service;

import com.hiworld.minihp.vo.MiniHP_ProfileVO;


public interface MiniHpService {
	
	/*미니홈피 프로필 존재 확인*/
	String checkProfile(String id);

	/*미니홈피 프로필 불러오기*/
	String getProfile(String id);
	
	/*미니홈피 프로필 작성*/ 
	int insertProfile(MiniHP_ProfileVO profileVO);

	/*미니홈피 프로필 수정*/
	int updateProfile(MiniHP_ProfileVO profileVO);
}
