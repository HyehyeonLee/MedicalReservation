package com.medical.service;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.medical.dao.MemberDao;
import com.medical.dto.MemberDto;
import com.medical.email.Email;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;
	@Inject
    JavaMailSender mailSender;	// root-context.xml에 설정한 bean, 의존성을 주입
	
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
		System.out.println("service " + dto.toString());
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

	@Override
	public String checkMember(String id) {
		return dao.checkGrade(id);
	}
	@Override
	public void sendMail(Email dto) {
		MimeMessage msg = mailSender.createMimeMessage();	// 이메일 객체
		try {
			msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiver()));
			// 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
			
			/*
             * createMimeMessage() : MimeMessage객체를 생성시킴 (이것을 이용해서 메시지를 구성한 뒤 메일 발송)
             * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :
             * 수신자 이메일 주소
             */
			
			try {
				msg.addFrom(new InternetAddress[] { new InternetAddress(dto.getSender(), dto.getSenderName()) });
				// 보내는 사람(이메일주소+이름)
	            // (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
	            // 이메일 발신자
				
				msg.setSubject(dto.getSubject(), "utf-8");
				// 이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
				
				msg.setText(dto.getContent(), "utf-8");
	            // 이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
				
	            mailSender.send(msg);
	            // 이메일 보내기
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertNaverAction(MemberDto dto) {
		dao.insertNaver(dto);
	}

	@Override
	public int socialIdCheckAction(MemberDto dto) {
		int result = dao.socialIdCheck(dto);
		return result;
	}

}
