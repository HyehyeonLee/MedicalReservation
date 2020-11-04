package com.medical.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.medical.dto.SupplyDto;
import com.medical.service.SupplyService;

@Controller
@RequestMapping("/supply")
public class SupplyController {
	@Autowired
	SupplyService suService;
	
	@RequestMapping(value = "/list")
	public String supply(Model model) {
		List<SupplyDto> list = suService.supplyAll();
		model.addAttribute("supply", list);
		return "supply_request";
	}
}
