package kr.or.koreaMaster.Jsoup;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.dao.SidoDao;
import kr.or.koreaMaster.place.dao.SidoDaoImpl;
import kr.or.koreaMaster.place.dao.SigunguDao;
import kr.or.koreaMaster.place.dao.SigunguDaoImpl;
import kr.or.koreaMaster.place.domain.Restaurant;
import kr.or.koreaMaster.place.domain.Sido;
import kr.or.koreaMaster.place.domain.Sigungu;
import kr.or.koreaMaster.place.domain.Spot;
import oracle.net.jdbc.TNSAddress.Address;

public class SpotDataParsing {
	
	DaoFactory factory = new MyBatisDaoFactory();
	
	SidoDao sidoDao = (SidoDao)factory.getDao(SidoDaoImpl.class);
	SigunguDao sigunguDao = (SigunguDao)factory.getDao(SigunguDaoImpl.class);
	AddressParsing addressParsing = new AddressParsing();
	
	CommonParsing commonParsing = new CommonParsing();
	
	public Spot spotDate(String url) {
		Spot spot = new Spot();
		
		Connection.Response response = null;
		Document document = null;
		
		try {
			response = Jsoup.connect(url).method(Connection.Method.GET).execute();
			document = response.parse();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Map<String, Object> commonMap =  commonParsing.commonData(document);
		
		Elements group1List = document.select("div[id='group1'] ul li");// Spot detail, homepae
		Elements fareDiv = document.select("div[id='group4'] li"); // fare
		
		String title = (String)commonMap.get("title");
		String detail = "";
		String homepage = "";
		
		for (int i = 0; i < group1List.size(); i++) {
			Element ele = group1List.get(i);
			String eleEm = ele.getElementsByTag("em").text();
			
			switch (eleEm) {
			case "개 요":
				Element detailContent = ele.getElementsByTag("p").first();
				if(detailContent != null) {
					detail = detailContent.html();
				}
				break;
				
			case "개요":
				Element detailContent2 = ele.getElementsByTag("p").first();
				if(detailContent2 != null) {
					detail = detailContent2.html();
				}
				break;
				
			case "관련 홈페이지":
				Element homepageContent = ele.getElementsByTag("a").first();
				homepage = homepageContent.attr("href");
				break;

			default:
				break;
			}
		}
		
		String fare = "";
		for (Element element : fareDiv) {
			String fareTmp = element.getElementsByTag("em").first().text();
			
			if(fareTmp.equals("입 장 료") || fareTmp.equals("시설이용료") || fareTmp.equals("이용요금")) {
				fare = element.html();
				break;
			}
		}
		
		String addressDetail = (String) commonMap.get("addressDetail");
		String phone = (String) commonMap.get("phone");
		String operatingHour = (String) commonMap.get("operatingHour");
		String closedDate = (String) commonMap.get("closedDate");
		
		// 주소 - 시군구, 위도 경도
		Map<String, Object> mapAddr = addressParsing.addressData(addressDetail);
		int cityNo = (int)mapAddr.get("cityNo");
		double latitude = (double)mapAddr.get("latitude");
		double longitude = (double)mapAddr.get("longitude");
		
		
		String saveImageName = (String)commonMap.get("saveImageName");
		String useNum = (String)commonMap.get("useNum");
		
		spot.setName(title);
		spot.setCityNo(cityNo);
		spot.setDetail(detail);
		spot.setAddressDetail(addressDetail);
		spot.setPhone(phone);
		spot.setFare(fare);
		spot.setHomepage(homepage);
		spot.setOperatingHour(operatingHour);
		spot.setClosedDate(closedDate);
		spot.setPicture(saveImageName);
		spot.setUseNum(Integer.parseInt(useNum));
		spot.setLatitude(latitude);
		spot.setLongitude(longitude);
		
		return spot;
	}

}
