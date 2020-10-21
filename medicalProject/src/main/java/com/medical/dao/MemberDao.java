package com.medical.dao;

import java.util.List;
import java.util.Map;

import com.medical.dto.MemberDto;

public interface MemberDao {
	void insertMember(MemberDto dto);	//회원가
	boolean loginMember(MemberDto dto);	//로그인
	int idCheck(MemberDto dto);		//아이디 중복체크
	int emailCheck(MemberDto dto);
	String idSearch(String name, String email);	//아이디 찾기
	public String getPw(Map<String, Object> paramMap);	//패스워드 찾기
}
