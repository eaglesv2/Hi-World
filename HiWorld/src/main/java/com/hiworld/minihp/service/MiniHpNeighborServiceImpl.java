package com.hiworld.minihp.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHpNeighborDAO;
import com.hiworld.minihp.dao.MiniHpNeighborListDAO;
import com.hiworld.minihp.vo.MiniHpNeighborListVO;
import com.hiworld.minihp.vo.MiniHpNeighborVO;
import com.hiworld.minihp.vo.MiniHpNeighborViewVO;

@Service
public class MiniHpNeighborServiceImpl implements MiniHpNeighborService {

	@Autowired
	private MiniHpNeighborListDAO neighborListDAO;
	
	@Autowired
	private MiniHpNeighborDAO neighborDAO;
	
	MiniHpNeighborListVO neighborListVO;
	
	MiniHpNeighborVO neighborVO;
	
	MiniHpNeighborViewVO neighborViewVO = new MiniHpNeighborViewVO();

	
	/*이웃 신청 결과 처리*/
	@Override
	public void registerCheck_ok(int type, MiniHpNeighborVO nVO) {

		String senderID = nVO.getNeighborID1();
		String receiverID = nVO.getNeighborID2();
		System.out.println(senderID);
		System.out.println(receiverID);
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
	
	/*이웃명 수정 신청 결과 처리*/
	@Override
	public void updateCheck_ok(int type, MiniHpNeighborVO nVO) {
		// TODO Auto-generated method stub
		String senderID = nVO.getNeighborID1();
		String receiverID = nVO.getNeighborID2();
		String senderValue = nVO.getNeighborValue1();
		String receiverValue = nVO.getNeighborValue2();
		
		switch(type) {
		case 0: //이웃 신청 거절
			neighborListDAO.deleteNeighborList(senderID, receiverID);
			break;
			
		case 1: //이웃 신청 수락
			neighborVO = neighborDAO.checkNeighbor(senderID, receiverID);
			if(neighborVO.getNeighborID1().equals(senderID)) {
				neighborDAO.updateNeighbor(senderValue, receiverValue);
			} else {
				neighborDAO.updateNeighbor(receiverValue, senderValue);
			}
			neighborListDAO.deleteNeighborList(senderID, receiverID);
			break;
		
		case 2: //이웃 신청 보류
			
			break;
		}
	}
	
	/*이웃 목록 불러오기*/
	@SuppressWarnings("null")
	@Override
	public List<MiniHpNeighborViewVO> getNeighborList(String UserID) {
		
		List<MiniHpNeighborVO> neighborList = neighborDAO.getNeighborList(UserID);
		Iterator<MiniHpNeighborVO> lit = neighborList.iterator();
		List<MiniHpNeighborViewVO> neighborViewList = new ArrayList<MiniHpNeighborViewVO>();
		/*System.out.println(neighborList);*/
		if(neighborList.size() == 0) {
			return null;
		} else {	
			while(lit.hasNext()) {
				neighborVO = lit.next();
				/*System.out.println(neighborVO.getNeighborID1());
				System.out.println(neighborVO.getNeighborID2());
				System.out.println(neighborViewVO);*/
				if(neighborVO.getNeighborID1().equals(UserID)) {
					neighborViewVO.setUserID(neighborVO.getNeighborID1());
					neighborViewVO.setUserName(neighborVO.getNeighborName1());
					neighborViewVO.setUserValue(neighborVO.getNeighborValue1());
					neighborViewVO.setNeighborID(neighborVO.getNeighborID2());
					neighborViewVO.setNeighborName(neighborVO.getNeighborName2());
					neighborViewVO.setNeighborValue(neighborVO.getNeighborValue2());
				} else {
					neighborViewVO.setUserID(neighborVO.getNeighborID2());
					neighborViewVO.setUserName(neighborVO.getNeighborName2());
					neighborViewVO.setUserValue(neighborVO.getNeighborValue2());
					neighborViewVO.setNeighborID(neighborVO.getNeighborID1());
					neighborViewVO.setNeighborName(neighborVO.getNeighborName1());
					neighborViewVO.setNeighborValue(neighborVO.getNeighborValue1());
				}
				/*System.out.println(neighborViewVO.getUserID());*/
				neighborViewList.add(neighborViewVO);
			}	
			return neighborViewList;
		}
	}
	
	/*이웃 끊기*/
	@Override
	public void deleteNeighbor(String userID, String neighborID) {
		
		neighborDAO.deleteNeighbor(userID, neighborID);
		
	}



}
