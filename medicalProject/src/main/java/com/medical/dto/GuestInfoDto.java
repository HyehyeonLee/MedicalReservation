package com.medical.dto;

public class GuestInfoDto {
	private String name;
	private String date;
	private String time;

	public GuestInfoDto(String name, String date, String time) {
		super();
		this.name = name;
		this.date = date;
		this.time = time;
	}

	public GuestInfoDto() {
		super();
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
		return name + " - " + date + " - " + time;
	}

}
