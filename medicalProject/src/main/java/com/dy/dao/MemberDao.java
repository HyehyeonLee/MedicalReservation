package com.dy.dao;

import com.dy.dto.MemberDto;

public interface MemberDao {
	void insertMember(MemberDto dto);	//회원가
	boolean loginMember(MemberDto dto);	//로그인
	int idCheck(MemberDto dto);		//아이디 중복체크
}
