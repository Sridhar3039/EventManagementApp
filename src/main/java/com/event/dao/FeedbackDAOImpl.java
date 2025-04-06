package com.event.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.event.connection.Connector;
import com.event.dto.Feedback;

public class FeedbackDAOImpl implements FeedbackDAO {
	public Connection con;
	public FeedbackDAOImpl() {
		this.con=Connector.requestConnection();
	}
	@Override
	public boolean insertFeedback(Feedback f) {
		String query="INSERT INTO feedback (user_id, user_name, rating, comments) VALUES (?, ?, ?, ?)";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, f.getUser_id());
			ps.setString(2, f.getUser_name());
			ps.setInt(3, f.getRating());
			ps.setString(4, f.getComments());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean deleteFeedback(Feedback f) {
		String query = "DELETE FROM feedback WHERE feedback_id=?";
		int i=0;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, f.getFeedback_id());
            i=ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(i>0) {
        	return true;
        }
        else {
        	return false;
        }
	}

	@Override
	public ArrayList<Feedback> getFeedback() {
		String query="SELECT * FROM feedback";
		ArrayList<Feedback> feedbackList=new ArrayList<Feedback>();
		Feedback f=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				f=new Feedback();
				f.setFeedback_id(rs.getInt("feedback_id"));
				f.setUser_id(rs.getInt("user_id"));
				f.setUser_name(rs.getString("user_name"));
				f.setRating(rs.getInt("rating"));
				f.setComments(rs.getString("comments"));	
				feedbackList.add(f);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return feedbackList;
	}
}
