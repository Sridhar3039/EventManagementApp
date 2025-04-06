package com.event.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.event.connection.Connector;
import com.event.dto.Events;

public class EventsDAOImpl implements EventsDAO{
	public Connection con;
	public EventsDAOImpl() {
		this.con=Connector.requestConnection();
	}
	
	@Override
	public boolean insertEvents(Events e1) {
		String query = "INSERT INTO events(event_name, event_img) VALUES(?, ?)";
	    int i = 0;
	    try {
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, e1.getEvent_name());
	        ps.setString(2, e1.getEvent_img());
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
	public boolean updateEvents(Events e1) {
		String query="update events set event_name=?, event_img=? where event_id=?";
		int i=0;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, e1.getEvent_name());
			ps.setString(2, e1.getEvent_img());
			ps.setInt(3, e1.getEvent_id());
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
	public boolean deleteEvents(Events e1) {
		String query="delete from events where event_id=?";
		int i=0;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, e1.getEvent_id());
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
	public ArrayList<Events> getEvents() {
		String query="select * from events";
		ArrayList<Events> eventList=new ArrayList<Events>();
		Events e1=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				e1=new Events();
				e1.setEvent_id(rs.getInt(1));
				e1.setEvent_name(rs.getString(2));
				e1.setEvent_img(rs.getString(3));	
				eventList.add(e1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return eventList;
	}

	@Override
	public ArrayList<Events> getEvents(String event_name) {
		String query = "select * from events where event_name=?";
	    ArrayList<Events> eventList = new ArrayList<Events>();
	    Events e1 = null;
	    try {
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, event_name);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            e1 = new Events();
	            e1.setEvent_id(rs.getInt(1));
	            e1.setEvent_name(rs.getString(2));
	            e1.setEvent_img(rs.getString(3));
	            eventList.add(e1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return eventList;
	}
}
