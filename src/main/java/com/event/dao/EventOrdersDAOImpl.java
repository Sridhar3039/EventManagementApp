package com.event.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.event.connection.Connector;
import com.event.dto.EventOrders;

public class EventOrdersDAOImpl implements EventOrdersDAO{
	public Connection con;
	public EventOrdersDAOImpl() {
		this.con=Connector.requestConnection();
	}

	@Override
	public boolean insertEventOrders(EventOrders eo) {
		String query="INSERT INTO event_orders (user_id, event_id, detail_id, total_price, start_booking_date, end_booking_date) VALUES (?, ?, ?, ?, ?, ?)";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, eo.getUser_id());
			ps.setInt(2, eo.getEvent_id());
			ps.setInt(3, eo.getDetail_id());
			ps.setDouble(4, eo.getPrice());
			ps.setString(5, eo.getStart_booking_date());
			ps.setString(6, eo.getEnd_booking_date());
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
	public ArrayList<EventOrders> getEventOrders() {
		String query = "select * from event_orders";
	    ArrayList<EventOrders> orderList = new ArrayList<>();
	    EventOrders eo = null;
	    try {
	        PreparedStatement ps = con.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            eo = new EventOrders();
	            eo.setOrder_id(rs.getInt(1));
	            eo.setUser_id(rs.getInt(2));
	            eo.setEvent_id(rs.getInt(3));
	            eo.setDetail_id(rs.getInt(4));
	            eo.setPrice(rs.getDouble(5));
	            eo.setStart_booking_date(rs.getString(6));
	            eo.setEnd_booking_date(rs.getString(7));
	            eo.setStatus(rs.getString(8));
	            orderList.add(eo);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return orderList;
	}

	@Override
	public ArrayList<EventOrders> getEventOrders(int user_id) {
		String query="SELECT e.event_name, ed.detail_type, eo.order_id, eo.start_booking_date, eo.end_booking_date, ed.price, eo.status " +
                "FROM event_orders eo " +
                "JOIN events e ON eo.event_id = e.event_id " +
                "JOIN event_details ed ON eo.detail_id = ed.detail_id " +
                "WHERE eo.user_id = ?";
		ArrayList<EventOrders> orderList=new ArrayList<EventOrders>();
		EventOrders eo=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, user_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				eo=new EventOrders();
				eo.setEvent_name(rs.getString(1));
				eo.setDetail_type(rs.getString(2));
				eo.setOrder_id(rs.getInt(3));
				eo.setStart_booking_date(rs.getString(4));
				eo.setEnd_booking_date(rs.getString(5));
				eo.setPrice(rs.getDouble(6));
				eo.setStatus(rs.getString(7));
				orderList.add(eo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderList;
	}

	@Override
	public boolean updateEventOrders(EventOrders eo) {
		String query="update event_orders set status=? where order_id=?";
		int i=0;
		PreparedStatement ps=null;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, eo.getStatus());
	        ps.setInt(2, eo.getOrder_id());
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
}
