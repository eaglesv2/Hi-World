package com.hiworld.minihp.vo;

import java.util.Date;

public class MiniHpBookVO {
	private int bookSerial;
	private int userSerial;
	private String userName;
	private String miniMe;
	private String content;
	private int replyCnt;
	private Date cDate;
	private Date uDate;
	public int getBookSerial() {
		return bookSerial;
	}
	public void setBookSerial(int bookSerial) {
		this.bookSerial = bookSerial;
	}
	public int getUserSerial() {
		return userSerial;
	}
	public void setUserSerial(int userSerial) {
		this.userSerial = userSerial;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMiniMe() {
		return miniMe;
	}
	public void setMiniMe(String miniMe) {
		this.miniMe = miniMe;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public Date getuDate() {
		return uDate;
	}
	public void setuDate(Date uDate) {
		this.uDate = uDate;
	}
	@Override
	public String toString() {
		return "MiniHpBookVO [bookSerial=" + bookSerial + ", userSerial=" + userSerial + ", userName=" + userName
				+ ", miniMe=" + miniMe + ", content=" + content + ", replyCnt=" + replyCnt + ", cDate=" + cDate
				+ ", uDate=" + uDate + "]";
	}
	
	
}
