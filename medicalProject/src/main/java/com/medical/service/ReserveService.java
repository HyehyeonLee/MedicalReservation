package com.medical.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.medical.dto.GuestReserveDto;
import com.medical.dto.GuestReserveDto1;
import com.medical.dto.HospitalReserveDto;

@Service
public interface ReserveService {
	public int search(String yadmNm);
	public void insertReserveInfo(HospitalReserveDto dto);
	public List<HospitalReserveDto> getAllReserveList();
	public List<HospitalReserveDto> getHospitalReserveInfo(String yadmNm);
	public List<String> getHospitalDate(String yadmNm);
	public List<HospitalReserveDto> getHospitalTime(String yadmNm, String selectedDate);
	public void insertGuestInfo(GuestReserveDto dto);
	public String getHospitalId(String yadmNm);
	public List<GuestReserveDto1> getGuestReserveAction();
}
