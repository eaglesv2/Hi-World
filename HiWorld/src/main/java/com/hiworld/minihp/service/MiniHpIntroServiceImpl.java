package com.hiworld.minihp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.vo.MiniHpIntroVO;

@Service
public class MiniHpIntroServiceImpl implements MiniHpIntroService {

	@Autowired
	private MiniHpIntroDAO introDAO;
	
	@Override
	public String getIntroInfo(String UserID) {
		System.out.println("미니홈피 인트로 가져오기 서비스");
		String info = "";
		
		if(introDAO.getInfo(UserID) == null) {
			info = "소개글이 없습니다";
		} else {
			info = introDAO.getInfo(UserID);
		}
		
		System.out.println(info);
		
		return info;
	}

	@Override
	public void updateIntroInfo(MiniHpIntroVO introVO) {
		System.out.println("미니홈피 인트로 수정 서비스");
		introDAO.updateInfo(introVO);
	}
	
	@Override
	public String getIntroTitle(sessionVO sessionVO) {
		System.out.println("미니홈피 타이틀 가져오기 서비스");
		String title = "";
		String UserID = sessionVO.getUserID();
		
		if(introDAO.getTitle(UserID) == null) {
			title = sessionVO.getUserName() + "님의 미니홈피";
		} else {
			title = introDAO.getTitle(UserID);
		}
		
		System.out.println(title);
		
		return title;
	}
	
	@Override
	public void updateIntroTitle(MiniHpIntroVO introVO) {
		System.out.println("미니홈피 타이틀 수정 서비스");
		introDAO.updateTitle(introVO);
	}
}
