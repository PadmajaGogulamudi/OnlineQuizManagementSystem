package com.dao;

import java.util.List;

import com.model.Result;

public interface ResultDaointerface {
	void saveResult(int userId, int score, int totalMarks);
	List<Result> getResultsByUser(int userId);

}
