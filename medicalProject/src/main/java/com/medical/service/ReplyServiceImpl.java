package com.medical.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.medical.dao.ReplyDao;
import com.medical.dto.ReplyDto;
@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDao dao;
	
	@Override
	public List<ReplyDto> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	@Override
	public void writeReply(ReplyDto dto) throws Exception {
		dao.writeReply(dto);
	}

	@Override
	public void updateReply(ReplyDto dto) throws Exception {
		dao.updateReply(dto);
	}

	@Override
	public void deleteReply(ReplyDto dto) throws Exception {
		dao.deleteReply(dto);
	}

	@Override
	public ReplyDto selectReply(int rno) throws Exception {
		return dao.selectReply(rno);
	}

}
