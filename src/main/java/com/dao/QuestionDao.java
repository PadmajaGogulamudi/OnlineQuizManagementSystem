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
	
	 public boolean addQuestion(Question q) throws Exception {
	        Connection con = JDBCUtility.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "INSERT INTO questions(question_text, option_a, option_b, option_c, option_d, correct_answer, category) VALUES (?, ?, ?, ?, ?, ?, ?)"
	        );
	       
	        ps.setString(1, q.getQuestionText());
	        ps.setString(2, q.getOptionA());
	        ps.setString(3, q.getOptionB());
	        ps.setString(4, q.getOptionC());
	        ps.setString(5, q.getOptionD());
	        ps.setString(6, q.getCorrectOption());
	        

	        return ps.executeUpdate() > 0;
	    }
	 public List<Question> getAllQuestions() throws Exception {
	        List<Question> list = new ArrayList<>();
	        Connection con = JDBCUtility.getConnection();
	        PreparedStatement ps = con.prepareStatement("SELECT * FROM questions");
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Question q = new Question();
	            q.setQ_id(rs.getInt("q_id"));
	            q.setQuestionText(rs.getString("questionText"));
	            q.setOptionA(rs.getString("optionA"));
	            q.setOptionB(rs.getString("optionB"));
	            q.setOptionC(rs.getString("optionC"));
	            q.setOptionD(rs.getString("optionD"));
	            q.setCorrectOption(rs.getString("correctOption"));
	            
	            list.add(q);
	        }
	        return list;
	    }
	 public boolean deleteQuestion(int id) throws Exception {
	        Connection con = JDBCUtility.getConnection();
	        PreparedStatement ps = con.prepareStatement("DELETE FROM questions WHERE q_id=?");
	        ps.setInt(1, id);
	        return ps.executeUpdate() > 0;
	    }

}
