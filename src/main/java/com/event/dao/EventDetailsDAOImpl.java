package com.event.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.event.connection.Connector;
import com.event.dto.EventDetails;

public class EventDetailsDAOImpl implements EventDetailsDAO{
	
	public Connection con;
	public EventDetailsDAOImpl() {
		this.con=Connector.requestConnection();
	}

	@Override
	public boolean insertEventDetails(EventDetails ed) {
		String query = "INSERT INTO event_details(event_id, detail_type, detail_description, price, room_capacity, image_url) VALUES(?, ?, ?, ?, ?, ?)";
	    int i = 0;
	    try {
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, ed.getEvent_id());
	        ps.setString(2, ed.getDetail_type());
	        ps.setString(3, ed.getDetail_description());
	        ps.setDouble(4, ed.getPrice());
	        ps.setInt(5, ed.getRoom_capacity());
	        ps.setString(6, ed.getImage_url());
	        i = ps.executeUpdate();
	    }catch (SQLException e) {
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
	public boolean updateEventDetails(EventDetails ed) {
		String query="update event_details set event_id=?, detail_type=?, detail_description=?, price=?, room_capacity=?, image_url=? where detail_id=?";
		int i=0;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, ed.getEvent_id());
			ps.setString(2, ed.getDetail_type());
			ps.setString(3, ed.getDetail_description());
	        ps.setDouble(4, ed.getPrice());
	        ps.setInt(5, ed.getRoom_capacity());
	        ps.setString(6, ed.getImage_url());
	        ps.setInt(7, ed.getDetail_id());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	public boolean deleteEventDetails(EventDetails ed) {
		String query="delete from event_details where detail_id=?";
		int i=0;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, ed.getDetail_id());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	public EventDetails getEventDetails(int detail_id) {
		String query = "select * from event_details where detail_id=?";
	    EventDetails ed = null;
	    try {
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, detail_id);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            ed = new EventDetails();
	            ed.setDetail_id(rs.getInt(1));
				ed.setEvent_id(rs.getInt(2));
				ed.setDetail_type(rs.getString(3));
				ed.setDetail_description(rs.getString(4));
				ed.setPrice(rs.getDouble(5));
				ed.setRoom_capacity(rs.getInt(6));
				ed.setImage_url(rs.getString(7));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return ed;
	}

	@Override
	public ArrayList<EventDetails> getEventDetails() {
		String query="select * from event_details";
		ArrayList<EventDetails> eventdetailsList=new ArrayList<EventDetails>();
		EventDetails ed=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ed=new EventDetails();
				ed.setDetail_id(rs.getInt(1));
				ed.setEvent_id(rs.getInt(2));
				ed.setDetail_type(rs.getString(3));
				ed.setDetail_description(rs.getString(4));
				ed.setPrice(rs.getDouble(5));
				ed.setRoom_capacity(rs.getInt(6));
				ed.setImage_url(rs.getString(7));
				eventdetailsList.add(ed);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return eventdetailsList;
	}

	@Override
	public ArrayList<EventDetails> getEvents(int event_id) {
		String query="select * from event_details where event_id=?";
		ArrayList<EventDetails> eventdetailsList=new ArrayList<EventDetails>();
		EventDetails ed=null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, event_id);
	        ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ed=new EventDetails();
				ed.setDetail_id(rs.getInt(1));
				ed.setEvent_id(rs.getInt(2));
				ed.setDetail_type(rs.getString(3));
				ed.setDetail_description(rs.getString(4));
				ed.setPrice(rs.getDouble(5));
				ed.setRoom_capacity(rs.getInt(6));
				ed.setImage_url(rs.getString(7));
				eventdetailsList.add(ed);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return eventdetailsList;
	}

}
