package com.medical.dao;

import java.util.List;

import com.medical.dto.MemberDto;
import com.medical.dto.SupplyDto;

public interface SupplyDao {
	public List<SupplyDto> supplyAll();
	public MemberDto address(String id);
}
