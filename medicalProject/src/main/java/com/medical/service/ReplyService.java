package com.medical.service;

import java.util.List;

import com.medical.dto.ReplyDto;

public interface ReplyService {

	public void writeReply(ReplyDto dto) throws Exception; 

	public List<ReplyDto> readReply (int bno) throws Exception; 

	public void updateReply(ReplyDto dto) throws Exception;

	public void deleteReply(ReplyDto dto) throws Exception;	

	public ReplyDto selectReply(int rno) throws Exception;

}
