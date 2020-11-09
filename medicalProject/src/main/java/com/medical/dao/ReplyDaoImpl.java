package com.medical.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.medical.dto.ReplyDto;

public class ReplyDaoImpl implements ReplyDao{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ReplyDto> readReply(int bno) throws Exception {
		return sqlSession.selectList("com.medical.mapper.replyMapper.readReply" , bno);
	}

	@Override
	public void writeReply(ReplyDto dto) throws Exception {
		sqlSession.insert("com.medical.mapper.replyMapper.writeReply" , dto);
	}

	@Override
	public void updateReply(ReplyDto dto) throws Exception {
		sqlSession.update("com.medical.mapper.replyMapper.updateReply" , dto);
	}

	@Override
	public void deleteReply(ReplyDto dto) throws Exception {
		sqlSession.delete("com.medical.mapper.replyMapper.deleteReply" , dto);
		
	}

	@Override
	public ReplyDto selectReply(int rno) throws Exception {
		return sqlSession.selectOne("com.medical.mapper.replyMapper.selectReply" , rno);
	}

}
