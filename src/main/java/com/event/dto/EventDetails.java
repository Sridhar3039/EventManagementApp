package com.event.dto;

public class EventDetails {
	private int detail_id;
	private int event_id;
	private String detail_type;
	private String detail_description;
	private double price;
	private int room_capacity;
	private String image_url;
	
	
	@Override
	public String toString() {
		return "EventDetails [detail_id=" + detail_id + ", event_id=" + event_id + ", detail_type=" + detail_type
				+ ", price=" + price + ", room_capacity=" + room_capacity + ", image_url=" + image_url + "]";
	}
	public int getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(int detail_id) {
		this.detail_id = detail_id;
	}
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public String getDetail_type() {
		return detail_type;
	}
	public void setDetail_type(String detail_type) {
		this.detail_type = detail_type;
	}
	public String getDetail_description() {
		return detail_description;
	}
	public void setDetail_description(String detail_description) {
		this.detail_description = detail_description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getRoom_capacity() {
		return room_capacity;
	}
	public void setRoom_capacity(int room_capacity) {
		this.room_capacity = room_capacity;
	}
	public  String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

}
