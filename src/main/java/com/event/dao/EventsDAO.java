package com.event.dao;

import java.util.ArrayList;

import com.event.dto.Events;

public interface EventsDAO {
	public boolean insertEvents(Events e1);
	public boolean updateEvents(Events e1);
    public boolean deleteEvents(Events e1);
    public ArrayList<Events> getEvents(String event_name);
	public ArrayList<Events> getEvents();
    
    
}
