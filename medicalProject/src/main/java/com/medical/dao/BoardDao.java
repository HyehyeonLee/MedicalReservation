package com.medical.dao;

import java.util.List;
import java.util.Map;

import com.medical.dto.BoardDto;
import com.medical.dto.SearchCriteria;

public interface BoardDao {
	//게시글 작성 
	public void insert(BoardDto dto) throws Exception;

	//게시글 목록 조회 (뷰딴으로 보여주기)
	public List<BoardDto> list(SearchCriteria scri) throws Exception;
	
	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 게시글 조회
	public BoardDto read(int bno) throws Exception; 
	
	// 게시글 수정
	public void update(BoardDto dto) throws Exception;
	
	// 게시글 삭제
	public void delete(int bno) throws Exception;

	// 첨부파일 업로드 
	public void insertFile(Map<String, Object> map) throws Exception;

	// 첨부파일 조회
	public List<Map<String , Object>> selectFileList(int bno) throws Exception;
	
	// 첨부파일 다운
	public Map<String , Object> selectFileInfo(Map<String , Object> map) throws Exception; 

	// 첨부파일 수정
	public void updateFile(Map<String , Object> map) throws Exception;
	  
}
