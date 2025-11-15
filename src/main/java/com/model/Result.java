package com.model;

public class Result {
	private int resultId, userId, score, totalMarks;
    private String attemptedAt;
    
	public Result() {
		
	}
	public Result(int resultId, int userId, int score, int totalMarks, String attemptedAt) {
		super();
		this.resultId = resultId;
		this.userId = userId;
		this.score = score;
		this.totalMarks = totalMarks;
		this.attemptedAt = attemptedAt;
	}
	public int getResultId() {
		return resultId;
	}
	public void setResultId(int resultId) {
		this.resultId = resultId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getTotalMarks() {
		return totalMarks;
	}
	public void setTotalMarks(int totalMarks) {
		this.totalMarks = totalMarks;
	}
	public String getAttemptedAt() {
		return attemptedAt;
	}
	public void setAttemptedAt(String timestamp) {
		this.attemptedAt = timestamp;
	}
}
