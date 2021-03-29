package com.forever.young.entity;

import java.sql.Date;

public class Customer {
	private int userNum;
	private String userId;
	private String userPw;
	private String userName;
	private String userPhone;
	private String userGender;
	private Date userBirth;
	private Date userRegDate;
	private int addressNo;
	public int getUserNum() {
		return userNum;
	}
	
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public Date getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}
	public Date getUserRegDate() {
		return userRegDate;
	}
	public void setUserRegDate(Date userRegDate) {
		this.userRegDate = userRegDate;
	}
	public int getAddressNo() {
		return addressNo;
	}
	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}
	
	@Override
	public String toString() {
		return "Customer [userNum=" + userNum + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userPhone=" + userPhone + ", userGender=" + userGender + ", userBirth=" + userBirth
				+ ", userRegDate=" + userRegDate + ", addressNo=" + addressNo + "]";
	}
}
