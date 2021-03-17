package com.hiworld.minihp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.hiworld.minihp.vo.MiniHP_ProfileVO;

@Component
public class MiniHP_ProfileDAO {

	private SqlSessionTemplate sessionTemplate;
		
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public MiniHP_ProfileVO getContent(String userId) {
		return sessionTemplate.selectOne("com.hiworld.profile.getContent", userId);
	}
		
	public void updateContent(MiniHP_ProfileVO vo) {
		sessionTemplate.update("com.hiworld.profile.updateContent", vo);
	}
		
	public void insertData(MiniHP_ProfileVO vo) {
		sessionTemplate.insert("com.hiworld.profile.insertContent", vo);		
	}
}
