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
import kr.or.koreaMaster.place.dao.SpotDao;
import kr.or.koreaMaster.place.dao.SpotDaoImpl;
import kr.or.koreaMaster.place.domain.Restaurant;
import kr.or.koreaMaster.place.domain.Spot;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAO;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAOImpl;
import kr.or.koreaMaster.spotTheme.domain.SpotTheme;
import kr.or.koreaMaster.theme.session.MyTravelTypeRepository;

public class JsoupDataParsing {

	public static void main(String[] args) throws IOException {
		DaoFactory factory2 = new MyBatisDaoFactory();

		String url = "";

		int pageNum = 20;
		String[] theme = { "A01", "A03", "B01", "DDD", "A02", "E01" };

		Connection.Response response = null;
		Document document = null;

		// 관광지 테마별 20페이지 돌리기
		SpotDataParsing sdp = new SpotDataParsing();
		String spotPaht = "http://korean.visitkorea.or.kr/kor/bz15/where/";
		SpotDao spotDao = (SpotDao) factory2.getDao(SpotDaoImpl.class);
		MyTravelTypeRepository themeDao = new MyTravelTypeRepository();
		SpotThemeDAO spotThemeDAO = (SpotThemeDAO) factory2.getDao(SpotThemeDAOImpl.class);

		for (int i = 0; i < theme.length; i++) {
			String themeName = theme[i];
			for (int j = 1; j <= pageNum; j++) {
				url = "http://korean.visitkorea.or.kr/kor/bz15/where/where_tour.jsp?areaCode=&category=" + themeName
						+ "&gotoPage=" + j + "&listType=rdesc&cid=&out_service=";

				response = Jsoup.connect(url).method(Connection.Method.GET).execute();
				document = response.parse();

				Elements liList = document.select("div[class='whereWrap'] ul li a");

				for (int k = 0; k < liList.size(); k++) {
					Element aTag = liList.get(k).getElementsByTag("a").first();
					String aUrl = aTag.attr("href");

					String pathUrl = spotPaht + aUrl;

					Spot spot = sdp.spotDate(pathUrl);
					if (spot != null) {
						Spot stmp = spotDao.readByNameCity(spot.getName(), spot.getCityNo());
						if (stmp == null) {
							System.out.println("!!!!!  THEME   insert!!!!");
							int detailSize = spot.getDetail().length();
							System.out.println("size = " + detailSize);

							if (detailSize <= 1300) {
								spotDao.create(spot);

								switch (themeName) {
								case "A01":
									themeName = "자연";
									break;

								case "A03":
									themeName = "체험";
									break;

								case "B01":
									themeName = "문화시설";
									break;

								case "DDD":
									themeName = "레포츠";
									break;

								case "A02":
									themeName = "역사";
									break;

								case "E01":
									themeName = "쇼핑";
									break;

								default:
									break;
								}

								int themeNo = themeDao.findThemeId(themeName);
								int spotNo = spot.getNo();
								SpotTheme spotTheme = new SpotTheme(themeNo, spotNo);
								spotThemeDAO.create(spotTheme);

							}
						} else {
							if (!stmp.toString().equals(spot.toString())) {
								spotDao.update(spot);
							}
						}

					}

				}

			}
		}

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
				restaurantDao.create(restaurant);
			}
		}

	}

}
