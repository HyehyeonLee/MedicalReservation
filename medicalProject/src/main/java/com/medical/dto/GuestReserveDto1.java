package com.medical.dto;

public class GuestReserveDto1 {
	private String id;
	private String name;
	private String date;
	private String time;
	private String guest_reserve_id;
	
	public GuestReserveDto1() {}

	public GuestReserveDto1(String id, String name, String date, String time,String guest_reserve_id) {
		this.id = id;
		this.name = name;
		this.date = date;
		this.time = time;
		this.guest_reserve_id = guest_reserve_id;
	}

	public String getGuest_reserve_id() {
		return guest_reserve_id;
	}

	public void setGuest_reserve_id(String guest_reserve_id) {
		this.guest_reserve_id = guest_reserve_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "GuestReserveDto1 [id=" + id + ", name=" + name + ", date=" + date + ", time=" + time + "]";
	}
	
	
	
}
