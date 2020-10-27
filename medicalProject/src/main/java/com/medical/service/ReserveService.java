package com.medical.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.medical.dto.HospitalReserveDto;

@Service
public interface ReserveService {
	public int search(String yadmNm);
	public void insertReserveInfo(HospitalReserveDto dto);
	public List<HospitalReserveDto> getAllReserveList();
	public List<HospitalReserveDto> getHospitalReserveInfo(String yadmNm);
	public List<String> getHospitalDate(String yadmNm);
	public List<HospitalReserveDto> getHospitalTime(String yadmNm, String selectedDate);
}
