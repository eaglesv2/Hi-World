package com.hiworld.vo;

public class ClientVO {
	
	/* 필요 칼럼 정의 */
	private String name;
	private String id;
	private String pw;
	private String gender;
	private String birth;
	private String tel;
	private String address;
	
	
	/* 칼럼 setter, getter */
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	/* 로그인을 하기 위하여*/
	public ClientVO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	/* 회원가입을 하기 위하여*/
	public ClientVO(String name, String id, String pw, String gender, String birth, String tel, String address) {
		super();
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.birth = birth;
		this.tel = tel;
		this.address = address;
	}
	
	public ClientVO() {
		super();
	}

}
