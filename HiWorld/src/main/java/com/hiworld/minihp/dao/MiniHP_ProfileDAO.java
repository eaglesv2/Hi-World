package com.hiworld.minihp.dao;

import org.springframework.stereotype.Repository;

import com.hiworld.minihp.vo.MiniHP_ProfileVO;

@Repository
public interface MiniHP_ProfileDAO {
	
	/*회원 미니홈피 프로필 불러오기*/
	MiniHP_ProfileVO getProfile(String userId);
	
	/*회원 미니홈피 프로필 수정*/
	int updateProfile(MiniHP_ProfileVO profileVO);
	
	/*회원 미니홈피 프로필 작성*/
	int insertProfile(MiniHP_ProfileVO profileVO); 
}
