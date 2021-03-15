package com.hiworld.dao;

import java.util.ArrayList;

import com.hiworld.vo.ClientVO;

/* myBatis에서 메소드를 가져와서 사용하기 위해서 */
public interface ClientDAO {
	
	/* 회원 전체 보기 */
	ArrayList<ClientVO> getAllClient();
	
	/* 회원 한명 보기 */
	/* ()안에 넣은 VO값을 가지고 mapper에서 get해서 사용가능 */
	ClientVO getOneClient(ClientVO clientVO);
	
	/* 회원 정보 확인 */
	int checkClient(ClientVO clientVO);
	
	/* 회원 정보 입력 성공시 성공한 갯수 나옴 1 */
	int insertClient(ClientVO clientVO);
	
	/* 회원 정보 수정 */
	int updateClient(ClientVO clientVO);
	
	/* 회원 정보 삭제 */
	int deleteClient(ClientVO clientVO);
	
	
}
