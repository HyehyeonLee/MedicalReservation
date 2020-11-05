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
		//환자가 선택한 병원과 날짜에 해당하는 시간을 불러옴
		List<HospitalReserveDto> list = reService.getHospitalTime(param.get("name"), param.get("date"));
		return list;
	}

	@RequestMapping(value = "/guestInfo")
	@ResponseBody
	public GuestInfoDto guestInfo(@RequestBody Map<String, String> param) {
		//예약 번호와 로그인된 병원 id에 해당하는 예약 정보를 불러옴 (admin.jsp 참고)
		GuestInfoDto dto = reService.getReserveInfo(param.get("hospital_reserve_id"), param.get("id"));
		return dto;
	}

	@RequestMapping(value = "/checkGrade")
	@ResponseBody
	public String checkGrade(@RequestBody Map<String, String> param) {
		//grade가 hospital인지 체크 (myPage.jsp 참고)
		String grade = memService.checkMember(param.get("id"));
		System.out.println("restController : " + grade); // 여기까지 됨
		return grade;
	}

	@RequestMapping(value = "/deleteAc")
	public String del(@RequestBody Map<String, String> param) {
		//환자 측 예약 취소
		String guest_reserve_id = param.get("guest_reserve_id");
		reService.deleteReserve(guest_reserve_id);
		return "success";
	}
}
