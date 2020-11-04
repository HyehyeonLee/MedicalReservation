package com.medical.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medical.dao.SupplyDao;
import com.medical.dto.SupplyDto;

@Service
public class SupplyServiceImpl implements SupplyService {
	@Autowired
	SupplyDao sDao;
	
	public SupplyServiceImpl() {
		super();
	}

	public SupplyServiceImpl(SupplyDao dao) {
		this.sDao = dao;
	}

	@Override
	public List<SupplyDto> supplyAll() {
		return sDao.supplyAll();
	}

}
