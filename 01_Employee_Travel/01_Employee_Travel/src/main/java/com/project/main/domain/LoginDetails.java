package com.project.main.domain;

import java.util.Objects;

public class LoginDetails {
	private String loginId;
	private String userId;
	private String password;
	private String designation;
	
	public LoginDetails() {
		// TODO Auto-generated constructor stub
	} 
	
	
	
	public LoginDetails(String loginId, String userId, String password, String designation) {
		super();
		this.loginId = loginId;
		this.userId = userId;
		this.password = password;
		this.designation = designation;
	}



	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	@Override
	public String toString() {
		return "LoginDetails [loginId=" + loginId + ", userId=" + userId + ", password=" + password + ", designation="
				+ designation + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(designation, loginId, password, userId);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LoginDetails other = (LoginDetails) obj;
		return Objects.equals(designation, other.designation) && Objects.equals(loginId, other.loginId)
				&& Objects.equals(password, other.password) && Objects.equals(userId, other.userId);
	}
	
	
	
	
	
}
