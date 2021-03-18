package com.hiworld.minihp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHP_ProfileDAO;
import com.hiworld.minihp.vo.MiniHP_ProfileVO;

@Service("MiniHpProfileService")
public class MiniHpProfileServiceImpl implements MiniHpProfileService {
	
	@Autowired
	private MiniHP_ProfileDAO profileDAO;
	
	private MiniHP_ProfileVO profileVO;
	
	@Override
	public String checkProfile(String userId) {
		System.out.println("프로필 확인 서비스");
		String checkNumber = "0";
		profileVO = profileDAO.checkProfile(userId);
		
		if(profileVO != null) {
			checkNumber = "1";
		} else {
			checkNumber = "0";
		}
		return checkNumber;
	}
	
	@Override
	public String getProfile(String userId) {
		System.out.println("프로필 가져오기 서비스");
		System.out.println(userId);
		profileVO = profileDAO.getProfile(userId);
		String content = profileVO.getProfileContent();
		System.out.println(content);
		return content;
	}
	
	@Override
	public int insertProfile(MiniHP_ProfileVO profileVO) {
		System.out.println("프로필 작성 서비스");
		int checkNumber = profileDAO.insertProfile(profileVO);
		System.out.println(profileVO.getProfileContent());
		return checkNumber;
	}
	
	@Override
	public int updateProfile(MiniHP_ProfileVO profileVO) {
		System.out.println("프로필 수정 서비스");
		int checkNumber = profileDAO.updateProfile(profileVO);
		System.out.println(profileVO.getUserID());
		System.out.println(profileVO.getProfileContent());
		return checkNumber;
	}
}
