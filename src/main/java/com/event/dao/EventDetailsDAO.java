package com.event.dao;

import java.util.ArrayList;

import com.event.dto.EventDetails;

public interface EventDetailsDAO {
	public boolean insertEventDetails(EventDetails ed);
	public boolean updateEventDetails(EventDetails ed);
    public boolean deleteEventDetails(EventDetails ed);
    public EventDetails getEventDetails(int detail_id);
    public ArrayList<EventDetails> getEvents(int event_id);
	public ArrayList<EventDetails> getEventDetails();

}
