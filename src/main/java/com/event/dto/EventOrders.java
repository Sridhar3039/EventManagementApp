package com.event.dto;

public class EventOrders {
	private int order_id;
	private int user_id;
	private int event_id;
	private int detail_id;
	private String event_name;
	private String detail_type;
	private String start_booking_date;
	private String end_booking_date;
	private double price;
	private String booking_type;
	private String status;
	
	
	@Override
	public String toString() {
		return "EventOrders [order_id=" + order_id + ", user_id=" + user_id + ", event_id=" + event_id + ", detail_id="
				+ detail_id + ", event_name=" + event_name + ", detail_type=" + detail_type + ", start_booking_date="
				+ start_booking_date + ", end_booking_date=" + end_booking_date + ", price=" + price + ", booking_type="
				+ booking_type + ", status=" + status + "]";
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public int getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(int detail_id) {
		this.detail_id = detail_id;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getDetail_type() {
		return detail_type;
	}
	public void setDetail_type(String detail_type) {
		this.detail_type = detail_type;
	}
	public String getStart_booking_date() {
		return start_booking_date;
	}
	public void setStart_booking_date(String start_booking_date) {
		this.start_booking_date = start_booking_date;
	}
	public String getEnd_booking_date() {
		return end_booking_date;
	}
	public void setEnd_booking_date(String end_booking_date) {
		this.end_booking_date = end_booking_date;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getBooking_type() {
	    return booking_type;
	}
	public void setBooking_type(String booking_type) {
	    this.booking_type = booking_type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
