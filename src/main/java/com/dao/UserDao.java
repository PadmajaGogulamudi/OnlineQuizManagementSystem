package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.User;

public class UserDao implements UserDaoInterface {
	Connection con = null;

	boolean status = false;

	public boolean register(User u) {
		con = JDBCUtility.getConnection();
		int n = 0;
		try {
			PreparedStatement ps = con.prepareStatement(
					"insert into users(user_name,U_password,U_name,U_email,u_role) values(?,?,?,?,?)");
			ps.setString(1, u.getUser_name());
			ps.setString(2, u.getU_password());
			ps.setString(3, u.getU_name());
			ps.setString(4, u.getU_email());
			ps.setString(5, u.getU_role());
			n = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();;
		}

		if (n > 0) {
			status = true;
		}

		return status;
	}
	 public List<User> getAllUsers() throws Exception {
	        List<User> list = new ArrayList<>();
	        Connection con = JDBCUtility.getConnection();
	        PreparedStatement ps = con.prepareStatement("SELECT * FROM users");
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            User u = new User();
	            //u.setU_id(rs.getInt("u_id"));
	            u.setU_name(rs.getString("u_name"));
	            u.setU_email(rs.getString("u_email"));
	            u.setU_role(rs.getString("u_role"));
	           
	            list.add(u);
	        }
	        return list;
	    }

	@Override
	public User login(String user_name, String U_password,String role) {
		con = JDBCUtility.getConnection();
		ResultSet rs = null;

		try {
			PreparedStatement ps = con.prepareStatement("Select * from Users where user_name=? and U_password=? and u_role=?");
			ps.setString(1, user_name);
			ps.setString(2, U_password);
			ps.setString(3, role);

			rs = ps.executeQuery();

			if (rs.next()) {
				String dbPass = rs.getString("U_password");
				if (U_password.equals(dbPass)) { // later use hash compare
					User u = new User();
					u.setUser_id(rs.getInt("user_id"));
					u.setUser_name(rs.getString("user_name"));
					u.setU_name(rs.getString("U_name"));
					u.setU_email(rs.getString("U_email"));
					u.setU_role(rs.getString("u_role"));
					return u;
				}
			}
		} catch (SQLException e) {
			System.err.println("SQLException at PreparedStatement in Login");
		}

		return null;

	}

	@Override
	public boolean updateUser(User u) {
		con = JDBCUtility.getConnection();
		int n = 0;
		try {
			PreparedStatement ps = con.prepareStatement(
					"UPDATE users SET U_password=?, U_name=?, U_email=? WHERE user_id=?");
			//ps.setString(1, u.getUser_name());
			ps.setString(1, u.getU_password());
			ps.setString(2, u.getU_name());
			ps.setString(3, u.getU_email());
			ps.setString(4, u.getUser_id()+"");
			n = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();;
		}

		if (n > 0) {
			status = true;
		}

		return status;
		
	
		
	}
	public boolean deleteUser(int id) throws Exception {
        Connection con = JDBCUtility.getConnection();
        PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE u_id=?");
        ps.setInt(1, id);
        return ps.executeUpdate() > 0;
    }
}
