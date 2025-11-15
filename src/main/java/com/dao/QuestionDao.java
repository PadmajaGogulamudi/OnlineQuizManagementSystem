package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Question;

public class QuestionDao implements QuestionsDaoInterface {
	Connection con = null;

	String status = "fail";

	@Override
	public List<Question> getQuestions(int limit) {
		PreparedStatement ps = null;
		con = JDBCUtility.getConnection();
		List<Question> list = new ArrayList<>();
		try {
			ps = con.prepareStatement("select * from questions order by rand() limit ?");
			ps.setInt(1, limit);

			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Question q = new Question(rs.getInt("q_id"), rs.getString("question_text"), rs.getString("option_a"),
						rs.getString("option_b"), rs.getString("option_c"), rs.getString("option_d"),
						rs.getString("correct_option"), rs.getInt("marks"));
				list.add(q);
				

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

}
