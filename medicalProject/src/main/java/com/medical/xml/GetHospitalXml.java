package com.medical.xml;

import java.io.IOException;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.medical.dto.HospitalDto;

public class GetHospitalXml {
	
	static String getTagValue(String tag, Element eElement) {
		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		
		Node nValue = (Node) nList.item(0);
		if(nValue == null) {
			return null;
		}	
		return nValue.getNodeValue();
	}
	
	public ArrayList<HospitalDto> getTypeList(String spclAdmTyCd){
		String serviceKey = "Ps5ZYencIjs9%2B9VuoKvLz9jNgu5N23yQFI8symcgauDrVQ3z8PEUf1DuxIxfjbwQs%2FpxEQ7qkPVmsDs1Q2bKxw%3D%3D";
		int pageNo = 1;
		int numOfRows = 10000;
		String url = "http://apis.data.go.kr/B551182/pubReliefHospService/getpubReliefHospList?serviceKey="+serviceKey+"&pageNo="+pageNo
				+ "&numOfRows="+numOfRows+"&spclAdmTyCd="+spclAdmTyCd;
		ArrayList<HospitalDto> list = new ArrayList<HospitalDto>();
		
		try {
			int page = 1;
			while(true) {				
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				
				doc.getDocumentElement().normalize();
				System.out.println("Root element : " + doc.getDocumentElement().getNodeName());
				
				NodeList nList = doc.getElementsByTagName("item");
				System.out.println("파싱할 리스트 수 : " + nList.getLength());
				
				for(int i = 0; i < nList.getLength(); i++) {
					Node nNode = nList.item(i);
					if(nNode.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement = (Element) nNode;					
						String sgguNm = getTagValue("sgguNm", eElement);
						String sidoNm = getTagValue("sidoNm", eElement);
						String addr = sidoNm + " " + sgguNm;
						String telno = getTagValue("telno", eElement);
						String yadmNm =  getTagValue("yadmNm", eElement);
						HospitalDto dto = new HospitalDto(addr, telno, yadmNm);
						list.add(dto);
						
					}
				}
				
				page++;
				if(page > 1) {
					break;
				}
			}
			
			
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public ArrayList<HospitalDto> getAllList(){
		ArrayList<HospitalDto> allList = new ArrayList<HospitalDto>();
		allList.addAll(getTypeList("A0"));
		allList.addAll(getTypeList("97"));
		allList.addAll(getTypeList("99"));
		return allList;
	}
	
	public String keywordMatch(String keyword) {
		switch (keyword) {
		case "서울특별시":
		case "서울시":
			return "서울";
		case "인천광역시":
		case "인천시":
			return "인천";
		case "경기도":
			return "경기";
		case "연천":
		case "가평":
		case "양평":
			return keyword += "군";
		case "포천":
		case "동두천":
		case "양주":
		case "파주":
		case "김포":
		case "고양":
		case "의정부":
		case "남양주":
		case "하남":
		case "구리":
		case "광주":
		case "성남":
		case "수원":
		case "안양":
		case "광명":
		case "부천":
		case "시흥":
		case "안산":
			return keyword += "시";
		default:
			return keyword;
		}
	}
}

