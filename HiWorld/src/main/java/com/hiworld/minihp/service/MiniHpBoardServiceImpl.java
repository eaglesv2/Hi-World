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
	
	@Override
	public List<MiniHpBoardVO> getAll() {
		List<MiniHpBoardVO> list = dao.getAll();
		if(list==null || list.size()==0)
			return null;
		else
			return list;
	}
	
	@Override
	public MiniHpBoardVO get(int serial) {
		return dao.get(serial);
	}
	
	@Override
	public int insert(MiniHpBoardVO vo) {
		return dao.insert(vo);
	}
	
	//폴더 관련------------
	@Override
	public List<MiniHPBoardFolderVO> getAllFolder(int userSerial) {
		return dao.getAllFolder(userSerial);
	}
	@Override
	public int addFolder(MiniHPBoardFolderVO vo) {
		return dao.addFolder(vo);
	}
	
	//해당 폴더의 모든 게시글 "기본 폴더"로 이동 + 해당 폴더 삭제 를 하나의 트랜잭션으로 처리
	@Override
	@Transactional
	public int deleteFolder(int serial) {
		dao.moveAllBoard(serial);
		return dao.deleteFolder(serial);
	}
	@Override
	public int updateFolder(MiniHPBoardFolderVO vo) {
		return dao.updateFolder(vo);
	}
}
