package com.test.test.vo;

public class TestVO {
	int id;
	String name;
	public TestVO() {}
	public TestVO(int id, String name) {
		this.id = id;
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "TestVO [id=" + id + ", name=" + name + "]";
	}
	
}
