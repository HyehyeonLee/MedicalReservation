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

//시작 날짜와 끝날짜의 확진자 그래프 불러오는 페이지
public class GrahpXml {
	static String getTagValue(String tag, Element eElement) {
		   if(eElement.getElementsByTagName(tag).item(0)==null);
		   //System.out.println("getTagValue()에서 null!");
		   //System.out.println("tag:" + tag + "/length:" + eElement.getElementsByTagName(tag).getLength());
	  		 NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	   
	   Node nValue = (Node) nList.item(0);
	   if(nValue == null) {
	      return null;
	   }
	   
	   return nValue.getNodeValue();
	}
	
	public ArrayList<GrahpDto> arrList(String dateStart, String dateEnd){
		String serviceKey = "Ps5ZYencIjs9%2B9VuoKvLz9jNgu5N23yQFI8symcgauDrVQ3z8PEUf1DuxIxfjbwQs%2FpxEQ7qkPVmsDs1Q2bKxw%3D%3D";
		int pageNo = 1;
		int numOfRows = 20;
		String startCreateDt = dateStart;
		String endCreateDt = dateEnd;
		String url = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?serviceKey="+serviceKey+"&pageNo="+pageNo
		      + "&numOfRows="+numOfRows+"&startCreateDt="+startCreateDt+"&endCreateDt="+endCreateDt;
		ArrayList<GrahpDto> list = new ArrayList<GrahpDto>();
		
		try {
			  while(true) {            
		      DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		      DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		      Document doc = dBuilder.parse(url);
		      
		      doc.getDocumentElement().normalize();
		    	 
		      NodeList nList = doc.getElementsByTagName("item");
		      
		      //System.out.println("for문 시작!");		      
		      for(int i = 0; i < nList.getLength(); i++) {
		         Node nNode = nList.item(i);
		         if(nNode.getNodeType() == Node.ELEMENT_NODE) {
		            Element eElement = (Element) nNode;
					String stateDt = getTagValue("stateDt",eElement);	  			
					String decideCnt = getTagValue("decideCnt",eElement);	  			
					String clearCnt = getTagValue("clearCnt",eElement);	  			
					String deathCnt = getTagValue("deathCnt",eElement);	  			
					GrahpDto vo = new GrahpDto(stateDt,decideCnt,clearCnt,deathCnt);
		         	list.add(vo);
		         	
//System.out.println(vo.getStateDt() + " / " + vo.getDecideCnt());
		    		

		         }
		      }
		      
		      pageNo++;
		      if(pageNo>=2){
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
		Collections.reverse(list);
		return list;
	}
}

