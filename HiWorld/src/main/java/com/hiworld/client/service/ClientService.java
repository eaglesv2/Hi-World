package com.hiworld.client.service;

import java.util.ArrayList;

import com.hiworld.client.vo.ClientVO;
import com.hiworld.client.vo.sessionVO;

/* 이 서비스를 호출하면 serviceimpl이 작동함 */
/* controller -> service -> serviceimpl -> dao -> mybatis */
public interface ClientService {

	
	
	/* 회원 정보 수정 */
	String updateClient(ClientVO clientVO);
	
	/* 회원 정보 삭제 */
	String deleteClinet(ClientVO clientVO);
	
	/* 회원 정보 수정시작-------------------- */
	/* 이름 수정*/
	int updateName(ClientVO clientVO);
	/* 이름 조회*/
	ClientVO selectName(String id);
	
	/* 비밀번호 수정*/
	String updatepw(ClientVO clientVO);
	/* 비밀번호 조회*/
	ClientVO selectpw(ClientVO clientVO);
	
	/* 생일 수정*/
	String updateBirth(ClientVO clientVO);
	/* 생일 조회*/
	ClientVO selectBirth(ClientVO clientVO);
	/* 연락처 수정*/
	String updateTel(ClientVO clientVO);
	/* 연락처 조회*/
	ClientVO selectTel(ClientVO clientVO);
	/* 주소 수정*/
	String updateAddress(ClientVO clientVO);
	/* 주소 조회*/
	ClientVO selectAddress(ClientVO clientVO);
	/*-------------------회원수정 끝----------------- */
	
	
//	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 기능 구현 완료
	
	/* 회원 정보 입력 */
	String insertClient(ClientVO clientVO);
	
	/* 회원가입시 미니홈피 기본값 등록 */
	String insertMiniHP(ClientVO clientVO);
	
	/* 네이버 회원 정보 확인 */
	sessionVO NaverCheckClient(String UserID);
	
	/* 회원 정보 확인 */
	sessionVO checkClient(ClientVO clientVO);
	
	/* 회원 한명 보기 */
	/* ()안에 넣은 VO값을 가지고 mapper에서 get해서 사용가능 */
	ClientVO getOneClient(String UserID);
	
	/* 아이디 중복 체크 */
	int idCheck(String userId);
	
	/* 밤톨 충전 */
	int userCash(ClientVO clientVO);
	
	/*내정보보기 비밀번호 중복체크*/
	String pwCheck(String clientVO);
	
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
