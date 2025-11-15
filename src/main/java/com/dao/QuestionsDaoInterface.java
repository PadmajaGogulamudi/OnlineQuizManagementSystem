package com.dao;

import java.util.List;

import com.model.Question;


public interface QuestionsDaoInterface {
	public List<Question> getQuestions(int limit);

}
