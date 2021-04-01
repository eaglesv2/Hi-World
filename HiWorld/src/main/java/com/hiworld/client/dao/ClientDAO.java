package com.hiworld.client.dao;

import java.util.ArrayList;

import com.hiworld.client.vo.BoardReplyVO;
import com.hiworld.client.vo.BoardVO;
import com.hiworld.client.vo.ClientVO;
import com.hiworld.client.vo.sessionVO;

/* myBatis에서 메소드를 가져와서 사용하기 위해서 */
public interface ClientDAO {
	
	
	
	
	
	
	
	
	
	/* 회원 정보 수정 */
	int updateClient(ClientVO clientVO);
	
	/* 회원 정보 삭제 */
	int deleteClient(ClientVO clientVO);
	
	/* 회원 정보 수정 */
	/*이름 수정 */
	int updateName(ClientVO clientVO);
	/* 이름 조회*/
	ClientVO selectName(String clientVO);
	
	/* 패스워드 수정*/
	int updatepw(ClientVO clientVO);
	/* 이름 조회*/
	ClientVO selectpw(ClientVO clientVO);
	
	
	/* 생일 수정*/
	int updateBirth(ClientVO clientVO);
	/* 이름 조회*/
	ClientVO selectBirth(ClientVO clientVO);
	
	/* 연락처 수정*/
	int updateTel(ClientVO clientVO);
	/* 이름 조회*/
	ClientVO selectTel(ClientVO clientVO);
	
	
	/* 주소 수정*/
	int updateAddress(ClientVO clientVO);
	/* 이름 조회*/
	ClientVO selectAddress(ClientVO clientVO);
	
	/* ------------------회원정보 조회 끝------------------*/
	
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
	
	/* 로그인시 밴 확인 */
	int checkBan(ClientVO clientVO);
	
	
//	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   ADMIN @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	/* 밴한 회원 전체 보기 */
	ArrayList<ClientVO> getAllBanClient();
	
	/* 밴 */
	int banClient(int UserSerial);
	
	/* 밴 풀기 */
	int unBanClient(int UserSerial);
	
	/* 게시판 등록 */
	int BoardSubmit(BoardVO boardVO);
	
	/* 게시판 가져오기 */
	ArrayList<BoardVO> getBoardList();
	
	/* 게시판 세부정보 */
	BoardVO getBoardOne(BoardVO boardVO);
	
	/* 게시판 댓글 */
	ArrayList<BoardReplyVO> getBoardReply(BoardVO boardVO);
	
	/* 조회 1 올리기 */
	void lookUp(BoardVO boardVO);
}
	 