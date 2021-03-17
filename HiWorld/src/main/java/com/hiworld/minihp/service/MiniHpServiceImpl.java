/*package com.hiworld.minihp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hiworld.minihp.dao.MiniHP_ProfileDAO;
import com.hiworld.minihp.dao.MiniHpDAO;
import com.hiworld.minihp.vo.MiniHP_ProfileVO;

@Service("MiniHpService")
@Transactional
public class MiniHpServiceImpl implements MiniHpService {
	
	@Autowired
	private MiniHpDAO dao;
	
	@Autowired
	private MiniHP_ProfileDAO profileDAO;
	
	@Autowired
	private MiniHP_ProfileVO profileVO;
	
	@Override
	public int checkProfile(String userId) {
		System.out.println("프로필 체크 서비스");
		int checkNumber = 0;
		profileVO = profileDAO.getProfile(userId);
		
		if(profileVO != null) {
			checkNumber = 1;
		} else {
			checkNumber = 0;
		}
		return checkNumber;
	}
	
	@Override
	public String getProfile(String userId) {
		System.out.println("프로필 가져오기 서비스");
		profileVO = profileDAO.getProfile(userId);
		String content = profileVO.getContent();
		return content;
	}
	
	@Override
	public int insertProfile(MiniHP_ProfileVO profileVO) {
		System.out.println("프로필 작성 서비스");
		int checkNumber = profileDAO.insertProfile(profileVO);
		return checkNumber;
	}
	
	@Override
	public int updateProfile(MiniHP_ProfileVO profileVO) {
		System.out.println("프로필 수정 서비스");
		int checkNumber = profileDAO.updateProfile(profileVO);
		return checkNumber;
	}
}

*/