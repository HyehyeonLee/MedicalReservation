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
	
	public ArrayList<HospitalDto> arrList(String spclAdmTyCd){
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
						System.out.println("============");
						System.out.println("구 : " + getTagValue("sgguNm", eElement));
						System.out.println("시 : " + getTagValue("sidoNm", eElement));
						System.out.println("전화번호 : " + getTagValue("telno", eElement));
						System.out.println("기관이름 : " + getTagValue("yadmNm", eElement));
						
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
}

