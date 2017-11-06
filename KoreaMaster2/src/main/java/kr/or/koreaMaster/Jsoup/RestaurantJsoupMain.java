package kr.or.koreaMaster.Jsoup;

import java.io.IOException;

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

public class RestaurantJsoupMain {
	DaoFactory factory = new MyBatisDaoFactory();

	public static void main(String[] args) throws IOException {
		DaoFactory factory2 = new MyBatisDaoFactory();

		String url = "";

		int pageNum = 20;

		Connection.Response response = null;
		Document document = null;

		// 식당 20페이지 돌리기
		RestaurantDao restaurantDao = (RestaurantDao) factory2.getDao(RestaurantDaoImpl.class);
		String restaurantPath = "http://korean.visitkorea.or.kr/kor/bz15/food/";

		for (int i = 1; i <= pageNum; i++) {
			RestaurantDataParsing rdp = new RestaurantDataParsing();
			url = "http://korean.visitkorea.or.kr/kor/bz15/food/food_list.jsp?areaCode=&category=F0101&gotoPage=" + i
					+ "&listType=rdesc&cid=&out_service=";

			response = Jsoup.connect(url).method(Connection.Method.GET).execute();
			document = response.parse();

			Elements liList = document.select("div[class='whereWrap'] ul li a");

			for (int j = 0; j < liList.size(); j++) { // 16

				Element aTag = liList.get(j).getElementsByTag("a").first();
				String aUrl = aTag.attr("href");

				String pathUrl = restaurantPath + aUrl;

				Restaurant restaurant = rdp.restaurantDate(pathUrl);
				
				if(restaurant != null) {
					restaurantDao.create(restaurant);
				}
				
			}
		}

	}
}
