package com.medical.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class ReserveDaoImpl implements ReserveDao {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int searchHospital(String yadmNm) {
		int result = sqlSession.selectOne("com.medical.mapper.reserveMapper.reserveChk", yadmNm);
		return result;
	}

}
