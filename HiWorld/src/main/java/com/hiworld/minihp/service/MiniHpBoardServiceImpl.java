package com.hiworld.minihp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHpBoardDAO;
import com.hiworld.minihp.vo.MiniHpBoardVO;
@Service
public class MiniHpBoardServiceImpl implements MiniHpBoardService {
	
	@Autowired
	private MiniHpBoardDAO dao;
	
	@Override
	public List<MiniHpBoardVO> getAll() {
		return dao.getAll();
	}
}
