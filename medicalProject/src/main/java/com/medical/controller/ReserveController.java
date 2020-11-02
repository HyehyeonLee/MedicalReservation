package com.medical.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.medical.dto.GuestReserveDto;
import com.medical.dto.GuestReserveDto1;
import com.medical.dto.HospitalReserveDto;
import com.medical.service.ReserveService;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	@Autowired
	ReserveService reService;

	@RequestMapping(value = "/reserveList")
	public String reserveList(String yadmNm, Model model) {
		ArrayList<String> list = (ArrayList<String>) reService.getHospitalDate(yadmNm);
		String hospital_id = reService.getHospitalId(yadmNm);
		model.addAttribute("hospital_id", hospital_id);
		model.addAttribute("dateList", list);
		model.addAttribute("yadmNm", yadmNm);
		return "guest_reserve";
	}
	
	@RequestMapping(value = "/guestReserve")
	public String guestReserve(String guest_id, int hospital_reserve_id, String hospital_id, String date, String yadmNm, Model model) {
		GuestReserveDto dto = new GuestReserveDto();
		dto.setGuest_id(guest_id);
		dto.setReserve_id(hospital_reserve_id);
		reService.insertGuestInfo(dto);
		model.addAttribute("hospital_reserve_id", hospital_reserve_id);
		model.addAttribute("hospital_id", hospital_id);
		model.addAttribute("yadmNm", yadmNm);
		model.addAttribute("guest_id", guest_id);
		return "guest_reserve_commit";
	}
	
	@RequestMapping(value = "/admin")
	public String admin(String id, Model model) {
		List<GuestReserveDto1> list = reService.getGuestReserveAction(id);
		model.addAttribute("dto", reService.getGuestReserveAction(id));
		model.addAttribute("id", id);
		return "admin";
	}
	
	@RequestMapping(value = "/InsertReserveInfo")
	public String InsertReserveInfo() {
		return "hospital_reserve";
	}
	
	@RequestMapping(value = "/ReserveInfo")
	public String reserve(HospitalReserveDto dto, Model model) {
		reService.insertReserveInfo(dto);
		model.addAttribute("dto", dto);
		return "hospital_reserve_commit";
	}

}
