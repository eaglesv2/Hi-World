package com.hiworld.minihp.service;

import java.util.List;

import com.hiworld.minihp.vo.MiniHpSelectedItemVO;
import com.hiworld.minihp.vo.MiniHpUserItemVO;

public interface MiniHpItemService {
	
	/*적용중인 아이템 목록 가져오기*/
	MiniHpSelectedItemVO getItemList(int userSerial);
	
	/*보유중인 미니미 목록 가져오기*/
	List<MiniHpUserItemVO> getMinimiList(int userSerial);
	
	/*보유중인 스토리룸 목록 가져오기*/
	List<MiniHpUserItemVO> getStoryRoomList(int userSerial);
	
	/*보유중인 마우스 커서 커스텀 가져오기*/
	List<MiniHpUserItemVO> getMouseList(int userSerial);
	
	/*스토리룸 수정*/
	void updateStoryRoom(int userSerial, String storyRoom);
	
	/*미니미 수정*/
	void updateMinimi(int userSerial, String minimi, String minimiX, String minimiY);
	
	/*마우스 커서 커스텀 수정*/
	void updateMousePointer(int userSerial, String mousePointer);

	
	
	
	
}
