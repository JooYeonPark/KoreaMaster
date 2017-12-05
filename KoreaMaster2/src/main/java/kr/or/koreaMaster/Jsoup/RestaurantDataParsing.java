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

/**
 * 식당 데이터 파싱
 * @author 김수진
 */
public class RestaurantDataParsing {
	
	DaoFactory factory = new MyBatisDaoFactory();
	
	SidoDao sidoDao = (SidoDao)factory.getDao(SidoDaoImpl.class);
	SigunguDao sigunguDao = (SigunguDao)factory.getDao(SigunguDaoImpl.class);
	
	//주소와 공동 데이터
	AddressParsing addressParsing = new AddressParsing();
	CommonParsing commonParsing = new CommonParsing();
	
	public Restaurant restaurantDate(String url) {
		Restaurant restaurant = new Restaurant();
		
		Connection.Response response = null;
		Document document = null;
		// 위도 경도 
		GeocoderLatLong geo = new GeocoderLatLong();
		
		try {
			response = Jsoup.connect(url).method(Connection.Method.GET).execute();
			document = response.parse();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Map<String, Object> commonMap =  commonParsing.commonData(document);
		
		Elements group1List = document.select("div[id='group1'] ul li");// Spot detail
		
		String title = (String)commonMap.get("title");
		String detail = "";
		for (int i = 0; i < group1List.size(); i++) {
			Element ele = group1List.get(i);
			String eleEm = ele.getElementsByTag("em").text();
			
			switch (eleEm) {
			case "개 요":
				Element detailContent = ele.getElementsByTag("p").first();
				if(detailContent != null) {
					// html() : Element의 내용을 html문법 그대로 반환
					detail = detailContent.html();
				}
				break;
				
			case "개요":
				Element detailContent2 = ele.getElementsByTag("p").first();
				if(detailContent2 != null) {
					detail = detailContent2.html();
				}
				break;
				
			default:
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
		
		restaurant.setName(title);
		restaurant.setCityNo(cityNo);
		restaurant.setDetail(detail);
		restaurant.setAdressDetail(addressDetail);
		restaurant.setPhone(phone);
		restaurant.setOperatingHour(operatingHour);
		restaurant.setClosedDate(closedDate);
		restaurant.setPicture(saveImageName);
		restaurant.setUseNum(Integer.parseInt(useNum));
		restaurant.setLatitude(latitude);
		restaurant.setLongitude(longitude);
		
		return restaurant;
	}

}
