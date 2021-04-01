package com.hiworld.client.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hiworld.client.dao.ClientDAO;
import com.hiworld.client.vo.ClientVO;
import com.hiworld.client.vo.sessionVO;

/* ClientService에서 호출된것들이 여기서 관리 dao 호출 */
@Service("ClientService")
public class ClientServiceImpl implements ClientService {
	
	/* 자동적으로 dao의 값을 가지게 됨 */
	@Autowired
	private ClientDAO dao;
	
	

	/* 회원 정보 수정*/
	@Override
	public String updateClient(ClientVO clientVO) {
		int checkNumber = dao.updateClient(clientVO);
		String checkJoin = "";
		
		/* 회원수정 잘 되었는지 체크 */
		if(checkNumber==0) {
			checkJoin = "fail";
		}else if(checkNumber==-1) {
			checkJoin = "error";
		}else {
			checkJoin = "success";
		}
		
		return checkJoin;
		
	}
	/* 회원 정보 수정 시작====================================*/
	/*이름 수정 */
	@Override
	public int updateName(ClientVO clientVO) {
		int checkNumber = dao.updateName(clientVO);
		return checkNumber;
		
	}
	/* 이름 조회*/
	@Override
	public ClientVO selectName(String clientVO) {
		// TODO Auto-generated method stub
		ClientVO vo = dao.selectName(clientVO);
		return vo;
	}
	
	
	
	/*비밀번호 수정 */
	@Override
	public int updatepw(ClientVO clientVO) {
		int checkNumber = dao.updatepw(clientVO);
		return checkNumber;
		
	}
	/* 비밀번호 조회*/
	@Override
	public ClientVO selectpw(String clientVO) {
		// TODO Auto-generated method stub
		ClientVO vo = dao.selectpw(clientVO);
		return vo;
	}
	
	/*생일 수정 */
	@Override
	public String updateBirth(ClientVO clientVO) {
		int checkNumber = dao.updateBirth(clientVO);
		String checkJoin = "";
		
		/* 회원수정 잘 되었는지 체크 */
		if(checkNumber==0) {
			checkJoin = "fail";
		}else if(checkNumber==-1) {
			checkJoin = "error";
		}else {
			checkJoin = "success";
		}
		
		return checkJoin;
		
	}
	/* 생일 조회*/
	@Override
	public ClientVO selectBirth(ClientVO clientVO) {
		// TODO Auto-generated method stub
		ClientVO vo = dao.selectBirth(clientVO);
		return vo;
	}
	
	/*연락처 수정 */
	@Override
	public String updateTel(ClientVO clientVO) {
		int checkNumber = dao.updateTel(clientVO);
		String checkJoin = "";
		
		/* 회원수정 잘 되었는지 체크 */
		if(checkNumber==0) {
			checkJoin = "fail";
		}else if(checkNumber==-1) {
			checkJoin = "error";
		}else {
			checkJoin = "success";
		}
		
		return checkJoin;
		
	}
	/* 연락처 조회*/
	@Override
	public ClientVO selectTel(int clientVO) {
		// TODO Auto-generated method stub
		ClientVO vo = dao.selectTel(clientVO);
		return vo;
	}
	
	
	/*주소 수정 */
	@Override
	public String updateAddress(ClientVO clientVO) {
		int checkNumber = dao.updateAddress(clientVO);
		String checkJoin = "";
		
		/* 회원수정 잘 되었는지 체크 */
		if(checkNumber==0) {
			checkJoin = "fail";
		}else if(checkNumber==-1) {
			checkJoin = "error";
		}else {
			checkJoin = "success";
		}
		
		return checkJoin;
		
	}
	/* 주소 조회*/
	@Override
	public ClientVO selectAddress(ClientVO clientVO) {
		// TODO Auto-generated method stub
		ClientVO vo = dao.selectAddress(clientVO);
		return vo;
	}
	
	/* 회원가입 수정 끝-------------------------------------------------*/
	
	
	/* 회원 정보 삭제 */
	@Override
	public String deleteClinet(ClientVO clientVO) {
		int checkNumber = dao.deleteClient(clientVO);
		String checkJoin = "";
		
		/* 회원삭제 잘 되었는지 체크 */
		if(checkNumber==0) {
			checkJoin = "fail";
		}else if(checkNumber==-1) {
			checkJoin = "error";
		}else {
			checkJoin = "success";
		}
		
		return checkJoin;
	}
	
	
	/*############################################################################################# 기능구현 성공 한 곳 */
	/* 회원 회원 가입 */
	@Override
	public String insertClient(ClientVO clientVO) {
		System.out.println("회원가입");
		int checkNumber = dao.insertClient(clientVO);
		String checkJoin = "";
		
		/* 회원가입 잘 되었는지 체크 */
		if(checkNumber==0) {
			/* fail이랑 error는 실패했을때 갈 페이지 명 적기 */
			checkJoin = "fail";
		}else if(checkNumber==-1) {
			checkJoin = "error";
		}else {
			/* 성공했을떄 이동할 페이지 */
			checkJoin = "redirect:/login.do";
		}
		
		return checkJoin;
	}
	
	/*아이디 중복 체크*/
	@Override
	public int idCheck(String userId) {
		// TODO Auto-generated method stub
		System.out.println("아이디중복 체크");
		int result = dao.idCheck(userId);
		System.out.println(result);
		return result;
	}
	
	/* 회원 가입시 미니홈피 기본값 생성 */
	@Override
	public String insertMiniHP(ClientVO clientVO) {
		System.out.println("미니홈피 등록");
		int checkNumber = dao.insertMiniHP(clientVO);
		
		if(checkNumber==0) {
			return "실패";
		}else {
			return "성공";
		}
	}
	
	/* 네이버 회원 체크 */
	@Override
	public sessionVO NaverCheckClient(String UserID) {
		System.out.println("회원 체크");
		sessionVO vo = dao.NaverCheckClient(UserID);
		if(vo==null) {
			return null;
		}else {			
			return vo;
		}
	}
	
	
	/* 회원 로그인 확인 */
	@Override
	public sessionVO checkClient(ClientVO clientVO) {
		System.out.println("회원 로그인 확인");
		sessionVO vo = dao.checkClient(clientVO);
		System.out.println(vo);
		if(vo==null) {
			return null;
		}else {
			return vo;			
		}
	}
	
	/* 회원 한명 조회 */
	@Override
	public ClientVO getOneClient(String UserID) {
		System.out.println("한명 조회");
		/* 한명 정보가 담긴 VO가 넘어감 */
		return dao.getOneClient(UserID);
	}
	
	
	/* 밤톨 충전 */
	@Override
	public int userCash(ClientVO clientVO) {
		System.out.println("밤톨충전");	
		return dao.userCash(clientVO);
	}
	
	/* 내정보보기 PW 중복체크*/
	@Override
	public String pwCheck(String UserID) {
		System.out.println("PW중복체크");
		String pw =  dao.pwCheck(UserID);
		System.out.println(pw);
		return pw;
		
	}
	
	/* 회원 전체 조회 */
	@Override
	/* sql문 실패시 자동으로 롤백 됨 */
	@Transactional
	public ArrayList<ClientVO> getAllClient() {
		/* 모든 회원 정보가 담긴 ArrayList가 넘어감 */
		return dao.getAllClient();
	}
	
	/* 밴한 회원 전체 조회 */
	@Override
	public ArrayList<ClientVO> getAllBanClient() {
		return dao.getAllBanClient();
	}
	
	/* 밴 */
	@Override
	public int banClient(int UserSerial) {
		return dao.banClient(UserSerial);
	}
	
	/* 밴 풀기 */
	@Override
	public int unBanClient(int UserSerial) {
		return dao.unBanClient(UserSerial);
	}
	
	/* 로그인시 밴 체크 */
	@Override
	public String checkBan(ClientVO clientVO) {
		return dao.checkBan(clientVO);
	}
}
