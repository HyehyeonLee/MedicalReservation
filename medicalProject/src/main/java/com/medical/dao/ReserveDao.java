package com.medical.dao;

import java.util.List;

import com.medical.dto.GuestReserveDto;
import com.medical.dto.HospitalReserveDto;

public interface ReserveDao {
	public int searchHospital(String yadmNm);
	public void insertReserve(HospitalReserveDto dto);
	public List<HospitalReserveDto> getReserveList();
	public List<HospitalReserveDto> getHospitalReserve(String yadmNm);
	public List<String> getDateList(String yadmNm);
	public List<HospitalReserveDto> getTimeList(String yadmNm, String selectedDate);
	public void insertGuest(GuestReserveDto dto);
	public String getHospitalId(String yadmNm);
}
