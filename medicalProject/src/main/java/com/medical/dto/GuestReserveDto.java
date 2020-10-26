package com.medical.dto;

public class GuestReserveDto {
	private String guest_id;
	private String guestDate;
	private String guestTime;

	public GuestReserveDto(String guest_id, String guestDate, String guestTime) {
		super();
		this.guest_id = guest_id;
		this.guestDate = guestDate;
		this.guestTime = guestTime;
	}

	public GuestReserveDto() {
		super();
	}

	public String getGuest_id() {
		return guest_id;
	}

	public void setGuest_id(String guest_id) {
		this.guest_id = guest_id;
	}

	public String getGuestDate() {
		return guestDate;
	}

	public void setGuestDate(String guestDate) {
		this.guestDate = guestDate;
	}

	public String getGuestTime() {
		return guestTime;
	}

	public void setGuestTime(String guestTime) {
		this.guestTime = guestTime;
	}

}
