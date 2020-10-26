package com.medical.dao;

import java.util.List;

import com.medical.dto.HospitalReserveDto;

public interface ReserveDao {
	public int searchHospital(String yadmNm);
	public void insertReserve(HospitalReserveDto dto);
	public List<HospitalReserveDto> getReserveList();
	public List<HospitalReserveDto> getHospitalReserve(String yadmNm);
}
