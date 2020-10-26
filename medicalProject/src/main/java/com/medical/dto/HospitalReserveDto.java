package com.medical.dto;

public class HospitalReserveDto {
	private int hospital_reserve_id;
	private String hospital_id;
	private String date;
	private String time;

	public HospitalReserveDto(int hospital_reserve_id, String hospital_id, String date, String time) {
		super();
		this.hospital_reserve_id = hospital_reserve_id;
		this.hospital_id = hospital_id;
		this.date = date;
		this.time = time;
	}

	public HospitalReserveDto() {
		super();
	}

	public int getHospital_reserve_id() {
		return hospital_reserve_id;
	}

	public void setHospital_reserve_id(int hospital_reserve_id) {
		this.hospital_reserve_id = hospital_reserve_id;
	}

	public String getHospital_id() {
		return hospital_id;
	}

	public void setHospital_id(String hospital_id) {
		this.hospital_id = hospital_id;
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
		return "HospitalReserveDto [hospital_reserve_id=" + hospital_reserve_id + ", hospital_id=" + hospital_id
				+ ", date=" + date + ", time=" + time + "]";
	}

}
