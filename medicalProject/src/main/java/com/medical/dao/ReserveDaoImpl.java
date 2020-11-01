package com.medical.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.medical.dto.GuestInfoDto;
import com.medical.dto.GuestReserveDto;
import com.medical.dto.GuestReserveDto1;
import com.medical.dto.HospitalReserveDto;

public class ReserveDaoImpl implements ReserveDao {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int searchHospital(String yadmNm) {
		int result = sqlSession.selectOne("com.medical.mapper.reserveMapper.reserveChk", yadmNm);
		return result;
	}
	
	@Override
	public void insertReserve(HospitalReserveDto dto) {
		sqlSession.insert("com.medical.mapper.reserveMapper.insertReserveInfo", dto);
	}

	@Override
	public List<HospitalReserveDto> getReserveList() {
		List<HospitalReserveDto> list = null;
		list = sqlSession.selectList("com.medical.mapper.reserveMapper.getReserveInfo");
		return list;
	}

	@Override
	public List<HospitalReserveDto> getHospitalReserve(String yadmNm) {
		List<HospitalReserveDto> list = null;
		list = sqlSession.selectList("com.medical.mapper.reserveMapper.getHospitalReserveInfo", yadmNm);
		return list;
	}
	
	@Override
	public List<String> getDateList(String yadmNm) {
		List<String> list = null;
		list = sqlSession.selectList("com.medical.mapper.reserveMapper.getReserveDate", yadmNm);
		return list;
	}

	@Override
	public List<HospitalReserveDto> getTimeList(String yadmNm, String selectedDate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", yadmNm);
		map.put("date", selectedDate);
		List<HospitalReserveDto> list = null;
		list = sqlSession.selectList("com.medical.mapper.reserveMapper.getReserveTime", map);
		return list;
	}

	@Override
	public void insertGuest(GuestReserveDto dto) {
		sqlSession.insert("com.medical.mapper.reserveMapper.insertGuestReserve", dto);
	}

	@Override
	public String getHospitalId(String yadmNm) {
		return sqlSession.selectOne("com.medical.mapper.reserveMapper.getHospitalId", yadmNm);
	}
	
	@Override
	public GuestInfoDto getGuestInfo(String hospital_reserve_id, String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("hospital_reserve_id", hospital_reserve_id);
		map.put("id", id);
		return sqlSession.selectOne("com.medical.mapper.reserveMapper.reservedInfo", map);	
	}

	@Override
	public List<GuestReserveDto1> getGuestReserveAll(String id) {
		return sqlSession.selectList("com.medical.mapper.reserveMapper.getGuestReserveAll", id);
	}

}
