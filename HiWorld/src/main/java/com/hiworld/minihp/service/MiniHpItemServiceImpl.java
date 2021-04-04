package com.hiworld.minihp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHpItemDAO;
import com.hiworld.minihp.vo.MiniHpSelectedItemVO;
import com.hiworld.minihp.vo.MiniHpUserItemVO;

@Service
public class MiniHpItemServiceImpl implements MiniHpItemService {

	@Autowired
	private MiniHpItemDAO itemDAO;
	
	/*적용중인 아이템 목록 가져오기*/
	@Override
	public MiniHpSelectedItemVO getItemList(int userSerial) {
		MiniHpSelectedItemVO itemList = new MiniHpSelectedItemVO();
		itemList = itemDAO.getItemList(userSerial);
		
		return itemList;
	}
	
	/*미니미 목록 가져오기*/
	@Override
	public List<MiniHpUserItemVO> getMinimiList(int userSerial) {
		String type = "캐릭터";
		List<MiniHpUserItemVO> minimiList = itemDAO.getMinimiList(userSerial, type);
		
		return minimiList;
	}
	
	/*스토리룸 목록 가져오기*/
	@Override
	public List<MiniHpUserItemVO> getStoryRoomList(int userSerial) {
		String type = "배경";
		List<MiniHpUserItemVO> storyroomList = itemDAO.getStoryRoomList(userSerial, type);
		
		return storyroomList;
	}

	@Override
	public void updateStoryRoom(int userSerial, String storyRoom) {
		itemDAO.updateStoryRoom(userSerial, storyRoom);
	}

	@Override
	public void updateMinimi(int userSerial, String minimi, String minimiX, String minimiY) {
		itemDAO.updateMinimi(userSerial, minimi, minimiX, minimiY);
		
	}

	
	
	
}
