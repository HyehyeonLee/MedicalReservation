package com.medical.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.medical.dto.GuestReserveDto;
import com.medical.service.ReserveService;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	@Autowired
	ReserveService reService;

	@RequestMapping(value = "/reserveList")
	public String reserveList(String yadmNm, Model model) {
		ArrayList<String> list = (ArrayList<String>) reService.getHospitalDate(yadmNm);

		model.addAttribute("dateList", list);
		model.addAttribute("yadmNm", yadmNm);
		return "guest_reserve";
	}
	
	@RequestMapping(value = "/guestReserve")
	public String guestReserve(String guest_id, int hospital_reserve_id, String yadmNm, Model model) {
		GuestReserveDto dto = new GuestReserveDto();
		dto.setGuest_id(guest_id);
		dto.setReserve_id(hospital_reserve_id);
		reService.insertGuestInfo(dto);
		model.addAttribute("yadmNm", yadmNm);
		model.addAttribute("guest_id", guest_id);
		return "guest_reserve_commit";
	}

}
