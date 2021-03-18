package com.hiworld.client.service;

import java.util.ArrayList;

import com.hiworld.client.vo.ClientVO;

/* 이 서비스를 호출하면 serviceimpl이 작동함 */
/* controller -> service -> serviceimpl -> dao -> mybatis */
public interface ClientService {

	/* 회원 전체 보기 */
	ArrayList<ClientVO> getAllClient();
	
	/* 회원 정보 수정 */
	String updateClient(ClientVO clientVO);
	
	/* 회원 정보 삭제 */
	String deleteClinet(ClientVO clientVO);
	
	
	
	
//	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 기능 구현 완료
	
	/* 회원 정보 입력 */
	String insertClient(ClientVO clientVO);
	
	/* 네이버 회원 정보 확인 */
	ClientVO NaverCheckClient(String UserID);
	
	/* 회원 정보 확인 */
	ClientVO checkClient(ClientVO clientVO);
	
	/* 회원 한명 보기 */
	/* ()안에 넣은 VO값을 가지고 mapper에서 get해서 사용가능 */
	ClientVO getOneClient(String UserID);
	
	/* 밤톨 충전 */
	int userCash(ClientVO clientVO);
}
