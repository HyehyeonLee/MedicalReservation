package com.medical.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.medical.dto.HospitalDto;
import com.medical.xml.GetHospitalXml;

@Controller
@RequestMapping("/search")
public class SearchController {
	GetHospitalXml getHospitalXml;
	
	@RequestMapping(value = "/filter")
	public String filter(Model model, String spclAdmTyCd, String keyword) {
		getHospitalXml = new GetHospitalXml();
		ArrayList<HospitalDto> list = getHospitalXml.arrList(spclAdmTyCd);
		ArrayList<HospitalDto> filterList = new ArrayList<HospitalDto>();
		System.out.println(spclAdmTyCd);
//		ArrayList<HospitalDto> list = parseXml.arrList();
//		ArrayList<HospitalDto> filterList = new ArrayList<HospitalDto>();
		
		for(int i = 0; i < list.size(); i++) {
//			if(keyword.equals(list.get(i).getSidoNm())) {
//				filterList.add(list.get(i));
//			}
			if((list.get(i).getAddr()).contains(keyword)) {
				filterList.add(list.get(i));
			}
		}
		model.addAttribute("list", filterList);
		model.addAttribute("keyword", keyword);
		
		return "search_list";
	}

}
