package com.event.dto;

public class Feedback {
	private int feedback_id;
	private int user_id;
	private String user_name;
	private int rating;
	private String comments;
	
	@Override
	public String toString() {
		return "Feedback [feedback_id=" + feedback_id + ", user_id=" + user_id + ", user_name=" + user_name
				+ ", rating=" + rating + ", comments=" + comments + "]";
	}
	public int getFeedback_id() {
		return feedback_id;
	}
	public void setFeedback_id(int feedback_id) {
		this.feedback_id = feedback_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
}
