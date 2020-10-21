package com.medical.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.medical.dto.MemberDto;

public class MemberDaoImpl implements MemberDao {
	@Autowired
	SqlSession sqlSession;

	@Override
	public void insertMember(MemberDto dto) {
		sqlSession.insert("com.medical.mapper.memberMapper.insertMember",dto);
	}

	@Override
	public boolean loginMember(MemberDto dto) {
		int lo = sqlSession.selectOne("com.medical.mapper.memberMapper.loginMember", dto);
		return (lo==1)?true:false;
	}

	@Override
	public int idCheck(MemberDto dto) {
		int result = sqlSession.selectOne("com.medical.mapper.memberMapper.idCheck", dto);
		return result;
	}
	@Override
	public String idSearch(String name, String email){
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("name",name);
		map.put("email",email);
		return sqlSession.selectOne("com.medical.mapper.memberMapper.idSearch",map);
	}

	@Override
	public int emailCheck(MemberDto dto) {
		int result = sqlSession.selectOne("com.medical.mapper.memberMapper.emailCheck", dto);
		return result;
	}

}
