package com.hiworld.minihp.vo;

import org.springframework.web.multipart.MultipartFile;

public class MiniHpIntroVO {
	
	private String UserID;
	private String hpTitle;
	private MultipartFile hpPicture_imgFile;
	private byte[] hpPicture;
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
	public MultipartFile getHpPicture_imgFile() {
		return hpPicture_imgFile;
	}
	public void setHpPicture_imgFile(MultipartFile hpPicture_imgFile) {
		this.hpPicture_imgFile = hpPicture_imgFile;
	}
	public byte[] getHpPicture() {
		return hpPicture;
	}
	public void setHpPicture(byte[] hpPicture) {
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
