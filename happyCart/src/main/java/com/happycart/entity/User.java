package com.happycart.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {

	 @Id
	 @GeneratedValue(strategy=GenerationType.AUTO)
	 @Column(name="user_id")
	 private int userId;
	 
	 @Column(name="user_name")
	 private String userName;
	 
	 @Column(name="user_email", unique=true)
	 private String userEmail;
	 
	 @Column(name="user_password")
	 private String	userPassword;
	 
	 @Column(name="user_phone")
	 private String	userPhone;
	 
	 @Column(name="user_address", length=1500)
	 private String userAddress;
	 
	 @Column(name="user_type")
	 private String userType;

	public User(String userName, String userEmail, String userPassword, String userPhone,
			String userAddress, String userType) {
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userAddress = userAddress;
		this.userType = userType;
	}

	public User() {
		
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword="
				+ userPassword + ", userPhone=" + userPhone + ", userAddress=" + userAddress
				+ "]";
	}
	
}
