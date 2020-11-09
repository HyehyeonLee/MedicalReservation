package com.medical.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.medical.dao.BoardDao;
import com.medical.dto.BoardDto;
import com.medical.dto.SearchCriteria;
import com.medical.utill.FileUtills;
@Service
public class BoardServiceImpl implements BoardService{
	
	@Resource
	private FileUtills fileUtills;
	
	@Autowired
	BoardDao dao;
	
	@Override	// 게시글 작성
	public void insert(BoardDto dto , MultipartHttpServletRequest mpRequest) throws Exception {
		dao.insert(dto);
		
		List<Map<String , Object>> list = fileUtills.parseInsertFileInfo(dto, mpRequest);
		int size = list.size();
		for(int i =0; i<size; i++) {
			dao.insertFile(list.get(i));
		}
	
	}

	@Override	// 게시글 목록 조회
	public List<BoardDto> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	@Override	// 게시판 글 조회
	public BoardDto read(int bno) throws Exception {
		return dao.read(bno);
	}

	@Override	// 게시글 수정
	public void update(BoardDto dto ,String[] files , String fileNames ,MultipartHttpServletRequest mpRequest) throws Exception {
		dao.update(dto);
		
		List<Map<String , Object>> list = fileUtills.parseUpdateFileInfo(dto, files, fileNames, mpRequest);
				Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			}else {
				dao.updateFile(tempMap);
			}
		}
	}

	@Override	// 게시글 삭제
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return dao.selectFileList(bno);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return dao.selectFileInfo(map);
	}

	
	
	

}
