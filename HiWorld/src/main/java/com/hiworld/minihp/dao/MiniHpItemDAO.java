package com.hiworld.minihp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hiworld.minihp.vo.MiniHpSelectedItemVO;
import com.hiworld.minihp.vo.MiniHpUserItemVO;

@Repository
public interface MiniHpItemDAO {
	
	/*적용중인 아이템 목록 가져오기*/
	MiniHpSelectedItemVO getItemList(int userSerial);
	
	/*미니미 목록 가져오기*/
	List<MiniHpUserItemVO> getMinimiList(@Param("UserSerial")int UserSerial, @Param("type")String type);
	
	/*스토리룸 목록 가져오기*/
	List<MiniHpUserItemVO> getStoryRoomList(@Param("UserSerial")int userSerial, @Param("type")String type);
	
	
	
}
