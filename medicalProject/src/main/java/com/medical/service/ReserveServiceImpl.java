package com.medical.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medical.dao.ReserveDao;
import com.medical.dto.GuestReserveDto;
import com.medical.dto.GuestReserveDto1;
import com.medical.dto.HospitalReserveDto;

@Service
public class ReserveServiceImpl implements ReserveService{
	@Autowired
	ReserveDao reDao;

	public ReserveServiceImpl(ReserveDao dao) {
		this.reDao = dao;
	}

	public ReserveServiceImpl() {
		super();
	}

	@Override
	public int search(String yadmNm) {
		return reDao.searchHospital(yadmNm);
	}
	
	@Override
	public void insertReserveInfo(HospitalReserveDto dto) {
		reDao.insertReserve(dto);
	}

	@Override
	public List<HospitalReserveDto> getAllReserveList() {
		return reDao.getReserveList();
	}

	@Override
	public List<HospitalReserveDto> getHospitalReserveInfo(String yadmNm) {
		return reDao.getHospitalReserve(yadmNm);
	}
	
	@Override
	public List<String> getHospitalDate(String yadmNm) {
		return reDao.getDateList(yadmNm);
	}

	@Override
	public List<HospitalReserveDto> getHospitalTime(String yadmNm, String selectedDate) {
		return reDao.getTimeList(yadmNm, selectedDate);
	}

	@Override
	public void insertGuestInfo(GuestReserveDto dto) {
		reDao.insertGuest(dto);
	}

	@Override
	public String getHospitalId(String yadmNm) {
		return reDao.getHospitalId(yadmNm);
	}

	@Override
	public List<GuestReserveDto1> getGuestReserveAction() {
		return reDao.getGuestReserveAll();
	}

	

}
