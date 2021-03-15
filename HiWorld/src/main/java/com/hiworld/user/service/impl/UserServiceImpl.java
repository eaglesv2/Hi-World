package com.hiworld.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hiworld.user.service.dao.UserDAO;
import com.hiworld.user.vo.UserVO;

@Service("userService")
public class UserServiceImpl {
	
	@Autowired
	private UserDAO userdao;
	
	@Transactional
	public void insertSawon(UserVO userVO) {
		userdao.insertSawon(userVO);
	}
}