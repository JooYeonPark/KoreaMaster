package kr.or.koreaMaster.travel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import kr.or.koreaMaster.Jsoup.GeocoderLatLong;
import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.dao.SigunguDao;
import kr.or.koreaMaster.place.dao.SigunguDaoImpl;
import kr.or.koreaMaster.place.dao.SpotDao;
import kr.or.koreaMaster.place.dao.SpotDaoImpl;
import kr.or.koreaMaster.place.domain.Sigungu;
import kr.or.koreaMaster.place.domain.Spot;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAO;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAOImpl;
import kr.or.koreaMaster.spotTheme.domain.SpotThemeJoin;
import kr.or.koreaMaster.theme.session.MyTravelTypeRepository;
import kr.or.koreaMaster.travel.dao.TripDAO;
import kr.or.koreaMaster.travel.dao.TripDAOImpl;
import kr.or.koreaMaster.travel.domain.RouteInfo;
import kr.or.koreaMaster.travel.util.RouteProcess;
import kr.or.koreaMaster.travel.util.SpotsProcess;

public class RouteServiceImpl implements RouteService {
	private DaoFactory factory;
	Logger logger = Logger.getLogger(RouteServiceImpl.class);

	/** 생성자 */
	public RouteServiceImpl() {
		factory = new MyBatisDaoFactory();
	}

	@Override
	/** 루트 구해주는 메소드 */
	public Map<String, Object> getRoute(Map<String, String> map) {
		logger.info("getRoute실행");

		SpotsProcess spotsClass = new SpotsProcess();
		RouteProcess routeClass = new RouteProcess();
		SpotThemeDAO spotThemeDAO = (SpotThemeDAO) factory.getDao(SpotThemeDAOImpl.class);
		SpotDao spotDAO = (SpotDao) factory.getDao(SpotDaoImpl.class);
		SigunguDao sigunguDAO = (SigunguDao) factory.getDao(SigunguDaoImpl.class);

		// #1. spotThemeJoin 불러와 저장
		int cityNo = Integer.parseInt(map.get("city"));
		List<SpotThemeJoin> spotThemeJoinList = spotThemeDAO.getSpotThemeJoin(cityNo);

		// #2. 사용자의 테마 불러와 저장
		List<Integer> perThemes = new ArrayList<Integer>();

		// 루트 요구에서 테마를 선택시 그 테마로 진행
		String theme = map.get("theme");
		if (theme == null || theme.equalsIgnoreCase(null) || theme.trim() == "") {
			MyTravelTypeRepository rep = new MyTravelTypeRepository();
			perThemes = rep.getNoById(map.get("usersId"));

			// // !!!!현희가 완성하면 넣기!!!!!
			// // 더미데이터 {6,11,12,7}
			// perThemes.add(6);
			// perThemes.add(11);
			// perThemes.add(12);
			// perThemes.add(7);
		} else {
			String[] themes = theme.split(",");
			perThemes.add(Integer.parseInt(themes[0]));
		}

		// #4. 사용자가 선택한 도시에서 사용자의 테마에 맞는 장소들을 추려낸다
		spotThemeJoinList = spotsClass.getSpots(spotThemeJoinList, perThemes);

		// #5. 장소간의 거리, 여행일자를 고려하여 루트를 찾아낸다
		int date = Integer.parseInt(map.get("days"));

		// #6. 출발장소 split 후 db에 입력 또는 데이터 불러오기 후 list에 저장
		String[] spots = map.get("departures").split(",");
		Spot spot = new Spot();
		List<Spot> departures = new ArrayList<Spot>();
		for (String departure : spots) {
			// logger.debug("departure:"+departure);

			// 사용자가 입력한 숙소의 정보수집
			GeocoderLatLong geocode = new GeocoderLatLong();
			Float[] coords = geocode.geoCoding(departure);

			spot = new Spot();
			spot.setAddressDetail(departure);
			spot.setCityNo(cityNo);
			spot.setDetail("/*/*/"); // 보통 장소와 출발장소를 구별하기 위한 델리게이터
			spot.setLatitude(coords[0]);
			spot.setLongitude(coords[1]);
			spot.setName("출발지");

			spotDAO.create(spot);

			if (spot != null) {
				departures.add(spot);
			}
		}

		// logger.debug("departures:"+departures);

		/** routeDetail 화면에 띄어줄 필요한 정보들을 담는 map */
		Map<String, Object> route = new HashMap<String, Object>();

		// #7. 루트 찾기
		/** 루트의 장소번호만으로 이루어진 list */
		List<Integer> routeNo = routeClass.findRoute(date, departures, spotThemeJoinList);
		// logger.debug(routeNo);
		String strRouteNo = new String();
		for (Integer integer : routeNo) {
			strRouteNo += integer + ",";
		}
		route.put("routeNo", strRouteNo);

		// #8. 장소번호로 장소들을 담는 새로운 list 생성
		List<Spot> routeSpotsByDay = new ArrayList<Spot>();
		for (Integer spotNo : routeNo) {
			Spot tmpSpot = spotDAO.read(spotNo);
			routeSpotsByDay.add(tmpSpot);
		}
		route.put("routeSpots", routeSpotsByDay);

		// #9. 도시번호에 해당하는 이름 put
		Sigungu city = sigunguDAO.read(cityNo);
		route.put("cityNo", cityNo);

		String cityName = null;
		if (city.getGuName() != null) {
			cityName = city.getGuName();
		} else if (city.getSigunName() != null) {
			cityName = city.getSigunName();
		}

		route.put("cityName", cityName);

		route.put("days", date);

		return route;
	}

}
