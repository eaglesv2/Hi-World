package com.hiworld.minihp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHpNeighborDAO;
import com.hiworld.minihp.dao.MiniHpNeighborListDAO;
import com.hiworld.minihp.vo.MiniHpNeighborListVO;
import com.hiworld.minihp.vo.MiniHpNeighborVO;

@Service
public class MiniHpNeighborListServiceImpl implements MiniHpNeighborListService {

	@Autowired
	private MiniHpNeighborListDAO neighborListDAO;
	
	@Autowired
	private MiniHpNeighborDAO neighborDAO;
	
	MiniHpNeighborListVO neighborListVO;
	
	MiniHpNeighborVO neighborVO;
	
	/*이웃 신청 정보 테이블에 저장*/
	@Override
	public void insertNeighborList(MiniHpNeighborListVO neighborListVO) {
		neighborListDAO.insertNeighborList(neighborListVO);
	}
	
	/*이웃 신청 목록 불러오기*/
	@Override
	public List<MiniHpNeighborListVO> getRegisterList(String UserID) {
		
		List<MiniHpNeighborListVO> list = neighborListDAO.getRegisterList(UserID);
		
		System.out.println(list);
		
		if(list.size() == 0) {
			list = null;
		}
		
		return list;
	}
	
	/*이웃 신청 정보 불러오기*/
	@Override
	public MiniHpNeighborListVO getRegisterCheck(String senderID, String receiverID) {
		
		neighborListVO = neighborListDAO.getData(senderID, receiverID);
		
		return neighborListVO;
	}
	
	/*이웃 신청 결과 처리*/
	@Override
	public void registerCheck_ok(int type, MiniHpNeighborVO nVO) {

		String senderID = nVO.getNeighborID1();
		String receiverID = nVO.getNeighborID2();
		switch(type) {
		case 0: //이웃 신청 거절
			neighborListDAO.deleteNeighborList(senderID, receiverID);
			break;
			
		case 1: //이웃 신청 수락
			neighborVO = neighborDAO.checkNeighbor(senderID, receiverID);
			if(neighborVO == null) {
				neighborDAO.insertNeighbor(nVO);
			}
			neighborListDAO.deleteNeighborList(senderID, receiverID);
			break;
		
		case 2: //이웃 신청 보류
			
			break;
		}
	}

}
