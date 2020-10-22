package com.medical.xml;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.medical.dto.GrahpDto;



public class GrahpXml2 {
	static String getTagValue(String tag, Element eElement) {
		   if(eElement.getElementsByTagName(tag).item(0)==null) System.out.println("getTagValue()에서 null!");
		   System.out.println("tag:" + tag + "/length:" + eElement.getElementsByTagName(tag).getLength());
	  		 NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	   
	   Node nValue = (Node) nList.item(0);
	   if(nValue == null) {
	      return null;
	   }
	   
	   return nValue.getNodeValue();
	}
	
	public ArrayList<GrahpDto> arrList(String dateStart, String dateEnd){
		String serviceKey = "bmphZ9SJ%2F02KJq3CizDX9j%2Fvdad27EHo6n1nchgd2TWisSlfyk7%2BgG5lqTMDQcwV5nggjvjM4CMgW2SwouoPgQ%3D%3D";
		int pageNo = 1;
		int numOfRows = 20;
		String startCreateDt = dateStart;
		String endCreateDt = dateEnd;
		String url = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?serviceKey="+serviceKey+"&pageNo="+pageNo
			      + "&numOfRows="+numOfRows+"&startCreateDt="+startCreateDt+"&endCreateDt="+endCreateDt;

		System.out.println("url:"+url);
		
		ArrayList<GrahpDto> list2 = new ArrayList<GrahpDto>();
		
		try {
			  while(true) {            
		      DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		      DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		      Document doc = dBuilder.parse(url);
		      
		      doc.getDocumentElement().normalize();
		      System.out.println("Root element : " + doc.getDocumentElement().getNodeName());
		    	 
		      NodeList nList = doc.getElementsByTagName("item");
		      System.out.println("파싱할 리스트 수 : " + nList.getLength());
		      
		      System.out.println("전체 결과 수 : " + doc.getElementsByTagName("totalCount"));
		      for(int i = 0; i < nList.getLength(); i++) {
		         Node nNode = nList.item(i);
		         if(nNode.getNodeType() == Node.ELEMENT_NODE) {
		            Element eElement = (Element) nNode;
		    		System.out.println("######################");
					System.out.println("기준일  : " + getTagValue("stateDt", eElement));
					System.out.println("확진자 수  : " + getTagValue("decideCnt", eElement));
					System.out.println("격리해제 수  : " + getTagValue("clearCnt", eElement));
					System.out.println("사망자 수  : " + getTagValue("deathCnt", eElement));
					//System.out.println(eElement.getTextContent());
		//			System.out.println("결과코드  : " + getTagValue("resultCode", eElement));
		//			System.out.println("결과메세지  : " + getTagValue("resultMsg", eElement));
		//			System.out.println("기준시간  : " + getTagValue("stateTime", eElement));
		//			System.out.println("검사진행 수  : " + getTagValue("examCnt", eElement));
		//			System.out.println("치료중 환자 수  : " + getTagValue("careCnt", eElement));
		//			System.out.println("누적 검사 수  : " + getTagValue("accExamCnt", eElement));
		//			System.out.println("누적 검사 완료 수  : " + getTagValue("accExamCompCnt", eElement));
		//			System.out.println("등록일시분초  : " + getTagValue("createDt", eElement));
		//			System.out.println("수정일시분초  : " + getTagValue("updateDt", eElement));
					String stateDt = getTagValue("stateDt",eElement);	  			
					String decideCnt = getTagValue("decideCnt",eElement);	  			
					String clearCnt = getTagValue("clearCnt",eElement);	  			
					String deathCnt = getTagValue("deathCnt",eElement);	  			
					GrahpDto vo2 = new GrahpDto(stateDt,decideCnt,clearCnt,deathCnt);
		         	list2.add(vo2);
		         }
		      }
		      
		      pageNo++;
		      if(pageNo>2){
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
		
		return list2;
	}
}

