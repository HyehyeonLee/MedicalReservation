package com.medical.dto;


public class HospitalDto {
	private String addr;
	private String telno;
	private String yadmNm;
	private int reserve;
	
	public int getReserve() {
		return reserve;
	}

	public void setReserve(int reserve) {
		this.reserve = reserve;
	}

	public HospitalDto(String addr, String telno, String yadmNm) {
		super();
		this.addr = addr;
		this.telno = telno;
		this.yadmNm = yadmNm;
	}

	public HospitalDto() {
		super();
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getYadmNm() {
		return yadmNm;
	}

	public void setYadmNm(String yadmNm) {
		this.yadmNm = yadmNm;
	}	
	
}
