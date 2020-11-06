package com.medical.dao;

import java.util.List;
import java.util.Map;

import com.medical.dto.MemberDto;

public interface MemberDao {
	void insertMember(MemberDto dto);	//회원가입
	boolean loginMember(MemberDto dto);	//로그인
	int idCheck(MemberDto dto);		//아이디 중복체크
	int emailCheck(MemberDto dto);	//이메일 체크
	String idSearch(String name, String email);	//아이디 찾기
	public int updatePw(Map<String,String> paramMap);	//임시 비밀번호 전송&암호화
	void editPassword(MemberDto dto);	//패스워드 수정
	void editMypage(MemberDto dto);		//회원정보 수정
	void deleteMember(MemberDto dto);	// 회원탈퇴
	MemberDto userInfo(String id);		//회원정보 불러오기
	public String checkGrade(String id);
	public void insertNaver(MemberDto dto);// 네이버 로그인 DB저장
}
