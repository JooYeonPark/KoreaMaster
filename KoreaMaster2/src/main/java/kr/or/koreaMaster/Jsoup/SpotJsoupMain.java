package kr.or.koreaMaster.Jsoup;

import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.log4j.Logger;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import kr.or.koreaMaster.Jsoup.SpotDataParsing;
import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.dao.SpotDao;
import kr.or.koreaMaster.place.dao.SpotDaoImpl;
import kr.or.koreaMaster.place.domain.Spot;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAO;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAOImpl;
import kr.or.koreaMaster.spotTheme.domain.SpotTheme;
import kr.or.koreaMaster.theme.model.UsersTheme;
import kr.or.koreaMaster.theme.session.MyTravelTypeRepository;

public class SpotJsoupMain {

	private static String[] theme = { "A01", "A03", "B01", "DDD", "A02", "E01" };
	private static int pageNum = 20;

	public static void main(String[] args) throws IOException {
		DaoFactory factory2 = new MyBatisDaoFactory();
		String url = "";

		// 관광지 테마별 20페이지 돌리기
		SpotDataParsing sdp = new SpotDataParsing();
		String spotPaht = "http://korean.visitkorea.or.kr/kor/bz15/where/";
		SpotDao spotDao = (SpotDao) factory2.getDao(SpotDaoImpl.class);
		MyTravelTypeRepository themeDao = new MyTravelTypeRepository();
		SpotThemeDAO spotThemeDAO = (SpotThemeDAO) factory2.getDao(SpotThemeDAOImpl.class);

		for (int i = 0; i < theme.length; i++) {
			String themeName = theme[i];
			for (int j = 21; j <= pageNum; j++) {
				url = "http://korean.visitkorea.or.kr/kor/bz15/where/where_tour.jsp?areaCode=&category=" + themeName
						+ "&gotoPage=" + j + "&listType=rdesc&cid=&out_service=";

				Connection.Response response = Jsoup.connect(url).method(Connection.Method.GET).execute();
				Document document = response.parse();

				Elements liList = document.select("div[class='whereWrap'] ul li a");

				for (int k = 0; k < liList.size(); k++) {
					Element aTag = liList.get(k).getElementsByTag("a").first();
					String aUrl = aTag.attr("href");

					String pathUrl = spotPaht + aUrl;

					Spot spot = sdp.spotDate(pathUrl);

					if (spot != null) {
						Spot stmp = spotDao.readByNameCity(spot.getName(), spot.getCityNo());

						if (stmp == null) {
							int detailSize = spot.getDetail().length();

							if (detailSize <= 1300) {

								if (spot.getLatitude() != 0) {
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

	}
}
