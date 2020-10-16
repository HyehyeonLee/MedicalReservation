package com.dy.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.dy.dto.MemberDto;

public class MemberDaoImpl implements MemberDao {
	@Autowired
	SqlSession sqlSession;

	@Override
	public void insertMember(MemberDto dto) {
		sqlSession.insert("com.dy.mapper.memberMapper.insertMember",dto);
	}

	@Override
	public boolean loginMember(MemberDto dto) {
		int lo = sqlSession.selectOne("com.dy.mapper.memberMapper.loginMember", dto);
		return (lo==1)?true:false;
	}

	@Override
	public int idCheck(MemberDto dto) {
		int result = sqlSession.selectOne("com.dy.mapper.memberMapper.idCheck", dto);
		return result;
	}
	

}