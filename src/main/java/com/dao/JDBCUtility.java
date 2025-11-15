package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtility {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.err.println("class not found at Class\\.forName()");

		}

		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_quiz","root","oracle");
		} catch (SQLException e) {
			System.err.println("SQLException at Connection Statement");
		}
		return con;

	}

}
