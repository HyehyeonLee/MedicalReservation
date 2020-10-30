package com.medical.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.medical.dto.GuestInfoDto;
import com.medical.dto.HospitalReserveDto;
import com.medical.service.ReserveService;


@RestController
@RequestMapping(value = "/rest", produces = "application/json; charset = utf-8")
public class RestMedicalController {
	@Autowired
	ReserveService reService;
	
	@RequestMapping(value = "/dateSelect")
	@ResponseBody
	public List<HospitalReserveDto> dateSelect(@RequestBody Map<String, String> param) {
		
		List<HospitalReserveDto> list = reService.getHospitalTime(param.get("name"), param.get("date"));
		for(HospitalReserveDto dto : list) {
			System.out.println(dto.toString());
		}
		return list;
	}
	
	@RequestMapping(value = "/guestInfo")
	@ResponseBody
	public GuestInfoDto guestInfo(@RequestBody Map<String, String> param) {
		GuestInfoDto dto = reService.getReserveInfo(param.get("hospital_reserve_id"));
		System.out.println(dto.toString());
		//String info = dto.toString(); //여기까지 됨
		return dto;
	}
}
