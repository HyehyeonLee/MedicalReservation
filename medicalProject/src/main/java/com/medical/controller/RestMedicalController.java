package com.medical.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.medical.dto.GuestInfoDto;
import com.medical.dto.HospitalReserveDto;
import com.medical.service.MemberService;
import com.medical.service.ReserveService;

@RestController
@RequestMapping(value = "/rest", produces = "application/json; charset = utf-8")
public class RestMedicalController {
	@Autowired
	ReserveService reService;
	@Autowired
	MemberService memService;

	@RequestMapping(value = "/dateSelect")
	@ResponseBody
	public List<HospitalReserveDto> dateSelect(@RequestBody Map<String, String> param) {
		List<HospitalReserveDto> list = reService.getHospitalTime(param.get("name"), param.get("date"));
		return list;
	}

	@RequestMapping(value = "/guestInfo")
	@ResponseBody
	public GuestInfoDto guestInfo(@RequestBody Map<String, String> param) {
		GuestInfoDto dto = reService.getReserveInfo(param.get("hospital_reserve_id"), param.get("id"));
		// String info = dto.toString(); //여기까지 됨
		return dto;
	}

	@RequestMapping(value = "/checkGrade")
	@ResponseBody
	public String checkGrade(@RequestBody Map<String, String> param) {
		String grade = memService.checkMember(param.get("id"));
		System.out.println("restController : " + grade); // 여기까지 됨
		return grade;
	}

	@RequestMapping(value = "/deleteAc")
	public String del(@RequestBody Map<String, String> param) {
		String guest_reserve_id = param.get("guest_reserve_id");
		System.out.println(guest_reserve_id);
		reService.deleteReserve(guest_reserve_id);
		return "success";
	}
}
