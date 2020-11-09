package com.medical.dao;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.medical.dto.BoardDto;
import com.medical.dto.SearchCriteria;

public class BoardDaoImpl implements BoardDao{

	@Autowired
	SqlSession sqlSession;	
	
	
	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
	
	
	@Override // 게시글 작성 
	public void insert(BoardDto dto) throws Exception {
		dto.setReg_date(sdf.format(d));
		//reg_Date 를 Date type으로 선언하지 않고 String 타입으로 선언 후 Override 과정에서 reg_Date에  값 주입 
		sqlSession.insert("com.medical.mapper.boardMapper.insert" , dto);
	}

	@Override	// 게시글 목록 조회
	public List<BoardDto> list(SearchCriteria scri) throws Exception {
		return  sqlSession.selectList("com.medical.mapper.boardMapper.listPage" , scri);
	}
	
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("com.medical.mapper.boardMapper.listCount" , scri);
	}


	@Override // 게시핀 글 조회
	public BoardDto read(int bno) throws Exception {
		return sqlSession.selectOne("com.medical.mapper.boardMapper.read" ,bno);
	}

	@Override // 게시글 수정 
	public void update(BoardDto dto) throws Exception {
		sqlSession.update("com.medical.mapper.boardMapper.update" , dto );
	}

	@Override // 게시글 삭제
	public void delete(int bno) throws Exception {
		sqlSession.delete("com.medical.mapper.boardMapper.delete",bno);
	}

	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("com.medical.mapper.boardMapper.insertFile" , map);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return sqlSession.selectList("com.medical.mapper.boardMapper.selectFileList" , bno);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("com.medical.mapper.boardMapper.selectFileInfo" , map);
	}

	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		sqlSession.update("com.medical.mapper.boardMapper.updateFile" , map);
	}


}
