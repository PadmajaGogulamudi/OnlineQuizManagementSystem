package com.model;

public class User {
	int user_id;
	private String user_name, U_password, U_name, U_email, u_role;

	public User() {

	}

	public User(int user_id, String user_name, String U_password, String U_name, String U_email, String u_role) {

		this.user_id = user_id;
		this.user_name = user_name;
		this.U_password = U_password;
		this.U_name = U_name;
		this.U_email = U_email;
		this.u_role = u_role;
	}

	public void setU_role(String u_role) {
		this.u_role = u_role;

	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getU_role() {
		return this.u_role;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getU_password() {
		return U_password;
	}

	public void setU_password(String u_password) {
		U_password = u_password;
	}

	public String getU_name() {
		return U_name;
	}

	public void setU_name(String u_name) {
		U_name = u_name;
	}

	public String getU_email() {
		return U_email;
	}

	public void setU_email(String u_email) {
		U_email = u_email;
	}

	@Override
	public String toString() {
		return "User [user_name=" + user_name + ", U_password=" + U_password + ", U_name=" + U_name + ", U_email="
				+ U_email + ", u_role=" + u_role + "]";
	}

}
