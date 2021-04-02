package com.hiworld.minihp.service;

import java.util.List;

import com.hiworld.minihp.vo.MiniHpBookReplyVO;
import com.hiworld.minihp.vo.MiniHpBookVO;

public interface MiniHpBookService {
	//게시판 관련---------------
	List<MiniHpBookVO> getAll(int userSerial, int page, int pageSize);
	//페이징처리
	int countAll(int userSerial);
	
	int insert(MiniHpBookVO vo);
	//delete
	int delete(int serial);
	//update
	int update(int serial, String content);
	
	//댓글
	//selectAll
//	int getReplyCnt(int videoSerial);
	List<MiniHpBookReplyVO> getAllReply(int bookSerial);
	//insert
	int insertReply(MiniHpBookReplyVO vo);
	//delete
	int deleteReply(int serial);
	//update 
	int updateReply(int serial, String content);
	
}
