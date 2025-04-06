package com.event.dao;

import java.util.ArrayList;

import com.event.dto.Feedback;

public interface FeedbackDAO {
	public boolean insertFeedback(Feedback f);
	public boolean deleteFeedback(Feedback f);
	public ArrayList<Feedback>getFeedback();
}
