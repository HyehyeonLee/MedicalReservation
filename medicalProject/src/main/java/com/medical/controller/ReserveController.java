package com.medical.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
