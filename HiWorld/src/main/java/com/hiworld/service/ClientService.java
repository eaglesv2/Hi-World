package com.hiworld.service;

import java.util.ArrayList;

import com.hiworld.vo.ClientVO;

/* 이 서비스를 호출하면 serviceimpl이 작동함 */
/* controller -> service -> serviceimpl -> dao -> mybatis */
public interface ClientService {

	/* 회원 전체 보기 */
	ArrayList<ClientVO> getAllClient();
	
	/* 회원 한명 보기 */
	/* ()안에 넣은 VO값을 가지고 mapper에서 get해서 사용가능 */
	ClientVO getOneClient(ClientVO clientVO);
	
	/* 회원 정보 확인 */
	String checkClient(ClientVO clientVO);
	
	/* 회원 정보 입력 */
	String insertClient(ClientVO clientVO);
	
	/* 회원 정보 수정 */
	String updateClient(ClientVO clientVO);
	
	/* 회원 정보 삭제 */
	String deleteClinet(ClientVO clientVO);
	
}
