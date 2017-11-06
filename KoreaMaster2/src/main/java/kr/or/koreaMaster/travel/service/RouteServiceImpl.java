package kr.or.koreaMaster.travel.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import kr.or.koreaMaster.MybatisRestaurantDaoTest;
import kr.or.koreaMaster.common.db.DaoFactory;
import kr.or.koreaMaster.common.db.MyBatisDaoFactory;
import kr.or.koreaMaster.place.domain.Spot;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAO;
import kr.or.koreaMaster.spotTheme.dao.SpotThemeDAOImpl;
import kr.or.koreaMaster.spotTheme.domain.SpotThemeJoin;
import kr.or.koreaMaster.travel.util.RouteProcess;
import kr.or.koreaMaster.travel.util.SpotsProcess;

public class RouteServiceImpl implements RouteService {
	private DaoFactory factory;
	Logger logger = Logger.getLogger(MybatisRestaurantDaoTest.class);
	/** 생성자 */
	public RouteServiceImpl() {
		factory = new MyBatisDaoFactory();
	}
	
	
	@Override
	/** 루트 구해주는 메소드 */
	public void getRoute(Map<String,String> map) {
		SpotsProcess spotsClass = new SpotsProcess();
		RouteProcess routeClass = new RouteProcess();
		SpotThemeDAO spotThemeDAO = (SpotThemeDAO)factory.getDao(SpotThemeDAOImpl.class);
		
		//#1. spotThemeJoin 불러와 저장
		int cityNo = Integer.parseInt(map.get("city"));
		List<SpotThemeJoin> spotThemeJoinList = spotThemeDAO.getSpotThemeJoin(cityNo);
		
		//#2. 사용자의 테마 불러와 저장
		//!!!!현희가 완성하면 넣기!!!!!
		// 더미데이터	{6,11,12,7}
		List<Integer> perThemes = new ArrayList<Integer>();
		perThemes.add(6);
		perThemes.add(11);
		perThemes.add(12);
		perThemes.add(7);
		
		//#4. 사용자가 선택한 도시에서 사용자의 테마에 맞는 장소들을 추려낸다
		spotThemeJoinList = spotsClass.getSpots(spotThemeJoinList, perThemes);

	
		
		//#5. 장소간의 거리, 여행일자를 고려하여 루트를 찾아낸다
//		int date = (Integer.parseInt(map.get("endDate"))-Integer.parseInt(map.get("startDate"))) + 1;
		//테스트용
		int date = 1;
		
		//#6. 출발장소 split 후 db에 입력 또는 데이터 불러오기
		List<Spot> departures = new ArrayList<Spot>();
		//테스트용
		Spot spot = new Spot();
		spot.setNo(41);
		spot.setLatitude(34.758139);
		spot.setLongitude(127.716982);
		departures.add(spot);
		
		//#7. 
		/** 장소번호를 저장하여 루트를 저장할 변수 (dayNo, spotNo) */
		List<Integer> routeSpots = routeClass.findRoute(date, departures, spotThemeJoinList);
		
		logger.debug(routeSpots);
		
	}

}
