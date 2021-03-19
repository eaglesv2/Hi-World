package com.hiworld.minihp.vo;

public class MiniHpIntroVO {
	
	private String UserID;
	private String hpTitle;
	private String hpPicture;
	private String hpInfo;
	private int hpToday;
	
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public String getHpTitle() {
		return hpTitle;
	}
	public void setHpTitle(String hpTitle) {
		this.hpTitle = hpTitle;
	}
	public String getHpPicture() {
		return hpPicture;
	}
	public void setHpPicture(String hpPicture) {
		this.hpPicture = hpPicture;
	}
	public String getHpInfo() {
		return hpInfo;
	}
	public void setHpInfo(String hpInfo) {
		this.hpInfo = hpInfo;
	}
	public int getHpToday() {
		return hpToday;
	}
	public void setHpToday(int hpToday) {
		this.hpToday = hpToday;
	}
}
