package com.etc.myvideo.admin.entity;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */

public class Admin implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String password;
	private String state;
	private String phone;
	private String email;

	// Constructors

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	/** default constructor */
	public Admin() {
	}

	/** minimal constructor */
	public Admin(String username, String password) {
		this.username = username;
		this.password = password;
	}

	/** full constructor */
	public Admin(String username, String password, String state, String phone) {
		this.username = username;
		this.password = password;
		this.state = state;
		this.phone = phone;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Admin [id=" + id + ", username=" + username + ", password="
				+ password + ", state=" + state + ", phone=" + phone
				+ ", email=" + email + "]";
	}
	
	

}