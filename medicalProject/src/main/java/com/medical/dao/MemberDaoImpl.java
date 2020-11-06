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
	@Override
	public int updatePw(Map<String,String> paramMap) {
		return sqlSession.update("com.medical.mapper.memberMapper.pwSearch",paramMap);
	}
	@Override
	public void editPassword(MemberDto dto) {
		sqlSession.update("com.medical.mapper.memberMapper.editPass", dto);
	}
	@Override
	public void editMypage(MemberDto dto) {
		sqlSession.update("com.medical.mapper.memberMapper.editMypage",dto);
	}

	@Override
	public void deleteMember(MemberDto dto) {
		sqlSession.delete("com.medical.mapper.memberMapper.memberDelete",dto);
	}

	@Override
	public MemberDto userInfo(String id) {
		return sqlSession.selectOne("com.medical.mapper.memberMapper.userInfo", id);
	}

	@Override
	public String checkGrade(String id) {
		return sqlSession.selectOne("com.medical.mapper.memberMapper.checkGrade", id);
	}

	@Override
	public void insertNaver(MemberDto dto) {
		sqlSession.insert("com.medical.mapper.memberMapper.insertNaver",dto);
	}

	@Override
	public int socialIdCheck(MemberDto dto) {
		int result = sqlSession.selectOne("com.medical.mapper.memberMapper.socialIdCheck",dto);
		return result;
		
	}
}
