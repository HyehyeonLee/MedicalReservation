package com.medical.service;

import java.util.List;
import java.util.Map;

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
		String encryptPw = Sha256.encrypt(dto.getPw());
		dto.setPw(encryptPw);
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

	@Override
	public int emailCheckAction(MemberDto dto) {
		int result = dao.emailCheck(dto);
		return result;
	}
	@Override
	public int setPw(Map<String, String> paramMap) {
		return dao.updatePw(paramMap);
	}
	@Override
	public void editPasswordAction(MemberDto dto) {
		dao.editPassword(dto);
	}

	@Override
	public void editMypageAction(MemberDto dto) {
		dao.editMypage(dto);
	}

	@Override
	public void deleteMemberAction(MemberDto dto) {
		dao.deleteMember(dto);
	}

	@Override
	public MemberDto userInfoAction(String id) {
		return dao.userInfo(id);
	}
	

}
