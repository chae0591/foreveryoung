package com.forever.young.entity;

public class ChangePwVO {
	private int user_num;
	private String current_pw;
	private String change_pw;
	
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getCurrent_pw() {
		return current_pw;
	}
	public void setCurrent_pw(String current_pw) {
		this.current_pw = current_pw;
	}
	public String getChange_pw() {
		return change_pw;
	}
	public void setChange_pw(String change_pw) {
		this.change_pw = change_pw;
	}
	
	@Override
	public String toString() {
		return "ChangePwVO [user_num=" + user_num + ", current_pw=" + current_pw + ", change_pw=" + change_pw + "]";
	}
}
