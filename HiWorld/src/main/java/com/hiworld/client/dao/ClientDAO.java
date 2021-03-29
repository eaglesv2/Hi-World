package com.hiworld.client.dao;

import java.util.ArrayList;

import com.hiworld.client.vo.ClientVO;
import com.hiworld.client.vo.sessionVO;

/* myBatis에서 메소드를 가져와서 사용하기 위해서 */
public interface ClientDAO {
	
	
	
	
	
	
	
	
	
	/* 회원 정보 수정 */
	int updateClient(ClientVO clientVO);
	
	/* 회원 정보 삭제 */
	int deleteClient(ClientVO clientVO);
	
	
	
//	############################### 기능 구현 완료
	/* 로그인*/
	int userLogin(ClientVO clientVO);
	
	/* 회원 정보 입력 성공시 성공한 갯수 나옴 1 */
	int insertClient(ClientVO clientVO);
	
	/* 회원가입시 미니홈피 기본값 등록 */
	int insertMiniHP(ClientVO clientVO);
	
	/* 네이버 회원 체크 */
	sessionVO NaverCheckClient(String UserID);
	
	/* 회원 로그인 확인 */
	sessionVO checkClient(ClientVO clientVO);
	
	/* 회원 한명 보기 */
	/* ()안에 넣은 VO값을 가지고 mapper에서 get해서 사용가능 */
	ClientVO getOneClient(String UserID);
	
	/* 밤톨 충전 */
	int userCash(ClientVO clientVO);
	
	/* 아이디 중복 체크*/
	int idCheck(String userId);
	
	/*내정보보기 PW중복체크*/
	String pwCheck(String UserID);
	
	/* 회원 전체 보기 */
	ArrayList<ClientVO> getAllClient();
	
	/* 밴한 회원 전체 보기 */
	ArrayList<ClientVO> getAllBanClient();
	
	/* 밴 */
	int banClient(int UserSerial);
	
	/* 밴 풀기 */
	int unBanClient(int UserSerial);
	
	/* 로그인시 밴 확인 */
	String checkBan(ClientVO clientVO);
}
	 