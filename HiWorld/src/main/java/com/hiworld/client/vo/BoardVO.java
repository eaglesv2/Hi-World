package com.hiworld.client.vo;

import java.sql.Date;

public class BoardVO {
	private int boardSerial;
	private int userSerial;
	private String title;
	private String content;
	private Date cDate;
	private int lookUp;
	
	
	
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
	public int getLookUp() {
		return lookUp;
	}
	public void setLookUp(int lookUp) {
		this.lookUp = lookUp;
	}
	
	
}
