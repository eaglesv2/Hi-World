package com.hiworld.minihp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.vo.MiniHpIntroVO;

@Service
public class MiniHpIntroServiceImpl implements MiniHpIntroService {

	@Autowired
	private MiniHpIntroDAO introDAO;
	
	
	@Override
	public String getIntroInfo(String UserID) {
		String info = "";
		
		if(introDAO.getInfo(UserID).equals("")) {
			info = "소개글이 없습니다";
		} else {
			info = introDAO.getInfo(UserID);
		}
		
		return info;
	}


	@Override
	public void updateIntroInfo(MiniHpIntroVO introVO) {

		introDAO.updateInfo(introVO);
		
	}

}
