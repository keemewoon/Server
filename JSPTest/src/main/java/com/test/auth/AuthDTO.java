package com.test.auth;


//택배상자(포장)

//MVC 디자인 패턴
// - DTO, Data Transfer Object
// - 계층과 계층사이에 교환되는 데이터 단위

// - VO, Value Object


//일반 클래스가 DTO 역할을 하기 위한 규칙!!
//1. 데이터를 담기 위한 멤버 변수를 private으로 선언한다.
//2. getter, setter를 구현
//3. 그 이외의 작업은 하지 않는다.(여기서 끝!)

public class AuthDTO {

	private String id;
	private String pw;
	private String name;
	private String lv;
	private String regdate;


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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLv() {
		return lv;
	}
	public void setLv(String lv) {
		this.lv = lv;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}





}
