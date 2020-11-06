package com.medical.service;

import java.util.Map;

import com.medical.dto.MemberDto;
import com.medical.email.Email;

public interface MemberService {
	public void insertMemberAction(MemberDto dto);
	public boolean loginMemberAction(MemberDto dto);
	public int idCheckAction(MemberDto dto);
	public String idSearchAction(String name,String email);
	public int emailCheckAction(MemberDto dto);
	public int setPw(Map<String,String> paramMap);
	public void editPasswordAction(MemberDto dto);
	public void editMypageAction(MemberDto dto);
	public void deleteMemberAction(MemberDto dto);
	public MemberDto userInfoAction(String id);
	public String checkMember(String id);
	public void sendMail(Email dto);
	public void insertNaverAction(MemberDto dto);
	public int socialIdCheckAction(MemberDto dto);
}
