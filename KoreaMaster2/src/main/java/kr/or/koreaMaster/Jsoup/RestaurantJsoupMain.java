package kr.or.koreaMaster.Jsoup;

import java.io.IOException;

import org.apache.log4j.Logger;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.dao.RestaurantDao;
import kr.or.koreaMaster.place.dao.RestaurantDaoImpl;
import kr.or.koreaMaster.place.domain.Restaurant;

/**
 * 식당 데이터 파싱 Main
 * @author 김수진
 */
public class RestaurantJsoupMain {
	DaoFactory factory = new MyBatisDaoFactory();

	public static void main(String[] args) throws IOException {
		Logger logger = Logger.getLogger(RestaurantJsoupMain.class);
		DaoFactory factory2 = new MyBatisDaoFactory();

		String url = "";

		int pageNum = 20;

		Connection.Response response = null;
		Document document = null;

		RestaurantDao restaurantDao = (RestaurantDao) factory2.getDao(RestaurantDaoImpl.class);
		
		String restaurantPath = "http://korean.visitkorea.or.kr/kor/bz15/food/";

		for (int i = 1; i <= pageNum; i++) {
			RestaurantDataParsing rdp = new RestaurantDataParsing();
			// 접속할 URL
			url = "http://korean.visitkorea.or.kr/kor/bz15/food/food_list.jsp?areaCode=&category=F0101&gotoPage=" + i
					+ "&listType=rdesc&cid=&out_service=";

			/*
			 * 해당 url에 접속하여  Response반환
			 * Jsoup.connect(url) : 해당 url에 접속
			 * execute() : response반환
			 */
			response = Jsoup.connect(url).method(Connection.Method.GET).execute();
			//parse() : response로부터 document 반환
			document = response.parse();
			
			// select() : 얻어온 document에서 특정요소를 elements or element로 반환
			Elements liList = document.select("div[class='whereWrap'] ul li a");

			for (int j = 0; j < liList.size(); j++) { // 16개 반환

				Element aTag = liList.get(j).getElementsByTag("a").first();
				String aUrl = aTag.attr("href");

				String pathUrl = restaurantPath + aUrl;

				Restaurant restaurant = rdp.restaurantDate(pathUrl);
				
				if(restaurant != null) {
					Restaurant tmp = restaurantDao.readByCityNoName(restaurant.getName(), restaurant.getCityNo());
					
					if(tmp == null) {
						if(restaurant.getLatitude() != 0) {
							restaurantDao.create(restaurant);
//							logger.info(restaurant.getNo());
						}
					}else {
						restaurantDao.update(restaurant);
					}
				}
				
			}
		}

	}
}
