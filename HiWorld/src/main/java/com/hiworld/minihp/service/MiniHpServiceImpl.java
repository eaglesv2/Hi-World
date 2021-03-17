package com.hiworld.minihp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHpDAO;

@Service
public class MiniHpServiceImpl implements MiniHpService {
	
	@Autowired
	private MiniHpDAO dao;
	
}
