package com.hiworld.minihp.vo;

import java.util.Date;

public class MiniHpBoardVO {
	private int boardSerial;
	private int userSerial;
	private String userName;
	private String folderName;
	private String title;
	private String content;
	private Date cDate;
	private Date uDate;
	
	public MiniHpBoardVO() {}
	public MiniHpBoardVO(int boardSerial, int userSerial, String userName, String folderName, String title,
			String content, Date cDate, Date uDate) {
		this.boardSerial = boardSerial;
		this.userSerial = userSerial;
		this.userName = userName;
		this.folderName = folderName;
		this.title = title;
		this.content = content;
		this.cDate = cDate;
		this.uDate = uDate;
	}
	public int getBoardSerial() {
		return boardSerial;
	}
	public void setBoardSerial(int boardSerial) {
		this.boardSerial = boardSerial;
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
	public String getFolderName() {
		return folderName;
	}
	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
		return "MiniHpBoardVO [boardSerial=" + boardSerial + ", userSerial=" + userSerial + ", userName=" + userName
				+ ", folderName=" + folderName + ", title=" + title + ", content=" + content + ", cDate=" + cDate
				+ ", uDate=" + uDate + "]";
	}
}
