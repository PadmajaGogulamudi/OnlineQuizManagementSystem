package com.dao;

import java.util.List;

import com.model.Question;

public interface QuestionsDaoInterface {
	public List<Question> getQuestions(int limit);

	public boolean addQuestion(Question q) throws Exception;

	public List<Question> getAllQuestions() throws Exception;

	public boolean deleteQuestion(int id) throws Exception;
}
