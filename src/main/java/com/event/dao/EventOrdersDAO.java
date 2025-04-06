package com.event.dao;

import java.util.ArrayList;

import com.event.dto.EventOrders;

public interface EventOrdersDAO {
	public boolean insertEventOrders(EventOrders eo);
	public boolean updateEventOrders(EventOrders eo);
	public ArrayList<EventOrders> getEventOrders();
    public ArrayList<EventOrders> getEventOrders(int user_id);
    
}
