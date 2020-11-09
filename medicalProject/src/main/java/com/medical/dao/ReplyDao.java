package com.medical.dao;

import java.util.List;

import com.medical.dto.ReplyDto;

public interface ReplyDao {
	// 댓글 작성
	public void writeReply(ReplyDto dto) throws Exception; 
	
	// 댓글조회 
	public List<ReplyDto> readReply (int bno) throws Exception; 
	// 댓글 수정
	public void updateReply(ReplyDto dto) throws Exception;
	// 댓글 삭제
	public void deleteReply(ReplyDto dto) throws Exception;	
	// 선택된 댓글 조회
	public ReplyDto selectReply(int rno) throws Exception;

}
