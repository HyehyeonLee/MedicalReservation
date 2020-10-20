package com.medical.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medical.dao.MemberDao;
import com.medical.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;
	
	@Override
	public void insertMemberAction(MemberDto dto) {
		dao.insertMember(dto);
	}

	@Override
	public boolean loginMemberAction(MemberDto dto) {
		boolean result = dao.loginMember(dto);
		return result;
	}

	@Override
	public int idCheckAction(MemberDto dto) {
		int result = dao.idCheck(dto);
		return result;
	}
	@Override
	public String idSearchAction(String name, String email) {
		String id = dao.idSearch(name, email);
		return id;
	}
}
