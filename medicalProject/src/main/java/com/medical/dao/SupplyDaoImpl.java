package com.medical.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.medical.dto.MemberDto;
import com.medical.dto.SupplyDto;

public class SupplyDaoImpl implements SupplyDao {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<SupplyDto> supplyAll() {
		return sqlSession.selectList("com.medical.mapper.supplyMapper.supplyAll");
	}

	@Override
	public MemberDto address(String id) {
		return sqlSession.selectOne("com.medical.mapper.supplyMapper.addressCheck",id);
	}

	
}
