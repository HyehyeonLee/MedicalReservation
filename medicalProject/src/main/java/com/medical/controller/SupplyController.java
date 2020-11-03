package com.medical.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/supply")
public class SupplyController {
	
	@RequestMapping(value = "/list")
	public String supply() {
		return "request_supply";
	}
}
