package com.hiworld.minihp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hiworld.minihp.dao.MiniHpPictureDAO;
import com.hiworld.minihp.vo.MiniHPPictureFolderVO;
@Service
public class MiniHpPictureServiceImpl implements MiniHpPictureService {
	
	@Autowired
	private MiniHpPictureDAO dao;
	
	//폴더 관련------------
	//폴더 selectAll
	@Override
	public List<MiniHPPictureFolderVO> getAllFolder(int userSerial) {
		return dao.getAllFolder(userSerial);
	}
	//insert
	@Override
	public int addFolder(MiniHPPictureFolderVO vo) {
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
	public int updateFolder(MiniHPPictureFolderVO vo) {
		return dao.updateFolder(vo);
	}
	
	
	// 게시판 관련-------------
//	@Override
//	public int getFirstFolderSerial(int userSerial) {
//		return dao.getFirstFolderSerial(userSerial);
//	}
//	@Override
//	@Transactional
//	public List<MiniHpBoardVO> getAll(Integer folderSerial, int page) {
//		//페이징
//		int size = 10;//한페이지에 10개씩
//		int offset = 0+(page-1)*size;
//		
//		List<MiniHpBoardVO> list = dao.getAll(folderSerial, offset, size);
//		if(list==null || list.size()==0)
//			return null;
//		else
//			return list;
//	}
//	@Override
//	public String getFolderName(int folderSerial) {
//		return dao.getFolderName(folderSerial);
//	}
//	@Override
//	public int countInsideFolder(int serial) {
//		return dao.countInsideFolder(serial);
//	}
//	
//	@Override
//	public int insert(MiniHpBoardVO vo) {
//		return dao.insert(vo);
//	}
//	@Override
//	@Transactional
//	public MiniHpBoardVO get(int serial) {
//		dao.updateHit(serial);//게시글 볼때마다 조회수 1 증가
//		return dao.get(serial);
//	}
//	@Override
//	public int updateBoardFolder(int boardSerial,int folderSerial) {
//		return dao.updateBoardFolder(boardSerial, folderSerial);
//	}
//	@Override
//	public int delete(int serial) {
//		return dao.delete(serial);
//	}
//	@Override
//	public int update(MiniHpBoardVO vo) {
//		return dao.update(vo);
//	}
//	
//	@Override
//	public List<MiniHpBoardReplyVO> getAllReply(int boardSerial) {
//		return dao.getAllReply(boardSerial);
//	}
//	@Override
//	public int insertReply(MiniHpBoardReplyVO vo) {
//		return dao.insertReply(vo);
//	}
//	@Override
//	public int deleteReply(int serial) {
//		return dao.deleteReply(serial);
//	}
//	@Override
//	public int updateReply(int serial, String content) {
//		return dao.updateReply(serial, content);
//	}
}
