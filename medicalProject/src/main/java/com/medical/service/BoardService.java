package com.medical.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.medical.dto.BoardDto;
import com.medical.dto.SearchCriteria;

public interface BoardService {
	// 게시글 작성 
	public void insert(BoardDto dto, MultipartHttpServletRequest mpRequest) throws Exception;
	//게시글 목록 조회 (뷰딴으로 보여주기)
	public List<BoardDto> list(SearchCriteria scri) throws Exception;
	// 게시글 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	// 게시판 글 조회
	public BoardDto read(int bno) throws Exception;
	// 게시글수정
	public void update(BoardDto dto , String[] files , 
										String fileNames ,
										MultipartHttpServletRequest mpRequest
														) throws Exception;
	// 게시글 삭제
	public void delete(int bno) throws Exception;

	public List<Map<String , Object>> selectFileList(int bno) throws Exception;

	public Map<String , Object> selectFileInfo(Map<String , Object> map) throws Exception; 

}
