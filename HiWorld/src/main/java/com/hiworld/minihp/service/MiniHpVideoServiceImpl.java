package com.hiworld.minihp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hiworld.minihp.dao.MiniHpVideoDAO;
import com.hiworld.minihp.vo.MiniHPVideoFolderVO;
import com.hiworld.minihp.vo.MiniHpVideoReplyVO;
import com.hiworld.minihp.vo.MiniHpVideoVO;
@Service
public class MiniHpVideoServiceImpl implements MiniHpVideoService {
	
	@Autowired
	private MiniHpVideoDAO dao;
	
	//폴더 관련------------
	//폴더 selectAll
	@Override
	public List<MiniHPVideoFolderVO> getAllFolder(int userSerial) {
		return dao.getAllFolder(userSerial);
	}
	//insert
	@Override
	public int addFolder(MiniHPVideoFolderVO vo) {
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
	public int updateFolder(MiniHPVideoFolderVO vo) {
		return dao.updateFolder(vo);
	}
	
	
	// 게시판 관련-------------
	@Override
	public int getFirstFolderSerial(int userSerial) {
		return dao.getFirstFolderSerial(userSerial);
	}
	@Override
	@Transactional
	public List<MiniHpVideoVO> getAll(Integer folderSerial, int page, int pageSize) {
		//페이징
		int offset = 0+(page-1)*pageSize;//1페이지일 경우 1~5, 2페이지일 경우 2~10... 이런식으로 게시글 가져옴
		
		List<MiniHpVideoVO> list = dao.getAll(folderSerial, offset, pageSize);
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
	public int countInsideFolder(int serial) {
		return dao.countInsideFolder(serial);
	}
	
	@Override
	public int insert(MiniHpVideoVO vo) {
		return dao.insert(vo);
	}
	@Override
	public int updateVideoFolder(int videoSerial,int folderSerial) {
		return dao.updateVideoFolder(videoSerial, folderSerial);
	}
	@Override
	public int delete(int serial) {
		return dao.delete(serial);
	}
	@Override
	public MiniHpVideoVO get(int serial) {
		return dao.get(serial);
	}
	@Override
	public int update(MiniHpVideoVO vo) {
		return dao.update(vo);
	}
	
	@Override
	public int getReplyCnt(int videoSerial) {
		return dao.getReplyCnt(videoSerial);
	}
	@Override
	public List<MiniHpVideoReplyVO> getAllReply(int videoSerial) {
		return dao.getAllReply(videoSerial);
	}
	@Override
	public int insertReply(MiniHpVideoReplyVO vo) {
		return dao.insertReply(vo);
	}
	@Override
	public int deleteReply(int serial) {
		return dao.deleteReply(serial);
	}
	@Override
	public int updateReply(int serial, String content) {
		return dao.updateReply(serial, content);
	}
}
