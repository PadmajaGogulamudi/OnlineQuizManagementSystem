package com.dao;

import java.util.List;

import com.model.User;

public interface UserDaoInterface {
	public boolean register(User u);
	public List<User> getAllUsers() throws Exception;
	public User login(String user_name,String U_password,String role);
	boolean updateUser(User u);
	public boolean deleteUser(int id) throws Exception;
	

}
