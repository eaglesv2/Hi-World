package com.hiworld.client.vo;

public class sessionVO {
	private int UserSerial;
	private String UserName;
	private String UserID;
	private String UserBirth;
	private int UserCash;
	private int count;
	private int isFollow;
	
	
	public int getUserSerial() {
		return UserSerial;
	}
	public void setUserSerial(int userSerial) {
		UserSerial = userSerial;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public String getUserBirth() {
		return UserBirth;
	}
	public void setUserBirth(String userBirth) {
		UserBirth = userBirth;
	}
	public int getUserCash() {
		return UserCash;
	}
	public void setUserCash(int userCash) {
		UserCash = userCash;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getIsFollow() {
		return isFollow;
	}
	public void setIsFollow(int isFollow) {
		this.isFollow = isFollow;
	}
	
	
	
	
	
}
