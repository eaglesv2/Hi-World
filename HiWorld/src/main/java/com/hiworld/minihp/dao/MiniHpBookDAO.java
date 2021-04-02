package com.hiworld.minihp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hiworld.minihp.vo.MiniHpBookReplyVO;
import com.hiworld.minihp.vo.MiniHpBookVO;

public interface MiniHpBookDAO {
	// 게시판 관련--------------------------
	//selectAll
	List<MiniHpBookVO> getAll(@Param("userSerial") int userSerial, @Param("offset") int offset,@Param("size") int size);
	//페이징처리
	int countAll(int userSerial);
	//게시물 insert
	int insert(MiniHpBookVO vo);
	//delete
	int delete(int serial);
	//update
	int update(@Param("serial") int serial, @Param("content") String content);
	
	//댓글
	//selectAll
	//int getReplyCnt(int videoSerial);
	List<MiniHpBookReplyVO> getAllReply(int bookSerial);
	//insert
	int insertReply(MiniHpBookReplyVO vo);
	//delete
	int deleteReply(int serial);
	//update 
	int updateReply(@Param("serial") int serial, @Param("content") String content);
}
