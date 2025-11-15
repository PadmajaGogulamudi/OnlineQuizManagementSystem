package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Result;

public class ResultDao implements ResultDaointerface {

	@Override
	public void saveResult(int userId, int score, int totalMarks) {
		String sql = "INSERT INTO results(user_id,score,total_marks) VALUES (?,?,?)";
        try (Connection conn = JDBCUtility.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, score);
            ps.setInt(3, totalMarks);
            ps.executeUpdate();
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public List<Result> getResultsByUser(int userId) {
		String sql = "SELECT * FROM results WHERE user_id=? ORDER BY attempted_at DESC";
        List<Result> list = new ArrayList<>();
        try (Connection conn = JDBCUtility.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Result r = new Result();
                    r.setResultId(rs.getInt("result_id"));
                    r.setUserId(userId);
                    r.setScore(rs.getInt("score"));
                    r.setTotalMarks(rs.getInt("total_marks"));
                    r.setAttemptedAt(rs.getString("attempted_at"));
                    list.add(r);
                }
            }
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return list;
	}

}
