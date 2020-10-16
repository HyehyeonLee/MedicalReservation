package com.dy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dy.dao.MemberDao;
import com.dy.dto.MemberDto;

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

}
