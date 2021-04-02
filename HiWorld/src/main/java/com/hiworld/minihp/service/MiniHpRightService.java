package com.hiworld.minihp.service;

import java.util.List;

import com.hiworld.minihp.vo.MiniHpLatestPostsVO;

public interface MiniHpRightService {
	List<MiniHpLatestPostsVO> getLatestPosts(int userSerial);
	
}
