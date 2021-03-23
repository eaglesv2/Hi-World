package com.hiworld.minihp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hiworld.minihp.dao.MiniHpBoardDAO;
import com.hiworld.minihp.vo.MiniHPBoardFolderVO;
import com.hiworld.minihp.vo.MiniHpBoardVO;
@Service
public class MiniHpBoardServiceImpl implements MiniHpBoardService {
	
	@Autowired
	private MiniHpBoardDAO dao;
	
	//폴더 관련------------
	//폴더 selectAll
	@Override
	public List<MiniHPBoardFolderVO> getAllFolder(int userSerial) {
		return dao.getAllFolder(userSerial);
	}
	//insert
	@Override
	public int addFolder(MiniHPBoardFolderVO vo) {
		return dao.addFolder(vo);
	}
	//delete
	//폴더안에 게시글이 있는지 확인, 게시글이 하나도 없을시만 삭제 가능
	@Override
	@Transactional
	public int deleteFolder(int serial) {
		int count = dao.countInsideFolder(serial);
		if(count==0)
			return dao.deleteFolder(serial);
		else
			return 0;
	}
	//update
	@Override
	@Transactional
	public int updateFolder(MiniHPBoardFolderVO vo) {
		return dao.updateFolder(vo);
	}
	
	
	// 게시판 관련-------------
	@Override
	public int getFirstFolderSerial(int userSerial) {
		return dao.getFirstFolderSerial(userSerial);
	}
	@Override
	@Transactional
	public List<MiniHpBoardVO> getAll(Integer folderSerial) {
		List<MiniHpBoardVO> list = dao.getAll(folderSerial);
		if(list==null || list.size()==0)
			return null;
		else
			return list;
	}
	@Override
	public String getFolderName(int folderSerial) {
		return dao.getFolderName(folderSerial);
	}
	
	@Override
	public MiniHpBoardVO get(int serial) {
		return dao.get(serial);
	}
	
	@Override
	public int insert(MiniHpBoardVO vo) {
		return dao.insert(vo);
	}
	
}
