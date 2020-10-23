package com.medical.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.medical.dto.HospitalDto;
import com.medical.service.ReserveService;
import com.medical.xml.GetHospitalXml;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired
	ReserveService reserveSer;
	GetHospitalXml getHospitalXml;
	
	@RequestMapping(value = "/filter")
	public String filter(Model model, String spclAdmTyCd, String keyword) {
		getHospitalXml = new GetHospitalXml();
		ArrayList<HospitalDto> list = new ArrayList<HospitalDto>();
		// type이 "all" 이면 xml 요청을 3번 날림
		if("all".equals(spclAdmTyCd)) {
			list = getHospitalXml.getAllList();
		}else {
			list = getHospitalXml.getTypeList(spclAdmTyCd);
		}
		
		//가져온 기관 정보 리스트에서 검색어가 있는 리스트만 필터링
		ArrayList<HospitalDto> filterList = new ArrayList<HospitalDto>();
		keyword = getHospitalXml.keywordMatch(keyword);
		System.out.println(keyword);
		for(int i = 0; i < list.size(); i++) {
			if((list.get(i).getAddr()).contains(keyword)) {
				filterList.add(list.get(i));
			}
		}
		
		for(int i = 0; i<filterList.size(); i++) {
			int reserveChk = reserveSer.search(filterList.get(i).getYadmNm());
			if(reserveChk == 1) {
				filterList.get(i).setReserve(1);
			}else {
				filterList.get(i).setReserve(0);
			}
		}
		model.addAttribute("list", filterList);
		model.addAttribute("keyword", keyword);
		model.addAttribute("search_option", spclAdmTyCd);
		
		return "search_list";
	}

}

