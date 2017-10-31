package com.sunny.promotion.vo;

public class UserVO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private int age;
	private String gender;
	private int point;
	
	
	public UserVO() {
		super();
	}


	public UserVO(String user_id, String user_pw, String user_name, int age, String gender, int point) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.age = age;
		this.gender = gender;
		this.point = point;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_pwd() {
		return user_pw;
	}


	public void setUser_pwd(String user_pw) {
		this.user_pw = user_pw;
	}


	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", age=" + age
				+ ", gender=" + gender + ", point=" + point + "]";
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}
	
	
	
	
	
}
