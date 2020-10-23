package com.medical.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medical.dao.ReserveDao;

@Service
public class ReserveServiceImpl implements ReserveService{
	@Autowired
	ReserveDao reDao;

	public ReserveServiceImpl(ReserveDao dao) {
		this.reDao = dao;
	}

	public ReserveServiceImpl() {
		super();
	}

	@Override
	public int search(String yadmNm) {
		return reDao.searchHospital(yadmNm);
	}

}
