package com.dao;

import com.model.User;

public interface UserDaoInterface {
	public boolean register(User u);
	public User login(String user_name,String U_password,String role);
	boolean updateUser(User u);
	

}
