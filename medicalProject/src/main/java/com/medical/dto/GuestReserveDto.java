package com.medical.dto;

public class GuestReserveDto {
	private int guest_reserve_id;
	private String guest_id;
	private int reserve_id;

	public GuestReserveDto(int guest_reserve_id, String guest_id, int reserve_id) {
		super();
		this.guest_reserve_id = guest_reserve_id;
		this.guest_id = guest_id;
		this.reserve_id = reserve_id;
	}

	public GuestReserveDto() {
		super();
	}

	public int getGuest_reserve_id() {
		return guest_reserve_id;
	}

	public void setGuest_reserve_id(int guest_reserve_id) {
		this.guest_reserve_id = guest_reserve_id;
	}

	public String getGuest_id() {
		return guest_id;
	}

	public void setGuest_id(String guest_id) {
		this.guest_id = guest_id;
	}

	public int getReserve_id() {
		return reserve_id;
	}

	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}

}
