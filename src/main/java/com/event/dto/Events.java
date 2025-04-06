package com.event.dto;

public class Events {
	private int event_id;
	private String event_name;
	private String event_img;
	
	@Override
	public String toString() {
		return "Events [event_id=" + event_id + ", event_name=" + event_name + ", event_img=" + event_img + "]";
	}
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getEvent_img() {
		return event_img;
	}
	public void setEvent_img(String event_img) {
		this.event_img = event_img;
	}
	
}
