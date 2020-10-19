package com.medical.service;

import com.medical.dto.MemberDto;

public interface MemberService {
	public void insertMemberAction(MemberDto dto);
	public boolean loginMemberAction(MemberDto dto);
	public int idCheckAction(MemberDto dto);
}
