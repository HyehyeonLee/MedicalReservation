package com.medical.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

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

}
